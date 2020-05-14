FROM alpine:3.9

# Install required packages for using this service
RUN apk update && apk add openrc busybox-initscripts curl bind-tools

# Setup cronjob
COPY root /var/spool/cron/crontabs/root

# Create dynu directory, copy the update shell script and make it executable
RUN mkdir /etc/dynu/
COPY dynu.sh /etc/dynu/dynu.sh 
RUN chmod a+x /etc/dynu/dynu.sh 

# Create the log file
RUN touch /var/log/dynujob.log

# Run the command on container startup (shows the output of the cronjob in attached mode)
CMD echo "#################################################" && echo "Dynu DDNS Updater" \
    && echo "Author: Diego Bienz" && echo "(run with -d for detached mode)" && echo \
    "#################################################" && echo "" && crond -f -l 8 -L /dev/stdout