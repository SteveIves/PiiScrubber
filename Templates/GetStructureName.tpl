<CODEGEN_FILENAME>GetStructureName.dbl</CODEGEN_FILENAME>
;;
;; *** WARNING ***
;; THIS FILE WAS GENERATED. DO NOT EDIT THIS FILE!
;;

import CodeGen.RepositoryAPI

function GetStructureName, string
    required in aRecord, a
    required in aStructures, @RpsStructureCollection
    record
        str, @RpsStructure
        strName, string
        ix, int
    endrecord
    external function
        xsubr, ^val
    endexternal
proc
    strName = ""
    for ix from 0 thru aStructures.Count - 1
    begin
        str = aStructures[ix]
        if %xsubr("Is"+str.Name,aRecord)
        begin
            strName = str.Name
            exitloop
        end
    end
    freturn strName
endfunction

;;Structures that have tags

<STRUCTURE_LOOP>
<IF STRUCTURE_TAGS>
.include "<STRUCTURE_NOALIAS>" repository, structure="str<StructureName>", end
</IF STRUCTURE_TAGS>
</STRUCTURE_LOOP>

;;Functions to test records against tagged structures

<STRUCTURE_LOOP>
<IF STRUCTURE_TAGS>
function Is<STRUCTURE_NOALIAS>, ^val
    required in aRecord, str<StructureName>
proc
    freturn <TAG_LOOP><TAGLOOP_CONNECTOR_C>aRecord.<tagloop_field_name><TAGLOOP_OPERATOR_DBL><TAGLOOP_TAG_VALUE></TAG_LOOP>
endfunction

</IF STRUCTURE_TAGS>
</STRUCTURE_LOOP>