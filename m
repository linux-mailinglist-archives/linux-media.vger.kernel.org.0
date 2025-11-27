Return-Path: <linux-media+bounces-47835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E3C8F8DF
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 17:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C2C7A4E418D
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 16:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180503385B9;
	Thu, 27 Nov 2025 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXWEUNh7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D2929D266
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 16:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764262399; cv=none; b=n1F4QzpZSvjiNpoeuHZ+Aw4xI4XACMfA+eWAM+YpYRaa4zSUF9TkDdxF9JitAtNobOiajZbfjmcTMKd8Z0elPaBev6nSHon38eGhrXZPksU6WTliYDJVn02QD1Vmcqxj34AUOQUc+4A44vArUHBcCB0XyhhSiqHGIwbqZ7TqZL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764262399; c=relaxed/simple;
	bh=CznhCLf1ThZYWbrgLrVjo9M9sVOFhYzvjqo0GpjODvg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtPALQH2wC01/2qX9kS4Ftj1amx9n8dAMXsjqiwwznXLaMQcAbEbnnu71YobJ87wL0uq6jCnnfb4p7JpMKfZrJDaL0oo5BRfDgWaHvF494vF7A2JNfov5pGzP6Vu1wT7E3XBbyLUhdpiAtTG7R0yo1z9ZJOfnsGxK7XWM/sTeLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXWEUNh7; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-595825c8eb3so1024268e87.0
        for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 08:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764262396; x=1764867196; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P4drWKEd4RAmd7MBRAIQVZy+ZqrpPhSLkolh9dDZECE=;
        b=bXWEUNh7IbfYRtoSKdaAlGBIpqhZkw/fht0camCdDq/WyqOM5z+IgTEUsFitEwzh88
         KaapTq4hO4HUDOmV3MbYHKEkFpv/dXOZYhdSQA1LNYAHFxFsEY5R1iVQMU/RHKN/BiYG
         GCN3XFZy8vfQN6hWkJklC6vGE6GoxO35/n7efPkD55nY5gFxjUjEFoEKD10wEgkWUmV9
         3cotUBuobAlI4wFgjowmjF6HeQu+kWI9Ak/jxe3X/ZNf0EucykQA9JpnWzLcA5ianNpW
         QrjfPvPVgJTCPL0sxOIR1QgA7yL1EfJLaZtJxZqYtlPxb1k6ozpWivSCe5QeGl+9/d9w
         fGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764262396; x=1764867196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P4drWKEd4RAmd7MBRAIQVZy+ZqrpPhSLkolh9dDZECE=;
        b=NZjjmdLkMacbsr8/NkyMBPopgG+GUWXedqnDGriA67P6Mhgd37K2sXhIWpOy7J7a3M
         Xpv3tFoEKoXeIIoQU2ps93NrZN4oYd0p+w1m38/Bh1RQ6wSPtF0Htg3LpDTITQcboVqy
         HHG1vJptZpb1AXpmWsTUvSw6WLDpNPbNQg+FzAW6C9QhiUhrPO/nfBVyZI2JOvaXnBfg
         //nNUk/YZ4cNl7V6nwsEVRgyH4gw5O9+r5fVrdPuAkw/lC5LPE2GrUStj4py0u5E7GeC
         LKaKjqOAq87Oj0DWjZBhUO4Zl1zkaV1SgUikqnmicDQ63LhDW/jFQfPQvnb+mdD/mkBv
         lXTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbaUYPxJuyJFkL6ZVRkIC+b0/93OmGACUnMSrvg1IdI87eMCrxvLZOueElpA/ZyiaTOwWBORv2VxdK2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+qV57c/ZO9T+p8cscd2UYvqnmc+obH8AY3JrAxj3pv1B4WlxQ
	H0m/Ao5N+pPtIOF5l8ZuZqLolIilcxIiHFoy/V+LbcQqIKY9dwTfnJaP
X-Gm-Gg: ASbGncvB5M3GirIE3IaZPouD5ZhYrrsEkHPvkkSW1d5vx5Ijpss4FFAsQg8mQHrGJ+2
	16wZC4aGoSMryteJAtHdmB0TYC12wezpIJdBQNla3puwy+naofjx4S+xtmOci6oQ+0fs87PcEbs
	oIG853V/eRjEMWrPiZT27/ZhwKviFSZnh5eDqMiJzo2xa023/I0lgIz2kZ1Z9RJTS46+DXE1/q1
	/QX9RRxk+RwQxsF94waf5BWqkqSODnAVlf7X81oEYgc2yRHohMK/FU+03JeqP1Ydd4KsJFXorzD
	MAyFwE387ydvM3BgERfG1X04b2QQC1E2N6yhT67AZL69sXnkcWKawCz4RKbquQpRB++QyKtmPvu
	UgV1PhDWV9NslWJrg1yK8bXaIGRcDX90S1XloEo0HFkZyUSbnnBcZVA==
X-Google-Smtp-Source: AGHT+IH8j638xjzoDHoozqoJ+ZLnXS1T0OqZepwP8h1W2O745wvjvCM314d3621pAOHVbu+pSPoujA==
X-Received: by 2002:a05:6512:6d1:b0:595:9d26:f551 with SMTP id 2adb3069b0e04-596b529c014mr4240034e87.48.1764262395589;
        Thu, 27 Nov 2025 08:53:15 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa44058sm530323e87.60.2025.11.27.08.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:53:14 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 27 Nov 2025 17:53:13 +0100
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	John Stultz <jstultz@google.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH RFC] mm/vmap: map contiguous pages in batches whenever
 possible
Message-ID: <aSiB-UsunuE7u295@milan>
References: <20251122090343.81243-1-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251122090343.81243-1-21cnbao@gmail.com>

On Sat, Nov 22, 2025 at 05:03:43PM +0800, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> In many cases, the pages passed to vmap() may include
> high-order pages—for example, the systemheap often allocates
> pages in descending order: order 8, then 4, then 0. Currently,
> vmap() iterates over every page individually—even the pages
> inside a high-order block are handled one by one. This patch
> detects high-order pages and maps them as a single contiguous
> block whenever possible.
> 
> Another possibility is to implement a new API, vmap_sg().
> However, that change seems to be quite large in scope.
> 
> When vmapping a 128MB dma-buf using the systemheap,
> this RFC appears to make system_heap_do_vmap() 16× faster:
> 
> W/ patch:
> [   51.363682] system_heap_do_vmap took 2474000 ns
> [   53.307044] system_heap_do_vmap took 2469008 ns
> [   55.061985] system_heap_do_vmap took 2519008 ns
> [   56.653810] system_heap_do_vmap took 2674000 ns
> 
> W/o patch:
> [    8.260880] system_heap_do_vmap took 39490000 ns
> [   32.513292] system_heap_do_vmap took 38784000 ns
> [   82.673374] system_heap_do_vmap took 40711008 ns
> [   84.579062] system_heap_do_vmap took 40236000 ns
> 
> Cc: Uladzislau Rezki <urezki@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  mm/vmalloc.c | 49 +++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 0832f944544c..af2e3e8c052a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -642,6 +642,34 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  	return err;
>  }
>  
> +static inline int get_vmap_batch_order(struct page **pages,
> +		unsigned int stride,
> +		int max_steps,
> +		unsigned int idx)
> +{
> +	/*
> +	 * Currently, batching is only supported in vmap_pages_range
> +	 * when page_shift == PAGE_SHIFT.
> +	 */
> +	if (stride != 1)
> +		return 0;
> +
> +	struct page *base = pages[idx];
> +	if (!PageHead(base))
> +		return 0;
> +
> +	int order = compound_order(base);
> +	int nr_pages = 1 << order;
> +
> +	if (max_steps < nr_pages)
> +		return 0;
> +
> +	for (int i = 0; i < nr_pages; i++)
> +		if (pages[idx + i] != base + i)
> +			return 0;
> +	return order;
> +}
> +
>  /*
>   * vmap_pages_range_noflush is similar to vmap_pages_range, but does not
>   * flush caches.
> @@ -655,23 +683,32 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  		pgprot_t prot, struct page **pages, unsigned int page_shift)
>  {
>  	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> +	unsigned int stride;
>  
>  	WARN_ON(page_shift < PAGE_SHIFT);
>  
> +	/*
> +	 * Some users may allocate pages from high-order down to order 0.
> +	 * We roughly check if the first page is a compound page. If so,
> +	 * there is a chance to batch multiple pages together.
> +	 */
>  	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> -			page_shift == PAGE_SHIFT)
> +			(page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
>
Do we support __GFP_COMP as vmalloc/vmap flag? As i see from latest:

/*
 * See __vmalloc_node_range() for a clear list of supported vmalloc flags.
 * This gfp lists all flags currently passed through vmalloc. Currently,
 * __GFP_ZERO is used by BPF and __GFP_NORETRY is used by percpu. Both drm
 * and BPF also use GFP_USER. Additionally, various users pass
 * GFP_KERNEL_ACCOUNT. Xfs uses __GFP_NOLOCKDEP.
 */
#define GFP_VMALLOC_SUPPORTED (GFP_KERNEL | GFP_ATOMIC | GFP_NOWAIT |\
                               __GFP_NOFAIL |  __GFP_ZERO | __GFP_NORETRY |\
                               GFP_NOFS | GFP_NOIO | GFP_KERNEL_ACCOUNT |\
                               GFP_USER | __GFP_NOLOCKDEP)

Could you please clarify when PageCompound(pages[0]) returns true?

>  		return vmap_small_pages_range_noflush(addr, end, prot, pages);
>  
> -	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> -		int err;
> +	stride = 1U << (page_shift - PAGE_SHIFT);
> +	for (i = 0; i < nr; ) {
> +		int err, order;
>  
> -		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> +		order = get_vmap_batch_order(pages, stride, nr - i, i);
> +		err = vmap_range_noflush(addr, addr + (1UL << (page_shift + order)),
>  					page_to_phys(pages[i]), prot,
> -					page_shift);
> +					page_shift + order);
>  		if (err)
>  			return err;
>  
> -		addr += 1UL << page_shift;
> +		addr += 1UL  << (page_shift + order);
> +		i += 1U << (order + page_shift - PAGE_SHIFT);
>  	}
>  
>  	return 0;
> -- 
> 2.39.3 (Apple Git-146)
> 

