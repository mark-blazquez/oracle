SET SERVEROUTPUT ON;
SET VERIFY OFF;
declare
  NOMBRE EMPLOYEES.FIRST_NAME%TYPE;
  APELLIDO EMPLOYEES.LAST_NAME%TYPE;
  IDTRABAJO EMPLOYEES.employee_id%TYPE;
  IDDEPAR JOB_HISTORY.DEPARTMENT_ID%TYPE;
  NOMBREDEPAR DEPARTMENTS.DEPARTMENT_NAME%TYPE;

begin
 	--selecciona los antiguos puesto de trabajo
	---select department_name from departments where department_id=(select department_id from job_history where employee_id=(select employee_id from employees where first_name='&nombre' and last_name='&apellido'));
	select EMPLOYEE_ID INTO IDTRABAJO FROM employees where first_name= '&NOMBRE' and last_name='&APELLIDO';
	DBMS_OUTPUT.PUT_LINE(IDTRABAJO);
	SELECT DEPARTMENT_ID INTO IDDEPAR FROM JOB_HISTORY WHERE EMPLOYEE_ID=IDTRABAJO;
	DBMS_OUTPUT.PUT_LINE(IDDEPAR);
	SELECT DEPARTMENT_NAME INTO NOMBREDEPAR FROM DEPARTMENTS WHERE DEPARTMENT_ID=IDDEPAR;
	DBMS_OUTPUT.PUT_LINE(NOMBREDEPAR);

EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE('NO HAY DATOS QUE MOSTRAR');
	WHEN TOO_MANY_ROWS THEN
	DBMS_OUTPUT.PUT_LINE('ha surgido un error al mostrar varios anteriores puestos de trabajo');

end;
/

