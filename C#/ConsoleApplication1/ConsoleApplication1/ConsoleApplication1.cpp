// ConsoleApplication1.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;


int main(){
	/* Enter your code here. Read input from STDIN. Print output to STDOUT */
	int n;
	cin >> n;
	int numbers[n];
	int input;

	for (int i = 0; i<n; i++) {
		scanf("%d", &input);
		numbers[i] = input;
	}

	for (int j = n - 1; j >= 0; j--) {
		printf("%d ", numbers[j]);
	}
	return 0;
}

