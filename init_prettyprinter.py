# Specify syntax higlighting theme in IPython;
# will be picked up by prettyprinter.
# from pygments import styles

# For light terminal backgrounds.
# from prettyprinter.color import GitHubLightStyle
# ipy = get_ipython()
# ipy.colors = 'LightBG'
# ipy.highlighting_style = GitHubLightStyle

import prettyprinter
prettyprinter.set_default_config(width=120, sort_dict_keys=True)
prettyprinter.install_extras(
    include=[
        'ipython',
        'ipython_repr_pretty',
        'attrs',
        'requests',
        'dataclasses',
    ],
    warn_on_error=True
)
