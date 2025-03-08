CREATE OR REPLACE PROCEDURE PROC_PRIMARY_KEY
AS
BEGIN

/************************ Primary Key ************************

A Primary Key is a constraint that ensures each row in a table is uniquely identifiable. 
It is one of the most critical constraints used for data integrity.

For creating the PK in a table, there are 3 ways:

1. At the time of creating the table, directly add it after the column on which you want to create

    create table PK_SAMPLE
    (
    id number primary key,
    name varchar2(100)
    );

2. At the time of creating the table, add it using constraint Keyword.

    create table PK_SAMPLE
    (
    id number,
    name varchar2(100),
    CONSTRAINTS PK_01 PRIMARY KEY(ID)
    );


3. By Altering the table.

    ALTER TABLE PK_SAMPLE
    ADD CONSTRAINT PK_01 PRIMARY KEY (ID);


Additional Points:

1. We can create Primary key on multiple columns 

    create table PK_SAMPLE
    (
    id number,
    name varchar2(100),
    CONSTRAINTS PK_01 PRIMARY KEY(ID,NAME)
    );

2. DROP Primary Key

    ALTER TABLE PK_SAMPLE
    DROP CONSTRAINT PK_01;
    
            OR
            
    ALTER TABLE PK_SAMPLE
    DROP PRIMARY KEY;
    
3. Disable and enable a Primary Key

    ALTER TABLE PK_SAMPLE
    DISABLE PRIMARY KEY;
    
            AND
            
    ALTER TABLE PK_SAMPLE
    ENABLE PRIMARY KEY;


🔥 Key Points About Primary Keys:
✅ Ensures uniqueness in each row.
✅ Cannot be NULL (automatically adds a NOT NULL constraint).
✅ Only one primary key is allowed per table.
✅ A primary key can include one or more columns (Composite Key).
✅ Automatically creates a unique index for performance optimization.
✅ Often used in joins and foreign key references.


*************************************************************/

DBMS_OUTPUT.PUT_LINE('Hy, Thanks for visiting');


END;
