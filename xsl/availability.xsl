<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    xmlns="http://www.tei-c.org/ns/1.0"
   exclude-result-prefixes="#all"
    version="2.0">
    <xsl:template match="@* | node()">
        <xsl:copy copy-namespaces="yes">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="authority">
        <authority>Inscriptions of Greek Cyrenaica Project</authority>
    </xsl:template>
    
    <xsl:template match="availability">
        <availability>
            <licence target="http://creativecommons.org/licenses/by-nc-sa/3.0/">This file is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported license.
            </licence> <p>All reuse or distribution of this work must contain somewhere a link back to the IGCyr website.</p>
        </availability>
    </xsl:template>
    
</xsl:stylesheet>