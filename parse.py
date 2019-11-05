#!/usr/bin/python3

import yaml

file_name = "./xyz.yaml"

with open(file_name, 'r') as stream:
    try:
        s_data = yaml.safe_load(stream)
        print(s_data['Total Program Time'])
        print(s_data["pets"][1])
    except yaml.YAMLError as exec:
        print(exec)
