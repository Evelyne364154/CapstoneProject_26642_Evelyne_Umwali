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

## Phase III

### 🤯 Logical Model Design

| Entity                | Attributes                                            | PK / FK                             | Data Types                 |
| --------------------- | ----------------------------------------------------- | ----------------------------------- | -------------------------- |
| **User**              | user\_id, name, email, phone\_number                  | PK: user\_id                        | INT, VARCHAR, VARCHAR      |
| **Transaction**       | transaction\_id, user\_id, amount, date, status       | PK: transaction\_id<br>FK: user\_id | INT, DECIMAL, DATE, ENUM   |
| **BiometricData**     | biometric\_id, user\_id, biometric\_hash, created\_at | PK: biometric\_id<br>FK: user\_id   | INT, VARCHAR, TIMESTAMP    |
| **AuthenticationLog** | log\_id, transaction\_id, status, timestamp, remarks  | PK: log\_id<br>FK: transaction\_id  | INT, ENUM, TIMESTAMP, TEXT |

### 🔃 2. Relationships & Constraints

#### Relationships

- User ↔ BiometricData: One-to-One

One user has one biometric record.

- User ↔ Transaction: One-to-Many

One user can perform many transactions.

- Transaction ↔ AuthenticationLog: One-to-One

One log entry per transaction authentication attempt.

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

### 📝 5. Presentation & Review
Presentation of the logical model with a clear ER diagram 

![ER Diagram PL](https://github.com/user-attachments/assets/2e06cc98-ecff-4971-a41e-77ee457ffee9)



