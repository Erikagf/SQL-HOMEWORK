CREATE TABLE "Department" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_emp" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "Dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "Employees" (
    "emp_no" INTEGER   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "Titles" (
    "emp_no" INTEGER   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

SELECT public."Employees".emp_no, public."Employees".last_name, public."Employees".first_name, public."Employees".gender, public."Salaries".salary
FROM public."Employees"
JOIN public."Salaries"
ON (public."Employees".emp_no = public."Salaries".emp_no);


SELECT first_name, last_name, hire_date 
FROM public."Employees"
WHERE hire_date BETWEEN '1/1/1986' AND '1/1/1987';


SELECT public."Department".dept_no, public."Department".dept_name, public."Dept_manager".emp_no, public."Employees".last_name, public."Employees".first_name, public."Dept_manager".from_date, public."Dept_manager".to_date
FROM public."Department"
JOIN public."Dept_manager"
ON public."Department".dept_no = public."Dept_manager".dept_no
JOIN public."Employees"
ON public."Dept_manager".emp_no = public."Employees".emp_no;

SELECT public."Dept_emp".emp_no, public."Employees".last_name, public."Employees".first_name, public."Department".dept_name
FROM public."Dept_emp"
JOIN public."Employees"
ON public."Dept_emp".emp_no = public."Employees".emp_no
JOIN public."Department"
ON public."Dept_emp".dept_no = public."Department".dept_no;

SELECT first_name, last_name
FROM public."Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

SELECT public."Dept_emp".emp_no, public."Employees".last_name, public."Employees".first_name, public."Department".dept_name
FROM public."Dept_emp"
JOIN public."Employees"
ON public."Dept_emp".emp_no = public."Employees".emp_no
JOIN public."Department"
ON public."Dept_emp".dept_no = public."Department".dept_no
WHERE public."Department".dept_name = 'Sales';

SELECT public."Dept_emp".emp_no, public."Employees".last_name, public."Employees".first_name, public."Department".dept_name
FROM public."Dept_emp"
JOIN public."Employees"
ON public."Dept_emp".emp_no = public."Employees".emp_no
JOIN public."Department"
ON public."Dept_emp".dept_no = public."Department".dept_no
WHERE public."Department".dept_name = 'Sales'
OR public."Department".dept_name = 'Development';

SELECT public."Employees".last_name,
COUNT(last_name) as freq 
FROM public."Employees"
GROUP BY public."Employees".last_name
ORDER BY last_name DESC;

