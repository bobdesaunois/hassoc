{-
# Hassoc

Author: Bob Desaunois

Description:

1. Reads file
2. Splits content into words
3. generates PHP Associative Array
4. writes the array to file
-}

module Hassoc
( 
    run
)
where

import System.IO
import Data.List

-----------------------------------------------------------
-- Constants
-----------------------------------------------------------

inputFile :: FilePath
inputFile = "input.txt"

outputFile :: FilePath
outputFile = "output.txt"

-----------------------------------------------------------
-- Functions
-----------------------------------------------------------

run :: IO ()
run = do

    inputContents <- readFile inputFile

    let preOutput = "$array = array (\n" :: String
    let output = preOutput ++ (generateOutput 0 (words inputContents) "") :: String

    writeFile outputFile output


codeify :: String -> String
codeify string = "\t\"" ++ string ++ "\" => \"\""


appendDelimiter :: Int -> [String] -> String -> String
appendDelimiter x properties codeString = do
    
    let propertiesLength = (-1) + (length properties) :: Int
    if x >= propertiesLength
        then codeString ++ ");"
        else codeString ++ ","


-- TODO Optimise this with a foldr
generateOutput :: Int -> [String] -> String -> String
generateOutput x properties outputString

    | x >= (length properties) = outputString
    | x <  (length properties) = generateOutput ((+1) x) properties output
        
        where output    = (outputString ++ generated) ++ "\n"   :: String
              generated = delimiter (codeify (properties !! x)) :: String
              delimiter = appendDelimiter x properties          :: String