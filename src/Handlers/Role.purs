module Handlers.Role (CreateRolePayload, Handlers, handlers) where

import Prelude
import Effect.Aff (Aff)
import Entities.Role (Role)
import Payload.ResponseTypes (Empty(..))
import Payload.Spec (DELETE, GET, POST, Routes)

type CreateRolePayload
  = { name :: String }

type Handlers r
  = ( roles ::
      Routes "/roles"
        { all :: GET "/" { response :: Array Role }
        , create :: POST "/" { body :: CreateRolePayload, response :: Role }
        , delete :: DELETE "/<name>" { params :: { name :: String } }
        }
    | r
    )

all :: {} -> Aff (Array Role)
all = const $ pure [ { name: "Hey " <> show 2 }, { name: "Limit " <> show 2 } ]

create :: { body :: CreateRolePayload } -> Aff Role
create { body } = pure { name: "Hey " <> show 2 }

delete :: { params :: { name :: String } } -> Aff Empty
delete _ = pure Empty

handlers = { roles: { all, create, delete } }
