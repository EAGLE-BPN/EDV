<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all" version="2.0">
    <xsl:template match="/">

        <xsl:variable name="inscription">
            <xsl:for-each select="//tei:item">
                <xsl:if test="document(concat('Workspace/', ./@xml:id, '.xml'))">
                    <xsl:sequence select="document(concat('Workspace/', ./@xml:id, '.xml'))"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <TEI xmlns="http://www.tei-c.org/ns/1.0" xml:lang="en">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Concordance of the Inscriptions of Greek Cyrenaica</title>
                    </titleStmt>
                    <publicationStmt>
                        <authority>IGCyr Project</authority>
                    </publicationStmt>
                    <sourceDesc>
                        <p>InsLib Partnership</p>
                    </sourceDesc>
                </fileDesc>
                <revisionDesc>
                    <change who="pietroliuzzo">
                        <xsl:attribute name="when">
                            <xsl:value-of select="current-date()"/>
                        </xsl:attribute>
                        <xsl:text>Generated with XSLT.</xsl:text>
                    </change>
                </revisionDesc>
            </teiHeader>
            <text>
                <body>
                    <div xml:id="SEG">
                        <head>SEG</head>
                        <list>
                            <xsl:for-each
                                select="$inscription//tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][contains(.,'SEG')]">
                                <xsl:sort order="ascending" select="normalize-space(.)"/>

                                <item>
                                    <xsl:value-of select="."/>
                                    <!--<xsl:if test="ancestor::tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][not(contains(.,'SEG'))]">
                                        <xsl:for-each select="ancestor::tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][not(contains(.,'SEG'))]"> 
                                            <xsl:text> = </xsl:text>
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                    </xsl:if>
                                    --><xsl:text> = </xsl:text>
                                    <ref type="inscription">
                                        <xsl:value-of
                                            select="./ancestor::tei:TEI//tei:idno[@type='filename']"
                                        />
                                    </ref>
                                </item>
                            </xsl:for-each>
                        </list>
                    </div>
                    <div xml:id="SECir">
                        <head>SECir</head>
                        <list>
                            <xsl:for-each
                                select="$inscription//tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][contains(.,'SECir')]">
                                <xsl:sort order="ascending" select="normalize-space(.)"/>
                                
                                <item>
                                    <xsl:value-of select="."/>
                                  <!--  <xsl:if test="ancestor::tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][not(contains(.,'SECir'))]">
                                        <xsl:for-each select="ancestor::tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][not(contains(.,'SEcir'))]"> 
                                            <xsl:text> = </xsl:text>
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                    </xsl:if>
                                    --><xsl:text> = </xsl:text>
                                    <ref type="inscription">
                                        <xsl:value-of
                                            select="./ancestor::tei:TEI//tei:idno[@type='filename']"
                                        />
                                    </ref>
                                </item>
                            </xsl:for-each>
                        </list>
                    </div>
                    <div xml:id="BE">
                        <head>BE</head>
                        <list>
                            <xsl:for-each
                                select="$inscription//tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][contains(.,'BE')]">
                                <xsl:sort order="ascending" select="normalize-space(.)"/>
                                
                                <item>
                                    <xsl:value-of select="."/>
                                  <!--  <xsl:if test="ancestor::tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][not(contains(.,'BE'))]">
                                        <xsl:for-each select="ancestor::tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][not(contains(.,'BE'))]"> 
                                            <xsl:text> = </xsl:text>
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                    </xsl:if>
                                -->    <xsl:text> = </xsl:text>
                                    <ref type="inscription">
                                        <xsl:value-of
                                            select="./ancestor::tei:TEI//tei:idno[@type='filename']"
                                        />
                                    </ref>
                                </item>
                            </xsl:for-each>
                        </list>
                    </div>
                    <div xml:id="SGDI">
                        <head>SGDI</head>
                        <list>
                            <xsl:for-each
                                select="$inscription//tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][contains(.,'SGDI')]">
                                <xsl:sort order="ascending" select="normalize-space(.)"/>
                                
                                <item>
                                    <xsl:value-of select="."/>
                                   <!-- <xsl:if test="ancestor::tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][not(contains(.,'SGDI'))]">
                                        <xsl:for-each select="ancestor::tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][not(contains(.,'SGDI'))]"> 
                                            <xsl:text> = </xsl:text>
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                    </xsl:if>
                                 -->   <xsl:text> = </xsl:text>
                                    <ref type="inscription">
                                        <xsl:value-of
                                            select="./ancestor::tei:TEI//tei:idno[@type='filename']"
                                        />
                                    </ref>
                                </item>
                            </xsl:for-each>
                        </list>
                    </div>
                    <div xml:id="OGIS">
                        <head>OGIS</head>
                        <list>
                            <xsl:for-each
                                select="$inscription//tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][contains(.,'OGIS')]">
                                <xsl:sort order="ascending" select="normalize-space(.)"/>
                                
                                <item>
                                    <xsl:value-of select="."/>
                                   <!-- <xsl:if test="ancestor::tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][not(contains(.,'OGIS'))]">
                                        <xsl:for-each select="ancestor::tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][not(contains(.,'OGIS'))]"> 
                                            <xsl:text> = </xsl:text>
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                    </xsl:if>
                               -->     <xsl:text> = </xsl:text>
                                    <ref type="inscription">
                                        <xsl:value-of
                                            select="./ancestor::tei:TEI//tei:idno[@type='filename']"
                                        />
                                    </ref>
                                </item>
                            </xsl:for-each>
                        </list>
                    </div>
                    <div xml:id="CIG">
                        <head>CIG</head>
                        <list>
                            <xsl:for-each
                                select="$inscription//tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][contains(.,'CIG')]">
                                <xsl:sort order="ascending" select="normalize-space(.)"/>
                                
                                <item>
                                    <xsl:value-of select="."/>
                                  <!--  <xsl:if test="ancestor::tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][not(contains(.,'CIG'))]">
                                        <xsl:for-each select="ancestor::tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][not(contains(.,'CIG'))]"> 
                                            <xsl:text> = </xsl:text>
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                    </xsl:if>
                                 -->   <xsl:text> = </xsl:text>
                                    <ref type="inscription">
                                        <xsl:value-of
                                            select="./ancestor::tei:TEI//tei:idno[@type='filename']"
                                        />
                                    </ref>
                                </item>
                            </xsl:for-each>
                        </list>
                    </div>
                    <div xml:id="Sammelbuch">
                        <head>Sammelbuch</head>
                        <list>
                            <xsl:for-each
                                select="$inscription//tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][contains(.,'Sammelbuch')]">
                                <xsl:sort order="ascending" select="normalize-space(.)"/>
                                
                                <item>
                                    <xsl:value-of select="."/>
                                 <!--   <xsl:if test="ancestor::tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][not(contains(.,'Sammelbuch'))]">
                                        <xsl:for-each select="ancestor::tei:div[@type='bibliography']//tei:bibl[not(tei:ptr)][not(contains(.,'Sammelbuch'))]"> 
                                            <xsl:text> = </xsl:text>
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                    </xsl:if>
                                 -->   <xsl:text> = </xsl:text>
                                    <ref type="inscription">
                                        <xsl:value-of
                                            select="./ancestor::tei:TEI//tei:idno[@type='filename']"
                                        />
                                    </ref>
                                </item>
                            </xsl:for-each>
                        </list>
                    </div>
                </body>
            </text>
        </TEI>
    </xsl:template>
</xsl:stylesheet>
