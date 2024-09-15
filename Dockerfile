# # Dockerfile

# # Use the official Python image from the Docker Hub
# FROM python:3.9-slim

# # Set the working directory
# WORKDIR /app

# # Copy the requirements file and install dependencies
# COPY requirements.txt .

# RUN pip install -r requirements.txt

# # Copy the app code
# COPY app.py .

# # Expose the Streamlit default port
# EXPOSE 8501

# # Run the app
# CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]

# Use the official Python slim image as the base
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY app.py .

# Set Streamlit's configuration to bind to 0.0.0.0 and use port 8080, which is required by Cloud Run
ENV STREAMLIT_SERVER_HEADLESS=true
ENV STREAMLIT_SERVER_ENABLE_CORS=false
ENV STREAMLIT_SERVER_PORT=8080

# Expose port 8080
EXPOSE 8080

# Run the Streamlit app
CMD ["streamlit", "run", "app.py", "--server.port=8080", "--server.address=0.0.0.0"]
