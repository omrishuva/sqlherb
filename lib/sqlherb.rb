require "sqlherb/version"

module Sqlherb
  require 'erb'

  class Compiler

    attr_accessor :query_name, :raw_query, :compiled_query

    def initialize(path_to_query, arguments = {})
      @query_name = query_name
      @locals = arguments.with_indifferent_access if arguments
      @raw_query = File.read("#{path_to_query}.sql.erb")
    end

    def compile
      @compiled_query = ERB.new(raw_query).result(binding)
    end

    def print
      puts compiled_query
    end

  end
end
