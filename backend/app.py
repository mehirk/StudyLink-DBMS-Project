from flask import Flask, jsonify
import mysql.connector

app = Flask(__name__)

try:
    print("🟠 Attempting MySQL connection...")
    db = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Vaseline@2203",
        database="StudyLink"
    )
    cursor = db.cursor(dictionary=True)
    print("✅ MySQL connection successful!")
except mysql.connector.Error as err:
    print(f"❌ MySQL Error: {err}")
    exit(1)

@app.route('/courses')
def get_courses():
    print("🟠 Fetching courses...")
    cursor.execute("SELECT * FROM Courses")
    courses = cursor.fetchall()
    return jsonify(courses)

if __name__ == '__main__':
    print("🟢 Starting Flask server...")
    app.run(debug=True, port=5000)  # Explicitly set port