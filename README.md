# Docker Nginx

This is a basic Docker Nginx image, with a simple and clean configuration. Just
build your image `FROM` this base image and copy some virtual host config files
to the right container directory and you’re all set&nbsp;:

```
FROM fabschurt/nginx

[…]

COPY app/config/nginx/app.conf /etc/nginx/servers.d/app.conf
```

## License

This software package is licensed under the [MIT License](https://opensource.org/licenses/MIT).
