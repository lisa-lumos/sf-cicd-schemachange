create or replace procedure demo_db.lisa_test.test_sp()
returns string
language javascript
execute as caller
as
$$
    var result;
    
    try {
        var select_sql = 'select student_name from demo_db.lisa_test.student_info; ';
        var stmt = snowflake.createStatement( {sqlText: select_sql} );
        var names = stmt.execute(); 
        var name_array = [];
    
        while (names.next()) {
            name_array.push( names.getColumnValue(1) );
        }

        for (var i = 0; i < name_array.length; i++) {
			result = result + ' ' + name_array[i];
        };
    } catch (err) {
        result =  "Failed: Code: " + err.code + "\n  State: " + err.state;
        result += "\n  Message: " + err.message;
        result += "\nStack Trace:\n" + err.stackTraceTxt;  
    }
    return result;
$$;

call demo_db.lisa_test.test_sp();
