%option noyywrap
%{

 /* DEMO scanner
  * 
  * Written at Rice University, Houston, Texas.
  *
  */
 
 /* definitions */

#ifdef FLEX_SCANNER
extern int yylineno;
#define YYINCR(n) yylineno += n
#else
#define YYINCR(n)
#endif

#include "tokens.h"
#include "strings.h"
#include "demo.h"


int CTRL_M = 0;

%}
%%
 /* rules  */

%%

/* user code */
