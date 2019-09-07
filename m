Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9A0AC8CC
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2019 20:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391195AbfIGShV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Sep 2019 14:37:21 -0400
Received: from smtp3.goneo.de ([85.220.129.37]:44928 "EHLO smtp3.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388619AbfIGShV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Sep 2019 14:37:21 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp3.goneo.de (Postfix) with ESMTP id EFD7323F837;
        Sat,  7 Sep 2019 20:37:16 +0200 (CEST)
X-Virus-Scanned: by goneo
X-Spam-Flag: NO
X-Spam-Score: -2.858
X-Spam-Level: 
X-Spam-Status: No, score=-2.858 tagged_above=-999 tests=[ALL_TRUSTED=-1,
        AWL=0.042, BAYES_00=-1.9] autolearn=ham
Received: from smtp3.goneo.de ([127.0.0.1])
        by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id g16ixfkAA9E9; Sat,  7 Sep 2019 20:37:15 +0200 (CEST)
Received: from [192.168.1.107] (dyndsl-178-142-129-167.ewe-ip-backbone.de [178.142.129.167])
        by smtp3.goneo.de (Postfix) with ESMTPSA id 7DB0D23F08E;
        Sat,  7 Sep 2019 20:37:13 +0200 (CEST)
Subject: Re: [PATCH 0/6] Address issues with SPDX requirements and PEP-263
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Sven Eckelmann <sven@narfation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Doug Smythies <doug.smythies@gmail.com>,
        =?UTF-8?Q?Aur=c3=a9lien_Cedeyn?= <aurelien.cedeyn@gmail.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-doc@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thierry Reding <treding@nvidia.com>,
        Armijn Hemel <armijn@tjaldur.nl>, Jiri Olsa <jolsa@redhat.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Namhyung Kim <namhyung@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Allison Randal <allison@lohutok.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1567712829.git.mchehab+samsung@kernel.org>
 <20190907073419.6a88e318@lwn.net>
 <be329f0e-ec5b-f5ec-823d-66e58699da73@darmarit.de>
 <20190907132259.3199c8a2@coco.lan>
 <a08c5807-38e7-dfb3-ff3c-f78a498455e6@darmarit.de>
 <20190907150442.583b44c2@coco.lan>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <686101df-f40c-916e-2730-353a3852cc84@darmarit.de>
Date:   Sat, 7 Sep 2019 20:37:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190907150442.583b44c2@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 07.09.19 um 20:04 schrieb Mauro Carvalho Chehab:
> Em Sat, 7 Sep 2019 19:33:06 +0200
> Markus Heiser <markus.heiser@darmarit.de> escreveu:
>> An (uncatched) exception is thrown, when writing UTF-8 to a stream which
>> do not support UTF-8 .. this is not a crash, it mostly indicates that the
>> developper makes some wrong assumption about the use-case.
> 
> A not-handled exception is a crash in Python. I've seen python scripts
> crash countless times with non-English names.

This has nothing to do with the language, ask the developer of those scripts.

>> There exists
>> also the possibility to encode the UTF-8 to ASCII and replace unknown
>> code points in the out-stream, or to catch the exception.
> 
> Yeah, but getting this right is very painful. I use patchwork since 2013.
> It took *years* for it to not crash with non-ASCII chars[1]. That's, btw,
> the primary reason why I don't usually use python: with other languages,
> an alien char doesn't cause a crash.

Python cares encoded (text) string-types while other languages and
application are just piping bytes to streams .. if you care about the
enconding you need exceptions when one whants write UTF-8 to ASCII out.

Anyway this is a bit of nitpicking / not helping here ..

> 
> [1] I might be wrong, but the last patch I saw addressing an issue
>      there was applied this year.

I alrady postet an example [1]

<snip>
This means your application has to know the encoding of a stream/file.
E.g. we handle the output from of the external Perl script
scripts/kernel-docs by encoding the byte stream from proc-call's
stdout into utf-8:

    out, err = codecs.decode(out, 'utf-8'), codecs.decode(err, 'utf-8')

see patch 
https://github.com/torvalds/linux/commit/86c0f046a8b0c23fca65f77333c233a06c25ef9a

Again, this is talking about application development and has
nothing to do with the encoding of the source files.
<snap>

[1] https://www.mail-archive.com/linux-doc@vger.kernel.org/msg33240.html

>>
>> But this was only academical, where do we have such problems in practice?
>>
>>> At least on media, we define that some Kernel strings can be UTF-8.
>>> See, for example the model field at the media_entity struct:
>>>
>>> 	https://linuxtv.org/downloads/v4l-dvb-apis/kapi/mc-core.html
>>>
>>> As stated there:
>>>
>>> 	"media_entity.model must be filled with the device model name as
>>> 	 a NUL-terminated UTF-8 string. The device/model revision must
>>> 	 not be stored in this field."
>>>
>>> I've no idea if the two perf scripts that contain the encoding data are
>>> meant to print some strings that may be UTF-8 encoding (like those that
>>> we have at the media subsystem), or if it is just that whomever added
>>> were using e-macs and wanted to make his life simpler. As it is better
>>> to be safe then sorry, on patches 2 and 3, I'm assuming the first case.
>>
>> Hm, I'am unsure if I understand you correct: Using UTF-8 in the .rst
>> files are fine .. where do we have scripts generating UTF-8 outputs?
>> (except the HTML output).
> 
> In thesis, perf scripts may be reading strings from the Kernel, with
> might be using UTF-8 encoding.
> 
>>
>>>
>>> In any case, we do need the encoding line at Sphinx extensions,
>>> although there, the shebang line is optional.
>>>
>>> In other words, we have those alternatives:
>>>
>>> 1) Neither shebang nor coding -> SPDX will be at first line;
>>> 2) shebang + SPDX -> SPDX will be at the second line;
>>> 3) shebang + coding + SPDX -> SPDX will be at the third line;
>>> 4) coding + SPDX
>>>
>>>      This is something that only makes sense for Sphinx extensions.
>>>
>>>      IMHO, I would place SPDX at the second line too, but I *guess* Python
>>>      may accept it at the first line and would still properly evaluate
>>>      coding (as this technically satisfies the text at PEP-263).
>>
>> Why you are so restrictive ..
> 
> No idea. I would actually prefer to just remove the restriction, and let
> the SPDX header to be anywhere inside the first comment block inside a
> file [2].
> 
> That's basically how this thread started: other developers think
> that it is a good idea to be pedantic. So, be it, but let's then fix
> the documentation, as the way it is, it is implicitly forbidding the
> addition of encoding lines for Python scripts.
> 
> [2] I *suspect* that the restriction was added in order to make
>      ./scripts/spdxcheck.py to run faster and to avoid false positives.
>      Right now, if the maximum limit is removed (or set to a very high
>      value), there will be one false positive:
> 
> 	Documentation/dev-tools/kselftest.rst
> 
>      This doc has a SPDX-like tag at line 230, asking people to add SPDX
>      headers on files, but the file itself doesn't have its own SPDX tag.
> 	
>> what we normal do:
>>
>> - write a shebang line if this file is called directly from the
>>     command line .. but we do not need shebangs on py modules which
>>     are imported from other modules or scripts
>>
>> - write a encoding line if it is need or helpful / mostly it is helpful
>>     to know the encoding of a text/code file.
>>
>> - add a SPDX tag
> 
> Yes, but this violates the current documentation, as it doesn't allow the
> SPDX tag after line #2.

Thats what I mean: The documentation was written with only a small use-cases
in mind .. there is no real need for SPDX to be in line one or two ... lets
fix the documentation as I described before.

Side note: if I can help you with perf or your build systems, don't hesitate
to contact me directly.

-- Markus --

>> At the end we will have files with one, two or all three of this lines.
>> And the oder of this lines is, what I wrote:
>>
>>>>
>>>> Thats what I mean [1] .. lets patch the description in the license-rules.rst::
>>>>
>>>> - first line for the OS (shebang)
>>>> - second line for environment (python-encoding, editor-mode, ...)
>>>> - third and more lines for application (SPDX use) ..
>>>>
>>>> [1] https://www.mail-archive.com/linux-doc@vger.kernel.org/msg33240.html
>>>>
>>>> -- Markus --
>>>>   
>>>>> This suggests to me that we're adding a bunch of complications that we
>>>>> don't necessarily need.  What am I missing here?
>>>>>
>>>>> Educate me properly and I'll not try to stand in the way of all this...
>>>>>   
>>
>>
>> It seems like it is not only me who is mising something .. what are
>> the use-cases we have py-Exceptions, what are the use-cases to be so
>> restrictive as you described above.
>>
>> .. or did alice get lost in the cave?
>>
>> Thanks for your patience with me
>>
>> -- Markus --
> 
> 
> 
> Thanks,
> Mauro
> 
