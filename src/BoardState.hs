module BoardState
  ( getBoardModifiers,
    totalCardModifiers,
  )
where

import CardReader

getBoardModifiers :: [CardReader.Card] -> [Maybe CardReader.CardModifierValue]
getBoardModifiers [] = []

-- TODO fix totalCardModifiers, then this can be fixed too
-- getBoardModifiers xs = [totalCardModifiers . filtered . totalCardModifiers $ mods]
--   where
--     mods = map CardReader.cardModifiers xs
--     reduced = foldl (\z (_, v) -> z + v)
--     filtered :: [CardReader.CardModifierValue] -> [CardReader.CardModifierValue]
--     filtered = filter (\x -> False)

totalCardModifiers :: [CardReader.CardModifierValue] -> Maybe CardReader.CardModifierValue
totalCardModifiers [] = Nothing
-- Haskell cannot seem to infer that this is still a CardModifierValue
totalCardModifiers ((modifierType, modifierVal) : xs) = Just (CardReader.ModifierValue (modifierType, modifierSum))
  where
    -- Haskell does not want to infer that CardModifierValue is assignable to (Any, Int)
    modifierSum = foldl (\accumulator (something, val) -> val + accumulator) modifierVal xs