Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7082A3AFDF1
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 09:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhFVHf0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 03:35:26 -0400
Received: from verein.lst.de ([213.95.11.211]:45444 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229628AbhFVHf0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 03:35:26 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id A866167373; Tue, 22 Jun 2021 09:33:08 +0200 (CEST)
Date:   Tue, 22 Jun 2021 09:33:08 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <20210622073308.GA32231@lst.de>
References: <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl> <YMsAIVs7G2hUDR2F@google.com> <20210617080107.GA1422@lst.de> <CAAFQd5DiPstn-s+yQM3iMd=G9oaag39qCyX483a7-Jrn=gxWCA@mail.gmail.com> <20210617085233.GA4702@lst.de> <CAAFQd5DqK2gSTGjfo-vahXwMzzO9gv26cY=vV6urn3viDLPE7g@mail.gmail.com> <20210617100656.GA11107@lst.de> <CAAFQd5CgLDkJ3t1aU2PRcGu6cGFjLXOnvMqDg62Z7Zuc8ABVHg@mail.gmail.com> <20210618042526.GA17794@lst.de> <CAAFQd5Bt9TJ87Yk5ZpqTqrX9rmP0Uq8VNwx_rwFHakWP850Axw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5Bt9TJ87Yk5ZpqTqrX9rmP0Uq8VNwx_rwFHakWP850Axw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 18, 2021 at 01:44:08PM +0900, Tomasz Figa wrote:
> > Well, dma_alloc_coherent users want a non-cached mapping.  And while
> > some architectures provide that using a vmap with "uncached" bits in the
> > PTE to provide that, this:
> >
> >  a) is not possibly everywhere
> >  b) even where possible is not always the best idea as it creates mappings
> >     with differnet cachability bets
> 
> I think this could be addressed by having a dma_vmap() helper that
> does the right thing, whether it's vmap() or dma_common_pages_remap()
> as appropriate. Or would be this still insufficient for some
> architectures?

It can't always do the right thing.  E.g. for the case where uncached
memory needs to be allocated from a special boot time fixed pool.

> > And even without that dma_alloc_noncoherent causes less overhead than
> > dma_alloc_noncontigious if you only need a single contiguous range.
> >
> 
> Given that behind the scenes dma_alloc_noncontiguous() would also just
> call __dma_alloc_pages() for devices that need contiguous pages, would
> the overhead be basically the creation of a single-entry sgtable?

In the best case: yes.

> > So while I'm happy we have something useful for more complex drivers like
> > v4l I think the simple dma_alloc_coherent API, including some of the less
> > crazy flags for dma_alloc_attrs is the right thing to use for more than
> > 90% of the use cases.
> 
> One thing to take into account here is that many drivers use the
> existing "simple" way, just because there wasn't a viable alternative
> to do something better. Agreed, though, that we shouldn't optimize for
> the rare cases.

While that might be true for a few drivers, it is absolutely not true
for the wide majority.  I think you media people are a little special,
with only the GPU folks contending for "specialness" :)  (although
media handles it way better, gpu folks just create local hacks that
can't work portably).
