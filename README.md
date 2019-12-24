# XML & XSLT lab

XML is the second markup language that we will be exploring this term. 

Unlike HTML which allowed us to mark up and display information, XML is used for descriptive standards. We’ll use XSLT transformation to create HTML pages of our content, but XML is only used to markup or encode information. For information professionals that work in places like libraries, XML is commonly associated with metadata--the descriptive information needed to describe information. That is, XML is used to encode metadata. 

Most library catalogues are built on some kind of XML.

Another example of digital work built on XML falls under the umbrella of the [Text Encoding Initiative](https://tei-c.org/), a group that’s been around since the 1970s and the early days of digital humanities. TEI includes a standardized set of tags that are used for marking or encoding various parts of a text.

Sample projects that use TEI:
- [Digital Archives and Pacific Culture](http://pacific.pitt.edu/InjuredIsland.html)
- [The Digital Temple](https://digitaltemple.rotunda.upress.virginia.edu/)
- [The Diary of Mary Martin](https://dh.tcd.ie/martindiary/)
- [Toyota City Imaging Project](http://www.bodley.ox.ac.uk/toyota/)
- [African American Women Writers](http://digital.nypl.org/schomburg/writers_aa19/)
- [The Walt Whitman Archive](https://whitmanarchive.org/)

## Lab Objectives

By the end of this project you will be able to:
-	Use Geany to write XML and XSLT
-	Use XML to markup or encode a set of data
-	Use XSLT to transform the XML into HTML

XML is designed to store and transport data, it does not DO anything - XML is simply information that is wrapped in a set of tags. These tags can be user defined or from a standardized schema (like TEI). So, users of XML are free to develop their own set of tags or content standards in XML to describe whatever kind of information they would like.

<blockquote>XML specification from W3C: http://www.w3.org/TR/REC-xml/</blockquote>

# XML Versus HTML

According to W3C.....

<i>
XML and HTML were designed with different goals:
<ul>
	<li>XML was designed to carry data - with a focus on what data is</li>
	<li>HTML was designed to display data - with focus on how data looks</li>
	<li>XML tags are not predefined like HTML tags are</li>
	</ul>
</i>

Explanation from: http://www.w3schools.com/xml/xml_whatis.asp

## XML Example 1

<table>
  <tr>
    <td>Course Title</td>
    <td>Course Schedule</td>
    <td>On-Campus Meeting Location</td>
    <td>Instructor</td>
    <td>Office Location</td>
    <td>Email</td>
    <td>Office Hours</td>
    <td>Course Mentor</td>
  </tr>
  <tr>
    <td>CSC 105: The Digital Age</td>
    <td>M/W/F, 2:30-3:50pm</td>
    <td>HSSC S3321</td>
    <td>Dr. Katherine (Katie) Walden</td>
    <td>Digital Liberal Arts Laboratory (Dlab)</td>
    <td>waldenka@grinnell.edu</td>
    <td>Thursdays, 2-4pm</td>
    <td>Anushka Kulshreshtha</td>
  </tr>
</table>
  
```XML
<course>
	<department>Computer Science</department>
	<courseNumber>105</courseNumber>
	<courseName>The Digital Age</courseName>
	<day>M, W, F</day>
	<startTime>2:30</startTime>
	<endTime>3:50</endTime>
	<room>S3321</room>
	<building>HSSC</building>
	<instructor>Katherine Walden</instructor>
	<officeRoom>Digital Liberal Arts Laboratory</officeRoom>
	<officeBuilding>Forum</officeBuilding>
	<email>waldenka@grinnell.edu</email>
	<officeHours>2-4pm, Thursdays</officeHours>
	<mentor>Anushka Kulshreshtha</mentor>
</course>
```
  
We can create an XML document describing the information in this table.
  
Notice here that each piece of information is enclosed in a set of tags just like HTML. 

Each tag has an opening and closing tag. These are called elements. 

However, unlike HTML, we can define whatever elements that we’d like to use to describe the data. 

Open `syllabus.xml` 

You’ll see that the file renders in your browser exactly as shown above. This is because XML is only used to describe the data, it doesn’t provide instructions to the browser like HTML does.
  
```XML
<course>
	<department>Computer Science</department>
	<courseNumber>105</courseNumber>
	<courseName>The Digital Age</courseName>
	<day>M, W, F</day>
	<startTime>2:30</startTime>
	<endTime>3:50</endTime>
	<room>S3321</room>
	<building>HSSC</building>
	<instructor type="lecturer">Katherine Walden</instructor>
	<officeRoom>Digital Liberal Arts Laboratory</officeRoom>
	<officeBuilding>Forum</officeBuilding>
	<email>waldenka@grinnell.edu</email>
	<officeHours>2-4pm, Thursdays</officeHours>
	<mentor>Anushka Kulshreshtha</mentor>
</course>
```

In addition to declaring elements, each element can be further defined with attributes. 

In the first example, I used the element <instructor> to describe my role in the course. 
  
In this second example, I’ve added the type “lecturer" to further describe the instructor tag.

Like the elements, we can define any attributes. 

An attribute is declared within the opening tag for the element and is followed by the attribute (in this example, `type`) and the value enclosed in quotation marks (in this example, `“assistant_professor”`). 

Attributes are often referred to using the @ symbol before the name of the attribute. 

So in referring to the instructor attribute “type” we would write @type. 

We could imagine other values for @type, including `“assistant_professor"`, `"associate_professor”`, `“full_professor”`, or `“adjunct”` to describe some of the different ranks held by Grinnell faculty.

So, why would we want to markup all of this information in XML? 

Well, imagine that we have a list of all of the different courses taught at Grinnell. 

If we had all of this information marked up in XML, we could run queries against the data. 

For example, we could search for all of the courses taught by Jerod Weinman, or all of the courses taught by assistant professors, or find all of the courses taught on Mondays, etc. 

This is the power of encoding data in XML.

# XML Structure

XML is not as strict as HTML in terms of what is required to be well formed and valid. 

XML requires a single declaration of the document type at the beginning of the file `<?xml version=”1.0” encoding=”UTF-8”?>`. 

Like the declaration in HTML, this declaration identifies the document as an XML document to both humans and computers.

```XML
<?xml version="1.0" encoding="UTF-8"?>
<course>
	<department>Computer Science</department>
	<courseNumber>105</courseNumber>
	<courseName>The Digital Age</courseName>
	<day>M, W, F</day>
	<startTime>2:30</startTime>
	<endTime>3:50</endTime>
	<room>S3321</room>
	<building>HSSC</building>
	<instructor type="lecturer">Katherine Walden</instructor>
	<officeRoom>Digital Liberal Arts Laboratory</officeRoom>
	<officeBuilding>Forum</officeBuilding>
	<email>waldenka@grinnell.edu</email>
	<officeHours>2-4pm, Thursdays</officeHours>
	<mentor>Anushka Kulshreshtha</mentor>
</course>
```

In this statement we have declared the XML version and the encoding standard used. 

We’ll add a few additional statements similar to what we saw in HTML in a few minutes, but this is the only required declaration for XML.

To be well-formed, an XML document must also have a root element. 

In HTML this was the `<html>` element. The document opened with an `<html>` and closed at the end of the file with a
`</html>`, with all of the other elements falling in-between. 

Because XML allows us to create whatever element’s we’d like, the name of the root element is not specified. In our example above, the root element is `<course>`. The file opens with `<course>` and closes with `</course>` and all of the other elements are nested in-between.

```XML
<?xml version="1.0" encoding="UTF-8"?>
<root>
  <child>
    <subchild>xome text</subchild>
  </child>
  <child>
    <subchild>some more text</subchild>
  </child>
</root>
```

The root element is the `parent` element to all of the other elements within an XML document. 

The elements are arranged hierarchically: `parent` elements have `child` elements, `child` elements have `sibling` or `subchild`’ elements. 

The indentation is used to indicate the hierarchical structure of an XML document.

A well-formed and valid XML file must conform to the following rules:
- Have an open XML declaration <?xml version="1.0" encoding="UTF-8"?>
- Have a root element
- Each XML element must have and opening and closing tag
- XML tags are case sensitive
- XML elements must be properly nested
- XML attribute values must be quoted


# XML Example 2

```XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE books [
<!ELEMENT books (book+)>
<!ELEMENT book (title,author+,year)>
<!ELEMENT title (#PCDATA)>
<!ATTLIST title type CDATA "lang">
<!ELEMENT author (firstName,lastName)>
<!ELEMENT firstName (#PCDATA)>
<!ELEMENT lastName (#PCDATA)>
<!ELEMENT heading (#PCDATA)>
<!ELEMENT body (#PCDATA)>
<!ELEMENT year (#PCDATA)>
<!ELEMENT signature (#PCDATA)>
<!ATTLIST book category CDATA #REQUIRED>
<!ATTLIST title lang CDATA #REQUIRED>
]>

<books>
  <book category="HTML">
    <title lang="en">HTML and XHTML: The Definitive Guide</title>
    <author>
      <firstName>Bill</firstName>
      <lastName>Kennedy</lastName>
    </author>
    <author>
      <firstName>Chuck</firstName>
      <lastName>Musciano</lastName>
    </author>
    <year>2006</year>
  </book>
  <book category="CSS">
    <title lang="en">CSS: The Definitive Guide</title>
    <author>
      <firstName>Eric</firstName>
      <lastName>Meyer</lastName>
    </author>
    <year>2007</year>
  </book>
  <book category="XML">
    <title lang="en">Learning XML</title>
    <author>
      <firstName>Erik</firstName>
      <lastName>Ray</lastName>
    </author>
    <year>2003</year>
  </book>
</books>
```
Let’s look at a more extensive example to illustrate the basic XML syntax. 

Here I’ve created a file describing books related to XML, HTML, and CSS.

<blockquote>Q1: Describe the structure of this XML document in your own words.</blockquote>

The root element of this document is <books>, followed by a series of <book> child elements that contain information about each of the individual books described in the document. 
  
Each `<book>` has an attribute `@category` that describes the subject of the book, a `<title>` (with an attribute `@language`), `<author>` (with child elements `<firstName>` and `<lastName>`), and a publication `<year>`.

<p align="center"><a href="https://github.com/kwaldenphd/XML/blob/master/images/Image_7.jpg?raw=true"><img class="aligncenter" src="https://github.com/kwaldenphd/XML/blob/master/images/Image_7.jpg?raw=true" /></a></p>

We can represent the structure generically in a graph, demonstrating the hierarchical structure of the XML document.

# DTD: Document Data Types

The last aspect of XML that we want to discuss is the DTD or Document Type Definition. 

```HTML
<!DOCTYPE html PBULIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd?>
```
We looked at the DTD for HTML last week. 

The DTD provides the data structure or the rules the document. We can think about the DTD as the blueprint for a specific document type.

We were declaring our document as an HTML document and provided the DTD for the version of HTML that we were using, in this case XHTML. 

When validating a document with an associated DTD, the validator will reach out to the URL that contains a document containing all of the rules for XHTML. 

If the elements in the document match these rules, then the document is valid. This is an example of an external DTD. 

```XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE course [
<!ELEMENT course (department,courseNumber,courseName,day,startTime,endTime,room,building,instructor, officeNumber,officeBuilding,email,officeHours,courseMentor)>
<!ELEMENT department (#PCDATA)>
<!ELEMENT courseNumber (#PCDATA)>
<!ELEMENT courseName (#PCDATA)>
<!ELEMENT day (#PCDATA)>
<!ELEMENT startTime (#PCDATA)>
<!ELEMENT endTime (#PCDATA)>
<!ELEMENT room (#PCDATA)>
<!ELEMENT building (#PCDATA)>
<!ELEMENT instructor (#PCDATA)>
<!ELEMENT officeNumber (#PCDATA)>
<!ELEMENT officeBuilding (#PCDATA)>
<!ELEMENT email (#PCDATA)>
<!ELEMENT officeHours (#PCDATA)>
<!ELEMENT courseMentor (#PCDATA)>
]>
```

We can also create a new DTD within an XML file. 

We can add a few lines to the beginning of the note XML document. 

First we declare the Document Type course. This is the root element for this file. 

What follows are the definitions for each of the elements that a course document can contain. 

The root element <syllabus> is also defined as an element followed by all of the child elements in parenthesis. 

We could also save these few lines to a separate file and then reference the DTD as we did with the HTML document. 

For now, we’ll stick with the inline example. These few lines define the elements that can be used. 

To be valid, we cannot deviate from this structure. This is the blueprint for the syllabus XML document.

```XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE course [
<!ELEMENT course (department,courseNumber,courseName,day,startTime,endTime,room,building,instructor, officeNumber,officeBuilding,email,officeHours,courseMentor)>
<!ELEMENT department (#PCDATA)>
<!ELEMENT courseNumber (#PCDATA)>
<!ELEMENT courseName (#PCDATA)>
<!ELEMENT day (#PCDATA)>
<!ELEMENT startTime (#PCDATA)>
<!ELEMENT endTime (#PCDATA)>
<!ELEMENT room (#PCDATA)>
<!ELEMENT building (#PCDATA)>
<!ELEMENT instructor (#PCDATA)>
<!ELEMENT officeNumber (#PCDATA)>
<!ELEMENT officeBuilding (#PCDATA)>
<!ELEMENT email (#PCDATA)>
<!ELEMENT officeHours (#PCDATA)>
<!ELEMENT courseMentor (#PCDATA)>
]>

<course>
	<department>Computer Science</department>
	<courseNumber>105</courseNumber>
	<courseName>The Digital Age</courseName>
	<day>M, W, F</day>
	<startTime>2:30</startTime>
	<endTime>3:50</endTime>
	<room>S3321</room>
	<building>HSSC</building>
	<instructor type="lecturer">Katherine Walden</instructor>
	<officeRoom>Digital Liberal Arts Laboratory</officeRoom>
	<officeBuilding>Forum</officeBuilding>
	<email>waldenka@grinnell.edu</email>
	<officeHours>2-4pm, Thursdays</officeHours>
	<mentor>Anushka Kulshreshtha</mentor>
</course>
```
Copy and paste the  text and run a validation check with the XML Validator https://www.xmlvalidation.com.

<blockquote>Q3: Now add another set of elements to this document that have not been declared in the DTD or changing the name of one of the elements (change instructor to professor) and re-validate the document. What happens? Why?</blockquote>

DTDs ensure that we conform to the standards of the schema that we have selected. 

You can take a look at a sample metadata schema's DTD (Dublin Core) at http://dublincore.org/documents/2002/07/31/dcmes-xml/dcmes-xml-dtd.shtml. All of the metadata standards have a DTD that ensure that your XML documents conform to the standard. 

```XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE course [
<!ELEMENT course (department,courseNumber,courseName,day,startTime,endTime,room,building,instructor, officeNumber,officeBuilding,email,officeHours,courseMentor)>
<!ELEMENT department (#PCDATA)>
<!ELEMENT courseNumber (#PCDATA)>
<!ELEMENT courseName (#PCDATA)>
<!ELEMENT day (#PCDATA)>
<!ELEMENT startTime (#PCDATA)>
<!ELEMENT endTime (#PCDATA)>
<!ELEMENT room (#PCDATA)>
<!ELEMENT building (#PCDATA)>
<!ELEMENT instructor (#PCDATA)>
<!ATTLIST instructor type (assistant_professor|associate_professor|full_professor|lecturer)
<!ELEMENT officeNumber (#PCDATA)>
<!ELEMENT officeBuilding (#PCDATA)>
<!ELEMENT email (#PCDATA)>
<!ELEMENT officeHours (#PCDATA)>
<!ELEMENT courseMentor (#PCDATA)>
]>
```

We can add attributes to the DTD as well. 

Here we've added @type back into the XML document. 

You’ll see the ATTLIST declaration for the attribute type associated with the element instructor. 

Type is followed by four choices for @type: assistant_professor, associate_professor, full_professor, adjunct. 

With this declaration, one of these types must follow the element instructor for the XML document to be valid.

# Querying, Transforming, and Display XML Data Via XSLT

XML is a powerful tool for marking up or encoding documents. Unlike HTML, XML does not display these documents on the web. As we saw with syllabus.xml, if you attempt to open a XML document in your web browser, you will see the plain text version of the document. To present XML data on the web we must transform the XML into HTML we can do this with XSLT. XSLT is the Extensible Stylesheet Language. Like CSS it is a style sheet that allows us to format the presentation of XML data on the web. However, XSLT is a bit more powerful. It is more like a query of the XML document. Like CSS, a single XSLT file can be used to transform multiple XML files as long as the XML is using the same schema. With XSLT we can create queries to pick and choose the elements and data that we would like to represent in our transformation.

<blockquote>Read more on XSLT at http://www.w3schools.com/xsl/xsl_intro.asp</blockquote>

```XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE books [
<!ELEMENT books (book+)>
<!ELEMENT book (title,author+,year)>
<!ELEMENT title (#PCDATA)>
<!ATTLIST title type CDATA "lang">
<!ELEMENT author (firstName,lastName)>
<!ELEMENT firstName (#PCDATA)>
<!ELEMENT lastName (#PCDATA)>
<!ELEMENT heading (#PCDATA)>
<!ELEMENT body (#PCDATA)>
<!ELEMENT year (#PCDATA)>
<!ELEMENT signature (#PCDATA)>
<!ATTLIST book category CDATA #REQUIRED>
<!ATTLIST title lang CDATA #REQUIRED>
]>

<books>
  <book category="HTML">
    <title lang="en">HTML and XHTML: The Definitive Guide</title>
    <author>
      <firstName>Bill</firstName>
      <lastName>Kennedy</lastName>
    </author>
    <author>
      <firstName>Chuck</firstName>
      <lastName>Musciano</lastName>
    </author>
    <year>2006</year>
  </book>
  <book category="CSS">
    <title lang="en">CSS: The Definitive Guide</title>
    <author>
      <firstName>Eric</firstName>
      <lastName>Meyer</lastName>
    </author>
    <year>2007</year>
  </book>
  <book category="XML">
    <title lang="en">Learning XML</title>
    <author>
      <firstName>Erik</firstName>
      <lastName>Ray</lastName>
    </author>
    <year>2003</year>
  </book>
</books>
```

Let’s take another look at books.xml. 

We've added a DTD at the beginning of the file so that our XML is well formed and valid.

<blockquote>Q4: In the example above, some of the element declarations are followed by a +. Using your knowledge of XML and DTD, can you hypothesize what these + might be indicating in the DTD?</blockquote>

```XML 
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
exclude-result-prefixes="xs" version="2.0">
<xsl:output method="html"/>
  <xsl:template match="books">
    <html>
      <head>
        <title>Recommended Books</title>
        <link rel="stylesheet" type="text/css" href="exampleStyle.css"/>
      </head>
      <body>
        <h1>Recommended Books</h1>
        <xsl:for-each select="book">
          <p>
            <xsl:for-each select="author">
              <xsl:value-of select="firstName"/>&#160;<xsl:value-of                                                                    select="lastName"/>,
            </xsl:for-each>
            <i><xsl:value-of select="title"/></i>
          </p>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
```
Now, let’s take a look at the XSL file created for the transformation.

An XSLT file uses the file extension .XSL. Notice that it begins with the same xml declaration
<?xml version="1.0" encoding="UTF-8"?>. 

The next line identifies the file as an XLS Stylesheet and declares the XSL namespace: 

```XML
<xsl:stylesheet
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:xs="http://www.w3.org/2001/XMLSchema" 
                exclude-result-prefixes="xs"
                version="2.0">
```

The line <xsl:output method="html"/> defines the output type. 

We can output to XML, HTML, or text. 

In this case, we are outputting to HTML. 

Notice here that the closing tag /> has become part of the opening tag. 

That is, rather than <xsl:output method="html"></xsl:output> we can close the tag within the same set of brackets because there is no data between the opening and closing tags.

Next we see <xsl:template match="books">. 

This selects the top level of the hierarchy within the XML document that we would like to work with, or the root element. 

By selecting the root, we are working with the entire XML document. 

You can choose to start with any element that you would like in you XML hierarchy with the template match declaration, but you can only call the child elements of the selected element. 

In many cases, it makes the most sense to start with the root element.

What follows should look familiar. 

We have the basic HTML elements that we reviewed in the last project <head>, <title>, <link> to CSS, <body>, and a <h1>. 
  
You can include any HTML elements and additional text that you would like in your transformation. 

If we want to create a list of the titles and authors from the books.xml, we start with a <xsl:for-each select="book"> 

This sets us up to pull data from each of the book elements within the XML document. 

This for-each expression is a loop. We will learn more about loops in the Python lab.

The XSL document will gather the requested data until it runs out of <book> elements to select from. 
  
Between the <xsl:for-each select="book"> and closing </xsl:for-each> you see the bits of code that select the data that we want, the authors first and last names (enclosed in another set of for-each elements because we have more than one author in some instances) and the book title. 

The entire expression is enclosed in <p> tags. 
  
If you look at the html transformation you will see that this places each author name and title combination in a <p>.

<blockquote>Note the &#160 in the XSL file. This is the HTML code for a non-breaking space. It’s also represented as &nbsp; in the HTML transformation. You will see in many languages some characters are reserved and mean something different in the context of the code, so if we want to use the characters without the computer parsing the character, we have to use other means of referencing the characters that we want the computer to type. Ampersands are also reserved. To use an & in HTML or XML you must type &amp; or &#38;. See more at https://www.w3schools.com/html/html_entities.asp.</blockquote>

```HTML
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Recommended Books</title>
    <link rel="stylesheet" type="text/css" href="exampleStyle.css">
  </head>
  <body>
    <h1>Recommended Books</h1>
    <p>Bill&nbsp;Kennedy, Chuck&nbsp;Musciano,
      <i>HTML and XHTML: The Definitive Guide</i></p>
    <p>Eric&nbsp;Meyer,
      <i>CSS: The Definitive Guide</i></p>
    <p>Erik&nbsp;Ray,
      <i>Learning XML</i></p>
  </body>
</html>
```

This is the HTML that was produced from the XSL file above. 

Geany doesn’t have an XSLT transformation tool built in as of this moment (Geany’s code is open source so anyone can develop a transformation tool for Geany), but you can use an online tool like this one to transform the documents online http://www.freeformatter.com/xsl-transformer.html.

<blockquote>Q5: Copy and paste the XML and XSL files above into the validator and compare the resulting HTML to my results. Look closely at the XML document, XSL document, and HTML transformation, and explain how these three documents work together in your own words.</blockquote>

<p align="center"><a href="https://github.com/kwaldenphd/XML/blob/master/images/Image_15.png?raw=true"><img class="aligncenter" src="https://github.com/kwaldenphd/XML/blob/master/images/Image_15.png?raw=true" /></a></p>

If we paste the transformation into a new HTML document in Geany and open that file in a browser, we can see the HTML document generated from the XML file.

# On Your Own

For this lab, apply what you have learned about markup languages to build your own XML files and XSLT transformation. 

As part of your HTML project, you selected three items to describe. 

Now, mark up the data from those items in XML using your own schema. 

Once you have completed your markup, create and XSL document to transform your XML into HTML. 

Again, I don’t expect you to include every element in your transformation - you may decide to pull just one or two pieces of information into your transformation as I did in the books example.

You may use Geany to write your XML as well as the XSL document, but you will need to use the online transformation tool to generate the HTML file http://www.freeformatter.com/xsl- transformer.html. 

Feel free to use any of the examples from this project as a starting point for your files. books.xml, books.xsl, and books.html are also available.

# Lab Questions

All of the required questions are listed here. Be sure to answer each question completely, including an explanation of how you arrived at your answer.

Q1: Describe the structure of this XML document in your own words.

Q2: Now add another set of elements to this document that have not been declared in the DTD or changing the name of one of the elements (change instructor to professor) and re-validate the document. What happens? Why?

Q3: In the example above, some of the element declarations are followed by a +. Using your knowledge of XML and DTD, can you hypothesize what these + might be indicating in the DTD?

Q4: Copy and paste the XML and XSL files above into the validator and compare the resulting HTML to my results. Look closely at the XML document, XSL document, and HTML transformation, and explain how these three documents work together in your own words.

Q5: Copy and paste the text from your XML, XSL, and HTML documents into your notebook. In your own words, explain your process. If your transformation doesn’t work, explain what you were attempting to do and speculate as to where things went wrong.


