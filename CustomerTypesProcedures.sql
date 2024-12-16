----- ДОБАВЛЕНИЕ ------
CREATE OR REPLACE PROCEDURE ADD_CUSTOMER_TYPE(p_name IN VARCHAR2)
AS
  v_id NUMBER;
  v_count NUMBER;
BEGIN
  LOOP
    -- Генерация случайного пятизначного ID
    v_id := TRUNC(DBMS_RANDOM.VALUE(10000, 99999));

    -- Проверка на уникальность ID
    SELECT COUNT(*) INTO v_count
    FROM CUSTOMERTYPES
    WHERE CUSTOMER_TYPE_ID = v_id;

    EXIT WHEN v_count = 0;
  END LOOP;

  INSERT INTO CUSTOMERTYPES
  VALUES (v_id, p_name);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error adding customer type: ' || SQLERRM);
END;




----- ОБНОВЛЕНИЕ ------
CREATE OR REPLACE PROCEDURE UPDATE_CUSTOMER_TYPE(OLD_NAME IN VARCHAR2, NEW_NAME IN VARCHAR2)
AS
BEGIN
  UPDATE CUSTOMERTYPES
  SET CUSTOMER_TYPE_NAME = NEW_NAME
  WHERE CUSTOMER_TYPE_NAME = OLD_NAME;
  COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error updating customer type: ' || SQLERRM);
END;





----- УДАЛЕНИЕ ------
CREATE OR REPLACE PROCEDURE DELETE_CUSTOMER_TYPE(P_NAME IN VARCHAR2)
AS
BEGIN
  delete from CUSTOMERTYPES
  WHERE CUSTOMER_TYPE_NAME = P_NAME;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    rollback;
    DBMS_OUTPUT.PUT_LINE('Error deleting customer type: ' || SQLERRM);
END;





SELECT * FROM CUSTOMERTYPES;

