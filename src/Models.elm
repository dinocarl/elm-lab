module Models exposing (Item, Model, Slide, SlideID, initialModel)

---- MODEL ----


type alias Model =
    { slides : List Slide }


initialModel : Model
initialModel =
    { slides = [ Slide 1 "First Slide" [ "Point A", "Point B" ] ] }


type alias Item =
    String


type alias SlideID =
    Int


type alias Slide =
    { id : SlideID
    , title : String
    , items : List Item
    }
