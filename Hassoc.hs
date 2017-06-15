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
    main
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

main :: IO ()
main = do

    inputContents <- readFile inputFile
    let properties = words inputContents
    print properties