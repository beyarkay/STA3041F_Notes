#!/bin/sh
python3 -m venv .venv
source .venv/bin/activate
pip3 install -r requirements.txt
echo "Setup Complete. Use 'deactivate' to exit the python virtual environment, and 'source .venv/bin/activate' to enter it again.\nAll scripts should be placed in ./scripts/, and all images should be saved to ./images"
