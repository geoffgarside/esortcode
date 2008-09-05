require 'hpricot'
module Esortcode
  class XMLResponse
    private
      def parse(xml)
        @doc = Hpricot::XML(xml)
      end
      def value_of(node_name)
        (@doc/node_name).text
      end
  end
end
