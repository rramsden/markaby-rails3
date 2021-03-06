Markaby for Rails 3.0
=====================

This is only a temporary repository until the changes for Rails 3.0 are merged into the official markaby repository.

TODO
----

- Partial inception is broken... That is try rendering a partial within a partial within a partial thrice! It escapes HTML (bug caused by html_safe)

Markaby (Markup as Ruby)
========================

Markaby is a very short bit of code for writing HTML pages in pure Ruby.
It is an alternative to ERb which weaves the two languages together.
Also a replacement for templating languages which use primitive languages
that blend with HTML.

Using Markaby as a Rails plugin
-------------------------------

Write Rails templates in pure Ruby.  Example layout:

  html do
    head do
      title 'Products: ' + action_name
      stylesheet_link_tag 'scaffold'
    end
  
    body do
      p flash[:notice], :style => "color: green"
      self << content_for_layout
    end
  end

Using Markaby as a Ruby class
-----------------------------

Markaby is flaming easy to call from your Ruby classes.

  require 'markaby'

  mab = Markaby::Builder.new
  mab.html do
    head { title "Boats.com" }
    body do
      h1 "Boats.com has great deals"
      ul do
        li "$49 for a canoe"
        li "$39 for a raft"
        li "$29 for a huge boot that floats and can fit 5 people"
      end
    end
  end
  puts mab.to_s

Markaby::Builder.new does take two arguments for passing in variables and
a helper object.  You can also affix the block right on to the class.

See Markaby::Builder for all of that.

A Note About <tt>instance_eval</tt>
-----------------------------------

The Markaby::Builder class is different from the normal Builder class,
since it uses <tt>instance_eval</tt> when running blocks.  This cleans
up the appearance of the Markaby code you write.  If <tt>instance_eval</tt>
was not used, the code would look like this:

  mab = Markaby::Builder.new
  mab.html do
    mab.head { mab.title "Boats.com" }
    mab.body do
      mab.h1 "Boats.com has great deals"
    end
  end
  puts mab.to_s

So, the advantage is the cleanliness of your code.  The disadvantage is that
the block will run inside the Markaby::Builder object's scope.  This means
that inside these blocks, <tt>self</tt> will be your Markaby::Builder object.
When you use instance variables in these blocks, they will be instance variables
of the Markaby::Builder object.

This doesn't affect Rails users, but when used in regular Ruby code, it can
be a bit disorienting.  You are recommended to put your Markaby code in a
module where it won't mix with anything.

The Six Steps of Markaby
------------------------

If you dive right into Markaby, it'll probably make good sense, but you're
likely to run into a few kinks.  Why not review these six steps and commit
them memory so you can really *know* what you're doing?

# 1. Element Classes

Element classes may be added by hooking methods onto container elements:

  div.entry do
    h2.entryTitle 'Son of WebPage'
    div.entrySection %{by Anthony}
    div.entryContent 'Okay, once again, the idea here is ...'
  end

Which results in:

  <div class="entry">
    <h2 class="entryTitle">Son of WebPage</h2>
    <div class="entrySection">by Anthony</div>
    <div class="entryContent">Okay, once again, the idea here is ...</div>
  </div>

# 2. Element IDs

IDs may be added by the use of bang methods:

  div.page! {
    div.content! {
      h1 "A Short Short Saintly Dog"
    }
  }

Which results in:

  <div id="page">
    <div id="content">
      <h1>A Short Short Saintly Dog</h1>
    </div>
  </div>

# 3. Validate Your XHTML 1.0 Output 

If you'd like Markaby to help you assemble valid XHTML documents,
you can use the <tt>xhtml_transitional</tt> or <tt>xhtml_strict</tt>
methods in place of the normal <tt>html</tt> tag.

  xhtml_strict do
    head { ... }
    body { ... }
  end

This will add the XML instruction and the doctype tag to your document.
Also, a character set meta tag will be placed inside your <tt>head</tt>
tag.

Now, since Markaby knows which doctype you're using, it checks a big
list of valid tags and attributes before printing anything.

  >> div :styl => "padding: 10px" do
  >>   img :src => "samorost.jpg"
  >> end
  InvalidHtmlError: no such attribute `styl'

Markaby will also make sure you don't use the same element ID twice!

# 4. Escape or No Escape?

Markaby uses a simple convention for escaping stuff: if a string
is an argument, it gets escaped.  If the string is in a block, it
doesn't.

This is handy if you're using something like RedCloth or
RDoc inside an element.  Pass the string back through the block
and it'll skip out of escaping.

  div.comment { RedCloth.new(str).to_html }

But, if we have some raw text that needs escaping, pass it in
as an argument:

  div.comment raw_str

One caveat: if you have other tags inside a block, the string
passed back will be ignored.

  div.comment {
    div.author "_why"
    div.says "Torpedoooooes!"
    "<div>Silence.</div>"
  }

The final div above won't appear in the output.  You can't mix
tag modes like that, friend.

# 5. Auto-stringification

If you end up using any of your Markaby "tags" as a string, the
tag won't be output.  It'll be up to you to add the new string
back into the HTML output.

This means if you call <tt>to_s</tt>, you'll get a string back.

  div.title { "Rock Bottom" + span(" by Robert Wyatt").to_s }

But, when you're adding strings in Ruby, <tt>to_s</tt> happens automatically.

  div.title { "Rock Bottom" + span(" by Robert Wyatt") }

Interpolation works fine.

  div.title { "Rock Bottom #{span(" by Robert Wyatt")}" }

And any other operation you might perform on a string.

  div.menu! \
    ['5.gets', 'bits', 'cult', 'inspect', '-h'].map do |category|
      link_to category
    end.
    join( " | " )

# 6. The <tt>tag!</tt> Method

If you need to force a tag at any time, call <tt>tag!</tt> with the
tag name followed by the possible arguments and block.  The CssProxy
won't work with this technique.

  tag! :select, :id => "country_list" do
    countries.each do |country|
      tag! :option, country
    end
  end

# A Note About Rails Helpers

When used in Rails templates, the Rails helper object is passed into 
Markaby::Builder.  When you call helper methods inside Markaby, the output
from those methods will be output to the stream.  This is incredibly
handy, since most Rails helpers output HTML tags.

  head do
    javascript_include_tag 'prototype'
    autodiscovery_link_tag
  end

However, some methods are designed to give back a String which you can use
elsewhere.  That's okay!  Every method returns a Fragment object, which can
be used as a string.

  p { "Total is: #{number_to_human_size @file_bytes}" }

Also see the Quick Tour above, specifically the stuff about auto-stringification.

If for any reason you have trouble with fragments, you can just
call the <tt>@helpers</tt> object with the method and you'll get
the String back and nothing will be output.

  p { "Total is: #{@helpers.number_to_human_size @file_bytes}" }

Conversely, you may call instance variables from your controller by using
a method and its value will be returned, nothing will be output.

  # Inside imaginary ProductController
  def list
    @products = Product.find :all
  end

  # Inside app/views/product/list.mab
  products.each do |product|
    p product.title
  end

# Credits

Markaby is a work of immense hope by Tim Fletcher and why the lucky stiff.
Thankyou for giving it a whirl.

Markaby is inspired by the HTML library within cgi.rb.  Hopefully it will
turn around and take some cues.

