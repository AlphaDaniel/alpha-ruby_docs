#===========Requires==========
require 'colorize'
require 'open-uri'
require 'nokogiri'
require_relative '../lib/ruby_doc/version'
require_relative '../lib/ruby_doc/ui/CLI'
require_relative '../lib/ruby_doc/ui/UI'
require_relative '../lib/ruby_doc/data/scrapers'
require_relative '../lib/ruby_doc/data/meth'
require_relative '../lib/ruby_doc/data/doc'
#===========Testing===========
# require 'pry'
def x; exit!; end #Quit Exit