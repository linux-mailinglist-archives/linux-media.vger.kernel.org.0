Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9AD3AC242
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 06:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbhFRE1i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 00:27:38 -0400
Received: from verein.lst.de ([213.95.11.211]:33052 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230361AbhFRE1i (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 00:27:38 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 3506468D12; Fri, 18 Jun 2021 06:25:26 +0200 (CEST)
Date:   Fri, 18 Jun 2021 06:25:26 +0200
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
Message-ID: <20210618042526.GA17794@lst.de>
References: <20210427131344.139443-1-senozhatsky@chromium.org> <20210427131344.139443-9-senozhatsky@chromium.org> <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl> <YMsAIVs7G2hUDR2F@google.com> <20210617080107.GA1422@lst.de> <CAAFQd5DiPstn-s+yQM3iMd=G9oaag39qCyX483a7-Jrn=gxWCA@mail.gmail.com> <20210617085233.GA4702@lst.de> <CAAFQd5DqK2gSTGjfo-vahXwMzzO9gv26cY=vV6urn3viDLPE7g@mail.gmail.com> <20210617100656.GA11107@lst.de> <CAAFQd5CgLDkJ3t1aU2PRcGu6cGFjLXOnvMqDg62Z7Zuc8ABVHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5CgLDkJ3t1aU2PRcGu6cGFjLXOnvMqDg62Z7Zuc8ABVHg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 18, 2021 at 12:21:33PM +0900, Tomasz Figa wrote:
> > On Thu, Jun 17, 2021 at 06:40:58PM +0900, Tomasz Figa wrote:
> > > Sorry, I meant dma_alloc_attrs() and yes, it's indeed a misnomer. Our
> > > use case basically has no need for the additional coherent mapping, so
> > > creation of it can be skipped to save some vmalloc space. (Yes, it
> > > probably only matters for 32-bit architectures.)
> >
> > Yes, that is the normal use case, and it is solved by using
> > dma_alloc_noncoherent or dma_alloc_noncontigous without the vmap
> > step.
> 
> True, silly me. Probably not enough coffee at the time I was looking at it.
> 
> With that, wouldn't it be possible to completely get rid of
> dma_alloc_{coherent,attrs}() and use dma_alloc_noncontiguous() +
> optional kernel and/or userspace mapping helper everywhere? (Possibly
> renaming it to something as simple as dma_alloc().

Well, dma_alloc_coherent users want a non-cached mapping.  And while
some architectures provide that using a vmap with "uncached" bits in the
PTE to provide that, this:

 a) is not possibly everywhere
 b) even where possible is not always the best idea as it creates mappings
    with differnet cachability bets

And even without that dma_alloc_noncoherent causes less overhead than
dma_alloc_noncontigious if you only need a single contiguous range.

So while I'm happy we have something useful for more complex drivers like
v4l I think the simple dma_alloc_coherent API, including some of the less
crazy flags for dma_alloc_attrs is the right thing to use for more than
90% of the use cases.
