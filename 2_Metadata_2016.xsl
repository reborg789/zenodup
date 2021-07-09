<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/> 
    <xsl:template match="/">
        <root><xsl:for-each select="root/TEI">
            <metadata>
                <upload_type>publication</upload_type>
                <publication_type>conferencepaper</publication_type>
                <publication_date>2017-05-02</publication_date><!-- This is the date of the first publishing in the BoA -->
                <title><xsl:value-of select="normalize-space(.//teiHeader/fileDesc/titleStmt/title)"/></title>
                <creators><xsl:for-each select=".//teiHeader/fileDesc/titleStmt/author"> <!-- This for-each-loop makes it possible to select every author for every abstract. -->
                    <creator>
                        <name><xsl:value-of select=".//surname"/>, <xsl:value-of select=".//forename"/></name> <!-- this format of the author's name is required by Zenodo -->
                        <affiliation><xsl:value-of select=".//affiliation"/></affiliation>
                    </creator></xsl:for-each>
                </creators> 
                <description>A single abstract from the DHd-2016 Book of Abstratcs.</description> <!-- equivalent for the other years -->
                <access_right>open</access_right>
                <license>cc-by</license>
                <doi></doi>
                <keywords><xsl:for-each select=".//teiHeader/profileDesc/textClass/keywords/term">"<xsl:value-of select="normalize-space(.)"/>", </xsl:for-each></keywords><!-- for 2016-->
                <contributors>
                    <contributor>
                        <name>Burr, Elisabeth </name>
                        <affiliation>Institut für Romanistik, Universität Leipzig</affiliation>
                    </contributor> <!-- This first contributor is different in every year -->
                    <contributor>
                        <name>Helling, Patrick</name>
                        <affiliation>Digital Humanities im deutschsprachigen Raum e.V.</affiliation>
                    </contributor>
                </contributors>
                <!-- The following 5 elements are equivalent for the other years -->
                <conference_title>DHd 2016 Modellierung - Vernetzung – Visualisierung: Die Digital Humanities als fächerübergreifendes Forschungsparadigma. 3. Tagung des Verbands "Digital Humanities im deutschsprachigen Raum"</conference_title>
                <conference_acronym>DHd 2016</conference_acronym>
                <conference_dates>07.03.2016 - 12.03.2016</conference_dates>
                <conference_place>Leipzig</conference_place>
                <conference_url>http://dhd2016.de/</conference_url>
            </metadata>
        </xsl:for-each></root>
    </xsl:template>   
</xsl:stylesheet>

