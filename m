Return-Path: <linux-media+bounces-24751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9F6A11C9D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 09:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2072E1885954
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 08:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4411FBCBF;
	Wed, 15 Jan 2025 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="cJYuZTcw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169CA1DE3D9
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736931336; cv=none; b=lHeffXRWrcbqwndaFAkfLcAP2G+x8kgIhxnRlTn78ncx+oclQf+3FE6Q6SViWaFNLGsPQcqWqbVNKQz4uRbvYyEpGlQdB5gMBVMLrBourrn74s9yxaiqDTf5a9NplFdlFB3EF2Hj4/vcijvJj1mGpQJAKCPX8FyNYJkjmVHv0kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736931336; c=relaxed/simple;
	bh=BXhjUNiK5nZtNWfmxo4QzngJqamzCvQrhXA93RWRduc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbwqxi2uDMvXzxJ8bZ6+kfydBd2StNho6CzZgRkIZxcLjPyfOZ4QH7QJLH4ZM6SPjsgq1g758NGUWmZdkdshoSvFpCWFwzT8wBO9Zr9CK+hw1SAHGetWU4+M3z0fwmVbb5GG4ZWzEEt98RRBDpk+vyHTg8Y66tbr17JHbOFgxtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=cJYuZTcw; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385e06af753so3241702f8f.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 00:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736931332; x=1737536132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gj9RZudEPBfF7kw5HyEDfCpQN04hIW75RUFgQLeb7IY=;
        b=cJYuZTcwVQL8oM7NicjGZfqJJnE+UNDjda4OHBc4lwSeOp60jz9JqiOP+pJ/FnqvXa
         CITYq6sYERvkemt6ocXPfEhxcYOKns4/q1VzIrzFVhAYM702GzT3x4FBksXO4945z0qz
         Fg8vcpvGbBukF5wiY1mBHmwPxSRcdpPXuxG6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736931332; x=1737536132;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj9RZudEPBfF7kw5HyEDfCpQN04hIW75RUFgQLeb7IY=;
        b=QvUo+T1kj05zz2+kSUFL34iwIegBuwF0UDeeB3spkPVHpGwla6KCqql8OAIeHpBRaB
         3CaDV57Thc0cv+V6ogPIIfoNdHlsY67D22XB6gXX0RFkATf7w/W3wdFRyT0BFt7gkiGN
         fiJIzUg3KrDGjigwmj80cDmm94EcwqS3dOkwEmlUHYgCaCkWm2UpAJOp365HW00ZJaC9
         dRiPDgwy0Wn0tylXG8b0yJwEP4zR4ECYvkBy28C6/3I4AIUAOYe+qyb0ZPqRGrzIUJ0o
         XBZuykB6rpVgbKJ4b2J+Hed6lua6DmSXBbA73Y2ohOn/K+M9uqKU845qOR09rN1WbUUv
         5oFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCMoSSgtlC7jsGUI+XBWm9ntRwiLC87hNyvfFOkbe4xxCwaPshrmIkAYQ115je5wsYajWwgIfgTQRmIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz68IGOFItKvG7w575DPKyJU1IuZpISqXwrbPB1LcDMv9Umh4m7
	R0k1XjPjmCd9pSMpeHFsasRM8raiLz5/gCChp5VV6nQSXSmDShk3z31axpNYgso=
X-Gm-Gg: ASbGncu56r25cps+uImDQJr0iFhoY1/h257mauzzjt1J4UERJ1pjpt7ho+r8LeSMgoX
	PZUoJwzwJc67EFe/v3+J1CYACDH6o7iHJ8r35nArYPEYVqJcxwQxL9yjI05lmqVmEdNvDEoTBxx
	V9TWbJCL1Orw92MRuX2lGdALLObkKCLxBdg0y2MF0zGIUhLJZREqNNhMAG0yjOo/+B/PzyLLR0a
	ooQCX9y/D3U1xJjY/Xncui/1V33cByNzvLeMpMiGl+zirBB6GdDjaMVElKIaYXnkXrJ
X-Google-Smtp-Source: AGHT+IFOU+JNTbuMjFC41rceTL+ifkq6PY4kVtqWW8pLQ7ONLhbzAQHBNa3COq6SYahEjPbUlsy+jA==
X-Received: by 2002:adf:ab01:0:b0:38a:5a37:4a46 with SMTP id ffacd0b85a97d-38a87303f80mr15973078f8f.17.1736931332197;
        Wed, 15 Jan 2025 00:55:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499884sm15964335e9.5.2025.01.15.00.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:55:31 -0800 (PST)
Date: Wed, 15 Jan 2025 09:55:29 +0100
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
Message-ID: <Z4d4AaLGrhRa5KLJ@phenom.ffwll.local>
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
References: <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
 <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <Z38FCOPE7WPprYhx@yilunxu-OptiPlex-7050>
 <Z4F2X7Fu-5lprLrk@phenom.ffwll.local>
 <20250110203838.GL5556@nvidia.com>
 <Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local>
 <20250114173103.GE5556@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114173103.GE5556@nvidia.com>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Tue, Jan 14, 2025 at 01:31:03PM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 14, 2025 at 03:44:04PM +0100, Simona Vetter wrote:
> 
> > E.g. if a compositor gets a dma-buf it assumes that by just binding that
> > it will not risk gpu context destruction (unless you're out of memory and
> > everything is on fire anyway, and it's ok to die). But if a nasty client
> > app supplies a revocable dma-buf, then it can shot down the higher
> > priviledged compositor gpu workload with precision. Which is not great, so
> > maybe existing dynamic gpu importers should reject revocable dma-buf.
> > That's at least what I had in mind as a potential issue.
> 
> I see, so it is not that they can't handle a non-present fault it is
> just that the non-present effectively turns into a crash of the
> context and you want to avoid the crash. It makes sense to me to
> negotiate this as part of the API.

Yup.

> > > This is similar to the structure BIO has, and it composes nicely with
> > > a future pin_user_pages() and memfd_pin_folios().
> > 
> > Since you mention pin here, I think that's another aspect of the revocable
> > vs dynamic question. Dynamic buffers are expected to sometimes just move
> > around for no reason, and importers must be able to cope.
> 
> Yes, and we have importers that can tolerate dynamic and those that
> can't. Though those that can't tolerate it can often implement revoke.
> 
> I view your list as a cascade:
>  1) Fully pinned can never be changed so long as the attach is present
>  2) Fully pinned, but can be revoked. Revoked is a fatal condition and
>     the importer is allowed to experience an error
>  3) Fully dynamic and always present. Support for move, and
>     restartable fault, is required
> 
> Today in RDMA we ask the exporter if it is 1 or 3 and allow different
> things. I've seen the GPU side start to offer 1 more often as it has
> significant performance wins.

I'm not entirely sure a cascade is the right thing or whether we should
have importers just specify bitmask of what is acceptable to them. But
that little detail aside this sounds like what I was thinking of.

> > For recovable exporters/importers I'd expect that movement is not
> > happening, meaning it's pinned until the single terminal revocation. And
> > maybe I read the kvm stuff wrong, but it reads more like the latter to me
> > when crawling through the pfn code.
> 
> kvm should be fully faultable and it should be able handle move. It
> handles move today using the mmu notifiers after all.
> 
> kvm would need to interact with the dmabuf reservations on its page
> fault path.
> 
> iommufd cannot be faultable and it would only support revoke. For VFIO
> revoke would not be fully terminal as VFIO can unrevoke too
> (sigh).  If we make revoke special I'd like to eventually include
> unrevoke for this reason.
> 
> > Once we have the lifetime rules nailed then there's the other issue of how
> > to describe the memory, and my take for that is that once the dma-api has
> > a clear answer we'll just blindly adopt that one and done.
> 
> This is what I hope, we are not there yet, first Leon's series needs
> to get merged then we can start on making the DMA API P2P safe without
> any struct page. From there it should be clear what direction things
> go in.
> 
> DMABUF would return pfns annotated with whatever matches the DMA API,
> and the importer would be able to inspect the PFNs to learn
> information like their P2Pness, CPU mappability or whatever.

I think for 90% of exporters pfn would fit, but there's some really funny
ones where you cannot get a cpu pfn by design. So we need to keep the
pfn-less interfaces around. But ideally for the pfn-capable exporters we'd
have helpers/common code that just implements all the other interfaces.

I'm not worried about the resulting fragmentation, because dma-buf is the
"everythig is optional" api. We just need to make sure we have really
clear semantic api contracts, like with the revocable vs dynamic/moveable
distinction. Otherwise things go boom when an importer gets an unexpected
dma-buf fd, and we pass this across security boundaries a lot.

> I'm pushing for the extra struct, and Christoph has been thinking
> about searching a maple tree on the PFN. We need to see what works best.
> 
> > And currently with either dynamic attachments and dma_addr_t or through
> > fishing the pfn from the cpu pagetables there's some very clearly defined
> > lifetime and locking rules (which kvm might get wrong, I've seen some
> > discussions fly by where it wasn't doing a perfect job with reflecting pte
> > changes, but that was about access attributes iirc). 
> 
> Wouldn't surprise me, mmu notifiers are very complex all around. We've
> had bugs already where the mm doesn't signal the notifiers at the
> right points.
> 
> > If we add something
> > new, we need clear rules and not just "here's the kvm code that uses it".
> > That's how we've done dma-buf at first, and it was a terrible mess of
> > mismatched expecations.
> 
> Yes, that would be wrong. It should be self defined within dmabuf and
> kvm should adopt to it, move semantics and all.

Ack.

I feel like we have a plan here. Summary from my side:

- Sort out pin vs revocable vs dynamic/moveable semantics, make sure
  importers have no surprises.

- Adopt whatever new dma-api datastructures pops out of the dma-api
  reworks.

- Add pfn based memory access as yet another optional access method, with
  helpers so that exporters who support this get all the others for free.

I don't see a strict ordering between these, imo should be driven by
actual users of the dma-buf api.

Already done:

- dmem cgroup so that we can resource control device pinnings just landed
  in drm-next for next merge window. So that part is imo sorted and we can
  charge ahead with pinning into device memory without all the concerns
  we've had years ago when discussing that for p2p dma-buf support.

  But there might be some work so that we can p2p pin without requiring
  dynamic attachments only, I haven't checked whether that needs
  adjustment in dma-buf.c code or just in exporters.

Anything missing?

I feel like this is small enough that m-l archives is good enough. For
some of the bigger projects we do in graphics we sometimes create entries
in our kerneldoc with wip design consensus and things like that. But
feels like overkill here.

> My general desire is to move all of RDMA's MR process away from
> scatterlist and work using only the new DMA API. This will save *huge*
> amounts of memory in common workloads and be the basis for non-struct
> page DMA support, including P2P.

Yeah a more memory efficient structure than the scatterlist would be
really nice. That would even benefit the very special dma-buf exporters
where you cannot get a pfn and only the dma_addr_t, altough most of those
(all maybe even?) have contig buffers, so your scatterlist has only one
entry. But it would definitely be nice from a design pov.

Aside: A way to more efficiently create compressed scatterlists would be
neat too, because a lot of drivers hand-roll that and it's a bit brittle
and kinda silly to duplicate. With compressed I mean just a single entry
for a contig range, in practice thanks to huge pages/folios and allocators
trying to hand out contig ranges if there's plenty of memory that saves a
lot of memory too. But currently it's a bit a pain to construct these
efficiently, mostly it's just a two-pass approach and then trying to free
surplus memory or krealloc to fit. Also I don't have good ideas here, but
dma-api folks might have some from looking at too many things that create
scatterlists.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

