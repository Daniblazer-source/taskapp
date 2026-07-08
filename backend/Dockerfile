# Base Image
FROM python:3.12-slim

# Prevent python from writting .pyc files
ENV PYTHONDONTWRITEBYTECODE=1

# Ensure logs appear immediately 
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "run:app"]