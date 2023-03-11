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

name          [A-Za-z][A-Za-z0-9]∗
number        [0-9]*
charconst
comment       "//".*"\n"

%%
/*[ \t]         {}*/

[\n]          {YYINCR(n);}

{comment}     {}

"and"       {printf("%s\n", yytext); return AND;} 
"by"         {printf("%s\n", yytext); return BY;}  
"char"     {printf("%s\n", yytext); return CHAR;}
"else"     {printf("%s\n", yytext); return ELSE;}
"for"       {printf("%s\n", yytext); return FOR;}  
"if"         {printf("%s\n", yytext); return IF;}  
"int"       {printf("%s\n", yytext); return INT;}  
"not"       {printf("%s\n", yytext); return NOT;}  
"or"         {printf("%s\n", yytext); return OR;}  
"procedure"        {printf("%s\n", yytext); return PROCEDURE;}
"read"     {printf("%s\n", yytext); return READ;}
"then"     {printf("%s\n", yytext); return THEN;}
"to"         {printf("%s\n", yytext); return TO;}  
"while"   {printf("%s\n", yytext); return WHILE;}  
"write"   {printf("%s\n", yytext); return WRITE;}
"+"       {printf("%s\n", yytext); return "+";}  
"-"       {printf("%s\n", yytext); return "-";}   
"*"       {printf("%s\n", yytext); return "*";}  
"/"       {printf("%s\n", yytext); return "/";}   
"<"       {printf("%s\n", yytext); return LT;}   
"<="      {printf("%s\n", yytext); return LE;}   
"=="      {printf("%s\n", yytext); return EQ;}   
"!="      {printf("%s\n", yytext); return NE;}   
">"       {printf("%s\n", yytext); return GT;}   
">="      {printf("%s\n", yytext); return GE;} 
":"       {printf("%s\n", yytext); return ":";}   
";"       {printf("%s\n", yytext); return ";";}   
","       {printf("%s\n", yytext); return ",";}   
"="       {printf("%s\n", yytext); return "=";}  
"{"       {printf("%s\n", yytext); return "{";}  
"}"       {printf("%s\n", yytext); return "}";}  
"["       {printf("%s\n", yytext); return "[";}       
"]"       {printf("%s\n", yytext); return "]";}  
"("       {printf("%s\n", yytext); return "(";}  
")"       {printf("%s\n", yytext); return ");}      

name      {printf("%s\n", yytext); return NAME;}  
number    {printf("%s\n", yytext); return NUMBER;}       
charconst       {printf("%s\n", yytext); return CHARCONST;}  

%%

/* user code */

