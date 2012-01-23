#!/bin/bash

# Remove ugly gtk resize handler
# @see http://askubuntu.com/questions/47831/how-to-remove-gvims-fat-bottom-border-and-resize-grip
echo 'style "no-resize-handle"
{
    GtkWindow::resize-grip-height = 0
    GtkWindow::resize-grip-width = 0
}

class "GtkWidget" style "no-resize-handle"

style "vimfix" {
  bg[NORMAL] = "#242424" # Random dark color
}
widget "vim-main-window.*GtkForm" style "vimfix"' > ~/.gtkrc-2.0
