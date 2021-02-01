Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7F930ACC5
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 17:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbhBAQiL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 11:38:11 -0500
Received: from verein.lst.de ([213.95.11.211]:41983 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229680AbhBAQiL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 11:38:11 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id C42486736F; Mon,  1 Feb 2021 17:37:26 +0100 (CET)
Date:   Mon, 1 Feb 2021 17:37:26 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 6/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20210201163726.GA8279@lst.de>
References: <20210128145837.2250561-1-hch@lst.de> <20210128145837.2250561-7-hch@lst.de> <20210128150955.GA30563@lst.de> <CANiDSCtV8eiH7r6-mX3QhsYvJapqRfYufu4-iqmeiy6GiwwE_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtV8eiH7r6-mX3QhsYvJapqRfYufu4-iqmeiy6GiwwE_A@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 28, 2021 at 06:00:57PM +0100, Ricardo Ribalda wrote:
> > Given that we vmap the addresses this also needs
> > flush_kernel_vmap_range / invalidate_kernel_vmap_range calls for
> > VIVT architectures.
> 
> We only read from the device to the cpu. Then can we run only
> invalidate_kernel_vmap_range() ?
> 
> something like ?
> else {
>           dma_sync_sgtable_for_cpu(dma_dev, uvc_urb->sgt, DMA_FROM_DEVICE);
>            invalidate_kernel_vmap_range(uvc_urb->buffer,
> uvc_urb->stream->urb_size );
> }

Yes.  Right now we don't have a proper state machine for the
*_kernel_vmap_range, but we should probably add one once usage of this
grows.  Until then I need to respin my API patch to document how callers
need to use *_kernel_vmap_range, as well as adding the so far missing
dma-debug support.

As we're getting toward the end of the merge window I'll try to get this
done ASAP.

How should we plan to merge this code?  Do you have a tree you'd like
to pick up the whole thing for?  Or should I create a dma-mapping
tree branch that can be pulled in?
