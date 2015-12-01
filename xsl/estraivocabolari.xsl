<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:gcse="nothing"
    exclude-result-prefixes="xs tei" version="2.0">
    
    
    <!-- TO BE USED ON driver.xml creates directly an HTML index of terms with links to inscriptions which have that value-->
    
    
    <xsl:variable name="inscription">
        <xsl:for-each select="//tei:item/@xml:id">
            <xsl:sequence select="document(concat('../xml/',.,'.xml'))"/>
<!--            in this step with keep in mind the path to each inscription file so that calling the variable the xslt is going to look at each of the files-->
        </xsl:for-each>
    </xsl:variable>
    
    <xsl:output method="html"/>
    
    <xsl:template match="/">
        

        
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>Iscrizioni Digitali</title>
                <link rel="stylesheet" href="graficagenerale.css" type="text/css"/>
                
                
            </head>
            <body>
                <div id="header">
                    <h1>Iscrizioni per tipologia e materiale</h1>
                </div>

                <div id="nav">
                    <a href="index.html">Home</a>
                    <br/>
                    <a href="browseinscriptions.html">Indice delle iscrizioni</a>
                    <br/>
                    <a href="Bibliografia.html">Bibliografia</a>
                    <br/>
                    <a href="inscriptionsbyplace.html">Indice dei luoghi di provenienza</a>
                    <br/>
                    
            <br />
                </div>

                <div id="section">
                    <p>Le definizioni si riferiscono ai Vocabolari Controllati del progetto <a target="_blank" href="http://www.eagle-network.eu">EAGLE</a>.</p>


                    <div id="material" class="material list">
                        <h1>Materiale</h1>
                        <table>
                            <xsl:for-each-group select="$inscription//tei:material" group-by="@ref">
                               
                                <xsl:sort order="ascending" select="lower-case(.)"/>
                                <tr>
                                    <td><a target="_blank">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="@ref"/>
                                    </xsl:attribute>
                                        <xsl:value-of select="."/>
                                </a></td>
<td>                                    <xsl:text> (total: </xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>)</xsl:text>
                                    </td>
                                        
                                        <td>
                                            <xsl:for-each select="current-group()"><a target="_blank" href="{concat('iscrizioni/',../../../../../../../tei:publicationStmt/tei:idno[@type='filename'],'.html')}"><xsl:value-of select="../../../../../../../tei:titleStmt/tei:title"/><xsl:text> (</xsl:text><xsl:value-of select="../../../../../../../tei:publicationStmt/tei:idno[@type='filename']"/><xsl:text>)</xsl:text></a><br/></xsl:for-each>
                                        </td>

                               </tr>
                            </xsl:for-each-group>
                        </table>
                    </div>
                    
                    
                    <div id="instyp" class="instyp list">
                        <h1>Tipo di iscrizione</h1>
                        <table>
                            <xsl:for-each-group select="$inscription//tei:TEI//tei:term" group-by="text()"><!--group-by="@ref"-->
                                
                                <xsl:sort order="ascending" select="lower-case(.)"/>
                                <tr>
                                    <td>                                    <a target="_blank">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="text()"/><!--@ref-->
                                        </xsl:attribute>
                                        <xsl:value-of select="."/>
                                    </a>
</td>                                  <td>  <xsl:text> (total: </xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>)</xsl:text></td>
                                    <td>
                                        <xsl:for-each select="current-group()"><a target="_blank" href="{concat('iscrizioni/',../../../../tei:fileDesc/tei:publicationStmt/tei:idno[@type='filename'],'.html')}"><xsl:value-of select="../../../../tei:fileDesc/tei:titleStmt/tei:title"/><xsl:text> (</xsl:text><xsl:value-of select="../../../../tei:fileDesc/tei:publicationStmt/tei:idno[@type='filename']"/><xsl:text>)</xsl:text></a><br/></xsl:for-each>
                                    </td>
                                    
                                </tr>
                            </xsl:for-each-group>
                        </table>
                    </div>
                    
                    <div id="objtyp" class="objtyp list">
                        <h1>Supporto</h1>
                        <table>
                            <xsl:for-each-group select="$inscription//tei:TEI//tei:objectType" group-by="text()"><!--@ref-->
                                
                                <xsl:sort order="ascending" select="lower-case(.)"/>
                                <tr>
                                    <td>                                    <a target="_blank">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="text()"/><!--@ref-->
                                        </xsl:attribute>
                                        <xsl:value-of select="."/>
                                    </a></td>
<td>                                    <xsl:text> (total: </xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>)</xsl:text>
</td>                                 
                                    
                                    
                                    
                                    <td>
                                        <xsl:for-each select="current-group()"><a target="_blank" href="{concat('iscrizioni/',../../../../../../../../tei:publicationStmt/tei:idno[@type='filename'],'.html')}"><xsl:value-of select="../../../../../../../../tei:titleStmt/tei:title"/><xsl:text> (</xsl:text><xsl:value-of select="../../../../../../../../tei:publicationStmt/tei:idno[@type='filename']"/><xsl:text>)</xsl:text></a><br/></xsl:for-each>
                                    </td>                                    
                                </tr>
                            </xsl:for-each-group>
                        </table>
                    </div>
                    </div>
                <div id="footer">EAGLE - EDV</div>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
