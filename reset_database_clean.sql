-- =============================================================================
-- DepEd Loan System — database reset (clean slate)
-- =============================================================================
-- Bago tumakbo: i-backup muna ang database (Export sa phpMyAdmin o mysqldump).
--
-- IMPORTANTE: I-run ang BUONG file nang isang beses (Import o Select All sa SQL tab).
-- Huwag patakbuhin nang paisa-isa ang mga DELETE/TRUNCATE — mag-error sa FK (#1701).
--
-- Ginagawa nito:
--   1. Binubura ang data sa lahat ng table maliban sa `users` (DELETE, hindi TRUNCATE
--      — iwas sa "Cannot truncate a table referenced in a foreign key constraint").
--   2. Sa `users`, tatanggalin ang lahat maliban sa isang admin (minimum id kung marami).
--   3. Admin → `id = 1`, `users` AUTO_INCREMENT = 2.
-- =============================================================================

USE `provident_loan_system`;

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM `deductions`;
DELETE FROM `loan_skip_months`;
DELETE FROM `notifications`;
DELETE FROM `loans`;
DELETE FROM `audit_logs`;
DELETE FROM `fund_ledger`;
DELETE FROM `password_reset_pending`;
DELETE FROM `registration_pending`;

SET FOREIGN_KEY_CHECKS = 1;

-- Alisin ang lahat ng user maliban sa isang admin (pinakamababang id kung may duplicate admin)
DELETE FROM `users`
WHERE `id` NOT IN (
    SELECT `keep_id` FROM (
        SELECT MIN(`id`) AS `keep_id`
        FROM `users`
        WHERE `role` = 'admin' OR `username` = 'admin'
    ) AS `admin_pick`
);

-- Ilagay ang admin sa id = 1 (walang epekto kung id = 1 na)
UPDATE `users` SET `id` = 1 WHERE `id` <> 1 LIMIT 1;

-- Susunod na INSERT sa users ay id = 2
ALTER TABLE `users` AUTO_INCREMENT = 2;

ALTER TABLE `audit_logs` AUTO_INCREMENT = 1;
ALTER TABLE `deductions` AUTO_INCREMENT = 1;
ALTER TABLE `fund_ledger` AUTO_INCREMENT = 1;
ALTER TABLE `loan_skip_months` AUTO_INCREMENT = 1;
ALTER TABLE `notifications` AUTO_INCREMENT = 1;
ALTER TABLE `loans` AUTO_INCREMENT = 1;
ALTER TABLE `password_reset_pending` AUTO_INCREMENT = 1;
ALTER TABLE `registration_pending` AUTO_INCREMENT = 1;
