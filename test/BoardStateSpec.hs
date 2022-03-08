module BoardStateSpec (spec) where

import BoardState
import CardReader
import qualified CardReader as CR (CardModifierType (Valor), CardModifierValue (CardModifierValue))
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Total modifiers" $ do
    it "can sum two modifiers of the same type" $
      do
        BoardState.totalCardModifiers
          [ CR.CardModifierValue {modifierType = CardReader.Valor, modifierValue = 2},
            CR.CardModifierValue {modifierType = CardReader.Valor, modifierValue = 3}
          ]
        `shouldBe` Just (CR.CardModifierValue {modifierType = CardReader.Valor, modifierValue = 5})
  describe "Get board modifiers" $ do
    it "can get modifiers for an empty state" $ do
      BoardState.getBoardModifiers [] `shouldBe` []

    it "can get modifiers for a single card" $ do
      BoardState.getBoardModifiers
        [ CardReader.Card
            { cardName = "Parrot bee",
              cardFlavorText = "Squak buzz",
              cardModifiers = [CR.CardModifierValue {modifierType = CardReader.Valor, modifierValue = 2}],
              cardConditions = []
            }
        ]
        `shouldBe` [Just CR.CardModifierValue {modifierType = CardReader.Valor, modifierValue = 2}]

    it "can get modifiers for multiple cards" $ do
      BoardState.getBoardModifiers
        [ CardReader.Card
            { cardName = "Parrot bee",
              cardFlavorText = "Squak buzz",
              cardModifiers = [CR.CardModifierValue {modifierType = CardReader.Valor, modifierValue = 2}],
              cardConditions = []
            },
          CardReader.Card
            { cardName = "Bubble bee",
              cardFlavorText = "Bloop buzz",
              cardModifiers = [CR.CardModifierValue {modifierType = CardReader.Valor, modifierValue = 5}],
              cardConditions = []
            },
          CardReader.Card
            { cardName = "Zom bee",
              cardFlavorText = "Urgh buzz",
              cardModifiers = [CR.CardModifierValue {modifierType = CardReader.Murder, modifierValue = 3}],
              cardConditions = []
            }
        ]
        `shouldMatchList` [Just CR.CardModifierValue {modifierType = CardReader.Valor, modifierValue = 7}, Just CR.CardModifierValue {modifierType = CardReader.Murder, modifierValue = 3}]