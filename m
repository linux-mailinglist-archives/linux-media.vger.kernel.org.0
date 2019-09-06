Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E50BABC4F
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 17:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394798AbfIFPZN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 11:25:13 -0400
Received: from smtp3.goneo.de ([85.220.129.37]:38160 "EHLO smtp3.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726019AbfIFPZM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Sep 2019 11:25:12 -0400
X-Greylist: delayed 405 seconds by postgrey-1.27 at vger.kernel.org; Fri, 06 Sep 2019 11:25:11 EDT
Received: from localhost (localhost [127.0.0.1])
        by smtp3.goneo.de (Postfix) with ESMTP id F0DDD23FA4D;
        Fri,  6 Sep 2019 17:18:23 +0200 (CEST)
X-Virus-Scanned: by goneo
X-Spam-Flag: NO
X-Spam-Score: -2.745
X-Spam-Level: 
X-Spam-Status: No, score=-2.745 tagged_above=-999 tests=[ALL_TRUSTED=-1,
        AWL=0.155, BAYES_00=-1.9] autolearn=ham
Received: from smtp3.goneo.de ([127.0.0.1])
        by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2bE9_yAf_TMV; Fri,  6 Sep 2019 17:18:20 +0200 (CEST)
Received: from [192.168.1.127] (dyndsl-037-138-233-152.ewe-ip-backbone.de [37.138.233.152])
        by smtp3.goneo.de (Postfix) with ESMTPSA id 059E423F498;
        Fri,  6 Sep 2019 17:18:19 +0200 (CEST)
Subject: Re: [PATCH] docs: license-rules.txt: cover SPDX headers on Python
 scripts
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Jessica Yu <jeyu@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org
References: <20190905055614.7958918b@coco.lan>
 <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
 <20190905065701.4744e66a@lwn.net> <20190905162810.2388d532@coco.lan>
 <20190905134008.57cd3e89@lwn.net> <20190905170733.3a25dee8@coco.lan>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <be6f3670-c5d5-e686-8472-d9d33e6c2a6a@darmarit.de>
Date:   Fri, 6 Sep 2019 17:18:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905170733.3a25dee8@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In practice the python needs "-*- coding: utf-8 -*-  to be in one of the first
two lines.  The SPDX tag in practice has to be in one of the first 15 lines:

     ap.add_argument('-m', '--maxlines', type=int, default=15,
                     help='Maximum number of lines to scan in a file. Default 15')

IMO, all we need to patch is the documentation from:

   """The SPDX license identifier in kernel files shall be added at the first
      possible line in a file which can contain a comment. """

to something like ..

   """The SPDX license identifier in kernel files shall be added at the first 15
      lines in a file which can contain a comments. """

Often when it comes to encodings people are tend to mix up things.
Below you find some comments of mine in the hope to clarify encoding mess:

    TL;DR

Am 05.09.19 um 22:07 schrieb Mauro Carvalho Chehab:
> Em Thu, 5 Sep 2019 13:40:08 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
> 
>> On Thu, 5 Sep 2019 16:28:10 -0300
>> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
>>
>>> I don't think we can count that python 3 uses utf-8 per default.
>>>
>>> I strongly suspect that, if one uses a Python3 version < 3.7, it will
>>> still default to ASCII.
>>>
>>> On a quick look, the new UTF-8 mode was added on PEP-540:
>>>
>>> 	https://www.python.org/dev/peps/pep-0540/
>>>
>>> Such change happened at Python 3.7.
>>
>> That PEP is to override the locale and use utf8 unconditionally.  It
>> says, with regard to the pre-PEP state:
>>
>> 	UTF-8 is also the default encoding of Python scripts, XML and JSON
>> 	file formats.
>>
>> Unicode was the reason for much of the Python 3 pain; it seems unlikely
>> that many installations are defaulting to ASCII anyway...?

Don't mix unicode and utf-8.

What has changed in python 3 compared to python 2 is the internal
representation of the string type (which has nothing to with the
encoding of files!).

Python2 type str() -- results in a "byte literal"
   https://docs.python.org/2.7/library/functions.html#str

Python2 type unicode() -- results in a "unicode literal"
   https://docs.python.org/2.7/library/functions.html#unicode

Python3 type str() -- results in a unicode literal
   https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str

Python3 unicode() -- this type is not defined, was replaced by str()

Python3 byte() -- results in a  byte literal (what str() was in py2)
   https://docs.python.org/3/library/stdtypes.html#bytes

This is mostly a pain when your source works with byte-streams
and you have to switch py2 to py3.  But this has nothing to do
with the encoding of source files and how the encoding is tagged
in a file.  And what the default encoding of a source file is
when such tags are omitted.

First lets have a look at the default encoding of py source:

   Python will default to ASCII as standard encoding if no other
   encoding hints are given.

from  https://www.python.org/dev/peps/pep-0263/#defining-the-encoding

And my addition: what is correct for py2.  In py3 we have UTF-8

   PEP 3120: The default source encoding is now UTF-8.

from 
https://docs.python.org/3.0/whatsnew/3.0.html#text-vs-data-instead-of-unicode-vs-8-bit

> 
> Yeah, but I remember that UTF-8 handling changed a few times during python 3
> releases. I didn't really tracked what happened, as I don't usually program
> in Python. So, I'm actually relying on what I can find about that.
> 
> Looking at Python 3.0 release[1], it says:
> 
> 	"In many cases, but not all, the system default is UTF-8;
> 	 you should never count on this default."
> 
> [1] https://docs.python.org/3.0/whatsnew/3.0.html
> 
> So, at least on early Python 3 releases, the default may not be UTF-8.
> 
> I don't know about you, but, from time to time, people complain about
> UTF-8 chars when I'm handling patches (last time was on a patch series
> for Kernel 5.3 by a core dev in Australia, with was unable to apply a
> patch from me with had some UTF-8 chars).
> 

Don't mix the output of a text file which is read by the standard
open() function in py2/py3 and the source file encoding used by
the interpreter for reading the source file itself.  To complete
your citation:

   In many cases, but not all, the system default is UTF-8; you
   should never count on this default. Any application reading or
   writing more than pure ASCII text should probably have a way to
   override the encoding.

This means your application has to know the encoding of a stream/file.
E.g. we handle the output from of the external Perl script
scripts/kernel-docs by encoding the byte stream from proc-call's
stdout into utf-8:

    out, err = codecs.decode(out, 'utf-8'), codecs.decode(err, 'utf-8')

see patch 
https://github.com/torvalds/linux/commit/86c0f046a8b0c23fca65f77333c233a06c25ef9a

Again, this is talking about application development and has
nothing to do with the encoding of the source files.


> So, I'm pretty sure that some devs don't set the locale to UTF8 even
> those days.

The LANG environment influence only the default encoding of streams like stdout
and does not change the default encoding for source code files.

To clarify by example, create a test123.py file and save it as !! UTF-8 !!.

   import sys, locale
   print("system's default encoding: " +  sys.getdefaultencoding())
   print("sys.stdout's encoding: " + sys.stdout.encoding)
   print("locale's prefered encoding: " +  locale.getpreferredencoding())
   text = "Encoding ist Scheiße"
   try:
       print("::" + text)
   except UnicodeEncodeError as exc:
       print("appl had a UnicodeEncodeError exception: %s" % exc)

Probe encoding of the source file and run some tests:

   $ file test123.py
   test123.py: Python script, UTF-8 Unicode text executable

Lets see how it is stored::

   $ hexdump -C test123.py | grep Schei
   000000e0  6e 67 20 69 73 74 20 53  63 68 65 69 c3 9f 65 22  |ng ist Schei..e"|

The 'ß' is a two byte char 0xc39f in UTF-8 and the unicode code-point is U+00DF.

Since we encoded the file in utf-8 and python2 excepts ASCII as default
we will get a SyntaxError::

   $ python2 test123.py
   File "test123.py", line 6
   SyntaxError: Non-ASCII character '\xc3' in file test123.py on line 6,
   but no encoding declared; see http://python.org/dev/peps/pep-0263/ for
   details

The only way to fix it is to use a magic comment (# -*- coding: utf-8 -*-)
Py3 expects UTF-8 encoded source as default, see PEP-3120 vs PEP-0263.  And
we got what excepted:

   $ python3 test123.py
   system's default encoding: utf-8
   sys.stdout's encoding: UTF-8
   locale's prefered encoding: UTF-8
   ::Encoding ist Scheiße

OK, now lets see what happens when locale (LANG) is changed:

   $ LANG=POSIX python3 test123.py
   system's default encoding: utf-8
   sys.stdout's encoding: ANSI_X3.4-1968
   locale's prefered encoding: ANSI_X3.4-1968
   application print throws UnicodeEncodeError: 'ascii' codec can't encode
   character '\xdf' in position 21: ordinal not in range(128)

The interpreter has no problem to read the source file, because the py3
systems's default encoding stays in UTF-8 .. only the print application
throws a UnicodeEncodeError when it prints the internal unicode (with non
ASCII char in) to a stdout which encodes now ASCII (aka ANSI_X3.4-1968).

Next lets try ISO-8859-1

   LANG=en_US.ISO-8859-1 python3 test123.py
   system's default encoding: utf-8
   sys.stdout's encoding: ISO-8859-1
   locale's prefered encoding: ISO-8859-1
   ::Encoding ist Schei�e

Again; The interpreter has no problem to read the UTF-8 source file (no
SyntaxError).  Only the application works not as expected...

The German 'ß' was correctly read by the interpreter and converted to the
internal unicode representation '\u00DF'.  When it is written to stdout (print)
it is correctly encoded from unicode to ISO-8859-1, but why do we get a '�'?
Because the my X-terminal still uses UTF-8 even when I change the LANG.
Lets use liut(1) and everything is fine:

   LANG=en_US.ISO-8859-1 luit -encoding ISO-8859-1 python3 test123.py
   system's default encoding: utf-8
   sys.stdout's encoding: ISO-8859-1
   locale's prefered encoding: ISO-8859-1
   ::Encoding ist Scheiße

So much more to say about encoding, we haven't talked about all the
pitfalls e.g. with filename encoding or the encoding of used editors ;)

-- Markus --

