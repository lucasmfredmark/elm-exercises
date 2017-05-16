module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

--
-- Exercise 1a
-- This exercise is about reusing components with functions instead of objects.
-- Look at the view method. A lot of the code is duplicated there. Can you think
-- of a smarter way to write that?
-- Hint: write a helper-function.
--

-- Model
type alias Model =
  { notifications : Bool
  , draggable : Bool
  , withColor : Bool}


-- UPDATE
type Msg = ToggleNotifications
  | ToggleDrag
  | ToggleColor

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = case msg of
  ToggleNotifications -> ({ model | notifications = not model.notifications }, Cmd.none)
  ToggleDrag -> ({ model | draggable = not model.draggable }, Cmd.none)
  ToggleColor -> ({ model | withColor = not model.withColor }, Cmd.none)

view : Model -> Html Msg
view model =
  fieldset []
    [ helperCheckbox ToggleNotifications "Some text"
    , helperCheckbox ToggleDrag "Drag me!"
    ]

helperCheckbox : Msg -> String -> Html Msg
helperCheckbox msg nameIshSomething =
  label []
      [ input [ type_ "checkbox", onClick msg ] []
      , text nameIshSomething
      ]

main : Program Never Model Msg
main =
  Html.program
    { init = (Model False False False, Cmd.none)
    , view = view
    , update = update
    , subscriptions = \m -> Sub.none
    }
