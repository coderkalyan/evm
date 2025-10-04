from jinja2 import Template

with open("interpreter.ll.j2", "r") as f:
    template = Template(f.read())

output = template.render()
with open("interpreter.ll", "w") as f:
    f.write(output)
