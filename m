Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 407A3AC8A2
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2019 20:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391274AbfIGSE5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Sep 2019 14:04:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59112 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732265AbfIGSE5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Sep 2019 14:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6xS0f4CtI6zw+Et+eztOUQ1ClHlFcCpURJzmhA/JTKE=; b=BeYD15oLfhmgrS7L4I7UXAkup
        LTcH+6m15mBaQXqUJIWamnP7FLwh/8I8oVtH4XqnUBGocssofx4I7A2IO8PeJzCMDHr+oovZDerlF
        bXDtsbE1lS6AZdiBcX4/dSI5ybdf6/KgA+3qZQrviQ5BquxnF19zqNNZ75H2ipBVHEni6hKWSDPrf
        zvOq7D/n0my4tala+D15WhWowWF2txTbvsFj/bcePrwzJpJpHfhr2q7TiiMM73VqnAryADrXpUxF8
        hpL115wTojjqRxLqf+zN3WQnSu0VpXnWXEll8XYsWjc7SpJb0kVMMMjBDzn2jP3s1BUM+kCHPBZHx
        YeltX/hkg==;
Received: from [177.133.16.239] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i6f4s-00078E-OV; Sat, 07 Sep 2019 18:04:51 +0000
Date:   Sat, 7 Sep 2019 15:04:42 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Markus Heiser <markus.heiser@darmarit.de>
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
        =?UTF-8?B?QXVyw6lsaWVu?= Cedeyn <aurelien.cedeyn@gmail.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-doc@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thierry Reding <treding@nvidia.com>,
        Armijn Hemel <armijn@tjaldur.nl>, Jiri Olsa <jolsa@redhat.com>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>,
        Namhyung Kim <namhyung@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Allison Randal <allison@lohutok.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 0/6] Address issues with SPDX requirements and PEP-263
Message-ID: <20190907150442.583b44c2@coco.lan>
In-Reply-To: <a08c5807-38e7-dfb3-ff3c-f78a498455e6@darmarit.de>
References: <cover.1567712829.git.mchehab+samsung@kernel.org>
        <20190907073419.6a88e318@lwn.net>
        <be329f0e-ec5b-f5ec-823d-66e58699da73@darmarit.de>
        <20190907132259.3199c8a2@coco.lan>
        <a08c5807-38e7-dfb3-ff3c-f78a498455e6@darmarit.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 7 Sep 2019 19:33:06 +0200
Markus Heiser <markus.heiser@darmarit.de> escreveu:

> Am 07.09.19 um 18:22 schrieb Mauro Carvalho Chehab:
> > Em Sat, 7 Sep 2019 16:36:36 +0200
> > Markus Heiser <markus.heiser@darmarit.de> escreveu:
> >   
> >> Am 07.09.19 um 15:34 schrieb Jonathan Corbet:  
> >>> On Thu,  5 Sep 2019 16:57:47 -0300
> >>> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> >>>      
> >>>> The  description at Documentation/process/license-rules.rst is very strict
> >>>> with regards to the position where the SPDX tags should be.
> >>>>
> >>>> In the past several developers and maintainers interpreted it on a
> >>>> more permissive way, placing the SPDX header between lines 1 to 15,
> >>>> with are the ones which the  scripts/spdxcheck.py script verifies.
> >>>>
> >>>> However, recently, devs are becoming more strict about such
> >>>> requirement and want it to strictly follow the rule, with states that
> >>>> the SPDX rule should be at the first line ever on most files, and
> >>>> at the second line for scripts.
> >>>>
> >>>> Well, for Python script, such requirement causes violation to PEP-263,
> >>>> making regressions on scripts that contain encoding lines, as PEP-263
> >>>> also states about the same.
> >>>>
> >>>> This series addresses it.  
> >>>
> >>> So I really don't want to be overly difficult here, but I would like to
> >>> approach this from yet another angle...
> >>>      
> >>>> Patches 1 to 3 fix some Python scripts that violates PEP-263;  
> >>>
> >>> I just checked all of those scripts, and they are all just plain ASCII.
> >>> So it really doesn't matter whether the environment defaults to UTF-8 or
> >>> ASCII here.  So, in other words, we really shouldn't need to define the
> >>> encoding at all.  
> > 
> > I'm not a python expert, but, from what I researched, and from what I
> > understood from Markus, if a script tries to print an UTF-8 but the
> > system's encoding is ASCII (or some other encoding), the python script
> > will crash.  
> 
> An (uncatched) exception is thrown, when writing UTF-8 to a stream which
> do not support UTF-8 .. this is not a crash, it mostly indicates that the
> developper makes some wrong assumption about the use-case.

A not-handled exception is a crash in Python. I've seen python scripts
crash countless times with non-English names.

> There exists
> also the possibility to encode the UTF-8 to ASCII and replace unknown
> code points in the out-stream, or to catch the exception.

Yeah, but getting this right is very painful. I use patchwork since 2013.
It took *years* for it to not crash with non-ASCII chars[1]. That's, btw,
the primary reason why I don't usually use python: with other languages,
an alien char doesn't cause a crash.

[1] I might be wrong, but the last patch I saw addressing an issue
    there was applied this year.

> 
> But this was only academical, where do we have such problems in practice?
> 
> > At least on media, we define that some Kernel strings can be UTF-8.
> > See, for example the model field at the media_entity struct:
> > 
> > 	https://linuxtv.org/downloads/v4l-dvb-apis/kapi/mc-core.html
> > 
> > As stated there:
> > 
> > 	"media_entity.model must be filled with the device model name as
> > 	 a NUL-terminated UTF-8 string. The device/model revision must
> > 	 not be stored in this field."
> > 
> > I've no idea if the two perf scripts that contain the encoding data are
> > meant to print some strings that may be UTF-8 encoding (like those that
> > we have at the media subsystem), or if it is just that whomever added
> > were using e-macs and wanted to make his life simpler. As it is better
> > to be safe then sorry, on patches 2 and 3, I'm assuming the first case.  
> 
> Hm, I'am unsure if I understand you correct: Using UTF-8 in the .rst
> files are fine .. where do we have scripts generating UTF-8 outputs?
> (except the HTML output).

In thesis, perf scripts may be reading strings from the Kernel, with 
might be using UTF-8 encoding.

> 
> > 
> > In any case, we do need the encoding line at Sphinx extensions,
> > although there, the shebang line is optional.
> > 
> > In other words, we have those alternatives:
> > 
> > 1) Neither shebang nor coding -> SPDX will be at first line;
> > 2) shebang + SPDX -> SPDX will be at the second line;
> > 3) shebang + coding + SPDX -> SPDX will be at the third line;
> > 4) coding + SPDX
> > 
> >     This is something that only makes sense for Sphinx extensions.
> > 
> >     IMHO, I would place SPDX at the second line too, but I *guess* Python
> >     may accept it at the first line and would still properly evaluate
> >     coding (as this technically satisfies the text at PEP-263).  
> 
> Why you are so restrictive .. 

No idea. I would actually prefer to just remove the restriction, and let
the SPDX header to be anywhere inside the first comment block inside a 
file [2].

That's basically how this thread started: other developers think 
that it is a good idea to be pedantic. So, be it, but let's then fix
the documentation, as the way it is, it is implicitly forbidding the
addition of encoding lines for Python scripts.

[2] I *suspect* that the restriction was added in order to make
    ./scripts/spdxcheck.py to run faster and to avoid false positives.
    Right now, if the maximum limit is removed (or set to a very high
    value), there will be one false positive:

	Documentation/dev-tools/kselftest.rst

    This doc has a SPDX-like tag at line 230, asking people to add SPDX
    headers on files, but the file itself doesn't have its own SPDX tag. 
	
> what we normal do:
> 
> - write a shebang line if this file is called directly from the
>    command line .. but we do not need shebangs on py modules which
>    are imported from other modules or scripts
> 
> - write a encoding line if it is need or helpful / mostly it is helpful
>    to know the encoding of a text/code file.
> 
> - add a SPDX tag

Yes, but this violates the current documentation, as it doesn't allow the
SPDX tag after line #2.

> 
> At the end we will have files with one, two or all three of this lines.
> And the oder of this lines is, what I wrote:
> 
> >>
> >> Thats what I mean [1] .. lets patch the description in the license-rules.rst::
> >>
> >> - first line for the OS (shebang)
> >> - second line for environment (python-encoding, editor-mode, ...)
> >> - third and more lines for application (SPDX use) ..
> >>
> >> [1] https://www.mail-archive.com/linux-doc@vger.kernel.org/msg33240.html
> >>
> >> -- Markus --
> >>  
> >>> This suggests to me that we're adding a bunch of complications that we
> >>> don't necessarily need.  What am I missing here?
> >>>
> >>> Educate me properly and I'll not try to stand in the way of all this...
> >>>  
> 
> 
> It seems like it is not only me who is mising something .. what are
> the use-cases we have py-Exceptions, what are the use-cases to be so
> restrictive as you described above.
> 
> .. or did alice get lost in the cave?
> 
> Thanks for your patience with me
> 
> -- Markus --



Thanks,
Mauro
