----- ���������� ------
CREATE OR REPLACE PROCEDURE ADD_GENRE(p_genre_name IN VARCHAR2)
AS
  v_genre_id NUMBER;
  v_count NUMBER;
BEGIN
  LOOP
    -- ��������� ���������� ������������ ID
    v_genre_id := TRUNC(DBMS_RANDOM.VALUE(10000, 99999));

    -- �������� �� ������������ ID
    SELECT COUNT(*) INTO v_count
    FROM Genres
    WHERE genre_id = v_genre_id;

    -- ���� ID ��� ����������, ���������������� � ��������� ��������
    EXIT WHEN v_count = 0;
  END LOOP;

  -- ������� ������ �����
  INSERT INTO Genres (genre_id, genre_name)
  VALUES (v_genre_id, p_genre_name);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error adding genre: ' || SQLERRM);
END;




----- ���������� ------
CREATE OR REPLACE PROCEDURE UPDATE_GENRE(OLD_GENRE_NAME IN VARCHAR2, NEW_GENRE_NAME IN VARCHAR2)
AS
BEGIN
  UPDATE GENRES
  SET GENRE_NAME = NEW_GENRE_NAME
  WHERE GENRE_NAME = OLD_GENRE_NAME;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error updating genre: ' || SQLERRM);
END;





----- �������� ------
CREATE OR REPLACE PROCEDURE DELETE_GENRE(P_GENRE_NAME IN VARCHAR2)
AS
BEGIN
  DELETE FROM GENRES
  WHERE GENRE_NAME = P_GENRE_NAME;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error updating genre: ' || SQLERRM);
END;









CREATE OR REPLACE FUNCTION GET_ALL_GENRES
  RETURN SYS.ODCIVARCHAR2LIST
AS
  genre_array SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST(); -- �������� ������� �������
BEGIN
  FOR genre_rec IN (SELECT GENRE_NAME FROM GENRES) LOOP
    genre_array.EXTEND;
    genre_array(genre_array.LAST) := genre_rec.GENRE_NAME;
  END LOOP;
  
  RETURN genre_array;
END;





-----CHECKKKKK-----
BEGIN
  ADD_GENRE('��������');
END;
BEGIN
  UPDATE_GENRE('���', '�������');
END;
BEGIN
  DELETE_GENRE('%D4%E5%ED%F2%E5%E7%E8');
END;
BEGIN
  GET_GENRE();
END;
-------------------



SELECT * FROM GENRES;

