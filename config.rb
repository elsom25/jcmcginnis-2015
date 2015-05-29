Slim::Engine.disable_option_validator!

###
# Helpers
###

helpers do
  def external_link_to(body, url, html_options={})
    html_options[:rel] ||= 'external'
    link_to body, url, html_options
  end
end

###
# Settings
###

set :css_dir,    'stylesheets'
set :js_dir,     'javascripts'
set :images_dir, 'images'

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Build-specific configuration
configure :build do
  activate :minify_html
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
end
