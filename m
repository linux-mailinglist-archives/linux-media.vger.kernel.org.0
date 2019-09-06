Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB461AB812
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 14:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392162AbfIFMWq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 08:22:46 -0400
Received: from smtprelay0064.hostedemail.com ([216.40.44.64]:54045 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728509AbfIFMWq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Sep 2019 08:22:46 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 06CFD182CED5B;
        Fri,  6 Sep 2019 12:22:45 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,
X-HE-Tag: blow41_51b7c3cbb5603
X-Filterd-Recvd-Size: 2838
Received: from XPS-9350.home (unknown [47.151.152.152])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Fri,  6 Sep 2019 12:22:41 +0000 (UTC)
Message-ID: <f7a18164a366a53f0234664f234c66fefdc3bc64.camel@perches.com>
Subject: Re: [PATCH 0/6] Address issues with SPDX requirements and PEP-263
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Sven Eckelmann <sven@narfation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Doug Smythies <doug.smythies@gmail.com>,
        =?ISO-8859-1?Q?Aur=E9lien?= Cedeyn <aurelien.cedeyn@gmail.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-doc@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thierry Reding <treding@nvidia.com>,
        Armijn Hemel <armijn@tjaldur.nl>, Jiri Olsa <jolsa@redhat.com>,
        Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Namhyung Kim <namhyung@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Allison Randal <allison@lohutok.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Date:   Fri, 06 Sep 2019 05:22:40 -0700
In-Reply-To: <20190906090228.1971ede9@coco.lan>
References: <cover.1567712829.git.mchehab+samsung@kernel.org>
         <20daa66d58e01f33a248b8703aa8e37933ef4154.camel@perches.com>
         <20190906090228.1971ede9@coco.lan>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2019-09-06 at 09:02 -0300, Mauro Carvalho Chehab wrote:
> Em Thu, 05 Sep 2019 13:05:08 -0700
> Joe Perches <joe@perches.com> escreveu:
> 
> > On Thu, 2019-09-05 at 16:57 -0300, Mauro Carvalho Chehab wrote:
> > > The  description at Documentation/process/license-rules.rst is very strict
> > > with regards to the position where the SPDX tags should be.  
> > []
> > > PS.: I sent already a RFC version for those patches along with this
> > > thread:
> > > 
> > >     https://lore.kernel.org/lkml/b32c2e46b91e7bcda2a9bd140673f06d71b2487a.camel@perches.com/  
> > 
> > Nice, thanks.
> > 
> > Now I guess I have to update checkpatch too.
> > (unless you want to... ;)
> 
> Yeah, it makes sense to update checkpatch too. Perhaps it could be
> changed to use the "-s" flag on the check, instead of implementing
> its own logic to handle the position.

I think checkpatch needs its own logic as its
source input is a patch file.


