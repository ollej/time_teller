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
  $ bin/tell_time
```

### Sleep

Sleep between 1-60 seconds before speaking the time.

```bash
  $ bin/tell_time.rb --sleep=60
```

### Chance

A 1 in X chance that time is told, otherwise nothing happens.

```bash
  $ bin/tell_time --chance=6
```

### Espeak

Use espeak to synthesize voice instead of the Mac OS X Say command.

```bash
  $ bin/tell_time --espeak
```

### Voice

Set the voice to use.

```bash
  $ bin/tell_time --voice=Albert
```

### Voices

Show list of available voices.

```bash
  $ bin/tell_time --voices
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
 * Change --espeak to --synth which defaults to mac
 * Change random/sleep to action, to make it easier to add more.
 * Refactor docopt code into class
