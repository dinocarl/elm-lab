module Models exposing (Item, Model, Slide, SlideID, initialModel)

---- MODEL ----


type alias Model =
    { slides : List Slide
    , currentSlide : SlideID
    }


initialModel : Model
initialModel =
    { slides =
        [ Slide 1 "First Slide" [ "Point A", "Point B" ]
        , Slide 2 "2nd Slide" [ "C", "D" ]
        , Slide 3 "3rd Slide" [ "E", "F" ]
        ]
    , currentSlide =
        1
    }


type alias Item =
    String


type alias SlideID =
    Int


type alias Slide =
    { id : SlideID
    , title : String
    , items : List Item
    }
