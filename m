Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A9C2CBECA
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 14:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgLBNzI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 08:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbgLBNzI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 08:55:08 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59A5C0613CF;
        Wed,  2 Dec 2020 05:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=BPF0p8LwieotIqQ8Se3apv9Pv1/DdLdEpA/PB50rgWE=; b=eZh2zF8eJPaRth8HUFz0TGpx8F
        52xnoX1GPcWv2V550kvu6crFKf4puciDYEltqg33ZKqsG0KioGTAf/tgro8L9LKpHWrsHsTFpJtd5
        AaMLzwy2gn6WGJcAXK2wNHxarxbzENK9QRPqW2SG4vsvOL8hYKKMwGDWMPKpbykmLL5Q1ssaj7rtU
        NYQuWjGiZRfPZ9CvefK+9e6X4QbK+ohuXNGJZMVNHCh1i4GGbM/7oBn8L15EXB7tTatqMPNOa4mDm
        XcenqB8C5CSejKZ7tChuYSM+tWCqonRBkLZ9Wj2JjX5rV4UZwmzGekVtjzxFvZ77U/JJG03t5wd3p
        KERx78jg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkSaM-0001t5-RK; Wed, 02 Dec 2020 13:54:23 +0000
Date:   Wed, 2 Dec 2020 13:54:22 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Minchan Kim <minchan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, hyesoo.yu@samsung.com,
        willy@infradead.org, david@redhat.com, iamjoonsoo.kim@lge.com,
        vbabka@suse.cz, surenb@google.com, pullip.cho@samsung.com,
        joaodias@google.com, hridya@google.com, sumit.semwal@linaro.org,
        john.stultz@linaro.org, Brian.Starkey@arm.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, christian.koenig@amd.com,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Message-ID: <20201202135422.GB5902@infradead.org>
References: <20201201175144.3996569-1-minchan@kernel.org>
 <20201201175144.3996569-5-minchan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201175144.3996569-5-minchan@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 01, 2020 at 09:51:44AM -0800, Minchan Kim wrote:
> From: Hyesoo Yu <hyesoo.yu@samsung.com>
> 
> This patch supports chunk heap that allocates the buffers that
> arranged into a list a fixed size chunks taken from CMA.
> 
> The chunk heap doesn't use heap-helper although it can remove
> duplicated code since heap-helper is under deprecated process.[1]
> 
> NOTE: This patch only adds the default CMA heap to allocate chunk
> pages. We will add another CMA memory regions to the dmabuf heaps
> interface with a later patch (which requires a dt binding)

This new heap seems to largely duplicate the exsting cma_heap.c
file.  Why can't you reuse the code and allow creating different
heaps with different chunk sizes or max numbers of segments?

> +config DMABUF_HEAPS_CHUNK_ORDER
> +	int "Chunk page order for dmabuf chunk heap"
> +	default 4
> +	depends on DMABUF_HEAPS_CHUNK
> +	help
> +	  Set page order of fixed chunk size to allocate from CMA.

Using a config option for this is just broken.  It needs to be runtime
or at very least boot time / DT controllable.

> + * ION Memory Allocator chunk heap exporter

This comment seems wrong.
