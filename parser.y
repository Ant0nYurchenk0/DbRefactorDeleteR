%{
  #include <stdio.h>
  #include "relation.h"

  int yylex(void);
  void yyerror(struct relation_list **relation_list, const char *);
%}

%define api.value.type union
%parse-param {struct relation_list **result}

%token RECORD NAME IS LEFT_BRACE RIGHT_BRACE LEFT_PAREN RIGHT_PAREN
%token COMMA SEMICOLON CHAR INTEGER FLOAT DOUBLE ERROR
%token <char *> IDENTIFIER
%token <long> NUMBER

%nterm <struct relation_list *> relation_list
%nterm <struct relation> relation
%nterm <struct attribute_list *> attribute_list dangling_comma_attribute_list
%nterm <struct attribute> attribute
%nterm <struct attribute_type> attribute_type

%%

input: relation_list {
  *result = $relation_list;
};

relation_list: {
  $$ = NULL;
} | relation_list relation {
  $$ = malloc(sizeof(struct relation_list));
  $$->head = $relation;
  $$->tail = $1;
};

relation: RECORD NAME IS IDENTIFIER LEFT_BRACE attribute_list RIGHT_BRACE SEMICOLON {
  $$.name = $IDENTIFIER;
  $$.attribute_list = $attribute_list;
};

attribute_list: {
  $$ = NULL;
} | dangling_comma_attribute_list attribute {
  $$ = malloc(sizeof(struct attribute_list));
  $$->head = $attribute;
  $$->tail = $dangling_comma_attribute_list;
};

dangling_comma_attribute_list: {
  $$ = NULL;
} | dangling_comma_attribute_list attribute COMMA {
  $$ = malloc(sizeof(struct attribute_list));
  $$->head = $attribute;
  $$->tail = $1;
};

attribute: IDENTIFIER attribute_type {
  $$.name = $IDENTIFIER;
  $$.type = $attribute_type;
};

attribute_type: INTEGER {
  $$.meta_type = meta_integer;
} | FLOAT {
  $$.meta_type = meta_float;
} | DOUBLE {
  $$.meta_type = meta_double;
} | CHAR LEFT_PAREN NUMBER RIGHT_PAREN {
  $$.meta_type = meta_char;
  $$.size = $NUMBER;
};

%%
