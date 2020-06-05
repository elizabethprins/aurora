module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)



-- MAIN


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MODEL


type alias Model =
    Int


init : () -> ( Model, Cmd Msg )
init _ =
    ( 0, Cmd.none )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Aurora"
    , body =
        [ main_ [ class "main" ]
            [ nav [ class "nav" ] []
            , article [ class "content" ]
                [ h1 [ class "title" ] <| text_ "AUROra"
                ]
            ]
        ]
    }


text_ : String -> List (Html Msg)
text_ string =
    let
        delay i =
            style "transition-delay" <| (String.fromInt (i * 80) ++ "ms")
    in
    List.indexedMap
        (\i s -> span [ class "title__char" ] <| List.repeat 2 (span [ delay i ] [ text s ]))
        (String.split "" string)
