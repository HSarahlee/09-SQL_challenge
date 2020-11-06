-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "Department" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no","dept_name"
     )
);

CREATE TABLE "Dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL,
    CONSTRAINT "pk_Dept_emp" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Dept_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_Dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "brith_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Department" ADD CONSTRAINT "fk_Department_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Dept_manager" ("dept_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Dept_emp" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Salaries" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Dept_emp" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_title_id" FOREIGN KEY("title_id")
REFERENCES "Employees" ("emp_title_id");
