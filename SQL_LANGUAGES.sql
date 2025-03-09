CREATE OR REPLACE PROCEDURE PROC_SQL_SUBSETS

AS

BEGIN

/******************** SQL SUBSETS *****************************


1. DDL: DATA DEFINITION LANGUAGE: Commands used to create or alter SQL objects:

    CREATE
    DROP
    ALTER
    TRUNCATE
    RENAME
    
2. DML: DATA MANIPULATION LANGUAGE: Commands used to modify the data.

    DELETE
    INSERT
    UPDATE
    MERGE
    
3. DQL: DATA QUERY LANGAUGE: Used to retrieve the data.

    SELECT
    
4. TCL: TRANSACTION CONTROL LANGAUGE: Used to manage SQL Transactions.

    COMMIT
    ROLLBACK
    SAVEPOINT

5. DCL: DATA CONTROL LANGAUGE: Used to control permission and assign rights.

    GRANT
    REVOKE



Summary Table:
Subset	Description	                    Key Commands
DDL	    Defines database structure	    CREATE, ALTER, DROP
DML	    Manipulates data	            INSERT, UPDATE, DELETE
DQL	    Queries data	                SELECT
DCL	    Controls access	                GRANT, REVOKE
TCL	    Manages transactions	        COMMIT, ROLLBACK, SAVEPOINT


**************************************************************/





DBMS_OUTPUT.PUT_LINE('HY, THANKS FOR VISITING');
END;
