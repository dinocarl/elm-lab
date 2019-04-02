module View exposing (view)

import Html exposing (Html, article, aside, button, div, h1, img, li, text, ul)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Models exposing (Item, Model, Slide, SlideID, getSlideByID)
import Msgs exposing (Msg(..))



---- VIEW ----


view : Model -> Html Msg
view model =
    let
        slideData =
            getSlideByID model.currentSlide model.slides
    in
    div [ class "pres" ]
        [ aside [ class "nav" ]
            [ prevBtn model.currentSlide
            , nextBtn model.currentSlide
            , nav model.slides
            ]
        , article [ class "content" ]
            [ slideOrFallback slideData
            ]
        ]


nextBtn : SlideID -> Html Msg
nextBtn slideID =
    button
        [ onClick NextSlide
        ]
        [ slideID
            |> (+) 1
            |> String.fromInt
            |> (++) "Next -> "
            |> text
        ]


prevBtn : SlideID -> Html Msg
prevBtn slideID =
    button
        [ onClick PrevSlide
        ]
        [ text "Prev"
        ]


slideOrFallback : Maybe Slide -> Html Msg
slideOrFallback maybeSlide =
    case maybeSlide of
        Nothing ->
            h1 [] [ text "No Slide" ]

        Just item ->
            currentSlide item


nav : List Slide -> Html Msg
nav slides =
    ul [ class "all-slides" ] (List.map navItem slides)


navItem : Slide -> Html Msg
navItem slide =
    li [] [ text slide.title ]


bullet : Item -> Html Msg
bullet item =
    li [] [ text item ]


currentSlide : Slide -> Html Msg
currentSlide slide =
    div [ class "currentslide" ]
        [ h1 [ class "title" ] [ text slide.title ]
        , ul [ class "bullet-points" ] (List.map bullet slide.items)
        ]
