bitArrayToDec :: [Int] -> Int
bitArrayToDec = foldl (\acc bit -> acc * 2 + bit) 0

mostCommonBit :: [[Int]] -> [Int]
mostCommonBit xs = map mapFn (foldl foldlFn acc xs)
  where 
    mapFn x = if 2*x >= length xs then 0 else 1
    foldlFn x acc = zipWith (+) acc x
    acc = replicate 12 0

main :: IO ()
main = do
  f <- readFile "./input.txt"
  let xs = map (map $ read . (: [])) $ lines f :: [[Int]]
  print $ bitArrayToDec (map (1-) $ mostCommonBit xs) * bitArrayToDec (mostCommonBit xs)
