# Use an official lightweight Python image
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Copy necessary files
COPY requirements.txt .
COPY main.py .
COPY run.sh .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Grant execute permission to script
RUN chmod +x run.sh

# Expose FastAPI default port
EXPOSE 8000

# Run the application
CMD ["./run.sh"]
