# awesome

## Overview

This is my configuration for the [awesome](http://awesome.naquadah.org/) window
manager. Some machine specific configurations can be applied in configuration
files.

## Installation

	DOTAWESOME=`pwd`
	cd $HOME/.config
	ln -s $DOTAWESOME awesome

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
dot. `1.5` targets the fifth tag on screen one. Each tag in this JSON file can
have multiple propierties.

#### Size Hint

The `hint` property is given to the layout to determine the proportion of the
layout. Tiling layouts use it as the ratio between the main window and ther rest.

#### Layout

The `layout` property determines the layout which is used in this tag. The value
should reference a valid layout from `awful.layout.suit`.

