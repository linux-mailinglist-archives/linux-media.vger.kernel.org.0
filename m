Return-Path: <linux-media+bounces-52035-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLF9Ng7CgGksBgMAu9opvQ
	(envelope-from <linux-media+bounces-52035-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:26:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABE4CE30C
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC9E53133440
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 15:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5938737AA95;
	Mon,  2 Feb 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F0/Ye8Ej";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qqz2/PXO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C22B37475B
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045541; cv=none; b=e7InmwQekQ840xQjbngHyTEKT3/mrICFBCFeSZ43P74ar8MkpKY6jfTnh8s28RVBYeeQGlXXCxNWBMF4Jk3jiq/7q/4GOWQFGdc3i4TawovutChfBCQpwUI28jR+9Rj0bBWqjIHL07aLYyfFFB7lj+iOIjMjhTzi5lYoe/UaTy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045541; c=relaxed/simple;
	bh=D0/NVhS//i0LKf6hyciVN+qtrVAfDmdrxWdqjeDWXdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFbaSAgaVIVdh6C13HSVe0eEIbmzBjxEIGFewkGRg8Ci5SlzPOEQJeM4u6EUR6OpDBtatYSl7gTSrcrIe7UzTvSd/wOCHGITw3Na9Bmz0YK0RN6pQf66VISO92tWc+Pp9iu0FRy9+4OAqh0w/tbuUKe21IhkIAoeJ4w9XQ8e4ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F0/Ye8Ej; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qqz2/PXO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770045539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IAa9rUiFokLsL02HcrzVefKkv/ss8oRA4iFHEcIfETc=;
	b=F0/Ye8EjUKKSKLs9yRdwhW/Ma4euQJz+NZNlz8O0P/YD1plWvnCpwRgZUqE9sHW2n7b7DO
	TL5jQQmthTwe5lit4fWfeU0Khp1gDsiyTtHZSaJ4qhxk8wairNOasIquqM+Acv8KOwof8H
	9XvbfaV8f50nkdu2rEKfxp5ear9uUp8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-Zh8_3a3TNMyng5UVsXhjRQ-1; Mon, 02 Feb 2026 10:18:57 -0500
X-MC-Unique: Zh8_3a3TNMyng5UVsXhjRQ-1
X-Mimecast-MFC-AGG-ID: Zh8_3a3TNMyng5UVsXhjRQ_1770045536
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a344b86f7so192318136d6.0
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 07:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770045536; x=1770650336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IAa9rUiFokLsL02HcrzVefKkv/ss8oRA4iFHEcIfETc=;
        b=Qqz2/PXO5k/Z2oSQIaPIhDeEIEei25QeTuUAIgznQ9GBu1JGuO2NDvrfzMIdqna4IV
         c9o1NE4Mx4dHdshWXhef3j4wunafh0dHaIliyy5YEVhuFjSASe9R/DPiA8XUp8UjoJz5
         ZDL689ls7ddUXpdTdUYcIwKq5UqQ80B8P0Hif/BlnnH9u6sBMswZItM+5OEJkusKt43J
         gP6Pat8JlYLCZfedfFiZU1IN5lL1HKuk62lMHWDu4TxHchw9qfFTeX1F/E8KYgv9+gyJ
         DswSGSUnUQ4YY8xeR73p8EHMQDmM/24pSnFdQWegau1/vgUoiOg6MjsylMbpOfOd69p2
         y0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045536; x=1770650336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAa9rUiFokLsL02HcrzVefKkv/ss8oRA4iFHEcIfETc=;
        b=gRGQ5gAWDMKLw2nJcLs+6t/+79L97X1H8MAQbdtIrzGsJvPic91GtHLldMQLuaVf5P
         Vyx3yXa3lNPuDSRpn/XyCfPwb1QQT0hYpeNoJnWg/Rp+a4JqkUS/SOmaLTaauxA2eRoC
         CUs0aAtXTkAK1N1AeZwOHi5UWryy8AlrK9K7wmSzFLPQMty6NnFRUrPbKd3Af4um0H45
         Ql8hfOkQ0vJyrgv3zcGePt4b6pAyPe1sxsEKTNTBW7WQbUgX9p4zLiyKvwjupEe/4HWj
         4NqF2E6Q+EpgBheIxxM8eGI9X0g7S8A5XwRWgMN9udsayZi1oeu3nwW320uiaLG6JZA3
         0S2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9P6liX17zHtsWSTntA7lm2qwuxodrvRe8hZmPPrklllFR02M5yaHMVPL6SpxKIPhYSRoYsKtq6nxxgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhCwd4AA/TZ+Y7ciNi2VYK8i23Xbw9NMtjjYbbcKI3mWqVr27f
	gvzXpzMmUdaIyuLs/s+gf4AnhsOIZoOeh9SvO8apMVOv4mvcpviHuoGOJnEgh2+g993lxT3TcQi
	qbhn7DfzyoxsicpWTLB/hXYmjM9soVTlXV/4fHCFluATkiKdP5kW5buI/Zql/rCH7
X-Gm-Gg: AZuq6aLpytLmgfQ0F7d2aDWUcz3HK+b3dzuCVKuvHVQ29XahwOmIF9DhELCt6BmeSVX
	smfl7qkJFjxdCldNP7zWDeyxwB3b1z5ovAUjx0JpZjXkqMTb3lC6bYKGCWuGn7FIsSjN3jhFrlo
	6/AeZqmN26i70RTXAHUq1True3H+ixkpGHxpe2+/fTuq0y8fMcvc8dKc9jRy44KBpyAKcSMZ5SR
	8ZGqK8BlYmSa9s0xLMOuqERA4NeKSVmK9au8uo0Iiw87Nj2x5PQ9pvr5FPSb62SOp2iTRu5+/sv
	BiTpteMpB7XiXYkKBQce8X6qIlJJa09YfSys4duFDmvThs1Q8FAHWOMCFyq4ZqC4IY9OAvTf6QN
	90Us9n70nx9nQ42b+m7KSddtMydf0hbN+YiVn1RTg2aueT0VZmvI=
X-Received: by 2002:a05:6214:764:b0:894:2cf7:7171 with SMTP id 6a1803df08f44-894e9f79920mr169707596d6.28.1770045536378;
        Mon, 02 Feb 2026 07:18:56 -0800 (PST)
X-Received: by 2002:a05:6214:764:b0:894:2cf7:7171 with SMTP id 6a1803df08f44-894e9f79920mr169706896d6.28.1770045535786;
        Mon, 02 Feb 2026 07:18:55 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net. [100.17.19.56])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711b7c7besm1249530285a.2.2026.02.02.07.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:18:55 -0800 (PST)
Date: Mon, 2 Feb 2026 10:18:54 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH] dma-buf: heaps: cma: register a dmem region for each cma
 heap
Message-ID: <aYC1rNKBTpxE-Llm@fedora>
References: <20260130-dmabuf-heap-cma-dmem-v1-1-3647ea993e99@redhat.com>
 <20260202-wealthy-quick-cow-8c5421@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-wealthy-quick-cow-8c5421@houat>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52035-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[echanude@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7ABE4CE30C
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 11:12:37AM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Jan 30, 2026 at 05:55:30PM -0500, Eric Chanudet wrote:
> > The cma dma-buf heaps let userspace allocate buffers in CMA regions
> > without enforcing limits. Register a dmem region per cma heap and charge
> > against it when allocating a buffer in a cma heap.
> > 
> > For the default cma region, two heaps may be created for the same cma
> > range:
> > commit 854acbe75ff4 ("dma-buf: heaps: Give default CMA heap a fixed name")
> >   Introduced /dev/dma_heap/default_cma_region
> > commit 4f5f8baf7341 ("dma-buf: heaps: cma: Create CMA heap for each CMA
> >                       reserved region")
> >   Created a CMA heap for each CMA region, which might create a duplicate
> >   heap to the default one, e.g:
> >     /dev/dma_heap/default_cma_region
> >     /dev/dma_heap/reserved
> > 
> > Removing the legacy heap would break user API. So handle the special
> > case by using one dmem between the two heaps to account charges
> > correctly.
> > 
> > Signed-off-by: Eric Chanudet <echanude@redhat.com>
> > ---
> > In continuation with introducing cgroup for the system heap[1], this
> > behavior is enabled based on dma_heap.mem_accounting, disabled by
> > default.
> > 
> > dmem is chosen for CMA heaps as it allows limits to be set for each
> > region backing each heap. There is one caveat for the default cma range
> > that may accessible through two different cma heaps, which is treated as
> > a special case.
> > 
> > [1] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com/
> > ---
> >  drivers/dma-buf/heaps/cma_heap.c | 51 ++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 46 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > index 49cc45fb42dd7200c3c14384bcfdbe85323454b1..608af8ad6bce7fe0321da6d8f1b65a69f5d8d950 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -27,6 +27,7 @@
> >  #include <linux/scatterlist.h>
> >  #include <linux/slab.h>
> >  #include <linux/vmalloc.h>
> > +#include <linux/cgroup_dmem.h>
> >  
> >  #define DEFAULT_CMA_NAME "default_cma_region"
> >  
> > @@ -46,7 +47,9 @@ int __init dma_heap_cma_register_heap(struct cma *cma)
> >  struct cma_heap {
> >  	struct dma_heap *heap;
> >  	struct cma *cma;
> > +	struct dmem_cgroup_region *cg;
> >  };
> > +static struct dmem_cgroup_region *default_cma_cg;
> >  
> >  struct cma_heap_buffer {
> >  	struct cma_heap *heap;
> > @@ -58,6 +61,7 @@ struct cma_heap_buffer {
> >  	pgoff_t pagecount;
> >  	int vmap_cnt;
> >  	void *vaddr;
> > +	struct dmem_cgroup_pool_state *pool;
> >  };
> >  
> >  struct dma_heap_attachment {
> > @@ -276,6 +280,7 @@ static void cma_heap_dma_buf_release(struct dma_buf *dmabuf)
> >  	kfree(buffer->pages);
> >  	/* release memory */
> >  	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
> > +	dmem_cgroup_uncharge(buffer->pool, buffer->len);
> >  	kfree(buffer);
> >  }
> >  
> > @@ -319,9 +324,16 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
> >  	if (align > CONFIG_CMA_ALIGNMENT)
> >  		align = CONFIG_CMA_ALIGNMENT;
> >  
> > +	if (mem_accounting) {
> > +		ret = dmem_cgroup_try_charge(cma_heap->cg, size,
> > +					     &buffer->pool, NULL);
> > +		if (ret)
> > +			goto free_buffer;
> > +	}
> >
> >  	cma_pages = cma_alloc(cma_heap->cma, pagecount, align, false);
> >  	if (!cma_pages)
> > -		goto free_buffer;
> > +		goto uncharge_cgroup;
> >  
> >  	/* Clear the cma pages */
> >  	if (PageHighMem(cma_pages)) {
> > @@ -376,6 +388,8 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
> >  	kfree(buffer->pages);
> >  free_cma:
> >  	cma_release(cma_heap->cma, cma_pages, pagecount);
> > +uncharge_cgroup:
> > +	dmem_cgroup_uncharge(buffer->pool, size);
> 
> Should we make that conditional on mem_accounting == true ?
> 
> >  free_buffer:
> >  	kfree(buffer);
> >  
> > @@ -390,25 +404,52 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
> >  {
> >  	struct dma_heap_export_info exp_info;
> >  	struct cma_heap *cma_heap;
> > +	struct dmem_cgroup_region *region;
> > +	int ret;
> >  
> >  	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
> >  	if (!cma_heap)
> >  		return -ENOMEM;
> >  	cma_heap->cma = cma;
> >  
> > +	/*
> > +	 * If two heaps are created for the default cma region, use the same
> > +	 * dmem for them. They both use the same memory pool.
> > +	 */
> > +	if (dev_get_cma_area(NULL) == cma && default_cma_cg)
> > +		region = default_cma_cg;
> > +	else {
> > +		region = dmem_cgroup_register_region(cma_get_size(cma), "cma/%s", name);
> > +		if (IS_ERR(region)) {
> > +			ret = PTR_ERR(region);
> > +			goto free_cma_heap;
> > +		}
> > +	}
> > +	cma_heap->cg = region;
> > +
> 
> I'm not sure it's the best way to go with this. We want to track all
> relevant CMA allocations going forward, in the heaps and elsewhere.
> 
> If we were to do what you suggest, an allocation in, say, DRM or v4l2
> wouldn't be tracked in the same region than one in the heaps, while we
> want to have it cumulated.
> 
> I think we'd be better off if we created a dmem region for each CMA
> region in the system, but we would charge from the heap so we don't
> account for every allocation.

That makes more sense. I will do that in a v2.

> I don't think we can register the dmem region when the CMA area is
> initialized though, since it will probably be too early in the kernel
> boot and SLAB isn't around yet.
> 
> But since we would need an accessor to get a dmem region from a cma
> region, we could do something like check if a dmem eregion already
> exists for that cma region, and allocate one otherwise. Or have a
> secondary initcall to allocate all dmem regions.

In an earlier series[1], you did this during cma_activate_area(),
core_initcall is late enough, so I can start from this in your series.

[1] https://lore.kernel.org/all/20250310-dmem-cgroups-v1-1-2984c1bc9312@kernel.org/

> 
> Maxime



-- 
Eric Chanudet


