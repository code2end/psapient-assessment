### Getting Started with DAAC 'diagram as a code'

- Create a new virtual environment
  `python3 -m venv .venv`

- Source the virtual env and activate it
  `source .venv/bin/activate`

- Update and download necessary dependencies :

```
python3 -m pip install --upgrade pip
python3 -m pip install graphviz
python3 -m pip install diagrams
```

- Run the `cloud_diagram.py` to generate diagram image
  `python3 cloud_diagram.py`
