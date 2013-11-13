{{-# LANGUAGE GADTs, StandaloneDeriving #-}

-- martinpdd8@gmail.com
-- Tiny Lang Interpreter Project

import Data.Char 
}
%name calc
%tokentype { Token }
%error { parseError }

%token 
      int                { TInt $$ }
      bool               { TBool $$ }
      var                { TVar $$ }
    --  iVar               { Tivar } -- used these for int variable = whatever;
    --  bVar               { Tbvar } -- and bool variable = whatever; 
      ':'                { TIs }    -- but left it out in the end when I remembered set bool doesn't exist in tinylang
      while              { TWhile }
      print              { TPrint } 
      if	         { TIf }
      else               { TElse }
      then               { TThen }
      '='                { TEq }
      '>'                { TGreat }
      '<'                { TLess }
      '!'                { TNot }
      '&'                { TAnd }
      '|'                { TOr }
      '+'                { TAdd }
      '-'                { TSub }
      '*'                { TMul }
      '/'                { TDiv }
      true               { TTrue }
      false              { TFalse }
     '('                 { TOpen }
     ')'                 { TClosed }
     ';'                 { TEl }
     '{'                 { TObrack }
     '}'                 { TCbrack }

%%

Stmt :  Stmt Stmt                             { Seq $1 $2 } 
     | if '(' ExprB ')' then Stmt else Stmt   { If $3 $6 $8 }
     | while '(' ExprB ')' '{' Stmt '}'       { While $3 $6 }
     | var ':''=' ExprN ';'                   { SetV $1 $4 }
  --   | bVar var ':''=' ExprB                { SetB $2 $5 }
     | print ExprN ';'                        { Print $2 }
      
ExprN : ExprN '+' ExprN         { Add $1 $3 }
      | ExprN '-' ExprN         { Sub $1 $3 }
      | ExprN '*' ExprN         { Mult $1 $3 }
      | ExprN '/' ExprN         { Div $1 $3 } 
      | var                     { GetV $1  }
      | int 		        { N $1 }

ExprB : ExprB '=''=' ExprB      { Eq $1 $4 }
      | ExprB '&''&' ExprB      { And $1 $4}
      | ExprB '|''|' ExprB      { Or $1 $4 } 
      | '!' ExprB               { Not $2 }
      | ExprN '<' ExprN         { Lt $1 $3 } 
      | ExprN '>' ExprN         { Gt $1 $3 }
      | true                    { B True }
      | false                   { B False }
      | bool                    { B $1 }

{

parseError :: [Token] -> a
parseError _ = error "Parse error"

data ExprN a where
    N    :: Int -> ExprN Int
    Add  :: (Num a) => ExprN a ->  ExprN a ->  ExprN a
    Sub  :: (Num a) => ExprN a ->  ExprN a ->  ExprN a
    Mult :: (Num a) => ExprN a ->  ExprN a ->  ExprN a
    Div  :: (Num a, Integral a) => ExprN a ->  ExprN a ->  ExprN a
    GetV :: String -> ExprN Int

data ExprB a where 
    B    :: Bool -> ExprB Bool
    Eq   :: (Show a, Eq a) => ExprB a -> ExprB a ->  ExprB Bool
    And  :: ExprB Bool ->  ExprB Bool ->  ExprB Bool
    Or   :: ExprB Bool ->  ExprB Bool ->  ExprB Bool
    Not  :: ExprB Bool ->  ExprB Bool
    Lt   :: (Show a, Eq a, Ord a) => ExprN a -> ExprN a ->  ExprB Bool
    Gt   :: (Show a, Eq a, Ord a) => ExprN a -> ExprN a ->  ExprB Bool
    
data Stmt a where
    SetV   :: String -> ExprN Int -> Stmt a
 --   SetB   :: String -> ExprB Bool -> Stmt a
    If     :: ExprB Bool -> Stmt a -> Stmt a -> Stmt a
    While  :: ExprB Bool -> Stmt a -> Stmt a 
    Seq    :: Stmt a -> Stmt a -> Stmt a
    Print  :: ExprN a -> Stmt a
 --   PrintB  :: ExprB a -> Stmt a

deriving instance Show a => Show (ExprN a)
deriving instance Show a => Show (ExprB a)
deriving instance Show a => Show (Stmt a)

data Token 
   =  TInt Int     | TBool Bool | TPlus
   |  TAdd         | TSub       |  TMul
   |  TDiv         | TEq        |  TGreat 
   |  TLess        | TNot       |  TAnd 
   |  TOr          | TEl        |  TTrue
   |  TFalse       | TIf        |  TElse
   |  TOpen        | TClosed    |  TPrint
   |  TVar String  | TIs        |  TThen
   |  TWhile       | TObrack    |  TCbrack

-- | Tivar    
-- |  Tbvar
 deriving Show 


lexer :: String -> [Token]
lexer [] = []
lexer (c:cs) 
      | isSpace c = lexer cs
      | isAlpha c = lexVar (c:cs)
      | isDigit c = lexNum (c:cs)
lexer ('>':cs) = TGreat : lexer cs
lexer ('=':cs) = TEq : lexer cs
lexer ('+':cs) = TAdd : lexer cs
lexer ('-':cs) = TSub : lexer cs
lexer ('*':cs) = TMul : lexer cs
lexer ('/':cs) = TDiv : lexer cs
lexer ('<':cs) = TLess : lexer cs
lexer (':':cs) = TIs : lexer cs
lexer ('&':cs) = TAnd : lexer cs
lexer ('|':cs) = TOr : lexer cs
lexer ('!':cs) = TNot : lexer cs
lexer (';':cs) = TEl : lexer cs
lexer ('(':cs) = TOpen : lexer cs
lexer (')':cs) = TClosed : lexer cs
lexer ('{':cs) = TObrack : lexer cs
lexer ('}':cs) = TCbrack : lexer cs

lexNum cs = TInt (read num) : lexer rest
      where (num,rest) = span isDigit cs

lexVar cs =
   case span isAlpha cs of
        ("true",rest)  -> TTrue : lexer rest
        ("false",rest) -> TFalse : lexer rest
        ("if",rest)    -> TIf : lexer rest
        ("else",rest)  -> TElse : lexer rest
        ("then",rest)  -> TThen : lexer rest
        ("print",rest) -> TPrint : lexer rest
        ("while",rest) -> TWhile : lexer rest
     --   ("iVar",rest)  -> Tivar : lexer rest
     --   ("bVar",rest)  -> Tbvar : lexer rest
        (var,rest)   -> TVar var : lexer rest 
      
-- factProg program to test the parser

main = print . calc . lexer $ 
  "arg := 6;" ++ 
  "scratch := arg;" ++ 
  "total := 1;" ++ 
  "while (scratch > 1) { " ++ 
  "   total := total * scratch;" ++ 
  "   scratch := scratch - 1; " ++ 
  "}" ++ 
  "print total;"

-- "arg := 6; scratch := arg; total := 1; while (scratch > 1) total := total * scratch; scratch := scratch - 1;"

-- "if (4 < 7) then print 0; print 5; else print 10;"
} 