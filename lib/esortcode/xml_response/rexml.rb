require 'rexml/document'
module Esortcode
  class XMLResponse
    def initialize(xml)
      @doc = REXML::Document.new(xml)
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
        @doc.get_text("*/#{node_name}")
      end
  end
end
