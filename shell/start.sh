netstat -anp | grep 0.0.0.0:8188 | awk '{print $7}' | cut -d'/' -f1 | xargs kill -9
nohup python main.py --listen 0.0.0.0 > logs/comfyui.log 2>&1 &