BEGIN {
   host = "/inet/tcp/8081/0/0"
   while (1) {
      close(host)
      host |& getline
      print "HTTP/1.0 200 OK \n" |& host
      path = "."$2
      while ( (getline line < path) > 0 ) { 
        print line |& host
      }
      close(path)
   }
   close(host)
}
