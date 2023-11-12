CREATE OR REPLACE FUNCTION get_employee_details(
    p_department_id IN NUMBER,
    p_min_salary OUT NUMBER
) RETURN SYS_REFCURSOR
IS
    -- Declare variables
    v_cursor SYS_REFCURSOR;
    v_employee_id NUMBER;
    v_first_name VARCHAR2(50);
    v_last_name VARCHAR2(50);
    v_department_name VARCHAR2(100);
    v_salary NUMBER;
    v_total_salary NUMBER := 0;

BEGIN
    -- Initialize the minimum salary
    p_min_salary := NULL;

    -- Check if the department ID is valid
    SELECT COUNT(*) INTO p_min_salary
    FROM departments
    WHERE department_id = p_department_id;

    IF p_min_salary = 0 THEN
        -- Raise an exception for an invalid department ID
        RAISE_APPLICATION_ERROR(-20001, 'Invalid department ID: ' || p_department_id);
    END IF;

    -- Open a cursor for the specified department with a JOIN statement
    OPEN v_cursor FOR
        SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
        FROM employees e
        JOIN departments d ON e.department_id = d.department_id
        WHERE e.department_id = p_department_id;

    -- Loop through the result set
    LOOP
        -- Fetch the data from the cursor
        FETCH v_cursor INTO v_employee_id, v_first_name, v_last_name, v_salary, v_department_name;

        -- Exit the loop if there are no more records
        EXIT WHEN v_cursor%NOTFOUND;

        -- Update the minimum salary
        IF p_min_salary IS NULL OR v_salary < p_min_salary THEN
            p_min_salary := v_salary;
        END IF;

        -- Accumulate the total salary for the department
        v_total_salary := v_total_salary + v_salary;

        -- Display employee details
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id || ', Name: ' || v_first_name || ' ' || v_last_name || ', Salary: ' || v_salary || ', Department: ' || v_department_name);
    END LOOP;

    -- Close the cursor
    CLOSE v_cursor;

    -- Display the total salary for the department
    DBMS_OUTPUT.PUT_LINE('Total Salary for Department ' || p_department_id || ': ' || v_total_salary);

    -- Return the cursor
    RETURN v_cursor;

EXCEPTION
    WHEN OTHERS THEN
        -- Handle other exceptions
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        -- You can log the error or take other appropriate actions here
        -- For example, you might want to RAISE or RERAISE the exception
END get_employee_details;
/
