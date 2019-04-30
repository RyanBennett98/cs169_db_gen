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