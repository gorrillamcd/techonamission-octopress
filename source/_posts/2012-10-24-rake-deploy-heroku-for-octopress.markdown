---
layout: post
title: "Rake Deploy_Heroku for Octopress"
date: 2012-10-24 20:29
comments: true
categories: [Technology, Octopress]
---

This weekend, I [posted about setting up my free blog with Heroku and octopress]({{root_url}}blog/2012/10/21/new-blog-dot-dot-dot-again). I'll be posting in more detail in a few weeks about how to do that.

Anyways, shortly after I started using octopress in this way, I got tired of having to do `git add .`, `git commit -m "message"`, and then changing directory to do the same thing and upload to heroku. The way I set-up octopress, I have two repositories, 1 for the source code and octopress itself and 1 for just the generated site to push to heroku. Since this was tedious, I wrote a quick rake task and added it to my `Rakefile`. [Here's the gist](https://gist.github.com/3933525):
<!-- more -->

{% gist 3933525 %}

With that, all I have to do is `heroku login` to login and `rake deploy_heroku` to commit changes, generate the site, and deploy to heroku, all with some error checking so that you don't generate the site twice if heroku failed the last time. It could definitely be better. It's not very portable right now, you have to mimick my structure exactly for it to work without changes, but it serves it's purpose and should point you in the right direction if you wanted to do something similar.