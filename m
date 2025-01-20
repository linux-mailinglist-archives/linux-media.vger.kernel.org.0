Return-Path: <linux-media+bounces-25001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE7A172CF
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 19:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 153E91889CEA
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 18:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0640E1EF09E;
	Mon, 20 Jan 2025 18:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="bCSHGC2Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E771EBFE4
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 18:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737399031; cv=none; b=KfHE9r2S4Cnoa4vkwFqqE/4vbEbj6X4MejCcAH7Vj+7fxM9VHu0LWMdRNK8ta+ypwE+IvFu0KrQLs50tFP319UeM7XA9q1pLHae3vs0V6oXfVxjvjcajFrIJ0fCJBXmi1unTbEIYG+AdkwDzIaty9rOz5v+c9UD0TadEUO+vD6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737399031; c=relaxed/simple;
	bh=gH+/yH5PomSVw4Eqx+X6E6ARHBT7LFldg9HlahSg6Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8QkcAvq1Y9S2B+aGNBSrh3o8friPd4SV2P1hxSLnAoFZJUkybwnJAvq5pAUEa5q9lGak/R8WcZRbNfB5nKOVAGvdaJYlgDpNyx8ECQt67uJIRpjtNpRX7EIrQ5sJaREHEl4prMdc5bVpFENkePoaZx/kkmJbmwEqV9nne8wyVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=bCSHGC2Y; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43635796b48so30855965e9.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 10:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1737399028; x=1738003828; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qZ5I25nXxorzyP9a1rYiSiq8XLhpMUNivxKNu902PwI=;
        b=bCSHGC2Y0IAKNOCohJ8HNx6xK5mAInwMivHXDwRNvdaQOGR77zYIaYGM8fl3PiRE81
         wfPN3Q9tkB9RuB402RfLXdTDaNSYQn14mk002l5y/7Km029j6zPjNQoHPLhexD5uqpXb
         j3ev0X/EWPSu/7Mg1wUm21NMs2l+C9jtQcwD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737399028; x=1738003828;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZ5I25nXxorzyP9a1rYiSiq8XLhpMUNivxKNu902PwI=;
        b=WGfRAKZQ7J0jY3pvakchtYBqZyqP05p3nWbi31l4tVzVm3GQhlROT9hSLKhCrgSeSp
         YHEmYKJZmY8CJWxxXyyP9Gw9EvdLqH6YJFfCR9KIEjZ5VYs5CCiNDz0CEu/B8ur0SGzG
         sjqzYvhcCeyk7PRX7HrRgfB9NSC9YrZM3Dv1wMZm7L0Rou7vzkPrvMnW6b1U91basPGg
         R5tOt0lUsiuDLCezymu8lqW21b/2A1xdjUVxePY0paZxWkAVyKZXwJXy3IacXiuL6ZSp
         SVdXIdtjtk2EzxrmIheXcqw/Sv2cUJ97BtM8fuBnO/lwjfiLArR3QySoFTA/uPJ1QRcP
         vQkw==
X-Forwarded-Encrypted: i=1; AJvYcCUcN7IIh4VhWt1xeSI6M47Ljw9gllu4BvWKV//FHZYzCBzvQfJ8OeDP2CKvKd9gSegQlY3f0KLcY3HgHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyytACqo/QnXPrsO8dQYVPLmqVttOTFZvaWwPGodcrcfCb2TqyF
	ugHl+1kMHh6dOOMCAOdzyAL2yD8gEyRoCv3ypcKKsyT8Flt5cvbstc8rR3+JEEw=
X-Gm-Gg: ASbGncsYFds/x4pAgASPJ4kYjVG8rBSMmX4RYr0GRIVkgTZsJGT6TZYD/GuwOIB4PCm
	zjpZicMoVpbDYL5MYlx3u+orIkVHaVpXv5MGuRa7978Z6Cz2QlmPZ40wiDLN6nb7dybnvdxx9yd
	QbObJYztorvD9TpCXwwQMZO2N/49Gzm6KpsGAYq3Wr1db8ca9wp7mJ+1CZ7a7TkFNDRcighb6tB
	kZPpZJHxsV+PArjitGDh2W/AucRAxA19YRQOikMew5Cxevk3808rKUzoZTi5iFb8R4StUHAMSjy
	Ypv3/A==
X-Google-Smtp-Source: AGHT+IEZojpmzfvMT2hfTPH4ZLTtJkJ5pLgvdGLdVUaEOM0ByU86X8fHNcSUOFOwb7Pp5m0VSvdIvg==
X-Received: by 2002:a05:600c:4fd6:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-43891822024mr117541525e9.0.1737399027348;
        Mon, 20 Jan 2025 10:50:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046bab0sm147061795e9.38.2025.01.20.10.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 10:50:26 -0800 (PST)
Date: Mon, 20 Jan 2025 19:50:23 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
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
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <Z46a7y02ONFZrS8Y@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
References: <Z38FCOPE7WPprYhx@yilunxu-OptiPlex-7050>
 <Z4F2X7Fu-5lprLrk@phenom.ffwll.local>
 <20250110203838.GL5556@nvidia.com>
 <Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local>
 <20250114173103.GE5556@nvidia.com>
 <Z4d4AaLGrhRa5KLJ@phenom.ffwll.local>
 <420bd2ea-d87c-4f01-883e-a7a5cf1635fe@amd.com>
 <Z4psR1qoNQUQf3Q2@phenom.ffwll.local>
 <c10ae58f-280c-4131-802f-d7f62595d013@amd.com>
 <20250120175901.GP5556@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250120175901.GP5556@nvidia.com>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Mon, Jan 20, 2025 at 01:59:01PM -0400, Jason Gunthorpe wrote:
> On Mon, Jan 20, 2025 at 01:14:12PM +0100, Christian König wrote:
> What is going wrong with your email? You replied to Simona, but
> Simona Vetter <simona.vetter@ffwll.ch> is dropped from the To/CC
> list??? I added the address back, but seems like a weird thing to
> happen.

Might also be funny mailing list stuff, depending how you get these. I
read mails over lore and pretty much ignore cc (unless it's not also on
any list, since those tend to be security issues) because I get cc'ed on
way too much stuff for that to be a useful signal.

> > Please take another look at what is proposed here. The function is called
> > dma_buf_get_pfn_*unlocked* !
> 
> I don't think Simona and I are defending the implementation in this
> series. This series needs work.

Yeah this current series is good for kicking off the discussions, it's
defo not close to anything we can merge.

> We have been talking about what the implementation should be. I think
> we've all been clear on the idea that the DMA buf locking rules should
> apply to any description of the memory, regardless of if the address
> are CPU, DMA, or private.
> 
> I agree that the idea of any "get unlocked" concept seems nonsensical
> and wrong within dmabuf.
> 
> > Inserting PFNs into CPU (or probably also IOMMU) page tables have a
> > different semantics than what DMA-buf usually does, because as soon as the
> > address is written into the page table it is made public.
> 
> Not really.
> 
> The KVM/CPU is fully compatible with move semantics, it has
> restartable page faults and can implement dmabuf's move locking
> scheme. It can use the resv lock, the fences, move_notify and so on to
> implement it. It is a bug if this series isn't doing that.

Yeah I'm not worried about cpu mmap locking semantics. drm/ttm is a pretty
clear example that you can implement dma-buf mmap with the rules we have,
except the unmap_mapping_range might need a bit fudging with a separate
address_space.

For cpu mmaps I'm more worried about the arch bits in the pte, stuff like
caching mode or encrypted memory bits and things like that. There's
vma->vm_pgprot, but it's a mess. But maybe this all is an incentive to
clean up that mess a bit.

> The iommu cannot support move semantics. It would need the existing
> pin semantics (ie we call dma_buf_pin() and don't support
> move_notify). To work with VFIO we would need to formalize the revoke
> semantics that Simona was discussing.

I thought iommuv2 (or whatever linux calls these) has full fault support
and could support current move semantics. But yeah for iommu without
fault support we need some kind of pin or a newly formalized revoke model.

> We already implement both of these modalities in rdma, the locking API
> is fine and workable with CPU pfns just as well.
> 
> I've imagined a staged flow here:
> 
>  1) The new DMA API lands
>  2) We improve the new DMA API to be fully struct page free, including
>     setting up P2P
>  3) VFIO provides a dmbuf exporter using the new DMA API's P2P
>     support. We'd have to continue with the scatterlist hacks for now.
>     VFIO would be a move_notify exporter. This should work with RDMA
>  4) RDMA works to drop scatterlist from its internal flows and use the
>     new DMA API instead.
>  5) VFIO/RDMA implement a new non-scatterlist DMABUF op to
>     demonstrate the post-scatterlist world and deprecate the scatterlist
>     hacks.
>  6) We add revoke semantics to dmabuf, and VFIO/RDMA implements them
>  7) iommufd can import a pinnable revokable dmabuf using CPU pfns
>     through the non-scatterlist op.
>  8) Relevant GPU drivers implement the non-scatterlist op and RDMA
>     removes support for the deprecated scatterlist hacks.

Sounds pretty reasonable as a first sketch of a proper plan. Of course
fully expecting that no plan ever survives implementation intact :-)

Cheers, Sima

> 
> Xu's series has jumped ahead a bit and is missing infrastructure to
> build it properly.
> 
> Jason

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

