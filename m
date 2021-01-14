Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 742E32F5D3B
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 10:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbhANJYH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 14 Jan 2021 04:24:07 -0500
Received: from mail.fireflyinternet.com ([77.68.26.236]:63716 "EHLO
        fireflyinternet.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727867AbhANJYG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 04:24:06 -0500
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 23592012-1500050 
        for multiple; Thu, 14 Jan 2021 09:23:20 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <CAKMK7uGXtu0V8TVaQ2XyuE9vOdJOWKrCYUNkh0FJMfucSyS2vg@mail.gmail.com>
References: <20210113140604.3615437-1-daniel.vetter@ffwll.ch> <161055261490.6195.7986280621869334351@build.alporthouse.com> <CAKMK7uEnnEj_YAR5Tm3jpS7MNPkqB43JBhQnY_K0YQ+LE9wL1g@mail.gmail.com> <161057213487.6195.581396740566956696@build.alporthouse.com> <CAKMK7uGXtu0V8TVaQ2XyuE9vOdJOWKrCYUNkh0FJMfucSyS2vg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm-buf: Add debug option
From:   Chris Wilson <chris@chris-wilson.co.uk>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        John Stultz <john.stultz@linaro.org>
Date:   Thu, 14 Jan 2021 09:23:18 +0000
Message-ID: <161061619887.19482.10606780107376365239@build.alporthouse.com>
User-Agent: alot/0.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Daniel Vetter (2021-01-14 09:02:57)
> On Wed, Jan 13, 2021 at 10:08 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > Quoting Daniel Vetter (2021-01-13 20:50:11)
> > > On Wed, Jan 13, 2021 at 4:43 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > >
> > > > Quoting Daniel Vetter (2021-01-13 14:06:04)
> > > > > We have too many people abusing the struct page they can get at but
> > > > > really shouldn't in importers. Aside from that the backing page might
> > > > > simply not exist (for dynamic p2p mappings) looking at it and using it
> > > > > e.g. for mmap can also wreak the page handling of the exporter
> > > > > completely. Importers really must go through the proper interface like
> > > > > dma_buf_mmap for everything.
> > > >
> > > > If the exporter doesn't want to expose the struct page, why are they
> > > > setting it in the exported sg_table?
> > >
> > > You need to store it somewhere, otherwise the dma-api doesn't work.
> > > Essentially this achieves clearing/resetting the struct page pointer,
> > > without additional allocations somewhere, or tons of driver changes
> > > (since presumably the driver does keep track of the struct page
> > > somewhere too).
> >
> > Only for mapping, and that's before the export -- if there's even a
> > struct page to begin with.
> >
> > > Also as long as we have random importers looking at struct page we
> > > can't just remove it, or crashes everywhere. So it has to be some
> > > debug option you can disable.
> >
> > Totally agreed that nothing generic can rely on pages being transported
> > via dma-buf, and memfd is there if you do want a suitable transport. The
> > one I don't know about is dma-buf heap, do both parties there consent to
> > transport pages via the dma-buf? i.e. do they have special cases for
> > import/export between heaps?
> 
> heaps shouldn't be any different wrt the interface exposed to
> importers. Adding John just in case I missed something.
> 
> I think the only problem we have is that the first import for ttm
> simply pulled out the struct page and ignored the sgtable otherwise,
> then that copypasted to places and we're still have some of that left.
> Although it's a lot better. So largely the problem is importers being
> a bit silly.
> 
> I also think I should change the defaulty y to default y if
> DMA_API_DEBUG or something like that, to make sure it's actually
> enabled often enough.

It felt overly draconian, but other than the open question of dma-buf
heaps (which I realise that we need some CI coverage for), I can't
think of a good reason to argue for hiding a struct page transport
within dma-buf.

The only other problem I see with the implementation is that there's
nothing that says that each dmabuf->ops->map_dma_buf() returns a new
sg_table, so we may end up undoing the xor. Or should each dma-buf
return a fresh dma-mapping for iommu isolation?
-Chris
