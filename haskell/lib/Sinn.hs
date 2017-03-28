{-# LANGUAGE NoImplicitPrelude #-}

module Sinn (module S) where

import Prelude as S hiding ((++), (.), id, map)
import Data.Monoid as S
import Control.Monad as S
import Control.Arrow as S
import Control.Category as S

---------------
-- MONADPLUS --
---------------

(++) :: MonadPlus m => m a -> m a -> m a
(++) = mplus

map :: Functor f => (a -> b) -> f a -> f b
map = fmap

instance Functor [] where
  
