FROM python:3.9

# Directorio de trabajo
WORKDIR /app

# Copiar archivos necesarios
COPY ../requirements.txt .
COPY ../app.py .

# Instalar dependencias
RUN pip install -r requirements.txt

# Establecer punto de montaje para el volumen persistente
VOLUME /app/Docker/datanauta

EXPOSE 8501

# Comando para ejecutar la aplicación
CMD ["streamlit", "run", "app.py"]