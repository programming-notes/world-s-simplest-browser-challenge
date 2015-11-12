# World's Simplest Browser

## Summary
```
Meet the futurists: People who 'live in the future'
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

In this challenge, we're going to build a simple command-line browser.  Users will enter URL's they wish to visit (one at a time), and our application will display simplified overviews of the pages (see Figure 1).

We'll use this challenge to increase our familiarity with how the web works.  Everything our program does, a browser has to do, too.  We'll need to make an HTTP request and receive a response.  After we get the response, we'll display it to the user.

In addition to the technical challenges, this challenge also provides an opportunity to apply object-oriented design principles (e.g., [separation of concerns][]).


### Net::HTTP and Nokogiri
In order to get the HTML for a wepage, we need to make an [HTTP][wikipedia http] request—just like with a browser.  And, we need to do so with Ruby.  Fortunately, the Ruby Standard Library includes a library that makes this possible:  the `Net` module with it's `HTTP` class (i.e., `Net::HTTP`).

To use this library, we need to require it (see Line 1 of the runner file).  But, how do we use `Net::HTTP` to make HTTP requests?  What kind of object is created out of the response?  Part of this challenge is to explore this library to learn how to use it.  To begin, we can read through the usage examples in the [ruby docs][ruby net/http] and this [cheat sheet from Ruby Inside][ruby inside net/http].

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


### Release 0: Represent a Web Page in Ruby
Figure 1 in the *Summary* gives us look at what information from a webpage our simple browser will display to users.  We can see that our browser will display the page's heading, its url, the number of characters in the page's text, and any links on the page.

Let's begin by building a `Page` class to represent our simplified version of a web page.  Some tests have been written for us.

*Note:* The provided tests only reflect behaviors related to the state of a `Page` object (e.g., its heading or url).  If we add any additional behaviors throughout the challenge, we'll need to add tests for those.


### Release 1: Build the Object-oriented Browser
With our `Page` class, we can successfully represent a web page in Ruby.  That's one piece of the puzzle.  We need to build the rest of the application.

To reiterate what our browser does, we'll prompt users to input a URL.  In the background, our browser will make an HTTP request and get a response back.  We'll work with the response and ultimately display an overview of the page (see Figure 1).  Then, users can enter another URL or they can exit the program.


##Resources


[nokogiri]: http://nokogiri.org
[ruby net/http]: http://ruby-doc.org/stdlib-2.1.0//libdoc/net/http/rdoc/Net/HTTP.html
[ruby inside net/http]: http://www.rubyinside.com/nethttp-cheat-sheet-2940.html
[scraping hn challenge]: ../../../scraping-hn-1-building-objects-challenge
[separation of concerns]: https://en.wikipedia.org/wiki/Separation_of_concerns
[wikipedia http]: https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol

