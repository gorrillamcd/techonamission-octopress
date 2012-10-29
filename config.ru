require 'bundler/setup'
require 'sinatra/base'
require 'dalli'
require 'rack-cache'
require 'memcachier'
require 'newrelic_rpm'
# require 'unicorn'

# Initialize Memcachier on Rack::Cache
use Rack::Cache,
  verbose: true,
  metastore:   Dalli::Client.new,
  entitystore: "file:tmp/cache/rack/body"

# Serves static content with specific max-age
use Rack::Static,
  :urls => ["/assets", "/images", "/javascripts", "/stylesheets", "/media" ],
  :root => 'public',
  :cache_control => 'public, max-age=2592000'
# Handles gzip compression
use Rack::Deflater

# The project root directory
$root = ::File.dirname(__FILE__)

# Make NewRelic play nice with Unicorn
NewRelic::Agent.after_fork(:force_reconnect => true) if defined? Unicorn

class SinatraStaticServer < Sinatra::Base  

  # configure :production do
  #   require 'newrelic_rpm'
  # end

  before do
    expires 3600, :public, :must_revalidate
  end

  get(/.+/) do
    send_sinatra_file(request.path) {404}
  end

  not_found do
    send_sinatra_file('404.html') {"Sorry, I cannot find #{request.path}"}
  end

  def send_sinatra_file(path, &missing_file_block)
    file_path = File.join(File.dirname(__FILE__), 'public',  path)
    file_path = File.join(file_path, 'index.html') unless file_path =~ /\.[a-z]+$/i  
    File.exist?(file_path) ? send_file(file_path) : missing_file_block.call
  end

end

run SinatraStaticServer