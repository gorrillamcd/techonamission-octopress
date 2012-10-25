---
layout: post
title: "Weird Javascript Issue with Rails 3.2"
date: 2012-10-24 16:21
comments: true
categories: [Technology, Javascript, Idiosyncracies]
---

I was racking my brain yesterday and today trying to figure out a javascript error I've been having on [Armory](https://github.com/gorrillamcd/Armory).

### The Problem

No javascript would run on any page. Dropdowns, modal windows, nothing would run. I couldn't find any weird errors in the dev console on Chrome and had the same effect in multiple browsers. The problem would remain whether I include the js from an external file or inline anywhere in the file.
<!-- more -->

### The Solution

{%pullquote%}
I had tried just about everything, and then I decided to remove the coffeescript I was using to get [Stripe payments](http://stripe.com/) working (the same coffeescript from [the railscast on Stripe](http://railscasts.com/episodes/288-billing-with-stripe)). All the javascript started working again. Of course, I need that coffeescript to be able to do credit card payments, so leaving it out is not an option. It turns out the problem is caused because the `https://js.stripe.com/v1/` javascript needs to be included for the Stripe method to work. I was under the impression that this method was provided by the stripe gem, but I guess not. {"The problem was that I was limiting the download of this javascript to just the Payment Controller views."} Since all js is included into the application.js file, this was causing all other views js to get hung up on the missing method.
{%endpullquote%}

The solution is simple. You can write an if clause in javascript to test whether Stripe is defined or not and then run the offending code like so like so:

``` javascript
if(typeof Stripe == 'function') { 
Stripe();
}
```

Or, in coffeescript:

``` coffeescript
if typeof Stripe == 'function'
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  subscription.setupForm()
```

With that, you can safely include the javascript pertaining to Stripe only on the PaymentController views, thus saving an http request on the other views. It's super easy to do that in your application.html.erb layout file:

``` ruby
<%= javascript_include_tag "https://js.stripe.com/v1/" if controller_name == 'payments'  %>
```

Where `payments` is the plural, lowercase name of the controller you're using to handle payments.