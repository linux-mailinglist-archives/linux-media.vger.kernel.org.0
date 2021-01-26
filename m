Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D33A304727
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 19:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732316AbhAZRLA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 12:11:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389427AbhAZHK6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 02:10:58 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9968FC061756;
        Mon, 25 Jan 2021 23:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Izeg7/5VyaxB5rz80jqoHfYzz5pDatI+gGF4pjJhArM=; b=JxGhOfyt5KZ0xAvheJfP/7LS2P
        Y83ZDjEK8bQEjgBt/BpF0eamFtJcyEAfQHf/ElHxB1tIfSP3QeYgV0n1QNVE4BUdSaVGtVbjrYAMN
        TuHlWJUH9tkJE60kuW5AJiqigJrcLYwrTGT9W4U217GGTP8ey+WqXQodrTV12q2K1VhdwTUV3zhVb
        7zMIE9AxFA8z5T7uvGQ9XlXtnv8Fpdf6JRJwOXYYEXzC0M/snrp2CV1yu8pLmOl74fJ2W1EEVTmfn
        CyeAbzzNZrnKe3A5Ia6Dir7ucISl11Letv7SUL4Ydbax5iEblm/IeoLTYWLeQRqjaM1T4AoJNCJ/t
        SGODeicQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l4IS0-005E6W-9K; Tue, 26 Jan 2021 07:08:08 +0000
Date:   Tue, 26 Jan 2021 07:07:44 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Minchan Kim <minchan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, hyesoo.yu@samsung.com,
        david@redhat.com, mhocko@suse.com, surenb@google.com,
        pullip.cho@samsung.com, joaodias@google.com, hridya@google.com,
        john.stultz@linaro.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Message-ID: <20210126070744.GA1244507@infradead.org>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-5-minchan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121175502.274391-5-minchan@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> +config DMABUF_HEAPS_CHUNK
> +	bool "DMA-BUF CHUNK Heap"
> +	depends on DMABUF_HEAPS && DMA_CMA
> +	help
> +	  Choose this option to enable dma-buf CHUNK heap. This heap is backed
> +	  by the Contiguous Memory Allocator (CMA) and allocates the buffers that
> +	  are arranged into a list of fixed size chunks taken from CMA.

Overly long line, which in text flowing text is really, really annoying.

Many more later.  Remember that > 80 chars are only allowed if they
significantly improve readability.  
