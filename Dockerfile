FROM python:3.8-slim-buster

WORKDIR /docker_demo

# RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p /root/.cache/torch/hub/checkpoints/

RUN mv /docker_demo/densenet121-a639ec97.pth /root/.cache/torch/hub/checkpoints/densenet121-a639ec97.pth

CMD ["python", "app.py"]