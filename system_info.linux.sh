#!/bin/bash

# Simple script to gather essential system information for SHA-256 benchmarking
# Usage: ./system_info.sh

echo "=========================================="
echo "SYSTEM INFO - $(date)"
echo "=========================================="

# CPU Information
echo "=== HARDWARE ==="
if command -v lscpu &> /dev/null; then
    CPU_MODEL=$(lscpu | grep "Model name" | sed 's/Model name:[[:space:]]*//')
    CPU_CORES=$(lscpu | grep "^CPU(s):" | sed 's/CPU(s):[[:space:]]*//')
    CPU_MAX_MHZ=$(lscpu | grep "CPU max MHz" | sed 's/CPU max MHz:[[:space:]]*//')
    
    echo "CPU: $CPU_MODEL"
    echo "Cores: $CPU_CORES"
    if [[ -n "$CPU_MAX_MHZ" ]]; then
        MAX_GHZ=$(echo "scale=1; $CPU_MAX_MHZ / 1000" | bc 2>/dev/null || echo "${CPU_MAX_MHZ} MHz")
        echo "Max Frequency: ${MAX_GHZ} GHz"
    fi
else
    CPU_MODEL=$(grep "model name" /proc/cpuinfo | head -1 | cut -d: -f2 | sed 's/^[[:space:]]*//')
    CPU_COUNT=$(nproc)
    echo "CPU: $CPU_MODEL"
    echo "Cores: $CPU_COUNT"
fi

# Memory
if [[ -f /proc/meminfo ]]; then
    TOTAL_MEM=$(grep "MemTotal" /proc/meminfo | awk '{printf "%.0f GB", $2/1024/1024}')
    echo "RAM: $TOTAL_MEM"
fi

# Architecture
echo "Architecture: $(uname -m)"
echo ""

# Operating System
echo "=== SOFTWARE ==="
if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    echo "OS: $PRETTY_NAME"
else
    echo "OS: $(uname -s) $(uname -r)"
fi

echo "Kernel: $(uname -r)"

# Compiler
if command -v gcc &> /dev/null; then
    GCC_VERSION=$(gcc --version | head -1 | awk '{print $1, $3}')
    echo "Compiler: $GCC_VERSION"
else
    echo "Compiler: GCC not found"
fi
echo ""

# Current system status
echo "=== STATUS ==="
echo "Load: $(cat /proc/loadavg | cut -d' ' -f1-3)"

# Memory usage
MEM_USED=$(free -h | awk 'NR==2{printf "%.0fG/%.0fG", $3, $2}' | sed 's/Gi/G/g')
echo "Memory used: $MEM_USED"

echo "=========================================="
