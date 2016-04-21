<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <!-- imports the original docbook stylesheet -->
   <xsl:import href="urn:docbkx:stylesheet"/>

   <!-- set bellow all your custom xsl configuration -->
   <xsl:import href="urn:docbkx:stylesheet/highlight.xsl"/>
   <xsl:param name="highlight.source" select="1"/>


   <!--
     Important links:
     - http://www.sagehill.net/docbookxsl/
     - http://docbkx-tools.sourceforge.net/
   -->
<!--###################################################
                      Extensions
    ################################################### -->  

    <!-- These extensions are required for table printing and other stuff -->
    <xsl:param name="use.extensions">1</xsl:param>
    <xsl:param name="tablecolumns.extension">0</xsl:param>
</xsl:stylesheet>