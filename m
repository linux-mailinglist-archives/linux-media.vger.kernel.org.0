Return-Path: <linux-media+bounces-24882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C6BA15207
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 15:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D88D1162096
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 14:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E44B17A586;
	Fri, 17 Jan 2025 14:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="I9nC3yAP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC3F158858
	for <linux-media@vger.kernel.org>; Fri, 17 Jan 2025 14:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737124943; cv=none; b=jjjP5qiKPlRY7CuVcBMEVFBCYN14p9ygCWLp+YLsgkVeSqqsKpAeBwPrWIgvZlvS61T9frDRDxDhykggSUkgqAT0+2mx/S2FUQudsuS6Dlv+0+0EgEYT5yed3IbN0nZ/OiU/IXlOSLsMWDbk259KsIH4VwabLr94LXv45a5E5UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737124943; c=relaxed/simple;
	bh=jwi6a8f3gsj2mguyz/YQikPgquL4wOvJ/aPvkXnwZdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJSlL/6/MdYRbqGWwDfTXkAAd4fi08lOVkIyaMvZ5VE57HTF4mb07pdillfTTOBHb/f7qgf1Jg1R0fNBUZ3aTS6fsq1EKCWACHZl8tXVaESUlXAUemUB9CHtTXDVmGaTJlE2SN+7QTH/yt54jD3L1tij06NfhmTz2A4ubIdUFqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=I9nC3yAP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso20869905e9.1
        for <linux-media@vger.kernel.org>; Fri, 17 Jan 2025 06:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1737124939; x=1737729739; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vOyiy7rFa+fZCX1B+kcinTvPMKMqiU+uIoOM7Jp3fa0=;
        b=I9nC3yAP0M5JCPEpqCiQzRUbwt1lIP0ivNjvWgf7gvK/3avzyrdslDLPsg+UlGJgQE
         M0KWZiiiFhBGedKdGT+eawg+JJYNxR/lPw/BP04CtmckZGYvS/WkkdLjUPl4XuMa5fOy
         nhaPQye9LMMVi4gZeX1gtObWC20pvTDFUl4Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737124939; x=1737729739;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vOyiy7rFa+fZCX1B+kcinTvPMKMqiU+uIoOM7Jp3fa0=;
        b=scTCzmBKBU7PNJtYl4Vm8va20Mb8cozU7Pr3oitLBcQEqbCLoG9qrUPbGOX58gfl+g
         dO1Ejigspa8XAtnavqBeM/qAgOCMvZMI5KVZ2EBYXp2TqY/23KMoxZQK2uPU4u/DaXa9
         lbbGsjKpLOeypCS5hmHk+3mVFklB39n9EAhJAfKENYYArf1FTcCF482bvPtNyQEll7GY
         OAQJikz5MLJ++HuN9UQhjZhsOst0CEbpP9IOcHs4EPG6j5dm6ERc8kQ0t0sPzzGgHNvS
         BUFMKKAw5gqpU3hpA80hgiENG7DSRGAaH6jpUEmWJB5xkSO+ERrPGDX1OxuElDpXELg/
         5bgg==
X-Forwarded-Encrypted: i=1; AJvYcCXc9TLS6W38hEowichQfapVUxQju1QflcEv8sbO9s43Setf77UW4O6UNf2Qaxf9ILXPsmzLvn3tJ1ILKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrB18qFEbOYjNr2QFa1a+sW5RRyTc8SkrLgev9pCxj6mjDpmfb
	iz2Q+jvocA20Ghp64NgHx+1sdWL4FT7+Y0PKBQAuZlTLLT9APLr3F2Jbjd/vw/Y=
X-Gm-Gg: ASbGncsTKJvkVRGFnPajZGqTHly6HhDR4eA2d8WkXBEkl7Ns0nBySFi3gUqLYwnR8sh
	CdxDI6piUaDnqAJfwXzrflo4p4LjZhVJkTrldKK0e+Y+xkAynzGsVktK4fjf8uy9kkfOAGGK9pT
	AgGx79XLpva2Q6rhK5lnYSUbIz6d0+cGu2khaqJ8AKoSk6x2FVhvPsOn9pkwkSXqWBUD8PP/qMC
	DkK9O+7HmLa0+nUD5Y7KhrgmPpK6PeomcocCx+EHJU4qwFN4sYeqyYymykSsjzLZHeY
X-Google-Smtp-Source: AGHT+IHxPap8BX01LyIGTU1AEqlpVQWXx2beTFQEyS1P7fpRD3tWSHNYAjM0oXYB5BLI/yHWy1ejYw==
X-Received: by 2002:a05:600c:3b27:b0:434:fd15:3ac9 with SMTP id 5b1f17b1804b1-43891438051mr28828925e9.22.1737124939130;
        Fri, 17 Jan 2025 06:42:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ac5f9sm93712865e9.11.2025.01.17.06.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 06:42:17 -0800 (PST)
Date: Fri, 17 Jan 2025 15:42:15 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Xu Yilun <yilun.xu@linux.intel.com>,
	Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
	kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
	alex.williamson@redhat.com, vivek.kasireddy@intel.com,
	dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	lukas@wunner.de, yan.y.zhao@intel.com, leon@kernel.org,
	baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
	tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <Z4psR1qoNQUQf3Q2@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
	Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
	pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
	vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
	yilun.xu@intel.com, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
	leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
	tao1.su@intel.com
References: <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <Z38FCOPE7WPprYhx@yilunxu-OptiPlex-7050>
 <Z4F2X7Fu-5lprLrk@phenom.ffwll.local>
 <20250110203838.GL5556@nvidia.com>
 <Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local>
 <20250114173103.GE5556@nvidia.com>
 <Z4d4AaLGrhRa5KLJ@phenom.ffwll.local>
 <420bd2ea-d87c-4f01-883e-a7a5cf1635fe@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <420bd2ea-d87c-4f01-883e-a7a5cf1635fe@amd.com>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Wed, Jan 15, 2025 at 11:06:53AM +0100, Christian König wrote:
> Am 15.01.25 um 09:55 schrieb Simona Vetter:
> > > > If we add something
> > > > new, we need clear rules and not just "here's the kvm code that uses it".
> > > > That's how we've done dma-buf at first, and it was a terrible mess of
> > > > mismatched expecations.
> > > Yes, that would be wrong. It should be self defined within dmabuf and
> > > kvm should adopt to it, move semantics and all.
> > Ack.
> > 
> > I feel like we have a plan here.
> 
> I think I have to object a bit on that.
> 
> >   Summary from my side:
> > 
> > - Sort out pin vs revocable vs dynamic/moveable semantics, make sure
> >    importers have no surprises.
> > 
> > - Adopt whatever new dma-api datastructures pops out of the dma-api
> >    reworks.
> > 
> > - Add pfn based memory access as yet another optional access method, with
> >    helpers so that exporters who support this get all the others for free.
> > 
> > I don't see a strict ordering between these, imo should be driven by
> > actual users of the dma-buf api.
> > 
> > Already done:
> > 
> > - dmem cgroup so that we can resource control device pinnings just landed
> >    in drm-next for next merge window. So that part is imo sorted and we can
> >    charge ahead with pinning into device memory without all the concerns
> >    we've had years ago when discussing that for p2p dma-buf support.
> > 
> >    But there might be some work so that we can p2p pin without requiring
> >    dynamic attachments only, I haven't checked whether that needs
> >    adjustment in dma-buf.c code or just in exporters.
> > 
> > Anything missing?
> 
> Well as far as I can see this use case is not a good fit for the DMA-buf
> interfaces in the first place. DMA-buf deals with devices and buffer
> exchange.
> 
> What's necessary here instead is to give an importing VM full access on some
> memory for their specific use case.
> 
> That full access includes CPU and DMA mappings, modifying caching
> attributes, potentially setting encryption keys for specific ranges etc....
> etc...
> 
> In other words we have a lot of things the importer here should be able to
> do which we don't want most of the DMA-buf importers to do.

This proposal isn't about forcing existing exporters to allow importers to
do new stuff. That stays as-is, because it would break things.

It's about adding yet another interface to get at the underlying data, and
we have tons of those already. The only difference is that if we don't
butcher the design, we'll be able to implement all the existing dma-buf
interfaces on top of this new pfn interface, for some neat maximal
compatibility.

But fundamentally there's never been an expectation that you can take any
arbitrary dma-buf and pass it any arbitrary importer, and that is must
work. The fundamental promise is that if it _does_ work, then
- it's zero copy
- and fast, or as fast as we can make it

I don't see this any different than all the much more specific prposals
and existing code, where a subset of importers/exporters have special
rules so that e.g. gpu interconnect or vfio uuid based sharing works.
pfn-based sharing is just yet another flavor that exists to get the max
amount of speed out of interconnects.

Cheers, Sima

> 
> The semantics for things like pin vs revocable vs dynamic/moveable seems
> similar, but that's basically it.
> 
> As far as I know the TEE subsystem also represents their allocations as file
> descriptors. If I'm not completely mistaken this use case most likely fit's
> better there.
> 
> > I feel like this is small enough that m-l archives is good enough. For
> > some of the bigger projects we do in graphics we sometimes create entries
> > in our kerneldoc with wip design consensus and things like that. But
> > feels like overkill here.
> > 
> > > My general desire is to move all of RDMA's MR process away from
> > > scatterlist and work using only the new DMA API. This will save *huge*
> > > amounts of memory in common workloads and be the basis for non-struct
> > > page DMA support, including P2P.
> > Yeah a more memory efficient structure than the scatterlist would be
> > really nice. That would even benefit the very special dma-buf exporters
> > where you cannot get a pfn and only the dma_addr_t, altough most of those
> > (all maybe even?) have contig buffers, so your scatterlist has only one
> > entry. But it would definitely be nice from a design pov.
> 
> Completely agree on that part.
> 
> Scatterlist have a some design flaws, especially mixing the input and out
> parameters of the DMA API into the same structure.
> 
> Additional to that DMA addresses are basically missing which bus they belong
> to and details how the access should be made (e.g. snoop vs no-snoop
> etc...).
> 
> > Aside: A way to more efficiently create compressed scatterlists would be
> > neat too, because a lot of drivers hand-roll that and it's a bit brittle
> > and kinda silly to duplicate. With compressed I mean just a single entry
> > for a contig range, in practice thanks to huge pages/folios and allocators
> > trying to hand out contig ranges if there's plenty of memory that saves a
> > lot of memory too. But currently it's a bit a pain to construct these
> > efficiently, mostly it's just a two-pass approach and then trying to free
> > surplus memory or krealloc to fit. Also I don't have good ideas here, but
> > dma-api folks might have some from looking at too many things that create
> > scatterlists.
> 
> I mailed with Christoph about that a while back as well and we both agreed
> that it would probably be a good idea to start defining a data structure to
> better encapsulate DMA addresses.
> 
> It's just that nobody had time for that yet and/or I wasn't looped in in the
> final discussion about it.
> 
> Regards,
> Christian.
> 
> > -Sima

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

