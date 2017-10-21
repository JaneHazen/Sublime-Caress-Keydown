import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Random


-- MODEL


type alias Model =
  { textbox : List DivInfo
  }

type alias DivInfo =
  { id: Int
  , opacity: Bool
  , content: String
  }

type Msg
  = NoOp
  | CorrectAnswer Int


defaultModel =
  { textbox =
    [{ id = 1
    , opacity = True
    , content = "Happiness is the longing for repetition"
    }
    , { id = 2
    , opacity = True
    , content = "Happiness is the longing for repetition"
    }
    , { id = 3
    , opacity = True
    , content = "Happiness is the longing for repetition"
    }
    , { id = 4
    , opacity = True
    , content = "Happiness is the longing for repetition"
    }
    , { id = 5
    , opacity = True
    , content = "Happiness is the longing for repetition"
    }
    , { id = 6
    , opacity = True
    , content = "Happiness is the longing for repetition"
    }
    , { id = 7
    , opacity = True
    , content = "Happiness is the longing for repetition"
    }]
  }


init : (Model, Cmd Msg)
init =
  (defaultModel, Cmd.none)

-- UPDATE
updateOpacity : DivInfo -> DivInfo -> Model
updateOpacity textbox model =
  List.indexedMap
    (\ index divinfo ->
      if divinfo.id == index then
        {divinfo | opacity = False}
      else
        {divinfo | opacity = True}
    ) model.textbox

update : Msg -> Model -> Model
update msg model =
  case msg of
    CorrectAnswer id ->
      { model | textbox = updateOpacity }
    _ ->
    model



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

  --["{ opacity:.3; }", "{ opacity:1;}"]


-- VIEW

myStyle : String -> Attribute msg
myStyle opacity =
  style [ ("opacity", opacity) ]

toCss : DivInfo -> String
toCss opacity =
  if True
  then ".3"
  else
    "1"


view : Model -> Html Msg
view model =
  div []
    [ul [] (List.map viewDiv model.textbox )
    ]

viewDiv : DivInfo -> Html Msg
viewDiv textbox =
       div []
      [ h1 [  myStyle (toCss textbox) , onClick (CorrectAnswer textbox.id) ] [ text textbox.content ]
      ]

