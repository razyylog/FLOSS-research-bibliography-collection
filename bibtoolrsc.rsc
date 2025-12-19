suppress.initial.newline = 1

tex.define {\O=O}
tex.define {\i=i}
tex.define {-=}



preserve.key.case = 1
fmt.name.name = ""
fmt.name.pre = ""
fmt.inter.name = ""
fmt.et.al = {_et_al}
fmt.word.separator = "-"
key.format = {
    {%2p(keyauthor)# %2p(author)# %2p(editor)# NoName}
    { %4d(year)# }}
default.key = {NoKey}
key.base = {lower}
key.number.separator = ""

sort = on
sort.format = {
    {%-N(author)# %-N(editor)# zzNoName}
    {%d(year)#9999}
    {%-0T(title)#zzNoTitle}
}

check.double = on

# Sanitize double {{ }}
rewrite.rule = {"^{{\(.*\)}}$" = "{\1}"}

# Replace " ... " with { ... }
rewrite.rule = {"^\"\(.*\)\"$" = "{\1}"}

# Get rid of useless fields
# delete.field = {abstract}
delete.field = {affiliation}
delete.field = {correspondence_address1}
delete.field = {references}
delete.field = {keywords}
delete.field = {author_keywords}
delete.field = {source}
rewrite.rule = {note#"^{ *cited by.*}"}
rewrite.rule = {language# "English"}

# Convert URL DOI to DOI
#rewrite.rule = {url# "https?://.*doi"} # Should have DOI field instead
#rewrite.rule = {url# "https?://.*doi\.org/\(10\.[0-9]+/[^\"}]+\)" # "{\1}"}
rename.field {url=doiurl if url="doi"}
rename.field {doiurl=delete if doi="10."}
delete.field = {delete}
rename.field {doiurl=doi}
rewrite.rule = {doi# "https?://.*doi\.org/\(10\.[0-9]+/.+\)"# "\1"}

% urldate should be the same as urlaccessdate
rename.field {urldate = urlaccessdate}

# Sanitize month
#input = {month}

# vim: set ft=conf :
