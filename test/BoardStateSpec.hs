module BoardStateSpec (spec) where

import BoardState
import CardReader
import qualified CardReader as CR (CardModifierType (Valor), CardModifierValue (ModifierValue))
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Total modifiers" $ do
    it "can sum two modifiers of the same type" $ do
      BoardState.totalCardModifiers [CardReader.ModifierValue (CardReader.Valor, 2), CardReader.ModifierValue (CardReader.Valor, 3)] `shouldBe` Just (CardReader.ModifierValue (CardReader.Valor, 5))
  describe "Get board modifiers" $ do
    it "can get modifiers for an empty state" $ do
      BoardState.getBoardModifiers [] `shouldBe` []

-- it "can get modifiers for a single card" $ do
--   BoardState.getBoardModifiers
--     [ CardReader.Card
--         { cardName = "Parrot bee",
--           cardFlavorText = "Squak buzz",
--           cardModifiers = [CR.ModifierValue (Valor, 1)],
--           cardConditions = []
--         }
--     ]
--     `shouldBe` [CR.ModifierValue (CR.Valor, 1)]