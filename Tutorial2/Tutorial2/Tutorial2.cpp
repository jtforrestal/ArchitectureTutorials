//
// t2Test.cpp
//
// Copyright (C) 2012 - 2017 jones@scss.tcd.ie
//
// 09/10/17	first version
//

#include "stdafx.h"
#include "pch.h"
#include <tchar.h>
		// pre-compiled headers
#include <iostream>			// cout
#include <conio.h>			// _getch
#include	<stdio.h>
#include<stdlib.h>
#include "fib64.h"			//
#include "t2.h"	//

using namespace std;		// cout

//
// fib: C++
//
_int64 fib(_int64 n) {
	_int64 fi, fj, t;
	if (n <= 1)
		return n;
	fi = 0;
	fj = 1;
	while (n > 1) {
		t = fj;
		fj = fi + fj;
		fi = t;
		n--;
	}
	return fj;
}

//
// check
//
void check(char *s, _int64 v, _int64 expected) {
	cout << s << " = " << v;
	if (v == expected) {
		cout << " OK";
	}
	else {
		cout << " ERROR: should be " << expected;
	}
	cout << endl;
}

//
// _tmain
//
int main(int argc, char* argv[]) {

	minX64(1, 2, 3);

	//
	// tutorial 2
	//
	check((char*)"g", g, 4);
	g++;
	check((char*)"g", g, 5);
	g--;
	check((char*)"g", g, 4);

	check((char*)"minX64(1, 2, 3)", minX64(1, 2, 3), 1);
	check((char*)"minX64(3, 1, 2)", minX64(3, 1, 2), 1);
	check((char*)"minX64(2, 3, 1)", minX64(2, 3, 1), 1);
	check((char*)"minX64(-1, -2, -3)", minX64(-1, -2, -3), -3);
	check((char*)"minX64(-3, -1, -2)", minX64(-3, -1, -2), -3);
	check((char*)"minX64(-2, -3, -1)", minX64(-2, -3, -1), -3);
	check((char*)"minX64(-1, 2, 3)", minX64(-1, 2, 3), -1);
	check((char*)"minX64(3, -1, 2)", minX64(3, -1, 2), -1);
	check((char*)"minX64(2, 3, -1)", minX64(2, 3, -1), -1);

	check((char*)"pX64(0, 1, 2, 3)", pX64(0, 1, 2, 3), 0);
	check((char*)"pX64(5, 6, 7, 8)", pX64(5, 6, 7, 8), 4);
	check((char*)"pX64(3, 2, 1, 0)", pX64(3, 2, 1, 0), 0);
	check((char*)"pX64(8, 7, 6, 5)", pX64(8, 7, 6, 5), 4);

	check((char*)"gcdX64(14, 21)", gcdX64(14, 21), 7);
	check((char*)"gcdX64(1406700, 164115)", gcdX64(1406700, 164115), 23445);

	check((char*)"qX64(1, 2, 3, 4, 5)", qX64(1, 2, 3, 4, 5), 15);
	check((char*)"qX64(-1, 2, -3, 4, -5)", qX64(-1, 2, -3, 4, -5), -3);

	//check("qns()", qns(), 0);

	cout << endl;

	//
	// fib: C++
	//
	for (int i = -1; i < 20; i++)
		cout << fib(i) << " ";
	cout << endl;

	//
	// fib: x64 assembly language
	//
	fibX64(10);
	for (int i = -1; i < 20; i++)
		cout << fibX64(i) << " ";
	cout << endl;

	_getch();

	return 0;

}

// eof
