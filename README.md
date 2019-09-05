# express-gexf
express-gexf is a simple-minded utility for converting EXPRESS schemas encoded as [STEPmod-XML](http://stepmod.sourceforge.net/express_model_spec/) to [GEXF](https://gephi.org/gexf/format/) graphs. It currently performs the following mappings:

|  STEPMod-XML Object | GEXF Object                                  |
|     ---          |      ---                                        |
|     Entity Tag      |     Node                                     |
|     Type  Tag       |     Node                                     |
|     Entity Supertypes Attribute    |   'entity_inherits' Edge type |
|     Type Select Object          |    'type_inherits" Edge type     |
|     Explicit Attribute          |    'has' Edge type               |


# License
express-gexf is available under an MIT License. Pull requests welcome.
