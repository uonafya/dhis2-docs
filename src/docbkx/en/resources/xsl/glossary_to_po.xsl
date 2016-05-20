<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:db="http://docbook.org/ns/docbook"
    exclude-result-prefixes="xs"
    version="1.0">
    <xsl:output method="text" omit-xml-declaration="yes" indent="yes"/>
    <xsl:variable name="quote">"</xsl:variable>
    <xsl:template match="/">
        <xsl:text>
<![CDATA[fmsgid ""
msgstr ""
"Project-Id-Version: PACKAGE VERSION\n"
"POT-Creation-Date: 2016-05-20 09:53+0200\n"
"PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
"Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
"Language-Team: LANGUAGE <LL@li.org>\n"
"MIME-Version: 1.0\n"
"Content-Type: text/plain; charset=UTF-8\n"
"Content-Transfer-Encoding: 8bit\n"]]>
        </xsl:text>
        <xsl:for-each select="//db:glossary/db:glossdiv/db:glossentry">
          <xsl:text>msgid </xsl:text> 
            <xsl:value-of select="$quote"/>
            <xsl:value-of select="db:glossterm"/>
            <xsl:value-of select="$quote"/>
            <xsl:text>&#xa;</xsl:text>
            <xsl:text>msgstr  </xsl:text> 
            <xsl:value-of select="$quote"/>
            <xsl:apply-templates select="db:glossdef/db:para" mode="next"/>
            <xsl:value-of select="$quote"/>
            <xsl:text>&#xa;</xsl:text>
            <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>