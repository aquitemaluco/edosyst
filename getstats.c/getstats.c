#include <stdio.h>
#include <string.h>
#include <stdlib.h>

struct mystats {
	char cpusystem[20];
	char cpuuser[20];
	long long cputotal;
	long int memused; //KB
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
	int time = 0, i = 0, j = 0;
	long long int a[7];

	struct mystats stats;

	fileout = fopen(argv[1], "w+");
	fprintf (fileout, "\"Time\";\"CPU.user\";\"CPU.kernel\";\"CPU.total\";\"MEM.used\";\"Page.in\";\"Page.out\"\n");

	for (;;) {
		file = fopen("/proc/stat", "r");
		fgets(line, sizeof(line), file);

		if (strlen(line) > 0) {
			char *tok, *saved;
			tok = strtok_r(line, " ", &saved);
			tok = strtok_r(NULL, " ", &saved); //User
			a[0] = atoll(tok);
			strcpy(stats.cpuuser, tok);

			tok = strtok_r(NULL, " ", &saved);
			a[1] = atoll(tok);
			tok = strtok_r(NULL, " ", &saved); //System
			a[2] = atoll(tok);
			strcpy(stats.cpusystem, tok);

			tok = strtok_r(NULL, " ", &saved);
			a[3] = atoll(tok);

			tok = strtok_r(NULL, " ", &saved);
			a[4] = atoll(tok);
			tok = strtok_r(NULL, " ", &saved);
			a[5] = atoll(tok);
			tok = strtok_r(NULL, " ", &saved);
			a[6] = atoll(tok);

			stats.cputotal = a[0]+a[1]+a[2]+a[3]+a[4]+a[5]+a[6];
		}

		fclose(file);

		i = 0;
		file = fopen("/proc/meminfo", "r");
		long int memtotal=0, memfree=0, swaptotal=0, swapfree=0;
		while(fgets(line, sizeof(line), file) != NULL) {
			if (i == 0 || i == 1 || i == 17 || i == 18) {
				char *tok, *saved;
				tok = strtok_r(line, " ", &saved);
				tok = strtok_r(NULL, " ", &saved);
				if ((pos = strchr(tok, '\n')) != NULL)
					*pos = '\0';

				if (i == 0) {//mem total
					memtotal = atol(tok);
				}
				else if (i == 1) {//mem free
					memfree = atol(tok);
				}
				else if (i == 17) {//swap total
					swaptotal = atol(tok);
				}
				else {//swap free
					swapfree = atol(tok);
					stats.memused = (memtotal - memfree) +
							(swaptotal - swapfree);
				}
			}

			i++;
		}

		fclose(file);

		i = 0;
		file = fopen("/proc/vmstat", "r");
		while(fgets(line, sizeof(line), file) != NULL) {
			if (i == 36 || i == 37) {
				char *tok, *saved;
				tok = strtok_r(line, " ", &saved);
				tok = strtok_r(NULL, " ", &saved);
				if ((pos = strchr(tok, '\n')) != NULL)
					*pos = '\0';

				if (i == 36) {
					strcpy(stats.pgpgin, tok);
				}
				else {
					strcpy(stats.pgpgout, tok);
				}
			}

			i++;
		}

		fclose(file);

		time++;
		fprintf (fileout, "%i;%s;%s;%Li;%li;%s;%s\n", time,
				stats.cpuuser, stats.cpusystem, stats.cputotal,
				stats.memused, stats.pgpgin, stats.pgpgout);
		fflush(fileout);

		sleep(1);
    }
}
