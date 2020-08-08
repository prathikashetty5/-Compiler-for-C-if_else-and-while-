%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
extern int k,o,i,ln,s;
extern int yylex();
extern int *yyin;
extern int *yyout;
%}
%token INT MAIN BG END IF PF OPEN CLOSE VAR EXPR CM SC NL RELOP
%%
stmt: INT MAIN OPEN CLOSE newline code newline  {
     printf("\n---------------------------------------\n");
     printf("\nProgram compiled successfully\n");
     printf("The number of keywords are :%d\n",k);
     printf("The number of identifiers are :%d\n",i);
     printf("The number of operators are :%d\n",o);
     printf("The number of separators are :%d\n",s);
     printf("------------------------------------------\n");
     exit(0);};
code: BG newline declare newline loops END;
declare: INT var_list SC;
var_list: var_list CM VAR | VAR;
loops: loops if_stmt | if_stmt ;
if_stmt: IF OPEN condition CLOSE newline BG newline PF OPEN VAR CLOSE SC newline END newline ;
condition: EXPR RELOP EXPR;
newline: newline NL | NL ;
%%
int yyerror(const char *str)
{
fprintf(stderr,"Error at line %d\n%s\n",ln,str);
exit(0);
}

int main(int argc,char *argv[])
{
yyin=fopen(argv[1],"r");
yyparse();
}





