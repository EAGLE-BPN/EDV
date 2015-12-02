<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: htm-tpl-struct-inslib.xsl 1434 2011-05-31 18:23:56Z gabrielbodard $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:gcse="notthere"
   xmlns:t="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="t" version="2.0">
   <!-- 
 WORK IN PROGRESS file structure for EAGLE / Epidoc Workshop 
meant to be run in a folder with other data locally referred
  -->

   <!-- Called from htm-tpl-structure.xsl -->
   
   

   <xsl:template name="EDV-structure">
      <xsl:variable name="title">
         <xsl:choose>
            <xsl:when test="//t:titleStmt/t:title/text()">
               <xsl:value-of select="//t:titleStmt/t:title"/>
            </xsl:when>
            <xsl:when test="//t:sourceDesc//t:bibl/text()">
               <xsl:value-of select="//t:sourceDesc//t:bibl"/>
            </xsl:when>
            <xsl:when test="//t:idno[@type='filename']/text()">
               <xsl:value-of select="//t:idno[@type='filename']"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:text>Italian Medieval Epigraphy in the Vernacular. (IX-XVth c.)</xsl:text>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>

      <html>
         <head>
            
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>
               <xsl:value-of select="$title"/>
            </title>
            <!-- Found in htm-tpl-cssandscripts.xsl -->
            <link rel="stylesheet" href="../graficagenerale.css" type="text/css"/>
         </head>

         <body>
            <div id="header"><h1>
               <xsl:value-of select="$title"/>
            </h1></div>

            <div id="nav">
               <a href="../index.html">Home Page</a><br/>
               <br/>
               <a href="../browseinscriptions.html">Lista dei testi</a><br/>
               <br/>
               <a href="../inscriptionsbyplace.html">Indice dei luoghi</a><br/>
               <br/>
               <a href="../browsebytypes.html">Indici</a><br/>
               
            </div>
            

<div id="section">
<div class="ids">
<b>Sorgente dei dati: </b><xsl:value-of select="//t:authority"/>
<br/>
<b>Autore: </b> <xsl:value-of select="//t:change[position()=last()]/@who"/>
<!--prende l'ultimo autore-->
</div>
            <div class="sourceDesc">
               <h3>Descrizione</h3>

               <xsl:apply-templates select="//t:support"/>
               
               <xsl:if test="//t:keywords/t:term/text()"><br/>               
               <b>Funzione: </b>
               <xsl:choose>
                  <xsl:when test="//t:keywords/t:term/text()">
                     <a target="_blank">
                        <xsl:attribute name="href">
                           <xsl:value-of select="concat(//t:keywords/t:term/@ref,'.html')"/>
                        </xsl:attribute>
                        <xsl:value-of select="//t:keywords/t:term/text()"/></a>
                  </xsl:when>
                  <xsl:otherwise>Sconosciuta</xsl:otherwise>
               </xsl:choose></xsl:if>
               <xsl:if test="//t:layoutDesc/t:layout//t:rs[@type='execution']/text()"><br/>
<b>Tecnica esecutiva: </b>
               <xsl:choose>
                  <xsl:when test="//t:layoutDesc/t:layout">
                     <a target="_blank">
<xsl:attribute name="href">
   <xsl:value-of select="//t:layoutDesc/t:layout//t:rs[@type='execution']/@ref"/>
</xsl:attribute>
                        <xsl:value-of select="//t:layoutDesc/t:layout//t:rs[@type='execution']"/></a>
                  </xsl:when>
                  <xsl:otherwise>Sconosciuta</xsl:otherwise>
               </xsl:choose></xsl:if>
               <xsl:if test="//t:layoutDesc/t:layout//t:rs[@type='metre']/text()"><br/>
                  <b>Metro: </b>
                  <xsl:choose>
                     <xsl:when test="//t:layoutDesc/t:layout">
                        <a target="_blank">
                           <xsl:attribute name="href">
                              <xsl:value-of select="//t:layoutDesc/t:layout//t:rs[@type='metre']/@ref"/>
                           </xsl:attribute>
                           <xsl:value-of select="//t:layoutDesc/t:layout//t:rs[@type='metre']"/></a>
                     </xsl:when>
                     <xsl:otherwise>Sconosciuto</xsl:otherwise>
                  </xsl:choose></xsl:if>
               
<br/>
               <b>Scrittura: </b>
               <xsl:if test="//t:handDesc/t:handNote/text()">
                  <xsl:value-of select="//t:handDesc/t:handNote"/>
               </xsl:if>
               <br/>
<xsl:call-template name="language"/>
               <br/>
               <xsl:call-template name="alfabeto"/>
               <br/>
<!--               <b>Provenienza: </b>
               <xsl:choose>
                  <xsl:when
                     test="//t:origPlace">
                     <a target="_blank">
<xsl:attribute name="href">
   <xsl:value-of select="//t:origPlace//t:placeName[not(@type)]/@ref"/>
</xsl:attribute>
                        <xsl:value-of select="//t:origPlace//t:placeName[not(@type)]"/></a>
                     <xsl:if test="//t:origPlace//t:placeName[@type='provinceItalicRegion']"><xsl:text>, </xsl:text>
                        <a target="_blank">
                        <xsl:attribute name="href">
                           <xsl:value-of select="//t:origPlace//t:placeName[@type='provinceItalicRegion']/@ref"/>
                        </xsl:attribute>
                        <xsl:value-of select="//t:origPlace//t:placeName[@type='provinceItalicRegion']"/></a>
                     </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>Sconosciuta</xsl:otherwise>
               </xsl:choose>
               <br/>
-->               <b>Localizzazione: </b>
               <xsl:choose>
                  <xsl:when
                     test="//t:provenance[@type='found']">
                     <xsl:if test="//t:provenance[@type='found']//t:placeName[not(@type)]">
                        <xsl:apply-templates select="//t:provenance[@type='found']" mode="edv"/></xsl:if>
                     <xsl:if test="//t:provenance[@type='found']//t:placeName[@type='modern_region']"><xsl:text>, </xsl:text>
                        <xsl:value-of select="//t:provenance[@type='found']//t:placeName[@type='modern_region']"/></xsl:if><xsl:if test="//t:provenance[@type='found']//t:placeName[@type='modernCountry']"><xsl:text>, </xsl:text>
                     <xsl:value-of select="//t:provenance[@type='found']//t:placeName[@type='modernCountry']"/></xsl:if>
                  </xsl:when>
                  <xsl:otherwise>Sconosciuta</xsl:otherwise>
               </xsl:choose>
               <xsl:if test="//t:origin/t:origDate/text()"><br/>
                  <b>Data: </b>
                  <xsl:choose>
                     <xsl:when test="//t:origin/t:origDate/text()">
                        <xsl:value-of select="//t:origin/t:origDate"/>
                        <xsl:if test="//t:origin/t:origDate[@type='evidence']">
                           <xsl:text>(</xsl:text>
                           <xsl:for-each select="tokenize(//t:origin/t:origDate[@evidence],' ')">
                              <xsl:value-of select="translate(.,'-',' ')"/>
                              <xsl:if test="position()!=last()">
                                 <xsl:text>, </xsl:text>
                              </xsl:if>
                           </xsl:for-each>
                           <xsl:text>)</xsl:text>
                        </xsl:if>
                     </xsl:when>
                     <xsl:otherwise>Non disponibile</xsl:otherwise>
                  </xsl:choose>
               </xsl:if>
               <br/>
               
            <br/>
               <h3>Bibliografia: </h3>
     <ul>
<xsl:for-each select="//t:bibl">
        <li><xsl:value-of select="."/></li>
</xsl:for-each>
        </ul>
<br/>
               
            </div>            
<div id="edition">
              <!-- <p>
                  <b>Edition:</b>
               </p>-->
               <!-- Edited text output -->
               <xsl:variable name="edtxt">
                  <xsl:apply-templates select="//t:div[@type='edition']"/>
               </xsl:variable>
               <!-- Moded templates found in htm-tpl-sqbrackets.xsl -->
               <xsl:apply-templates select="$edtxt" mode="sqbrackets"/>
            </div>
   <div id="apparatus">
      <!-- Apparatus text output -->
      <xsl:variable name="apptxt">
         <xsl:apply-templates select="//t:div[@type='apparatus']"/>

      </xsl:variable>
      <!-- Moded templates found in htm-tpl-sqbrackets.xsl -->
      <xsl:apply-templates select="$apptxt" mode="sqbrackets"/>
   </div>
            
<div id="sorgente">
<br/>
<p><b>File sorgente prodotto da: </b>
   <xsl:apply-templates select="//t:creation"/></p>
   <p><a target="_blank" href="{concat('https://github.com/EAGLE-BPN/EDV/tree/master/xml',//t:idno[@type='localID'],'.xml')}">See this file in GIT.</a></p> 

   <br/>
</div> 
   
   <xsl:if test="//t:div[@type='translation']//t:p">
      <br/>
      <div class="row" id="translation">
         <h3 class="slimmer">Parafrasi:</h3>
         <!-- Translation text output -->
         <xsl:variable name="transtxt">
            <xsl:apply-templates select="//t:div[@type='translation']//t:p"/>
         </xsl:variable>
         <!-- Moded templates found in htm-tpl-sqbrackets.xsl -->
         <xsl:apply-templates select="$transtxt" mode="sqbrackets"/>
      </div></xsl:if>
   
   <xsl:if test="//t:div[@type='commentary']//t:p">
      <br/>
      <div class="row" id="commentary">
         <!-- Commentary text output -->
         <xsl:variable name="commtxt">
            <xsl:apply-templates select="//t:div[@type='commentary']"/>
         </xsl:variable>
         <!-- Moded templates found in htm-tpl-sqbrackets.xsl -->
         <xsl:apply-templates select="$commtxt" mode="sqbrackets"/>
      </div></xsl:if>

<div id="images">
   <xsl:if test="//t:graphic[not(@rend='externalLink')]"> 
<h3>Foto</h3>
   <xsl:for-each select="//t:graphic[not(@rend='externalLink')]">
      <a target="_blank" href="{./@sameAs}">
         <xsl:attribute name="author">
            <xsl:text>By </xsl:text><xsl:value-of select="//t:change/@who"/><xsl:text> [</xsl:text><xsl:value-of select="//t:licence"/><xsl:text>], via Wikimedia Commons</xsl:text>
         </xsl:attribute>
         <img style="width:280px">
<xsl:attribute name="src">
<xsl:value-of select="./@url"/>
</xsl:attribute>
      <xsl:attribute name="alt">
         <xsl:value-of select="normalize-space(t:desc)"/>
      </xsl:attribute>
   </img></a> 
   </xsl:for-each></xsl:if>
   <xsl:if test="//t:graphic[@rend='externalLink']"><br/>
<h3>Ulteriori foto</h3>
   <xsl:for-each select="//t:graphic[@rend='externalLink']">
      <a target="_blank" href="{//t:graphic/@url}"><xsl:value-of select="//t:graphic/@url"/></a>
</xsl:for-each></xsl:if>
</div>
</div>

            <div id="footer"><xsl:value-of select="//t:authority"/> - <a target="_blank" href="{//t:licence/@target}"><xsl:value-of select="//t:licence"/></a> - <xsl:value-of select="//t:change[position()=last()]"/></div>
         </body>
      </html>
   </xsl:template>

   <xsl:template match="t:dimensions" mode="edv">
<br/><b>Dimensioni (in cm): </b>
      <xsl:if test="text()">
         <xsl:if test="t:width/text()">Larghezza - 
            <xsl:value-of select="t:width"/>
            <xsl:if test="t:height/text()">
               <xsl:text>; </xsl:text>
            </xsl:if>
         </xsl:if>
         <xsl:if test="t:height/text()">Altezza -
            <xsl:value-of select="t:height"/>
         </xsl:if>
         <xsl:if test="t:depth/text()">; Profondità -
            <xsl:value-of select="t:depth"/>
         </xsl:if>
         <xsl:if test="t:dim[@type='diameter']/text()">; diametro:
            <xsl:value-of select="t:dim[@type='diameter']"/>
         </xsl:if>
      </xsl:if>
   </xsl:template>
   
<xsl:template match="t:rs[@type='statPreserv']" mode="edv">
<br/>
<b>Stato di conservazione del testo: </b> <xsl:value-of select="."/>
</xsl:template>

   <xsl:template match="t:objectType" mode="edv">
<xsl:if test="//t:objectType/text()"><br/><b>Supporto: </b>
      <xsl:choose>
         <xsl:when test="//t:objectType/text()">
            <a target="_blank">
               <xsl:attribute name="href">
                  <xsl:value-of select="concat(//t:objectType/@ref,'.html')"/>
               </xsl:attribute>
               <xsl:value-of select="//t:objectType/text()"/></a>
         </xsl:when>
         <xsl:otherwise>Sconosciuto</xsl:otherwise>
      </xsl:choose></xsl:if>
</xsl:template>

   <xsl:template match="t:material" mode="edv">
<xsl:if test="//t:material/text()">               <br/>
      <b>Materiale: </b>
      <xsl:choose>
         <xsl:when test="//t:material/text()">
            <a target="_blank">
               <xsl:attribute name="href">
                  <xsl:value-of select="concat(//t:material/@ref,'.html')"/>
               </xsl:attribute>
               <xsl:value-of select="//t:material/text()"/></a>
         </xsl:when>
         <xsl:otherwise>Sconosciuto</xsl:otherwise>
      </xsl:choose></xsl:if>
   </xsl:template>

   <xsl:template match="t:placeName" mode="edv">
      <xsl:choose>
         <xsl:when test="contains(@ref,'pleiades.stoa.org') or contains(@ref,'geonames.org')">
            <a>
               <xsl:attribute name="href">
                  <xsl:value-of select="@ref"/>
               </xsl:attribute>
               <xsl:apply-templates/>
            </a>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template match="t:ref" priority="1" mode="edv">
      <xsl:choose><xsl:when test="@type"><a href="{./@target}">[<xsl:value-of select="substring-after(./@target, 'ab')"/>]</a></xsl:when><xsl:otherwise><a href="{concat(./@target,'.html')}">iscrizione n° <xsl:value-of select="substring-after(./@target, 'EDV')"/></a></xsl:otherwise></xsl:choose>
   </xsl:template>

   <xsl:template match="//t:rdg" priority="1">
      <xsl:value-of select="."/><xsl:text> </xsl:text><xsl:for-each select="tokenize(./@resp, '#')"><xsl:value-of select="upper-case(.)"/></xsl:for-each><xsl:if test="not(position()=last())"><xsl:text>; </xsl:text>
      </xsl:if>
   </xsl:template>
   
   
<xsl:template match="t:foreign">
   <i><xsl:value-of select="."/></i>
</xsl:template>

   <xsl:template name="language">
      <b>Lingua: </b><xsl:for-each select="//t:language[@rend='used']"><xsl:value-of select="."/><xsl:text> </xsl:text></xsl:for-each>
   </xsl:template>
   <xsl:template name="alfabeto">
      <b>Alfabeto: </b><xsl:for-each select="//t:language[@rend='alphabet']"><xsl:value-of select="."/><xsl:text> </xsl:text></xsl:for-each>
   </xsl:template>
   
</xsl:stylesheet>
