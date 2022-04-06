module Lib
  ( grid,
    languages,
    formatGrid,
    outputGrid,
    findWord,
    findWords,
    findWordInLine,
    skew,
  )
where

import Data (grid, languages)
import Data.List (isInfixOf, transpose)
import Data.Maybe (catMaybes)

type Grid = [String]

outputGrid :: Grid -> IO ()
outputGrid grid = putStrLn (formatGrid grid)

formatGrid :: Grid -> String
formatGrid = unlines

getLines :: Grid -> [String]
getLines grid =
  let horizontal = grid
      vertical = transpose grid
      diagonal = diagonalize grid
      diagonal' = diagonalize (map reverse grid)
      lines = horizontal ++ vertical ++ diagonal ++ diagonal'
   in lines ++ map reverse lines

skew :: Grid -> Grid
skew [] = []
skew (l : ls) = l : skew (map indent ls)
  where
    indent line = '_' : line

diagonalize :: Grid -> Grid
diagonalize = transpose . skew

findWord :: Grid -> String -> Maybe String
findWord grid word =
  let lines = getLines grid
      found = any (findWordInLine word) lines
   in if found then Just word else Nothing

-- findWords :: Grid -> [String] -> [String]
findWords :: Grid -> [String] -> [String]
findWords grid words =
  let foundWords = map (findWord grid) words
   in catMaybes foundWords

findWordInLine :: String -> String -> Bool
findWordInLine = isInfixOf
