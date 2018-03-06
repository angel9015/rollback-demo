use Mix.Config

config :rollbax,
  access_token: System.get_env("ROLLBAR_ACCESS_TOKEN"),
  environment: "production",
  enable_crash_reports: true
