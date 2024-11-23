<#
    .LINK
        https://github.com/ai/nanoid

    .SYNOPSIS
        A tiny, secure, URL-friendly, unique string ID generator.

    .DESCRIPTION
        NanoID generates an ID string that is comparable to UUID v4 (random-based). It has a similar number of random bits in the ID (126 in NanoID and 122 in UUID).

    .OUTPUTS
        [string] A randomized ID string.

    .PARAMETER size
        Defines the returning string's size in bytes (characters).
        This parameter is optional.

    .PARAMETER alphabet
        Defines the characters that can be used in the returning string.
        This parameter is optional.

    .PARAMETER dict
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

    .PARAMETER NUMBERS
        Uses the NUMBERS character-set (`0123456789`) for the returning string.
        Will use the numbers from 0 to 9.
        This parameter is optional.

    .PARAMETER HEXADECIMAL_LOWERCASE
        Uses the HEXADECIMAL_LOWERCASE character-set (`0123456789abcdef`) for the returning string.
        Will use English hexadecimal characters, all lowercase.
        This parameter is optional.

    .PARAMETER HEXADECIMAL_UPPERCASE
        Uses the HEXADECIMAL_UPPERCASE character-set (`0123456789ABCDEF`) for the returning string.
        Will use English hexadecimal characters, all uppercase.
        This parameter is optional.

    .PARAMETER LOWERCASE
        Uses the LOWERCASE character-set (`abcdefghijklmnopqrstuvwxyz`) for the returning string.
        Will use English letters, all lowercase.
        This parameter is optional.

    .PARAMETER LOWERCASE_SAFE
        Uses the LOWERCASE_SAFE character-set (`bcdfghjklmnpqrstvwxz`) for the returning string.
        Will use English letters (without vowels, to prevent profanity), all lowercase.
        This parameter is optional.

    .PARAMETER UPPERCASE
        Uses the UPPERCASE character-set (`ABCDEFGHIJKLMNOPQRSTUVWXYZ`) for the returning string.
        Will use English letters, all uppercase.
        This parameter is optional.

    .PARAMETER UPPERCASE_SAFE
        Uses the UPPERCASE_SAFE character-set (`BCDFGHJKLMNPQRSTVWXZ`) for the returning string.
        Will use English letters (without vowels, to prevent profanity), all uppercase.
        This parameter is optional.

    .PARAMETER ALPHANUMERIC
        Uses the ALPHANUMERIC character-set (`0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`) for the returning string.
        Will use a mix of all English letters, and numbers.
        This parameter is optional.

    .PARAMETER ALPHANUMERIC_SAFE
        Uses the ALPHANUMERIC_SAFE character-set (`2456789bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ`) for the returning string.
        Will use a mix of English letters (without vowels, to prevent profanity), and numbers.
        This parameter is optional.

    .PARAMETER NO_LOOK_ALIKES
        Uses the NO_LOOK_ALIKES character-set (`346789ABCDEFGHJKLMNPQRTUVWXYabcdefghijkmnpqrtwxyz`) for the returning string.
        Will use a limited set of English letters, and numbers. Any easily-mistakable characters are removed (e.g. `0Oo`).
        This parameter is optional.

    .PARAMETER NO_LOOK_ALIKES_SAFE
        Uses the NO_LOOK_ALIKES_SAFE character-set (`6789BCDFGHJKLMNPQRTWbcdfghjkmnpqrtwz`) for the returning string.
        Will use a limited set of English letters (without vowels, to prevent profanity), and numbers. Any easily-mistakable characters are also removed (e.g. `0Oo`).
        This parameter is optional.

    .PARAMETER BASE64
        Uses the BASE64 character-set (`ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=`) for the returning string.
        Will use the standard Base-64 characters (`A-Za-z0-9+/=`).
        This parameter is optional.

    .EXAMPLE
        PS> .\nanoid
        GDNUzAm2kvi32dJurl7pT

    .EXAMPLE
        PS> .\nanoid -size 21
        xRL8PNiL9k1EfRtaT7Ffv

    .EXAMPLE
        PS> .\nanoid -size 21 -NO_LOOK_ALIKES_SAFE
        CKFKPLmMnHmJD6pLCjLgh

    .EXAMPLE
        PS> $nid = .\nanoid -size 11 -dict "A2Z_SAFE"
        22qDccZzvPT

    .EXAMPLE
        PS> .\nanoid -size 11 -alphabet "qwerty"
        rerqrqreweq
#>
param(
    [int]
    $size = 21,

    [string]
    $alphabet = "useandom-26T198340PX75pxJACKVERYMINDBUSHWOLF_GQZbfghjklqvwyzrict",

    [string]
    $dict = "default",

    [switch]    $NUMBERS,
    [switch]    $HEXADECIMAL_LOWERCASE,
    [switch]    $HEXADECIMAL_UPPERCASE,
    [switch]    $LOWERCASE,
    [switch]    $LOWERCASE_SAFE,
    [switch]    $UPPERCASE,
    [switch]    $UPPERCASE_SAFE,
    [switch]    $ALPHANUMERIC,
    [switch]    $ALPHANUMERIC_SAFE,
    [switch]    $NO_LOOK_ALIKES,
    [switch]    $NO_LOOK_ALIKES_SAFE,
    [switch]    $BASE64
)

if($NUMBERS -or $dict.ToUpper().Equals("NUMS"))
{
    $alphabet = "0123456789"
}
elseif($HEXADECIMAL_LOWERCASE -or $dict.ToUpper().Equals("HEX_LOWER"))
{
    $alphabet = "0123456789abcdef"
}
elseif($HEXADECIMAL_UPPERCASE -or $dict.ToUpper().Equals("HEX_UPPER"))
{
    $alphabet = "0123456789ABCDEF"
}
elseif($LOWERCASE -or $dict.ToUpper().Equals("LOWER"))
{
    $alphabet = "abcdefghijklmnopqrstuvwxyz"
}
elseif($LOWERCASE_SAFE -or $dict.ToUpper().Equals("LOWER_SAFE"))
{
    $alphabet = "bcdfghjklmnpqrstvwxz"
}
elseif($UPPERCASE -or $dict.ToUpper().Equals("UPPER"))
{
    $alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
}
elseif($UPPERCASE_SAFE -or $dict.ToUpper().Equals("UPPER_SAFE"))
{
    $alphabet = "BCDFGHJKLMNPQRSTVWXZ"
}
elseif($ALPHANUMERIC -or $dict.ToUpper().Equals("A2Z"))
{
    $alphabet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
}
elseif($ALPHANUMERIC_SAFE -or $dict.ToUpper().Equals("A2Z_SAFE"))
{
    $alphabet = "2456789bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ"
}
elseif($NO_LOOK_ALIKES -or $dict.ToUpper().Equals("UNIQUE"))
{
    $alphabet = "346789ABCDEFGHJKLMNPQRTUVWXYabcdefghijkmnpqrtwxyz"
}
elseif($NO_LOOK_ALIKES_SAFE -or $dict.ToUpper().Equals("UNIQUE_SAFE"))
{
    $alphabet = "6789BCDFGHJKLMNPQRTWbcdfghjkmnpqrtwz"
}
elseif($BASE64 -or $dict.ToUpper().Equals("B64"))
{
    $alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="
}

# Do the work...
$id = ""
[byte[]] $bytes = @()

# Check to see if `SecureRandom` is usable. If not, fallback to `Random`.
if(Get-Command SecureRandom -errorAction silentlyContinue)
{
    $rndm = "SecureRandom"
}
else
{
    $rndm = "Random"
}

$bsize = $size
while($bsize-- -gt 0)
{
    $bytes += & $rndm -Maximum 255 -Minimum 0
}

$mask = (1 -shl ([Math]::Log($alphabet.Length - 1) / [Math]::Log(2))) - 1
$step = -(-bnot(1.6 * $mask * $size) / $alphabet.Length)

while($id.Length -lt $size)
{
    $i = $step

    $b = & $rndm -InputObject $bytes -Count $i

    while($i-- -gt 0)
    {
        # Write-Host "$($b[$i]) & $mask = $($b[$i] -band $mask)"
        $x = $alphabet[$b[$i] -band $mask]

        if($x -ne $null)
        {
            $id += $x
        }
    }
}

# Auto-returns like CoffeeScript...
$id[-$size..-1] -join ''
