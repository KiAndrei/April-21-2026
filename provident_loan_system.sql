-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2026 at 03:48 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `provident_loan_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `actor_name` varchar(150) NOT NULL,
  `user_role` varchar(50) NOT NULL,
  `action_type` varchar(20) NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  `page_name` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `actor_id`, `actor_name`, `user_role`, `action_type`, `target`, `page_name`, `description`, `ip_address`, `user_agent`, `created_at`) VALUES
(1, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 00:34:23'),
(2, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #13', 'Profile Update', 'Updated profile details.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 01:10:01'),
(3, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #13', 'Profile Update', 'Updated profile details.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 01:15:41'),
(4, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #13', 'Profile Update', 'Updated profile details.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 01:17:39'),
(5, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #13', 'Profile Update', 'Updated profile details.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 01:17:53'),
(6, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #13', 'Profile Update', 'Updated profile details.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 01:36:55'),
(7, 14, 'Mar John Santiago Refrea', 'borrower', 'CREATE', 'User #14 - Mar John Santiago Refrea', 'Register', 'New borrower account registered for Mar John Santiago Refrea.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 02:05:30'),
(8, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 02:05:41'),
(9, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 02:05:44'),
(10, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 02:05:51'),
(11, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 02:05:54'),
(12, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 02:06:02'),
(13, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'User #15 - Macky Bao Daw', 'Manage Users', 'Created accountant account for Macky Bao Daw.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 02:23:17'),
(14, 13, 'SDO Cabuyao', 'admin', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 03:29:22'),
(15, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 00:11:27'),
(16, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 00:11:45'),
(17, NULL, 'marjohnrefrea123456@gmail.com', 'guest', 'LOGIN', NULL, 'Login', 'Failed login attempt for marjohnrefrea123456@gmail.com.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 00:12:07'),
(18, 15, 'Macky Bao Daw', 'accountant', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 00:12:25'),
(19, 14, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #24', 'Apply Loan', 'Submitted a loan application for ₱30,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 00:30:07'),
(20, 13, 'SDO Cabuyao', 'admin', 'REJECT', 'Loan Application #24 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #24 - Mar John Santiago Refrea for ₱30,000.00. Comment: dawdawdawdaw', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 00:32:15'),
(21, 14, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #25', 'Apply Loan', 'Submitted a loan application for ₱30,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 00:32:43'),
(22, 13, 'SDO Cabuyao', 'admin', 'REJECT', 'Loan Application #25 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #25 - Mar John Santiago Refrea for ₱30,000.00. Comment: dawdawdaw', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 00:33:30'),
(23, 14, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #26', 'Apply Loan', 'Submitted a loan application for ₱30,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 00:33:46'),
(24, 13, 'SDO Cabuyao', 'admin', 'REJECT', 'Loan Application #26 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #26 - Mar John Santiago Refrea for ₱30,000.00. Comment: dadawdaw', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 00:39:06'),
(25, 14, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #27', 'Apply Loan', 'Submitted a loan application for ₱30,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 00:39:38'),
(26, 13, 'SDO Cabuyao', 'admin', 'REJECT', 'Loan Application #27 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #27 - Mar John Santiago Refrea for ₱30,000.00. Comment: dwadaw', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 00:41:21'),
(27, 14, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #28', 'Apply Loan', 'Submitted a loan application for ₱30,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 00:41:28'),
(28, 15, 'Macky Bao Daw', 'accountant', 'REJECT', 'Loan Application #28 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #28 - Mar John Santiago Refrea for ₱30,000.00. Comment: dawddaw', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 00:58:15'),
(29, 14, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #29', 'Apply Loan', 'Submitted a loan application for ₱30,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 01:00:22'),
(30, 15, 'Macky Bao Daw', 'accountant', 'REJECT', 'Loan Application #29 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #29 - Mar John Santiago Refrea for ₱30,000.00. Comment: dawdwad', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 01:00:43'),
(31, 14, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #30', 'Apply Loan', 'Submitted a loan application for ₱30,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 01:02:15'),
(32, 13, 'SDO Cabuyao', 'admin', 'REJECT', 'Loan Application #30 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #30 - Mar John Santiago Refrea for ₱30,000.00. Comment: dawdawda', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 01:02:37'),
(33, 14, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #31', 'Apply Loan', 'Submitted a loan application for ₱30,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 01:05:19'),
(34, 13, 'SDO Cabuyao', 'admin', 'REJECT', 'Loan Application #31 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #31 - Mar John Santiago Refrea for ₱30,000.00. Comment: dawawdaw adeeadaaes', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 01:06:03'),
(35, 14, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #32', 'Apply Loan', 'Submitted a loan application for ₱30,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 01:06:44'),
(36, 13, 'SDO Cabuyao', 'admin', 'REJECT', 'Loan Application #32 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #32 - Mar John Santiago Refrea for ₱30,000.00. Comment: dawdaw', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 01:06:56'),
(37, 15, 'Macky Bao Daw', 'accountant', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 06:40:59'),
(38, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 06:53:16'),
(39, NULL, 'refreamarjohn91@gmail.com', 'guest', 'LOGIN', NULL, 'Login', 'Failed login attempt for refreamarjohn91@gmail.com.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 06:56:26'),
(40, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 06:56:34'),
(41, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 23:56:58'),
(42, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 01:46:43'),
(43, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 03:37:05'),
(44, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 03:37:19'),
(45, 14, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #33', 'Apply Loan', 'Submitted a loan application for ₱30,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 05:16:06'),
(46, 13, 'SDO Cabuyao', 'admin', 'REJECT', 'Loan Application #33 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #33 - Mar John Santiago Refrea for ₱30,000.00. Comment: dwadawdaw', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 05:27:16'),
(47, 14, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #34', 'Apply Loan', 'Submitted a loan application for ₱30,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 05:28:25'),
(48, 13, 'SDO Cabuyao', 'admin', 'REJECT', 'Loan Application #34 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #34 - Mar John Santiago Refrea for ₱30,000.00. Comment: dawdaw', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 05:32:33'),
(49, 14, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #35', 'Apply Loan', 'Submitted a loan application for ₱30,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 05:33:23'),
(50, 13, 'SDO Cabuyao', 'admin', 'REJECT', 'Loan Application #35 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #35 - Mar John Santiago Refrea for ₱30,000.00. Comment: www', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 05:36:48'),
(51, 14, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #36', 'Apply Loan', 'Submitted a loan application for ₱30,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 05:40:12'),
(52, 13, 'SDO Cabuyao', 'admin', 'APPROVE', 'Loan Application #36 - Mar John Santiago Refrea', 'Loan Applications', 'Approved Loan Application #36 - Mar John Santiago Refrea for ₱30,000.00. Comment: dawdawdawd', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 05:40:52'),
(53, 13, 'SDO Cabuyao', 'admin', 'RELEASE', 'Loan #36', 'Loan Applications', 'Loan #36 marked as released (released_at set).', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 05:42:41'),
(54, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'Loan #36', 'All Loans', 'Skip month 2026-02 for Loan #36 (approved)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 05:43:58'),
(55, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #36', 'All Loans', 'Recorded payment of ₱1,290.99 for Loan #36 (Date: 2026-03-15)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 05:44:04'),
(56, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #36', 'All Loans', 'Recorded payment of ₱2,581.99 for Loan #36 (Date: 2026-03-30)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 05:44:10'),
(57, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #36', 'All Loans', 'Recorded payment of ₱1,290.99 for Loan #36 (Date: 2026-04-15)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 05:44:21'),
(58, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 07:53:20'),
(59, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-27 07:53:36'),
(60, 16, 'Mar John Santiago Refrea', 'borrower', 'CREATE', 'User #16 - Mar John Santiago Refrea', 'Register', 'New borrower account registered for Mar John Santiago Refrea.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 01:33:46'),
(61, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 01:34:16'),
(62, NULL, 'marjohnrefrea1215@gmail.com', 'guest', 'LOGIN', NULL, 'Login', 'Failed login attempt for marjohnrefrea1215@gmail.com.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 01:34:29'),
(63, 16, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 01:34:40'),
(64, 16, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #37', 'Apply Loan', 'Submitted a loan application for ₱20,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 01:40:08'),
(65, 13, 'SDO Cabuyao', 'admin', 'REJECT', 'Loan Application #37 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #37 - Mar John Santiago Refrea for ₱20,000.00. Comment: mali yung ganto mo boy', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 01:41:19'),
(66, 16, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #38', 'Apply Loan', 'Submitted a loan application for ₱20,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 01:43:11'),
(67, 13, 'SDO Cabuyao', 'admin', 'APPROVE', 'Loan Application #38 - Mar John Santiago Refrea', 'Loan Applications', 'Approved Loan Application #38 - Mar John Santiago Refrea for ₱20,000.00. Comment: ayos na boyy', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 01:43:42'),
(68, 16, 'Mar John Santiago Refrea', 'borrower', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 01:47:23'),
(69, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #36', 'All Loans', 'Recorded payment of ₱1,290.99 for Loan #36 (Date: 2026-04-15)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:06:21'),
(70, 16, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:09:25'),
(71, 16, 'Mar John Santiago Refrea', 'borrower', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:20:33'),
(72, 17, 'Yuhan Nerfy Sheesh', 'borrower', 'CREATE', 'User #17 - Yuhan Nerfy Sheesh', 'Register', 'New borrower account registered for Yuhan Nerfy Sheesh.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:23:25'),
(73, 17, 'Yuhan Nerfy Sheesh', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:23:50'),
(74, 17, 'Yuhan Nerfy Sheesh', 'borrower', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:26:25'),
(75, 18, 'Nathalie Joy Ulep Don', 'borrower', 'CREATE', 'User #18 - Nathalie Joy Ulep Don', 'Register', 'New borrower account registered for Nathalie Joy Ulep Don.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:29:19'),
(76, 18, 'Nathalie Joy Ulep Don', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:29:35'),
(77, 18, 'Nathalie Joy Ulep Don', 'borrower', 'SUBMIT', 'Loan Application #39', 'Apply Loan', 'Submitted a loan application for ₱100,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:34:39'),
(78, 18, 'Nathalie Joy Ulep Don', 'borrower', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:35:49'),
(79, 13, 'SDO Cabuyao', 'admin', 'REJECT', 'Loan Application #39 - Nathalie Joy Ulep Don', 'Loan Applications', 'Rejected Loan Application #39 - Nathalie Joy Ulep Don for ₱100,000.00. Comment: Kasi dapat meron din kaming SB thanks', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:37:51'),
(80, 18, 'Nathalie Joy Ulep Don', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:39:25'),
(81, 18, 'Nathalie Joy Ulep Don', 'borrower', 'SUBMIT', 'Loan Application #40', 'Apply Loan', 'Submitted a loan application for ₱100,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:47:24'),
(82, 13, 'SDO Cabuyao', 'admin', 'APPROVE', 'Loan Application #40 - Nathalie Joy Ulep Don', 'Loan Applications', 'Approved Loan Application #40 - Nathalie Joy Ulep Don for ₱100,000.00. Comment: For process basta meron kaming barista drink thanks', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:48:20'),
(83, 13, 'SDO Cabuyao', 'admin', 'RELEASE', 'Loan #38', 'Loan Applications', 'Loan #38 marked as released (released_at set).', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:52:39'),
(84, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'Loan #38', 'All Loans', 'Skip month 2026-03 for Loan #38 (approved)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:53:17'),
(85, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #38', 'All Loans', 'Recorded payment of ₱359.79 for Loan #38 (Date: 2026-04-15)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:56:10'),
(86, 13, 'SDO Cabuyao', 'admin', 'RELEASE', 'Loan #40', 'Loan Applications', 'Loan #40 marked as released (released_at set).', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:57:38'),
(87, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #40', 'All Loans', 'Recorded payment of ₱2,216.03 for Loan #40 (Date: 2026-03-15)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:57:55'),
(88, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'Loan #40', 'All Loans', 'Skip month 2026-04 for Loan #40 (approved)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 02:58:06'),
(89, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 05:52:12'),
(90, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-02 06:11:50'),
(91, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-03 00:17:37'),
(92, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-03 00:17:54'),
(93, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-03 01:04:35'),
(94, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-06 06:57:44'),
(95, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #36', 'All Loans', 'Recorded payment of ₱2,581.99 for Loan #36 (Date: 2026-05-30)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-06 06:58:27'),
(96, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #36', 'All Loans', 'Recorded payment of ₱2,581.99 for Loan #36 (Date: 2026-06-30)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-06 06:58:33'),
(97, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #36', 'All Loans', 'Recorded payment of ₱2,581.99 for Loan #36 (Date: 2026-07-30)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-06 06:58:38'),
(98, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #36', 'All Loans', 'Recorded payment of ₱2,581.99 for Loan #36 (Date: 2026-08-30)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-06 06:58:44'),
(99, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #36', 'All Loans', 'Recorded payment of ₱2,581.99 for Loan #36 (Date: 2026-09-30)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-06 06:58:50'),
(100, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #36', 'All Loans', 'Recorded payment of ₱2,581.99 for Loan #36 (Date: 2026-10-30)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-06 06:58:55'),
(101, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #36', 'All Loans', 'Recorded payment of ₱2,581.99 for Loan #36 (Date: 2026-11-30)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-06 06:59:05'),
(102, 13, 'SDO Cabuyao', 'admin', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-06 06:59:12'),
(103, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-06 06:59:19'),
(104, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-09 00:46:56'),
(105, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #38', 'All Loans', 'Recorded payment of ₱719.58 for Loan #38 (Date: 2026-04-30)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-09 05:47:58'),
(106, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #38', 'All Loans', 'Recorded payment of ₱359.79 for Loan #38 (Date: 2026-05-15)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-09 06:08:16'),
(107, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #38', 'All Loans', 'Recorded payment of ₱359.79 for Loan #38 (Date: 2026-05-30)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-09 06:09:07'),
(108, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-12 02:55:20'),
(109, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-12 03:02:19'),
(110, 14, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-12 03:02:23'),
(111, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-12 03:04:37'),
(112, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #18', 'Manage Users', 'Admin updated user #18 (Nathalie Joy Ulep Don).', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-12 03:13:30'),
(113, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #18', 'Manage Users', 'Admin updated user #18 (Nathalie Joy Ulep Don).', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-12 03:14:22'),
(114, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #18', 'Manage Users', 'Admin updated user #18 (Nathalie Joy Ulep Don).', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-12 03:14:29'),
(115, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #18', 'Manage Users', 'Admin updated user #18 (Nathalie Joy Ulep Don).', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-12 03:23:01'),
(116, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #18', 'Manage Users', 'Admin updated user #18 (Nathalie Joy Ulep Don).', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-12 03:24:59'),
(117, NULL, 'sdoofcabuyao@gmail.com', 'guest', 'LOGIN', NULL, 'Login', 'Failed login attempt for sdoofcabuyao@gmail.com.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-24 00:05:46'),
(118, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-24 00:05:57'),
(119, 19, 'Mar John Santiago Refrea', 'borrower', 'CREATE', 'User #19 - Mar John Santiago Refrea', 'Register', 'New borrower account registered for Mar John Santiago Refrea.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-24 00:08:59'),
(120, 19, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-24 00:09:21'),
(121, 19, 'Mar John Santiago Refrea', 'borrower', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-24 00:09:24'),
(122, 19, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-24 00:09:33'),
(123, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #19', 'Manage Users', 'Admin updated user #19 (Mar John Santiago Refrea).', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-24 00:46:21'),
(124, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #13', 'Profile Update', 'Updated profile details.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-24 02:07:47'),
(125, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #13', 'Profile Update', 'Updated profile details.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-24 02:08:01'),
(126, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #13', 'Profile Update', 'Updated profile details.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-24 02:08:11'),
(127, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-25 02:34:47'),
(128, 13, 'SDO Cabuyao', 'admin', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-25 13:39:24'),
(129, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-25 23:40:07'),
(130, 19, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-25 23:40:32'),
(131, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #13', 'Profile Update', 'Updated profile details.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-26 00:12:05'),
(132, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #13', 'Profile Update', 'Updated profile details.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-26 00:12:11'),
(133, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'User #13', 'Profile Update', 'Updated profile details.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-26 00:15:15'),
(134, 19, 'Mar John Santiago Refrea', 'borrower', 'UPDATE', 'User #19', 'Profile Update', 'Updated profile details.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-26 00:51:48'),
(135, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-26 05:23:10'),
(136, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-26 06:40:24'),
(137, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-31 06:16:31'),
(138, 19, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-31 06:34:03'),
(139, 19, 'Mar John Santiago Refrea', 'borrower', 'UPDATE', 'User #19', 'Profile Update', 'Updated profile details.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-31 06:44:50'),
(140, 19, 'Mar John Santiago Refrea', 'borrower', 'UPDATE', 'User #19', 'Profile Update', 'Updated profile details.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-31 06:50:03'),
(141, NULL, 'sdoofcabuyao', 'guest', 'LOGIN', NULL, 'Login', 'Failed login attempt for sdoofcabuyao.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-04 03:53:38'),
(142, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-04 03:53:43'),
(143, 19, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-04 03:53:59'),
(144, 19, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #41', 'Apply Loan', 'Submitted a loan application for ₱100,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-04 04:37:54'),
(145, 13, 'SDO Cabuyao', 'admin', 'REJECT', 'Loan Application #41 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #41 - Mar John Santiago Refrea for ₱100,000.00. Comment: d', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-04 04:56:06'),
(146, 19, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #42', 'Apply Loan', 'Submitted a loan application for ₱100,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-04 04:56:43'),
(147, 13, 'SDO Cabuyao', 'admin', 'REJECT', 'Loan Application #42 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #42 - Mar John Santiago Refrea for ₱100,000.00. Comment: daww', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-04 05:01:27'),
(148, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 00:58:22'),
(149, 20, 'Mar John Santiago Refrea', 'borrower', 'CREATE', 'User #20 - Mar John Santiago Refrea', 'Register', 'New borrower account registered for Mar John Santiago Refrea.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 01:00:58'),
(150, 20, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 01:01:07'),
(151, 20, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #43', 'Apply Loan', 'Submitted a loan application for ₱100,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 01:04:43'),
(152, 13, 'SDO Cabuyao', 'admin', 'REJECT', 'Loan Application #43 - Mar John Santiago Refrea', 'Loan Applications', 'Rejected Loan Application #43 - Mar John Santiago Refrea for ₱100,000.00. Comment: haytsss bossing', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 01:06:41'),
(153, 20, 'Mar John Santiago Refrea', 'borrower', 'SUBMIT', 'Loan Application #44', 'Apply Loan', 'Submitted a loan application for ₱100,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 01:07:30'),
(154, 13, 'SDO Cabuyao', 'admin', 'APPROVE', 'Loan Application #44 - Mar John Santiago Refrea', 'Loan Applications', 'Approved Loan Application #44 - Mar John Santiago Refrea for ₱100,000.00.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 01:08:37'),
(155, 13, 'SDO Cabuyao', 'admin', 'RELEASE', 'Loan #44', 'Loan Applications', 'Loan #44 marked as released (released_at set).', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 01:09:56'),
(156, 20, 'Mar John Santiago Refrea', 'borrower', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 01:19:10'),
(157, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'Loan #44', 'All Loans', 'Skip month 2026-04 for Loan #44 (approved)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 01:20:40'),
(158, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #44', 'All Loans', 'Recorded payment of ₱4,303.32 for Loan #44 (Date: 2026-05-15)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 01:20:56'),
(159, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'Loan #44', 'All Loans', 'Recorded payment of ₱4,303.32 for Loan #44 (Date: 2026-05-30)', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 01:21:17'),
(160, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'User #21', 'Existing loans', 'Created borrower account marjohnrefrea12345 for existing loan entry.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 01:30:37'),
(161, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'User #22', 'Existing loans', 'Created borrower account marjohnrefrea12345 for existing loan entry.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 02:25:30'),
(162, 13, 'SDO Cabuyao', 'admin', 'CREATE', 'User #23', 'Existing loans', 'Created borrower account marjohnrefrea12345 for existing loan entry.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 02:31:57'),
(163, 13, 'SDO Cabuyao', 'admin', 'INSERT', 'Loan #45', 'Existing loans', 'Added existing/on-file loan #45 for borrower user #23.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 02:31:57'),
(164, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'Loan #45', 'Existing loans', 'Updated existing/on-file loan #45.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 02:32:18'),
(165, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'Loan #45', 'Existing loans', 'Updated existing/on-file loan #45.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 02:32:24'),
(166, 23, 'Refrea, Mario Santiago', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 02:35:04'),
(167, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'Loan #45', 'Existing loans', 'Updated existing/on-file loan #45.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 02:44:29'),
(168, 23, 'Refrea, Mario Santiago', 'borrower', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-06 02:46:35'),
(169, 13, 'SDO Cabuyao', 'admin', 'UPDATE', 'Loan #45', 'Existing loans', 'Updated existing/on-file loan #45.', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36', '2026-04-06 02:53:45'),
(170, 13, 'SDO Cabuyao', 'admin', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-08 06:33:22'),
(171, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-09 07:56:39'),
(172, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-09 08:22:40'),
(173, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-09 08:24:59'),
(174, 19, 'Mar John Santiago Refrea', 'borrower', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-09 08:25:39'),
(175, 19, 'Mar John Santiago Refrea', 'borrower', 'LOGOUT', NULL, 'Logout', 'User logged out.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-09 08:31:20'),
(176, 13, 'SDO Cabuyao', 'admin', 'LOGIN', NULL, 'Login', 'User logged in successfully.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-09 08:31:26');

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `deduction_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `receipt_filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deductions`
--

INSERT INTO `deductions` (`id`, `loan_id`, `borrower_id`, `deduction_date`, `amount`, `posted_by`, `created_at`, `receipt_filename`) VALUES
(17, 44, 20, '2026-05-15', 4303.32, 13, '2026-04-06 01:20:56', 'loan_44_20260515_1775438456.png'),
(18, 44, 20, '2026-05-30', 4303.32, 13, '2026-04-06 01:21:17', 'loan_44_20260530_1775438477.png'),
(19, 45, 23, '2026-04-06', 3000.00, 13, '2026-04-06 02:31:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fund_ledger`
--

CREATE TABLE `fund_ledger` (
  `id` int(11) NOT NULL,
  `entry_date` date NOT NULL,
  `entry_type` enum('collection','release','adjustment') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `reference_type` varchar(50) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `loan_amount` decimal(10,2) NOT NULL,
  `loan_purpose` text NOT NULL,
  `loan_term` int(11) NOT NULL,
  `net_pay` decimal(10,2) NOT NULL,
  `school_assignment` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `salary_grade` varchar(10) NOT NULL,
  `employment_status` varchar(50) NOT NULL,
  `co_maker_full_name` varchar(150) NOT NULL,
  `co_maker_position` varchar(150) NOT NULL,
  `co_maker_school_assignment` varchar(255) NOT NULL,
  `co_maker_net_pay` decimal(10,2) NOT NULL,
  `co_maker_employment_status` varchar(50) NOT NULL,
  `payslip_filename` varchar(255) NOT NULL,
  `co_maker_payslip_filename` varchar(255) NOT NULL,
  `status` enum('pending','approved','rejected','completed') DEFAULT 'pending',
  `reviewed_by_id` int(11) DEFAULT NULL,
  `reviewed_by_role` varchar(50) DEFAULT NULL,
  `reviewed_by_name` varchar(150) DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `monthly_payment` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `total_interest` decimal(10,2) DEFAULT NULL,
  `released_at` timestamp NULL DEFAULT NULL,
  `application_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `admin_comment` text DEFAULT NULL,
  `co_maker_email` varchar(150) NOT NULL DEFAULT '',
  `previous_loan_id` int(11) DEFAULT NULL,
  `offset_amount` decimal(10,2) DEFAULT NULL,
  `borrower_date_of_birth` date DEFAULT NULL,
  `borrower_years_of_service` int(11) DEFAULT NULL,
  `borrower_id_front_filename` varchar(255) NOT NULL DEFAULT '',
  `borrower_id_back_filename` varchar(255) NOT NULL DEFAULT '',
  `co_maker_date_of_birth` date DEFAULT NULL,
  `co_maker_years_of_service` int(11) DEFAULT NULL,
  `co_maker_id_front_filename` varchar(255) NOT NULL DEFAULT '',
  `co_maker_id_back_filename` varchar(255) NOT NULL DEFAULT '',
  `is_existing_loan` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `user_id`, `loan_amount`, `loan_purpose`, `loan_term`, `net_pay`, `school_assignment`, `position`, `salary_grade`, `employment_status`, `co_maker_full_name`, `co_maker_position`, `co_maker_school_assignment`, `co_maker_net_pay`, `co_maker_employment_status`, `payslip_filename`, `co_maker_payslip_filename`, `status`, `reviewed_by_id`, `reviewed_by_role`, `reviewed_by_name`, `reviewed_at`, `monthly_payment`, `total_amount`, `total_interest`, `released_at`, `application_date`, `admin_comment`, `co_maker_email`, `previous_loan_id`, `offset_amount`, `borrower_date_of_birth`, `borrower_years_of_service`, `borrower_id_front_filename`, `borrower_id_back_filename`, `co_maker_date_of_birth`, `co_maker_years_of_service`, `co_maker_id_front_filename`, `co_maker_id_back_filename`, `is_existing_loan`) VALUES
(41, 19, 100000.00, 'pang starbucks lang po tsaka pang business narin medyo may edad narin kasi ako magpepension na', 18, 20000.00, 'SOUTHVILLE I ELEMENTARY SCHOOL', 'Special Education Teacher III', '17', 'Permanent', 'Castillo, Mar John Santiago', 'Master Teacher V', 'NIUGAN ELEMENTARY SCHOOL', 20000.00, 'Permanent', 'borrower_payslip_19_8e248da7850b3dca.jpg', 'co_maker_payslip_19_5bbea0c8600fcebc.pdf', 'rejected', 13, 'admin', 'SDO Cabuyao', '2026-04-04 04:55:55', 5823.17, 104817.11, 4817.11, NULL, '2026-04-03 16:00:00', 'd', 'refreamarjohn91@gmail.com', NULL, NULL, '2026-04-04', 20, 'borrower_id_front_19_084deed050f20d04.jpg', 'borrower_id_back_19_44af8306b761d181.jpg', '2001-12-15', 2000, 'co_maker_id_front_19_6bcf4e4f392aa028.jpg', 'co_maker_id_back_19_89dd157e5b57a405.jpg', 0),
(42, 19, 100000.00, 'pang starbucks lang po tsaka pang business narin medyo may edad narin kasi ako magpepension na', 18, 20000.00, 'SOUTHVILLE I ELEMENTARY SCHOOL', 'Special Education Teacher III', '17', 'Permanent', 'Castillo, Mar John Santiago', 'Master Teacher V', 'NIUGAN ELEMENTARY SCHOOL', 20000.00, 'Permanent', 'borrower_payslip_19_8e248da7850b3dca.jpg', 'co_maker_payslip_19_5bbea0c8600fcebc.pdf', 'rejected', 13, 'admin', 'SDO Cabuyao', '2026-04-04 05:01:17', 5823.17, 104817.11, 4817.11, NULL, '2026-04-03 16:00:00', 'daww', 'refreamarjohn91@gmail.com', NULL, NULL, '2026-04-04', 20, 'borrower_id_front_19_084deed050f20d04.jpg', 'borrower_id_back_19_44af8306b761d181.jpg', '2001-12-15', 2000, 'co_maker_id_front_19_6bcf4e4f392aa028.jpg', 'co_maker_id_back_19_89dd157e5b57a405.jpg', 0),
(43, 20, 100000.00, 'pang starbucks lang po bossing', 12, 20000.00, 'PITTLAND ELEMENTARY SCHOOL', 'Special Education Teacher I', '21', 'Permanent', 'Miranda, Kian Andrei', 'Instructor II', 'SAN ISIDRO ELEMENTARY SCHOOL', 20000.00, 'Permanent', 'borrower_payslip_20_b77fb307ed564162.jpg', 'co_maker_payslip_20_2115aafa297b4ee1.png', 'rejected', 13, 'admin', 'SDO Cabuyao', '2026-04-06 01:06:25', 8606.64, 103279.72, 3279.72, NULL, '2026-04-05 16:00:00', 'haytsss bossing', 'marjohnrefrea123456@gmail.com', NULL, NULL, '1999-12-15', 20, 'borrower_id_front_20_d3859da4862e931b.png', 'borrower_id_back_20_f01df9f9e683abf8.jpg', '2002-12-15', 20, 'co_maker_id_front_20_53f92bbddc90cbf0.png', 'co_maker_id_back_20_bf72acd10440185f.pdf', 0),
(44, 20, 100000.00, 'pang starbucks lang po bossing', 12, 20000.00, 'PITTLAND ELEMENTARY SCHOOL', 'Special Education Teacher I', '21', 'Permanent', 'Miranda, Kian Andrei', 'Instructor II', 'SAN ISIDRO ELEMENTARY SCHOOL', 20000.00, 'Permanent', 'borrower_payslip_20_b77fb307ed564162.jpg', 'co_maker_payslip_20_2115aafa297b4ee1.png', 'approved', 13, 'admin', 'SDO Cabuyao', '2026-04-06 01:08:20', 8606.64, 103279.72, 3279.72, '2026-04-06 01:09:56', '2026-04-05 16:00:00', '', 'marjohnrefrea123456@gmail.com', NULL, NULL, '1999-12-15', 20, 'borrower_id_front_20_d3859da4862e931b.png', 'borrower_id_back_20_f01df9f9e683abf8.jpg', '2002-12-15', 20, 'co_maker_id_front_20_53f92bbddc90cbf0.png', 'co_maker_id_back_20_bf72acd10440185f.pdf', 0),
(45, 23, 100000.00, 'dawdawdaw', 24, 20000.00, 'SOUTHVILLE I ELEMENTARY SCHOOL', 'Special Education Teacher II', '18', 'Substitute', 'dawdwad, dawda dwadawd', 'Special Science Teacher I', 'PITTLAND ELEMENTARY SCHOOL', 20000.00, 'Provisional', '', '', 'approved', 13, 'admin', 'SDO Cabuyao', '2026-04-06 02:31:57', 4432.06, 106369.46, 6369.46, '2026-04-06 02:36:00', '2026-04-05 16:00:00', NULL, 'refreamarjohn91@gmail.com', NULL, NULL, '2026-04-06', 20, '', '', '2026-04-23', 20, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `loan_skip_months`
--

CREATE TABLE `loan_skip_months` (
  `id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `skip_ym` char(7) NOT NULL COMMENT 'Year-month YYYY-MM',
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_skip_months`
--

INSERT INTO `loan_skip_months` (`id`, `loan_id`, `skip_ym`, `notes`, `created_at`, `created_by`) VALUES
(18, 44, '2026-04', 'Skip approved (DepEd)', '2026-04-06 01:20:40', 13);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(30) DEFAULT 'info',
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `type`, `is_read`, `created_at`) VALUES
(98, 19, 'Co-Maker Used on Loan Application', 'Mar John Santiago Refrea listed you as co-maker.\nLoan Purpose: pang starbucks lang po tsaka pang business narin medyo may edad narin kasi ako magpepension na\nLoan Amount: ₱100,000.00.', 'info', 0, '2026-04-04 04:38:01'),
(99, 19, 'Loan Rejected', 'Rejected Loan Application #41 - Mar John Santiago Refrea for ₱100,000.00. Comment: d', 'danger', 0, '2026-04-04 04:55:55'),
(100, 19, 'Loan Rejected (Co-Maker)', 'Rejected Loan Application #41 - Mar John Santiago Refrea for ₱100,000.00. Loan Purpose: pang starbucks lang po tsaka pang business narin medyo may edad narin kasi ako magpepension na. Comment: d', 'danger', 0, '2026-04-04 04:55:55'),
(101, 19, 'Co-Maker Used on Loan Application', 'Mar John Santiago Refrea listed you as co-maker.\nLoan Purpose: pang starbucks lang po tsaka pang business narin medyo may edad narin kasi ako magpepension na\nLoan Amount: ₱100,000.00.', 'info', 0, '2026-04-04 04:56:48'),
(102, 19, 'Loan Rejected', 'Rejected Loan Application #42 - Mar John Santiago Refrea for ₱100,000.00. Comment: daww', 'danger', 0, '2026-04-04 05:01:17'),
(103, 19, 'Loan Rejected (Co-Maker)', 'Rejected Loan Application #42 - Mar John Santiago Refrea for ₱100,000.00. Loan Purpose: pang starbucks lang po tsaka pang business narin medyo may edad narin kasi ako magpepension na. Comment: daww', 'danger', 0, '2026-04-04 05:01:17'),
(104, 20, 'Loan Rejected', 'Rejected Loan Application #43 - Mar John Santiago Refrea for ₱100,000.00. Comment: haytsss bossing', 'danger', 0, '2026-04-06 01:06:25'),
(105, 20, 'Loan Approved', 'Approved Loan Application #44 - Mar John Santiago Refrea for ₱100,000.00.', 'success', 0, '2026-04-06 01:08:20');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_pending`
--

CREATE TABLE `password_reset_pending` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `otp_hash` varchar(255) NOT NULL,
  `expires_at` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_pending`
--

CREATE TABLE `registration_pending` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `otp_hash` varchar(255) NOT NULL,
  `expires_at` int(11) NOT NULL,
  `reg_data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `role` enum('admin','borrower','accountant') DEFAULT 'borrower',
  `profile_photo` varchar(255) DEFAULT NULL,
  `deped_id` varchar(50) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civil_status` varchar(20) DEFAULT NULL,
  `home_address` text DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_status` varchar(20) NOT NULL DEFAULT 'active',
  `last_login_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `full_name`, `role`, `profile_photo`, `deped_id`, `contact_number`, `birth_date`, `gender`, `civil_status`, `home_address`, `first_name`, `middle_name`, `surname`, `created_at`, `user_status`, `last_login_at`) VALUES
(13, 'sdoofcabuyao', 'sdoofcabuyao@gmail.com', '$2y$10$UddLxDfVwxHcsjVV3HmbBO01FxySkn9h.bmi7sO00sgvdDJ6gbeMO', 'SDO Cabuyao', 'admin', 'uploads/profile_pictures/user_13_1771897015.jpg', '2222222', '09999999999', NULL, NULL, NULL, 'dawdawdaw', NULL, NULL, NULL, '2026-02-24 00:33:42', 'active', '2026-04-09 08:31:26'),
(19, 'marjoohn', 'refreamarjohn91@gmail.com', '$2y$10$BYhGgimg.Pr9WSFxvuu/.eeEYbutBHh0jMqGDJZLZMooBWSB..m.q', 'Mar John Santiago Refrea', 'borrower', 'uploads/profile_pictures/user_19_1774939803.jpg', '0720024', '09283262333', '2001-12-15', 'Male', 'Single', '0175 Purok 1, Brgy. Butong, Cabuyao, Laguna 4025', 'Mar John', 'Santiago', 'Refrea', '2026-03-24 00:08:59', 'active', '2026-04-09 08:25:39'),
(20, 'Macky', 'marjohnrefrea1215@gmail.com', '$2y$10$Mciuq8ej91.5rUEY4nvwGur5GLF47ACe15mJN5./qNmIqB5QYOjPm', 'Mar John Santiago Refrea', 'borrower', NULL, '1234567', '09283262333', '2001-12-15', 'Male', 'Single', '0175 Purok 1, Brgy. Butong, Cabuyao, Laguna 4025', 'Mar John', 'Santiago', 'Refrea', '2026-04-06 01:00:58', 'active', '2026-04-06 01:01:07'),
(23, 'marjohnrefrea12345', 'marjohnrefrea123456@gmail.com', '$2y$10$2rsBEcspCL/3kld.1wqHQO29TsYestkb.AFRVNSEkFvtlDLpm7kn2', 'Refrea, Mario Santiago', 'borrower', NULL, '1234562', '09999999999', NULL, NULL, NULL, NULL, 'Mario', 'Santiago', 'Refrea', '2026-04-06 02:31:51', 'active', '2026-04-06 02:35:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_actor_id` (`actor_id`),
  ADD KEY `idx_action_type` (`action_type`),
  ADD KEY `idx_user_role` (`user_role`),
  ADD KEY `idx_page_name` (`page_name`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_id` (`loan_id`),
  ADD KEY `borrower_id` (`borrower_id`),
  ADD KEY `posted_by` (`posted_by`);

--
-- Indexes for table `fund_ledger`
--
ALTER TABLE `fund_ledger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `loan_skip_months`
--
ALTER TABLE `loan_skip_months`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_loan_skip` (`loan_id`,`skip_ym`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_is_read` (`is_read`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `password_reset_pending`
--
ALTER TABLE `password_reset_pending`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Indexes for table `registration_pending`
--
ALTER TABLE `registration_pending`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `fund_ledger`
--
ALTER TABLE `fund_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `loan_skip_months`
--
ALTER TABLE `loan_skip_months`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `password_reset_pending`
--
ALTER TABLE `password_reset_pending`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `registration_pending`
--
ALTER TABLE `registration_pending`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deductions`
--
ALTER TABLE `deductions`
  ADD CONSTRAINT `deductions_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_2` FOREIGN KEY (`borrower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_3` FOREIGN KEY (`posted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `loan_skip_months`
--
ALTER TABLE `loan_skip_months`
  ADD CONSTRAINT `loan_skip_months_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `loan_skip_months_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
