#!/bin/sh

# Set the URL to send the POST request to
url=$URL

# Set the User-Agent header
headers="User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36"

# Set the session cookie
cookie=$SESSION_COOKIE

# Make the GET request with the User-Agent header and cookie
curl -X GET -H "$headers" -b "$cookie" "$url"