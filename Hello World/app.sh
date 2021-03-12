#!/bin/bash
exec scala -savecompiled "$0" "$@"
!#

object Application extends App {
  println("extends App")
  args foreach println 
}
