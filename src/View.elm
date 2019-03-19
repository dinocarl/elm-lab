module View exposing (view)

import Html exposing (Html, button, div, h1, img, text)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)
import Models exposing (Model)
import Msgs exposing (Msg(..))



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
