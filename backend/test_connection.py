import mysql.connector

try:
    print("🟠 Connecting to MySQL...")
    db = mysql.connector.connect(
        host="localhost",
        user="root",
        password="mehir"  # Remove this line if the DB doesn’t exist yet
    )
    print("✅ Connected successfully!")
except mysql.connector.Error as err:
    print(f"❌ Error: {err}")