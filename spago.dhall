{ name =
    "reccoo-idp"
, dependencies =
    [ "console"
    , "effect"
    , "psci-support"
    , "payload"
    , "typelevel-prelude"
    , "record"
    ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
}
