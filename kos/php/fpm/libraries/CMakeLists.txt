add_subdirectory(ext)
add_subdirectory(TSRM)
add_subdirectory(main)
add_subdirectory(Zend)

set(PHP_EXT_MODULES
        ext_xmlwriter
        ext_xmlreader
        ext_xml
        ext_tokenizer
        ext_spl
        ext_simplexml
        ext_session
        ext_reflection
        ext_posix
        ext_phar
        ext_pdo_sqlite
        ext_pdo
        ext_json
        ext_iconv
        ext_hash
        ext_filter
        ext_fileinfo
        ext_dom
        ext_ctype
        ext_sqlite3
        ext_pcre
        ext_openssl
        ext_libxml
        ext_date
        ext_standard
        main
        main_streams
        Zend
        PARENT_SCOPE
)

set(_THIRD_PARTY_LIBS
        ssl
        crypto
        xml2
        sqlite3
        pthread
        m
)
if (NOT KOS)
    list(APPEND _THIRD_PARTY_LIBS dl)
endif ()

set(PHP_THIRD_PARTY_LIBS ${_THIRD_PARTY_LIBS} PARENT_SCOPE)