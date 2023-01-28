module Main (main) where

import Lib

main :: IO ()
main = do
    -- Client A
    aSecret <- generateSecret
    let aPublic = generatePublic aSecret
    putStrLn $ "Client A secret: " ++ show aSecret
    putStrLn $ "Client A public: " ++ show aPublic

    -- Client B generates secret and public key
    bSecret <- generateSecret
    let bPublic = generatePublic bSecret
    putStrLn $ "Client B secret: " ++ show bSecret
    putStrLn $ "Client B public: " ++ show bPublic

    -- Client A and B generates shared secret key
    let aSharedSecret = generateSharedSecret aSecret bPublic
    let bSharedSecret = generateSharedSecret bSecret aPublic
    putStrLn $ "Shared secret key by client A: " ++ show aSharedSecret
    putStrLn $ "Shared secret key by client B: " ++ show bSharedSecret