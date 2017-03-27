-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/time.html

import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, second)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL
type alias Model = Time

init : (Model, Cmd Msg)
init = -- What to initialise??

-- UPDATE
type Msg
  = -- What can we do?

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  -- Handle model

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  -- Subscribe to something

-- VIEW
view : Model -> Html Msg
view model =
  -- show stuff
