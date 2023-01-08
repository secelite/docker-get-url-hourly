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

# Start the cron daemon
CMD crond -f