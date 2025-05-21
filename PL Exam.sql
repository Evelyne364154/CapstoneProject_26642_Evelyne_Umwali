

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








DELETE FROM authentication_logs
WHERE log_id = 1003;            







-- Update
UPDATE users SET username = 'Evelyne' WHERE user_id = 1;



SELECT 
    user_id, 
    amount,
    RANK() OVER (PARTITION BY user_id ORDER BY amount DESC) AS transaction_rank
FROM transactions
WHERE amount > 1000000;


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

SELECT get_total_amount(1) AS total_spent FROM dual;

EXEC fetch_transactions_by_user(1);

CREATE OR REPLACE PACKAGE biometric_pkg AS
    PROCEDURE fetch_transactions_by_user(p_user_id IN NUMBER);
    FUNCTION get_total_amount(p_user_id IN NUMBER) RETURN NUMBER;
END biometric_pkg;


CREATE OR REPLACE PACKAGE biometric_pkg IS
  PROCEDURE fetch_transactions_by_user(p_user_id NUMBER);
END biometric_pkg;

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

BEGIN
  biometric_pkg.fetch_transactions_by_user(1);
END;

CREATE TABLE holidays (
    holiday_date DATE PRIMARY KEY,
    description VARCHAR2(100)
);


INSERT INTO holidays VALUES (TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'Independence Day');
INSERT INTO holidays VALUES (TO_DATE('2025-06-25', 'YYYY-MM-DD'), 'Liberation Day');


CREATE OR REPLACE TRIGGER trigger_weekday_holiday
BEFORE INSERT OR UPDATE OR DELETE ON transactions
FOR EACH ROW
DECLARE
    v_day VARCHAR2(10);
    v_today DATE := TRUNC(SYSDATE);
    v_next_month_start DATE := TRUNC(ADD_MONTHS(SYSDATE, 1), 'MM');
    v_next_month_end DATE := LAST_DAY(v_next_month_start);
    v_is_holiday NUMBER := 0;
BEGIN
   
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


CREATE TABLE audit_log (
    log_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    action_type VARCHAR2(10),
    table_name VARCHAR2(50),
    user_name VARCHAR2(50),
    action_time TIMESTAMP DEFAULT SYSTIMESTAMP,
    old_data CLOB,
    new_data CLOB
);

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

CREATE OR REPLACE TRIGGER trg_restrict_weekday_holiday_dml
BEFORE INSERT OR UPDATE OR DELETE ON transactions
FOR EACH ROW
DECLARE
    v_day VARCHAR2(10);
    v_today DATE := TRUNC(SYSDATE);
    v_next_month_start DATE := TRUNC(ADD_MONTHS(SYSDATE, 1), 'MM');
    v_next_month_end DATE := LAST_DAY(v_next_month_start);
    v_is_holiday NUMBER := 0;
BEGIN
    -- Check if today is a weekday (MonFri)
    SELECT TO_CHAR(v_today, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') INTO v_day FROM dual;
    IF v_day IN ('MON', 'TUE', 'WED', 'THU', 'FRI') THEN
        RAISE_APPLICATION_ERROR(-20001, 'DML operations are not allowed on weekdays.');
    END IF;

    -- Check if today is a holiday in the next month
    SELECT COUNT(*) INTO v_is_holiday
    FROM holidays
    WHERE holiday_date = v_today
      AND holiday_date BETWEEN v_next_month_start AND v_next_month_end;

    IF v_is_holiday > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'DML operations are not allowed on public holidays.');
    END IF;
END;


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


COMMIT;
