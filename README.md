# kind-jugend-fam_angebote

## Deutsch
### Datenbeschreibung
* Hier werden die im Geoinformationssystem der Stadt Uster verzeichneten Daten zu Angeboten für Kinder, Jugendliche und Familien als Open Data zur Verfügung gestellt.
* Die Daten sind zudem im Webgis der Stadt Uster unter LINK zu finden.

### Dateien
* Die Tabelle mit allen Einträgen ist unter folgendem Namen abgelegt: [angebote_kjf_uster.csv](https://github.com/GesellschaftStadtUster/kind-jugend-fam_angebote/blob/main/angebote_kjf_uster.csv)

### Datenstruktur

**daten_kulturfoerderung_uster.csv:**

| **Field Name**        | **Description**                                | **Format**     |
|---------------------|--------------------------------------------|------------|
| **x**              | Longitude / Längengrad (0 falls nicht Punktgeometrie) | Number |
| **y**              | Latitude / Breitengrad (0 falls nicht Punktgeometrie) | Number |
| **name**              | Bezeichnung des Angebots | String |
| **strasse**              | Strassenname (falls vorhanden) | String |
| **hausnr** | Hausnummer (falls vorhanden) | String |
| **plz**     | Postleitzahl (falls vorhanden) | String |
| **ort**       | Ort (falls vorhanden) | String |
| **anlage**       | Zugehörigkeit zu einer Anlage mit mehreren Angeboten (falls vorhanden) | String |
| **kategorie**       | Kategorie des Angebots (falls vorhanden,  siehe Ausführungen unten) | String |
| **zugaenglichkeit**       | Zugänglichkeit (falls vorhanden, siehe Ausführungen unten) | String |
| **beschreibung**       | Beschreibung (falls vorhanden)  | String |
| **webseite**       | Webseite (falls vorhanden)  | String |

*Kategorien:*
* *Sportanlage: Bäder*
* *Sportanlage: Badmintonanlagen*
* *Sportanlage: Dreifachturnhallen*
* *Sportanlage: Einfachturnhallen*
* *Sportanlage: Fussballplätze*
* *Sportanlage: Hartplätze (Asphalt)*
* *Sportanlage: Laufstrecken*
* *Sportanlage: Leichtathletikanlagen*
* *Sportanlage: Spielwiesen*
* *Sportanlage: Squashanlagen*
* *Sportanlage: Tennisanlagen*
* *Sportanlage: Trendsportanlagen*
* *Kinderbetreuung: FEB-Kita*
* *Kinderbetreuung: nicht-FEB-Kita*
* *Kinderbetreuung: Schulhort*
* *Kinderbetreuung: Spielgruppe*
* *Freizeitanlage: Spielplatz*
* *Freizeitanlage: Gemeinschaftszentrum*
* *Freizeitanlage: Bibliothek/Ludothek*
* *Schule: Kindergarten*
* *Schule: Primarschule*
* *Schule: Sekundarschule*
* *Schule: Berufsschule*
* *Schule: Kantonsschule*
* *Schule: Erwachsenenbildung*
* *Anlaufstelle: Kindheit, Jugend und Familie*
* *Anlaufstelle: Sozialberatung*
* *Anlaufstelle: Asyl- und Flüchtlingskoordination*

*Optionen Zugänglichkeit:*
* *öffentlicher Raum (resp. vergleichbare Zugänglichkeit)*
* *halb-öffentlicher Raum (eingeschränkte resp. reglementierte Zugänglichkeit)*
* *nicht-öffentlicher Raum*
* *Räumlichkeiten*


## Englisch

### Data description
* The data recorded in the geographic information system of the city of Uster with services for children, young people and families are made available here as open data.
* The data can also be found on the webgis of the city of Uster under LINK.

### Files
* The table with all entries is stored under the following name: [angebote_kjf_uster.csv](https://github.com/GesellschaftStadtUster/kind-jugend-fam_angebote
/blob/main/angebote_kjf_uster.csv)
