# awesome

## Overview

This is my configuration for the [awesome](http://awesome.naquadah.org/) window
manager. Some machine specific configurations can be applied in configuration
files.

## Installation

	DOTAWESOME=`pwd`
	cd $HOME/.config
	ln -s $DOTAWESOME awesome

## Dependencies

Mandatory dependencies:

* awesome (known to work with 3.4.10)
* luajson
* luafilesystem

On Debian simply run:

	apt-get install awesome liblua5.1-filesystem0 liblua5.1-json

Starting at rc.lua:30 there are some commands configured. You can change them if
you want to use alternatives. The defaults are:

* i3lock
* xtrlock
* x-terminal-emulator
* editor

## Configuration

### Concept

The host specific configuration is saved in a directory with the name of the
hostname of the system it applies to.

For some examples look into the configuration for my machines which are
included in this repository.

### Autostart

You can specify some autostart commands in the `autostart` file. Each line in it
represents a command which should be executed at startup. The commands are only
executed if the process is not running, yet.

### Tags

#### Overview

The file `tags.json` includes configuration concerninge single tags. Every tag
is identified by the screen it is on and its number on this screen splitted by a
dot. `1.5` targets the fifth tag on screen one. Single numbers are interpreted
as tags on screen one.

Each tag in this JSON file can have multiple propierties which are described
below.

#### Size Hint

The `hint` property is given to the layout to determine the proportion of the
layout. Tiling layouts use it as the ratio between the main window and ther rest.

#### Layout

The `layout` property determines the layout which is used in this tag. The value
should reference a valid layout from `awful.layout.suit`.

### Rules

The `rules.json` file enables you to expand the rules applied to new windows.
The JSON files should contain rules with the structure which `awful.rules.rules`
accepts. They are simply appended to these rules. Only the tag property is
replaced by the actual tag represented by the given tag id (see above).

