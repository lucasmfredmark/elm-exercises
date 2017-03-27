import Html exposing (..)
import Html.Events exposing (..)

--
-- Railroad exercise
-- The application below implements a railroad which does the following
-- 1: Takes a list of Strings and merges it into one string
-- 2: Counts the size of the string
-- 3: Transforms that size into a Model
-- Your job is to implement the three functions
--

type alias Model
  = { characters : Maybe Int }

type Msg
  = Count (Maybe (List String))

view : Model -> Html Msg
view model =
  div []
  [ text (toString model.characters)
  , br [] []
  , button [ onClick (Count (Nothing))] [text "Count Nothing (Nothing)"]
  , button [ onClick (Count (Just [""]))] [text "Count [] (Just 0)"]
  , button [ onClick (Count (Just ["one", "two"]))] [ text "Count [one, two] (Just 6)" ]
  , button [ onClick (Count (Just [" ", "", ""]))] [text "Count [' ', '', ''] (Just 1)"]
  , button [ onClick (Count (Just ["To", "be", "or", "not", "to", "be"]))] [text "Count [to, be, or, not, to, be] (Just 13)"]
  ]

update : Msg -> Model -> Model
update msg model =
  case msg of
    Count input ->
      mergeStrings input
      |> countStringLength
      |> resultToModel

main = Html.beginnerProgram
  { model = Model Nothing
  , view = view
  , update = update }

--
-- Implement the three functions below
--

mergeStrings : Maybe (List String) -> Result String String
mergeStrings maybe =
  Err "HAAARP"
  -- Implement me!

countStringLength : Result String String -> Result String Int
countStringLength result =
  Err "Area 51"
  -- Implement me!

resultToModel : Result String Int -> Model
resultToModel result =
  Model Nothing
  -- Implement me!
