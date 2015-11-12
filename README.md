# World's Simplest Browser

## Summary
```
Met the futurists: People who 'live in the future'
http://www.cnn.com/2015/11/06/tech/pioneers-futurists/index.html

Content length: 3972 characters.

Links:
- More stories about the future of science, tech and medicine
  http://www.cnn.com/specials/tech/pioneers
- Pioneers: Will gene "editing" change society as much as computers? 
  http://www.cnn.com/2015/10/30/health/pioneers-crispr-dna-genome-editing/index.html
- @thompatterson
  https://twitter.com/thompatterson
- Amy Webb writes 
  https://www.linkedin.com/pulse/what-exactly-futurist-amy-webb
- CNN.com/Pioneers.
  http://www.cnn.com/specials/tech/pioneers
- The future of asteroids: Way stations to Mars
  http://www.cnn.com/2015/10/06/tech/asteroid-mining-nasa-mars-pioneers/index.html
```
*Figure 1*.  Example display of a web page in our command-line browser.

In this challenge, we're going to build a simple command-line browser.  Users will enter the URL's they wish to visit, and our application will display simplified overviews of the pages.

We'll use this challenge to increase our familiarity with how the web works.  Everything our program does, a browser has to do, too.  We'll need to make an HTTP request and receive a response.  After we get the response, we'll display it to the user.

In addition to the technical challenges, this challenge also provides an opportunity to apply object-oriented design principles (e.g., [separation of concerns][]).


### Net::HTTP and Nokogiri
In order to get the HTML for a wepage, we need to make an [HTTP][wikipedia http] request—just like with a browser.  And, we need to do so with Ruby.  Fortunately, the Ruby Standard Library includes a library that makes this possible:  the `Net` module with it's `HTTP` class (i.e., `Net::HTTP`).

To use this library, we need to require it (see Line 1 of the runner file).  But, how do we use `Net::HTTP` to make HTTP requests?  Part of this challenge is to explore this library to learn how to use it.  To begin, we can read through the usage examples in the [ruby docs][ruby net/http] and this [cheat sheet from Ruby Inside][ruby inside net/http].

After we use `Net::HTTP` to get the contents of a webpage, we'll need to parse it to pull out the data we'll use to form our simplified overview.  We can use the [Nokogiri][] gem to do this; we should be familiar with Nokogiri from a [previous challenge][scraping hn challenge].


## Releases
### Pre-release:  Delimit Responsibilities
Let's begin by listing all the responsibilities within our application.  Some object is going to be responsible each of them.  An example list might include ...

- displaying a prompt for the user
- parsing user input
- fetching a web page
- extracting the relevant information from the web page
- displaying the relevant information in a user-friendly way

With our list in place, let's consider how we're going to accomplish each of responsibilities.  What classes do we need to fulfill these responsibilities?  Where are the boundaries between the classes and how do they communicate with each other?


#### Listing the Responsibilities

Start by listing the core responsibilities of your app.  Some of these responsibilities include:

- Displaying a prompt for the user
- Parsing user input
- Fetching a web page
- Extracting the relevant information from the web page
- Displaying the relevant information in a user-friendly way
- *etc.*

There are more&mdash;make sure you list them out!  Next, group these responsibilities into "concerns".  Prompting a user for input and taking the appropriate action might be one concern, for example.  Fetching a URL and returning an easy-to-display data structure might be another.

#### Toy Code

Get familiar with the [Net::HTTP](http://ruby-doc.org/stdlib-1.9.3//libdoc/net/http/rdoc/Net/HTTP.html) module.  Here's a good [Net::HTTP cheatsheet](http://www.rubyinside.com/nethttp-cheat-sheet-2940.html) to help you.

Write some toy code and fetch some web pages. Get your toy code to create the sample output shown in the initial example before moving on to Release 1.

What kind of objects do `Net::HTTP` methods return?  Should your program expose those objects directly?

**Hint:** No.  Wrap them up in objects that more directly express what your code *does* rather than how its implemented.

### Release 1: Object-Oriented Browser

#### Create Custom Objects

Start with a `Page` class that has the following requirements:

- I can create my page by telling it what url I want to find.
- I can call a method `fetch!` to retrieve the contents of the site at the url using an HTTP request
- I can retrieve the url of the page via a method called url
- I can retrieve all of the links on the page via a method `links` which returns an array of String objects.
- I can retrieve the title of the page via a method `title`.


See browser.rb for where to put the "driver" code.  You should have a `Browser` class that acts as the "brain" rather than lots of code living outside of a class.

You should write tests for the Page object functionality in page_spec.rb


##Resources


[nokogiri]: http://nokogiri.org
[ruby net/http]: http://ruby-doc.org/stdlib-2.1.0//libdoc/net/http/rdoc/Net/HTTP.html
[ruby inside net/http]: http://www.rubyinside.com/nethttp-cheat-sheet-2940.html
[scraping hn challenge]: ../../../scraping-hn-1-building-objects-challenge
[separation of concerns]: https://en.wikipedia.org/wiki/Separation_of_concerns
[wikipedia http]: https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol

