grammar ArithmeticExpressions;

options {
  language = Java;
}

startgeneralArithExpr
	:	array;

array	:	 arrayDeclaration ;



arrayAccess
	:	Identifier '[' (numbers|Identifier) ']' '=' (numbers|Identifier) Semicolon
		|Identifier '[' (numbers|Identifier) ']'  Semicolon 
		|Identifier '[' (numbers|Identifier) ']' '=' (numbers|Identifier) Exp (numbers|Identifier) Semicolon
		;


arrayDeclaration: datatype '['']' Identifier Semicolon
		| datatype '['']' Identifier '=' 'new' datatype '['(numbers)?']'Semicolon
		;
arrayInitialize
	:	datatype '['']' Identifier '=' '{' (numbers | strings) '}' Semicolon
	|	Identifier '=' '{' (numbers)? '}' Semicolon
	|	Identifier '=' '{' (strings)? '}' Semicolon
	|	Identifier '=' 'new' datatype '[' (numbers | Identifier)? ']' ( '{' (numbers | strings) '}')? Semicolon
	|	datatype '['']' Identifier '=' 'new' datatype '['']' '{' (numbers | strings)? '}' Semicolon
	;

		
		// public static void main(String[] a){

mainMethod
	: 'public' 'static' 'void' 'main' '(' 'String' '['']' Identifier 
	'{'
		
	'}' 	;		



numbers : Number (',' Number)*;
strings :(Cot Identifier Cot) (',' (Cot Identifier Cot))*;
datatype	:	'byte'|'short'| 'int'| 'long'| 'float'| 'double'| 'boolean' |'char'|'String';

// Lexer Rules
Number	: ('0'..'9')+ ('.' ('0'..'9')+)? ;
	

Identifier : ('a'..'z' | 'A'..'Z')+ | ('a'..'z' | 'A'..'Z')+('0'..'9')+ ;

Exp: '+' | '-' | '*' | '/';
Cot	:'"';
Semicolon :';';
WS  : (' ' | '\t' | '\r' | '\n')+ { $channel = HIDDEN; } ;
