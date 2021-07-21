import Config

config :pratipad,
  dataflow: Pratipad.Example.Dataflow,

  # Optional settings only for demand mode
  demand: [
    rate_limiting: [
      allowed_messages: 2,
      interval: 60 * 1_000
    ],
    count: [
      max_demand: 2,
      min_demand: 0
    ]
  ]
