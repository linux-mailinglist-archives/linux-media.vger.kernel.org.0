Return-Path: <linux-media+bounces-24721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13489A1099F
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 15:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 230E8164E45
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 14:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BC1153BFC;
	Tue, 14 Jan 2025 14:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="D9TrP13C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B271684B0
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 14:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736865853; cv=none; b=LC+Bv2QDJtAOblmy4FoBOO9ZaVwERO/uXUOYnIQ/JKsbgAsJhTLjr/sBf0F4l0XzJTee+meztYd2dr4/9EF0L5otJ/OGMETignWiu+E+AvQkrvVXyiAvijkBUYNCmJDKIE63iuo3jHJTTczidZp3ixOJ0UMvxVVrLkOQEVjlKTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736865853; c=relaxed/simple;
	bh=tJBzY/+esHF2sg7h4j+gHu6DCf5brYAZN8wsp9y4Jvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kz1S37aKGsNKqxQ5jFFdk9KQE8+zEu57/9Pv+9UFL+iTGfTy9nO2zjap1LIgya7fBzJNS2zxvi0JnDXZ7Yg86bvCNntFh6xZElgLOOicF5GVG1S8+iB9/H+7N7jBvWkvNi/5CRJeRFg/OfNL23jCJRbyK5HiqSBY4uGtSNqc5V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=D9TrP13C; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d9f0a6ad83so2808207a12.2
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 06:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736865847; x=1737470647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ATFNgMzaw3+odlncdmVbwQjWHseefp7b7ULkUB6sipQ=;
        b=D9TrP13CAPTCLmyH8jV+Q049/Kn//XJgAmMizkx6C8C7z4muw7GZYs1RytdL96Fq/I
         bpGPnHYv/TLODNoYFoWCgtiXmjl/wXCzSbMnW7f2RWaN1n+4e1bOV/Xn2EBU0300bNxD
         sNLXKj4pmyZXGZZz5zkm4y51z4xo8pvNIikqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736865847; x=1737470647;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATFNgMzaw3+odlncdmVbwQjWHseefp7b7ULkUB6sipQ=;
        b=HluARnCEaIQieLfwxjhvukbVMoLxbsLYhaMEinOFmdIkLvtayVdl10LLJlmXelHjqp
         vfFj0jn7SwiHinw/4gzHngQ5IytudPc1yqzKy0M/07tFGxWk89rLutqhFPsf/yM8Xm6r
         JGJrqbHNVIXpwchKhMzQ2XNoFV8yXz1yFXyNde5CA6ELuJyeIoe4dMZO4F7pcsBCzAxR
         x7zCtidJfUnTE7M5mBJx8oOFNmq94lJ8fOwFLFQVpOAXz0A6ujyqS0nDxbtKgyOtlnWz
         6ZiRE9zkQwLgwZk55lv+tA+g/+7Ov3LSA/+E10GzgMWvROwS24z8gzBK2UYkDcU7eufr
         MNLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUna9s6n+6pD/9UxswAVOfSEYCgsMyfLWiRFBv86JRrIrl92shmb6rQhq66qYxCs62mc5P79uYpF9Dxig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCfsMCaZ4PyL3AQtk3iS5w28SSc8j3LhcFqd7MIjwuOK/fRLC9
	LoxvcwC2WN19Q665I8IurnmFldsJFsTfJ3X7jw8WBHnD50sIeMTMLaKUL5C0aGo=
X-Gm-Gg: ASbGncsbm+NUsImTqRN7TH0mhaWco+wFFe2UB+ZWWNvV9Td05jWEX4JZ9vzy1FRJrdX
	8Y4ZSFCBtE67rguv1GWU3XkHeDBbznWn5jdojLnAcMAX9Q/Kt7dSX7xtLbz/5GGMSv99eWEGEl8
	W9PISX73SW7ADiEwSE81HnJCELWWWNqPoIui5YmkuQJCXnfCjyZmj3yoNbMRENZkK6ZWp58lJQp
	f+bnMYxGp8H5+GLviHQo1Duw7TXTecMWUjuF1EmQ86rCa01X3n4ApdeobS9FwmMzuAK
X-Google-Smtp-Source: AGHT+IGAg6SbQyvl4hHoMLWiihnCnk4YJMHgw8ibbt0hblBqr0eHOCrKPtQvQh7P/3PbA4F//m55Iw==
X-Received: by 2002:a17:907:a48:b0:ab2:c1e2:1da9 with SMTP id a640c23a62f3a-ab2c1e22977mr2341583266b.51.1736865847270;
        Tue, 14 Jan 2025 06:44:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b2181sm636633966b.162.2025.01.14.06.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 06:44:06 -0800 (PST)
Date: Tue, 14 Jan 2025 15:44:04 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
Message-ID: <Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
References: <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
 <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <Z38FCOPE7WPprYhx@yilunxu-OptiPlex-7050>
 <Z4F2X7Fu-5lprLrk@phenom.ffwll.local>
 <20250110203838.GL5556@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110203838.GL5556@nvidia.com>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Fri, Jan 10, 2025 at 04:38:38PM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 10, 2025 at 08:34:55PM +0100, Simona Vetter wrote:
> 
> > So if I'm getting this right, what you need from a functional pov is a
> > dma_buf_tdx_mmap? Because due to tdx restrictions, the normal dma_buf_mmap
> > is not going to work I guess?
> 
> Don't want something TDX specific!
> 
> There is a general desire, and CC is one, but there are other
> motivations like performance, to stop using VMAs and mmaps as a way to
> exchanage memory between two entities. Instead we want to use FDs.
> 
> We now have memfd and guestmemfd that are usable with
> memfd_pin_folios() - this covers pinnable CPU memory.
> 
> And for a long time we had DMABUF which is for all the other wild
> stuff, and it supports movable memory too.
> 
> So, the normal DMABUF semantics with reservation locking and move
> notifiers seem workable to me here. They are broadly similar enough to
> the mmu notifier locking that they can serve the same job of updating
> page tables.

Yeah raw pfn is fine with me too. It might come with more "might not work
on this dma-buf" restrictions, but I can't think of a practical one right
now.

> > Also another thing that's a bit tricky is that kvm kinda has a 3rd dma-buf
> > memory model:
> > - permanently pinned dma-buf, they never move
> > - dynamic dma-buf, they move through ->move_notify and importers can remap
> > - revocable dma-buf, which thus far only exist for pci mmio resources
> 
> I would like to see the importers be able to discover which one is
> going to be used, because we have RDMA cases where we can support 1
> and 3 but not 2.
> 
> revocable doesn't require page faulting as it is a terminal condition.

Yeah this is why I think we should separate the dynamic from the revocable
use-cases clearly, because mixing them is going to result in issues.

> > Since we're leaning even more on that 3rd model I'm wondering whether we
> > should make it something official. Because the existing dynamic importers
> > do very much assume that re-acquiring the memory after move_notify will
> > work. But for the revocable use-case the entire point is that it will
> > never work.
> 
> > I feel like that's a concept we need to make explicit, so that dynamic
> > importers can reject such memory if necessary.
> 
> It strikes me as strange that HW can do page faulting, so it can
> support #2, but it can't handle a non-present fault?

I guess it's not a kernel issue, but userspace might want to know whether
this dma-buf could potentially nuke the entire gpu context. Because that's
what you get when we can't patch up a fault, which is the difference
between a recovable dma-buf and a dynamic dma-buf.

E.g. if a compositor gets a dma-buf it assumes that by just binding that
it will not risk gpu context destruction (unless you're out of memory and
everything is on fire anyway, and it's ok to die). But if a nasty client
app supplies a revocable dma-buf, then it can shot down the higher
priviledged compositor gpu workload with precision. Which is not great, so
maybe existing dynamic gpu importers should reject revocable dma-buf.
That's at least what I had in mind as a potential issue.

> > So yeah there's a bunch of tricky lifetime questions that need to be
> > sorted out with proper design I think, and the current "let's just use pfn
> > directly" proposal hides them all under the rug. 
> 
> I don't think these two things are connected. The lifetime model that
> KVM needs to work with the EPT, and that VFIO needs for it's MMIO,
> definately should be reviewed and evaluated.
> 
> But it is completely orthogonal to allowing iommufd and kvm to access
> the CPU PFN to use in their mapping flows, instead of the
> dma_addr_t.
> 
> What I want to get to is a replacement for scatter list in DMABUF that
> is an array of arrays, roughly like:
> 
>   struct memory_chunks {
>       struct memory_p2p_provider *provider;
>       struct bio_vec addrs[];
>   };
>   int (*dmabuf_get_memory)(struct memory_chunks **chunks, size_t *num_chunks);
> 
> This can represent all forms of memory: P2P, private, CPU, etc and
> would be efficient with the new DMA API.
> 
> This is similar to the structure BIO has, and it composes nicely with
> a future pin_user_pages() and memfd_pin_folios().

Since you mention pin here, I think that's another aspect of the revocable
vs dynamic question. Dynamic buffers are expected to sometimes just move
around for no reason, and importers must be able to cope.

For recovable exporters/importers I'd expect that movement is not
happening, meaning it's pinned until the single terminal revocation. And
maybe I read the kvm stuff wrong, but it reads more like the latter to me
when crawling through the pfn code.

Once we have the lifetime rules nailed then there's the other issue of how
to describe the memory, and my take for that is that once the dma-api has
a clear answer we'll just blindly adopt that one and done.

And currently with either dynamic attachments and dma_addr_t or through
fishing the pfn from the cpu pagetables there's some very clearly defined
lifetime and locking rules (which kvm might get wrong, I've seen some
discussions fly by where it wasn't doing a perfect job with reflecting pte
changes, but that was about access attributes iirc). If we add something
new, we need clear rules and not just "here's the kvm code that uses it".
That's how we've done dma-buf at first, and it was a terrible mess of
mismatched expecations.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

