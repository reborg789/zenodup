<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/> 
    <xsl:template match="/">
        <root><xsl:for-each select="root/TEI">
            <metadata>
                <upload_type>publication</upload_type>
                <publication_type>conferencepaper</publication_type>
                <publication_date>2020-02-20</publication_date><!-- adjust every year - publication-date of BoA -->
                <title><xsl:value-of select="normalize-space(.//title[@type='full'])"/><xsl:value-of select="normalize-space(.//title[not(@*)])"/></title><!-- This for-each-loop makes it possible to select every author for every abstract. -->
                <creators><xsl:for-each select=".//author">
                    <creator>
                        <name><xsl:value-of select=".//surname"/>, <xsl:value-of select=".//forename"/></name><!-- this format of the author's name is required by Zenodo -->
                        <affiliation><xsl:value-of select=".//affiliation"/></affiliation>
                    </creator></xsl:for-each>
                </creators>
                <description>A single abstract from the DHd-2020 Book of Abstracts.</description><!-- adjust every year -->
                <access_right>open</access_right>
                <license>cc-by</license>
                <doi></doi>
                <keywords><xsl:for-each select=".//term">"<xsl:value-of select="normalize-space(.)"/>", </xsl:for-each></keywords>
                <contributors>
                    <contributor>
                        <name>Burr, Elisabeth </name>
                        <affiliation>Institut für Romanistik, Universität Leipzig</affiliation> <!-- adjust every year - editor/publisher of the BoA -->
                    </contributor> 
                    <contributor>
                        <name>Helling, Patrick</name>
                        <affiliation>Digital Humanities im deutschsprachigen Raum e.V.</affiliation>
                    </contributor>
                </contributors>
                <!-- adjust the following for every year -->
                <conference_title>DHd 2020 Spielräume: Digital Humanities zwischen Modellierung und Interpretation. 7. Tagung des Verbands "Digital Humanities im deutschsprachigen Raum"</conference_title>
                <conference_acronym>DHd 2020</conference_acronym>
                <conference_dates>02.03.2020-06.03.2020</conference_dates>
                <conference_place>Paderborn</conference_place>
                <conference_url>https://dhd2020.de/</conference_url>
            </metadata>
        </xsl:for-each></root>
        
    </xsl:template>   
</xsl:stylesheet>
