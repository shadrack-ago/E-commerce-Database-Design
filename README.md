# E-commerce-Database-Design

🛤️ Data Flow Plan
Products link to brands and categories.

Products have multiple images, colors, and sizes via variations.

Attributes and attribute categories enrich products with detailed properties.

Users interact primarily with product items representing purchasable variants.

📈 Entity-Relationship Diagram (ERD)
We carefully mapped out:

Primary Keys (PK)

Foreign Keys (FK)

Cardinality (1:1, 1:N, N:M)

Constraints to ensure data integrity

🖼️ Find the ERD inside the /ERD folder in this repository.

👥 Team Collaboration
Regular virtual meetings for progress check-ins.

Task distribution based on strengths (e.g., schema writing, ERD drawing, validation).

GitHub issues and commits were used to track updates and bugs.

Peer review before each major commit to ensure high-quality code.

🚀 How to Use
Clone this repository:

bash
Copy
Edit
git clone https://github.com/shadrack-ago/e-commerce-database-design.git
Open your MySQL Workbench (or any SQL tool).

Execute the SQL script in ecommerce.sql.

Enjoy your fully functional e-commerce database!

📂 Repository Structure
pgsql
Copy
Edit
/ecommerce-database/
│
├── /ERD/
│   └── ecommerce-erd.png (or .pdf)
│
├── ecommerce.sql  (full database creation script)
│
└── README.md
✨ Lessons Learned
Importance of normalization to eliminate redundancy.

Use of indexes to optimize queries.

Teamwork and version control in large SQL projects.

Real-world e-commerce system thinking and problem-solving.

📢 Contact
For any queries, suggestions, or collaboration, feel free to reach out!

⭐ Final Note
"A great database is like a strong foundation — it makes everything else possible!"


