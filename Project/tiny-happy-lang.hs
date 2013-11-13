{-# OPTIONS_GHC -w #-}
{-# LANGUAGE GADTs, StandaloneDeriving #-}

-- Paul Martin 
-- 09613986
-- CS4012
-- Web Interpreter Project

import Data.Char

-- parser produced by Happy Version 1.18.9

data HappyAbsSyn t4 t5 t6
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6

action_0 (9) = happyShift action_3
action_0 (11) = happyShift action_4
action_0 (12) = happyShift action_5
action_0 (13) = happyShift action_6
action_0 (4) = happyGoto action_7
action_0 _ = happyFail

action_1 (9) = happyShift action_3
action_1 (11) = happyShift action_4
action_1 (12) = happyShift action_5
action_1 (13) = happyShift action_6
action_1 (4) = happyGoto action_2
action_1 _ = happyFail

action_2 (9) = happyShift action_3
action_2 (11) = happyShift action_4
action_2 (12) = happyShift action_5
action_2 (13) = happyShift action_6
action_2 (4) = happyGoto action_8
action_2 _ = happyFail

action_3 (10) = happyShift action_14
action_3 _ = happyFail

action_4 (28) = happyShift action_13
action_4 _ = happyFail

action_5 (7) = happyShift action_11
action_5 (9) = happyShift action_12
action_5 (5) = happyGoto action_10
action_5 _ = happyFail

action_6 (28) = happyShift action_9
action_6 _ = happyFail

action_7 (9) = happyShift action_3
action_7 (11) = happyShift action_4
action_7 (12) = happyShift action_5
action_7 (13) = happyShift action_6
action_7 (33) = happyAccept
action_7 (4) = happyGoto action_8
action_7 _ = happyFail

action_8 (9) = happyShift action_3
action_8 (11) = happyShift action_4
action_8 (12) = happyShift action_5
action_8 (13) = happyShift action_6
action_8 (4) = happyGoto action_8
action_8 _ = happyReduce_1

action_9 (7) = happyShift action_11
action_9 (8) = happyShift action_18
action_9 (9) = happyShift action_12
action_9 (19) = happyShift action_19
action_9 (26) = happyShift action_20
action_9 (27) = happyShift action_21
action_9 (5) = happyGoto action_16
action_9 (6) = happyGoto action_27
action_9 _ = happyFail

action_10 (22) = happyShift action_22
action_10 (23) = happyShift action_23
action_10 (24) = happyShift action_24
action_10 (25) = happyShift action_25
action_10 (30) = happyShift action_26
action_10 _ = happyFail

action_11 _ = happyReduce_11

action_12 _ = happyReduce_10

action_13 (7) = happyShift action_11
action_13 (8) = happyShift action_18
action_13 (9) = happyShift action_12
action_13 (19) = happyShift action_19
action_13 (26) = happyShift action_20
action_13 (27) = happyShift action_21
action_13 (5) = happyGoto action_16
action_13 (6) = happyGoto action_17
action_13 _ = happyFail

action_14 (16) = happyShift action_15
action_14 _ = happyFail

action_15 (7) = happyShift action_11
action_15 (9) = happyShift action_12
action_15 (5) = happyGoto action_40
action_15 _ = happyFail

action_16 (17) = happyShift action_38
action_16 (18) = happyShift action_39
action_16 (22) = happyShift action_22
action_16 (23) = happyShift action_23
action_16 (24) = happyShift action_24
action_16 (25) = happyShift action_25
action_16 _ = happyFail

action_17 (16) = happyShift action_28
action_17 (20) = happyShift action_29
action_17 (21) = happyShift action_30
action_17 (29) = happyShift action_37
action_17 _ = happyFail

action_18 _ = happyReduce_20

action_19 (7) = happyShift action_11
action_19 (8) = happyShift action_18
action_19 (9) = happyShift action_12
action_19 (19) = happyShift action_19
action_19 (26) = happyShift action_20
action_19 (27) = happyShift action_21
action_19 (5) = happyGoto action_16
action_19 (6) = happyGoto action_36
action_19 _ = happyFail

action_20 _ = happyReduce_18

action_21 _ = happyReduce_19

action_22 (7) = happyShift action_11
action_22 (9) = happyShift action_12
action_22 (5) = happyGoto action_35
action_22 _ = happyFail

action_23 (7) = happyShift action_11
action_23 (9) = happyShift action_12
action_23 (5) = happyGoto action_34
action_23 _ = happyFail

action_24 (7) = happyShift action_11
action_24 (9) = happyShift action_12
action_24 (5) = happyGoto action_33
action_24 _ = happyFail

action_25 (7) = happyShift action_11
action_25 (9) = happyShift action_12
action_25 (5) = happyGoto action_32
action_25 _ = happyFail

action_26 _ = happyReduce_5

action_27 (16) = happyShift action_28
action_27 (20) = happyShift action_29
action_27 (21) = happyShift action_30
action_27 (29) = happyShift action_31
action_27 _ = happyFail

action_28 (16) = happyShift action_48
action_28 _ = happyFail

action_29 (20) = happyShift action_47
action_29 _ = happyFail

action_30 (21) = happyShift action_46
action_30 _ = happyFail

action_31 (15) = happyShift action_45
action_31 _ = happyFail

action_32 (22) = happyShift action_22
action_32 (23) = happyShift action_23
action_32 (24) = happyShift action_24
action_32 (25) = happyShift action_25
action_32 _ = happyReduce_9

action_33 (22) = happyShift action_22
action_33 (23) = happyShift action_23
action_33 (24) = happyShift action_24
action_33 (25) = happyShift action_25
action_33 _ = happyReduce_8

action_34 (22) = happyShift action_22
action_34 (23) = happyShift action_23
action_34 (24) = happyShift action_24
action_34 (25) = happyShift action_25
action_34 _ = happyReduce_7

action_35 (22) = happyShift action_22
action_35 (23) = happyShift action_23
action_35 (24) = happyShift action_24
action_35 (25) = happyShift action_25
action_35 _ = happyReduce_6

action_36 (16) = happyShift action_28
action_36 (20) = happyShift action_29
action_36 (21) = happyShift action_30
action_36 _ = happyReduce_15

action_37 (31) = happyShift action_44
action_37 _ = happyFail

action_38 (7) = happyShift action_11
action_38 (9) = happyShift action_12
action_38 (5) = happyGoto action_43
action_38 _ = happyFail

action_39 (7) = happyShift action_11
action_39 (9) = happyShift action_12
action_39 (5) = happyGoto action_42
action_39 _ = happyFail

action_40 (22) = happyShift action_22
action_40 (23) = happyShift action_23
action_40 (24) = happyShift action_24
action_40 (25) = happyShift action_25
action_40 (30) = happyShift action_41
action_40 _ = happyFail

action_41 _ = happyReduce_4

action_42 (22) = happyShift action_22
action_42 (23) = happyShift action_23
action_42 (24) = happyShift action_24
action_42 (25) = happyShift action_25
action_42 _ = happyReduce_16

action_43 (22) = happyShift action_22
action_43 (23) = happyShift action_23
action_43 (24) = happyShift action_24
action_43 (25) = happyShift action_25
action_43 _ = happyReduce_17

action_44 (9) = happyShift action_3
action_44 (11) = happyShift action_4
action_44 (12) = happyShift action_5
action_44 (13) = happyShift action_6
action_44 (4) = happyGoto action_53
action_44 _ = happyFail

action_45 (9) = happyShift action_3
action_45 (11) = happyShift action_4
action_45 (12) = happyShift action_5
action_45 (13) = happyShift action_6
action_45 (4) = happyGoto action_52
action_45 _ = happyFail

action_46 (7) = happyShift action_11
action_46 (8) = happyShift action_18
action_46 (9) = happyShift action_12
action_46 (19) = happyShift action_19
action_46 (26) = happyShift action_20
action_46 (27) = happyShift action_21
action_46 (5) = happyGoto action_16
action_46 (6) = happyGoto action_51
action_46 _ = happyFail

action_47 (7) = happyShift action_11
action_47 (8) = happyShift action_18
action_47 (9) = happyShift action_12
action_47 (19) = happyShift action_19
action_47 (26) = happyShift action_20
action_47 (27) = happyShift action_21
action_47 (5) = happyGoto action_16
action_47 (6) = happyGoto action_50
action_47 _ = happyFail

action_48 (7) = happyShift action_11
action_48 (8) = happyShift action_18
action_48 (9) = happyShift action_12
action_48 (19) = happyShift action_19
action_48 (26) = happyShift action_20
action_48 (27) = happyShift action_21
action_48 (5) = happyGoto action_16
action_48 (6) = happyGoto action_49
action_48 _ = happyFail

action_49 (16) = happyShift action_28
action_49 (20) = happyShift action_29
action_49 (21) = happyShift action_30
action_49 _ = happyReduce_12

action_50 (16) = happyShift action_28
action_50 (20) = happyShift action_29
action_50 (21) = happyShift action_30
action_50 _ = happyReduce_13

action_51 (16) = happyShift action_28
action_51 (20) = happyShift action_29
action_51 (21) = happyShift action_30
action_51 _ = happyReduce_14

action_52 (9) = happyShift action_3
action_52 (11) = happyShift action_4
action_52 (12) = happyShift action_5
action_52 (13) = happyShift action_6
action_52 (14) = happyShift action_55
action_52 (4) = happyGoto action_8
action_52 _ = happyFail

action_53 (9) = happyShift action_3
action_53 (11) = happyShift action_4
action_53 (12) = happyShift action_5
action_53 (13) = happyShift action_6
action_53 (32) = happyShift action_54
action_53 (4) = happyGoto action_8
action_53 _ = happyFail

action_54 _ = happyReduce_3

action_55 (9) = happyShift action_3
action_55 (11) = happyShift action_4
action_55 (12) = happyShift action_5
action_55 (13) = happyShift action_6
action_55 (4) = happyGoto action_56
action_55 _ = happyFail

action_56 (9) = happyShift action_3
action_56 (11) = happyShift action_4
action_56 (12) = happyShift action_5
action_56 (13) = happyShift action_6
action_56 (4) = happyGoto action_8
action_56 _ = happyReduce_2

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Seq happy_var_1 happy_var_2
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happyReduce 8 4 happyReduction_2
happyReduction_2 ((HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_3 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_3 = happyReduce 7 4 happyReduction_3
happyReduction_3 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (While happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 5 4 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SetV happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Print happy_var_2
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  5 happyReduction_6
happyReduction_6 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Add happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  5 happyReduction_7
happyReduction_7 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  5 happyReduction_8
happyReduction_8 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Mult happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Div happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  5 happyReduction_10
happyReduction_10 (HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn5
		 (GetV happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  5 happyReduction_11
happyReduction_11 (HappyTerminal (TInt happy_var_1))
	 =  HappyAbsSyn5
		 (N happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happyReduce 4 6 happyReduction_12
happyReduction_12 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Eq happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 6 happyReduction_13
happyReduction_13 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (And happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 4 6 happyReduction_14
happyReduction_14 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Or happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_2  6 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Not happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 (Lt happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  6 happyReduction_17
happyReduction_17 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 (Gt happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  6 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn6
		 (B True
	)

happyReduce_19 = happySpecReduce_1  6 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn6
		 (B False
	)

happyReduce_20 = happySpecReduce_1  6 happyReduction_20
happyReduction_20 (HappyTerminal (TBool happy_var_1))
	 =  HappyAbsSyn6
		 (B happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 33 33 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TInt happy_dollar_dollar -> cont 7;
	TBool happy_dollar_dollar -> cont 8;
	TVar happy_dollar_dollar -> cont 9;
	TIs -> cont 10;
	TWhile -> cont 11;
	TPrint -> cont 12;
	TIf -> cont 13;
	TElse -> cont 14;
	TThen -> cont 15;
	TEq -> cont 16;
	TGreat -> cont 17;
	TLess -> cont 18;
	TNot -> cont 19;
	TAnd -> cont 20;
	TOr -> cont 21;
	TAdd -> cont 22;
	TSub -> cont 23;
	TMul -> cont 24;
	TDiv -> cont 25;
	TTrue -> cont 26;
	TFalse -> cont 27;
	TOpen -> cont 28;
	TClosed -> cont 29;
	TEl -> cont 30;
	TObrack -> cont 31;
	TCbrack -> cont 32;
	_ -> happyError' (tk:tks)
	}

happyError_ 33 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> HappyIdentity a
happyError' = HappyIdentity . parseError

calc tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 30 "templates/GenericTemplate.hs" #-}








{-# LINE 51 "templates/GenericTemplate.hs" #-}

{-# LINE 61 "templates/GenericTemplate.hs" #-}

{-# LINE 70 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	 (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 148 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let (i) = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
	 sts1@(((st1@(HappyState (action))):(_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
        happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))
       where (sts1@(((st1@(HappyState (action))):(_)))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
       happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))
       where (sts1@(((st1@(HappyState (action))):(_)))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk





             new_state = action


happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 246 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let (i) = (case x of { HappyErrorToken (i) -> i }) in
--	trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
	action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 312 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
