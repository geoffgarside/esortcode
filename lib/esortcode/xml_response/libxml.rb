require 'libxml'
module Esortcode
  class XMLResponse
    def initialize(xml)
      @doc = LibXML::XML::Document.string(xml)
    end
    
    def valid?
      value_of(:ValidationMessage) == 'VALID'
    end
    
    def reason
      value_of(:ValidationMessage)
    end
    
    def error?
      value_of(:IsError) == "true"
    end
    
    def error_message
      value_of(:ErrorMessage)
    end
    
    private
      def value_of(node_name)
        @doc.find("//es:#{node_name}", 'es:https://ws.esortcode.com').content
      end
  end
end
