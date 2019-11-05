#!/usr/bin/python3


import yaml

filename="./xyz.yaml"

with open(filename,'r') as stream:
	try:
		data=yaml.safe_load(stream)
		print(data['Total Program Time'])
		print(data["pets"][1])
	except yaml.YAMLError as exec:
		print(exec)
