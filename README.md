Dia Präsentation

# Generate data

## Setup Ruby on OS X using `brew`

```
brew install ruby
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
/usr/local/opt/ruby/bin/gem install jekyll-import
```

## Tumblr import to Jekyll

```
/usr/local/opt/ruby/bin/ruby -r rubygems -e 'require "jekyll-import";
    JekyllImport::Importers::Tumblr.run({
      "url"            => "https://diapraesentation.tumblr.com/",
      "format"         => "md", # or "md"
      "grab_images"    => true,  # whether to download images as well.
      "add_highlights" => false,  # whether to wrap code blocks (indented 4 spaces) in a Liquid "highlight" tag
      "rewrite_urls"   => false   # whether to write pages that redirect from the old Tumblr paths to the new Jekyll paths
    })'
```

## Jekyll import to Hugo

```
hugo import jekyll --force --debug ../tmp/ .
```

# Starting hugo

```
/usr/local/bin/hugo server -D --debug --disableFastRender --renderToDisk
```
