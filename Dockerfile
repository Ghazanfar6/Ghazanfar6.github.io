FROM nginx:1.25-alpine

LABEL maintainer="student@lsbu.ac.uk"
LABEL description="Portfolio Website DevOps Coursework"
LABEL version="1.0"

RUN apk add --no-cache curl

COPY . /usr/share/nginx/html/

RUN sed -i 's/listen       80;/listen       8081;/g' /etc/nginx/conf.d/default.conf

EXPOSE 8081

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8081/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
