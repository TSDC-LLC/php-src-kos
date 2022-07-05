project(fpm)

set(TARGET_NAME Fpm)

set(TARGET_SRC
        ${PHP_SRC_ROOT}/main/internal_functions_cli.c
        ${PHP_SRC_ROOT}/main/fastcgi.c

        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_children.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_cleanup.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_clock.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_conf.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_env.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_events.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_log.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_main.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_php.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_php_trace.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_process_ctl.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_request.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_shm.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_scoreboard.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_signals.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_sockets.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_status.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_stdio.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_unix.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/fpm_worker_pool.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/zlog.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/events/select.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/events/poll.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/events/epoll.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/events/kqueue.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/events/devpoll.c
        ${PHP_SRC_ROOT}/sapi/fpm/fpm/events/port.c
)

set(TARGET_LIBS
        ${PHP_EXT_MODULES}
        ${PHP_THIRD_PARTY_LIBS}
)

include(executable)

target_include_directories(
        ${TARGET_NAME}
        PRIVATE
        ${PHP_SRC_ROOT}/sapi/fpm
)

target_compile_definitions(
        ${TARGET_NAME}
        PRIVATE
        ZEND_ENABLE_STATIC_TSRMLS_CACHE=1
        ZEND_SIGNALS
)
