import Control.Exception (evaluate)
import Data.Aeson
import Data.ByteString.Lazy
import qualified Data.ByteString.Lazy.Char8 as C
import Lib
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
  describe "Card loading" $ do
    it "can read a card without modifiers" $ do
      let rawJson = C.pack "{\"cardName\": \"Lord of Valor\", \"cardFlavorText\": \"The Knight King on his silver throne\", \"cardModifiers\": [], \"cardConditions\": []}"
      let parsedJson = Data.Aeson.decode rawJson :: Maybe (Card)
      fmap Lib.cardName parsedJson `shouldBe` Just "Lord of Valor"

    it "can import a deck of cards from a file" $ do
      content <- Data.ByteString.Lazy.readFile "./test/testCards1.json"
      let cards = Data.Aeson.decode content :: Maybe [Card]
      fmap Prelude.length cards `shouldBe` Just 3
      fmap (Prelude.map Lib.cardName) cards `shouldBe` Just ["Mason of Death", "Knight of Night", "Ring of Avarice"]

    it "can import a deck of cards from a file 2" $ do
      eitherDeck <- Lib.loadDeck "./test/testDeck1.json"
      Prelude.length <$> Lib.deckCards <$> eitherDeck `shouldBe` Right 3
      (Prelude.map Lib.cardName) <$> Lib.deckCards <$> eitherDeck `shouldBe` Right ["Mason of Death", "Knight of Night", "Ring of Avarice"]
