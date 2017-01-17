# Docker Nginx (1.10)

This is a Docker Nginx base image, with a simple and clean configuration. *gzip*
compression is pre-configured for a sensible list of file types, and static file
serving is optimized via *sendfile* and *tcp_nopush* directives.

*Important&nbsp;:* **you can’t use this image as is**&nbsp;; there is a default
server defined, but it always returns a 404 response. Instead, **you must build
your own image `FROM` this base image** and create some `*.conf` vhost files in
the `config/nginx` directory of your context root (an `ONBUILD` trigger will
copy them into the `/etc/nginx/conf.d` directory of the container)&nbsp;:

```
FROM fabschurt/nginx

[…]
```

*Important&nbsp;:* if any of your virtual hosts is supposed to act as a «catch-all»
server (meaning that it has no valid server name attached and is meant to serve
all requests for the host/port it listens to), you MUST explicitly define it as
the default server for the concerned host/port (otherwise the default 404-responding
server will be used instead)&nbsp;:

```
server {
    listen 80 default_server;
    server_name _;

    […]
}
```

## License

This software package is licensed under the [MIT License](https://opensource.org/licenses/MIT).
