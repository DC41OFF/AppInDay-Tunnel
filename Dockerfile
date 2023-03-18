FROM nginx:latest
LABEL Name=itmammad Version=0.0.1
EXPOSE 80
USER root
COPY nginx.conf /etc/nginx/nginx.conf
WORKDIR /root/
COPY . .
RUN chmod a+x ./entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]