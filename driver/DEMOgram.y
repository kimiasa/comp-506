%{ 
/* Copyright 2016, Keith D. Cooper & Linda Torczon
 * 
 * Written at Rice University, Houston, Texas as part
 * of the instructional materials for COMP 506.
 *
 * The University may have some rights in this work.
 *
 */

#define YYERROR_VERBOSE

#include <stdio.h>
#include "demo.h"

int yylineno;
char *yytext;
void yyerror( char const *);

%}

/* Bison declarations */
%start  Grammar
%%
Procedure → PROCEDURE NAME
{ Decls Stmts }
Decls → Decls Decl ;
| Decl ;
Decl → Type SpecList
Type → INT
| CHAR
SpecList → SpecList , Spec
| Spec
Spec → NAME
| NAME [ Bounds ]
Bounds → Bounds , Bound
| Bound
Bound → NUMBER : NUMBER
Stmts → Stmts Stmt
| Stmt
Stmt → Reference = Expr ;
| { Stmts }
| WHILE ( Bool ) { Stmts }
| FOR NAME = Expr TO
Expr BY Expr { Stmts }
| IF ( Bool ) THEN Stmt
| IF ( Bool ) THEN Stmt
ELSE Stmt
| READ Reference ;
| WRITE Expr ;
Bool → NOT OrTerm
| OrTerm
OrTerm → OrTerm OR AndTerm
| AndTerm
AndTerm → AndTerm AND RelExpr
| RelExpr
RelExpr → RelExpr LT Expr
| RelExpr LE Expr
| RelExpr EQ Expr
| RelExpr NE Expr
| RelExpr GE Expr
| RelExpr GT Expr
| Expr
Expr → Expr + Term
| Expr – Term
| Term
Term → Term * Factor
| Term / Factor
| Factor
Factor → ( Expr )
| Reference
| NUMBER
| CHARCONST
Reference → NAME
| NAME [ Exprs ]
Exprs → Expr , Exprs
| Expr
 /* Grammar rules  */
Grammar:  {return 1;} 	
;

%%


/* Epilogue */


void yyerror(s)
   const char *s;
{
	
}

