.Smart Ramadan Distribution Database.

Project Overview

This project is a database system designed to manage food distribution during Ramadan.
The system helps organizations track warehouses, food inventory, donations, volunteers, and beneficiary families to ensure fair and organized distribution.

The database is implemented using SQL and follows relational database principles.

---

Database Tables

The system consists of 8 main tables:

1. Warehouses
  Stores information about food storage locations.

2. Food_Categories
   Stores different types of food and their storage requirements.

3. Inventory_Items
   Stores food items available in warehouses including quantity and expiry date.

4. Donations_Log
   Stores donation records including donor name, donation type, and amount.

5. Users_Master
   Stores all system users including admins, volunteers, drivers, and beneficiaries.

6. Beneficiary_Details
   Stores additional information about families receiving aid such as poverty score and last received date.

7. Volunteer_Skills
   Stores volunteer skills and experience.

8. Training_Sessions
   Stores training sessions provided to volunteers and drivers.

---

System Rules (Triggers)

The system uses database triggers to enforce rules:

- Expired food cannot be added to the inventory.
- A family cannot receive another food box within 15 days.

These rules help maintain food safety and fair distribution.

---

SQL Queries

The database includes queries such as:

- Finding fresh food items expiring within 48 hours in Zanaziq Warehouse.
- Finding drivers who have not completed safety training.
- Finding families with high poverty scores who have not received aid recently.
- Calculating total cash donations grouped by organization type.

---

Technical Concepts

Database Indexing

Indexes are used to improve database performance by speeding up search operations.

Triggers

Triggers automatically execute when certain database events occur such as INSERT or UPDATE.

Backup and Recovery

Regular backups should be performed to prevent data loss and ensure system recovery in case of failure.

---

Conclusion

This database system provides an organized solution for managing Ramadan food distribution operations.
It demonstrates the use of SQL tables, relationships, queries, and database management concepts.