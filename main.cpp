#define WASM_EXPORT __attribute__((visibility("default")))
//includes
#include <iostream>
#include <stdio.h>
#include <emscripten.h>
#include <emscripten/html5.h>
#include <string.h>
#include <emscripten/fetch.h>
#include <emscripten/val.h>

//debug
#define CONSOLE_OUTPUT 1

//UnitTest1
extern "C"
{
    WASM_EXPORT int UnitTest1(int inputParam)
    {
#ifdef CONSOLE_OUTPUT        
        std::cout << "executing UnitTest1(" << inputParam << ")" << std::endl;
#endif        
        return 0;
    }
}


//runs immediately may use for initialization if desired
extern "C"
{
    WASM_EXPORT int main(int argc, char *argv[])
    {
#ifdef CONSOLE_OUTPUT        
        std::cout << "main " << argc << " arguments:" << std::endl;
        for (int i = 0; i < argc; ++i)
        {
            std::cout << argv[i] << std::endl;
        }
#endif        
        return 0;
    }
}
