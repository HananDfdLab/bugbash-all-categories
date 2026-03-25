"""Intentionally vulnerable Python application for security scanning tests."""

import subprocess
import os

# Hardcoded credentials (secret scanning / code scanning)
DB_PASSWORD = "SuperSecret123!"
API_KEY = "sk-proj-abc123def456"

def unsafe_eval(user_input):
    """Dangerous use of eval() with user input."""
    result = eval(user_input)
    return result

def unsafe_command(user_input):
    """Command injection via shell=True."""
    output = subprocess.check_output(
        f"echo {user_input}",
        shell=True
    )
    return output.decode()

def validate_age(age):
    """Assert used for validation (stripped in optimized mode)."""
    assert age >= 0, "Age must be non-negative"
    assert age < 150, "Age must be reasonable"
    return age

def get_db_connection():
    """Uses hardcoded password."""
    conn_string = f"postgresql://admin:{DB_PASSWORD}@localhost:5432/mydb"
    return conn_string

if __name__ == "__main__":
    user_data = input("Enter expression: ")
    print(unsafe_eval(user_data))
    print(unsafe_command(user_data))
