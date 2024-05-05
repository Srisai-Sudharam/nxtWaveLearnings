Database - is a collection of tables
Relational Data - data is arranged in rows and columns
RDBMS - is a software that allows you to work with Relational Databases
SQL - Structured Query Language


SQLITE 

creating a table:
   CREATE TABLE person(
      id INT, 
      name VARCHAR(250), 
      dob DATE, -- 'YYYY-MM-DD'
      created_at DATETIME, -- 'YYYY:MM:DD HH:MM:SS'
      isMale BOOLEAN, 
      description TEXT, 

   );

PRAGMA_TABLE_INFO(table_name); -- to get table schema
-----------------------------------------------------------

Inserting into the table:
   INSERT INTO TABLE car(
      model_name, 
      manufactured_year, 
      chasis_no, 
      is_in_good_condition,
      car_description
      
    )
   VALUES("ALTO K 10", "2018-09-12", 187283, true, 
   "An Orange car with two head lights and one extra tyre for emergency.
   1000cc v6 engine ..."), 
   ("suzuki 800", "2015-08-12", 181013, false,
   "An White car with two head lights and one extra tyre for emergency.
   800cc v6 engine needs repair  ...");
-----------------------------------------------------------

updating rows:
   UPDATE 
    player 
   SET 
    score = 100; -- This will set the entire score column to 100
   
   for updating specific row you may use where clause
   UPDATE 
    player 
   SET 
    score = 100
   WHERE 
    id = 10;
-----------------------------------------------------------

Deleting rows:
   DELETE
   FROM 
    table_name -- deletes all rows in the table 
   
   for Deleting specific row you may use where clause
   DELETE
   FROM 
    player 
   WHERE 
    name LIKE "%sai%"; 
-----------------------------------------------------------
 ALTER SCHEMA:

    Adding a column to a table: 

     ALTER TABLE 
      player 
     ADD 
      age INT;

    Renaming a column in a table:

      ALTER TABLE 
       player RENAME COLUMN age TO player_age;
    
    Deleting a column:
      ALTER TABLE 
      player 
      DELETE COLUMN player_age;
-----------------------------------------------------------

DISTINCT can be used with multiple columns:

    SELECT
    DISTINCT column1, 
      column2,..
      columnN
    FROM
      table_name
    WHERE
      [condition];

If we don't specify the data type of columns while creating a table, the database system may use default data types for those columns and the table gets created.

LOGICAL OPERATORS

precedence => NOT > AND > OR

BETWEEN operator is inclusive, i.e., both the lower and upper limit values of the range are included.

While Ordering in Asc the empty string comes First

Note
In SQLite, OFFSET clause should be used after the LIMIT clause.
Default OFFSET value is 0.
In PostgreSQL, the OFFSET clause can be used with or without the LIMIT clause.

While using LIKE operator in sqllite it is doing case insensitive search


Note : 

In CASE clause, if no condition is satisfied, it returns the value in the ELSE part. If we do not specify the ELSE part, CASE clause results in NULL

We can use CASE in various clauses like SELECT, WHERE, HAVING, ORDER BY and GROUP BY.

Q) Get the number of movies with collection greater than or equal to 100 crores, and the movies with collection less than 100 crores.

A)

SELECT
  COUNT(
    CASE
      WHEN collection_in_cr >= 100 THEN 1
    END
  ) AS above_100_cr,
  COUNT(
    CASE
      WHEN collection_in_cr < 100 THEN 1
    END
  ) AS below_100_cr
FROM
  movie;


SQL SET OPERATIONS:

 INTERSECT, MINUS/EXCEPT, UNION, UNION ALL

	**Same number of columns
	**Same datatype
  **Same order

-----------------------------------------------------------
EXPRESSIONS: 

  CONCATINATION expression "||" 

  select 
  movie || "-" || genre AS movie_genre
  from movie;

  NOTE : While using expressions if we divide an integer by another integer then we will get an integer so to get accurate result Typecast either numerator or denominator to FLOAT
         i.e 1/2 = 0 make it 1/2.0 for accurate results 

      SELECT
        *
      FROM
        movie
      WHERE
        (collection_in_cr - budget_in_cr) >= 50;
-----------------------------------------------------------

COMMON CONCEPTS > CODING PRACTICE 7th question, 8th question
JOINS > coding practice 3, use of case in select

VIEW : 

  USAGE -- simplify complex queries(reusing), restrict access to data 

 VIEW is a name to a SQL query
 It is read only
 
 CREATE VIEW view_name AS
 <query>

IN SQLITE 
   to get all views

   SELECT 
     name 
   FROM 
     sqlite_master
   WHERE 
     TYPE = "view";

DROP VIEW view_name;