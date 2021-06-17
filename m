Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05AE63AAE4E
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 10:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhFQIDa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 04:03:30 -0400
Received: from verein.lst.de ([213.95.11.211]:57681 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230055AbhFQIDR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 04:03:17 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 0355768C4E; Thu, 17 Jun 2021 10:01:08 +0200 (CEST)
Date:   Thu, 17 Jun 2021 10:01:07 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <20210617080107.GA1422@lst.de>
References: <20210427131344.139443-1-senozhatsky@chromium.org> <20210427131344.139443-9-senozhatsky@chromium.org> <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl> <YMsAIVs7G2hUDR2F@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMsAIVs7G2hUDR2F@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 17, 2021 at 04:56:17PM +0900, Sergey Senozhatsky wrote:
> > This function can use some comments. What is happening AFAICS is that
> > buf->vaddr is either set in vb2_dc_alloc_coherent (unless
> > DMA_ATTR_NO_KERNEL_MAPPING was set), it is obtained through dma_buf_vmap()
> > if the buffer was attached to a dma_buf, or it is allocated via
> > dma_vmap_noncontiguous() for non-coherent memory.
> 
> Yeah, it's complicated. Maybe we can make things more symmetrical.
> 
> > But this leaves coherent memory with DMA_ATTR_NO_KERNEL_MAPPING set, what
> > is vaddr in that case? I think it will call dma_vmap_noncontiguous()
> > incorrectly in that case, shouldn't there be a check for !buf->coherent_mem
> > before the call to dma_vmap_noncontiguous()?
> 
> Thanks a lot for looking into it.

Can we just kill off DMA_ATTR_NO_KERNEL_MAPPING in v4l now?  There really is
no good reason to use that with dma_alloc_noncoherent/noncontiguous
available, and I plan to eventually remove that interface entirely.
