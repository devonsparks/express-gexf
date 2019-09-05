# express-gexf
express-gexf is a simple-minded utility for converting EXPRESS schemas encoded as [STEPmod-XML](http://stepmod.sourceforge.net/express_model_spec/) to [GEXF](https://gephi.org/gexf/format/) graphs. It currently performs the following mappings:

|  STEPMod-XML Object | GEXF Object                                  |
|     ---          |      ---                                        |
|     Entity Tag      |     Node                                     |
|     Type  Tag       |     Node                                     |
|     Entity Supertypes Attribute    |   'entity_inherits' Edge type |
|     Type Select Object          |    'type_inherits" Edge type     |
|     Explicit Attribute          |    'has' Edge type               |

It was originally written as an aid to better understand entity coupling in the existing [Industry Foundation Classes](https://www.buildingsmart.org/standards/bsi-standards/industry-foundation-classes/) schema. Sample output for this this schema can be found in the (samples)[https://github.com/devonsparks/express-gexf/tree/master/samples/IFC4x2] directory.

# License
express-gexf is available under an MIT License. Pull requests welcome.
