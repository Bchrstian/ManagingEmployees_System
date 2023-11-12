DECLARE
    v_min_salary NUMBER;
    v_result_cursor SYS_REFCURSOR;
BEGIN
    v_result_cursor := get_employee_details(104, v_min_salary);
END;
/