Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC421307274
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 10:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbhA1JUK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 04:20:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232421AbhA1JOq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 04:14:46 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED19FC061574;
        Thu, 28 Jan 2021 01:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=0uM6CSHsoomGeS1Xbh30DG0XHearH5v0HhHcSqmaAA0=; b=eMEfug9Ko1GEW3QSpqtQTs4ghg
        lm4hl37I9rSX9kMhJV2f1K//5qmFBwK1ShKO8/xyMypbfACYddH2ZEaAy9qdpkvCPKNFEG6RpBC07
        M7DF+lp8d6vo9wYJQBeOINb4pld07XKtOlDZiJkCDHRzgyUWj78+cEVUPbMdi2D0Q44tTgLo4Sj9t
        8Gpf0WL+cE/wsY0YVazPZhuuBR8Yddj0aZYQ7t9hYs/6//NP+cusgBqBdtCK4eJjxMtF5iVMDpuHl
        QGa38DMHZL79VQh5C/K6og7DvVJtZwLQKbh4iNYy59nOn/TqUhPugkTqiD29l+/GJZyW8iOOT7gOs
        cMkkfugA==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l53N6-008FCm-Sp; Thu, 28 Jan 2021 09:13:49 +0000
Date:   Thu, 28 Jan 2021 09:13:48 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     sumit.semwal@linaro.org, benjamin.gaignard@linaro.org,
        lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
        john.stultz@linaro.org, christian.koenig@amd.com,
        cgoldswo@codeaurora.org, orjan.eide@arm.com, robin.murphy@arm.com,
        jajones@nvidia.com, minchan@kernel.org, hridya@google.com,
        sspatil@google.com, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH 1/1] dma-buf: heaps: Map system heap pages as managed by
 linux vm
Message-ID: <20210128091348.GA1962975@infradead.org>
References: <20210128083817.314315-1-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128083817.314315-1-surenb@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 28, 2021 at 12:38:17AM -0800, Suren Baghdasaryan wrote:
> Currently system heap maps its buffers with VM_PFNMAP flag using
> remap_pfn_range. This results in such buffers not being accounted
> for in PSS calculations because vm treats this memory as having no
> page structs. Without page structs there are no counters representing
> how many processes are mapping a page and therefore PSS calculation
> is impossible.
> Historically, ION driver used to map its buffers as VM_PFNMAP areas
> due to memory carveouts that did not have page structs [1]. That
> is not the case anymore and it seems there was desire to move away
> from remap_pfn_range [2].
> Dmabuf system heap design inherits this ION behavior and maps its
> pages using remap_pfn_range even though allocated pages are backed
> by page structs.
> Clear VM_IO and VM_PFNMAP flags when mapping memory allocated by the
> system heap and replace remap_pfn_range with vm_insert_page, following
> Laura's suggestion in [1]. This would allow correct PSS calculation
> for dmabufs.
> 
> [1] https://driverdev-devel.linuxdriverproject.narkive.com/v0fJGpaD/using-ion-memory-for-direct-io
> [2] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-October/127519.html
> (sorry, could not find lore links for these discussions)
> 
> Suggested-by: Laura Abbott <labbott@kernel.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 17e0e9a68baf..0e92e42b2251 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -200,11 +200,13 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
>  	struct sg_page_iter piter;
>  	int ret;
>  
> +	/* All pages are backed by a "struct page" */
> +	vma->vm_flags &= ~VM_PFNMAP;

Why do we clear this flag?  It shouldn't even be set here as far as I
can tell.
