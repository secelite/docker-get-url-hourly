FROM alpine:3.12

# Install curl and cron
RUN apk update && apk add curl bash

# Create a working directory
RUN mkdir /app
WORKDIR /app

# Copy the shell script to the working directory
COPY ./src/main.sh /app/main.sh

# add executable flag to script
RUN chmod +x /app/main.sh

# Create a crontab file with the schedule for running the script
RUN echo "5 * * * * /app/main.sh" > /var/spool/cron/crontabs/root

# Start the cron daemon
CMD crond -f