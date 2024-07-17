#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define LINE_MAX 2048

void search_stream(FILE *stream, char pathname[], char search_string[]) {
	char line[LINE_MAX];	
	int line_no = 1;

	while (fgets(line, LINE_MAX, stream) != NULL) {
		if (strstr(line, search_string) != NULL) {
			printf("%s:%d:%s", pathname, line_no, line); 
		}
		line_no++;
	}

}

int main(int argc, char *argv[]) {
	if (argc < 2) {
		fprintf(stderr,"Usage: %s search_string <file1 file2...>\n", argv[0]);
		exit(1);
	}

	if (argc == 2) {
		search_stream(stdin, "<stdin>", argv[1]);
	} else {
		// search through our files
		for (int arg = 2; arg < argc; arg++) {
			char *pathname = argv[arg];

			// open file
			FILE *f = fopen(pathname, "r");
			if (f == NULL) {
				perror(pathname);
				exit(1);
			}

			search_stream(f, pathname, argv[1]);
			fclose(f);
		}
	} 
}
