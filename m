Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1744BAB7A4
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 14:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391192AbfIFMCm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 08:02:42 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43820 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388384AbfIFMCl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 08:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=nM0u5Zwq/3ANoKVqYW1XKfXAdbkiEeIYyJ22EK0M/e4=; b=bV6/1kh/QpXrOH7u71wDiTaNu
        pT/ORqN8EtynTeqdqeyQHlooZkY6g/alSG0BTEA+kysQ+ScXgQLc4ItDM80QG+dtmDf13oYK2PxQL
        XfVROo0Z/v6AxdIi9Gc6yndrUK2UeA5SjllC/kTutMJtoFnnsUBu7Cdx2LV/8Vc4HEFRHmyc6zebe
        nhLkrO2hcNsUXuKuTAFf0Sh/78BTc0UpzwWY9pdrjZMTCfMalUL1lwntBwXKiVb+vIbTIOpjU/0Z8
        dW2SkAK83ynfTWkXFxyG4PSELjtDmpt9bbLRbao6N6ihr5VqgOS2B83LnxBdzTIaptHL5fHsWU9w3
        g+m2Dk+LA==;
Received: from [177.159.253.249] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i6Cwm-00067t-PV; Fri, 06 Sep 2019 12:02:37 +0000
Date:   Fri, 6 Sep 2019 09:02:28 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Joe Perches <joe@perches.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
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
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH 0/6] Address issues with SPDX requirements and PEP-263
Message-ID: <20190906090228.1971ede9@coco.lan>
In-Reply-To: <20daa66d58e01f33a248b8703aa8e37933ef4154.camel@perches.com>
References: <cover.1567712829.git.mchehab+samsung@kernel.org>
        <20daa66d58e01f33a248b8703aa8e37933ef4154.camel@perches.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 05 Sep 2019 13:05:08 -0700
Joe Perches <joe@perches.com> escreveu:

> On Thu, 2019-09-05 at 16:57 -0300, Mauro Carvalho Chehab wrote:
> > The  description at Documentation/process/license-rules.rst is very strict
> > with regards to the position where the SPDX tags should be.  
> []
> > PS.: I sent already a RFC version for those patches along with this
> > thread:
> > 
> >     https://lore.kernel.org/lkml/b32c2e46b91e7bcda2a9bd140673f06d71b2487a.camel@perches.com/  
> 
> Nice, thanks.
> 
> Now I guess I have to update checkpatch too.
> (unless you want to... ;)

Yeah, it makes sense to update checkpatch too. Perhaps it could be
changed to use the "-s" flag on the check, instead of implementing
its own logic to handle the position.

Thanks,
Mauro
