module Main exposing (main)
import Playground exposing (..)

-- view model = picture
--     [ rectangle brown 40 200
--     , circle green 100
--         |> moveUp 100
--     ]

-- main = view "no model yet"

-- main =
--     animation view

-- view time =
--     [ triangle orange 50
--         |> rotate (spin -1 time)
--     ]

constants computer = {
        height = ((3 *computer.screen.height) / 4)
    }

main =
    game view update (0,0)

view computer (x,y) =
    List.concat
    [
        [ square blue 40
            |> move x y
        ]
        ,
        gameBoard computer (x, y)
    ]

gameBoard computer (x,y) =
        List.concat [
            [ square blue 40
            |> move x y
            ]
            ,
            [
                rectangle black 2 (constants computer).height
                |> move ((constants computer).height / 2) 0
            ]
            ,
            [
                rectangle black 2 (constants computer).height
                |> move -((constants computer).height / 2) 0
            ]
            ,
            [
                rectangle black (constants computer).height 2
                |> move 0 ((constants computer).height / 2)
            ]
            ,
            [
                rectangle black (constants computer).height 2
                |> move 0 -((constants computer).height / 2)
            ]
        ]

-- viewGame =

update computer (x,y) =
    ( x + 10 * toX computer.keyboard
    , y + 10 * toY computer.keyboard
    )


