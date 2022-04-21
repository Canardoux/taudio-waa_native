

//#import  "../../rust/target/bindings.h"
#import  "taudio_waa_native.h"

// This will never be executed
extern "C" void dummyMethodToEnforceBundling ()
{
        rust_greeting("toto");
}
