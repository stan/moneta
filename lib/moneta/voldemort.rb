begin
  require "voldemort-rb"
rescue LoadError
  puts "You need the voldemort-rb gem to use the Voldemort store"
  exit
end

module Moneta
  class Voldemort
    include Defaults

    def initialize(options = {})
      options = {
        :host => 'localhost',
        :port => "6666",
        :db => 'cache'
      }.update(options)
      @cache = VoldemortClient.new(options[:db], "#{options[:host]}:#{options[:port]}")
    end

    def key?(key)
      !@cache[key].nil?
    end

    alias has_key? key?

    def [](key)
      @cache.get(key)
    end

    def []=(key, value)
      store(key, value)
    end

    def delete(key)
      value = @cache[key]
      @cache.delete(key) if value
      value
    end

    def store(key, value)
      @cache.put(key, value)
    end

  end
end
