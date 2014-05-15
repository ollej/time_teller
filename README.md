TimeTeller
==========

A small class to tell time. Can be used as a command line script or included
as a class. Supports sleeping a random number of seconds before telling the
time, as well as only telling the time with a randomized chance.

Usage
-----

### No arguments

Tells the time immediately.

```bash
  $ ruby tell_time.rb
```

### Sleep

Sleep between 1-60 seconds before speaking the time.

```bash
  $ ruby tell_time.rb sleep 60
```

### Random

A 1 in X chance that time is told, otherwise nothing happens.

```bash
  $ ruby tell_time random 6
```

TimeTeller class
----------------

The script includes a class that can be used in other code. Create a sub-class
and implement the `command` method to change the shell command to speak the
time.

TODO
----

 * Better option parsing, support args without action
 * Add support for espeak
 * Use ruby wrappers intead of using shell
 * Write tests
 * Create github repo
 * Push to rubygems
 * Make a daemon which tells time randomly.
 * Wrapper script which sets up ruby version/gemset
 * Randomize voice
