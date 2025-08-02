# Design Document

## Overview

This design document outlines the architectural improvements for the Bank Mmudzi system to implement proper financial calculations, enhance data integrity, and add professional banking features. The design maintains the existing Tkinter GUI while significantly improving the backend logic, data validation, and mathematical accuracy.

The core improvement focuses on implementing the correct loan amortization formula and automated dividend distribution system as specified in the financial model, while adding essential features like backup, audit trails, and advanced reporting.

## Architecture

### Current Architecture
- **Presentation Layer**: Tkinter GUI with tabbed interface
- **Business Logic**: Direct function calls for CRUD operations
- **Data Layer**: SQLite database with basic tables

### Improved Architecture
- **Presentation Layer**: Enhanced Tkinter GUI with improved error handling and validation
- **Business Logic Layer**: 
  - Financial calculation engine for loan amortization
  - Dividend distribution calculator
  - Audit trail manager
  - Backup and recovery system
- **Data Access Layer**: Enhanced database operations with transaction management
- **Data Layer**: Extended SQLite schema with audit tables and configuration management

### Key Architectural Patterns
- **Repository Pattern**: Centralized data access with transaction management
- **Service Layer**: Business logic separation from UI concerns
- **Observer Pattern**: Audit trail logging for all financial operations
- **Strategy Pattern**: Configurable calculation methods for different loan types

## Components and Interfaces

### 1. Financial Calculation Engine

```python
class FinancialCalculator:
    def calculate_loan_payment(self, principal: float, monthly_rate: float, months: int) -> float
    def calculate_total_interest(self, principal: float, monthly_payment: float, months: int) -> float
    def generate_amortization_schedule(self, loan_id: int) -> List[AmortizationEntry]
    def calculate_member_dividend(self, member_id: int, year: int) -> float
    def calculate_total_fund(self, year: int) -> float
```

### 2. Audit Trail System

```python
class AuditManager:
    def log_transaction(self, table: str, operation: str, record_id: int, old_values: dict, new_values: dict)
    def get_audit_trail(self, filters: AuditFilter) -> List[AuditEntry]
    def export_audit_log(self, start_date: date, end_date: date, format: str) -> str
```

### 3. Backup and Recovery System

```python
class BackupManager:
    def create_backup(self) -> str
    def restore_from_backup(self, backup_file: str) -> bool
    def cleanup_old_backups(self, retention_days: int)
    def validate_backup_integrity(self, backup_file: str) -> bool
```

### 4. Enhanced Data Validation

```python
class ValidationEngine:
    def validate_member_data(self, member: Member) -> ValidationResult
    def validate_financial_amount(self, amount: float) -> ValidationResult
    def validate_phone_number(self, phone: str) -> ValidationResult
    def check_duplicate_contribution(self, member_id: int, month: int, year: int) -> bool
```

### 5. Report Generation System

```python
class ReportGenerator:
    def generate_monthly_report(self, month: int, year: int) -> Report
    def generate_annual_report(self, year: int) -> Report
    def generate_member_statement(self, member_id: int, year: int) -> Report
    def export_report(self, report: Report, format: str) -> str
```

### 6. Real-time Data Refresh System

```python
class DataRefreshManager:
    def start_auto_refresh(self, interval_seconds: int = 5)
    def stop_auto_refresh(self)
    def register_refresh_callback(self, callback: Callable)
    def trigger_immediate_refresh(self)
    def check_for_data_changes(self) -> bool
```

#### Auto-refresh Implementation Strategy
- **Polling Mechanism**: Check database for changes every 5 seconds
- **Change Detection**: Track last modification timestamps for each table
- **Selective Updates**: Only refresh UI components with actual data changes
- **User Activity Awareness**: Pause auto-refresh during user input to prevent disruption
- **Configurable Intervals**: Allow administrators to adjust refresh frequency

## Data Models

### Enhanced Database Schema

#### New Tables

```sql
-- Audit trail table
CREATE TABLE AuditLog (
    audit_id INTEGER PRIMARY KEY,
    table_name TEXT NOT NULL,
    operation TEXT NOT NULL,
    record_id INTEGER NOT NULL,
    old_values TEXT,
    new_values TEXT,
    user_id TEXT NOT NULL,
    timestamp TEXT NOT NULL
);

-- Loan amortization schedule
CREATE TABLE LoanSchedule (
    schedule_id INTEGER PRIMARY KEY,
    loan_id INTEGER NOT NULL,
    payment_number INTEGER NOT NULL,
    payment_date TEXT NOT NULL,
    principal_amount REAL NOT NULL,
    interest_amount REAL NOT NULL,
    remaining_balance REAL NOT NULL,
    FOREIGN KEY (loan_id) REFERENCES Loans (loan_id)
);

-- System configuration
CREATE TABLE SystemConfig (
    config_key TEXT PRIMARY KEY,
    config_value TEXT NOT NULL,
    description TEXT,
    last_updated TEXT NOT NULL
);

-- Member status tracking
CREATE TABLE MemberStatus (
    member_id INTEGER PRIMARY KEY,
    status TEXT NOT NULL DEFAULT 'active',
    status_date TEXT NOT NULL,
    notes TEXT,
    FOREIGN KEY (member_id) REFERENCES Members (member_id)
);

-- Dividend calculations
CREATE TABLE DividendCalculations (
    calculation_id INTEGER PRIMARY KEY,
    member_id INTEGER NOT NULL,
    year INTEGER NOT NULL,
    total_contributions REAL NOT NULL,
    total_interest_paid REAL NOT NULL,
    outstanding_balance REAL NOT NULL,
    dividend_amount REAL NOT NULL,
    calculation_date TEXT NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Members (member_id)
);
```

#### Enhanced Existing Tables

```sql
-- Add fields to Members table
ALTER TABLE Members ADD COLUMN member_number TEXT UNIQUE;
ALTER TABLE Members ADD COLUMN join_date TEXT;
ALTER TABLE Members ADD COLUMN status TEXT DEFAULT 'active';

-- Add fields to Loans table
ALTER TABLE Loans ADD COLUMN monthly_payment REAL;
ALTER TABLE Loans ADD COLUMN total_interest REAL;
ALTER TABLE Loans ADD COLUMN status TEXT DEFAULT 'active';

-- Add fields to Contributions table
ALTER TABLE Contributions ADD COLUMN year INTEGER;
ALTER TABLE Contributions ADD COLUMN late_fee REAL DEFAULT 0;
```

## Error Handling

### Validation Strategy
- **Input Validation**: All user inputs validated before processing
- **Business Rule Validation**: Financial rules enforced at service layer
- **Database Constraints**: Foreign key and check constraints in database
- **Transaction Management**: All financial operations wrapped in database transactions

### Error Categories
1. **User Input Errors**: Invalid data format, missing required fields
2. **Business Logic Errors**: Insufficient funds, duplicate transactions
3. **System Errors**: Database connection issues, file system problems
4. **Security Errors**: Authentication failures, unauthorized access attempts

### Error Handling Implementation
```python
class BankingException(Exception):
    def __init__(self, message: str, error_code: str, details: dict = None):
        self.message = message
        self.error_code = error_code
        self.details = details or {}

class ValidationError(BankingException):
    pass

class InsufficientFundsError(BankingException):
    pass

class DuplicateTransactionError(BankingException):
    pass
```

## Testing Strategy

### Unit Testing
- **Financial Calculations**: Test loan payment formulas with known values
- **Validation Logic**: Test all validation rules with edge cases
- **Data Access**: Test CRUD operations with mock data
- **Audit Logging**: Verify all operations are properly logged

### Integration Testing
- **Database Operations**: Test complete transaction flows
- **Backup/Restore**: Test backup creation and restoration processes
- **Report Generation**: Test report accuracy with sample data
- **UI Integration**: Test GUI components with business logic

### Test Data Strategy
- **Sample Financial Scenarios**: Based on the provided example calculations
- **Edge Cases**: Zero amounts, maximum values, boundary conditions
- **Error Scenarios**: Invalid inputs, system failures, data corruption

### Mathematical Verification
Using the provided example:
- Member contribution C = 100 MWK
- Loan amount L = 1000 MWK  
- Monthly interest rate r = 0.2 (20%)
- Expected monthly payment P ≈ 221 MWK
- Expected total interest = 1652 MWK
- Expected borrower dividend = 2852 MWK
- Expected non-borrower dividend = 1200 MWK

## Security Enhancements

### Authentication Improvements
- **Password Strength**: Minimum 8 characters, mixed case, numbers, symbols
- **Account Lockout**: 3 failed attempts trigger 15-minute lockout
- **Session Management**: Configurable timeout with activity tracking
- **Password Confirmation**: Required for sensitive operations

### Data Protection
- **Database Encryption**: Sensitive fields encrypted at rest
- **Audit Trail Integrity**: Tamper-evident logging with checksums
- **Backup Security**: Encrypted backup files with secure storage
- **Access Control**: Role-based permissions for different operations

### Security Monitoring
- **Failed Login Tracking**: Log and alert on suspicious activity
- **Data Access Logging**: Track all financial data access
- **System Event Monitoring**: Monitor for unusual system behavior
- **Regular Security Audits**: Automated checks for security compliance

## Performance Considerations

### Database Optimization
- **Indexing Strategy**: Indexes on frequently queried columns
- **Query Optimization**: Efficient queries for large datasets
- **Connection Pooling**: Reuse database connections
- **Batch Operations**: Group related operations for efficiency

### Memory Management
- **Large Dataset Handling**: Pagination for large reports
- **Cache Strategy**: Cache frequently accessed configuration data
- **Resource Cleanup**: Proper disposal of database connections and file handles

### User Experience
- **Progress Indicators**: Show progress for long-running operations
- **Responsive UI**: Non-blocking operations where possible
- **Error Recovery**: Graceful handling of temporary failures
- **Real-time Updates**: Auto-refresh data views to show transactions in real-time