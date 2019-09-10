Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8994AE3BF
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 08:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393444AbfIJGbS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 02:31:18 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33291 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfIJGbR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 02:31:17 -0400
Received: by mail-wr1-f68.google.com with SMTP id u16so17637496wrr.0;
        Mon, 09 Sep 2019 23:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Upbbc+X30JdJgcki87/KoNEEtO+jDuLsK2AFc+5C7zU=;
        b=JYj7bSbtEoMC+tqbHGpvs9IuEqqMeYNOVK84yHvhqPph6feZbUjjf1KJVaPxiu4r7D
         vhKag1Eg/WxvetV7toc1pRoAHg9KODJ8IX0GYebDEJB5oQoSgMxSikdCmmHRJLVztXTW
         uElErWkaSOf4kMhtAd0hnn/LcKVh/abdkE6fBZgOGXVI3tlAhprDjJBIKNU5Hgk2On0Q
         U5EAzBPg61PHico4RyTEd+mwRh+uTeEknrovNsZ0+qGm49fL3KCGpLDVke4Z5ZJcozcG
         qXN/M26Vw2AYlY7ms+Wwdnu/TUsjjbi5ht6IUn3LntBEXM0OfcNtdr3Em19+fSGZz78x
         G9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Upbbc+X30JdJgcki87/KoNEEtO+jDuLsK2AFc+5C7zU=;
        b=P6jn1TkWnxX/lPYWN5bgK9v80XnSUqYwVHA5dqxvXaR+Ho09Okswis4BR8MRNymv6e
         jJDEd0tBO20b1K5KlvbLCJ139ZyjI4l6pX+2v1zlGXOzQ6dZwsHgHO2AMLYKuyUyE5yp
         65fbgAYyKGlRLJgwIKpRSuq/V+pu7Pg32YbnjFr5hGpcp9k+GMWriYZRabajmIacC/O/
         tD2NNfz7p7fSbK6AmgCVbpe85TNT+CprXgONaf9Cx8KsiUMDbI/e1/QK9kVR8ojuufPv
         WJqOnMCE0I3AP9u31prSaUJqY2FCsDjWjzVOjtRv6G/ayYsuwXtSf1fnofq7dqZ2KlBJ
         edJg==
X-Gm-Message-State: APjAAAXNLaXVuai6yODhpFDNnywv4aJRsbuCT1w0R2eBlu6BnFv5Y3ig
        8TQw2d7Y4qVyJTg1+yt9EbY=
X-Google-Smtp-Source: APXvYqydsceenTXPx8TXy/IA+DTcka5HAXpBEGN26MHL/Rp7Zn1KaCSGbRqUikWHX70QJE2ZXKnO+A==
X-Received: by 2002:adf:a4c8:: with SMTP id h8mr24045817wrb.293.1568097075467;
        Mon, 09 Sep 2019 23:31:15 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
        by smtp.gmail.com with ESMTPSA id s3sm1481044wmj.48.2019.09.09.23.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2019 23:31:14 -0700 (PDT)
Date:   Tue, 10 Sep 2019 08:31:12 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Markus Heiser <markus.heiser@darmarit.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Sven Eckelmann <sven@narfation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Doug Smythies <doug.smythies@gmail.com>,
        =?iso-8859-1?Q?Aur=E9lien?= Cedeyn <aurelien.cedeyn@gmail.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-doc@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thierry Reding <treding@nvidia.com>,
        Armijn Hemel <armijn@tjaldur.nl>, Jiri Olsa <jolsa@redhat.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Namhyung Kim <namhyung@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Allison Randal <allison@lohutok.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 0/6] Address issues with SPDX requirements and PEP-263
Message-ID: <20190910063112.GA1579@gmail.com>
References: <cover.1567712829.git.mchehab+samsung@kernel.org>
 <20190907073419.6a88e318@lwn.net>
 <be329f0e-ec5b-f5ec-823d-66e58699da73@darmarit.de>
 <20190907132259.3199c8a2@coco.lan>
 <a08c5807-38e7-dfb3-ff3c-f78a498455e6@darmarit.de>
 <20190907150442.583b44c2@coco.lan>
 <686101df-f40c-916e-2730-353a3852cc84@darmarit.de>
 <alpine.DEB.2.21.1909072308060.1902@nanos.tec.linutronix.de>
 <20190908100328.GB29434@bombadil.infradead.org>
 <alpine.DEB.2.21.1909081541520.2134@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1909081541520.2134@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


* Thomas Gleixner <tglx@linutronix.de> wrote:

> On Sun, 8 Sep 2019, Matthew Wilcox wrote:
> > On Sat, Sep 07, 2019 at 11:17:22PM +0200, Thomas Gleixner wrote:
> > > On Sat, 7 Sep 2019, Markus Heiser wrote:
> > > > Am 07.09.19 um 20:04 schrieb Mauro Carvalho Chehab:
> > > > > No idea. I would actually prefer to just remove the restriction, and let
> > > > > the SPDX header to be anywhere inside the first comment block inside a
> > > > > file [2].
> > > > > [2] I *suspect* that the restriction was added in order to make
> > > > >      ./scripts/spdxcheck.py to run faster and to avoid false positives.
> > > > >      Right now, if the maximum limit is removed (or set to a very high
> > > > >      value), there will be one false positive:
> > > 
> > > Nope. The intention was to have a well define place and format instead of
> > > everyone and his dog deciding to put it somewhere. SPDX is not intended to
> > > replace the existing licensing mess with some other randomly placed and
> > > formatted licensing mess.
> > 
> > I find the current style quite unaesthetic:
> > 
> > // SPDX-License-Identifier: GPL-2.0-only
> > /*
> >  *  linux/mm/memory.c
> >  *
> >  *  Copyright (C) 1991, 1992, 1993, 1994  Linus Torvalds
> >  */
> > 
> > I'd much rather see
> > 
> > /*
> >  * SPDX-License-Identifier: GPL-2.0-only
> >  * Copyright (C) 1991, 1992, 1993, 1994  Linus Torvalds
> >  */
> > 
> > but I appreciate the desire to force it to be on the first line if at all
> > possible.
> 
> That style is inflicted upon you by Penguin Emperor Decree. :)

I'd also say that it's a rather tooling-friendly format which mandates a 
single-line representation, which will be less likely to be morphed into 
a zillion variants like the original boilerplates.

So the Penguin Emperor Decree also makes sense, which helps. ;-)

Thanks,

	Ingo
