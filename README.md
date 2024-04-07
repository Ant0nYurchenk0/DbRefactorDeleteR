# DbRefactorDeleteR
Compilation and Execution
1. Generate the parser:
```bash
bison -d parser.y
```
3. Generate the lexer:
```bash
5. flex lexer.l
```
7. Compile the code:
```bash
gcc lex.yy.c parser.tab.c main.c -lfl
```
5. Execute
```bash
./a.out < test.txt
```
