<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: txt-teig.xsl 2090 2013-10-24 15:23:22Z gabrielbodard $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tei-c.org/ns/1.0"
                version="2.0">
  
  <!-- Import templates can be found in teig.xsl -->
  <xsl:import href="teig.xsl"/>

  <xsl:template match="t:g">
    <xsl:param name="parm-edn-structure" tunnel="yes" required="no"></xsl:param>
    <xsl:param name="parm-edition-type" tunnel="yes" required="no"></xsl:param>
    <xsl:param name="parm-leiden-style" tunnel="yes" required="no"></xsl:param>
    <xsl:param name="parm-line-inc" tunnel="yes" required="no"></xsl:param>
    <xsl:param name="parm-verse-lines" tunnel="yes" required="no"></xsl:param>
      <xsl:call-template name="lb-dash"/>
      <xsl:call-template name="w-space"/>

      <xsl:choose>
        
        <xsl:when test="starts-with($parm-leiden-style, 'edh')"/>
          <xsl:when test="($parm-leiden-style = 'ddbdp' or $parm-leiden-style = 'sammelbuch')">
            <xsl:call-template name="g-ddbdp"/>
         </xsl:when>
        <xsl:when test="$parm-leiden-style = 'eagletxt'">
          <xsl:call-template name="g-eagletxt"/>
        </xsl:when>
          <xsl:when test="$parm-leiden-style = 'dohnicht'">
            <xsl:text>⊂</xsl:text>
            <xsl:apply-imports/>
            <xsl:text>⊃</xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>((</xsl:text>
            <xsl:apply-imports/>
            <xsl:text>))</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
    
      <!-- Found in teig.xsl -->
    <xsl:call-template name="w-space"/>
  </xsl:template>

</xsl:stylesheet>
