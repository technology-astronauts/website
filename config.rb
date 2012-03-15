###
# Page command
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Change the CSS directory
# set :css_dir, "alternative_css_directory"

# Change the JS directory
# set :js_dir, "alternative_js_directory"

# Change the images directory
# set :images_dir, "alternative_image_directory"

# A small hack that is needed to have textile ignore line breaks. This 
# allows me to still format things nicely for an editor and get html paragraphs
# at the same time. 
#
class NBRedClothTemplate < Tilt::RedClothTemplate
  def prepare
    super
    @engine.hard_breaks = false
  end
end
Tilt.register NBRedClothTemplate, 'textile'
Tilt.prefer NBRedClothTemplate

Slim::Engine.set_default_options :pretty => true

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css
  
  # Minify Javascript on build
  # activate :minify_javascript
  
  # Enable cache buster
  # activate :cache_buster
  
  # Use relative URLs
  # activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end