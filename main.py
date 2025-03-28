from fastapi import FastAPI, HTTPException
import subprocess

app = FastAPI()

LOG_FILE = "/var/log/hq_auto_logs/hq_auto.log"

@app.get("/logs")
def get_logs(lines: int = 100):
    try:
        logs = subprocess.run(["tail", "-n", str(lines), LOG_FILE], capture_output=True, text=True, check=True)
        return {"logs": logs.stdout.split("\n")}
    except subprocess.CalledProcessError as e:
        raise HTTPException(status_code=500, detail=f"Error reading logs: {e}")
