/*%{
   #define BOOL 333
%}*/

and   [Aa][Nn][Dd]
not   [Nn][Oo][Tt]
or    [Oo][Rr]
TRUE  [Tt][Rr][Uu][Ee]
FALSE [Ff][Aa][Ll][Ss][Ee]
%%

[ \t]     ; {/*Espacios en blanco */}
{and}      return and;
{or}       return or;
{TRUE}     return TRUE;
{FALSE}    return FALSE;
{not}      return not;
[\n()]     return yytext[0];

.          printf("Error\n");

%%

int yywrap(void)
{ 
  return 0;
}


