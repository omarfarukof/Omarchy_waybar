#!/bin/bash

# Get GPU info
read gpu_util vram_used vram_total temp <<<$(nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total,temperature.gpu --format=csv,noheader,nounits)

# Output JSON for Waybar
cat <<EOF
{
  "text": "GPU: ${gpu_util}%",
  "tooltip": "Uses: ${gpu_util}%\nVRAM Used: ${vram_used} / ${vram_total} MB\nTemp: ${temp} °C",
  "class": "gpu"
}
EOF
