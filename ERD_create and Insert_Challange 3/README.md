# Challange Chapter 3 - Basic Banking System

## Study Case

🚩A bank wants to create a system to track customer, account, and transaction information. They want you to design a database that meets their needs

## Criteria to be accomplished:

## The steps:

1. Identify the involved entities (Customer, Account, Transaction).
2. Determine relevant attributes for each entity.
3. Specify relationships between entities.
4. Define the direction of relationships and cardinalities (e.g., one-to-many).
5. Create an ERD diagram.
6. Create SQL to define tables.
7. Create SQL for CRUD operations on the existing tables.

## Criteria to be accomplished:

- Analyze the data structure in challenge 2.
- Design a simple Entity Relationship Diagram (ERD) that includes the necessary tables.
- Create an SQL file named create_and_insert.sql.
- Write SQL commands to create tables according to the designed ERD.
- Populate the SQL file with SQL commands to insert initial data into the tables.
- Entities: Customer (Nasabah), Account (Akun), and Transaction (Transaksi)
- Relationships:

1. One Customer can have multiple Accounts, but each Account is owned by only one Customer.
2. One Account can have multiple Transactions, but each Transaction is associated with only one Account
