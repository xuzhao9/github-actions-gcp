
local base = import "templates/base.libsonnet";
local utils = import "templates/utils.libsonnet";
local gpus = import "templates/gpus.libsonnet";
local volumes = import "templates/volumes.libsonnet";

# Mnist
local mnist = base.BaseTest {
  frameworkPrefix: "pytorch-oss",
  modelName: "mnist",
  mode: "example",
  configMaps: [],

  timeout: 20, # 20 seconds

  image: std.extVar('image'),
  imageTag: std.extVar('image-tag'),

  cpu: "2",
  memory: "8Gi",
  accelerator: gpus.teslaK80,

  volumeMap+: {
    dshm: volumes.MemoryVolumeSpec {
      name: "dshm",
      mountPath: "/dev/shm",
    },
  },
  
  command: utils.scriptCommand(
    |||
      echo "Running CPU Tests on GKE machine ..."
    |||
  ),
};

mnist.oneshotJob

# TODO: cpu WLM LSTM
# TODO: cpu WLM Transformer

