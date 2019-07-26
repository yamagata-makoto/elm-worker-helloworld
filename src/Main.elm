port module Main exposing (main)

import Platform


type alias Model =
    {}

type Msg
    = OnBoot String

port boot : (String -> msg) -> Sub msg

init : Int -> ( Model, Cmd Msg )
init _ =
    ( {}, Cmd.none )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnBoot s ->
            s
                |> Debug.log "Started"
                |> always ( model, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model =
    boot OnBoot

main =
    Platform.worker
        { init = init
        , update = update
        , subscriptions = subscriptions
        }

