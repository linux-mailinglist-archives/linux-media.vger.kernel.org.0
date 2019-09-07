Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32DAAAC961
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2019 23:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbfIGVRj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Sep 2019 17:17:39 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:49680 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfIGVRj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Sep 2019 17:17:39 -0400
Received: from p5de0b6c5.dip0.t-ipconnect.de ([93.224.182.197] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1i6i5E-0001ul-5L; Sat, 07 Sep 2019 23:17:24 +0200
Date:   Sat, 7 Sep 2019 23:17:22 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Markus Heiser <markus.heiser@darmarit.de>
cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Sven Eckelmann <sven@narfation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Doug Smythies <doug.smythies@gmail.com>,
        =?ISO-8859-15?Q?Aur=E9lien_Cedeyn?= <aurelien.cedeyn@gmail.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-doc@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thierry Reding <treding@nvidia.com>,
        Armijn Hemel <armijn@tjaldur.nl>, Jiri Olsa <jolsa@redhat.com>,
        =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Namhyung Kim <namhyung@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Allison Randal <allison@lohutok.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 0/6] Address issues with SPDX requirements and PEP-263
In-Reply-To: <686101df-f40c-916e-2730-353a3852cc84@darmarit.de>
Message-ID: <alpine.DEB.2.21.1909072308060.1902@nanos.tec.linutronix.de>
References: <cover.1567712829.git.mchehab+samsung@kernel.org> <20190907073419.6a88e318@lwn.net> <be329f0e-ec5b-f5ec-823d-66e58699da73@darmarit.de> <20190907132259.3199c8a2@coco.lan> <a08c5807-38e7-dfb3-ff3c-f78a498455e6@darmarit.de> <20190907150442.583b44c2@coco.lan>
 <686101df-f40c-916e-2730-353a3852cc84@darmarit.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 7 Sep 2019, Markus Heiser wrote:
> Am 07.09.19 um 20:04 schrieb Mauro Carvalho Chehab:
> > No idea. I would actually prefer to just remove the restriction, and let
> > the SPDX header to be anywhere inside the first comment block inside a
> > file [2].
> 
> > That's basically how this thread started: other developers think
> > that it is a good idea to be pedantic. So, be it, but let's then fix
> > the documentation, as the way it is, it is implicitly forbidding the
> > addition of encoding lines for Python scripts.
> > 
> > [2] I *suspect* that the restriction was added in order to make
> >      ./scripts/spdxcheck.py to run faster and to avoid false positives.
> >      Right now, if the maximum limit is removed (or set to a very high
> >      value), there will be one false positive:

Nope. The intention was to have a well define place and format instead of
everyone and his dog deciding to put it somewhere. SPDX is not intended to
replace the existing licensing mess with some other randomly placed and
formatted licensing mess.

> > > - write a shebang line if this file is called directly from the
> > >     command line .. but we do not need shebangs on py modules which
> > >     are imported from other modules or scripts
> > > 
> > > - write a encoding line if it is need or helpful / mostly it is helpful
> > >     to know the encoding of a text/code file.
> > > 
> > > - add a SPDX tag
> > 
> > Yes, but this violates the current documentation, as it doesn't allow the
> > SPDX tag after line #2.
> 
> Thats what I mean: The documentation was written with only a small use-cases
> in mind .. there is no real need for SPDX to be in line one or two ... lets
> fix the documentation as I described before.

If there is a requirement from the language to have 2 lines right at the
top for conveying information then there is of course no reason to insist
on the SPDX identifier being on line 2.

So the documentation should say:

   The SPDX identifier must be at the first possible line at the top of the
   file which is not occupied by information which is required to be
   immediately at the top of the file by system constraints, e.g. shebang,
   or by the language, e.g. the encoding information for python.

or something to that effect.

Thanks,

	tglx
