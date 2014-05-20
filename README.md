TimeTeller
==========

A small class to tell time. Can be used as a command line script or included
as a class. Supports sleeping a random number of seconds before telling the
time, as well as only telling the time with a randomized chance.

Requirements
------------

You need either a Mac with the say command, or the eSpeak command:
http://espeak.sourceforge.net/

Install
-------

```bash
  $ gem install time_teller
```

To have the time spoken randomly once an hour every weekday, add this to your crontab:

```
0 * * * 1-5 tell_time --synth=espeak --sleep=3600
```

Usage
-----

### No arguments

Tells the time immediately.

```bash
  $ tell_time
```

### Sleep

Sleep between 1-60 seconds before speaking the time.

```bash
  $ tell_time --sleep=60
```

### Chance

A 1 in X chance that time is told, otherwise nothing happens.

```bash
  $ tell_time --chance=6
```

### Synth

Set `--synth` to espeak to synthesize voice instead of the Mac OS X Say command.

```bash
  $ tell_time --synth espeak
```

### Voice

Set the voice to use.

```bash
  $ tell_time --voice=Albert
```

### Voices

Show list of available voices.

```bash
  $ tell_time --voices
```


TimeTeller class
----------------

The script includes a class that can be used in other code. Create a sub-class
and implement the `synth_command` method to change the shell command to speak the
time.

TODO
----

 * Use ruby wrappers intead of using shell
 * Write tests
 * Push to rubygems
 * Make a daemon which tells time randomly.
 * Wrapper script which sets up ruby version/gemset
 * Change random/sleep to action, to make it easier to add more.
 * Refactor docopt code into class
 * Add --verbose flag
 * Add log support
