# StudyLink-DBMS-Project

## Database Setup

1. Install [MySQL](https://dev.mysql.com/downloads/).
2. Run the schema script:
   ```bash
   mysql -u your_username -p < sql-scripts/schema.sql
   ```

## Project Setup

1. Create and activate virtual environment:

   ```bash
   # Windows
   python -m venv venv // this creates a new virtual enviornment
   venv\Scripts\activate //this is for activating the venv

   # macOS/Linux
   python -m venv venv 
   source venv/bin/activate
   ```

2. Install dependencies:

   ```bash
   pip install -r requirements.txt
   ```

3. Run the Flask application:
   ```bash
   python backend/app.py
   ```

## Development

- The virtual environment (`venv/`) and `.env` file are excluded from version control
- Dependencies are listed in `requirements.txt`
