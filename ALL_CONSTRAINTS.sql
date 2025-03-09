CREATE OR REPLACE PROCEDURE PROC_ALL_CONSTRAINTS
AS
BEGIN

/******************* ALL CONSTRAINTS WE HAVE APPLY ON A TABLE**************

1. NOT NULL: RESTRICT NULL VALUE BEING INSERTE INTO THE FIELD.

    ✅ Ensures mandatory data for the specified column.
    ✅ If no value is provided during INSERT, it will raise an ORA-01400: cannot insert NULL error.
    ✅ NOT NULL is automatically applied to PRIMARY KEY columns.
    
    CREATE TABLE NOT_NULL_SAMPLE
    (
        ID NUMBER NOT NULL,
        AGE NUMBER
    );
    
2. CHECK: IT VERIFIES THAT ALL VALUES IN THE FIELD IS FOLLOWING THE CONDITION.

    ✅ Ensures data integrity by allowing only values that meet the specified condition.
    ✅ The condition can include comparison operators (=, >, <, etc.) and logical operators (AND, OR, IN, etc.).
    ✅ Can reference only the current row’s values (not other table rows).
    ✅ Supports multiple conditions in one constraint.
    ✅ Cannot include subqueries, functions, or sequences.
    
    
    WAYS TO USE CHECK CONSTRAINTS:
    
    CREATE TABLE CHECK_SAMPLE
    (
        ID NUMBER,
        AGE NUMBER,
        CONSTRAINT AGE_18 CHECK (AGE>=18)
    );
    
    CREATE TABLE CHECK_SAMPLE
    (
        ID NUMBER,
        AGE NUMBER CHECK (AGE<=60)
    );
    
    CREATE TABLE CHECK_SAMPLE
    (
        ID NUMBER,
        AGE NUMBER,
        CLASS NUMBER,
        CONSTRAINT CLASS_CHECK CHECK (CLASS IN (1,2,3,4,5))
    );


3. DEFAULT: AUTOMATICALLY ASSIGN A DEFAULT VALUE IF NO VALUE IS INSERTED IN THE FIELD.
    
    ✅ The DEFAULT value must be a constant, literal, or expression.
    ✅ The DEFAULT value cannot be a subquery or a sequence.
    ✅ The DEFAULT constraint does not override explicitly inserted NULL values.

    CREATE TABLE DEFAULT_SAMPLE
    (
        AGE NUMBER,
        NATIONALITY VARCHAR2(100) DEFAULT 'INDIA'
    );
    
    INSERT INTO DEFAULT_SAMPLE(AGE)
    VALUES(25);
    
    NOW 'INDIA' WILL AUTOMATICALLY BE INSERTED WITH AGE 25.
    
    IF WE EXPLICITLY INSERT NULL VALUE, THEN IT WILL NOT MAKE IT INDIA AS DEFAULT.


4. UNIQUE: ENSURES UNIQUE VALUES TO BE INSERTED INTO THE FIELD.
    
    ✅ Ensures that no duplicate values are entered in the specified column(s).
    ✅ Allows NULL values (unlike PRIMARY KEY).
    ✅ Can be applied to one or more columns.
    ✅ Multiple UNIQUE constraints can exist in a single table.
    ✅ A UNIQUE constraint automatically creates an index on the column(s) for faster lookups.
    ✅ Unlike PRIMARY KEY, UNIQUE does not enforce NOT NULL by default.

    WAYS TO USE UNIQUE:
    
    CREATE TABLE UNIQUE_SAMPLE
    (
        ID NUMBER UNIQUE,
        AGE NUMBER
    );
    
    CREATE TABLE UNIQUE_SAMPLE
    (
        ID NUMBER,
        AGE NUMBER,
        CONSTRAINTS UNIQUE_ID_AND_AGE UNIQUE (ID,AGE)
    );
    
    ALTER TABLE UNIQUE_SAMPLE
    ADD CONSTRAINT UNI_ID UNIQUE (ID);
    

5. PRIMARY KEY: ALREADY DISCUSSED THROUGHLY IN PRIMARY_KEY.sql FILE, PLEASE REFER.

6. FOREIGN KEY: THE FOREIGN KEY CONSTRAINT IS USED TO CREATE A RELATIONSHIP BETWEEN TWO TABLES. 
                IT ENFORCES REFERENTIAL INTEGRITY BY ENSURING THAT THE VALUE IN THE FOREIGN KEY
                MUST MATCH A VALUE IN THE REFERENCED PRIMARY KEY (OR UNIQUE KEY) COLUMN.
    
    ✅ Establishes a parent-child relationship between tables.
    ✅ Ensures referential integrity by restricting invalid data entry.
    ✅ The referenced column must be either a PRIMARY KEY or UNIQUE key.
    ✅ FOREIGN KEY can reference one or more columns (composite key).
    ✅ Supports ON DELETE CASCADE and ON DELETE SET NULL for automatic data handling.
    ✅ A table can have multiple foreign keys referencing different parent tables.


    In PL/SQL, if a parent table has a FOREIGN KEY reference in another table (child table), 
    you cannot drop the parent table directly unless you either:
    Drop the child table first, or
    Remove the FOREIGN KEY constraint from the child table.
    
    
    SYNTAX:
    
    CREATE TABLE departments    -- PARENT TABLE
    (
        dept_id NUMBER PRIMARY KEY,
        dept_name VARCHAR2(50) NOT NULL
    );  
    
    CREATE TABLE employees      -- CHILD TABLE
    (
        emp_id NUMBER PRIMARY KEY,
        emp_name VARCHAR2(50) NOT NULL,
        dept_id NUMBER,
        CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments (dept_id)
    );

    NOW IF WE TRY TO INSERT THE DEPT_ID VALUE IN EMPLOYEES TABLE WHICH IS NOT PRESENT IN
    DEPARTMENTS TABLE, THEN IT WILL THROW THE ERROR.
    
    
    INSERT INTO DEPARTMENTS
    VALUES(1,'IT'); 
    
    INSERT INTO EMPLOYEES
    VALUES(1,'A',1);  -- WILL WORK
    
    INSERT INTO EMPLOYEES
    VALUES(1,'A',2);  -- WILL NOT WORK

    


    
Summary Table of Constraints:

CONSTRAINT	    PURPOSE	                	        ALLOWS NULL?  COMPOSITE?	AUTO INDEX?
NOT NULL	    Ensures the column cannot be NULL   ❌ No	      ❌ No	        ❌ No
UNIQUE	        Ensures all values are unique00 	✅ Yes	      ✅ Yes	        ✅ Yes
PRIMARY KEY	    Ensures uniqueness and no NULL	    ❌ No	      ✅ Yes   	    ✅ Yes
FOREIGN KEY	    Ensures referential integrity	    ✅ Yes	      ✅ Yes	        ❌ No
CHECK	        Enforces specific conditions	    ✅ Yes	      ❌ No	        ❌ No
DEFAULT	        Sets a default value for the column	✅ Yes	      ❌ No	        ❌ No


**************************************************************************/


DBMS_OUTPUT.PUT_LINE('HY, THANKS FOR VISITING');
END;
