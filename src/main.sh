#!/bin/bash

# Set the URL to send the POST request to
url=$URL

# Set the User-Agent header
headers="User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36"

# Set the session cookie
cookie=$SESSION_COOKIE
# Set the delimiter
delimiter=$SESSION_COOKIE_DELIMITER

# Check if the delimiter is present in the string
if [[ $cookie == *"$delimiter"* ]] && [[ "$delimiter" != "" ]]; then
  # Split the string by the delimiter and store the resulting words in an array
  IFS=$delimiter read -ra cookies <<<"$cookie"
else
  # If the delimiter is not present or is an empty string, create an array with the string as the only element
  cookies=("$cookie")
fi

echo "Number of elements in the array: ${#cookies[@]}"
for cookie in "${cookies[@]}"; do
  # Make the GET request with the User-Agent header and cookie
  curl -H "$headers" -b "$cookie" "$url" >/dev/null
  sleep 1.5
done
