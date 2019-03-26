module View exposing (view)

import Html exposing (Html, button, div, h1, img, li, text, ul)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Models exposing (Item, Model, Slide, getFromListWithID)
import Msgs exposing (Msg(..))



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ nav model.slides
        , div []
            [ model.currentSlide
                |> String.fromInt
                |> text
            ]
        , model.slides
            |> getFromListWithID model.currentSlide
            |> currentSlide
        ]


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
    div []
        [ h1 [ class "title" ] [ text slide.title ]
        , ul [ class "bullet-points" ] (List.map bullet slide.items)
        ]
