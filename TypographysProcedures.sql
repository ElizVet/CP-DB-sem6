----- ДОБАВЛЕНИЕ ------
CREATE OR REPLACE PROCEDURE ADD_TYPOGRAPHY(p_name IN VARCHAR2, p_address IN VARCHAR2, p_contact_name IN VARCHAR2)
AS
  v_id NUMBER;
  v_count NUMBER;
BEGIN
  LOOP
    -- Генерация случайного пятизначного ID
    v_id := TRUNC(DBMS_RANDOM.VALUE(10000, 99999));

    -- Проверка на уникальность ID
    SELECT COUNT(*) INTO V_COUNT
    FROM TYPOGRAPHYS
    WHERE TYPOGRAPHY_ID = v_id;

    -- Если ID уже существует, перегенерировать и повторить проверку
    EXIT WHEN v_count = 0;
  END LOOP;

  -- Вставка нового жанра
  INSERT INTO TYPOGRAPHYS
  VALUES (v_id, p_name, p_address, p_contact_name);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error adding typography: ' || SQLERRM);
END;

----- ОБНОВЛЕНИЕ ------
CREATE OR REPLACE PROCEDURE UPDATE_TYPOGRAPHY(OLD_NAME IN VARCHAR2, NEW_NAME IN VARCHAR2, 
  NEW_ADDRESS IN VARCHAR2, NEW_CONTACT_NAME IN VARCHAR2)
AS
BEGIN
  UPDATE TYPOGRAPHYS
  SET TYPOGRAPHY_NAME = NEW_NAME, ADDRESS = NEW_ADDRESS, CONTACT_NUMBER = NEW_CONTACT_NAME
  WHERE TYPOGRAPHY_NAME = OLD_NAME;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error updating typography: ' || SQLERRM);
END;


----- УДАЛЕНИЕ ------
CREATE OR REPLACE PROCEDURE DELETE_TYPOGRAPHY(P_NAME IN VARCHAR2)
AS
BEGIN
  DELETE FROM TYPOGRAPHYS
  WHERE TYPOGRAPHY_NAME = P_NAME;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error deliting typography: ' || SQLERRM);
END;



----- CHECKKKKK -----
BEGIN
  ADD_TYPOGRAPHY('Весна книжная','Корея, г. Сеул, д.13','+542 (55) 543-23-67');
END;
BEGIN
  UPDATE_TYPOGRAPHY('Весна книжная', 'Весна книжная', 'Корея, г. Сеул, д.13','+542(55)543-23-67');
END;
BEGIN
  DELETE_TYPOGRAPHY('Весна книжная');
END;

--------------------





select * from TYPOGRAPHYS;




