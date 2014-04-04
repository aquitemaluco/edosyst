#include <stdio.h>
#include <string.h>

struct mystats {
	char cpusystem[20];
	char cpuuser[20];
	char pgpgin[20];
	char pgpgout[20];
};

int main(int argc, char *argv[]) {

	if (argc != 2) {
		fprintf (stderr, "argumento invalido para o nome do arquivos!\n");
		return 1;
	}

    FILE *file, *fileout;
    char line[256];
    char *pos;
	int i = 0, j = 0;

	struct mystats stats;

	fileout = fopen(argv[1], "w+");

	for (;;) {
		file = fopen("/proc/stat", "r");
		fgets(line, sizeof(line), file);

		if (strlen(line) > 0) {
			char *tok, *saved;
			tok = strtok_r(line, " ", &saved);
			do {
				if (i == 1 || i == 3) {
					if ((pos=strchr(tok, '\n')) != NULL)
						*pos = '\0';

					if (i == 1)
						strcpy(stats.cpusystem, tok);
					else
						strcpy(stats.cpuuser, tok);
				}
				i++;
			} while (tok = strtok_r(NULL, " ", &saved));
		}

		fclose(file);

		i = 0;
		file = fopen("/proc/vmstat", "r");
		while(fgets(line, sizeof(line), file) != NULL) {
			if(i == 29 || i == 30) {
				int j = 0;
				char *tok, *saved;
				tok = strtok_r(line, " ", &saved);
				do {
					if(j == 1) {
						if ((pos=strchr(tok, '\n')) != NULL)
							*pos = '\0';

						if (i == 29)
							strcpy(stats.pgpgin, tok);
						else
							strcpy(stats.pgpgout, tok);
					}
					j++;
				} while (tok = strtok_r(NULL, " ", &saved));
			}

			i++;
		}

		fclose(file);
		fprintf (stdout, "%s %s %s %s\n", stats.cpusystem,
				stats.cpuuser, stats.pgpgin, stats.pgpgout);
		fflush(fileout);

		sleep(1);
    }
}
