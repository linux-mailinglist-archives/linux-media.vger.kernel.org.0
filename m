Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66698C1D17
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 10:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729959AbfI3IXL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 04:23:11 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55114 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfI3IXL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 04:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=eUrejGB2jTrsHWK+x65Vhx7Oqte2kExU80wcqs9+O8c=; b=N9do07O7Hzkk3KQpRo+5O9qvD
        xUqHFklPpKe6Nqgjf9GIXkTCmoIIBqy7SCTn9cO4AhsCLaWx7Fo4plAN0peHey6S5Ze6ZI1ioQCSG
        7/pvOrAQX7qGR/n5OuzA2EOjNwln0V+QIDECng/YOS2wSeMg0aYN3xJ6ww6ppblIsMchevEv3zyrj
        +LimRELxYS6JWSsoXKz86g0BRriyXwuCY1T3SFFiZdDr6HDlnU53vGW5DJtcuBTY0LE9G0ZY/nOrF
        0fmQCibgFDj/m0T9TByR7ikb8b9KZoVuMV0guPOZ4mXr0CcIbTs5WbyhWrgjFx6LcVbiPhmTEuciQ
        73/duYuaA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iEqxa-0001og-GL; Mon, 30 Sep 2019 08:23:10 +0000
Date:   Mon, 30 Sep 2019 01:23:10 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Shik Chen <shik@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, notify@kernel.org,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Ricky Liang <jcliang@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        lkml <linux-kernel@vger.kernel.org>,
        kieran.bingham@ideasonboard.com, Vlastimil Babka <vbabka@suse.cz>,
        Christoph Lameter <cl@linux.com>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] media: uvcvideo: Use streaming DMA APIs to transfer
 buffers
Message-ID: <20190930082310.GA1750@infradead.org>
References: <20190802131226.123800-1-shik@chromium.org>
 <CANMq1KD3Pth7LNnVqxSesx3kSFte0eR5JqEBETv45s_9_YKWHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANMq1KD3Pth7LNnVqxSesx3kSFte0eR5JqEBETv45s_9_YKWHw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 28, 2019 at 11:33:16AM +0800, Nicolas Boichat wrote:
> > +static gfp_t uvc_alloc_gfp_flags(struct device *dev)
> > +{
> > +       u64 mask = dma_get_mask(dev);
> > +
> > +       if (dev->bus_dma_mask)
> > +               mask &= dev->bus_dma_mask;
> > +
> > +       if (mask < DMA_BIT_MASK(32) && IS_ENABLED(CONFIG_ZONE_DMA))
> > +               return GFP_DMA;
> > +
> > +       if (mask < DMA_BIT_MASK(64)) {
> > +               if (IS_ENABLED(CONFIG_ZONE_DMA32))
> > +                       return GFP_DMA32;
> 
> We're hitting issues with this on 64-bit ARM platform, where
> ZONE_DMA32 is enabled (default), the kmalloc allocation with GFP_DMA32
> fails.
> 
> There is no slab cache for GFP_DMA32, so those calls are expected to
> fail, AFAICT there are no other (working) kmalloc(..., .. | GFP_DMA32)
> users in the kernel, so I don't think we want to add a cache. If this
> helps, some discussion here why the cache wasn't added:
> https://lore.kernel.org/patchwork/patch/1009563/#1198622

And drivers really have no business looking at the dma mask.  I have
a plan for dma_alloc_pages API that could replace that cruft, but
until then please use GFP_KERNEL and let the dma subsystem bounce
buffer if needed.
