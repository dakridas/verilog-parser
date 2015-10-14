#include <stdio.h>
#include <stdlib.h>
#include <gtk/gtk.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include "gui.h"
#include "parser.h"
#include "../parser/lib/verilog_parser.tab.h"
#include "../parser/lib/structures.h"

extern FILE *yyin;

/* Use verilog parser to parse the specified verilog file */
void parse_file(GObject *object) {
    // open given file
    yyin = fopen("grammar_examples/bit_selects_grammar.v", "r");
    // parse file
    yyparse();
    // close file
    fclose(yyin);
}

/* Takes the string, append it to the end of log file */
/* and returns the refreshed log in a string */
gchar *get_parser_log(gchar *string) {
    char *buffer;
    long length;
    // open log file
    FILE *fd = fopen("parser.log","ab+");
    // append string to file
    fprintf(fd, "%s", string);

    // seek to the end of file
    fseek(fd, 0, SEEK_END);
    // save the file length
    length = ftell(fd);
    // seek to the beggining of file
    fseek(fd, 0, SEEK_SET);
    // allocate space for the buffer
    buffer = (char *) malloc(length*sizeof(char));
    if (!buffer) {
        perror("malloc: can't allocate memory\n");
        return NULL;
    }
    // read contents to buffer
    fread(buffer, 1, length-1, fd);

    // close file
    fclose(fd);
    return buffer;
}
/* Parser's Thread function. The thread checks the redirected */
/* standard ouput, for messages from parser and display them */
/* to label */
void *display_parser_output() {

    gint chars_read;
    gchar buf[100*1024];
    gchar *log;

    //Redirect fds[1] to be writed with the standard output.
    dup2 (fds[1], 1);
    // TODO
    // Listen for a stop signal from main thread,
    // to stop the loop. After the signal remove the
    // parser log file.
    while(1) {
        // read from pipe
        chars_read = read(fds[0], buf, 1024);
        fprintf(stderr, "%i chars: %s\n", chars_read, buf);
        // get refreshed parser log
        log = get_parser_log(buf);
        // display data to the label
        gtk_label_set_text((GtkLabel*)(parser.parser_output_label), log);
    }
    return 0;
}

