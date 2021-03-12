#!/bin/bash
exec scala -savecompiled "$0" "$@"
!#

import sys.process._
import java.io.File

/*
 * An example of a command using a pipe.
 * Redirects ls's STDOUT to a grep's STDIN.
 * The output are displayed on the user’s terminal.
 */
("ls" #| "grep \".jar\"").! 

// Bellow has the same behavior but #| is better because remember | from bash.
("ls" #> "grep \".jar\"").!
("grep \"jar\"" #< "ls").!
println()
 
/*
 * Create a file if it doesn't exist 
 * It would be "(new File("newFile.txt") #< "ls").!"
 * but bellow is more readable.
 */
("ls" #> new File("folder/newFile.txt")).! 
("ls" #>> new File("folder/file.txt")).! // Append to a file
 
/*
 * Note: The two last commands bellow has 
 * the same behavior than "cat file.txt | wc -l"
 * and not "wc -l file.txt".
 */ 
"wc -l folder/file.txt".!
(new File("folder/file.txt") #> "wc -l").! // like cat file.txt | wc -l
("wc -l" #< new File("folder/file.txt")).! // like cat file.txt | wc -l
