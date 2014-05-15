#!/usr/bin/env ruby

require 'fuzzy_time'

class TimeTellerError < StandardError; end

class TimeTeller
  def initialize(opts = {})
    @action = :default
    @synth = :mac
    parse(opts)
  end

  def parse(opts)
    if opts["--espeak"]
      @synth = :espeak
      @voice = opts["--voice"] || 'english'
    else
      @voice = opts["--voice"] || 'Vicki'
    end
    @voice = voices.sample if opts["--random"]
    unless voices.include?(@voice)
      raise TimeTellerError.new "Voice not available: #{@voice}"
    end
    if opts["--chance"]
      @action = :chance
      @value = opts["--chance"].to_i
    end
    if opts["--sleep"]
      @action = :sleep
      @value = opts["--sleep"].to_i
    end
    if opts["--voices"]
      @action = :voices
    end
  end

  def voices
    @voices ||= if @synth == :espeak
        %x(speak --voices=en | tail -n +2 | sed 's/^ *//' | tr -s ' '| cut -d ' ' -f 4).split
      else
        %x(say --voice ? | awk '{print $1;}').split
      end
  end

  def time
    time = Time.now.fuzzy
    #puts "Time is: #{time}"
    time
  end

  def tell_time
    #puts "Running command: #{synth_command}"
    %x(#{synth_command})
  end

  def formatted_time
    "It is #{time}."
  end

  def randomize
    Random.new.rand(@value) unless @value.nil?
  end

  # TODO: Refactor into class
  def run
    method = "#{@action}_action".to_sym
    raise TimeTellerError.new "Action not available: #{@action}" unless respond_to?(method)
    send(method)
  end

  def chance_action
    #puts "Randomizing: #{random}"
    tell_time if randomize == 0
  end

  def sleep_action
    #puts "Sleeping #{random}s"
    sleep randomize
    tell_time
  end

  def voices_action
    puts "Available voices: #{voices.join ', '}"
  end

  def default_action
    tell_time
  end

  # TODO: Refactor into class
  def synth_command
    method = "#{@synth}_synth".to_sym
    raise TimeTellerError.new "Synth not available: #{@synth}" unless respond_to?(method)
    send(method)
  end

  def espeak_synth
    args = []
    args << "-v #{@voice}" unless @voice.nil?
    #puts "voice: #{@voice}"
    "speak '#{formatted_time}' #{args.join ' '}"
  end

  def mac_synth
    args = []
    args << "--voice #{@voice}" unless @voice.nil?
    "say '#{formatted_time}' #{args.join ' '}"
  end

end

if __FILE__ == $0
  TimeTeller.new(ARGV).run
end
