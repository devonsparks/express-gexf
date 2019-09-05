<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
							   xmlns:exp="http://stepmod.sourceforge.net/express_model_spec/"
							   xmlns="http://www.gexf.net/1.2draft" >
<xsl:output method="xml" indent="yes"/>

<xsl:template match="text()"/>


<xsl:template match="/exp:express/exp:schema">
<gexf xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.gexf.net/1.2draft http://www.gexf.net/1.2draft/gexf.xsd"  
	  version="1.2">
	   <graph defaultedgetype="directed">
			<nodes>
				<xsl:apply-templates select="exp:entity/@name | exp:type/@name"/>
			</nodes>
			<edges>
				<xsl:apply-templates select="exp:entity/@supertypes"/>             <!-- entity hierarchy -->
				<xsl:apply-templates select="exp:type/exp:select/@selectitems"/>   <!-- type hierarchy   -->
		        <xsl:apply-templates select="exp:entity/exp:explicit"/>                    <!-- associations     -->
			</edges>
	   </graph> 
</gexf>
</xsl:template>

<!-- *** nodes *** -->
<xsl:template match="exp:entity/@name|exp:type/@name">
	<xsl:element name="node">
		<xsl:attribute name="id"><xsl:value-of select="."/></xsl:attribute>
		<xsl:attribute name="label"><xsl:value-of select="."/></xsl:attribute>
		<xsl:attribute name="kind"><xsl:value-of select="name(..)"/></xsl:attribute>
	</xsl:element>
	<xsl:apply-templates/>
</xsl:template>


<!-- *** edges *** -->
<xsl:template match="@supertypes">
	<xsl:element name="edge">
		<xsl:attribute name="source"><xsl:value-of select="../@name"/></xsl:attribute>
		<xsl:attribute name="target"><xsl:value-of select="."/></xsl:attribute>
		<xsl:attribute name="label">entity_inherits</xsl:attribute>
		<xsl:attribute name="kind">entity_inherits</xsl:attribute>
	</xsl:element>
</xsl:template>

<xsl:template match="@selectitems">
	<xsl:variable name="target" select="../../@name"/>
	<xsl:for-each select='tokenize(., "\s+")'>
		<xsl:element name="edge">
			<xsl:attribute name="source"><xsl:value-of select="."/></xsl:attribute>
			<xsl:attribute name="target"><xsl:value-of select="$target"/></xsl:attribute>
			<xsl:attribute name="label">type_inherits</xsl:attribute>
			<xsl:attribute name="kind">type_inherits</xsl:attribute>
		</xsl:element>
	</xsl:for-each>

</xsl:template>

<xsl:template match="exp:explicit">
	<xsl:element name="edge">
		<xsl:attribute name="source"><xsl:value-of select="../@name"/></xsl:attribute>
		<xsl:attribute name="target"><xsl:value-of select="./exp:typename/@name"/></xsl:attribute>
		<xsl:attribute name="label">has</xsl:attribute>
		<xsl:attribute name="kind">has</xsl:attribute>
	</xsl:element>
</xsl:template>



</xsl:stylesheet>
