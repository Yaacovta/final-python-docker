# גרסה תואמת ל-README (Python 3.7)
FROM python:3.7-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

# התקנת תלויות ב-2 שלבים: קודם reqs, ואז תיקוני תאימות ל-RESTPlus
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir "Flask<2.0" "Werkzeug<2.0" "flask-restplus==0.13.0"

# העתקת שאר הקוד
COPY . .

EXPOSE 5000

# הרצה פשוטה (יש app.py עם app = Flask(__name__))
CMD ["python", "app.py"]
