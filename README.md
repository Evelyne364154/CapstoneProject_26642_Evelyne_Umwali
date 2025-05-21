## UMWALI DUSENGE Evelyne

## ID: 26642

## PL/SQL EXAM.

# 🧬 Project Title: BIOMETRIC BASED TRANSACTION SYSTEM

## **🌀 Phase I**

## **Introduction**

In an era where digital transactions are at the core of daily operations across financial, healthcare, educational, and government sectors, ensuring secure and reliable authorization methods has become critical. Traditional security approaches—such as PINs, passwords, and security tokens—are increasingly vulnerable to breaches, identity theft, and social engineering attacks. To address these challenges, the Biometric-Based Transaction Authorization System offers a modern, robust, and user-friendly solution.

The Biometric-Based Transaction Authorization System not only enhances the security of transactions but also streamlines the user experience by eliminating the need to remember complex credentials. , the system adapts to diverse environments where authentication matters most.

By integrating advanced biometric authentication mechanisms, this system aims to redefine trust and security in digital transactions, ensuring privacy, accuracy, and compliance with modern data protection standards.

## 🎯 **Problem Statement**

Traditional transaction authorization methods—such as passwords, PINs, and security tokens—are vulnerable to security breaches, identity theft, and human error. These methods lack robust verification of a user’s identity, especially in high-risk sectors involving sensitive or high-value transactions. The absence of strong authentication mechanisms increases the risk of fraud and unauthorized access to financial or confidential data.

## 👁️ **Context**

This system is intended for use in environments where secure, fast, and reliable transaction authorization is critical. Target sectors include:

- Banks and financial institutions for customer identity verification during high-value transactions.

- Hospitals and healthcare systems for secure access to patient records and authorization of critical medical procedures.

- Government offices for validating citizen identity in public service transactions.

- Universities and educational institutions for secure student or staff transactions (e.g., exam registrations, access to digital resources).

- The system can be integrated into both physical point-of-sale systems and online transaction platforms, ensuring versatility in deployment.

### 🧑‍💼 **Target Users**

- 🏦 Bank customers and staff performing or validating transactions.

- 🩺 Healthcare professionals accessing or updating medical records.

- 🏛️ Government service agents and citizens involved in secure service delivery.

- 🏢 Students, faculty, and administrators engaging in digital academic services.

- 💼 Business employees and clients requiring secure login and authorization for enterprise transactions.

## **Project Goal**

- Enhance Security: Replace weak password/PIN-based authentication with unique biometric identifiers (e.g., fingerprints, facial recognition).

- Prevent Fraud: Minimize impersonation, unauthorized access, and transaction tampering through multi-factor biometric verification.

- Improve User Experience: Provide fast, seamless, and user-friendly authorization without remembering credentials.

- Ensure Data Integrity and Privacy: Implement encrypted storage and secure transmission of biometric data to comply with data protection regulations.

- Support Audit and Monitoring: Log and trace every transaction authorization attempt for accountability and legal compliance.


## 🌀 **Phase II**

## 🗺️ **1. Define the Scope**

### 🔄 **Business Process:**

## 📜**Description:**
This process outlines how a financial or institutional system uses biometric data (such as fingerprint, facial recognition, or iris scan) to authorize transactions securely. The process ensures that only verified users can initiate or approve sensitive operations, especially in banking, healthcare, or government service platforms.

### **Objectives**

- Authenticate users with high accuracy using biometric data.

- Prevent unauthorized transactions and reduce fraud.

- Integrate with MIS to log and monitor transaction histories.

- Enable seamless and secure customer service workflows.

## 📈 **Expected Outcomes:**

- Enhanced security and user authentication.

- Reduced transaction fraud and impersonation.

- Improved decision-making through accurate transaction logs and biometric reports.

- Streamlined and auditable approval workflows.
  
## 🧩 **2. Identify Key Entities**

Entity	Role / Description

- Customer/User	Initiates the transaction and provides biometric input.
  
- Authentication_logs: Validates the biometric input against stored biometric records.
  
- Biometric_data:keeps biometric input (e.g., fingerprint or facial recognition).
  
- Transactions: Executes the transaction if authorization is successful.

## 🏊‍♂️ **Swimlanes to Use**

Organize your diagram using the following swimlanes:

- User – Initiates transactions and provides biometric input.

- Biometric Verification System – Handles biometric data matching.

- Transaction Processor – Authorizes and executes transactions.

- Authentication Log Table – Stores success/failure attempts.

- Biometric Data Table – Stores registered biometric data.

## 🖇️ **The presentation of my process visually using  UML/BPMN Notations.**

![pl BPMN](https://github.com/user-attachments/assets/38a171ad-1655-4aa8-9dae-1da10227fa58)


## 💬 **Explanation of the BPMN Diagram**

### ✍️ **Main Components and Their Interactions .**

The diagram consists of four swimlanes representing key entities: User, Transaction System, Biometric Data Table, and Authentication Logs Table. The process begins when a User initiates a transaction, triggering the system to request biometric authentication. The Transaction System captures the user’s biometric input and queries the Biometric Data Table to verify it against stored biometric templates.

A decision gateway evaluates whether the input matches. If authentication is successful, the transaction is processed, and a success log is recorded in the Authentication Logs Table. If the match fails, the transaction is rejected, and a failure log is created. The process then ends by notifying the user of the outcome.

## **👌🏽 How the Process Supports MIS Functions**

This process directly contributes to Management Information Systems (MIS) by:

Enhancing Decision-Making: Each authentication attempt is logged, allowing administrators and auditors to make informed decisions using historical data.

Streamlining Operations: The biometric system automates identity verification, reducing the time and errors associated with manual approvals.

Data Integration: Real-time logs feed into the MIS database, supporting dashboards and analytics tools that monitor user activity and security trends.

### 👌🏽 **Importance for Organizational Efficiency**
Implementing biometric-based authorization reduces fraud and unauthorized access, thereby increasing trust and security. It ensures that only verified users can complete sensitive transactions, which improves both data integrity and operational reliability. Furthermore, automation reduces reliance on human verification, thereby lowering overhead and speeding up processes.

This system also enables real-time monitoring, giving managers access to accurate, up-to-date information for faster incident response and better resource allocation—key goals of any modern MIS.

## 🌀 **Phase III**

### 🔢 **Logical Model Design**

| Entity                | Attributes                                            | PK / FK                             | Data Types                 |
| --------------------- | ----------------------------------------------------- | ----------------------------------- | -------------------------- |
| **User**              | user\_id, username, email, created\_at                  | PK: user\_id                        | INT, VARCHAR, VARCHAR,DATE     |
| **Transaction**       | transaction\_id, user\_id,trancation\_type, amount, transaction\_time       | PK: transaction\_id<br>FK: user\_id | INT,VARCHAR , DECIMAL, DATE   |
| **BiometricData**     | user\_id, fingerprint_data, face_scan,iris_scan, created\_at | PK: biometric\_id<br>FK: user\_id   | VARCHAR,VARCHAR, VARCHAR, TIMESTAMP    |
| **AuthenticationLog** | log\_id, transaction\_id, user_id, auth\_status, attempt\_time  | PK: log\_id<br>FK: transaction\_id  | INT, VARCHAR, DATE |

### 🔃 **2. Relationships & Constraints**

#### Relationships
| From Entity | To Entity         | Relationship Type | Description                              |
| ----------- | ----------------- | ----------------- | ---------------------------------------- |
| User        | BiometricData     | One-to-One        | One biometric profile per user           |
| User        | Transaction       | One-to-Many       | Users can perform multiple transactions  |
| Transaction | AuthenticationLog | One-to-One        | Log created per transaction attempt      |
| User        | AuthenticationLog | One-to-Many       | Logs tied to user's transaction attempts |


### **Constraints**

- email, phone_number → UNIQUE NOT NULL

- biometric_hash → NOT NULL

- status in Transaction → ENUM (Pending, Approved, Failed)

- status in AuthenticationLog → ENUM (Success, Failure)

- amount → CHECK (amount > 0)

### 📩 **3. Normalization (Up to 3NF)**

| **Form** | **Explanation**                                                                                    |
| -------- | -------------------------------------------------------------------------------------------------- |
| **1NF**  | All attributes have atomic values. No repeating groups.                                            |
| **2NF**  | Partial dependencies removed (e.g., in AuthenticationLog, `transaction_id` is full PK dependency). |
| **3NF**  | No transitive dependencies (e.g., user contact info is in `User`, not elsewhere).                  |

### 🌍 4. Handling Real-World Data Scenarios

- Supports multiple transactions per user, but only one biometric record per user.

- Logs every transaction attempt with timestamp and result, allowing for auditing.

- Can handle authentication failures (no biometric match) and fraud analysis through remarks

### 📊 **5. Presentation & Review**

Presentation of the logical model with a clear ER diagram 

![ER Diagram PL](https://github.com/user-attachments/assets/e304a1dc-e39a-4d97-bb9c-bb8bb2836403)

### 🌀 **Phase IV**

### **Pluggable database creation**
![pdbs creation](https://github.com/user-attachments/assets/9070771a-45cd-404a-b8bc-6871701f5783)

📠 **What This Phase Covers**
This phase focuses on creating a Pluggable Database (PDB) and converting the logical model into a physical database structure. It ensures that all tables, relationships, and constraints are implemented to meet project requirements.

🔨**Database Creation**
The Pluggable Database (PDB) was created using the following naming format:
```sql
Database Name:wed_26642_biometric_Based_Transaction_System
Username: evelyne
Password: evelyne
```
Steps Executed in SQL Command Prompt
1.Create a pluggable database:
```sql
create pluggable database wed_26642_biometric_Based_Transaction_System
  2  admin user wed_26642_biometric_Based_Transaction_System identified by evelyne
  3  file_name_convert=('D:\ORACLE\ORADATA\ORCADATA\XE\PDBseed\','D:\ORACLE\ORADATA\XE\wed_26642_biometric_Based_Transaction_System\');

 Pluggable database created.
```
2.Open the newly created PDB:

```sql
 alter pluggable database wed_26642_biometric_Based_Transaction_System open ;

Pluggable database altered.
```
Purpose: Makes the PDB active and ready for operations.

3.save the newly created PDB.
```sql
SQL> alter pluggable database tue_falcon_healthandFitnesstrackingSystem save state;

Pluggable database altered.
```
Purpose: Ensures the PDB remains open after the database restarts.

4. Set the Session Container
   
```sql
SQL> alter session set container =wed_26642_biometric_Based_Transaction_System;

Session altered.
```
Purpose: Switches the session to the newly created PDB for subsequent operations.

5.User Creation and Privilege Assignment

Create a Database User
```sql
SQL> create user tue_falcon identified by falcon;

User created.
```
Purpose: Creates a new user, evelyne, with the password evelyne.

Grant Basic Privileges
```sql
 SQL> grant all privileges to tue_falcon;

Grant succeeded.
```
Purpose: To assigns full privileges for database operations.

Code for database creation and table creation

```sql

-- Table creation

CREATE TABLE users (
    user_id NUMBER PRIMARY KEY,
    username VARCHAR2(50) NOT NULL UNIQUE,
    email VARCHAR2(100),
    created_at DATE DEFAULT SYSDATE
);
CREATE TABLE biometric_data (
    user_id NUMBER PRIMARY KEY, 
    fingerprint_data BLOB,
    face_scan BLOB,
    iris_scan BLOB,
    created_at DATE DEFAULT SYSDATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE transactions (
    transaction_id NUMBER PRIMARY KEY,
    user_id NUMBER NOT NULL,
    transaction_type VARCHAR2(50),
    amount NUMBER(10, 2),
    transaction_time DATE DEFAULT SYSDATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE authentication_logs (
    log_id NUMBER PRIMARY KEY,
    transaction_id NUMBER NOT NULL,
    user_id NUMBER NOT NULL,
    auth_status VARCHAR2(20), 
    attempt_time DATE DEFAULT SYSDATE,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
```

### **Oracle Enterprise Manager (OEM)**

Oracle Enterprise Manager (OEM) is not a PL/SQL keyword or feature—it’s Oracle’s web-based administrative console for the entire Oracle technology stack (databases, middleware, engineered systems, cloud services, etc.). When people mention OEM while discussing PL/SQL code, they’re usually talking about using the OEM interface to manage, monitor, or debug that code inside the database.

### ⚖️ **Oracle Enterprise Manager (OEM)**

The OEM interface confirmed:

Successful creation of the database.

Proper implementation of relationships between tables.

### 📸 **OEM confirm successful database creation and table relationships.**

![OEM dashboard](https://github.com/user-attachments/assets/da1887a0-ada6-49dc-9438-1263e42a3706)

![Resourece](https://github.com/user-attachments/assets/e26621ba-00d4-4a08-a6cc-88d8841be41f)

### 🔭 **Conclusion About this phase**

This phase successfully established the pluggable database and implemented the physical structure, enabling efficient data management for the Biometric based transaction system.

## 🌀 **Phase V**

### Physical Database Structure

Physical Database Structure converts the logical Entity-Relationship model into a physical Oracle database structure, implementing all required tables, relationships, and data integrity constraints to support biometric-based authentication for secure financial transactions.

## 🧱 **Table Creation**

Here are the created tables & codes used to create them

📋 **User table** 

```sql
CREATE TABLE users (
    user_id NUMBER PRIMARY KEY,
    username VARCHAR2(50) NOT NULL UNIQUE,
    email VARCHAR2(100),
    created_at DATE DEFAULT SYSDATE
);
```


📋 **Transaction table**


```sql
CREATE TABLE transactions (
    transaction_id NUMBER PRIMARY KEY,
    user_id NUMBER NOT NULL,
    transaction_type VARCHAR2(50),
    amount NUMBER(10, 2),
    transaction_time DATE DEFAULT SYSDATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
```


📋 **Biometric Data table**

```sql
CREATE TABLE biometric_data (
    user_id NUMBER PRIMARY KEY, 
    fingerprint_data BLOB,
    face_scan BLOB,
    iris_scan BLOB,
    created_at DATE DEFAULT SYSDATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
```



📋 **AuthenticationLogs Table**

```sql
CREATE TABLE authentication_logs (
    log_id NUMBER PRIMARY KEY,
    transaction_id NUMBER NOT NULL,
    user_id NUMBER NOT NULL,
    auth_status VARCHAR2(20), 
    attempt_time DATE DEFAULT SYSDATE,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
```



Inserting data

📋 **User table**

```sql

INSERT INTO users (user_id, username, email,created_at)
VALUES (1, 'Niece', 'niece@gmail.com', TO_DATE('2024-05-19','YYYY-MM-DD'));
INSERT INTO users (user_id, username, email, created_at)
VALUES (2, 'lina Umuganwa', 'lina@mail.com', TO_DATE('2024-05-19','YYYY-MM-DD'));
INSERT INTO users (user_id, username,email,created_at)
VALUES (3, 'Racia Akliza' , 'rc@gmail.com',TO_DATE('2024-04-25','YYYY-MM-DD'));

```

📋 **Transaction table**

```sql
         
 INSERT INTO transactions 
         (transaction_id, 
          user_id, 
          transaction_type, 
          amount,
          transaction_time)
    VALUES (101, 
            1, 
           'Payment', 
           2500000,
           SYSDATE);       

INSERT INTO transactions
        (transaction_id,
         user_id,
         transaction_type,
         amount,
         transaction_time)
VALUES  (102,  
         2,             
         'Payment',     
         1000000,        
         SYSDATE);
         
 INSERT INTO transactions
        (transaction_id,
         user_id,
         transaction_type,
         amount,
         transaction_time)
VALUES  (103,
         3,             
         'Deposit',      
         3000000,        
         SYSDATE);
```

📋 **Biometric data table**

```sql
INSERT INTO biometric_data 
        (user_id,
         fingerprint_data, 
         face_scan,
         iris_scan,
         created_at)
 VALUES (1, 
         EMPTY_BLOB(),
         EMPTY_BLOB(),
         EMPTY_BLOB(),
         SYSDATE);
         
INSERT INTO biometric_data
        (user_id,
         fingerprint_data,
         face_scan,
         iris_scan,
         created_at)
VALUES  (2,          
         EMPTY_BLOB(),  
         EMPTY_BLOB(), 
         EMPTY_BLOB(),  
         SYSDATE);   
         
INSERT INTO biometric_data
        (user_id,
         fingerprint_data,
         face_scan,
         iris_scan,
         created_at)
VALUES  (3,          
         EMPTY_BLOB(),  
         EMPTY_BLOB(), 
         EMPTY_BLOB(),  
         SYSDATE);
```


### 📋 **Authentication table**

```sql
   
 INSERT INTO authentication_logs 
         (log_id,
         transaction_id,
         user_id,
         auth_status,
         attempt_time)
      VALUES (1001,
             101,
             1, 
             'SUCCESS',
              SYSDATE);

INSERT INTO authentication_logs
        (log_id,
         transaction_id,
         user_id,
         auth_status,
         attempt_time)
VALUES  (1002,  
         102,   
         2,
         'SUCCESS',     
         SYSDATE);
 
INSERT INTO authentication_logs
        (log_id,
         transaction_id,
         user_id,
         auth_status,
         attempt_time)
VALUES  (1003,  
         103,   
         3,
         'FAIL',     
         SYSDATE);  
```


## **3 ▪ Integrity Validation Queries**

### **Check each transaction has exactly one latest auth result.**

```sql
        
SELECT t.transaction_id, COUNT(l.log_id) AS attempts
FROM   transactions t
LEFT JOIN authentication_logs l
       ON l.transaction_id = t.transaction_id
GROUP  BY t.transaction_id; 
```

![data integrity validation qeuries ](https://github.com/user-attachments/assets/a40be81b-0787-4524-ad40-4cab50e5d77d)

### **Confirm no orphan biometric rows**

An orphan row is a record that has lost (or never had)

If a row in biometrics points to an employee_id that no longer exists (or never existed) in employees, that biometric row is an orphan.

So “orphan biometric rows” simply means biometric-data rows whose foreign-key reference to the parent entity (e.g., employee, user, patient) is broken or missing.

```sql
SELECT user_id
FROM   biometric_data b
LEFT JOIN users u USING (user_id)
WHERE  user_id IS NULL; 
```

![Every user_id present in biometric_data is also present in users (Data Integrity)](https://github.com/user-attachments/assets/b89beab8-31e9-4354-9b2d-c98a63f6c185)

## Phase VI

### 🔄 **Database Interaction and Transactions**

This phase focuses on performing Database Operations (both DML and DDL), utilizing various join types to interact with the database and ensure reliable data management. Additionally, it covers Transaction Management to maintain data consistency and integrity during multi-step operations. This ensures the system remains consistent and accurate when processing multiple transactions.

1. Database Operations
   
### ⚓ **DDL (Data Definition Language)**

Create essential tables for the system

As we have done above DDL is for creating table 

Here is an example of of creating AuthenticationLogs Table

```sql
CREATE TABLE authentication_logs (
    log_id NUMBER PRIMARY KEY,
    transaction_id NUMBER NOT NULL,
    user_id NUMBER NOT NULL,
    auth_status VARCHAR2(20), 
    attempt_time DATE DEFAULT SYSDATE,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
```

![AuthenticationLogs table](https://github.com/user-attachments/assets/8c4e9d43-60cb-4d2a-a5d0-3e71d2aa91a2)

### ❄️ **DML (Data Manipulation Language)**

Insert, update, and delete sample data:

Here is an example of inserting data as we did it in the above queries

```sql
   
 INSERT INTO authentication_logs 
         (log_id,
         transaction_id,
         user_id,
         auth_status,
         attempt_time)
      VALUES (1001,
             101,
             1, 
             'SUCCESS',
              SYSDATE);
```

Updating data in my Database

```sql

-- Update
UPDATE users SET username = 'Evelyne' WHERE user_id = 1;

```

![updating data](https://github.com/user-attachments/assets/9ec0b95a-112b-477e-830e-023419601895)

Here is the table which shows the updated user after using the query

![Table of updated user](https://github.com/user-attachments/assets/122de8cd-cf8b-48d1-b197-446614c5abbb)

Deleting data in database 

```sql
DELETE FROM authentication_logs
WHERE log_id = 1003;  
```

![query to delete data](https://github.com/user-attachments/assets/59c2ae37-6fd2-4fdf-b8a6-f6a952ea8215)

Here is an example of deleted data in Authentication table as we know before we had 3 data inserted in table authentication.So deleted data where log_id=1003

![A table which shows deleted data](https://github.com/user-attachments/assets/78ea97df-8f0d-43f8-b6a7-25135e52c181)

2. Task Requirements

### 🛡️ **Simple Problem Statement**

Problem: Identify users who frequently perform high-value transactions (above a certain threshold) to improve security monitoring.

Use of Windows Functions Example:

```sql
SELECT 
    user_id, 
    amount,
    RANK() OVER (PARTITION BY user_id ORDER BY amount DESC) AS transaction_rank
FROM transactions
WHERE amount > 1000000;
```
![Selecting query](https://github.com/user-attachments/assets/6ecc29f9-961b-4ed4-965c-0624258d1aa3)

3. Procedures and Functions
   
### 🔐 **Procedure to Fetch Transactions by User**

```sql
CREATE OR REPLACE PROCEDURE fetch_transactions_by_user (
    p_user_id IN NUMBER
) AS
BEGIN
    FOR rec IN (
        SELECT * FROM transactions WHERE user_id = p_user_id
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Transaction: ' || rec.transaction_id || ', Amount: ' || rec.amount);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

```
## **Cursors are used implicitly in this section:**

### **🔍 Explanation:**

- The line FOR rec IN (SELECT * FROM transactions WHERE user_id = p_user_id) uses a cursor FOR loop.

- This is an example of a implicit cursor.

- Oracle automatically creates and manages the cursor for the SQL query inside the loop.

- The variable rec represents each row returned by the query.
  
**💡 If you want to use an explicit cursor, here's how you would rewrite it:**

```sql
CREATE OR REPLACE PROCEDURE fetch_transactions_by_user_explicit (
    p_user_id IN NUMBER
) AS
    CURSOR txn_cursor IS
        SELECT * FROM transactions WHERE user_id = p_user_id;
    txn_row txn_cursor%ROWTYPE;
BEGIN
    OPEN txn_cursor;
    LOOP
        FETCH txn_cursor INTO txn_row;
        EXIT WHEN txn_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Transaction: ' || txn_row.transaction_id || ', Amount: ' || txn_row.amount);
    END LOOP;
    CLOSE txn_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

```


### ♻️ **Function to Get Total Transaction Amount** 

```sql
CREATE OR REPLACE FUNCTION get_total_amount (
    p_user_id IN NUMBER
) RETURN NUMBER IS
    total_amt NUMBER := 0;
BEGIN
    SELECT SUM(amount) INTO total_amt FROM transactions WHERE user_id = p_user_id;
    RETURN NVL(total_amt, 0);
EXCEPTION
    WHEN NO_DATA_FOUND THEN RETURN 0;
    WHEN OTHERS THEN RETURN -1;
END;

```

![total amount queries](https://github.com/user-attachments/assets/7819e951-e00e-425b-9fd5-8ca474021cfa)

4. **Testing**
   
Run tests with sample data:

```sql
-- Test procedure
EXEC fetch_transactions_by_user(1);

-- Test function
SELECT get_total_amount(1) AS total_spent FROM dual;

```

5. Packages

### 🚧 **Create Package Specification**

🎡 Create Package Body

```sql
CREATE OR REPLACE PACKAGE biometric_pkg IS
  PROCEDURE fetch_transactions_by_user(p_user_id NUMBER);
END biometric_pkg;

```
You must now write and compile the package body like this:
```sql
CREATE OR REPLACE PACKAGE BODY biometric_pkg IS

  PROCEDURE fetch_transactions_by_user(p_user_id NUMBER) IS
    v_amount transactions.amount%TYPE;
  BEGIN
    FOR rec IN (SELECT transaction_id, amount, transaction_time
                FROM transactions
                WHERE user_id = p_user_id) LOOP
      DBMS_OUTPUT.PUT_LINE('Transaction ID: ' || rec.transaction_id ||
                           ', Amount: ' || rec.amount ||
                           ', Time: ' || rec.transaction_time);
    END LOOP;
  END;

END biometric_pkg;

```

Query for calling procedure

```sql
BEGIN
  biometric_pkg.fetch_transactions_by_user(1);
END;

```
### 🌀**Phase VII**

## 🗂 1. Problem Statement Development
    
### 🔹 Problem Statement:
In the Biometric-Based Transaction Authorization System, it is critical to ensure that all data manipulations—especially those involving sensitive user and transaction records—are tightly controlled, secure, and auditable. This is to prevent unauthorized changes that could compromise data integrity or breach security regulations.

To address this, the system must:

Restrict users (e.g., employees) from performing insert, update, or delete operations during weekdays (Monday–Friday) and on official public holidays.

Log and audit all critical changes to maintain accountability and support forensic reviews.

Use PL/SQL triggers, packages, and functions to automate these controls.

###🔹 Justification:

Triggers are required to enforce time-based and holiday-based restrictions on table manipulations.

Packages and functions provide modular and reusable logic for checking holidays and logging activity.

Auditing enables real-time tracking of sensitive operations to strengthen security and support compliance.

## 📠**2. Trigger Implementation**

###🔹 **Step 1: Holiday Table**

```sql
CREATE TABLE holidays (
    holiday_date DATE PRIMARY KEY,
    description VARCHAR2(100)
);

-- Sample holidays for next month (e.g., June)
INSERT INTO holidays VALUES (TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'Independence Day');
INSERT INTO holidays VALUES (TO_DATE('2025-06-25', 'YYYY-MM-DD'), 'Liberation Day');
COMMIT;

```
**🔹 Step 2: Restriction Trigger**
```sql
CREATE OR REPLACE TRIGGER trg_block_weekday_and_holiday_dml
BEFORE INSERT OR UPDATE OR DELETE ON transactions
FOR EACH ROW
DECLARE
    v_day VARCHAR2(10);
    v_today DATE := TRUNC(SYSDATE);
    v_next_month_start DATE := TRUNC(ADD_MONTHS(SYSDATE, 1), 'MM');
    v_next_month_end DATE := LAST_DAY(v_next_month_start);
    v_count INTEGER;
BEGIN
    -- Check for weekday (Mon–Fri)
    SELECT TO_CHAR(v_today, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') INTO v_day FROM dual;
    IF v_day IN ('MON', 'TUE', 'WED', 'THU', 'FRI') THEN
        RAISE_APPLICATION_ERROR(-20001, 'DML operations are not allowed on weekdays.');
    END IF;

    -- Check for holidays in next month
    SELECT COUNT(*) INTO v_count
    FROM holidays
    WHERE holiday_date = v_today
      AND holiday_date BETWEEN v_next_month_start AND v_next_month_end;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'DML operations are not allowed on public holidays.');
    END IF;
END;

```

## **🧿 1. Simple Trigger Implementation**

This trigger blocks INSERT, UPDATE, DELETE on weekdays and public holidays.

```sql
CREATE OR REPLACE TRIGGER trg
BEFORE INSERT OR UPDATE OR DELETE ON transactions
FOR EACH ROW
DECLARE
    v_day VARCHAR2(10);
    v_today DATE := TRUNC(SYSDATE);
    v_next_month_start DATE := TRUNC(ADD_MONTHS(SYSDATE, 1), 'MM');
    v_next_month_end DATE := LAST_DAY(v_next_month_start);
    v_is_holiday NUMBER := 0;
BEGIN
    -- Check if today is a weekday (Mon–Fri)
    SELECT TO_CHAR(v_today, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') INTO v_day FROM dual;
    IF v_day IN ('MON', 'TUE', 'WED', 'THU', 'FRI') THEN
        RAISE_APPLICATION_ERROR(-20001, 'DML operations are not allowed on weekdays.');
    END IF;

    SELECT COUNT(*) INTO v_is_holiday
    FROM holidays
    WHERE holiday_date = v_today
      AND holiday_date BETWEEN v_next_month_start AND v_next_month_end;

    IF v_is_holiday > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'DML operations are not allowed on public holidays.');
    END IF;
END;
```

## 🔨 **2. Compound Trigger Implementation**

This trigger tracks multiple row changes (bulk operations) and audits them as a group, improving performance and consistency.

```sql
CREATE OR REPLACE TRIGGER trg_audit_transactions_bulk
FOR INSERT OR UPDATE OR DELETE ON transactions
COMPOUND TRIGGER

    TYPE t_log_record IS RECORD (
        action_type VARCHAR2(10),
        table_name  VARCHAR2(50),
        user_name   VARCHAR2(50),
        old_data    CLOB,
        new_data    CLOB
    );

    TYPE t_log_table IS TABLE OF t_log_record INDEX BY PLS_INTEGER;
    v_logs t_log_table;
    v_index PLS_INTEGER := 0;

AFTER EACH ROW IS
BEGIN
    v_index := v_index + 1;
    
    IF INSERTING THEN
        v_logs(v_index).action_type := 'INSERT';
        v_logs(v_index).new_data := 'Amount: ' || :NEW.amount || ', Type: ' || :NEW.transaction_type;
        
    ELSIF UPDATING THEN
        v_logs(v_index).action_type := 'UPDATE';
        v_logs(v_index).old_data := 'Amount: ' || :OLD.amount || ', Type: ' || :OLD.transaction_type;
        v_logs(v_index).new_data := 'Amount: ' || :NEW.amount || ', Type: ' || :NEW.transaction_type;
        
    ELSIF DELETING THEN
        v_logs(v_index).action_type := 'DELETE';
        v_logs(v_index).old_data := 'Amount: ' || :OLD.amount || ', Type: ' || :OLD.transaction_type;
    END IF;

    v_logs(v_index).user_name := USER;
    v_logs(v_index).table_name := 'transactions';
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
    FOR i IN 1 .. v_logs.COUNT LOOP
        INSERT INTO audit_log (action_type, table_name, user_name, old_data, new_data)
        VALUES (
            v_logs(i).action_type,
            v_logs(i).table_name,
            v_logs(i).user_name,
            v_logs(i).old_data,
            v_logs(i).new_data
        );
    END LOOP;
END AFTER STATEMENT;

END trg_audit_transactions_bulk;

```
## **🛰️ 3. Auditing with Restrictions and Tracking**

**🔹 Step 1: Audit Table**

```sql
CREATE TABLE audit_log (
    log_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    action_type VARCHAR2(10),
    table_name VARCHAR2(50),
    user_name VARCHAR2(50),
    action_time TIMESTAMP DEFAULT SYSTIMESTAMP,
    old_data CLOB,
    new_data CLOB
);

```

**Step 2: Audit Trigger**

```sql
CREATE OR REPLACE TRIGGER trg_audit_transactions
AFTER INSERT OR UPDATE OR DELETE ON transactions
FOR EACH ROW
DECLARE
    v_old_data CLOB := NULL;
    v_new_data CLOB := NULL;
BEGIN
    IF INSERTING THEN
        v_new_data := 'Amount: ' || :NEW.amount || ', Type: ' || :NEW.transaction_type;
        INSERT INTO audit_log (action_type, table_name, user_name, new_data)
        VALUES ('INSERT', 'transactions', USER, v_new_data);
        
    ELSIF UPDATING THEN
        v_old_data := 'Amount: ' || :OLD.amount || ', Type: ' || :OLD.transaction_type;
        v_new_data := 'Amount: ' || :NEW.amount || ', Type: ' || :NEW.transaction_type;
        INSERT INTO audit_log (action_type, table_name, user_name, old_data, new_data)
        VALUES ('UPDATE', 'transactions', USER, v_old_data, v_new_data);
        
    ELSIF DELETING THEN
        v_old_data := 'Amount: ' || :OLD.amount || ', Type: ' || :OLD.transaction_type;
        INSERT INTO audit_log (action_type, table_name, user_name, old_data)
        VALUES ('DELETE', 'transactions', USER, v_old_data);
    END IF;
END;


```

**🔹 Step 3: Optional — Use a Package for Auditing**
```sql
CREATE OR REPLACE PACKAGE audit_pkg AS
    PROCEDURE log_action(
        p_action_type IN VARCHAR2,
        p_table_name IN VARCHAR2,
        p_user_name IN VARCHAR2,
        p_old_data IN CLOB,
        p_new_data IN CLOB
    );
END audit_pkg;
/

CREATE OR REPLACE PACKAGE BODY audit_pkg AS
    PROCEDURE log_action(
        p_action_type IN VARCHAR2,
        p_table_name IN VARCHAR2,
        p_user_name IN VARCHAR2,
        p_old_data IN CLOB,
        p_new_data IN CLOB
    ) IS
    BEGIN
        INSERT INTO audit_log (
            action_type, table_name, user_name, old_data, new_data
        ) VALUES (
            p_action_type, p_table_name, p_user_name, p_old_data, p_new_data
        );
    END log_action;
END audit_pkg;

```
