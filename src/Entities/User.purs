module Entities.User (User) where

import Entities.Role (Role)

type User
  = { id :: String, roles :: Array Role }
