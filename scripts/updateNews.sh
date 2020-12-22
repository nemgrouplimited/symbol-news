#!/bin/bash
echo "Requesting RSS Feeds ..."
page="$(curl http://rssmix.com/u/11801198/rss.xml)"
> index.html
echo "Updating file content ..."
echo "$page" >> index.html
