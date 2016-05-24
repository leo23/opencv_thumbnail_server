
use Mix.Config

config :opencv_thumbnail_server, settings: [
  # Shoud not be the system python in OSX
  {:python, '/usr/local/bin/python'},
  # Python module path use to find module
  {:python_path, "priv" |> Path.expand |> to_char_list},
  # Python module use to make thumbnail
  {:module_name, :main},
  # Poolboy configurations
  {:poolboy, [
    name: {:local, :opencv_thumbnail_server_pool},
    worker_module: OpencvThumbnailServer.Worker,
    size: 10,
    max_overflow: 20
  ]}
]