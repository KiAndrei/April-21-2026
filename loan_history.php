<?php
require_once 'config.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Get user information
$user_id = $_SESSION['user_id'];
$user_sql = "SELECT username, email, full_name, created_at, profile_photo, deped_id FROM users WHERE id = ?";
$stmt = $conn->prepare($user_sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$user_result = $stmt->get_result();
$user_data = $user_result->fetch_assoc();
$stmt->close();
$profile_photo = $user_data['profile_photo'] ?? '';
$profile_photo_exists = $profile_photo && file_exists(__DIR__ . '/' . $profile_photo);

// Format registration date
$account_age = date_diff(date_create($user_data['created_at']), date_create())->format('%y years, %m months');

// Fetch loan history with payments summary
$loans = [];
$loan_stmt = $conn->prepare(
    "SELECT 
        l.id,
        l.loan_amount,
        l.loan_term,
        l.status,
        l.application_date,
        l.reviewed_at,
        l.released_at,
        l.total_amount,
        l.admin_comment,
        l.reviewed_by_name,
        l.reviewed_by_role,
        COALESCE(SUM(d.amount), 0) AS total_paid
     FROM loans l
     LEFT JOIN deductions d ON d.loan_id = l.id
     WHERE l.user_id = ?
     GROUP BY l.id
     ORDER BY l.application_date DESC"
);
$loan_stmt->bind_param("i", $user_id);
$loan_stmt->execute();
$loan_result = $loan_stmt->get_result();
while ($row = $loan_result->fetch_assoc()) {
    $loans[] = $row;
}
$loan_stmt->close();

$total_loans = 0;
$total_borrowed = 0.0;
$total_paid = 0.0;
$total_outstanding = 0.0;
$available_years = [];

foreach ($loans as $loan) {
    $loan_amount = (float) ($loan['loan_amount'] ?? 0);
    $paid = (float) ($loan['total_paid'] ?? 0);
    $status = strtolower((string) ($loan['status'] ?? ''));

    if (in_array($status, ['approved', 'completed', 'active'], true)) {
        $total_loans++;
    }

    if (!in_array($status, ['rejected', 'cancelled'], true)) {
        $total_borrowed += $loan_amount;
    }

    $total_paid += $paid;

    if (in_array($status, ['approved', 'completed', 'active'], true)) {
        $total_amount = (float) ($loan['total_amount'] ?? 0);
        if ($total_amount <= 0) {
            $total_amount = $loan_amount;
        }
        $total_outstanding += max(0, $total_amount - $paid);
    }

    if (!empty($loan['application_date'])) {
        $year = date('Y', strtotime($loan['application_date']));
        $available_years[$year] = true;
    }
}

if (!empty($available_years)) {
    krsort($available_years);
}

if (!function_exists('format_currency')) {
    function format_currency($amount) {
        return '₱' . number_format((float) $amount, 2);
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan History - DepEd Loan System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="assets/shared.css">
    <script src="assets/notifications.js" defer></script>
    <script src="assets/topbar.js" defer></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f5f5;
            min-height: 100vh;
        }
        
        .navbar {
            background: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            left: 192px; /* 80% of 250px */
            right: 0;
            z-index: 1000;
        }
        
        .welcome-message {
            font-size: 1.2rem;
            color: #333;
        }
        
        .welcome-message strong {
            color: #8b0000;
        }
        
        .nav-icons {
            display: flex;
            align-items: center;
            gap: 1.5rem;
            position: relative;
        }
        
        .icon-button {
            position: relative;
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: #666;
            transition: color 0.3s;
        }
        
        .icon-button:hover {
            color: #8b0000;
        }
        
        .notification-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background: #e74c3c;
            color: white;
            border-radius: 50%;
            width: 18px;
            height: 18px;
            font-size: 0.7rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        
        .container {
            display: flex;
            margin-top: 70px;
            min-height: calc(100vh - 70px);
        }
        
        .sidebar {
            width: 240px;
            background: rgba(179, 0, 0, 0.9);
            backdrop-filter: blur(10px);
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            padding-top: 0.25rem;
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            overflow: hidden;
            z-index: 999;
            display: flex;
            flex-direction: column;
        }
        
        .sidebar-header {
            padding: 1.5rem 1.25rem 1rem;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .sidebar-logo {
            width: 64px;
            height: 64px;
            margin: 0 auto 0.75rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .sidebar-logo img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }
        
        .sidebar-title {
            color: rgba(255, 255, 255, 0.85);
            font-size: 0.85rem;
            letter-spacing: 0.02em;
        }
        
        .sidebar-menu {
            list-style: none;
            flex: 1;
            padding: 0.5rem 0.5rem 1rem;
            overflow: hidden;
        }
        
        .sidebar-item {
            margin-bottom: 0.1rem;
        }
        
        .sidebar-item.logout {
            border-top: 1px solid rgba(255, 255, 255, 0.2);
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 1rem 0;
            text-align: center;
        }
        
        .sidebar-item.logout .sidebar-link {
            justify-content: center;
        }
        
        .sidebar-link {
            display: flex;
            align-items: center;
            padding: 0.65rem 1rem;
            margin: 0.2rem 0.5rem;
            color: rgba(255, 255, 255, 0.92);
            text-decoration: none;
            transition: all 0.3s;
            border-left: 0;
            border-radius: 12px;
            gap: 0.85rem;
            font-size: 0.95rem;
            font-weight: 500;
        }
        
        .sidebar-link:hover {
            background: rgba(255, 255, 255, 0.14);
            color: white;
        }
        
        .sidebar-link.active {
            background: rgba(255, 255, 255, 0.22);
            color: white;
            font-weight: 600;
        }
        
        .sidebar-icon {
            margin-right: 0;
            font-size: 1.1rem;
            width: 26px;
            text-align: center;
        }
        
        .main-content {
            flex: 1;
            padding: 2rem;
            margin-left: 192px; /* 80% of 250px */
        }
        
        .content-section {
            background: linear-gradient(180deg, #ffffff 0%, #fafafa 100%);
            padding: 2.5rem;
            border-radius: 18px;
            box-shadow: 0 18px 35px rgba(17, 24, 39, 0.08);
            margin-bottom: 2rem;
            border: 1px solid rgba(139, 0, 0, 0.08);
        }
        
        .section-title {
            font-size: 1.75rem;
            color: #1f2933;
            margin-bottom: 0.35rem;
            letter-spacing: 0.02em;
        }

        .section-subtitle {
            color: #6b7280;
            margin-bottom: 1.75rem;
            font-size: 0.95rem;
        }
        
        .history-summary {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 1.25rem;
            margin-bottom: 2rem;
        }
        
        .summary-card {
            background: #ffffff;
            padding: 1.5rem;
            border-radius: 14px;
            text-align: left;
            border: 1px solid rgba(139, 0, 0, 0.12);
            box-shadow: 0 10px 20px rgba(17, 24, 39, 0.08);
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .summary-icon {
            width: 46px;
            height: 46px;
            border-radius: 12px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, rgba(139, 0, 0, 0.15), rgba(220, 20, 60, 0.2));
            color: #8b0000;
            font-size: 1.1rem;
        }

        .summary-details {
            display: flex;
            flex-direction: column;
        }
        
        .summary-number {
            font-size: 1.6rem;
            font-weight: 700;
            color: #111827;
        }
        
        .summary-label {
            color: #6b7280;
            font-size: 0.85rem;
        }
        
        .history-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1.5rem;
            overflow: hidden;
            border-radius: 14px;
            background: #ffffff;
            box-shadow: 0 12px 24px rgba(15, 23, 42, 0.08);
        }
        
        .history-table thead {
            background: #fef2f2;
        }
        
        .history-table th {
            padding: 1.1rem 1rem;
            text-align: left;
            color: #7f1d1d;
            font-weight: 700;
            border-bottom: 1px solid rgba(139, 0, 0, 0.15);
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        
        .history-table td {
            padding: 1rem;
            border-bottom: 1px solid rgba(148, 163, 184, 0.2);
            color: #4b5563;
            font-size: 0.95rem;
        }
        
        .history-table tbody tr:hover {
            background: #fff5f5;
        }

        .table-scroll-wrap {
            width: 100%;
            overflow-x: auto;
            overflow-y: visible;
            -webkit-overflow-scrolling: touch;
            border-radius: 12px;
        }
        
        .loan-id {
            font-weight: 700;
            color: #111827;
        }
        
        .loan-amount {
            font-weight: 700;
            color: #8b0000;
        }
        
        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 0.35rem 0.85rem;
            border-radius: 999px;
            font-size: 0.8rem;
            font-weight: 700;
        }
        
        .status-completed {
            background: #d4edda;
            color: #155724;
        }
        
        .status-active {
            background: #cce5ff;
            color: #004085;
        }

        .status-approved {
            background: #ede9fe;
            color: #4c1d95;
        }
        
        .status-rejected {
            background: #f8d7da;
            color: #721c24;
        }
        
        .status-cancelled {
            background: #e2e3e5;
            color: #383d41;
        }
        
        .admin-comment {
            max-width: 300px;
            font-size: 0.9rem;
        }
        
        .comment-content {
            background: #f8f9fa;
            padding: 0.5rem;
            border-radius: 0.375rem;
            border-left: 3px solid #8b0000;
            line-height: 1.4;
        }
        
        .comment-meta {
            font-size: 0.8rem;
            color: #6c757d;
            font-style: italic;
            margin-top: 0.25rem;
        }
        
        .no-comment {
            color: #adb5bd;
            font-style: italic;
        }
        
        .filter-section {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            flex-wrap: wrap;
            align-items: center;
            background: #fff;
            border-radius: 14px;
            padding: 1rem 1.25rem;
            border: 1px solid rgba(148, 163, 184, 0.2);
        }
        
        .filter-group {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .filter-group label {
            color: #4b5563;
            font-weight: 600;
        }
        
        .filter-group select {
            padding: 0.5rem 0.75rem;
            border: 1px solid rgba(148, 163, 184, 0.5);
            border-radius: 10px;
            background: white;
            cursor: pointer;
            min-width: 140px;
        }
        
        .filter-group select:focus {
            outline: none;
            border-color: #8b0000;
        }
        
        .export-btn {
            background: linear-gradient(135deg, #8b0000 0%, #dc143c 100%);
            color: white;
            border: none;
            padding: 0.6rem 1.1rem;
            border-radius: 999px;
            cursor: pointer;
            font-weight: 600;
            transition: transform 0.3s, box-shadow 0.3s;
            margin-left: auto;
        }
        
        .export-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 18px rgba(139, 0, 0, 0.2);
        }
        
        .empty-state {
            text-align: center;
            padding: 3rem;
            color: #6b7280;
            background: #ffffff;
            border-radius: 16px;
            border: 1px dashed rgba(148, 163, 184, 0.5);
        }
        
        .empty-state i {
            font-size: 3.5rem;
            color: #f3c1c1;
            margin-bottom: 1rem;
        }

        .loan-meta {
            display: inline-flex;
            align-items: center;
            gap: 0.35rem;
            font-size: 0.85rem;
            color: #6b7280;
        }
        
        @media (max-width: 768px) {
            .navbar {
                left: 0;
                padding: 1rem;
            }
            
            .sidebar {
                width: 100%;
                position: relative;
                height: auto;
                order: 2;
            }
            
            .main-content {
                margin-left: 0;
                order: 1;
            }
            
            .container {
                flex-direction: column;
            }
            
            .history-summary {
                grid-template-columns: 1fr;
            }
            
            .filter-section {
                flex-direction: column;
            }
            
            .export-btn {
                margin-left: 0;
                width: 100%;
            }
            
            .history-table {
                font-size: 0.9rem;
            }
            
            .history-table th,
            .history-table td {
                padding: 0.5rem;
            }
            
            .welcome-message {
                font-size: 1rem;
            }
        }

        /* ===== App shell (match admin_dashboard/reports) ===== */
        .sidebar-toggle {
            display: none;
            width: 40px;
            height: 40px;
            border: 1px solid #eadfe2;
            border-radius: 10px;
            background: #fff;
            color: #8b0000;
            align-items: center;
            justify-content: center;
            font-size: 1.1rem;
            cursor: pointer;
            box-shadow: 0 3px 10px rgba(15, 23, 42, 0.08);
        }

        .sidebar-backdrop { display: none; }
        .sidebar-close { display: none; }

        @media (max-width: 700px) {
            .navbar {
                left: 0 !important;
                width: 100% !important;
                padding: 0.75rem 0.85rem;
                gap: 0.55rem;
                display: flex;
                flex-wrap: nowrap !important;
                align-items: center !important;
            }

            .sidebar-toggle { display: inline-flex; flex-shrink: 0; }

            .welcome-message { font-size: 1rem; min-width: 0; flex: 1 1 auto !important; width: auto !important; max-width: none !important; }
            .welcome-title { font-size: 0.94rem; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
            .welcome-meta { font-size: 0.74rem; gap: 0.35rem 0.55rem; flex-wrap: nowrap; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
            .welcome-meta span:last-child { display: none; }

            .nav-icons { gap: 0.55rem; margin-left: auto; flex: 0 0 auto !important; width: auto !important; justify-content: flex-end !important; }
            .profile-chevron { display: none; }

            .sidebar {
                --mobile-sidebar-width: clamp(200px, 62vw, 240px);
                position: fixed !important;
                top: 0 !important;
                left: calc(-1 * var(--mobile-sidebar-width) - 12px) !important;
                width: var(--mobile-sidebar-width) !important;
                max-width: var(--mobile-sidebar-width) !important;
                min-width: var(--mobile-sidebar-width) !important;
                height: 100vh !important;
                transition: left 0.24s ease !important;
                z-index: 1003 !important;
                overflow-y: auto !important;
                border-radius: 0 16px 16px 0;
                box-shadow: 0 20px 42px rgba(15, 23, 42, 0.24);
            }

            body.sidebar-open .sidebar { left: 0 !important; }

            .sidebar-backdrop {
                display: block;
                position: fixed;
                inset: 0;
                border: 0;
                background: rgba(15, 23, 42, 0.45);
                opacity: 0;
                visibility: hidden;
                pointer-events: none;
                transition: opacity 0.2s ease, visibility 0.2s ease;
                z-index: 1002;
            }

            body.sidebar-open .sidebar-backdrop {
                opacity: 1;
                visibility: visible;
                pointer-events: auto;
            }

            .sidebar-close {
                display: inline-flex;
                position: absolute;
                top: 10px;
                right: 10px;
                width: 34px;
                height: 34px;
                border: 1px solid rgba(255, 255, 255, 0.25);
                border-radius: 10px;
                background: rgba(255, 255, 255, 0.12);
                color: #fff;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                z-index: 2;
            }

            .container { margin-top: 78px !important; min-height: 100vh; display: block !important; }
            .main-content { margin-left: 0 !important; padding: 1rem; margin-top: 0; }

            .content-section {
                padding: 0.95rem;
                overflow: hidden;
            }

            .table-scroll-wrap {
                margin-top: 0.5rem;
            }

            .history-table {
                min-width: 760px;
                table-layout: auto;
            }

            .history-table th,
            .history-table td {
                white-space: nowrap;
                word-break: normal;
            }

            /* Disable collapsed sidebar visuals from shared.css on mobile widths */
            .sidebar-title,
            .sidebar-user-meta,
            .sidebar-badge,
            .sidebar-link .sidebar-label {
                opacity: 1 !important;
                transform: none !important;
                width: auto !important;
                max-width: none !important;
                max-height: none !important;
                overflow: visible !important;
                pointer-events: auto !important;
            }
        }

        @media (min-width: 701px) and (max-width: 900px) {
            .navbar { left: var(--sidebar-width) !important; width: calc(100% - var(--sidebar-width)) !important; }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <button id="sidebarToggle" class="sidebar-toggle" type="button" aria-label="Toggle menu" aria-expanded="false">
            <i class="fas fa-bars"></i>
        </button>
        <div class="welcome-message">
            <div class="welcome-block">
                <div class="welcome-title">Welcome back, <strong><?php echo htmlspecialchars($user_data['full_name']); ?></strong>! 👋</div>
                <div class="welcome-meta">
                    <span class="meta-pill"><i class="fas fa-id-badge"></i> Borrower</span>
                    <span><i class="fas fa-calendar-check"></i> <?php echo date('M d, Y'); ?></span>
                    <span><i class="fas fa-history"></i> Loan History</span>
                </div>
            </div>
        </div>
        <div class="nav-icons">
            <?php include 'notifications.php'; ?>
            <div class="profile-trigger" title="Profile menu" onclick="toggleProfileDropdown()">
                <div class="profile-trigger-main">
                <div class="profile-icon">
                <?php if ($profile_photo_exists): ?>
                    <img src="<?php echo htmlspecialchars($profile_photo); ?>" alt="Profile Photo">
                <?php else: ?>
                    <span class="profile-initial"><?php echo strtoupper(substr($user_data['full_name'], 0, 1)); ?></span>
                <?php endif; ?>
                <div class="status-indicator"></div>
                </div>
                <span class="profile-chevron" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M6 9l6 6 6-6"/></svg></span>
                </div>
                <div class="profile-dropdown" id="profileDropdown">
                    <div class="dropdown-header">
                        <div class="dropdown-user-info">
                            <div class="dropdown-user-avatar">
                                <?php if ($profile_photo_exists): ?>
                                    <img src="<?php echo htmlspecialchars($profile_photo); ?>" alt="Profile Photo">
                                <?php else: ?>
                                    <?php echo strtoupper(substr($user_data['full_name'], 0, 1)); ?>
                                <?php endif; ?>
                            </div>
                            <div class="dropdown-user-details">
                                <div class="dropdown-user-name"><?php echo htmlspecialchars($user_data['full_name']); ?></div>
                                <div class="dropdown-user-email"><?php echo htmlspecialchars($user_data['email']); ?></div>
                                <div class="dropdown-user-email">Employee Deped No.: <?php echo htmlspecialchars($user_data['deped_id'] ?? 'Not set'); ?></div>
                            </div>
                        </div>
                    </div>
                    <a href="#" class="dropdown-item" onclick="openProfileModal('profile'); return false;">
                        <i class="fas fa-user-edit"></i>
                        Update Profile
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="logout.php" class="dropdown-item logout-item">
                        <i class="fas fa-sign-out-alt"></i>
                        Logout
                    </a>
                </div>
            </div>
        </div>
    </nav>
    <button id="sidebarBackdrop" class="sidebar-backdrop" type="button" aria-label="Close menu"></button>
    
    <div class="container">
        <aside class="sidebar">
            <button id="sidebarClose" class="sidebar-close" type="button" aria-label="Hide sidebar">
                <i class="fas fa-times"></i>
            </button>
            <div class="sidebar-header">
                <div class="sidebar-logo">
                    <img src="SDO.jpg" alt="DepEd Loan System Logo">
                </div>
                <div class="sidebar-title">DepEd Loan System</div>
            </div>
            
            <ul class="sidebar-menu">
                <li class="sidebar-item">
                    <a href="borrower_dashboard.php" class="sidebar-link">
                        <span class="sidebar-icon"><i class="fas fa-home"></i></span>
                        Borrower Dashboard
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="my_loans.php" class="sidebar-link">
                        <span class="sidebar-icon"><i class="fas fa-credit-card"></i></span>
                        My Loans
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="apply_loan.php" class="sidebar-link">
                        <span class="sidebar-icon"><i class="fas fa-plus-circle"></i></span>
                        Apply for Loan
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="loan_history.php" class="sidebar-link active">
                        <span class="sidebar-icon"><i class="fas fa-history"></i></span>
                        Loan History
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="support.php" class="sidebar-link">
                        <span class="sidebar-icon"><i class="fas fa-headset"></i></span>
                        Support
                    </a>
                </li>
            </ul>
            <div class="sidebar-user-card">
                <div class="sidebar-user-avatar">
                    <?php if ($profile_photo_exists): ?>
                        <img src="<?php echo htmlspecialchars($profile_photo); ?>" alt="User avatar">
                    <?php else: ?>
                        <?php echo strtoupper(substr($_SESSION['full_name'] ?? 'U', 0, 1)); ?>
                    <?php endif; ?>
                    <span class="sidebar-user-status" aria-hidden="true"></span>
                </div>
                <div class="sidebar-user-meta">
                    <div class="sidebar-user-name"><?php echo htmlspecialchars($_SESSION['full_name'] ?? 'User'); ?></div>
                    <div class="sidebar-user-role">Borrower</div>
                </div>
            </div>
            
        </aside>
        
        <main class="main-content">
            <div class="content-section">
                <h2 class="section-title">Loan History</h2>
                <p class="section-subtitle">Track your applications, approvals, and repayments in one place.</p>
                
                <div class="history-summary">
                    <div class="summary-card">
                        <div class="summary-icon"><i class="fas fa-layer-group"></i></div>
                        <div class="summary-details">
                            <div class="summary-number"><?php echo (int) $total_loans; ?></div>
                            <div class="summary-label">Approved Loans</div>
                        </div>
                    </div>
                    <div class="summary-card">
                        <div class="summary-icon"><i class="fas fa-hand-holding-dollar"></i></div>
                        <div class="summary-details">
                            <div class="summary-number"><?php echo format_currency($total_borrowed); ?></div>
                            <div class="summary-label">Total Borrowed</div>
                        </div>
                    </div>
                    <div class="summary-card">
                        <div class="summary-icon"><i class="fas fa-sack-dollar"></i></div>
                        <div class="summary-details">
                            <div class="summary-number"><?php echo format_currency($total_paid); ?></div>
                            <div class="summary-label">Total Paid</div>
                        </div>
                    </div>
                    <div class="summary-card">
                        <div class="summary-icon"><i class="fas fa-chart-line"></i></div>
                        <div class="summary-details">
                            <div class="summary-number"><?php echo format_currency($total_outstanding); ?></div>
                            <div class="summary-label">Outstanding</div>
                        </div>
                    </div>
                </div>
                
                <div class="filter-section">
                    <div class="filter-group">
                        <label for="statusFilter">Status:</label>
                        <select id="statusFilter">
                            <option value="">All Status</option>
                            <option value="approved">Approved</option>
                            <option value="rejected">Rejected</option>
                            <option value="completed">Completed</option>
                        </select>
                    </div>
                    
                    <div class="filter-group">
                        <label for="yearFilter">Year:</label>
                        <select id="yearFilter">
                            <option value="">All Years</option>
                            <?php foreach (array_keys($available_years) as $year): ?>
                                <option value="<?php echo htmlspecialchars($year); ?>"><?php echo htmlspecialchars($year); ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    
                    <button class="export-btn">
                        <i class="fas fa-download"></i> Export History
                    </button>
                </div>
                
                <?php if (empty($loans)): ?>
                    <div class="empty-state">
                        <i class="fas fa-history"></i>
                        <div>No loan history found.</div>
                        <div style="margin-top: 0.5rem;">
                            <a href="apply_loan.php" style="color: #8b0000; text-decoration: none; font-weight: 600;">Apply for your first loan</a>
                        </div>
                    </div>
                <?php else: ?>
                    <div class="table-scroll-wrap">
                    <table class="history-table">
                        <thead>
                            <tr>
                                <th>Loan ID</th>
                                <th>Date Applied</th>
                                <th>Amount</th>
                                <th>Term</th>
                                <th>Status</th>
                                <th>Admin Comment</th>
                                <th>Action/Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($loans as $loan): ?>
                                <?php
                                    $status = strtolower((string) ($loan['status'] ?? 'pending'));
                                    $status_class = 'status-' . $status;
                                    $status_label = ucfirst($status);
                                    $completion_raw = $loan['reviewed_at'] ?? $loan['released_at'] ?? '';
                                    $completion_date = $completion_raw ? date('M d, Y', strtotime($completion_raw)) : '—';
                                ?>
                                <tr data-status="<?php echo htmlspecialchars($status); ?>" data-year="<?php echo htmlspecialchars(date('Y', strtotime($loan['application_date']))); ?>">
                                    <td class="loan-id">#<?php echo (int) $loan['id']; ?></td>
                                    <td>
                                        <div><?php echo date('M d, Y', strtotime($loan['application_date'])); ?></div>
                                        <div class="loan-meta"><i class="fas fa-calendar"></i> <?php echo date('h:i A', strtotime($loan['application_date'])); ?></div>
                                    </td>
                                    <td class="loan-amount"><?php echo format_currency($loan['loan_amount']); ?></td>
                                    <td><?php echo htmlspecialchars($loan['loan_term'] ?? 'N/A'); ?></td>
                                    <td>
                                        <span class="status-badge <?php echo htmlspecialchars($status_class); ?>">
                                            <i class="fas fa-circle"></i> <?php echo htmlspecialchars($status_label); ?>
                                        </span>
                                    </td>
                                    <td class="admin-comment">
                                        <?php if (!empty($loan['admin_comment'])): ?>
                                            <div class="comment-content">
                                                <?php echo htmlspecialchars($loan['admin_comment']); ?>
                                                <?php if (!empty($loan['reviewed_by_name'])): ?>
                                                    <div class="comment-meta">
                                                        — <?php echo htmlspecialchars($loan['reviewed_by_name']); ?>
                                                        <?php if (!empty($loan['reviewed_by_role'])): ?>
                                                            (<?php echo htmlspecialchars(ucfirst($loan['reviewed_by_role'])); ?>)
                                                        <?php endif; ?>
                                                    </div>
                                                <?php endif; ?>
                                            </div>
                                        <?php else: ?>
                                            <span class="no-comment">No comment</span>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <?php echo htmlspecialchars($completion_date); ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                    </div>
                <?php endif; ?>
            </div>
        </main>
    </div>
    
    <script>
        function toggleProfileDropdown() {
            const dropdown = document.getElementById('profileDropdown');
            dropdown.classList.toggle('active');
        }
        
        // Close dropdown when clicking outside
        document.addEventListener('click', function(event) {
            const profileIcon = document.querySelector('.profile-trigger');
            const dropdown = document.getElementById('profileDropdown');
            
            if (!profileIcon.contains(event.target)) {
                dropdown.classList.remove('active');
            }
        });
        
        // Filter functionality
        document.getElementById('statusFilter').addEventListener('change', filterTable);
        document.getElementById('yearFilter').addEventListener('change', filterTable);
        
        function filterTable() {
            const statusFilter = document.getElementById('statusFilter').value;
            const yearFilter = document.getElementById('yearFilter').value;
            const rows = document.querySelectorAll('.history-table tbody tr');
            
            rows.forEach(row => {
                const status = row.dataset.status || '';
                const year = row.dataset.year || '';

                const statusMatch = !statusFilter || status === statusFilter.toLowerCase();
                const yearMatch = !yearFilter || year === yearFilter;

                row.style.display = statusMatch && yearMatch ? '' : 'none';
            });
        }
        
        // Export functionality
        document.querySelector('.export-btn').addEventListener('click', function() {
            alert('Export functionality would download your loan history as a PDF or Excel file.');
        });
    </script>

    <div id="profileModalOverlay" class="profile-modal-overlay">
        <div class="profile-modal-content">
            <iframe id="profileModalFrame" src="" title="Profile Settings"></iframe>
        </div>
    </div>

    <script>
        function openProfileModal(tab) {
            const overlay = document.getElementById('profileModalOverlay');
            const frame = document.getElementById('profileModalFrame');
            const safeTab = tab === 'password' ? 'password' : 'profile';
            frame.src = 'profile_update.php?tab=' + safeTab + '&embed=1';
            if (tab === 'password') overlay.classList.add('change-password-modal');
            else overlay.classList.remove('change-password-modal');
            overlay.classList.add('active');
            document.body.style.overflow = 'hidden';
        }

        function closeProfileModal() {
            const overlay = document.getElementById('profileModalOverlay');
            const frame = document.getElementById('profileModalFrame');
            overlay.classList.remove('active', 'change-password-modal');
            document.body.style.overflow = 'auto';
            frame.src = '';
        }

        document.addEventListener('click', function(event) {
            if (event.target && event.target.id === 'profileModalOverlay') {
                closeProfileModal();
            }
        });
    </script>

    <script>
        (function () {
            const toggleBtn = document.getElementById('sidebarToggle');
            const backdrop = document.getElementById('sidebarBackdrop');
            const closeBtn = document.getElementById('sidebarClose');
            if (!toggleBtn || !backdrop) return;

            function setSidebarOpen(open) {
                document.body.classList.toggle('sidebar-open', open);
                toggleBtn.setAttribute('aria-expanded', open ? 'true' : 'false');
                document.body.style.overflow = open ? 'hidden' : '';
            }

            toggleBtn.addEventListener('click', function () {
                setSidebarOpen(!document.body.classList.contains('sidebar-open'));
            });

            backdrop.addEventListener('click', function () { setSidebarOpen(false); });
            if (closeBtn) closeBtn.addEventListener('click', function () { setSidebarOpen(false); });

            window.addEventListener('resize', function () {
                if (window.innerWidth > 700) setSidebarOpen(false);
            });

            document.addEventListener('keydown', function (event) {
                if (event.key === 'Escape') setSidebarOpen(false);
            });
        })();
    </script>
</body>
</html>
