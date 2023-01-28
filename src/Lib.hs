module Lib
    ( p, g, generateSecret, generatePublic, generateSharedSecret
    ) where

import System.Random

-- Diffie-Hellman param
p :: Integer
p = 23

g:: Integer
g = 5


-- Generate secret key for each client
generateSecret :: IO Integer
generateSecret = randomRIO (0, p-2)

-- Generate public key for each client
generatePublic :: Integer -> Integer
generatePublic secret = mod (g^secret) p

-- Generate shared secret key
generateSharedSecret :: Integer -> Integer -> Integer
generateSharedSecret secret public = mod (public^secret) p
