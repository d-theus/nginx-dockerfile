# Nginx Dockerfile

**Base image:** centos:centos7

## Usage

    $ docker run -d -p 80:80 -p 443:443 \
      -v /path/to/nginx.conf:/etc/nginx/nginx.conf \
      -v /ssl/certs:/etc/ssl/certs \
      --volumes-from public \
      dtheus/nginx

Notes:
* Mounting **nginx.conf** as file or with entire `nginx.conf` directory
  is mandatory. There is no config shipped by default in this image.
* SSL certs are optional.
* Mount other volumes (e.g. `public` as data-only container) for static files.
* It's suggested to redirect access and error **logs** to stdout and stderr respectively
  in you `nginx.conf`, e.g.:

```nginx
# /etc/nginx/nginx.conf

error_log  /dev/stderr warn;
http {
  #...
    access_log /dev/stdout;
  #...
}
```
