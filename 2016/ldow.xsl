<!--
    Author: Sarven Capadisli <info@csarven.ca>
    Author URI: http://csarven.ca/#i

    Description: LDOW to CEUR TOC
-->
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    >
    <xsl:output include-content-type="no" method="xhtml" omit-xml-declaration="yes" encoding="utf-8" indent="yes"/>
    <xsl:template match="/">
<toc>


    <xsl:apply-templates select="//h3"/>
</toc>

    </xsl:template>

    <xsl:template match="//h3">
    <session>
        <title><xsl:value-of select="." /></title>
        <xsl:apply-templates select="following-sibling::ul[1]/li[@typeof='swrc:InProceedings']"/>
    </session>
    </xsl:template>

    <xsl:template match="li[@typeof='swrc:InProceedings']">
        <paper>
            <title><xsl:value-of select="a[@property='dc:title']"/></title>
            <authors>
                <xsl:apply-templates select="span[@rel='dc:creator']"/>
            </authors>
        </paper>
    </xsl:template>

    <xsl:template match="span[@rel='dc:creator']">
                <author><xsl:value-of select="a[@property='foaf:name']"/></author>
    </xsl:template>
</xsl:stylesheet>
