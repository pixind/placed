require 'rubygems'
require 'httparty'
require 'generators/config_generator'

%w(location version).each do |file|
  require File.join(File.dirname(__FILE__), 'placed', file)
end