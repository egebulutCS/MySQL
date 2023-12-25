/********************************************************************************/
/*										                                                          */
/*	Kroenke and Auer - Database Concepts (5th Edition) Chapter 03		            */
/*                                                                              */
/*	Wedgewood Pacific Corporation [WPC] Create Tables	             						  */
/*                                                                              */
/*	These are the MySQL 5.1 SQL code solutions			                            */
/*										                                                          */
/*	NOTE: ALTER TABLE statements can been used to set the 		                	*/
/*	MySQL AUTO_INCREMENT to a starting value other than 1. I.e.:	            	*/
/*										                                                          */
/*	ALTER TABLE PROJECT AUTO_INCREMENT=1000;                            				*/
/*										                                                          */
/*	However, the increment is always one (1), so PROJECT ProjectID	          	*/
/* 	values must be manually inserted					                                  */
/*										                                                          */
/********************************************************************************/
CREATE  TABLE DEPARTMENT(
	DepartmentName	Char(35)	      NOT NULL,
	BudgetCode	    Char(30)	      NOT NULL,
	OfficeNumber	  Char(15)	      NOT NULL,
	Phone		        Char(12)	      NOT NULL,
	CONSTRAINT 	    DEPARTMENT_PK 	PRIMARY KEY(DepartmentName)
	);
CREATE  TABLE EMPLOYEE(
	EmployeeNumber	Int 		        NOT NULL AUTO_INCREMENT,
	FirstName	      Char(25) 	      NOT NULL,
	LastName        Char(25) 	      NOT NULL,
	Department	    Char(35)	      NOT NULL DEFAULT 'Human Resources',
	Phone		        Char(12)	      NULL,
	Email 		      VarChar(100)	  NOT NULL UNIQUE,
	CONSTRAINT 	    EMPLOYEE_PK 	  PRIMARY KEY(EmployeeNumber),
	CONSTRAINT 	    EMP_DEPART_FK	  FOREIGN KEY (Department)
					              REFERENCES DEPARTMENT(DepartmentName)
						                      ON UPDATE CASCADE
	);
CREATE  TABLE PROJECT(
  ProjectID	     Int		          NOT NULL,
	ProjectName	   Char(50) 	      NOT NULL,
	Department	   Char(35)	        NOT NULL,
	MaxHours	     Numeric(8,2)	    NOT NULL DEFAULT 100,
  StartDate      DateTime         NULL,
  EndDate		     DateTime	        NULL,
  CONSTRAINT 	   PROJECT_PK 	    PRIMARY KEY (ProjectID),
	CONSTRAINT 	   PROJ_DEPART_FK	  FOREIGN KEY (Department)
					              REFERENCES DEPARTMENT(DepartmentName)
						                      ON UPDATE CASCADE
  );
CREATE  TABLE ASSIGNMENT (
  ProjectID	     Int	 	          NOT NULL,
	EmployeeNumber Int	 	          NOT NULL,
  HoursWorked	   Numeric(6,2)	    NULL,
  CONSTRAINT 	   ASSIGNMENT_PK 	  PRIMARY KEY(ProjectID, EmployeeNumber),
  CONSTRAINT 	   ASSIGN_PROJ_FK   FOREIGN KEY (ProjectID)
              					REFERENCES PROJECT (ProjectID)
						                      ON UPDATE NO ACTION
                      						ON DELETE CASCADE,
  CONSTRAINT 	   ASSIGN_EMP_FK    FOREIGN KEY (EmployeeNumber)
              					REFERENCES EMPLOYEE(EmployeeNumber)
						                      ON UPDATE NO ACTION
                      						ON DELETE NO ACTION
  );

/********************************************************************************/