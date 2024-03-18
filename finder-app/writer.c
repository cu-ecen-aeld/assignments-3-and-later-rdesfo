/*
 * File: writer.c
 * Author: Ryan Desfosses
 *
 * resources:
 * https://stackoverflow.com/questions/49247612/how-can-i-check-if-the-value-of-argvi-is-null-and-if-it-is-true-end-the-progra
 * https://www.freecodecamp.org/news/file-handling-in-c-how-to-open-close-and-write-to-files/
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <syslog.h>
#include <errno.h>


int main(int argc, char** argv){
  int fd;

  // check for arguements 
  if ( argv[1] == NULL ){
        printf("missing file path");
        exit(1);
  }


  if ( argv[2] == NULL ){
      printf("missing write string");
      exit(1);
  }

  char *writefile = argv[1];
  FILE *filename = fopen(writefile, "w");
  char *writestr = argv[2];

  // write to buffer
  openlog(NULL, 0, LOG_USER);
  fprintf(filename, "%s\n", writestr);
  if (errno == EINTR){
    syslog(LOG_ERR, "Writing %s to %s", writestr, writefile);
  } else {
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);
  }



}