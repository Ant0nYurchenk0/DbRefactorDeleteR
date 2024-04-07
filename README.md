# DbRefactorDeleteR
Compilation and Execution
1. Generate the parser: ```bison -d parser.y```
2. Generate the lexer: ```flex lexer.l```
3. Compile the code:
```gcc lex.yy.c parser.tab.c main.c -lfl```
4. Execute ```./a.out < test.txt```
