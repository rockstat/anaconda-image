# Specify syntax higlighting theme in IPython;
# will be picked up by prettyprinter.
from pygments import styles

# For light terminal backgrounds.
from prettyprinter.color import GitHubLightStyle
ipy = get_ipython()
ipy.colors = 'LightBG'
ipy.highlighting_style = GitHubLightStyle

# For dark terminal background.
ipy = get_ipython()
ipy.colors = 'linux'
ipy.highlighting_style = styles.get_style_by_name('monokai')

import prettyprinter
prettyprinter.set_default_config(indent=2, width=120, sort_dict_keys=True)
prettyprinter.install_extras(
    # Comment out any packages you are not using.
    include=[
        'ipython',
        'ipython_repr_pretty',
        'attrs',
        'requests',
        'dataclasses',
    ],
    warn_on_error=True
)
