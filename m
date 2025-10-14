Return-Path: <linux-media+bounces-44414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE94BD96F1
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 14:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E3C71928563
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 12:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C152DE703;
	Tue, 14 Oct 2025 12:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QZWOd6Av"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BFF43AA4
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760445926; cv=none; b=tVcYwxyWEzh8PQ+KQYWvEMUQ1v3eai1ausk+RcS/oNh6BBPWmAbI8LeaY4itsxVeVS3RHYAexanc9uGiziiD/oltHZ+gFNFhhkxQIo+mmveS+AR1wgi/7vZN0MkSPGuXgeMbftHOfKlPyUGDf7Acr0ODi+XS9C0ZX1lgwTCSBeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760445926; c=relaxed/simple;
	bh=2HloXGZvRD+88/eG4ZgEhcmqaAV/Ri/MXMiO2AoLeJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gLOkR0hEpzzUE3QsKRLp3FpZUFsdAhCprmZR+5Zn0X7Pa1iXSAkQFK5cTtIGTshEBb5c7/poTJQc3I1zuM0UqtdgtRQQtGimk6D/pEb22sFSdNDuQ+24ZuA9OprRz1EDxIKz0KT40jUGeHEVHC7q5eUd8HoauUI0lHQUwHYREC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QZWOd6Av; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b404a8be3f1so123245266b.1
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 05:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760445922; x=1761050722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEOQpQJo98QyfYnBlnV0kP+HUCRx4XT+4+xOb+xrqYg=;
        b=QZWOd6AvX4xSk0ozoQ8EOxK8HGRVtr3tBQLZS8CD8z31RdQDUk7swwzco5uHtneiSV
         uAb8th1Q8utKWpeyaoLB6e2i0J3zjcrFUJyKF+Agy+LvwgmBsE9fJKKgqW9JHEKTfLNO
         yVrA75gr3tTs5Xqioj2lfxfmQE0kPxn411XNLq10cfT/C+CbkuW2e3pdyW2L7whXLW5K
         2jcXGlOZ4UV4sSy1nFZ6K8F9TTDyPZvg1vZ5gr2it2dee/2KrzbVnG1ZSTq5pJtLGC5F
         NCc/iLm/3fWM0KLMR/h6OwQu5wN8eusTXWrWcHRmmUI7F+RnaqaJi7tdb0tu4pgRnSGP
         YGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760445922; x=1761050722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEOQpQJo98QyfYnBlnV0kP+HUCRx4XT+4+xOb+xrqYg=;
        b=UOjyinaDkyL6NLnUwsKsF5aQSoj51F6kSI2fZWUGz/H5bzTUeYvT9zkqGJEFThAaZZ
         GqIeMqxoE4Hq9RQJZNQGfnmtvHJD0fBkfwVUhXpMaGgQEgSuYjKvphYWC1M1MCftVL0O
         TBs6sji9UmR0+0AQvh1gsrB6bM2wFV9XdUWYu6N1WxPfVzHkNSi2rbn3/1SsR9XSbcNL
         Bso7bMtKF2Aq+uus4Jzv3ZQhKMN4LEZCsVw0NfIIucu1vwCnoMCCg79WXQfFh27a6mFf
         bYW0qh2AGWPQPKJcmW+cEPjWTEsd1Wyf5IroGlwC97DojN4EW6fVeFEskavtb0u6+Z7/
         WxMA==
X-Forwarded-Encrypted: i=1; AJvYcCVraWkXGgqZzAAGqIiFsr7XvluQeRH1D9r/1wpQAVYjMPpWshp72hh2RuW7hBZW16JKIKjehB4AH51lzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN60UyxIHC8YdfpsHqJnVodRz6v+ojiR2vP6s4SyuwQiN/3vYp
	eCqc7BQDpbpvUjRIVhvj2tklKBgNba5kvVAD2lk/vhDoH4heZ9NP1/OuFu8l500OyEs=
X-Gm-Gg: ASbGncv9zvhapfbxY9GF/C7oXqmmcRjnTvX6GO6NDtPipLDUFUrWxBSPA5DWn5plMb8
	AMSQrc0fNQ84nqsEqW20+MUPKM7t7cIgL7koNtFd0FrmYZvFGmnLc50n3pExKi6NOfG94cSLzCl
	EDDZO5NxmcUU9047N9R4e8azysV+tVYG+RSh0gWhRpZRks2iaN/a5vJDg0H5NReYOWaTGuOR+1s
	JmfrhcYIjvpaybogj6rIUo5HGQ/hBQThKO0T2B0JwD/ABEv/YXRFHq4tS9CuracL1r0rBdQcDi4
	ERumQRoEjIwPDcpuy7uHPS1mtYqT9NLuI7P1XH8YdyZnPWnF/lNoH4AOnJE979zaAp5bTDc+rpl
	pyT5ec1sblHw+qe3t9gpzZXBKUmsffbnKed3V23vPrMb3tYIEyVp+w0Ojj4E/9ouFX7gFT6UoiW
	+NYA==
X-Google-Smtp-Source: AGHT+IF98YZGXnc/a9+tF96u8G13aSwGmApwD+ogJyUi8W1JPjF4gTRZUKJnX0ICaKrlb9YoA4BxHw==
X-Received: by 2002:a17:907:7ea6:b0:b46:b8a9:ea6 with SMTP id a640c23a62f3a-b50ac6cd23fmr1429210866b.9.1760445921504;
        Tue, 14 Oct 2025 05:45:21 -0700 (PDT)
Received: from mordecai.tesarici.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d66cc4b8sm1150612066b.30.2025.10.14.05.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:45:21 -0700 (PDT)
Date: Tue, 14 Oct 2025 14:45:13 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
 <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Mel Gorman
 <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, Zhaoyang Huang <huangzhaoyang@gmail.com>,
 <steve.kang@unisoc.com>
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
Message-ID: <20251014144513.445a370d@mordecai.tesarici.cz>
In-Reply-To: <20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
	<20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Oct 2025 16:32:30 +0800
"zhaoyang.huang" <zhaoyang.huang@unisoc.com> wrote:

> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> 
> The size of once dma-buf allocation could be dozens MB or much more
> which introduce a loop of allocating several thousands of order-0 pages.
> Furthermore, the concurrent allocation could have dma-buf allocation enter
> direct-reclaim during the loop. This commit would like to eliminate the
> above two affections by introducing alloc_pages_bulk_list in dma-buf's
> order-0 allocation. This patch is proved to be conditionally helpful
> in 18MB allocation as decreasing the time from 24604us to 6555us and no
> harm when bulk allocation can't be done(fallback to single page
> allocation)
> 
> Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 36 +++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index bbe7881f1360..71b028c63bd8 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -300,8 +300,8 @@ static const struct dma_buf_ops system_heap_buf_ops = {
>  	.release = system_heap_dma_buf_release,
>  };
>  
> -static struct page *alloc_largest_available(unsigned long size,
> -					    unsigned int max_order)
> +static void alloc_largest_available(unsigned long size,
> +		    unsigned int max_order, unsigned int *num_pages, struct list_head *list)

This interface feels weird. Maybe you could return the number of pages
instead of making this a void function and passing a pointer to get that
number?

>  {
>  	struct page *page;
>  	int i;
> @@ -312,12 +312,19 @@ static struct page *alloc_largest_available(unsigned long size,
>  		if (max_order < orders[i])
>  			continue;
>  
> -		page = alloc_pages(order_flags[i], orders[i]);
> -		if (!page)
> +		if (orders[i]) {
> +			page = alloc_pages(order_flags[i], orders[i]);

nitpick: Since the lowest order is special-cased now, you can simply
use HIGH_ORDER_GFP here and remove order_flags[] entirely.

> +			if (page) {
> +				list_add(&page->lru, list);
> +				*num_pages = 1;
> +			}
> +		} else
> +			*num_pages = alloc_pages_bulk_list(LOW_ORDER_GFP, size / PAGE_SIZE, list);
> +
> +		if (list_empty(list))
>  			continue;
> -		return page;
> +		return;
>  	}
> -	return NULL;
>  }
>  
>  static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
> @@ -335,6 +342,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>  	struct list_head pages;
>  	struct page *page, *tmp_page;
>  	int i, ret = -ENOMEM;
> +	unsigned int num_pages;
> +	LIST_HEAD(head);
>  
>  	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
>  	if (!buffer)
> @@ -348,6 +357,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>  	INIT_LIST_HEAD(&pages);
>  	i = 0;
>  	while (size_remaining > 0) {
> +		num_pages = 0;
> +		INIT_LIST_HEAD(&head);
>  		/*
>  		 * Avoid trying to allocate memory if the process
>  		 * has been killed by SIGKILL
> @@ -357,14 +368,15 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>  			goto free_buffer;
>  		}
>  
> -		page = alloc_largest_available(size_remaining, max_order);
> -		if (!page)
> +		alloc_largest_available(size_remaining, max_order, &num_pages, &head);
> +		if (!num_pages)
>  			goto free_buffer;
>  
> -		list_add_tail(&page->lru, &pages);
> -		size_remaining -= page_size(page);
> -		max_order = compound_order(page);
> -		i++;
> +		list_splice_tail(&head, &pages);
> +		max_order = folio_order(lru_to_folio(&head));
> +		size_remaining -= PAGE_SIZE * (num_pages << max_order);

This looks complicated. What about changing alloc_largest_available()
to return the total number of pages and using PAGE_SIZE * num_page?

Ah, you still have to look at the folio order to determine the new
value of max_order, so no big win. Hm. You could pass a pointer to
max_order down to alloc_largest_available(), but at that point I think
it's a matter of taste (aka bikeshedding).

Petr T

> +		i += num_pages;
> +
>  	}
>  
>  	table = &buffer->sg_table;


