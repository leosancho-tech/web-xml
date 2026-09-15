<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="es">
      <head>
        <meta charset="UTF-8"/>
        <title>Catálogo de Películas</title>
        <style>
          body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #1a1a2e;
            color: #e0e0e0;
            margin: 0;
            padding: 30px;
          }
          h1 {
            text-align: center;
            color: #e94560;
            font-size: 2.2em;
            letter-spacing: 2px;
            margin-bottom: 30px;
          }
          table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #16213e;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.5);
          }
          thead tr {
            background-color: #e94560;
            color: #ffffff;
            text-transform: uppercase;
            font-size: 0.9em;
            letter-spacing: 1px;
          }
          th, td {
            padding: 14px 20px;
            text-align: left;
          }
          tbody tr {
            border-bottom: 1px solid #0f3460;
            transition: background-color 0.2s;
          }
          tbody tr:last-child {
            border-bottom: none;
          }
          tbody tr:hover {
            background-color: #0f3460;
          }
          .duracion {
            color: #a8dadc;
            font-weight: bold;
          }
          .anio {
            color: #f1c40f;
          }
          .id {
            color: #888;
            font-size: 0.9em;
          }
          .total {
            text-align: center;
            margin-top: 20px;
            color: #888;
            font-size: 0.95em;
          }
        </style>
      </head>
      <body>
        <h1>🎬 Catálogo de Películas</h1>
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Título</th>
              <th>Año</th>
              <th>Duración (min)</th>
              <th>ID Director</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="DATA/ROW">
              <xsl:sort select="anio" data-type="number" order="descending"/>
            </xsl:apply-templates>
          </tbody>
        </table>
        <p class="total">
          Total de películas: <xsl:value-of select="count(DATA/ROW)"/>
        </p>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="ROW">
    <tr>
      <td class="id"><xsl:value-of select="id_pelicula"/></td>
      <td><xsl:value-of select="titulo"/></td>
      <td class="anio"><xsl:value-of select="anio"/></td>
      <td class="duracion"><xsl:value-of select="duracion"/> min</td>
      <td class="id"><xsl:value-of select="id_director"/></td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
