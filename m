Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A187F31C79A
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 09:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbhBPIub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 03:50:31 -0500
Received: from verein.lst.de ([213.95.11.211]:40399 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229635AbhBPIu3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 03:50:29 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 7CF7D6736F; Tue, 16 Feb 2021 09:49:47 +0100 (CET)
Date:   Tue, 16 Feb 2021 09:49:47 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH 6/7] dma-iommu: implement ->alloc_noncontiguous
Message-ID: <20210216084947.GA23897@lst.de>
References: <20210202095110.1215346-1-hch@lst.de> <20210202095110.1215346-7-hch@lst.de> <CAAFQd5BXAWeB2h4RvqsF1q8ip-Rhew80c7y1_og22-x3rS8KOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5BXAWeB2h4RvqsF1q8ip-Rhew80c7y1_og22-x3rS8KOQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 16, 2021 at 05:14:55PM +0900, Tomasz Figa wrote:
> When working on the videobuf2 integration with Sergey I noticed that
> we always pass 0 as DMA attrs here, which removes the ability for
> drivers to use DMA_ATTR_ALLOC_SINGLE_PAGES.
> 
> It's quite important from a system stability point of view, because by
> default the iommu_dma allocator would prefer big order allocations for
> TLB locality reasons. For many devices, though, it doesn't really
> affect the performance, because of random access patterns, so single
> pages are good enough and reduce the risk of allocation failures or
> latency due to fragmentation.
> 
> Do you think we could add the attrs parameter to the
> dma_alloc_noncontiguous() API?

Yes, we could probably do that.
