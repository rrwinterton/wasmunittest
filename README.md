# wasmunittest
This is a quick unit test example that provides currently a single unit test to call webassembly functions from the browser with an integer parameter.  The WebAssembly can then branch out to create multip tests in the same unit test if desired.  Or another option could be to pass different parameters to the unit tests that will in turn be passed to the webassembly.  If it is a webassembly call to another webassembly call then I would recommend using just an integer.  If the webassembly call is called from JavaScript then I would recommend you adding a unit test with the appropriate parameters and parsing for the JavaScript to WebAssembly call.  
 
