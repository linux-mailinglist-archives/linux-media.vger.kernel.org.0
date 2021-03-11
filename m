Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E6B337A14
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 17:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbhCKQxD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 11:53:03 -0500
Received: from verein.lst.de ([213.95.11.211]:41821 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229784AbhCKQwx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 11:52:53 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 01DE668B05; Thu, 11 Mar 2021 17:52:51 +0100 (CET)
Date:   Thu, 11 Mar 2021 17:52:50 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        iommu@lists.linux-foundation.org
Cc:     linux-media@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: add a new dma_alloc_noncontiguous API v3
Message-ID: <20210311165250.GB25023@lst.de>
References: <20210301085236.947011-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301085236.947011-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Any comments?  Especially on the uvcvideo conversion?

On Mon, Mar 01, 2021 at 09:52:30AM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> this series adds the new noncontiguous DMA allocation API requested by
> various media driver maintainers.
> 
> Changes since v2:
>  - rebased to Linux 5.12-rc1
>  - dropped one already merged patch
>  - pass an attrs argument to dma_alloc_noncontigous
>  - clarify the dma_vmap_noncontiguous documentation a bit
>  - fix double assignments in uvcvideo
> 
> Changes since v1:
>  - document that flush_kernel_vmap_range and invalidate_kernel_vmap_range
>    must be called once an allocation is mapped into KVA
>  - add dma-debug support
>  - remove the separate dma_handle argument, and instead create fully formed
>    DMA mapped scatterlists
>  - use a directional allocation in uvcvideo
>  - call invalidate_kernel_vmap_range from uvcvideo
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
---end quoted text---
