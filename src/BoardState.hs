module BoardState
  ( getBoardModifiers,
    totalCardModifiers,
  )
where

import CardReader
import Data.List (groupBy, sort, sortBy)

getBoardModifiers :: [CardReader.Card] -> [Maybe CardReader.CardModifierValue]
getBoardModifiers [] = []
getBoardModifiers xs = map totalCardModifiers $ groupMods mods
  where
    mods = xs >>= CardReader.cardModifiers
    groupMods = groupBy (\a b -> CardReader.modifierType a == CardReader.modifierType b) . sortBy (\a b -> if CardReader.modifierType a == CardReader.modifierType b then LT else GT)

totalCardModifiers :: [CardReader.CardModifierValue] -> Maybe CardReader.CardModifierValue
totalCardModifiers [] = Nothing
totalCardModifiers (CardReader.CardModifierValue {modifierType = t, modifierValue = v} : xs) = Just (CardReader.CardModifierValue {modifierType = t, modifierValue = modifierSum})
  where
    modifierSum = foldl (\accumulator CardReader.CardModifierValue {modifierValue = val} -> val + accumulator) v xs