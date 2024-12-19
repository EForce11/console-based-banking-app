# Console-Based Banking Application

This is a simple console-based banking application written in Python. It allows administrators to manage customer accounts and customers to perform basic banking operations such as deposits, withdrawals, and fund transfers.

## Features

- **Admin Account**:
  - Default setup with one admin account.
  - Ability to create new customer accounts.

- **Customer Account**:
  - Default setup with two sample customer accounts.
  - Deposit and withdrawal functionality.
  - Fund transfers between customers.
  - Logs of the last 5 transactions, including details like type, amount, timestamp, and recipient.

## How to Use

### Prerequisites
- Python 3.7 or higher installed on your system.

### Running the Application
1. Clone or download this repository.
2. Navigate to the project directory.
3. Run the Python script:
   ```bash
   python banking_application.py
   ```

### Admin Login
- Use the following default credentials to log in as admin:
  - Username: `admin`
  - Password: `admin123`

### Customer Login
- Two customer accounts are set up by default:
  - **Customer 1**:
    - Username: `cust1`
    - Password: `pass1`
    - Balance: 1000.0
  - **Customer 2**:
    - Username: `cust2`
    - Password: `pass2`
    - Balance: 1500.0

## File Structure

- `banking_application.py`: Main script containing the application logic.
- `LICENSE.md`: MIT license file for the project.
- `README.md`: Documentation for the project (this file).

## License

This project is licensed under the MIT License. See the `LICENSE.md` file for details.
