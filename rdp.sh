#!/bin/bash

# List of words to simulate typing activity
words=("Analysis" "Data" "Research" "Hypothesis" "Theory" "Variable" "Algorithm"
  "Methodology" "Synthesis" "Evaluation" "Metric" "Framework" "Paradigm"
  "Protocol" "Simulation" "Model" "Validation" "Implementation" "Experiment"
  "Innovation" "Technique" "Strategy" "System" "Mechanism" "Application"
  "Interpretation" "Concept" "Design" "Function" "Architecture" "Component"
  "Structure" "Solution" "Process" "Development" "Performance" "Efficiency"
  "Optimization" "Integration" "Configuration" "Automation" "Scalability"
  "Feasibility" "Reliability" "Robustness" "Adaptability" "Compatibility"
  "Accuracy" "Precision" "Consistency" "Stability" "Usability" "Accessibility"
  "Sustainability" "Security" "Privacy" "Ethics" "Compliance" "Regulation"
  "Standard" "Policy" "Governance" "Framework" "Ecosystem" "Infrastructure"
  "Network" "Interface" "Protocol" "Algorithm" "Logic" "Syntax" "Semantics"
  "Schema" "Query" "Database" "Repository" "Cloud" "Virtualization"
  "Deployment" "Maintenance" "Upgrade" "Backup" "Recovery" "Redundancy"
  "Latency" "Throughput" "Bandwidth" "Load" "Capacity" "Scalability"
  "Elasticity" "Availability" "Monitoring" "Analytics" "Insight"
  "Visualization" "Dashboard" "Report" "Documentation")

# Function to simulate mouse movement
move_mouse() {
  local screen_width=$(xdotool getdisplaygeometry | awk '{print $1}')
  local screen_height=$(xdotool getdisplaygeometry | awk '{print $2}')
  local x=$((RANDOM % screen_width))
  local y=$((RANDOM % screen_height))
  xdotool mousemove $screen_width $screen_height
}

# Function to simulate typing
type_text() {
  for word in "${words[@]}"; do
    xdotool type "$word"
    # xdotool key Return  # Press Enter after each word
    sleep 1  # Add a delay between words
  done
}

# Main loop to simulate activity
# while true; do
  move_mouse
  sleep 5  # Add a delay between mouse movements
  type_text
  sleep 60  # Add a delay between typing sessions
# done