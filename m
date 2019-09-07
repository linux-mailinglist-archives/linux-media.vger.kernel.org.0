Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8C11AC82F
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2019 19:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404578AbfIGRdO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Sep 2019 13:33:14 -0400
Received: from smtp1.goneo.de ([85.220.129.30]:55396 "EHLO smtp1.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391932AbfIGRdO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Sep 2019 13:33:14 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp1.goneo.de (Postfix) with ESMTP id EB91123F435;
        Sat,  7 Sep 2019 19:33:09 +0200 (CEST)
X-Virus-Scanned: by goneo
X-Spam-Flag: NO
X-Spam-Score: -2.876
X-Spam-Level: 
X-Spam-Status: No, score=-2.876 tagged_above=-999 tests=[ALL_TRUSTED=-1,
        AWL=0.024, BAYES_00=-1.9] autolearn=ham
Received: from smtp1.goneo.de ([127.0.0.1])
        by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hm7z0E1Zii7m; Sat,  7 Sep 2019 19:33:08 +0200 (CEST)
Received: from [192.168.1.127] (dyndsl-178-142-129-167.ewe-ip-backbone.de [178.142.129.167])
        by smtp1.goneo.de (Postfix) with ESMTPSA id B1B7E23F3CD;
        Sat,  7 Sep 2019 19:33:06 +0200 (CEST)
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
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <cover.1567712829.git.mchehab+samsung@kernel.org>
 <20190907073419.6a88e318@lwn.net>
 <be329f0e-ec5b-f5ec-823d-66e58699da73@darmarit.de>
 <20190907132259.3199c8a2@coco.lan>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <a08c5807-38e7-dfb3-ff3c-f78a498455e6@darmarit.de>
Date:   Sat, 7 Sep 2019 19:33:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190907132259.3199c8a2@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Am 07.09.19 um 18:22 schrieb Mauro Carvalho Chehab:
> Em Sat, 7 Sep 2019 16:36:36 +0200
> Markus Heiser <markus.heiser@darmarit.de> escreveu:
> 
>> Am 07.09.19 um 15:34 schrieb Jonathan Corbet:
>>> On Thu,  5 Sep 2019 16:57:47 -0300
>>> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
>>>    
>>>> The  description at Documentation/process/license-rules.rst is very strict
>>>> with regards to the position where the SPDX tags should be.
>>>>
>>>> In the past several developers and maintainers interpreted it on a
>>>> more permissive way, placing the SPDX header between lines 1 to 15,
>>>> with are the ones which the  scripts/spdxcheck.py script verifies.
>>>>
>>>> However, recently, devs are becoming more strict about such
>>>> requirement and want it to strictly follow the rule, with states that
>>>> the SPDX rule should be at the first line ever on most files, and
>>>> at the second line for scripts.
>>>>
>>>> Well, for Python script, such requirement causes violation to PEP-263,
>>>> making regressions on scripts that contain encoding lines, as PEP-263
>>>> also states about the same.
>>>>
>>>> This series addresses it.
>>>
>>> So I really don't want to be overly difficult here, but I would like to
>>> approach this from yet another angle...
>>>    
>>>> Patches 1 to 3 fix some Python scripts that violates PEP-263;
>>>
>>> I just checked all of those scripts, and they are all just plain ASCII.
>>> So it really doesn't matter whether the environment defaults to UTF-8 or
>>> ASCII here.  So, in other words, we really shouldn't need to define the
>>> encoding at all.
> 
> I'm not a python expert, but, from what I researched, and from what I
> understood from Markus, if a script tries to print an UTF-8 but the
> system's encoding is ASCII (or some other encoding), the python script
> will crash.

An (uncatched) exception is thrown, when writing UTF-8 to a stream which
do not support UTF-8 .. this is not a crash, it mostly indicates that the
developper makes some wrong assumption about the use-case.  There exists
also the possibility to encode the UTF-8 to ASCII and replace unknown
code points in the out-stream, or to catch the exception.

But this was only academical, where do we have such problems in practice?

> At least on media, we define that some Kernel strings can be UTF-8.
> See, for example the model field at the media_entity struct:
> 
> 	https://linuxtv.org/downloads/v4l-dvb-apis/kapi/mc-core.html
> 
> As stated there:
> 
> 	"media_entity.model must be filled with the device model name as
> 	 a NUL-terminated UTF-8 string. The device/model revision must
> 	 not be stored in this field."
> 
> I've no idea if the two perf scripts that contain the encoding data are
> meant to print some strings that may be UTF-8 encoding (like those that
> we have at the media subsystem), or if it is just that whomever added
> were using e-macs and wanted to make his life simpler. As it is better
> to be safe then sorry, on patches 2 and 3, I'm assuming the first case.

Hm, I'am unsure if I understand you correct: Using UTF-8 in the .rst
files are fine .. where do we have scripts generating UTF-8 outputs?
(except the HTML output).

> 
> In any case, we do need the encoding line at Sphinx extensions,
> although there, the shebang line is optional.
> 
> In other words, we have those alternatives:
> 
> 1) Neither shebang nor coding -> SPDX will be at first line;
> 2) shebang + SPDX -> SPDX will be at the second line;
> 3) shebang + coding + SPDX -> SPDX will be at the third line;
> 4) coding + SPDX
> 
>     This is something that only makes sense for Sphinx extensions.
> 
>     IMHO, I would place SPDX at the second line too, but I *guess* Python
>     may accept it at the first line and would still properly evaluate
>     coding (as this technically satisfies the text at PEP-263).

Why you are so restrictive .. what we normal do:

- write a shebang line if this file is called directly from the
   command line .. but we do not need shebangs on py modules which
   are imported from other modules or scripts

- write a encoding line if it is need or helpful / mostly it is helpful
   to know the encoding of a text/code file.

- add a SPDX tag

At the end we will have files with one, two or all three of this lines.
And the oder of this lines is, what I wrote:

>>
>> Thats what I mean [1] .. lets patch the description in the license-rules.rst::
>>
>> - first line for the OS (shebang)
>> - second line for environment (python-encoding, editor-mode, ...)
>> - third and more lines for application (SPDX use) ..
>>
>> [1] https://www.mail-archive.com/linux-doc@vger.kernel.org/msg33240.html
>>
>> -- Markus --
>>
>>> This suggests to me that we're adding a bunch of complications that we
>>> don't necessarily need.  What am I missing here?
>>>
>>> Educate me properly and I'll not try to stand in the way of all this...
>>>


It seems like it is not only me who is mising something .. what are
the use-cases we have py-Exceptions, what are the use-cases to be so
restrictive as you described above.

.. or did alice get lost in the cave?

Thanks for your patience with me

-- Markus --
