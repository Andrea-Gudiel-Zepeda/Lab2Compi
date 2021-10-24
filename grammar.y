%{
  #include <ctype.h>
  #include <stdio.h>
  #define YYSSTYPE double
  
  extern int yylex();
  
  void yyerror(char *msg);
%}

%token TRUE
%token FALSE
%token not
%token or
%token and


%%
lines	: lines bexpr '\n' { printf($2 ? "true(1)" : "false(0)") ;}
		| lines '\n'
		| /* empty */
		;
		
bexpr   : bexpr or bterm  {$$ = $1 || $3}
        | bterm  {$$ = $1}; 

bterm   : bterm and bfactor  {$$ = $1 && $3}
        | bfactor  {$$ = $1};

bfactor : not bfactor   {$$ = !$2}
        | '(' bexpr ')' {$$ = $2}
		| FALSE {$$ = 0}
		| TRUE  {$$ = 1};


%%

#include "lex.yy.c"

void yyerror(char *msg)
{
   printf("Error de sintaxis");
   exit(0);
}

int main(){
  yyparse();
  return 0;
}
