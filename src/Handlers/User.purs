module Handlers.User (CreateUserPayload, Handlers, handlers) where

import Prelude
import Effect.Aff (Aff)
import Entities.User (User)
import Payload.Spec (GET, POST, Routes)

type CreateUserPayload
  = { roles :: Array String }

type Handlers r
  = ( users ::
      Routes "/users"
        { all :: GET "/" { response :: Array User }
        , create :: POST "/" { body :: CreateUserPayload, response :: User }
        }
    | r
    )

all :: {} -> Aff (Array User)
all = const $ pure [ { id: "1", roles: [] }, { id: "2", roles: [ { name: "admin" } ] } ]

create :: { body :: CreateUserPayload } -> Aff User
create { body } = pure { id: "1", roles: [] }

handlers = { users: { all, create } }
