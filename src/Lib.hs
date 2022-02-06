{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Lib
  ( Card (Card),
    CardModifierType,
    cardName,
    cardFlavorText,
    cardModifiers,
    cardConditions,
    Deck (Deck),
    deckCards,
    deckName,
    deckId,
    loadDeck,
  )
where

import Data.Aeson
import qualified Data.ByteString.Lazy as BS
import GHC.Generics

data CardModifierType = Murder | Valor deriving (Enum)

data CardModifierValue = CardModifierType Int deriving (Show, Generic)

instance Data.Aeson.ToJSON CardModifierValue where
  toEncoding = Data.Aeson.genericToEncoding Data.Aeson.defaultOptions

instance Data.Aeson.FromJSON CardModifierValue

data Card = Card
  { cardName :: String,
    cardFlavorText :: String,
    cardModifiers :: [CardModifierValue],
    cardConditions :: [CardModifierValue]
  }
  deriving (Generic, Show)

instance Data.Aeson.ToJSON Card

instance Data.Aeson.FromJSON Card

data Deck = Deck
  { deckName :: String,
    deckId :: Int,
    deckCards :: [Card]
  }
  deriving (Generic, Show)

instance Data.Aeson.ToJSON Deck

instance Data.Aeson.FromJSON Deck

getJSON :: FilePath -> IO BS.ByteString
getJSON filePath = BS.readFile filePath

loadDeck :: FilePath -> IO (Either String Deck)
loadDeck filePath = (eitherDecode <$> getJSON filePath) :: IO (Either String Deck)
