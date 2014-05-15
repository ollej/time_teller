#!/usr/bin/env ruby

require 'fuzzy_time'

class TimeTeller
  def initialize(args = [])
    @action = :default
    parse(args)
  end

  def parse(args)
    return unless args.size > 0
    @action = args.shift.to_sym
    @value = args.shift.to_i if args.size > 0
    @args = args.join ' ' if args.size > 0
    #puts "action: #{@action} value: #{@value}"
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
