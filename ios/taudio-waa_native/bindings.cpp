
#include  "bindings.h"
// This will never be executed
extern "C" void dummyMethodToEnforceBundling ()
{
        rust_greeting("toto");
}
