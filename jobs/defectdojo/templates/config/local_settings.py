LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "handlers": {
        "file": {
            "level": "INFO",
            "class": "logging.FileHandler",
            "filename": "/var/vcap/sys/log/defectdojo/info.log",
        },
    },
    "loggers": {
    # todo look into other loggers
        "root": {
            "handlers": ["file"],
            "level": "INFO",
            "propagate": True,
        },
    },
}
