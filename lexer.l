%{
  #include <stdlib.h>
  #include "relation.h"
  #include "parser.tab.h"
%}

%option caseless

%%

[ \t\n]+ {
}
"record" {
  return RECORD;
}
"name" {
  return NAME;
}
"is" {
  return IS;
}
"{" {
  return LEFT_BRACE;
}
"}" {
  return RIGHT_BRACE;
}
"(" {
  return LEFT_PAREN;
}
")" {
  return RIGHT_PAREN;
}
"," {
  return COMMA;
}
";" {
  return SEMICOLON;
}
"integer" {
  return INTEGER;
}
"float" {
  return FLOAT;
}
"double" {
  return DOUBLE;
}
"char" {
  return CHAR;
}
[a-z#_]+ {
  yylval.IDENTIFIER = strdup(yytext);
  return IDENTIFIER;
}
[0-9]+ {
  yylval.NUMBER = strtol(yytext, NULL, 0);
  return NUMBER;
}
. {
  return ERROR;
}

%%
