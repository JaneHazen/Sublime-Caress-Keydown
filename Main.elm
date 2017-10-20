import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Random



main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


type alias Model =
  { color: Color
  }

type alias Color =
  { red : Int
  , green : Int
  , blue : Int
  }

black =
  { red = 0, green = 0, blue = 0}

defaultModel =
  { color = black}

init : (Model, Cmd Msg)
init =
  (defaultModel, Cmd.none)

makeColor: Int -> Int -> Int -> Color
makeColor r g b =
  { red = r, green = g, blue = b }

colorGenerator : Random.Generator Color
colorGenerator =
    Random.map3 makeColor
    (Random.int 0 255)
    (Random.int 0 255)
    (Random.int 0 255)

-- UPDATE


type Msg
  = Roll
  | NewFace Color


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      (model, Random.generate NewFace colorGenerator)

    NewFace newFace ->
      (Model newFace, Cmd.none)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- VIEW

myStyle : String -> Attribute msg
myStyle color =
  style [ ("color", color) ]

toCss : Color -> String
toCss color =
  "rgb(" ++ toString color.red
  ++ "," ++ toString color.green
  ++ "," ++ toString color.blue
  ++ ")"

view : Model -> Html Msg
view model =
  div []
    [ div []
      [ h1 [  myStyle (toCss model.color) , onClick Roll ] [ text "Happiness is the longing for repitition" ]
      ]
    , div []
      [ h1 [  myStyle (toCss model.color) , onClick Roll ] [ text "Happiness is the longing for repitition" ]
      ]
    , div []
      [ h1 [  myStyle (toCss model.color) , onClick Roll ] [ text "Happiness is the longing for repitition" ]
      ]
    , div []
      [ h1 [  myStyle (toCss model.color) , onClick Roll ] [ text "Happiness is the longing for repitition" ]
      ]
    , div []
      [ h1 [  myStyle (toCss model.color) , onClick Roll ] [ text "Happiness is the longing for repitition" ]
      ]
    , div []
      [ h1 [  myStyle (toCss model.color) , onClick Roll ] [ text "Happiness is the longing for repitition" ]
      ]
    , div []
      [ h1 [  myStyle (toCss model.color) , onClick Roll ] [ text "Happiness is the longing for repitition" ]
      ]
    , div []
      [ h1 [  myStyle (toCss model.color) , onClick Roll ] [ text "Happiness is the longing for repitition" ]
      ]
    ]

