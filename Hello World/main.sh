#!/bin/bash
exec scala -savecompiled "$0" "$@"
!#

object Main {
  def main(args: Array[String]): Unit = {
    println("def main")
    args foreach println    
  }
}
