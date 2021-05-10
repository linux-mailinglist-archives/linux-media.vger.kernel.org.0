Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97943377D20
	for <lists+linux-media@lfdr.de>; Mon, 10 May 2021 09:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhEJHcH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 03:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbhEJHcG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 03:32:06 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5D9C061573;
        Mon, 10 May 2021 00:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=RlPDTnrGP7VrkHHDZaeu5siASFXrL/7DV46d02KfOg8=; b=jVtYg1DpIhoMALo/8L1gTQX3ww
        71nqSsTYByFChENtDDk7rl0AnbqCNYwo4kIyhxfdTGMVo2WSUaokSu6XHznVNC+zNG6w1+ZT7teAE
        U3xD//EkLHc4hnRNpZgrlDLhKr0c4uniH4OXlSCvuWDEqpbXAyJEuvBrmJwwjpntITYYjTHgWxP8+
        TEhIsYdtK717BX+ucCD6EA1Ro67VHN9V61suNwsknLSPRw3z/gYot7uhl/qDZsHvzb9XvRvJ3WxY7
        MYKLsyXSwII3NUgCBauC/Y3gs/9XnATB/PvFMAq+mU7jEsLMIynM0ji0AW3may0sqatghH7sRC3gx
        nZxczo9Q==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lg0M8-005oIH-AU; Mon, 10 May 2021 07:29:37 +0000
Date:   Mon, 10 May 2021 08:29:32 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
Message-ID: <YJjg3DRnG1RG6VDK@infradead.org>
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
 <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local>
 <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
 <CAKMK7uELBbkhFBQoSfvMx+AKnbk-fgbamBm3sC20-dJwMq3Xmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uELBbkhFBQoSfvMx+AKnbk-fgbamBm3sC20-dJwMq3Xmg@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 10, 2021 at 09:16:58AM +0200, Daniel Vetter wrote:
> > End result: not pulling it, unless somebody can explain to me in small
> > words why I'm wrong and have the mental capacity of a damaged rodent.
> 
> No rodents I think, just more backstory of how this all fits. tldr;
> pin_user_pages is the only safe use of this vb2 userptr thing.

Yes, which is why I advocate for just ripping the follow_pfn path
out entirely.  It could have been used for crazy ad dangerous peer to
peer transfers outside of any infrastructure making it safe, or for
pre-CMA kernel memory carveouts for lage contiguous memory allocations
(which are pretty broken by design as well).  So IMHO the only sensible
thing is to remove this cruft entirely, and if it breaks a currently
working setup (which I think is unlikely) we'll have to make sure it
can work the proper way.
