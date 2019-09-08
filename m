Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43FB6ACBE3
	for <lists+linux-media@lfdr.de>; Sun,  8 Sep 2019 12:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbfIHKDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Sep 2019 06:03:42 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47100 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728023AbfIHKDm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Sep 2019 06:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=VRngH9Tt6f5tjpW6Ayv7hzJ7nXQI6UyfmRniBoaIh7c=; b=iJuH+yTFQErKs399GoKdUJniH
        rdLj59hSS43GfWs2Vd8enOMGPQwJZ5pl5vfkJusuOGuEk/AQk3nQowGkuf+IGDjj0nzdr0UTu2huR
        t+ZovCxUaff5nGjtJWEYS2J6PAtNZI66+AqSOhvvST6faaar+0ZzbJzgCX18Oob2CiyRGF8x2Kilp
        YWtXCTW67f0X7bBc6R9HE22cnxJgFrTzqjFXF/xqi35rhRZoRvPTB9GWuMMO8cb6lzxIscENBNdV4
        7UYegeMq1FAqGE9O5zdmVOLJAJ+lxNChcMwVgkPFjsQ7jrAwJlMQquCiRwxHa0mcPcqzz0lWDnrOL
        bLEL4E0pA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1i6u2a-0004cU-F5; Sun, 08 Sep 2019 10:03:28 +0000
Date:   Sun, 8 Sep 2019 03:03:28 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Markus Heiser <markus.heiser@darmarit.de>,
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
Message-ID: <20190908100328.GB29434@bombadil.infradead.org>
References: <cover.1567712829.git.mchehab+samsung@kernel.org>
 <20190907073419.6a88e318@lwn.net>
 <be329f0e-ec5b-f5ec-823d-66e58699da73@darmarit.de>
 <20190907132259.3199c8a2@coco.lan>
 <a08c5807-38e7-dfb3-ff3c-f78a498455e6@darmarit.de>
 <20190907150442.583b44c2@coco.lan>
 <686101df-f40c-916e-2730-353a3852cc84@darmarit.de>
 <alpine.DEB.2.21.1909072308060.1902@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1909072308060.1902@nanos.tec.linutronix.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 07, 2019 at 11:17:22PM +0200, Thomas Gleixner wrote:
> On Sat, 7 Sep 2019, Markus Heiser wrote:
> > Am 07.09.19 um 20:04 schrieb Mauro Carvalho Chehab:
> > > No idea. I would actually prefer to just remove the restriction, and let
> > > the SPDX header to be anywhere inside the first comment block inside a
> > > file [2].
> > > [2] I *suspect* that the restriction was added in order to make
> > >      ./scripts/spdxcheck.py to run faster and to avoid false positives.
> > >      Right now, if the maximum limit is removed (or set to a very high
> > >      value), there will be one false positive:
> 
> Nope. The intention was to have a well define place and format instead of
> everyone and his dog deciding to put it somewhere. SPDX is not intended to
> replace the existing licensing mess with some other randomly placed and
> formatted licensing mess.

I find the current style quite unaesthetic:

// SPDX-License-Identifier: GPL-2.0-only
/*
 *  linux/mm/memory.c
 *
 *  Copyright (C) 1991, 1992, 1993, 1994  Linus Torvalds
 */

I'd much rather see

/*
 * SPDX-License-Identifier: GPL-2.0-only
 * Copyright (C) 1991, 1992, 1993, 1994  Linus Torvalds
 */

but I appreciate the desire to force it to be on the first line if at all
possible.
