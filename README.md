# Enterprise GRC Asset & Risk Management Database

## Overview
A fully functional, relational Oracle database designed to manage IT assets, track vulnerabilities, and calculate risk scores for a Governance, Risk, and Compliance (GRC) system. The project demonstrates advanced Database Administration (DBA) and PL/SQL engineering skills.

## Architecture & Technologies
* **RDBMS:** Oracle Database (Dockerized environment)
* **Programming:** SQL, PL/SQL, Bash Shell Scripting
* **Key Concepts:** Temporal Databases, Principle of Least Privilege, Point-in-Time Recovery, Automation.

## Core Features
1. **Advanced PL/SQL Packages:** Encapsulated procedures and functions to calculate risk scores and transfer asset ownership securely using explicit transaction control (`COMMIT`/`ROLLBACK`).
2. **Automated Auditing (Triggers):** Implementation of an invisible audit trail to log every ownership change in real-time.
3. **Data Security (DCL):** Strict user access control. Application users are granted `EXECUTE` privileges on packages without direct table access.
4. **Disaster Recovery (RMAN & Flashback):** Configured the database in `ARCHIVELOG` mode, automated Hot Incremental Backups using a scheduled Bash cron job, and demonstrated Point-in-Time Flashback recovery.
5. **Data Integration:** Exported hierarchical risk reports in structured `XML` format using `XMLELEMENT`.
6. **Task Automation:** Utilized `DBMS_SCHEDULER` to automate routine database maintenance jobs.
