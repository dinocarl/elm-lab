module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, button, div, h1, img, text)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)



---- MODEL ----


type alias Model =
    Bool


init : ( Model, Cmd Msg )
init =
    ( True, Cmd.none )



---- UPDATE ----


type Msg
    = Expand
    | Collapse


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Expand ->
            ( True, Cmd.none )

        Collapse ->
            ( False, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    if model then
        div []
            [ button [ onClick Collapse ] [ text "Collapse" ]
            , img [ src "/logo.svg" ] []
            , h1 [] [ text "Your Elm App is working!" ]
            ]

    else
        div []
            [ button [ onClick Expand ] [ text "Expand" ] ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
