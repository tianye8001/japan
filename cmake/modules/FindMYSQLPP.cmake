MESSAGE("-- Looking for MySQL and MySQL++ libraries.")

FIND_PATH(MYSQLPP_INCLUDE_PATH mysql++.h
  /usr/include/mysql++/
  /usr/local/Cellar/mysql++/3.2.3_1/include/mysql++/
  /group/qweak/QwAnalysis/Linux_CentOS6.5-x86_64/MySQL++/local/include/mysql++/
)

FIND_PATH(MYSQL_INCLUDE_PATH mysql.h
	/usr/include/mysql/
	/usr/local/Cellar/mysql/5.7.22/include/mysql/
)

IF(MYSQL_INCLUDE_PATH AND MYSQLPP_INCLUDE_PATH)
  SET(MYSQLPP_INCLUDE_DIR
    ${MYSQLPP_INCLUDE_PATH}
    ${MYSQL_INCLUDE_PATH}
  )
ENDIF(MYSQL_INCLUDE_PATH AND MYSQLPP_INCLUDE_PATH)

FIND_LIBRARY(MYSQLPP_LIBRARIES mysqlpp
  /usr/lib/mysql++/
  /usr/local/Cellar/mysql++/3.2.3_1/lib
  /group/qweak/QwAnalysis/Linux_CentOS6.5-x86_64/MySQL++/local/lib
)

IF (MYSQLPP_INCLUDE_DIR AND MYSQLPP_LIBRARIES)
   SET(MYSQLPP_FOUND TRUE)
   MESSAGE("--   Found MySQL++ library at ${MYSQLPP_LIBRARIES}")
ELSE (MYSQLPP_INCLUDE_DIR AND MYSQLPP_LIBRARIES)
   SET(MYSQLPP_FOUND FALSE)
ENDIF (MYSQLPP_INCLUDE_DIR AND MYSQLPP_LIBRARIES)

IF(MYSQLPP_FIND_REQUIRED)
  IF(MYSQLPP_FOUND)
  ELSE(MYSQLPP_FOUND)
    MESSAGE(FATAL_ERROR "Could not find mysqlpp")
  ENDIF(MYSQLPP_FOUND)
ELSE(MYSQLPP_FIND_REQUIRED)
  ##  MySQL++ is not required, but we need to know if we found it.
  IF(MYSQLPP_FOUND)
  ELSE(MYSQLPP_FOUND)
    MESSAGE("--   Could not find MySQL++; database support is DISABLED.")
  ENDIF(MYSQLPP_FOUND)
ENDIF(MYSQLPP_FIND_REQUIRED)


MARK_AS_ADVANCED(MYSQLPP_LIBRARIES MYSQLPP_INCLUDE_DIR)
