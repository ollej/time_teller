#!/usr/bin/env ruby

require 'fuzzy_time'

class TimeTellerError < StandardError; end

class TimeTeller
  def initialize(opts = {})
    @action = :default
    parse(opts)
  end

  def parse(opts)
    if opts["--random"]
      @action = :random
      @value = opts["--random"].to_i
    end
    if opts["--sleep"]
      @action = :sleep
      @value = opts["--sleep"].to_i
    end
  end

  def time
    time = Time.now.fuzzy
    #puts "Time is: #{time}"
    time
  end

  def command
    "say '#{time}' #{@args}"
  end

  def tell_time
    #puts "Running command: #{command}"
    %x(#{command})
  end

  def randomize
    Random.new.rand(@value) unless @value.nil?
  end

  def random_action
    #puts "Randomizing: #{random}"
    tell_time if randomize == 0
  end

  def sleep_action
    #puts "Sleeping #{random}s"
    sleep randomize
    tell_time
  end

  def default_action
    tell_time
  end

  def run
    method = "#{@action}_action".to_sym
    raise TimeTellerError.new "Action not available: #{@action}" unless respond_to?(method)
    send(method)
  end
end

if __FILE__ == $0
  TimeTeller.new(ARGV).run
end
