Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB26F2F4293
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 04:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbhAMDjg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 22:39:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbhAMDjf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 22:39:35 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F042C061575;
        Tue, 12 Jan 2021 19:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=hxL8OEaWU3eYX5zkce+hWBI9FKYUlThAgSoqW/uf7O8=; b=uftT7oMtzIxyzEugJCySOdTRkP
        X32nlOL1T3NepoxM7TOeB7Lp9paSgyzcGqss53uUXuxbDJv4tBjCBYPlCJy8qUBNJc3i9j8qzP1yA
        rW/UY9HctSNXfDYN1rAmGfrsOK1mo/to7tckido6dc6Gp2C8czL2vpZtEG8Nc3zAPos8vcbML92uR
        ABDI/RzhhTu9CPf7Xs/XTPdn174AGFwsQmrqDQv6BVaFGKADMbXI9/GLlTnhm61dwZHOiPjDt5PJP
        Qo0mhyGoY5XMQdtEBmhs4mvzWzylRLJZrngdU6r9Pn0affWFmPQB2xENLptFaQ7pCsqftfk2U/WJM
        OO+UFBtw==;
Received: from [2601:1c0:6280:3f0::9abc]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kzWzg-0001Lx-TY; Wed, 13 Jan 2021 03:38:49 +0000
Subject: Re: [PATCH v3 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
To:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        hyesoo.yu@samsung.com, david@redhat.com, mhocko@suse.com,
        surenb@google.com, pullip.cho@samsung.com, joaodias@google.com,
        hridya@google.com, john.stultz@linaro.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20210113012143.1201105-1-minchan@kernel.org>
 <20210113012143.1201105-5-minchan@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <23b60450-b6ac-447b-4a61-fc4649c3a390@infradead.org>
Date:   Tue, 12 Jan 2021 19:38:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210113012143.1201105-5-minchan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/12/21 5:21 PM, Minchan Kim wrote:
> +config DMABUF_HEAPS_CHUNK
> +	bool "DMA-BUF CHUNK Heap"
> +	depends on DMABUF_HEAPS && DMA_CMA
> +	help
> +	  Choose this option to enable dma-buf CHUNK heap. This heap is backed
> +	  by the Contiguous Memory Allocator (CMA) and allocates the buffers that
> +	  arranged into a list of fixed size chunks taken from CMA.

maybe:
	  are arranged into

-- 
~Randy
You can't do anything without having to do something else first.
-- Belefant's Law
