# symplectic-rt2
Collection of code snippets that may be useful for others connecting EPrints and Symplectic Elements via RT2.

As EPrints can be configured in many strange/curious/interesting ways, I'm not recommending any of these - but
I hope that they may be a good starting point for others.

## CSV Export (for migration tool)
The script [cgi/symplectic_RT2_CSV](cgi/symplectic_RT2_CSV) can be added to an EPrints repository to allows easy 
download of the data needed for the RT1 to RT2 migration tool.


## Record creation date
The folder [creation_date](creation_date/) has a virtual EPrints field that will search the history dataset for
the first entry relating to the EPrint - which should be the creation date of that specific record.

This can be referenced in the harvest crosswalk as:
```xml
<xwalk:field-mapping to="record-created-at-source-date">
  <xwalk:field-source from="creation_date" />
</xwalk:field-mapping>
```

## Symplectic actors (depositor/impersonator)

For the EPrint field definition shown below, the field-mapping:
[symplectic_actors/deposit_field-mapping_sympelctic_actors.xml](symplectic_actors/deposit_field-mapping_sympelctic_actors.xml)
will add the appropriate details.


```perl
{
        name => 'symplectic_actors',
        type => 'compound',
        fields => [
                {
                        sub_name => 'role',
                        type => 'text',
                },
                {
                        sub_name => 'name',
                        type => 'name',
                        hide_honourific => 1,
                        hide_lineage => 1,
                        family_first => 1,
                },
                {
                        sub_name => 'email',
                        type => 'text',
                        allow_null => 1,
                },
        ],
        multiple => 1,
        export_as_xml => 0,
},
```

## REF_CC - mapping exceptions and details
This is based on the default REF_CC EPrints module. There are a few parts to it:

1) add the [ref_cc/deposit_field-map.xml](ref_cc/deposit_field-map.xml) to the `<xwalk:field-maps>` element.
1) add the [ref_cc/deposit_value-map.xml](ref_cc/deposit_value-map.xml) to the `<xwalk:value-maps>` element.
1) include the field-map in other field-maps - focusing on those used for REF-able items (if your crosswalks use different maps for different items):
```xml
<xwalk:field-map name="most-types">
  <xwalk:include-field-map name="standard-fields" />
  <xwalk:include-field-map name="ref-cc-fields" />
</xwalk:field-map>

```
4) Test test test ;)
