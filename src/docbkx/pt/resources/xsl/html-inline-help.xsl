<?xml version="1.0" encoding="utf-8"?>
<!-- 
   ====================================================================
   Licensed to the Apache Software Foundation (ASF) under one
   or more contributor license agreements.  See the NOTICE file
   distributed with this work for additional information
   regarding copyright ownership.  The ASF licenses this file
   to you under the Apache License, Version 2.0 (the
   "License"); you may not use this file except in compliance
   with the License.  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing,
   software distributed under the License is distributed on an
   "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
   KIND, either express or implied.  See the License for the
   specific language governing permissions and limitations
   under the License.
   ====================================================================

   This software consists of voluntary contributions made by many
   individuals on behalf of the Apache Software Foundation.  For more
   information on the Apache Software Foundation, please see
   <http://www.apache.org />.
   ====================================================================

    Based on the XSL HTML configuration file for the Spring
    Reference Documentation.
    
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">

    <xsl:import href="urn:docbkx:stylesheet"/>

    <!--###################################################
                    HTML Settings
   ################################################### -->




    <!-- These extensions are required for table printing and other stuff -->
    <xsl:param name="use.extensions">1</xsl:param>
    <xsl:param name="tablecolumns.extension">0</xsl:param>
    <xsl:param name="callout.extensions">1</xsl:param>
    <xsl:param name="graphicsize.extension">0</xsl:param>

    <!--###################################################
                     Table Of Contents
   ################################################### -->

    <!-- Supress completely the TOC -->
    <xsl:param name="generate.toc" select="0" /> 


	
    <!--###################################################
                        Labels
   ################################################### -->

    <!-- Turn off all labels -->
    <xsl:param name="chapter.autolabel">0</xsl:param>
    <xsl:param name="section.autolabel" select="0"/>
    <xsl:param name="section.label.includes.component.label" select="0"/>
    <!--###################################################
                        Supression of various elements by CSS
   ################################################### -->
<xsl:template name="user.head.content">
	<style type="text/css">


  div.screenshot { display: none; }
  div.figure {display: none; }
  div.legalnotice {display: none; }
  div.mediaobject {display: none; } 
	</style>
  </xsl:template>



</xsl:stylesheet>
