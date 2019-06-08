#!/bin/sh

mkdir ./init
init_sql=./init/0_employees.sql
touch ${init_sql}
sed -e '112,127d' ./test_db/employees.sql | awk '{print $0 >> file}' file=${init_sql}
cp ./test_db/load_departments.dump ./init/1_data.sql
cp ./test_db/load_employees.dump ./init/2_data.sql
cp ./test_db/load_dept_emp.dump ./init/3_data.sql
cp ./test_db/load_dept_manager.dump ./init/4_data.sql
cp ./test_db/load_titles.dump ./init/5_data.sql
cp ./test_db/load_salaries1.dump ./init/6_data.sql
cp ./test_db/load_salaries2.dump ./init/7_data.sql
cp ./test_db/load_salaries3.dump ./init/8_data.sql
files=$(ls ./init/*data.sql)
for file in $files
do
    gsed -i -e "1i use employees;" $file
done

