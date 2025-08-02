#!/usr/bin/env python3
"""
Create admin user with proper password
"""

from bank_mmudzi import create_user

def create_admin():
    """Create admin user with strong password"""
    try:
        # Create admin user with strong password
        create_user('admin', 'Admin123!')
        print("✅ Admin user created successfully!")
        print("Username: admin")
        print("Password: Admin123!")
        return True
    except Exception as e:
        print(f"❌ Failed to create admin user: {e}")
        return False

if __name__ == "__main__":
    create_admin()