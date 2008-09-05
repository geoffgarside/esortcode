require 'rexml/document'
module Esortcode
  class XMLResponse
    private
      def parse(xml)
        @doc = REXML::Document.new(xml)
      end
      def value_of(node_name)
        @doc.get_text("*/#{node_name}")
      end
  end
end
