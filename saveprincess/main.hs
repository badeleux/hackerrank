module Main where
getList :: Int -> IO[String]
getList n = if n==0 then return [] else do i <- getLine; is <- getList(n-1); return (i:is)

displayPathtoPrincess :: Int -> [String] -> String
displayPathtoPrincess n s = "as"

main = do
    n <- getLine
    let i = read n
    grid <- getList i
    putStrLn.displayPathtoPrincess i $ grid
