import sys.process._

object Resource {
  // Bellow a function to get stdout, stderr and exit code.
  def runProcess(process: ProcessBuilder) = { 
    val stdout = new StringBuilder
    val stderr = new StringBuilder
    val status = process.!(ProcessLogger(stdout append _ append "\n", stderr append _ append "\n"))
    (stdout, stderr, status)
  }
}

object AnotherResource {
  def greet(name: String, age: Integer) = {
    println("My name is " + name)
    println("I'm " + age)
  }
}



