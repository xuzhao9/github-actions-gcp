
# This image contains Conda, PyTorch, the NVIDIA stack (if GPU images)
jsonnet -J . ci_pytorch/cpu_tests.jsonnet \
        --ext-str image=gcr.io/deeplearning-platform-release/pytorch-cpu.1-4 \
        --ext-str image-tag=latest | kubectl create -f -
