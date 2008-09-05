begin
  gem 'libxml', '>= 0.8.3'
  require 'esortcode/xml_response/libxml'
rescue LoadError
  begin
    gem 'hpricot', '>= 0.6'
    require 'esortcode/xml_response/hpricot'
  rescue LoadError
    require 'esortcode/xml_response/rexml'
  end
end
