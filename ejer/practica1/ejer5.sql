SET SERVEROUTPUT ON;
SET VERIFY OFF;

declare
	CURSOR TRABAJADORES is SELECT EMPLOYEE_ID,SALARY,COMMISSION_PCT FROM EMPLPOYEES;
	ID EMPLPOYEES.EMPLOYEE_ID%type;
	SALARIO EMPLPOYEES.SALARY%type;
	COMISION EMPLPOYEES.COMMISSION_PCT%type;
begin
	open TRABAJADORES; 
		LOOP  
			fetch TRABAJADORES into ID,SALARIO,COMISION ;
			EXIT WHEN TRABAJADORES%NOTFOUND;
			IF SALARIO >10000
				INSERT INTO RICOS(EMPLOYEE_ID,SALARY,COMMISSION_PCT)VALUES(ID,SALARIO,COMISION)
			ELSE IF SALARIO<5000
				INSERT INTO RICOS(EMPLOYEE_ID,SALARY,COMMISSION_PCT)VALUES(ID,SALARIO,COMISION)
			END IF;
		end loop;
	close TRABAJADORES;

end;
/