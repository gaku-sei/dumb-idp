module Main where

import Prelude
import Effect (Effect)
import Handlers.Role (Handlers, handlers) as Role
import Handlers.Token (Handlers, handlers) as Token
import Handlers.User (Handlers, handlers) as User
import Payload.Server (launch) as Payload
import Payload.Spec (Spec(Spec))
import Record (merge)
import Type.Row (type (+))

spec ::
  Spec
    (Record (Role.Handlers + Token.Handlers + (User.Handlers ())))
spec = Spec

main :: Effect Unit
main =
  Payload.launch spec
    $ Role.handlers `merge` Token.handlers `merge` User.handlers
