
#include <stdio.h>
#include <math.h>

#define SAMPLE_LEN 5

int main() {

	int i;
	float samples[SAMPLE_LEN][2] = {
		{1, -1},
		{2, -2},
		{3, -3},
		{4, -4},
		{5, -5},
	};

	printf("Samples:\n");
	for (i = 0; i < SAMPLE_LEN; ++i) {
		printf("%.2f %.2f\n", samples[i][0], samples[i][1]);
	}

	// find sample mean of x and y
	float sumX = 0, sumY = 0;

	for (i = 0; i < SAMPLE_LEN; ++i) {
		sumX += samples[i][0];
		sumY += samples[i][1];
	}

	float meanX = sumX / SAMPLE_LEN, meanY = sumY / SAMPLE_LEN;

	printf("Mean of X is %.2f, Mean of Y is %.2f\n", meanX, meanY);
	float var2X = 0, var2Y = 0;

	for (i = 0; i < SAMPLE_LEN; ++i) {
		float varX = (samples[i][0] - meanX);
		var2X += varX * varX;
		float varY = (samples[i][1] - meanY);
		var2Y += varY * varY;
	}

	// sample standard deviation (n-1) not population standard deviation
	float stdevX = sqrt(var2X / (SAMPLE_LEN-1)), stdevY = sqrt(var2Y / (SAMPLE_LEN-1));

	printf("Standard deviation of X is %.2f, Standard deviation of Y is %.2f\n", stdevX, stdevY);
	float rSum = 0;
	for (i = 0; i < SAMPLE_LEN; ++i) {
		float xScore = (samples[i][0] - meanX) / stdevX;
		float yScore = (samples[i][1] - meanY) / stdevY;
		rSum += xScore * yScore;
	}

	float r = rSum / (SAMPLE_LEN - 1);
	printf("Correlation is %.2f\n", r);
}