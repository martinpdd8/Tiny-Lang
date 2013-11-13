{-# LANGUAGE GADTs, StandaloneDeriving #-}

-- martinpdd8@gmail.com
-- Tiny Lang Assignment

module TinyLang where
import qualified Data.Map as Map
import Control.Monad.State
import Prelude hiding (lookup, print)
import Data.Maybe (fromJust, isNothing)
import System.IO.Unsafe (unsafePerformIO)
import System.IO (hPutStrLn, stdout)

data Expr a where
    --Literal constants:
   -- N    :: Int -> Expr Int
    N    :: Num a => a -> Expr a
   -- B    :: Bool -> Expr Bool
    B    :: Eq a => a -> Expr a
   -- P    :: a -> Expr a
    --Numerical expressions:
    Add  :: (Num a) => Expr a ->  Expr a ->  Expr a
    Sub  :: (Num a) => Expr a ->  Expr a ->  Expr a
    Mult :: (Num a) => Expr a ->  Expr a ->  Expr a
    Div  :: (Num a, Integral a) => Expr a ->  Expr a ->  Expr a
    --Boolean expressions:
    Eq   :: (Show a, Eq a) => Expr a -> Expr a ->  Expr Bool
    Lt   :: (Show a, Eq a, Ord a) => Expr a -> Expr a ->  Expr Bool
    Gt   :: (Show a, Eq a, Ord a) => Expr a -> Expr a ->  Expr Bool
    And  :: Expr Bool ->  Expr Bool ->  Expr Bool
    Or   :: Expr Bool ->  Expr Bool ->  Expr Bool
    Not  :: Expr Bool ->  Expr Bool
    --Loading something not a constant:
    GetV :: String -> Expr Int
    
data Stmt a where
    SetV   :: String -> Expr Int -> Stmt a
    If     :: Expr Bool -> Stmt a -> Stmt a -> Stmt a
    While  :: Expr Bool -> Stmt a -> Stmt a
    Seq    :: Stmt a -> Stmt a -> Stmt a
    Print  :: Expr a -> Stmt a

deriving instance Show a => Show (Expr a)
deriving instance Show a => Show (Stmt a)

type DataStore = Map.Map String Int

set :: (String, Int) -> State DataStore ()
set (s,i) = state $ (\table -> ((), Map.insert s i table))

lookup :: String -> State DataStore (Maybe Int)
lookup s = state (\table -> (Map.lookup s table, table))

--lookup :: String -> State DataStore Int
--lookup s = state $ (\table -> ((fromJust $ Map.lookup s table), table))

print x = unsafePerformIO $ do hPutStrLn stdout $ show x; return x

-- runState (maybe_eval (Add (Mult (N 3) (N 2)) (GetV "doesntexist"))) Map.empty
maybe_eval :: Expr a -> State DataStore (Maybe a)
maybe_eval expr = do
    case expr of
        --Literal constants:
        (N x) -> return (Just x)
        (B x) -> return (Just x)
        --Numerical expressions:
        (Add e0 e1)  -> do ea <- (maybe_eval e0); eb <- (maybe_eval e1); calc ea (+) eb
        (Sub e0 e1)  -> do ea <- (maybe_eval e0); eb <- (maybe_eval e1); calc ea (-) eb
        (Mult e0 e1) -> do ea <- (maybe_eval e0); eb <- (maybe_eval e1); calc ea (*) eb
        (Div e0 e1)  -> do ea <- (maybe_eval e0); eb <- (maybe_eval e1); calc ea div eb
        --Boolean expressions:
        (Eq a b)   -> do ea <- (maybe_eval a); eb <- (maybe_eval b); calc ea (==) eb
        (Lt a b)   -> do ea <- (maybe_eval a); eb <- (maybe_eval b); calc ea (<)  eb
        (Gt a b)   -> do ea <- (maybe_eval a); eb <- (maybe_eval b); calc ea (>)  eb
        (And a b)  -> do ea <- (maybe_eval a); eb <- (maybe_eval b); calc ea (&&) eb
        (Or a b)   -> do ea <- (maybe_eval a); eb <- (maybe_eval b); calc ea (||) eb
        (Not a)    -> do ea <- (maybe_eval a); nott ea
	 --load a variable's value -}
        (GetV s) -> do 
            val <- lookup s
            case isNothing val of
                True -> return Nothing
                False -> return val

-- returns True if either of the maybes are "Nothing"
oneIsNothing :: Maybe a -> Maybe a -> Bool
oneIsNothing a b
  | isNothing a == True = True 
  | isNothing b == True = True
  | otherwise = False
 
-- does the case operation for numerical and boolean expressions to clean up maybe_eval a bit
calc ea op eb = case oneIsNothing ea eb of
      True -> return Nothing
      False -> return (Just (op (fromJust ea) (fromJust eb)))
 
-- handles not
nott ea = case isNothing ea of
	    True -> return Nothing
	    False -> return (Just (not (fromJust ea)))

-- runState (partial_eval (Add (Mult (N 3) (N 2)) (GetV "doesntexist"))) Map.empty
partial_eval :: Expr a -> State DataStore (Either (Expr a) a) -- returning expressions! 
partial_eval expr = do
    case expr of
        --Literal constants:
        (N x) -> return (Right x)
        (B x) -> return (Right x)
        --Numerical expressions:
        (Add e0 e1)  -> do ea <- (partial_eval e0); eb <- (partial_eval e1); num_op ea eb e1 (Add) (+)
	(Mult e0 e1) -> do ea <- (partial_eval e0); eb <- (partial_eval e1); num_op ea eb e1 (Mult) (*) 
	(Sub e0 e1)  -> do ea <- (partial_eval e0); eb <- (partial_eval e1); num_op ea eb e1 (Sub) (-)
        (Div e0 e1)  -> do ea <- (partial_eval e0); eb <- (partial_eval e1); num_op ea eb e1 (Div) (div)
        --Boolean expressions:
        (Eq a b)     -> do ea <- (partial_eval a); eb <- (partial_eval b); bool_op ea eb b (Eq) (==)
        (Lt a b)     -> do ea <- (partial_eval a); eb <- (partial_eval b); bool_op ea eb b (Lt) (<)
        (Gt a b)     -> do ea <- (partial_eval a); eb <- (partial_eval b); bool_op ea eb b (Gt) (>)
        (And a b)    -> do ea <- (partial_eval a); eb <- (partial_eval b); bool_op ea eb b (And) (&&)
        (Or a b)     -> do ea <- (partial_eval a); eb <- (partial_eval b); bool_op ea eb b (Or) (||) 
        (Not a)      -> do ea <- (partial_eval a); nope a ea
        --load a variable's value -}
        (GetV s) -> do 
            val <- lookup s
            case val of
                Nothing -> return (Left (GetV s))
                Just  x -> return (Right x)              
-- not
nope a ea = 
    case ea of 
	Left  x -> return (Left (Not a))
	Right x -> return (Right (not x)) 
	
-- handles numerical cases
num_op ea eb e1 typ op = 
  case ea of
    Left x -> return $ Left (typ x e1)  --return (Left x)
    Right x -> case eb of 
	Left y -> return $ Left $ typ (N x) y
	Right y -> return $ Right $ op x y

-- handles the boolean cases
bool_op ea eb e1 typ op = 
  case ea of
    Left x -> return $ Left (typ x e1)  --return (Left x)
    Right x -> case eb of 
	Left y -> return $ Left $ typ (B x) y
	Right y -> return $ Right $ op x y

{-
evalS :: (Show a) => Stmt a -> State DataStore (Either () a)
evalS stmt = do
    case stmt of
        (SetV name value) -> do val <- eval value; set (name,val); return $ Left ()
        (If condition first second) -> do cond <- eval condition; if cond then do evalS first else do evalS second
        (Seq first next) -> do evalS first >> evalS next
        (While condition body) -> do cond <- eval condition; if cond then do evalS body >> evalS stmt else do return $ Left ()
        (Print thing) -> do thing' <- eval thing; return (Right $ print thing')
-}
{- An example program: computes the factorial of the argument, in true FP hello-world tradition :) -}
{-
factProg n =
    (Seq
        (Seq
            (SetV "arg" (N n))
        (Seq
            (SetV "scratch" $ GetV "arg")
            (SetV "total" (N 1))))
        (While
            (Gt (GetV "scratch") (N 1))
            (Seq
                (SetV "total" (Mult (GetV "total") (GetV "scratch")))
                (SetV "scratch" (Sub (GetV "scratch") (N 1))))))
-}
{- to see results: runState (evalS $ factprog 6) Map.empty -}