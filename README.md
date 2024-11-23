# NanoID generator, library and CLI

```
NAME
    C:\Users\ephel\Development\Work\AutoIATE\nanoid.ps1

SYNOPSIS
    A tiny, secure, URL-friendly, unique string ID generator.


SYNTAX
    C:\Users\ephel\Development\Work\AutoIATE\nanoid.ps1 [[-size] <Int32>] [[-alphabet] <String>] [[-dict] <String>] [-NUMBERS] [-HEXADECIMAL_LOWERCASE] [-HEXADECIMAL_UPPERCASE] [-LOWERCASE] [-LOWERCASE_SAFE]
    [-UPPERCASE] [-UPPERCASE_SAFE] [-ALPHANUMERIC] [-ALPHANUMERIC_SAFE] [-NO_LOOK_ALIKES] [-NO_LOOK_ALIKES_SAFE] [-BASE64] [<CommonParameters>]


DESCRIPTION
    NanoID generates an ID string that is comparable to UUID v4 (random-based). It has a similar number of random bits in the ID (126 in NanoID and 122 in UUID).


PARAMETERS
    -size <Int32>
        Defines the returning string's size in bytes (characters).
        This parameter is optional.

        Required?                    false
        Position?                    1
        Default value                21
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -alphabet <String>
        Defines the characters that can be used in the returning string.
        This parameter is optional.

        Required?                    false
        Position?                    2
        Default value                useandom-26T198340PX75pxJACKVERYMINDBUSHWOLF_GQZbfghjklqvwyzrict
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -dict <String>
        Takes a character-set name that is easier to type and/or remember.
        Uses the corresponding character-set (if found).
        This parameter is optional.

        Can be one of:
            "NUMS"          See -NUMBERS
            "HEX_LOWER"     See -HEXADECIMAL_LOWERCASE
            "HEX_UPPER"     See -HEXADECIMAL_UPPERCASE
            "LOWER"         See -LOWERCASE
            "LOWER_SAFE"    See -LOWERCASE_SAFE
            "UPPER"         See -UPPERCASE
            "UPPER_SAFE"    See -UPPERCASE_SAFE
            "A2Z"           See -ALPHANUMERIC
            "A2Z_SAFE"      See -ALPHANUMERIC_SAFE
            "UNIQUE"        See -NO_LOOK_ALIKES
            "UNIQUE_SAFE"   See -NO_LOOK_ALIKES_SAFE
            "B64"           See -BASE64

        Required?                    false
        Position?                    3
        Default value                default
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -NUMBERS [<SwitchParameter>]
        Uses the NUMBERS character-set (`0123456789`) for the returning string.
        Will use the numbers from 0 to 9.
        This parameter is optional.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -HEXADECIMAL_LOWERCASE [<SwitchParameter>]
        Uses the HEXADECIMAL_LOWERCASE character-set (`0123456789abcdef`) for the returning string.
        Will use English hexadecimal characters, all lowercase.
        This parameter is optional.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -HEXADECIMAL_UPPERCASE [<SwitchParameter>]
        Uses the HEXADECIMAL_UPPERCASE character-set (`0123456789ABCDEF`) for the returning string.
        Will use English hexadecimal characters, all uppercase.
        This parameter is optional.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -LOWERCASE [<SwitchParameter>]
        Uses the LOWERCASE character-set (`abcdefghijklmnopqrstuvwxyz`) for the returning string.
        Will use English letters, all lowercase.
        This parameter is optional.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -LOWERCASE_SAFE [<SwitchParameter>]
        Uses the LOWERCASE_SAFE character-set (`bcdfghjklmnpqrstvwxz`) for the returning string.
        Will use English letters (without vowels, to prevent profanity), all lowercase.
        This parameter is optional.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -UPPERCASE [<SwitchParameter>]
        Uses the UPPERCASE character-set (`ABCDEFGHIJKLMNOPQRSTUVWXYZ`) for the returning string.
        Will use English letters, all uppercase.
        This parameter is optional.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -UPPERCASE_SAFE [<SwitchParameter>]
        Uses the UPPERCASE_SAFE character-set (`BCDFGHJKLMNPQRSTVWXZ`) for the returning string.
        Will use English letters (without vowels, to prevent profanity), all uppercase.
        This parameter is optional.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -ALPHANUMERIC [<SwitchParameter>]
        Uses the ALPHANUMERIC character-set (`0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`) for the returning string.
        Will use a mix of all English letters, and numbers.
        This parameter is optional.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -ALPHANUMERIC_SAFE [<SwitchParameter>]
        Uses the ALPHANUMERIC_SAFE character-set (`2456789bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ`) for the returning string.
        Will use a mix of English letters (without vowels, to prevent profanity), and numbers.
        This parameter is optional.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -NO_LOOK_ALIKES [<SwitchParameter>]
        Uses the NO_LOOK_ALIKES character-set (`346789ABCDEFGHJKLMNPQRTUVWXYabcdefghijkmnpqrtwxyz`) for the returning string.
        Will use a limited set of English letters, and numbers. Any easily-mistakable characters are removed (e.g. `0Oo`).
        This parameter is optional.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -NO_LOOK_ALIKES_SAFE [<SwitchParameter>]
        Uses the NO_LOOK_ALIKES_SAFE character-set (`6789BCDFGHJKLMNPQRTWbcdfghjkmnpqrtwz`) for the returning string.
        Will use a limited set of English letters (without vowels, to prevent profanity), and numbers. Any easily-mistakable characters are also removed (e.g. `0Oo`).
        This parameter is optional.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -BASE64 [<SwitchParameter>]
        Uses the BASE64 character-set (`ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=`) for the returning string.
        Will use the standard Base-64 characters (`A-Za-z0-9+/=`).
        This parameter is optional.

        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false

    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https:/go.microsoft.com/fwlink/?LinkID=113216).

INPUTS

OUTPUTS
    [string] A randomized ID string.


    -------------------------- EXAMPLE 1 --------------------------

    PS>.\nanoid

    GDNUzAm2kvi32dJurl7pT




    -------------------------- EXAMPLE 2 --------------------------

    PS>.\nanoid -size 21

    xRL8PNiL9k1EfRtaT7Ffv




    -------------------------- EXAMPLE 3 --------------------------

    PS>.\nanoid -size 21 -NO_LOOK_ALIKES_SAFE

    CKFKPLmMnHmJD6pLCjLgh




    -------------------------- EXAMPLE 4 --------------------------

    PS>$nid = .\nanoid -size 11 -dict "A2Z_SAFE"

    22qDccZzvPT




    -------------------------- EXAMPLE 5 --------------------------

    PS>.\nanoid -size 11 -alphabet "qwerty"

    rerqrqreweq





RELATED LINKS
    https://github.com/ai/nanoid
```
