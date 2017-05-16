module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

--
-- Exercise 1b
-- This exercise is about reusing components with functions instead of objects.
-- Look at the view method. A lot of the code is duplicated there. Can you think
-- of a smarter way to write that?
-- Hint: write a helper-function.
--

-- Model
type alias Model =
  { status : Status }

type Status =
    Single
  | Complicated
  | Relationship
  | Married
  | Other

-- UPDATE
type Msg = SetStatus Status

update : Msg -> Model -> ( Model, Cmd Msg )
update (SetStatus status) model = (Model status, Cmd.none)

view : Model -> Html Msg
view model =
  fieldset []
    [ label []
        [ input [ type_ "radio", name "status-radio", onClick (SetStatus Single) ] []
        , text "Single"
        ]
    , label []
        [ input [ type_ "radio", name "status-radio", onClick (SetStatus Complicated) ] []
        , text "It's complicated..."
        ]
    , label []
        [ input [ type_ "radio", name "status-radio", onClick (SetStatus Relationship) ] []
        , text "In a relationship"
        ]
    , labelData "Married" Married model
    , labelData "Keep out of my private life!" Other model
    ]

labelData : String -> Status -> Model -> Html Msg
labelData title status model =
  let
    isChecked = status == model.status
  in
   label []
      [ input [ type_ "radio", name "status-radio", checked isChecked, onClick (SetStatus status) ] []
      , text title
      ]

main =
  Html.program
    { init = (Model Married, Cmd.none)
    , view = view
    , update = update
    , subscriptions = \m -> Sub.none
    }
