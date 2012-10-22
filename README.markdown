## What is Octopress?

Octopress is [Jekyll](https://github.com/mojombo/jekyll) blogging at its finest.

1. **Octopress sports a clean responsive theme** written in semantic HTML5, focused on readability and friendliness toward mobile devices.
2. **Code blogging is easy and beautiful.** Embed code (with [Solarized](http://ethanschoonover.com/solarized) styling) in your posts from gists, jsFiddle or from your filesystem.
3. **Third party integration is simple** with built-in support for Twitter, Pinboard, Delicious, GitHub Repositories, Disqus Comments and Google Analytics.
4. **It's easy to use.** A collection of rake tasks simplifies development and makes deploying a cinch.
5. **Ships with great plug-ins** some original and others from the Jekyll community &mdash; tested and improved.


## Documentation

I've modified my installation of Octopress a bit to make deploying the generated site to Heroku easier. There is a directory called /_heroku where the generated site is placed. That directory is not part of this git repository, rather it is it's own repository with heroku as the git remote. That means that when you want to publish changes to the blog, you just:

```
git add .
git commit -m "Commit Message"  # Commit changes first of all.
rake generate                   # Generate the newly edited site
cd ./_heroku
git add .
git commit -m "Commit Message"  # Commit changes to the generated site since they are separate repos
git push heroku master          # Push changes to heroku
```

To make a new post or page:

```
rake new_post['Post Title']
or
rake new_page['Page Name']
```

For more octopress documentation, see [the official docs](http://octopress.org/docs/)

## License

Blog/Page Entries and any content is Copyright © 2012-2013 Timothy Kaemmerer

Octopress is licensed with the MIT License

Copyright © 2009-2012 Brandon Mathis

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.