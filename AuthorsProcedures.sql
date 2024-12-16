----- ���������� ------
CREATE OR REPLACE PROCEDURE ADD_AUTHOR(P_NAME IN VARCHAR2, 
  P_SURNAME IN VARCHAR2, P_BIRTHDAY IN VARCHAR2,
  p_country in varchar2, p_email IN VARCHAR2)
AS
  v_id NUMBER;
  V_COUNT NUMBER;
  V_BIRTHDAY DATE; -- ����
BEGIN
  LOOP
    -- ��������� ���������� ������������ ID
    v_id := TRUNC(DBMS_RANDOM.VALUE(10000, 99999));

    -- �������� �� ������������ ID
    select count(*) into v_count
    from AUTHORS 
    WHERE author_id = v_id;

    -- ���� ID ��� ����������, ���������������� � ��������� ��������
    EXIT WHEN V_COUNT = 0;
  END LOOP;
  
  -- �������������� ������ � ����
  V_BIRTHDAY := TO_DATE(P_BIRTHDAY, 'DD-MM-YYYY');
  
  INSERT INTO AUTHORS
  VALUES (v_id, p_name, p_surname, V_BIRTHDAY, p_country, p_email);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    rollback;
    DBMS_OUTPUT.PUT_LINE('Error adding author: ' || SQLERRM);
END;

----- ���������� ------
create or replace procedure UPDATE_AUTHOR(
  P_ID IN VARCHAR2, NEW_NAME IN VARCHAR2, 
  NEW_SURNAME in varchar2, NEW_BIRTHDAY in VARCHAR2,
  NEW_COUNTRY in varchar2, NEW_EMAIL in varchar2)
AS
  V_BIRTHDAY DATE; -- ����
BEGIN
  -- �������������� ������ � ����
  V_BIRTHDAY := TO_DATE(NEW_BIRTHDAY, 'DD-MM-YYYY');
  
  UPDATE AUTHORS
  set FIRST_NAME = NEW_NAME, 
      LAST_NAME = NEW_SURNAME, 
      BIRTH_DATE = V_BIRTHDAY,
      COUNTRY = NEW_COUNTRY,
      EMAIL = NEW_EMAIL
  WHERE AUTHOR_ID = P_ID;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error updating author: ' || SQLERRM);
END;


----- �������� ------
CREATE OR REPLACE PROCEDURE DELETE_AUTHOR(P_ID IN NUMBER)
AS
BEGIN
  DELETE FROM AUTHORS
  WHERE AUTHOR_ID = P_ID;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error deliting author: ' || SQLERRM);
END;



select * from AUTHORS;




