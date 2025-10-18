# Use the official lightweight Python image.
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy local code to the container image.
COPY . .

# Install production dependencies.
RUN pip install --no-cache-dir Flask gunicorn

# Tell Cloud Run which port the app will listen on
ENV PORT 8080

# Run the web server on container startup
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "main:app"]
