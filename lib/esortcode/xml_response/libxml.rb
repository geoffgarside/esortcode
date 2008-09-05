require 'libxml'
module Esortcode
  class XMLResponse
    private
      def parse(xml)
        @doc = LibXML::XML::Document.string(xml)
      end
      def value_of(node_name)
        @doc.find("//es:#{node_name}", 'es:https://ws.esortcode.com').content
      end
  end
end
