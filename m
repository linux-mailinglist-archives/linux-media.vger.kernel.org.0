Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0312C800C
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 09:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgK3Iey (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 03:34:54 -0500
Received: from verein.lst.de ([213.95.11.211]:43398 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbgK3Iey (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 03:34:54 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8685868AFE; Mon, 30 Nov 2020 09:34:10 +0100 (CET)
Date:   Mon, 30 Nov 2020 09:34:10 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20201130083410.GD32234@lst.de>
References: <20201125221917.150463-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125221917.150463-1-ribalda@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> +#ifndef CONFIG_DMA_NONCOHERENT

I think you need to drop this ifdef.  This code should work just fine
on noncoherent mips and sh platforms.

> +	uvc_urb->pages = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> +						 &uvc_urb->dma,
> +						 gfp_flags | __GFP_NOWARN, 0);
> +	if (!uvc_urb->pages)
> +		return false;
> +
> +	uvc_urb->buffer = vmap(uvc_urb->pages,
> +			       PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT,
> +			       VM_DMA_COHERENT, PAGE_KERNEL);
> +	if (!uvc_urb->buffer) {
> +		dma_free_noncontiguous(dma_dev, stream->urb_size,
> +				       uvc_urb->pages, uvc_urb->dma);
> +		return false;
> +	}
> +
> +	if (sg_alloc_table_from_pages(&uvc_urb->sgt, uvc_urb->pages,
> +				PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT, 0,
> +				stream->urb_size, GFP_KERNEL)) {
> +		vunmap(uvc_urb->buffer);
> +		dma_free_noncontiguous(dma_dev, stream->urb_size,
> +				       uvc_urb->pages, uvc_urb->dma);
> +		return false;
> +	}
> +
> +	return true;
> +}

I wonder if we should lift this into a helper.  On the one hand I had
proliferating struct scatterlist usage, on the other hand it is all over
the media and drm code anyway, and duplicating this doesn't help anyone.

Possibly including the fallback to the coherent allocating.
