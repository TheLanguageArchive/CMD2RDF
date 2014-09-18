package nl.knaw.dans.cmd2rdf.config;

/**
 * @author Eko Indarto
 *
 */

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlValue;

@XmlAccessorType(XmlAccessType.FIELD)
public class Property {
	@XmlAttribute
	public String name;
	
	@XmlValue
	public String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
