FROM alpine:3.9

# Install required packages for using this service
RUN apk update && apk add openrc busybox-initscripts curl bind-tools

# Copy the update shell script to the periodic 15 min folder and make it executable
COPY dynu.sh /etc/periodic/15min/dynu.sh 
RUN chmod a+x /etc/periodic/15min/dynu.sh 

# Create the log file to be able to write to logs from cron
RUN touch /var/log/dynujob.log

# Run the command on container startup (shows the output of the cronjob in attached mode)
CMD echo "#################################################" && echo "Dynu DDNS Updater" && echo "Author: Diego Bienz" && echo "(run with -d for detached mode)" && echo "#################################################" && echo "" && tail -f /var/log/dynujob.log