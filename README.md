## UMWALI DUSENGE Evelyne
## ID: 26642
## PL/SQL EXAM.


### Phase II

###👌🏽  1. Define the Scope
### Business Process:
# Biometric-Based Transaction Authorization System

## 📜 Description:
This process outlines how a financial or institutional system uses biometric data (such as fingerprint, facial recognition, or iris scan) to authorize transactions securely. The process ensures that only verified users can initiate or approve sensitive operations, especially in banking, healthcare, or government service platforms.

Objectives:

- Authenticate users with high accuracy using biometric data.

- Prevent unauthorized transactions and reduce fraud.

- Integrate with MIS to log and monitor transaction histories.

- Enable seamless and secure customer service workflows.

## 🪶 Expected Outcomes:

- Enhanced security and user authentication.

- Reduced transaction fraud and impersonation.

- Improved decision-making through accurate transaction logs and biometric reports.

- Streamlined and auditable approval workflows.
  
## 👌🏽 2. Identify Key Entities

Entity	Role / Description

- Customer/User	Initiates the transaction and provides biometric input.
  
- Authentication_logs: Validates the biometric input against stored biometric records.
  
- Biometric_data:keeps biometric input (e.g., fingerprint or facial recognition).
  
- Transactions: Executes the transaction if authorization is successful.

## 🎨 Swimlanes to Use

Organize your diagram using the following swimlanes:

- User – Initiates transactions and provides biometric input.

- Biometric Verification System – Handles biometric data matching.

- Transaction Processor – Authorizes and executes transactions.

- Authentication Log Table – Stores success/failure attempts.

- Biometric Data Table – Stores registered biometric data.

## 🖇️ The presentation of my process visually using  UML/BPMN Notations.

![pl BPMN](https://github.com/user-attachments/assets/8061254a-2e6a-46c8-b5cf-878f3885cf9a)

## 📘 Explanation of the BPMN Diagram

#### 👌🏽 Main Components and Their Interactions.

The diagram consists of four swimlanes representing key entities: User, Transaction System, Biometric Data Table, and Authentication Logs Table. The process begins when a User initiates a transaction, triggering the system to request biometric authentication. The Transaction System captures the user’s biometric input and queries the Biometric Data Table to verify it against stored biometric templates.

A decision gateway evaluates whether the input matches. If authentication is successful, the transaction is processed, and a success log is recorded in the Authentication Logs Table. If the match fails, the transaction is rejected, and a failure log is created. The process then ends by notifying the user of the outcome.

#### 👌🏽 How the Process Supports MIS Functions

This process directly contributes to Management Information Systems (MIS) by:

Enhancing Decision-Making: Each authentication attempt is logged, allowing administrators and auditors to make informed decisions using historical data.

Streamlining Operations: The biometric system automates identity verification, reducing the time and errors associated with manual approvals.

Data Integration: Real-time logs feed into the MIS database, supporting dashboards and analytics tools that monitor user activity and security trends.

#### 👌🏽 Importance for Organizational Efficiency
Implementing biometric-based authorization reduces fraud and unauthorized access, thereby increasing trust and security. It ensures that only verified users can complete sensitive transactions, which improves both data integrity and operational reliability. Furthermore, automation reduces reliance on human verification, thereby lowering overhead and speeding up processes.

This system also enables real-time monitoring, giving managers access to accurate, up-to-date information for faster incident response and better resource allocation—key goals of any modern MIS.

### Phase III

### 🤯 Logical Model Design

| Entity                | Attributes                                            | PK / FK                             | Data Types                 |
| --------------------- | ----------------------------------------------------- | ----------------------------------- | -------------------------- |
| **User**              | user\_id, username, email, created\_at                  | PK: user\_id                        | INT, VARCHAR, VARCHAR,DATE     |
| **Transaction**       | transaction\_id, user\_id,trancation\_type, amount, transaction\_time       | PK: transaction\_id<br>FK: user\_id | INT,VARCHAR , DECIMAL, DATE   |
| **BiometricData**     | user\_id, fingerprint_data, face_scan,iris_scan, created\_at | PK: biometric\_id<br>FK: user\_id   | VARCHAR,VARCHAR, VARCHAR, TIMESTAMP    |
| **AuthenticationLog** | log\_id, transaction\_id, user_id, auth\_status, attempt\_time  | PK: log\_id<br>FK: transaction\_id  | INT, VARCHAR, DATE |

### 🔃 2. Relationships & Constraints

#### Relationships
| From Entity | To Entity         | Relationship Type | Description                              |
| ----------- | ----------------- | ----------------- | ---------------------------------------- |
| User        | BiometricData     | One-to-One        | One biometric profile per user           |
| User        | Transaction       | One-to-Many       | Users can perform multiple transactions  |
| Transaction | AuthenticationLog | One-to-One        | Log created per transaction attempt      |
| User        | AuthenticationLog | One-to-Many       | Logs tied to user's transaction attempts |


#### Constraints

- email, phone_number → UNIQUE NOT NULL

- biometric_hash → NOT NULL

- status in Transaction → ENUM (Pending, Approved, Failed)

- status in AuthenticationLog → ENUM (Success, Failure)

- amount → CHECK (amount > 0)

### 📩 3. Normalization (Up to 3NF)

| **Form** | **Explanation**                                                                                    |
| -------- | -------------------------------------------------------------------------------------------------- |
| **1NF**  | All attributes have atomic values. No repeating groups.                                            |
| **2NF**  | Partial dependencies removed (e.g., in AuthenticationLog, `transaction_id` is full PK dependency). |
| **3NF**  | No transitive dependencies (e.g., user contact info is in `User`, not elsewhere).                  |

### 📘 4. Handling Real-World Data Scenarios

- Supports multiple transactions per user, but only one biometric record per user.

- Logs every transaction attempt with timestamp and result, allowing for auditing.

- Can handle authentication failures (no biometric match) and fraud analysis through remarks

### 📊 5. Presentation & Review

Presentation of the logical model with a clear ER diagram 

![image](https://github.com/user-attachments/assets/884de30b-967d-4650-bcbb-d65c11cdb089)

#### Phase IV

Database Creation

![Database Creation](https://github.com/user-attachments/assets/6397f192-593b-4120-940c-98da87008025)

Code for database creation and table creation

```sql

//Database creation

CREATE USER GrpE_26642_Evelyne_BioTxn_DB

IDENTIFIED BY Evelyne;

GRANT CONNECT, RESOURCE, DBA TO GrpE_26642_Evelyne_BioTxn_DB;

//Table creation

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
