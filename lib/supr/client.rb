require 'rubygems'
require 'net/http'
require 'uri'

module Supr
  API_URL     = 'http://su.pr/api/'
  API_VERSION = '1.0'

  def self.new(login, api_key)
    Supr::Client.new(login,api_key)
  end

  class Client
    
    include Supr::Utils
    
    def initialize(login,api_key)
      @login = login
      @api_key = api_key
    end

    def shorten(input, opts={})
      if input.is_a? String
        request = create_url("shorten", :longUrl => input, :history => (opts[:history] ? 1 : nil))
        result = get_result(request)
        result = {:long_url => input}.merge result[input]
        Supr::Url.new(@login,@api_key,result)
      elsif input.is_a? Array
        request = create_url("shorten", :history => (opts[:history] ? 1 : nil))
        request.query << "&" + input.map { |long_url| "longUrl=#{CGI.escape(long_url)}" }.join("&") unless input.nil?
        result = get_result(request)
        input.map do |long_url|
          new_url = {:long_url => long_url}.merge result[long_url]
          long_url = Supr::Url.new(@login,@api_key,new_url)
        end
      else
        raise ArgumentError.new("Shorten requires either a url or an array of urls")
      end
    end
    
    def validate
      @validated ||= begin
        self.shorten("http://google.com").kind_of?(::Supr::Url)
      rescue
        false
      end
    end
    alias :valid? :validate
    
    def expand(input)
      if input.is_a? String
        if input.include?('su.pr/') || input.include?('j.mp/')
          hash = create_hash_from_url(input)
          request = create_url "expand", :hash => hash
          result = get_result(request)
          result = { :short_url => input, :hash => hash }.merge result[hash]
        else
          request = create_url "expand", :hash => input
          result = get_result(request)
          result = { :hash => input, :short_url => "http://su.pr/#{input}" }.merge result[input]
        end
        Supr::Url.new(@login,@api_key,result)        
      elsif input.is_a? Array
        request = create_url "expand", :hash => input.join(',')
        result = get_result(request)
        input.map do |hsh|
          new_url = {:hash => hsh, :short_url => "http://su.pr/#{hsh}"}.merge result[hsh]
          hsh = Supr::Url.new(@login,@api_key,new_url)
        end
      else
        raise ArgumentError('Expand requires either a short url, a hash or an array of hashes')
      end
    end
    
    # def info(input)
    #   if input.is_a? String
    #     if input.include? "su.pr/"
    #       hash = create_hash_from_url(input)
    #       request = create_url 'info', :hash => hash
    #       result = get_result(request)
    #       result = { :short_url => "http://su.pr/#{hash}", :hash => hash }.merge result[hash]
    #     else
    #       request = create_url 'info', :hash => input
    #       result = get_result(request)
    #       result = { :short_url => "http://su.pr/#{input}", :hash => input }.merge result[input]
    #     end
    #     Supr::Url.new(@login,@api_key,result)
    #   elsif input.is_a? Array
    #     request = create_url "info", :hash => input.join(',')
    #     result = get_result(request)
    #     input.map do |hsh|
    #       new_url = {:hash => hsh, :short_url => "http://su.pr/#{hsh}"}.merge result[hsh]
    #       hsh = Supr::Url.new(@login,@api_key,:info => new_url)
    #     end
    #   else
    #     raise ArgumentError.new('Info requires either a short url, a hash or an array of hashes')
    #   end
    # end
    # 
    # def stats(input)
    #   if input.is_a? String
    #     if input.include? "su.pr/"
    #       hash = create_hash_from_url(input)
    #       request = create_url 'stats', :hash => hash
    #       result = get_result(request)
    #       result = { :short_url => "http://su.pr/#{hash}", :hash => hash }.merge result
    #     else
    #       request = create_url 'stats', :hash => input
    #       result = get_result(request)
    #       result = { :short_url => "http://su.pr/#{input}", :hash => input }.merge result
    #     end
    #     Supr::Url.new(@login,@api_key,:stats => result)
    #   else
    #     raise ArgumentError.new("Stats requires either a short url or a hash")
    #   end
    # end
    
  end
  
end

class SuprError < StandardError
  attr_reader :code
  alias :msg :message
  def initialize(msg, code)
    @code = code
    super("#{msg} - '#{code}'")
  end
end