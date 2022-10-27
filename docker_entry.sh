#!/bin/bash
service nginx start
sleep 2
echo "Testing application - Curl localhost/index.php"
sleep 2
curl localhost/index.php
