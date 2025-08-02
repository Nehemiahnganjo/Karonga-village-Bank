-- phpMyAdmin SQL Dump
-- version 5.2.2-1.fc42
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 01, 2025 at 09:35 AM
-- Server version: 8.0.42
-- PHP Version: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank_mmudzi`
--

-- --------------------------------------------------------

--
-- Table structure for table `AuditLog`
--

CREATE TABLE `AuditLog` (
  `audit_id` int NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `operation` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `record_id` int NOT NULL,
  `old_values` json DEFAULT NULL,
  `new_values` json DEFAULT NULL,
  `user_id` varchar(50) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `AuditLog`
--

INSERT INTO `AuditLog` (`audit_id`, `table_name`, `operation`, `record_id`, `old_values`, `new_values`, `user_id`, `timestamp`, `ip_address`, `user_agent`) VALUES
(1, 'Members', 'INSERT', 1, NULL, '{\"name\": \"Sipho\", \"email\": \"\", \"status\": \"active\", \"surname\": \"Nganjo\", \"join_date\": \"2025-07-29\", \"member_id\": 1, \"phone_number\": \"+265997082156\", \"member_number\": \"BM-2025-4895\"}', 'admin', '2025-07-29 07:41:35', 'localhost', 'system'),
(2, 'Members', 'INSERT', 2, NULL, '{\"name\": \"Test\", \"email\": \"test@example.com\", \"status\": \"active\", \"surname\": \"User\", \"join_date\": \"2025-07-29\", \"member_id\": 2, \"phone_number\": \"+265123456789\", \"member_number\": \"BM-2025-6463\"}', 'system', '2025-07-29 08:07:43', 'localhost', 'system'),
(3, 'Members', 'INSERT', 3, NULL, '{\"name\": \"Test\", \"email\": \"test@example.com\", \"status\": \"active\", \"surname\": \"User\", \"join_date\": \"2025-07-29\", \"member_id\": 3, \"phone_number\": \"+265123456789\", \"member_number\": \"BM-2025-6606\"}', 'system', '2025-07-29 08:10:06', 'localhost', 'system'),
(4, 'Members', 'UPDATE', 3, '{\"name\": \"Test\", \"email\": \"test@example.com\", \"surname\": \"User\", \"member_id\": 3, \"phone_number\": \"+265123456789\"}', '{\"name\": \"Updated\", \"email\": \"updated@example.com\", \"surname\": \"User\", \"member_id\": 3, \"phone_number\": \"987654321\"}', 'system', '2025-07-29 08:10:06', 'localhost', 'system'),
(5, 'Members', 'INSERT', 4, NULL, '{\"name\": \"Test\", \"email\": \"test@example.com\", \"status\": \"active\", \"surname\": \"User\", \"join_date\": \"2025-07-29\", \"member_id\": 4, \"phone_number\": \"+265123456789\", \"member_number\": \"BM-2025-6719\"}', 'system', '2025-07-29 08:11:59', 'localhost', 'system'),
(6, 'Members', 'UPDATE', 4, '{\"name\": \"Test\", \"email\": \"test@example.com\", \"surname\": \"User\", \"member_id\": 4, \"phone_number\": \"+265123456789\"}', '{\"name\": \"Updated\", \"email\": \"updated@example.com\", \"surname\": \"User\", \"member_id\": 4, \"phone_number\": \"987654321\"}', 'system', '2025-07-29 08:11:59', 'localhost', 'system'),
(7, 'Members', 'INSERT', 5, NULL, '{\"name\": \"Test\", \"email\": \"test@example.com\", \"status\": \"active\", \"surname\": \"User\", \"join_date\": \"2025-07-29\", \"member_id\": 5, \"phone_number\": \"+265123456789\", \"member_number\": \"BM-2025-6909\"}', 'system', '2025-07-29 08:15:09', 'localhost', 'system'),
(8, 'Members', 'UPDATE', 5, '{\"name\": \"Test\", \"email\": \"test@example.com\", \"surname\": \"User\", \"member_id\": 5, \"phone_number\": \"+265123456789\"}', '{\"name\": \"Updated\", \"email\": \"updated@example.com\", \"surname\": \"User\", \"member_id\": 5, \"phone_number\": \"987654321\"}', 'system', '2025-07-29 08:15:09', 'localhost', 'system'),
(9, 'Contributions', 'INSERT', 1, NULL, '{\"year\": 2025, \"month\": 1, \"amount\": 100.0, \"member_id\": 5, \"contribution_id\": 1, \"contribution_date\": \"2025-07-29\"}', 'system', '2025-07-29 08:15:09', 'localhost', 'system'),
(10, 'Members', 'INSERT', 6, NULL, '{\"name\": \"Test\", \"email\": \"test@example.com\", \"status\": \"active\", \"surname\": \"User\", \"join_date\": \"2025-07-29\", \"member_id\": 6, \"phone_number\": \"+265123456789\", \"member_number\": \"BM-2025-7101\"}', 'system', '2025-07-29 08:18:21', 'localhost', 'system'),
(11, 'Members', 'UPDATE', 6, '{\"name\": \"Test\", \"email\": \"test@example.com\", \"surname\": \"User\", \"member_id\": 6, \"phone_number\": \"+265123456789\"}', '{\"name\": \"Updated\", \"email\": \"updated@example.com\", \"surname\": \"User\", \"member_id\": 6, \"phone_number\": \"987654321\"}', 'system', '2025-07-29 08:18:21', 'localhost', 'system'),
(12, 'Contributions', 'INSERT', 2, NULL, '{\"year\": 2025, \"month\": 1, \"amount\": 100.0, \"member_id\": 6, \"contribution_id\": 2, \"contribution_date\": \"2025-07-29\"}', 'system', '2025-07-29 08:18:21', 'localhost', 'system'),
(13, 'Members', 'INSERT', 7, NULL, '{\"name\": \"Test\", \"email\": \"test@example.com\", \"status\": \"active\", \"surname\": \"User\", \"join_date\": \"2025-07-29\", \"member_id\": 7, \"phone_number\": \"+265123456789\", \"member_number\": \"BM-2025-7302\"}', 'system', '2025-07-29 08:21:42', 'localhost', 'system'),
(14, 'Members', 'UPDATE', 7, '{\"name\": \"Test\", \"email\": \"test@example.com\", \"surname\": \"User\", \"member_id\": 7, \"phone_number\": \"+265123456789\"}', '{\"name\": \"Updated\", \"email\": \"updated@example.com\", \"surname\": \"User\", \"member_id\": 7, \"phone_number\": \"987654321\"}', 'system', '2025-07-29 08:21:42', 'localhost', 'system'),
(15, 'Contributions', 'INSERT', 3, NULL, '{\"year\": 2025, \"month\": 1, \"amount\": 100.0, \"member_id\": 7, \"contribution_id\": 3, \"contribution_date\": \"2025-07-29\"}', 'system', '2025-07-29 08:21:42', 'localhost', 'system'),
(16, 'SECURITY', 'INSERT', 0, NULL, '{\"details\": {\"username\": \"admin\", \"timestamp\": \"2025-08-01 11:04:09\", \"failed_attempts\": 1}, \"violation_type\": \"FAILED_LOGIN_INVALID_PASSWORD\"}', 'system', '2025-08-01 09:04:09', 'localhost', 'system'),
(17, 'SECURITY', 'INSERT', 0, NULL, '{\"details\": {\"username\": \"admin\", \"timestamp\": \"2025-08-01 11:04:09\"}, \"violation_type\": \"FAILED_LOGIN\"}', 'system', '2025-08-01 09:04:09', 'localhost', 'system'),
(18, 'SECURITY', 'INSERT', 0, NULL, '{\"details\": {\"username\": \"admin\", \"timestamp\": \"2025-08-01 11:04:48\", \"failed_attempts\": 2}, \"violation_type\": \"FAILED_LOGIN_INVALID_PASSWORD\"}', 'system', '2025-08-01 09:04:48', 'localhost', 'system'),
(19, 'SECURITY', 'INSERT', 0, NULL, '{\"details\": {\"username\": \"admin\", \"timestamp\": \"2025-08-01 11:04:48\"}, \"violation_type\": \"FAILED_LOGIN\"}', 'system', '2025-08-01 09:04:48', 'localhost', 'system'),
(20, 'Members', 'INSERT', 8, NULL, '{\"name\": \"Simple\", \"email\": \"simple@test.com\", \"status\": \"active\", \"surname\": \"Test\", \"join_date\": \"2025-08-01\", \"member_id\": 8, \"phone_number\": \"+265555123456\", \"member_number\": \"BM-2025-9244\"}', 'system', '2025-08-01 09:07:24', 'localhost', 'system');

-- --------------------------------------------------------

--
-- Table structure for table `Contributions`
--

CREATE TABLE `Contributions` (
  `contribution_id` int NOT NULL,
  `member_id` int NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `late_fee` decimal(10,2) DEFAULT '0.00',
  `contribution_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Contributions`
--

INSERT INTO `Contributions` (`contribution_id`, `member_id`, `month`, `year`, `amount`, `late_fee`, `contribution_date`, `created_at`) VALUES
(1, 5, 1, 2025, 100.00, 0.00, '2025-07-29', '2025-07-29 08:15:09'),
(2, 6, 1, 2025, 100.00, 0.00, '2025-07-29', '2025-07-29 08:18:21'),
(3, 7, 1, 2025, 100.00, 0.00, '2025-07-29', '2025-07-29 08:21:42');

-- --------------------------------------------------------

--
-- Table structure for table `DividendCalculations`
--

CREATE TABLE `DividendCalculations` (
  `calculation_id` int NOT NULL,
  `member_id` int NOT NULL,
  `year` int NOT NULL,
  `total_contributions` decimal(10,2) NOT NULL,
  `total_interest_paid` decimal(10,2) NOT NULL,
  `outstanding_balance` decimal(10,2) NOT NULL,
  `dividend_amount` decimal(10,2) NOT NULL,
  `calculation_date` date NOT NULL,
  `status` enum('calculated','paid','cancelled') DEFAULT 'calculated',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Loans`
--

CREATE TABLE `Loans` (
  `loan_id` int NOT NULL,
  `member_id` int NOT NULL,
  `loan_amount` decimal(10,2) NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  `monthly_payment` decimal(10,2) DEFAULT NULL,
  `total_interest` decimal(10,2) DEFAULT NULL,
  `loan_date` date NOT NULL,
  `status` enum('active','completed','defaulted') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `outstanding_balance` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `LoanSchedule`
--

CREATE TABLE `LoanSchedule` (
  `schedule_id` int NOT NULL,
  `loan_id` int NOT NULL,
  `payment_number` int NOT NULL,
  `payment_date` date NOT NULL,
  `principal_amount` decimal(10,2) NOT NULL,
  `interest_amount` decimal(10,2) NOT NULL,
  `remaining_balance` decimal(10,2) NOT NULL,
  `payment_status` enum('pending','paid','overdue') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Members`
--

CREATE TABLE `Members` (
  `member_id` int NOT NULL,
  `member_number` varchar(20) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Members`
--

INSERT INTO `Members` (`member_id`, `member_number`, `name`, `surname`, `phone_number`, `email`, `join_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'BM-2025-4895', 'Sipho', 'Nganjo', '+265997082156', '', '2025-07-29', 'active', '2025-07-29 07:41:35', '2025-07-29 07:41:35'),
(2, 'BM-2025-6463', 'Test', 'User', '+265123456789', 'test@example.com', '2025-07-29', 'active', '2025-07-29 08:07:43', '2025-07-29 08:07:43'),
(3, 'BM-2025-6606', 'Updated', 'User', '987654321', 'updated@example.com', '2025-07-29', 'active', '2025-07-29 08:10:06', '2025-07-29 08:10:06'),
(4, 'BM-2025-6719', 'Updated', 'User', '987654321', 'updated@example.com', '2025-07-29', 'active', '2025-07-29 08:11:59', '2025-07-29 08:11:59'),
(5, 'BM-2025-6909', 'Updated', 'User', '987654321', 'updated@example.com', '2025-07-29', 'active', '2025-07-29 08:15:09', '2025-07-29 08:15:09'),
(6, 'BM-2025-7101', 'Updated', 'User', '987654321', 'updated@example.com', '2025-07-29', 'active', '2025-07-29 08:18:21', '2025-07-29 08:18:21'),
(7, 'BM-2025-7302', 'Updated', 'User', '987654321', 'updated@example.com', '2025-07-29', 'active', '2025-07-29 08:21:42', '2025-07-29 08:21:42'),
(8, 'BM-2025-9244', 'Simple', 'Test', '+265555123456', 'simple@test.com', '2025-08-01', 'active', '2025-08-01 09:07:24', '2025-08-01 09:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `MemberStatus`
--

CREATE TABLE `MemberStatus` (
  `status_id` int NOT NULL,
  `member_id` int NOT NULL,
  `status` enum('active','inactive','suspended') NOT NULL,
  `status_date` date NOT NULL,
  `notes` text,
  `changed_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Repayments`
--

CREATE TABLE `Repayments` (
  `repayment_id` int NOT NULL,
  `loan_id` int NOT NULL,
  `repayment_amount` decimal(10,2) NOT NULL,
  `principal_amount` decimal(10,2) NOT NULL,
  `interest_amount` decimal(10,2) NOT NULL,
  `repayment_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `applied_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`, `description`, `applied_at`) VALUES
('1.0.0', 'Initial schema setup', '2025-07-28 23:10:50'),
('1.1.0', 'Add audit logging tables', '2025-07-28 23:10:50'),
('1.2.0', 'Add loan schedule and enhanced member tracking', '2025-07-28 23:10:50'),
('1.3.0', 'Add system configuration and dividend calculations', '2025-07-28 23:10:50'),
('1.4.0', 'Add outstanding_balance field to Loans table', '2025-07-28 23:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `Settings`
--

CREATE TABLE `Settings` (
  `setting_name` varchar(50) NOT NULL,
  `setting_value` text NOT NULL,
  `description` text,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SystemConfig`
--

CREATE TABLE `SystemConfig` (
  `config_key` varchar(50) NOT NULL,
  `config_value` text NOT NULL,
  `config_type` enum('string','number','boolean','json') DEFAULT 'string',
  `description` text,
  `is_editable` tinyint(1) DEFAULT '1',
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `SystemConfig`
--

INSERT INTO `SystemConfig` (`config_key`, `config_value`, `config_type`, `description`, `is_editable`, `last_updated`, `updated_by`) VALUES
('account_lockout_minutes', '15', 'number', 'Account lockout duration in minutes', 1, '2025-07-28 23:10:50', NULL),
('auto_refresh_interval', '5', 'number', 'Auto-refresh interval in seconds', 1, '2025-07-28 23:10:50', NULL),
('backup_retention_days', '30', 'number', 'Number of days to keep backup files', 1, '2025-07-28 23:10:50', NULL),
('currency', 'MWK', 'string', 'System currency', 1, '2025-07-28 23:10:50', NULL),
('financial_year_end', '12-31', 'string', 'Financial year end (MM-DD)', 1, '2025-07-28 23:10:50', NULL),
('interest_rate', '0.2', 'number', 'Monthly interest rate for loans', 1, '2025-07-28 23:10:50', NULL),
('loan_term_months', '12', 'number', 'Default loan term in months', 1, '2025-07-28 23:10:50', NULL),
('max_failed_login_attempts', '3', 'number', 'Maximum failed login attempts before lockout', 1, '2025-07-28 23:10:50', NULL),
('monthly_contribution', '1000', 'number', 'Default monthly contribution amount', 1, '2025-07-28 23:10:50', NULL),
('session_timeout_minutes', '30', 'number', 'Session timeout in minutes', 1, '2025-07-28 23:10:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(64) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NULL DEFAULT NULL,
  `failed_login_attempts` int DEFAULT '0',
  `account_locked` tinyint(1) DEFAULT '0',
  `locked_until` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`username`, `password_hash`, `created_at`, `last_login`, `failed_login_attempts`, `account_locked`, `locked_until`) VALUES
('admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', '2025-07-28 23:10:51', '2025-08-01 09:31:22', 0, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AuditLog`
--
ALTER TABLE `AuditLog`
  ADD PRIMARY KEY (`audit_id`);

--
-- Indexes for table `Contributions`
--
ALTER TABLE `Contributions`
  ADD PRIMARY KEY (`contribution_id`),
  ADD UNIQUE KEY `unique_member_month_year` (`member_id`,`month`,`year`);

--
-- Indexes for table `DividendCalculations`
--
ALTER TABLE `DividendCalculations`
  ADD PRIMARY KEY (`calculation_id`),
  ADD UNIQUE KEY `unique_member_year` (`member_id`,`year`);

--
-- Indexes for table `Loans`
--
ALTER TABLE `Loans`
  ADD PRIMARY KEY (`loan_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `LoanSchedule`
--
ALTER TABLE `LoanSchedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD UNIQUE KEY `unique_loan_payment` (`loan_id`,`payment_number`);

--
-- Indexes for table `Members`
--
ALTER TABLE `Members`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `member_number` (`member_number`);

--
-- Indexes for table `MemberStatus`
--
ALTER TABLE `MemberStatus`
  ADD PRIMARY KEY (`status_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `Repayments`
--
ALTER TABLE `Repayments`
  ADD PRIMARY KEY (`repayment_id`),
  ADD KEY `loan_id` (`loan_id`);

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `Settings`
--
ALTER TABLE `Settings`
  ADD PRIMARY KEY (`setting_name`);

--
-- Indexes for table `SystemConfig`
--
ALTER TABLE `SystemConfig`
  ADD PRIMARY KEY (`config_key`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AuditLog`
--
ALTER TABLE `AuditLog`
  MODIFY `audit_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `Contributions`
--
ALTER TABLE `Contributions`
  MODIFY `contribution_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `DividendCalculations`
--
ALTER TABLE `DividendCalculations`
  MODIFY `calculation_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Loans`
--
ALTER TABLE `Loans`
  MODIFY `loan_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `LoanSchedule`
--
ALTER TABLE `LoanSchedule`
  MODIFY `schedule_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Members`
--
ALTER TABLE `Members`
  MODIFY `member_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `MemberStatus`
--
ALTER TABLE `MemberStatus`
  MODIFY `status_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Repayments`
--
ALTER TABLE `Repayments`
  MODIFY `repayment_id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Contributions`
--
ALTER TABLE `Contributions`
  ADD CONSTRAINT `Contributions_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `Members` (`member_id`);

--
-- Constraints for table `DividendCalculations`
--
ALTER TABLE `DividendCalculations`
  ADD CONSTRAINT `DividendCalculations_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `Members` (`member_id`);

--
-- Constraints for table `Loans`
--
ALTER TABLE `Loans`
  ADD CONSTRAINT `Loans_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `Members` (`member_id`);

--
-- Constraints for table `LoanSchedule`
--
ALTER TABLE `LoanSchedule`
  ADD CONSTRAINT `LoanSchedule_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `Loans` (`loan_id`);

--
-- Constraints for table `MemberStatus`
--
ALTER TABLE `MemberStatus`
  ADD CONSTRAINT `MemberStatus_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `Members` (`member_id`);

--
-- Constraints for table `Repayments`
--
ALTER TABLE `Repayments`
  ADD CONSTRAINT `Repayments_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `Loans` (`loan_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
