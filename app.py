from flask import Flask, Response
import prometheus_client
from prometheus_client import Counter, Histogram
import time

app = Flask(__name__)


_INF = float("inf")
graphs = {}
graphs['c'] = Counter('python_request_api_home_page_total', 'The total number of processed requests')
graphs['h'] = Histogram('python_request_api_home_page_duration_seconds', 'Histogram for the duration in seconds.', buckets=(1, 2, 5, 6, 10, _INF))

@app.route("/")
def hello():
    start = time.time()
    graphs['c'].inc()
    
    time.sleep(0.200)
    end = time.time()
    graphs['h'].observe(end - start)
    return "Hello World!1"

@app.route("/metrics")
def requests_count():
    res = []
    for key, value in graphs.items():
        res.append(prometheus_client.generate_latest(value))
    return Response(res, mimetype="text/plain")

if __name__ == '__main__':
    app.run(debug=True)
