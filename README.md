## Notes ##
### some notes on the database and the Queries we are prototyping ###
---
## The database we are faking is `SISEDO.CLC_STDNT_LOOKUP_V00_VW`
##### The following is the table we are trying to mimic #####
```SQL
CREATE TABLE SISEDO.CLC_STDNT_LOOKUP_V00_VW (
  UC_SRCH_CRIT VARCHAR2(92 CHAR),
  STUDENT_ID VARCHAR2(11 CHAR),
  CAMPUS_ID VARCHAR2(30 CHAR),
  OPRID VARCHAR2(30 CHAR),
  LAST_NAME VARCHAR2(30 CHAR),
  FIRST_NAME VARCHAR2(30 CHAR),
  MIDDLE_NAME VARCHAR2(30 CHAR),
  UC_PRF_FIRST_NM VARCHAR2(30 CHAR),
  UC_PRF_MIDDLE_NM VARCHAR2(30 CHAR),
  EMAIL_ADDR VARCHAR2(70 CHAR),
  ACAD_PROG VARCHAR2(4000 CHAR)
);
```
---
##### The following is the function we are trying to test it on, all columns in the table are needed #####
```ruby
def self.search_students(search_string)
  result = safe_query <<-SQL
    SELECT *
    FROM
      (
        SELECT DISTINCT
          STUDENT_ID AS student_id,
          CAMPUS_ID AS campus_uid,
          OPRID AS oprid,
          FIRST_NAME AS first_name_legal,
          MIDDLE_NAME AS middle_name_legal,
          LAST_NAME AS last_name_legal,
          UC_PRF_FIRST_NM AS first_name_preferred,
          UC_PRF_MIDDLE_NM AS middle_name_preferred,
          EMAIL_ADDR AS email,
          ACAD_PROG AS academic_programs
        FROM SISEDO.CLC_STDNT_LOOKUP_V00_VW
        WHERE upper(UC_SRCH_CRIT) LIKE upper('%#{search_string}%')
        AND ((CAMPUS_ID <> ' ' AND CAMPUS_ID IS NOT NULL) OR (OPRID <> ' ' AND OPRID IS NOT NULL))
      )
    WHERE rownum < 31
  SQL
  result
end
```
Some additional notes on SQLite vs Oracle SQL:
1. `rownum` is a Oracle SQL only function, there's no equivalent in SQLite. But since theres no ordering involved in the query, we can use `LIMIT 30` clause to select first 30 rows instead. (Oracle SQL is 1 indexed).
[example](http://www.sqlitetutorial.net/sqlite-limit/)
