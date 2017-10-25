module Main exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import List exposing (..)


-- MODEL

main : Program Never Model Msg
main =
  Html.program
  { init = (init, Cmd.none)
    ,view = view
    , update = update
    , subscriptions = \_ -> Sub.none
  }

type alias Model =
  { content: String
    , numberOfLines: Int
    , selectedIndex: Int
  }


type Msg
  = NoOp
  | SelectCorrectAnswer Int

init: Model
init =
  { content = "Happiness is the longing for repetition"
    , numberOfLines =  7
    , selectedIndex = 0
  }



update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoOp ->
      (model, Cmd.none)
    SelectCorrectAnswer index ->
      ({model | selectedIndex = index}, Cmd.none)
-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ul [] (lines model)
    ]

lines : Model -> List (Html Msg)
lines {content, numberOfLines, selectedIndex} =
    repeat numberOfLines 0.3
    |> indexedMap (\index opacity ->
        if index == selectedIndex then
          (1.0, index)
        else
          (opacity, index)
          )
    |> List.map (contentListItem content)


contentListItem : String -> ( Float, Int )  -> Html Msg
contentListItem content ( opacity, index ) =
      li
        [ onClick (SelectCorrectAnswer index)
        , style [ ("opacity", toString opacity) ]
        ]
        [ Html.text content ]


