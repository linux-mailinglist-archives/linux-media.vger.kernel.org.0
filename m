Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AABE1EDFEE
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 10:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgFDImJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 04:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgFDImJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 04:42:09 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265C4C05BD1E;
        Thu,  4 Jun 2020 01:42:09 -0700 (PDT)
Received: from [5.158.153.53] (helo=debian-buster-darwi.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:RSA_AES_256_CBC_SHA1:256)
        (Exim 4.80)
        (envelope-from <a.darwish@linutronix.de>)
        id 1jglRV-0008RC-Pp; Thu, 04 Jun 2020 10:41:41 +0200
Date:   Thu, 4 Jun 2020 10:41:40 +0200
From:   "Ahmed S. Darwish" <a.darwish@linutronix.de>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        "Sebastian A. Siewior" <bigeasy@linutronix.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        Jens Axboe <axboe@kernel.dk>, Vivek Goyal <vgoyal@redhat.com>,
        linux-block@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/6] seqlock: seqcount_t call sites bugfixes
Message-ID: <20200604084139.GA1123871@debian-buster-darwi.lab.linutronix.de>
References: <20200603144949.1122421-1-a.darwish@linutronix.de>
 <20200604072841.GR20149@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604072841.GR20149@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 04, 2020 at 09:28:41AM +0200, Daniel Vetter wrote:
> On Wed, Jun 03, 2020 at 04:49:43PM +0200, Ahmed S. Darwish wrote:
> > Hi,
> >
> > Since patch #7 and #8 from the series:
> >
> >    [PATCH v1 00/25] seqlock: Extend seqcount API with associated locks
> >    https://lore.kernel.org/lkml/20200519214547.352050-1-a.darwish@linutronix.de
> >
> > are now pending on the lockdep/x86 IRQ state tracking patch series:
> >
> >    [PATCH 00/14] x86/entry: disallow #DB more and x86/entry lockdep/nmi
> >    https://lkml.kernel.org/r/20200529212728.795169701@infradead.org
> >
> >    [PATCH v3 0/5] lockdep: Change IRQ state tracking to use per-cpu variables
> >    https://lkml.kernel.org/r/20200529213550.683440625@infradead.org
> >
> > This is a repost only of the seqcount_t call sites bugfixes that were on
> > top of the seqlock patch series.
> >
> > These fixes are independent, and can thus be merged on their own. I'm
> > reposting them now so they can at least hit -rc2 or -rc3.
>
> I'm confused on what I should do with patch 6 here for dma-buf. Looks like
> just a good cleanup/prep work, so I'd queue it for linux-next and 5.9, but
> sounds like you want this in earlier. Do you need this in 5.8-rc for some
> work meant for 5.9? Will this go in through some topic branch directly?
> Should I apply it?
>
> Patch itself lgtm, I'm just confused what I should do with it.
>

My apologies for the confusion. The cover letter is indeed misleading
w.r.t. the dma-buf patch.  It isn't a bugfix, so it shouldn't hit -rc.

Since without this patch compiling the seqcount series will fail, it
will be best to merge it through tip instead.

So all I need for now is a reviewed-by tag :) I will forwoard it to the
tip tree afterwards.

Thanks,

--
Ahmed S. Darwish
Linutronix GmbH
