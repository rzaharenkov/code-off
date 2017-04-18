# README #

This is a demo project that implements a tool for translation of messages to obfuscated Morse code format.

### Challenge ###

Write a program that will accept text either from stdin, or as a file path and will translate the alphanumeric sentence to Morse code. Then for bonus points, obfuscate the Morse code. Below is a list of international Morse code and the algorithm for obfuscation. Separate letters with pipe (|), and separate words with forward slash (/).

More details [here](https://gist.github.com/kmckelvin/41a4a69e397b510274373aa241698561)

### How to use ###

1. Checkout the project:

```
git clone git@github.com:rzaharenkov/code-off.git
```

2. Translate text from the file:

```
bin/code-off spec/test_data/success_test.txt
```

3. Run translator in the interactive mode:

```
bin/code-off
HELLO
4|1|1A2|1A2|C
```

Use the end of file (Ctrl-D) or terminate (Ctrl-C) to exit.
