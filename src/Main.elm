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
        -- [ square blue 40
        --     |> move x y
        -- ]
        -- ,
        gameBoard computer (x, y)
    ]

gameBoard computer (x,y) =
        let
            inside = if (x < ((constants computer).height / 2) && y < ((constants computer).height / 2)
                                && x > -((constants computer).height / 2) && y > -((constants computer).height / 2))then
                                True
                            else
                                False
            borderCross =  if (inside) then
                                move x y
                            else if x >= ((constants computer).height / 2) && y >= ((constants computer).height / 2) then
                                move ((constants computer).height / 2) ((constants computer).height / 2)
                            else if x <= -((constants computer).height / 2) && y >= ((constants computer).height / 2) then
                                move -((constants computer).height / 2) ((constants computer).height / 2)
                            else if x >= ((constants computer).height / 2) && y <= -((constants computer).height / 2) then
                                move ((constants computer).height / 2) -((constants computer).height / 2)
                            else if x <= -((constants computer).height / 2) && y <= -((constants computer).height / 2) then
                                move -((constants computer).height / 2) -((constants computer).height / 2)
                            else if x >= ((constants computer).height / 2) then
                                move ((constants computer).height / 2) y
                            else if x <= -((constants computer).height / 2) then
                                move -((constants computer).height / 2) y
                            else if y >= ((constants computer).height / 2) then
                                move x ((constants computer).height / 2)
                            else if y <= -((constants computer).height / 2) then
                                move x -((constants computer).height / 2)
                            else
                                move 0 0

        in
        List.concat [
            [ square blue 40
            -- |> move x y
                |> borderCross
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
            ,
            [
                words black ("x = " ++ (String.fromFloat x))
                |> move ((constants computer).height) 0
                ,
                words black ("y = " ++ (String.fromFloat y))
                |> move ((constants computer).height) -50
            ]
        ]

-- viewGame =

update computer (x,y) =
    if ((x > ((constants computer).height / 2) && (y > ((constants computer).height / 2))) ||
        (x > ((constants computer).height / 2) && (y < -((constants computer).height / 2))) ||
        (x < -((constants computer).height / 2) && (y > ((constants computer).height / 2))) ||
        (x < -((constants computer).height / 2) && (y < -((constants computer).height / 2)))) then
        ( x
        , y
        -- , Debug.log "Hello"
        )
    else
    if ((x >= ((constants computer).height / 2) && computer.keyboard.right) ||
        (x <= -((constants computer).height / 2) && computer.keyboard.left )) then
        ( x
        , y + 10 * toY computer.keyboard
        -- , Debug.log "Hello"
        )
    else if ((y >= ((constants computer).height / 2) && computer.keyboard.up) ||
            (y <= -((constants computer).height / 2) && computer.keyboard.down )) then
        ( x + 10 * toX computer.keyboard
        , y
        -- , Debug.log "Hello"
        )
    else
        ( x + 10 * toX computer.keyboard
        , y + 10 * toY computer.keyboard
        -- , Debug.log "Hello"
        )


