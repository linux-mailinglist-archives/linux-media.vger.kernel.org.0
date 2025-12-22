Return-Path: <linux-media+bounces-49350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 475BACD61E3
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 14:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00AAD3075473
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 13:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66482F12CB;
	Mon, 22 Dec 2025 13:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BScemfHq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3AF2F0C7E
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 13:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408944; cv=none; b=hLOWLtopIHzJ0RBmaJ2UMoyTxdDJdEmk1qy0si1aWOBCr5qeH3Wi8LNWSYJO/CMERbugNwmAGqEQ83Sd+q0gd3pYI5A22ef78eD7GER/3BOkDHJNY535eWrldEvDPhXhnBi5qzBhiE/LnpeoiDgmqfsqOpasU9EbIpFEKwCdj/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408944; c=relaxed/simple;
	bh=BWxLr1weDifKxuoKiuRn8B7wkUOXcwizFFSB7Cut1+0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/asCdDDO2OgrXGG97U83r8kbUr/u7XPNZ3ncWDEgIxCNDLo1OvtZtNWSjq4p0fiBzCE1vmhY3uMrULObjG7ebq/5WIdoEUd69isy2T8gm9AJtqCXq6JeGo4tp48vBNxRDZXNCQVc12GtvHMBDqT/qjMP1eynLz56cqHoqRt6Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BScemfHq; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5943d20f352so4318060e87.0
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 05:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766408939; x=1767013739; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TqkA3QTeqvfIHTaFJmrTviJUHc15iycYlD6ucgB4o6w=;
        b=BScemfHqEv+vyqZQP9PNXAQTsYZ66ix8sc6RNUkUrJmXQ1gaPoBSp+5gIWSdll9KrU
         qpI89JFvA4uHzZEcbBboZ2yaow2abJopE4v/h7J4tJ0PA+NUMiBnIp8FaZKZ4tGxef22
         ZEeIKmlPpQSAmUUdO+BBNLgrQdozfMFDwg2vCO6Dgkc6xCjkk0MPqbBzd57IbOZkGsWb
         haS3odRe+4CtihAUSjYH5v+gio+E/HGXFeBAUPXwm/U4H21nnEZpkQRRJ6cuin00hqr9
         e3AEJAiRB+rYgFd/+y1LGT/MAKEk3LT5hmQlOIlxlR1Aodj/V83LxFXx6sIP6c0gL0CS
         kKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408939; x=1767013739;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqkA3QTeqvfIHTaFJmrTviJUHc15iycYlD6ucgB4o6w=;
        b=j3WR9zJch62PPJzPmHXk6OhIeew02Pqtc1XQmWKnrVXr+HR50xA7UmgzZb97D8s/aJ
         nw7p4/bmrFoLsIfZureo/ZLjXqlSRcqYDsfeMTzN4cwNlK2L+b0W/99Gbe6Vth7NxDzi
         LMVVDmghyCYqik/Fxlf5G8lrxm69gjW4wuTdeIPlNMpuoSa69gILy2Pckrk9Pin2UTtn
         /9di6Ih8UAf5rsUlxlv7QaTnvrjj0svEY/y7bCLrs65H2uAdhiIzufmobM9EeQslC4nu
         BIj1RkKKyvpJAwqaqIK8n55yuy305aP9BnfcFQvn9IjZIUOswXIeof5nZi/rXN/m/bMB
         BmPg==
X-Forwarded-Encrypted: i=1; AJvYcCWNodkV/y7vACmsOx291VCRKaMOjC6RmPXclvaA56RO1Ad/SLcWu5a+4QoDVPDNb6ZwlQu9UrdlEozfQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj9DDBz8+NdCo0r10G0nTaHRREPZxFfi/+/BB22GEm+76yMpzA
	P8V1ifuCRbO5ocEXBakyUxOzcWQizDGAsB6Xf6nRKt4NFwnprDCfBuEX
X-Gm-Gg: AY/fxX66PvreRTccBqBOrhLj0IA594p62Xy84b7BhGSsU0NwTP5yKhqLv8Ic2I+Cy9E
	N2uK4C4jB7HS2uD1CGvic+8qlC4Bv8n3V5mBhXmr60nhi0MTxYnijYyPa+Jbnzv9/y4gWIXR03p
	b8u0WAqBXvsyjbv9a+IOwzmfSnSTEjx4ira7al7v1hM+aalIIh/30SukKbaJhoGsRKf5bXGY4fP
	fRr7V+R1EYxZ/mMEWJrEq6M00xFzin89KLJ1ERdwmyzMTxyYpdiWZMA+tpZul7ztc7M/vXSA14l
	JPs6irt61HUEL1b1YyFskaH90Bt1SiiZWxd7Kh/D4ppl6xKkVfLcf+fp80vjSbrwvGlh7MXyQB9
	UUVorOGy5PT6ph1CD2OCX6YdEwd1QclHQKzzPIzq/QKKiVBgeYIUw
X-Google-Smtp-Source: AGHT+IEoHaD9txNltw8AYIh3bvKWbd6Ld21Uc2hEUyNiNte2MbtG2FdcMNsmNf298a2tH2qY7Uf5Kw==
X-Received: by 2002:a05:6512:3f1a:b0:598:e39b:d628 with SMTP id 2adb3069b0e04-59a17d7271amr3858414e87.5.1766408939248;
        Mon, 22 Dec 2025 05:08:59 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f4e4sm3115532e87.83.2025.12.22.05.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:08:58 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 22 Dec 2025 14:08:56 +0100
To: Barry Song <21cnbao@gmail.com>
Cc: urezki@gmail.com, akpm@linux-foundation.org, david@kernel.org,
	dri-devel@lists.freedesktop.org, jstultz@google.com,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org, mripard@kernel.org,
	sumit.semwal@linaro.org, v-songbaohua@oppo.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap()
 whenever possible
Message-ID: <aUlC6N1jmDbMDPc5@milan>
References: <aUQHss6K8b_esvpw@milan>
 <20251218212436.17142-1-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218212436.17142-1-21cnbao@gmail.com>

On Fri, Dec 19, 2025 at 05:24:36AM +0800, Barry Song wrote:
> On Thu, Dec 18, 2025 at 9:55 PM Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Thu, Dec 18, 2025 at 02:01:56PM +0100, David Hildenbrand (Red Hat) wrote:
> > > On 12/15/25 06:30, Barry Song wrote:
> > > > From: Barry Song <v-songbaohua@oppo.com>
> > > >
> > > > In many cases, the pages passed to vmap() may include high-order
> > > > pages allocated with __GFP_COMP flags. For example, the systemheap
> > > > often allocates pages in descending order: order 8, then 4, then 0.
> > > > Currently, vmap() iterates over every page individually—even pages
> > > > inside a high-order block are handled one by one.
> > > >
> > > > This patch detects high-order pages and maps them as a single
> > > > contiguous block whenever possible.
> > > >
> > > > An alternative would be to implement a new API, vmap_sg(), but that
> > > > change seems to be large in scope.
> > > >
> > > > When vmapping a 128MB dma-buf using the systemheap, this patch
> > > > makes system_heap_do_vmap() roughly 17× faster.
> > > >
> > > > W/ patch:
> > > > [   10.404769] system_heap_do_vmap took 2494000 ns
> > > > [   12.525921] system_heap_do_vmap took 2467008 ns
> > > > [   14.517348] system_heap_do_vmap took 2471008 ns
> > > > [   16.593406] system_heap_do_vmap took 2444000 ns
> > > > [   19.501341] system_heap_do_vmap took 2489008 ns
> > > >
> > > > W/o patch:
> > > > [    7.413756] system_heap_do_vmap took 42626000 ns
> > > > [    9.425610] system_heap_do_vmap took 42500992 ns
> > > > [   11.810898] system_heap_do_vmap took 42215008 ns
> > > > [   14.336790] system_heap_do_vmap took 42134992 ns
> > > > [   16.373890] system_heap_do_vmap took 42750000 ns
> > > >
> > >
> > > That's quite a speedup.
> > >
> > > > Cc: David Hildenbrand <david@kernel.org>
> > > > Cc: Uladzislau Rezki <urezki@gmail.com>
> > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > Cc: John Stultz <jstultz@google.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Tested-by: Tangquan Zheng <zhengtangquan@oppo.com>
> > > > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > > > ---
> > > >   * diff with rfc:
> > > >   Many code refinements based on David's suggestions, thanks!
> > > >   Refine comment and changelog according to Uladzislau, thanks!
> > > >   rfc link:
> > > >   https://lore.kernel.org/linux-mm/20251122090343.81243-1-21cnbao@gmail.com/
> > > >
> > > >   mm/vmalloc.c | 45 +++++++++++++++++++++++++++++++++++++++------
> > > >   1 file changed, 39 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > > index 41dd01e8430c..8d577767a9e5 100644
> > > > --- a/mm/vmalloc.c
> > > > +++ b/mm/vmalloc.c
> > > > @@ -642,6 +642,29 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> > > >     return err;
> > > >   }
> > > > +static inline int get_vmap_batch_order(struct page **pages,
> > > > +           unsigned int stride, unsigned int max_steps, unsigned int idx)
> > > > +{
> > > > +   int nr_pages = 1;
> > >
> > > unsigned int, maybe
> 
> Right
> 
> > >
> > > Why are you initializing nr_pages when you overwrite it below?
> 
> Right, initializing nr_pages can be dropped.
> 
> > >
> > > > +
> > > > +   /*
> > > > +    * Currently, batching is only supported in vmap_pages_range
> > > > +    * when page_shift == PAGE_SHIFT.
> > >
> > > I don't know the code so realizing how we go from page_shift to stride too
> > > me a second. Maybe only talk about stride here?
> > >
> > > OTOH, is "stride" really the right terminology?
> > >
> > > we calculate it as
> > >
> > >       stride = 1U << (page_shift - PAGE_SHIFT);
> > >
> > > page_shift - PAGE_SHIFT should give us an "order". So is this a
> > > "granularity" in nr_pages?
> 
> This is the case where vmalloc() may realize that it has
> high-order pages and therefore calls
> vmap_pages_range_noflush() with a page_shift larger than
> PAGE_SHIFT. For vmap(), we take a pages array, so
> page_shift is always PAGE_SHIFT.
> 
> > >
> > > Again, I don't know this code, so sorry for the question.
> > >
> > To me "stride" also sounds unclear.
> 
> Thanks, David and Uladzislau. On second thought, this stride may be
> redundant, and it should be possible to drop it entirely. This results
> in the code below:
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 41dd01e8430c..3962bdcb43e5 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -642,6 +642,20 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  	return err;
>  }
>  
> +static inline int get_vmap_batch_order(struct page **pages,
> +		unsigned int max_steps, unsigned int idx)
> +{
> +	unsigned int nr_pages	 = compound_nr(pages[idx]);
> +
> +	if (nr_pages == 1 || max_steps < nr_pages)
> +		return 0;
> +
> +	if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
> +		return compound_order(pages[idx]);
> +	return 0;
> +}
> +
>



>  /*
>   * vmap_pages_range_noflush is similar to vmap_pages_range, but does not
>   * flush caches.
> @@ -658,20 +672,35 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  
>  	WARN_ON(page_shift < PAGE_SHIFT);
>  
> +	/*
> +	 * For vmap(), users may allocate pages from high orders down to
> +	 * order 0, while always using PAGE_SHIFT as the page_shift.
> +	 * We first check whether the initial page is a compound page. If so,
> +	 * there may be an opportunity to batch multiple pages together.
> +	 */
>  	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> -			page_shift == PAGE_SHIFT)
> +			(page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
>  		return vmap_small_pages_range_noflush(addr, end, prot, pages);
Hm.. If first few pages are order-0 and the rest are compound
then we do nothing.

>  
> -	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> +	for (i = 0; i < nr; ) {
> +		unsigned int shift = page_shift;
>  		int err;
>  
> -		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> +		/*
> +		 * For vmap() cases, page_shift is always PAGE_SHIFT, even
> +		 * if the pages are physically contiguous, they may still
> +		 * be mapped in a batch.
> +		 */
> +		if (page_shift == PAGE_SHIFT)
> +			shift += get_vmap_batch_order(pages, nr - i, i);
> +		err = vmap_range_noflush(addr, addr + (1UL << shift),
>  					page_to_phys(pages[i]), prot,
> -					page_shift);
> +					shift);
>  		if (err)
>  			return err;
>  
> -		addr += 1UL << page_shift;
> +		addr += 1UL  << shift;
> +		i += 1U << shift;
>  	}
>  
>  	return 0;
> 
> Does this look clearer?
> 
The concern is we mix it with a huge page mapping path. If we want to batch
v-mapping for page_shift == PAGE_SHIFT case, where "pages" array may contain 
compound pages(folio)(corner case to me), i think we should split it.

--
Uladzislau Rezki

