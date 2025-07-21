grammar SimpleLang;

prog: stat+ ;

stat: expr NEWLINE ;

expr: expr op=('*'|'/'|MOD) expr       # MulDiv
    | expr op=('+'|'-') expr       # AddSub
    | expr op=('==' | NEQ) expr    # EqNeq 
    | INT                          # Int
    | FLOAT                        # Float
    | STRING                       # String
    | BOOL                         # Bool
    | '(' expr ')'                 # Parens
    ;

MOD : '%' ;
NEQ : '!=' ;
INT: [0-9]+ ;
FLOAT: [0-9]+'.'[0-9]* ;
STRING: '"' .*? '"' ;
BOOL: 'true' | 'false' ;
NEWLINE: '\r'? '\n' ;
WS: [ \t]+ -> skip ;