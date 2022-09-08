SET SERVEROUTPUT ON;
SET VERIFY OFF;

declare
	cursor datos is select FIRST_NAME,LAST_NAME from employees;
	nombre varchar(20);
	apellido varchar(20);
begin
	open datos; 
		LOOP  
			fetch datos into nombre,apellido ;
			EXIT WHEN datos%NOTFOUND;
			DBMS_OUTPUT.PUT_LINE('nombre '||nombre||',apellido '||apellido);
		end loop;
	close datos;

	EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE('NO HAY DATOS QUE MOSTRAR');

end;
/