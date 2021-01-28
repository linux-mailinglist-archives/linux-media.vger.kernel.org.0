Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E436A307939
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 16:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbhA1PLH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 10:11:07 -0500
Received: from verein.lst.de ([213.95.11.211]:57690 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232554AbhA1PKk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 10:10:40 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 4C75668AFE; Thu, 28 Jan 2021 16:09:55 +0100 (CET)
Date:   Thu, 28 Jan 2021 16:09:55 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        iommu@lists.linux-foundation.org
Cc:     linux-media@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 6/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20210128150955.GA30563@lst.de>
References: <20210128145837.2250561-1-hch@lst.de> <20210128145837.2250561-7-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128145837.2250561-7-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I just included this patch as-is, but here are a few comments:

On Thu, Jan 28, 2021 at 03:58:37PM +0100, Christoph Hellwig wrote:
> +static void uvc_urb_dma_sync(struct uvc_urb *uvc_urb, bool for_device)
> +{
> +	struct device *dma_dev = dma_dev = stream_to_dmadev(uvc_urb->stream);
> +
> +	if (for_device)
> +		dma_sync_sgtable_for_device(dma_dev, uvc_urb->sgt,
> +					    DMA_FROM_DEVICE);
> +	else
> +		dma_sync_sgtable_for_cpu(dma_dev, uvc_urb->sgt,
> +					 DMA_FROM_DEVICE);
> +}

Given that we vmap the addresses this also needs
flush_kernel_vmap_range / invalidate_kernel_vmap_range calls for
VIVT architectures.
