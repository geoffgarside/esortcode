$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'httparty'
require 'esortcode/client'
require 'esortcode/errors'
require 'esortcode/xml_response'
