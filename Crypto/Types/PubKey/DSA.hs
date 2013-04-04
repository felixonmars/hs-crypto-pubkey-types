{-# LANGUAGE DeriveDataTypeable #-}
-- |
-- Module      : Crypto.Types.PubKey.DSA
-- License     : BSD-style
-- Maintainer  : Vincent Hanquez <vincent@snarc.org>
-- Stability   : Stable
-- Portability : Excellent
--
module Crypto.Types.PubKey.DSA
    ( Params(..)
    , Signature
    , PublicNumber
    , PublicKey(..)
    , PrivateNumber
    , PrivateKey(..)
    ) where

import Data.Data

type PublicNumber = Integer
type PrivateNumber = Integer

-- | Represent DSA parameters namely P, G, and Q.
data Params = Params
    { params_p :: Integer
    , params_g :: Integer
    , params_q :: Integer
    } deriving (Show,Read,Eq,Data,Typeable)

-- | Represent a DSA signature namely R and S.
type Signature = (Integer,Integer)

-- | Represent a DSA public key.
data PublicKey = PublicKey
    { public_params :: Params       -- ^ DSA parameters
    , public_y      :: PublicNumber -- ^ DSA public Y
    } deriving (Show,Read,Eq,Data,Typeable)

-- | Represent a DSA private key.
--
-- Only x need to be secret.
-- the DSA parameters are publicly shared with the other side.
data PrivateKey = PrivateKey
    { private_params :: Params        -- ^ DSA parameters
    , private_x      :: PrivateNumber -- ^ DSA private X
    } deriving (Show,Read,Eq,Data,Typeable)
