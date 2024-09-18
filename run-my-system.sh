#! /bin/bash

GITHUB_PAT="$1"
API_CODE="./my-web-service"
FE_CODE="./user-crud-app"

echo ">>>$GITHUB_PAT"
if [ -d "$API_CODE" ]; then
  echo "Directory '$API_CODE' already exists. Deleting it..."
  rm -rf "$API_CODE"
fi

echo "Cloning repository of API..."
git clone "https://github.com/thanhnhan262/webservice.git" $API_CODE
if [ $? -eq 0 ]; then
  echo "Repository cloned successfully"
else
  echo "Failed to clone repository."
  exit 1
fi

if [ -d "$FE_CODE" ]; then
  echo "Directory '$FE_CODE' already exists. Deleting it..."
  rm -rf "$FE_CODE"
fi

echo "Cloning repository of API..."
git clone "https://github.com/thanhnhan262/frontend.git" $FE_CODE
if [ $? -eq 0 ]; then
  echo "Repository cloned successfully"
else
  echo "Failed to clone repository."
  exit 1
fi

docker-compose up --build -d
