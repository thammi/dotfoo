# awesome

## Overview

This is my configuration for the [awesome](http://awesome.naquadah.org/) window
manager. Some machine specific configurations can be applied in configuration
files.

## Installation

	DOTAWESOME=`pwd`
	cd $HOME/.config
	ln -s $DOTAWESOME awesome

## Autostart

You can specify some autostart commands in the `autostart` file. Each line in it
represents a command which should be executed at startup. The commands are only
executed if the process is not running, yet.

