#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char *argv[])
{
	if(argc != 8) {
		printf("Argumentos invalidos %d\n", argc);
		exit(1);
	}

	unsigned int i = atoi(argv[1]);
	unsigned int N = atoi(argv[2]);
	unsigned int S = atoi(argv[3]);
	unsigned int W = atoi(argv[4]);
	unsigned int tc = atoi(argv[5]);
	unsigned int ts = atoi(argv[6]);

	long t = atol(argv[7]);
	long tp = (N * tc) + tc;
	long tf = t + tp;

	sleep(10 + i * tc);
	char *p;
	p = malloc(S*sizeof(char));

	int j, pos;
	for(;;){
		long tt = time(NULL);
		if(time(NULL) >= tf) {
			free(p);
			exit(0);
		}

		for(j = 0; j < W; j++) {
			pos = rand() % (S);
			p[pos] = rand() % 256;
		}

		usleep(ts*1000);
	}
}
