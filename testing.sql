declare 
begin
for a in 1 .. 100000
LOOP
ADD_AUTHOR('name' || a, 'surname' || a, '11.04,1970', 'country' || a, 'gmail' || a); 
end loop;
END;

SELECT * FROM AUTHORS WHERE FIRST_NAME like 'name1%';


declare
    t1 number := dbms_utility.get_time();
begin
    for r in (SELECT FIRST_NAME FROM AUTHORS WHERE FIRST_NAME like 'name1%') loop null; end loop; 
    dbms_output.put_line('query elapsed: '||(dbms_utility.get_time() - t1)/100); 
END;


create index FIRST_NAME on AUTHORS(FIRST_NAME, LAST_NAME);


drop index FIRST_NAME;


SELECT * FROM AUTHORS;
