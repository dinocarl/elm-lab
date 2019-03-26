module Models exposing (Item, Model, Slide, SlideID, fallbackSlide, getFromListWithID, initialModel)

---- MODEL ----


type alias Model =
    { slides : List Slide
    , currentSlide : SlideID
    }


fallbackSlide : Slide
fallbackSlide =
    Slide 0 "Title" [ "a", "b" ]


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


getFromListWithID id xs =
    let
        x =
            List.filter (\i -> i.id == id) xs
    in
    case List.head x of
        Nothing ->
            fallbackSlide

        Just item ->
            item
