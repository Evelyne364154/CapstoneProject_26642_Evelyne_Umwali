CREATE USER GrpE_26642_Evelyne_BioTxn_DB


IDENTIFIED BY Evelyne;


GRANT CONNECT, RESOURCE, DBA TO GrpE_26642_Evelyne_BioTxn_DB;

SELECT * FROM V$VERSION;

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

SELECT DBMS_XDB_CONFIG.GETHTTPSPORT FROM DUAL;

EXEC DBMS_XDB_CONFIG.SETHTTPSPORT(5500);
SHOW CON_NAME;


SELECT * FROM all_objects a, all_objects b WHERE a.object_id = b.object_id;
SELECT * FROM v$sql_monitor;


sqlplus sys as sysdba
CREATE INDEX idx_logs_user  ON authentication_logs(user_id);
CREATE INDEX idx_logs_tx    ON authentication_logs(transaction_id);
INSERT INTO users (user_id, username, email,created_at)
VALUES (1, 'Niece', 'niece@gmail.com', TO_DATE('2024-05-19','YYYY-MM-DD'));
INSERT INTO users (user_id, username, email, created_at)
VALUES (2, 'lina Umuganwa', 'lina@mail.com', TO_DATE('2024-05-19','YYYY-MM-DD'));
INSERT INTO users (user_id, username,email,created_at)
VALUES (3, 'Racia Akliza' , 'rc@gmail.com',TO_DATE('2024-04-25','YYYY-MM-DD'));

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
         
SELECT t.transaction_id, COUNT(l.log_id) AS attempts
FROM   transactions t
LEFT JOIN authentication_logs l
       ON l.transaction_id = t.transaction_id
GROUP  BY t.transaction_id; 






SELECT user_id
FROM   biometric_data b
LEFT JOIN users u USING (user_id)
WHERE  user_id IS NULL; 




COMMIT;