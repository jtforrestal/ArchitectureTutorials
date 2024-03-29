#pragma once

//
// fib64.h
//
// Copyright (C) 2012 - 2017 jones@scss.tcd.ie
//
// example of mixing C++ and x64 assembly language
//

//
// NB: "extern C" to avoid procedure name mangling by C++ compiler
//

extern "C" _int64 g;
extern "C" _int64 minX64(_int64,_int64, _int64);	
extern "C" _int64 pX64(_int64, _int64, _int64, _int64);
extern "C" _int64 gcdX64(_int64, _int64);
extern "C" _int64 qX64(_int64, _int64, _int64, _int64, _int64);
extern"C"	_int64 qnsShadowSpace();
extern "C" _int64 qnsNoSpace();
// eof