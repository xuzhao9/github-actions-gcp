
local base = import 'templates/base.libsonnet';
local utils = import "templates/utils.libsonnet";
local volumes = import "templates/volumes.libsonnet";

# Mnist
local mnist = base.BaseTest {
  frameworkPrefix: "pytorch-oss",
  modelName: "mnist",
  mode: "example",
  configMaps: [],

  timeout: 900, # 15 minutes, in seconds

  image: std.extVar('image'),
  imageTag: std.extVar('image-tag'),

  cpu: "4.5",
  memory: "8Gi",
  accelerator: nvidia.,
  
  command: utils.scriptCommand(
    |||
      echo "Running CPU Tests on GKE machine ..."
    |||
  ),
};

mnist.oneshotJob

# TODO: cpu WLM LSTM
# TODO: cpu WLM Transformer

