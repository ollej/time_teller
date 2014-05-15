#!/usr/bin/env ruby

require 'fuzzy_time'

class TimeTeller
  def initialize(args = [])
    parse(args)
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

  def parse(args)
    return unless args.size > 0
    @action = args.shift.to_sym
    @value = args.shift.to_i if args.size > 0
    @args = args.join ' ' if args.size > 0
    #puts "action: #{@action} value: #{@value}"
  end

  def randomize
    Random.new.rand(@value) unless @value.nil?
  end

  def run
    case @action
    when :random
      #puts "Randomizing: #{random}"
      tell_time if randomize == 0
    when :sleep
      #puts "Sleeping #{random}s"
      sleep randomize
      tell_time
    else
      tell_time
    end
  end
end

if __FILE__ == $0
  TimeTeller.new(ARGV).run
end
