SET SERVEROUTPUT ON;
SET VERIFY OFF;
declare
  numero1 number(4) := &numero1;
  numero2 number(4) := &numero2;

begin
--in reverse si primero va el mayor
	for i in numero1..numero2
   	loop
		DBMS_OUTPUT.PUT_LINE(i);
	end loop;
	
	EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE('NO HAY DATOS QUE MOSTRAR');
end;
/