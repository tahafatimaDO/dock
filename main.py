import os
from jinja2 import Environment, PackageLoader


if __name__ == '__main__':
    env = Environment(loader=PackageLoader('main', 'template'))
    home_template = env.get_template('index.html')
    home_html = home_template.render()

    if not os.path.exists('generated_html'):
        os.makedirs('generated_html')

    with open('generated_html/index.html', 'w') as file:
        file.write(home_html)
