import datetime

# Initialize data
admin_account = {"username": "admin", "password": "admin123"}
customers = {
    "cust1": {"password": "pass1", "balance": 1000.0, "transactions": []},
    "cust2": {"password": "pass2", "balance": 1500.0, "transactions": []}
}

def log_transaction(customer, transaction_type, amount, recipient=None):
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    log = {
        "type": transaction_type,
        "amount": amount,
        "timestamp": timestamp,
        "recipient": recipient
    }
    customers[customer]['transactions'].append(log)
    if len(customers[customer]['transactions']) > 5:
        customers[customer]['transactions'].pop(0)

def create_customer():
    username = input("Enter new customer username: ")
    if username in customers:
        print("Customer already exists!")
        return
    password = input("Enter new customer password: ")
    customers[username] = {"password": password, "balance": 0.0, "transactions": []}
    print(f"Customer '{username}' created successfully!")

def deposit(customer):
    amount = float(input("Enter deposit amount: "))
    customers[customer]['balance'] += amount
    log_transaction(customer, "Deposit", amount)
    print(f"Deposited {amount:.2f}. New balance: {customers[customer]['balance']:.2f}")

def withdraw(customer):
    amount = float(input("Enter withdrawal amount: "))
    if amount > customers[customer]['balance']:
        print("Insufficient balance!")
        return
    customers[customer]['balance'] -= amount
    log_transaction(customer, "Withdrawal", amount)
    print(f"Withdrew {amount:.2f}. New balance: {customers[customer]['balance']:.2f}")

def transfer(customer):
    recipient = input("Enter recipient username: ")
    if recipient not in customers:
        print("Recipient does not exist!")
        return
    amount = float(input("Enter transfer amount: "))
    if amount > customers[customer]['balance']:
        print("Insufficient balance!")
        return
    customers[customer]['balance'] -= amount
    customers[recipient]['balance'] += amount
    log_transaction(customer, "Transfer", amount, recipient=recipient)
    log_transaction(recipient, "Received", amount, recipient=customer)
    print(f"Transferred {amount:.2f} to {recipient}. New balance: {customers[customer]['balance']:.2f}")

def show_transactions(customer):
    print("Last 5 transactions:")
    for transaction in customers[customer]['transactions']:
        print(transaction)

def admin_menu():
    options = {
        "1": create_customer
    }
    choice = None
    while choice != "2":
        print("\nAdmin Menu")
        print("1. Create Customer Account")
        print("2. Logout")
        choice = input("Enter your choice: ")
        if choice in options:
            options[choice]()
        elif choice == "2":
            print("Logging out...")
        else:
            print("Invalid choice!")

def customer_menu(username):
    options = {
        "1": deposit,
        "2": withdraw,
        "3": transfer,
        "4": show_transactions
    }
    choice = None
    while choice != "5":
        print("\nCustomer Menu")
        print("1. Deposit")
        print("2. Withdraw")
        print("3. Transfer Funds")
        print("4. Show Transactions")
        print("5. Logout")
        choice = input("Enter your choice: ")
        if choice in options:
            options[choice](username)
        elif choice == "5":
            print("Logging out...")
        else:
            print("Invalid choice!")

def main():
    while True:
        print("\nWelcome to Console-Based Banking Application")
        print("1. Admin Login")
        print("2. Customer Login")
        print("3. Exit")
        choice = input("Enter your choice: ")
        if choice == "1":
            username = input("Enter admin username: ")
            password = input("Enter admin password: ")
            if username == admin_account['username'] and password == admin_account['password']:
                admin_menu()
            else:
                print("Invalid admin credentials!")
        elif choice == "2":
            username = input("Enter customer username: ")
            password = input("Enter customer password: ")
            if username in customers and customers[username]['password'] == password:
                customer_menu(username)
            else:
                print("Invalid customer credentials!")
        elif choice == "3":
            print("Thank you for using the banking application. Goodbye!")
            break
        else:
            print("Invalid choice!")

if __name__ == "__main__":
    main()
