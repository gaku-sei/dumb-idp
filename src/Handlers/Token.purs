module Handlers.Token
  ( CreateTokenPayload
  , VerifyTokenPayload
  , Handlers
  , handlers
  ) where

import Prelude
import Effect.Aff (Aff)
import Entities.Token (Token)
import Payload.ResponseTypes (Empty(..))
import Payload.Spec (POST, Routes)

type CreateTokenPayload
  = { id :: String, password :: String }

type VerifyTokenPayload
  = { accessToken :: String }

type Handlers r
  = ( tokens ::
      Routes "/tokens"
        { create :: POST "/" { body :: CreateTokenPayload, response :: Token }
        , verify :: POST "/verify" { body :: VerifyTokenPayload, response :: Empty }
        }
    | r
    )

create :: { body :: CreateTokenPayload } -> Aff Token
create { body } = pure "Super token"

verify :: { body :: VerifyTokenPayload } -> Aff Empty
verify { body } = pure Empty

handlers = { tokens: { create, verify } }
