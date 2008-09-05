module Esortcode
  # Encapsulates the XML response from esortcode.com
  # it uses libxml or hpricot if it can otherwise it
  # will fall back to using rexml.
  class XMLResponse
    def initialize(xml)
      parse(xml)
    end
    
    def valid?
      reason != '' && reason[0,7] != 'INVALID'
    end
    
    def reason
      @reason ||= value_of(:ValidationMessage)
    end
    
    def error?
      value_of(:IsError) == "true"
    end
    
    def error_message
      value_of(:ErrorMessage)
    end
  end
end

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