/* File : example.i */
%module example




%apply int&  { int& s };

%typemap(in) Object *& (Object *ppDouble  = NULL) %{
$1 = &ppDouble  ;
%}

%typemap(argout) Object *& {
*(Object **)&jarg2 = *$1;
}

%typemap(cstype)Object *&  "/*cstype*/ out Object"
%typemap(csin) Object *& "out $csinput"


%{
#include "object.h"
#include "engine.h"
%}




%include "object.h"
%include "engine.h"