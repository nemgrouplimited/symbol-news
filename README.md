# Symbol News

[![Build Status](https://api.travis-ci.com/nemgrouplimited/symbol-news.png?branch=main)](https://travis-ci.com/nemgrouplimited/symbol-news)

Hosting RSS Feeds from rssmix aggregator to be consumed over HTTPS by [symbol-desktop-wallet](https://github.com/nemgrouplimited/symbol-desktop-wallet)

## How news are updated?

Backed up by a travis CronJob that runs on a daily basis to refresh RSS Feeds and re-host it for [symbol-wallet](https://github.com/nemgrouplimited/symbol-desktop-wallet) news page.

## Why?

The [symbol-wallet](https://github.com/nemgrouplimited/symbol-desktop-wallet) uses [rssmix aggregator](http://www.rssmix.com/) as the main resource for building news feeds in the app. Since rssmix doesn't support HTTPS protocol but, only HTTP which could lead to a Potential Content Spoofing vulnerability. We decided to host the xml-content returned from the aggregator on Github Pages then consume it from wallet over HTTPS to avoid MiTM attacks and responses manipulation.

### How it functions?

#### Basically the cron has two scripts:

1. Frist [one](https://github.com/nemgrouplimited/symbol-news-scripts/blob/main/scripts/updateNewsXML.sh) updates index.html file content with latest [rss-feeds](http://rssmix.com/u/11801188/rss.xml) from rssmix.

2. Second [one](https://github.com/nemgrouplimited/symbol-news-scripts/blob/main/scripts/pushUpdates.sh) push back updates to github after querying the rss aggregator to host latest updates on [Github Pages](https://nemgrouplimited.github.io/symbol-news/).
