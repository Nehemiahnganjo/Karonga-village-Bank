# Requirements Document

## Introduction

This specification outlines improvements to the existing Bank Mmudzi system, a community banking application currently built with Python Tkinter and SQLite. The system implements a specific financial model where members make monthly contributions, can take loans with interest, and receive year-end dividends based on their contributions and loan interest payments.

The current system successfully manages the basic operations but lacks proper implementation of the mathematical loan calculations, automated dividend distribution, and essential banking features such as data backup, audit trails, and robust error handling. These improvements will ensure the system correctly implements the financial model and provides professional banking capabilities.

## Requirements

### Requirement 1

**User Story:** As a bank administrator, I want comprehensive data backup and recovery capabilities, so that I can protect against data loss and ensure business continuity.

#### Acceptance Criteria

1. WHEN the system starts THEN it SHALL automatically create a backup of the database
2. WHEN a backup is created THEN the system SHALL store it with a timestamp in a dedicated backup directory
3. WHEN 30 days have passed THEN the system SHALL automatically delete old backup files to manage storage
4. IF a database corruption occurs THEN the administrator SHALL be able to restore from the most recent backup
5. WHEN a restore operation is initiated THEN the system SHALL validate the backup file integrity before proceeding

### Requirement 2

**User Story:** As a bank administrator, I want detailed audit trails for all financial transactions, so that I can track changes and maintain regulatory compliance.

#### Acceptance Criteria

1. WHEN any financial transaction is created, modified, or deleted THEN the system SHALL log the action with timestamp, user, and details
2. WHEN an audit log entry is created THEN it SHALL include the old and new values for modifications
3. WHEN viewing audit logs THEN the administrator SHALL be able to filter by date range, user, and transaction type
4. WHEN exporting audit logs THEN the system SHALL generate reports in CSV format
5. IF an unauthorized change attempt occurs THEN the system SHALL log the security violation

### Requirement 3

**User Story:** As a bank administrator, I want enhanced data validation and error handling, so that I can prevent data corruption and provide better user feedback.

#### Acceptance Criteria

1. WHEN entering member information THEN the system SHALL validate phone numbers using proper format rules
2. WHEN entering financial amounts THEN the system SHALL prevent negative values and validate decimal precision
3. WHEN a database error occurs THEN the system SHALL display user-friendly error messages instead of technical details
4. WHEN duplicate contributions are attempted for the same member and month THEN the system SHALL prevent the duplicate and show a warning
5. WHEN loan amounts exceed available funds THEN the system SHALL calculate and display available lending capacity

### Requirement 4

**User Story:** As a bank administrator, I want advanced reporting capabilities, so that I can generate comprehensive financial reports for stakeholders.

#### Acceptance Criteria

1. WHEN generating monthly reports THEN the system SHALL include member balances, loan portfolios, and cash flow summaries
2. WHEN creating annual reports THEN the system SHALL calculate year-over-year growth metrics and dividend distributions
3. WHEN exporting reports THEN the system SHALL support both PDF and Excel formats
4. WHEN viewing member statements THEN the system SHALL show transaction history, current balance, and loan status
5. WHEN generating loan reports THEN the system SHALL include repayment schedules and overdue analysis

### Requirement 5

**User Story:** As a bank administrator, I want improved member management features, so that I can better track member status and communications.

#### Acceptance Criteria

1. WHEN adding new members THEN the system SHALL assign unique member numbers automatically
2. WHEN a member becomes inactive THEN the administrator SHALL be able to mark them as inactive without deleting records
3. WHEN viewing member profiles THEN the system SHALL display contribution history, loan history, and current standing
4. WHEN members have outstanding loans THEN the system SHALL calculate and display days overdue
5. WHEN generating member lists THEN the system SHALL support filtering by status, contribution level, and loan status

### Requirement 6

**User Story:** As a bank administrator, I want automated calculation features, so that I can reduce manual errors and improve efficiency.

#### Acceptance Criteria

1. WHEN calculating interest THEN the system SHALL support both simple and compound interest methods
2. WHEN processing monthly contributions THEN the system SHALL automatically calculate penalties for late payments
3. WHEN generating dividend distributions THEN the system SHALL automatically calculate each member's share based on contributions
4. WHEN loan repayments are made THEN the system SHALL automatically update outstanding balances and interest calculations
5. WHEN financial year ends THEN the system SHALL automatically calculate annual summaries and prepare for the new year

### Requirement 7

**User Story:** As a bank administrator, I want enhanced security features, so that I can protect sensitive financial data and prevent unauthorized access.

#### Acceptance Criteria

1. WHEN users log in THEN the system SHALL enforce strong password requirements
2. WHEN multiple failed login attempts occur THEN the system SHALL temporarily lock the account
3. WHEN sensitive operations are performed THEN the system SHALL require password confirmation
4. WHEN the application is idle THEN the system SHALL automatically log out users after a configurable timeout
5. WHEN accessing financial data THEN the system SHALL encrypt sensitive information in the database

### Requirement 8

**User Story:** As a bank administrator, I want proper loan amortization calculations, so that the system correctly implements the mathematical model for loan payments.

#### Acceptance Criteria

1. WHEN a loan is created THEN the system SHALL calculate monthly payment using the formula P = L × [r(1+r)^12]/[(1+r)^12-1]
2. WHEN displaying loan details THEN the system SHALL show the calculated monthly payment amount
3. WHEN processing loan repayments THEN the system SHALL track principal and interest portions separately
4. WHEN a member has both contribution and loan payment THEN the system SHALL calculate total monthly payment as C + P
5. WHEN generating loan schedules THEN the system SHALL show month-by-month breakdown of principal and interest

### Requirement 9

**User Story:** As a bank administrator, I want automated year-end dividend calculations, so that members receive correct dividends based on the financial model.

#### Acceptance Criteria

1. WHEN calculating dividends THEN non-borrowers SHALL receive exactly their total contributions (12C)
2. WHEN calculating dividends THEN borrowers SHALL receive their contributions plus interest paid (12C + interest paid)
3. WHEN a borrower has outstanding loan balance THEN it SHALL be deducted from their dividend
4. WHEN calculating total fund THEN the system SHALL sum all contributions plus all interest payments
5. WHEN distributing dividends THEN the system SHALL ensure total dividends equal the total fund

### Requirement 10

**User Story:** As a bank administrator, I want configuration management capabilities, so that I can customize system settings without code changes.

#### Acceptance Criteria

1. WHEN configuring interest rates THEN the administrator SHALL be able to set monthly interest rates for loans
2. WHEN setting contribution amounts THEN the system SHALL support fixed monthly contribution amounts per member
3. WHEN configuring loan terms THEN the administrator SHALL be able to set loan duration (default 12 months)
4. WHEN customizing reports THEN the administrator SHALL be able to modify report templates and branding
5. WHEN updating system settings THEN changes SHALL take effect immediately without requiring application restart