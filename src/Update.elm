module Update exposing (update)

import Models exposing (Model)
import Msgs exposing (Msg(..))



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        NextSlide ->
            ( { model | currentSlide = model.currentSlide + 1 }, Cmd.none )

        PrevSlide ->
            ( { model | currentSlide = model.currentSlide - 1 }, Cmd.none )
