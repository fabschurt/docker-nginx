# Docker Nginx

This is a Docker Nginx base image, with a simple and clean configuration. You
can’t use it as is, because the default server defined in the config simply
sends a 403 response back without serving anything. Instead, you must build your
own image `FROM` this base image and `COPY` some virtual host config files to
the right directory in the container&nbsp;:

```
FROM fabschurt/nginx

[…]

COPY app/config/nginx/app.conf /etc/nginx/servers.d/app.conf
```

## License

This software package is licensed under the [MIT License](https://opensource.org/licenses/MIT).
