---
layout: post
title: "Quick Tip: Custom 404 page for Octopress"
date: 2012-10-26 11:59
comments: true
categories: [Technology, Octopress]
---

As you know, I recently migrated my blog from tumblr to [a more custom solution]({{ root_url }}blog/2012/10/21/new-blog-dot-dot-dot-again/). I was watching Google Analytics and noticed that several visitors were going to pages that no longer exist. When I went to view the default 404 page, it was just "Sorry, I couldn't find URL". I wanted to provide a better 404 page with links to certain things they might be looking for, like the [Armory Source Code](https://github.com/gorrillamcd/Armory).

So, I did some research and found out it's super easy to add a custom 404 page to Octopress or even plain Sinatra. In your config.ru file, you should have:
<!-- more -->

```ruby config.ru
not_found do
  send_sinatra_file('404.html') {"Sorry, I cannot find #{request.path}"}
end
```

So, for Octopress, it's already configured to handle 404 pages and you just need to create the page. For Sinatra applications, you can use that code as well wherever you define your routes for your app (in config.ru somewhere inside your Server class)

To create the page, make a new file named `404.markdown` in your `/sources` directory. I just copied the Yaml header from one of my pages, but here it is anyways:

```markdown 404.markdown
---
layout: page
title: "404 Error"
date: 2012-10-26 16:25
comments: false
sharing: false
footer: false
---
```

After that, add some text explaining that the page couldn't be found and instead offer some links. You can [take a look at my 404 page right now]({{ root_url}}cheeseburgers) to get an idea.