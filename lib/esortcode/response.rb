module Esortcode
  # Encapsulates the XML response from esortcode.com
  # it uses libxml or hpricot if it can otherwise it
  # will fall back to using rexml.
  class Response
    def initialize(resp)
      @response = resp.parsed_response.first[1]
      @response = @response && @response.reject do |k, _|
        k =~ /^xmlns/
      end
    end

    def valid?
      reason != '' && reason[0,7] != 'INVALID'
    end

    def reason
      @reason ||= @response['ValidationMessage'].to_s
    end

    def error?
      @response['IsError'] == "true"
    end

    def error_message
      @response['ErrorMessage']
    end
  end
end
