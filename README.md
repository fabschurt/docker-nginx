# Docker Nginx (1.15)

This is an Nginx base Docker image (itself being derived from the
[official Nginx image](https://hub.docker.com/_/nginx)), with a simple
and clean configuration.

*gzip* compression is pre-configured and enabled for a sensible list of file
types, and static file serving is optimized thanks to the use of the  *sendfile*
and *tcp_nopush* directives.

**Important note #1:** you can’t use this image as is; there is a default server
defined, but it will always return a 404 response. Instead, you must build your
own image `FROM` this base image, and `COPY` your server config file(s) into the
`/etc/nginx/conf.d` directory:

```
FROM fabschurt/nginx

COPY config/nginx/some_server_config.conf /etc/nginx/conf.d/

# …
```

**Important note #2:** if any of your virtual hosts is supposed to act as a
«catch-all» server (meaning that it has no valid server name attached and is
meant to serve all requests for the host/port it listens to), you *must*
explicitly define it as the *default server* for the concerned host/port
(otherwise the default 404-responding server will be matched instead):

```
server {
  listen 80 default_server;
  server_name _;

  # …
}
```

## License

This software package is licensed under the [MIT License](https://opensource.org/licenses/MIT).
