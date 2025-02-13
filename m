Return-Path: <linux-media+bounces-26121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F13A33F52
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 13:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EA1A168180
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 12:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA7622156D;
	Thu, 13 Feb 2025 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bMkTKxxY"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB2021128A;
	Thu, 13 Feb 2025 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739450419; cv=none; b=ZlEGqcejqdfUucj27gqkNAYF7tQ7RJrtxdK8bB3j5ZvaFsrSaRQoc9GiegnkdRNI3ssUjTt1RstBE/swhO5jRMEQP/TsEJx5O/2BIKV5DPR6oIMl3vCUT/u1DrgGBvA8J/bmse4EOYxDNkIX0E5T+nPt7MjIKgrc0wdD1I1rGhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739450419; c=relaxed/simple;
	bh=1NKid35ms3rwfl1WIWHKmj/E2Et68QQEMclUR1o1Qdg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sol8sk1ywZ6bYn9BvgyFQ6uabYBGNGOghcbQajtXItTrajYR880b0FhaJmkHLQCU2mPidGFTpUu4pSgvleyAKkF32X9LJv614KEe5IA5oPKZc3skX/2OWfx9w0M4dG92Hwt/YpFL6A/Oa3SH04P6JHnFL5l0CvJhsMN8Tuc8JXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bMkTKxxY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739450413;
	bh=1NKid35ms3rwfl1WIWHKmj/E2Et68QQEMclUR1o1Qdg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bMkTKxxYuPtmtWitDL/buUOxZCQPiW370lhrTbobkEtQW5nHiPgc+fUDZCC6Qm8lW
	 ocYzeEJeH8O1ho7q+uM7bMJUDmVn+EUelDE/6Iz6b4OIKHvGOwv0eavTa/dwJzV23X
	 VpfRMv1hYurl0MsfzzmCBrZuakjiJV+DLpuluiObEgvzY0D6XfMbTGy3q7K5M7k/pP
	 xkuPFmo0UFqqvdBVoq/mG/XSRSpLSI1cGB/MOfjyFem9MBoe2eMUdrNl0eVSrRKL2h
	 40Bk5Mfjk2IS5V+s3rwxF60Y3BkgfIDgi1/aAlZ3PEV3xGQ4As0uzLBcmcFgqOUmYz
	 dJ1K+AMTtq31g==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CAD417E153C;
	Thu, 13 Feb 2025 13:40:13 +0100 (CET)
Date: Thu, 13 Feb 2025 13:40:08 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>, Thierry Reding
 <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com,
 Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <20250213134008.4cbef142@collabora.com>
In-Reply-To: <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
	<20250212205613.4400a888@collabora.com>
	<CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
	<20250213093557.278f5d19@collabora.com>
	<CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Feb 2025 14:46:01 +0530
Sumit Garg <sumit.garg@linaro.org> wrote:

> On Thu, 13 Feb 2025 at 14:06, Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Thu, 13 Feb 2025 12:11:52 +0530
> > Sumit Garg <sumit.garg@linaro.org> wrote:
> >  
> > > Hi Boris,
> > >
> > > On Thu, 13 Feb 2025 at 01:26, Boris Brezillon
> > > <boris.brezillon@collabora.com> wrote:  
> > > >
> > > > +Florent, who's working on protected-mode support in Panthor.
> > > >
> > > > Hi Jens,
> > > >
> > > > On Tue, 17 Dec 2024 11:07:36 +0100
> > > > Jens Wiklander <jens.wiklander@linaro.org> wrote:
> > > >  
> > > > > Hi,
> > > > >
> > > > > This patch set allocates the restricted DMA-bufs via the TEE subsystem.  
> > > >
> > > > We're currently working on protected-mode support for Panthor [1] and it
> > > > looks like your series (and the OP-TEE implementation that goes with
> > > > it) would allow us to have a fully upstream/open solution for the
> > > > protected content use case we're trying to support. I need a bit more
> > > > time to play with the implementation but this looks very promising
> > > > (especially the lend rstmem feature, which might help us allocate our
> > > > FW sections that are supposed to execute code accessing protected
> > > > content).  
> > >
> > > Glad to hear that, if you can demonstrate an open source use case
> > > based on this series then it will help to land it. We really would
> > > love to see support for restricted DMA-buf consumers be it GPU, crypto
> > > accelerator, media pipeline etc.
> > >  
> > > >  
> > > > >
> > > > > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > > > > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> > > > > restrictions for the memory used for the DMA-bufs.
> > > > >
> > > > > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> > > > > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> > > > > how to allocate the restricted physical memory.  
> > > >
> > > > I'll probably have more questions soon, but here's one to start: any
> > > > particular reason you didn't go for a dma-heap to expose restricted
> > > > buffer allocation to userspace? I see you already have a cdev you can
> > > > take ioctl()s from, but my understanding was that dma-heap was the
> > > > standard solution for these device-agnostic/central allocators.  
> > >
> > > This series started with the DMA heap approach only here [1] but later
> > > discussions [2] lead us here. To point out specifically:
> > >
> > > - DMA heaps require reliance on DT to discover static restricted
> > > regions carve-outs whereas via the TEE implementation driver (eg.
> > > OP-TEE) those can be discovered dynamically.  
> >
> > Hm, the system heap [1] doesn't rely on any DT information AFAICT.  
> 
> Yeah but all the prior vendor specific secure/restricted DMA heaps
> relied on DT information.

Right, but there's nothing in the DMA heap provider API forcing that.

> 
> > The dynamic allocation scheme, where the TEE implementation allocates a
> > chunk of protected memory for us would have a similar behavior, I guess.  
> 
> In a dynamic scheme, the allocation will still be from CMA or system
> heap depending on TEE implementation capabilities but the restriction
> will be enforced via interaction with TEE.

Sorry, that's a wording issue. By dynamic allocation I meant the mode
where allocations goes through the TEE, not the lend rstmem thing. BTW,
calling the lend mode dynamic-allocation is kinda confusing, because in
a sense, both modes can be considered dynamic allocation from the user
PoV. I get that when the TEE allocates memory, it's picking from its
fixed address/size pool, hence the name, but when I first read this, I
thought the dynamic mode was the other one, and the static mode was the
one where you reserve a mem range from the DT, query it from the driver
and pass it to the TEE to restrict access post reservation/static
allocation.

> 
> >  
> > > - Dynamic allocation of buffers and making them restricted requires
> > > vendor specific driver hooks with DMA heaps whereas the TEE subsystem
> > > abstracts that out with underlying TEE implementation (eg. OP-TEE)
> > > managing the dynamic buffer restriction.  
> >
> > Yeah, the lend rstmem feature is clearly something tee specific, and I
> > think that's okay to assume the user knows the protection request
> > should go through the tee subsystem in that case.  
> 
> Yeah but how will the user discover that?

There's nothing to discover here. It would just be explicitly specified:

- for in-kernel users it can be a module parameter (or a DT prop if
  that's deemed acceptable)
- for userspace, it can be an envvar, a config file, or whatever the
  app/lib uses to get config options

> Rather than that it's better
> for the user to directly ask the TEE device to allocate restricted
> memory without worrying about how the memory restriction gets
> enforced.

If the consensus is that restricted/protected memory allocation should
always be routed to the TEE, sure, but I had the feeling this wasn't as
clear as that. OTOH, using a dma-heap to expose the TEE-SDP
implementation provides the same benefits, without making potential
future non-TEE based implementations a pain for users. The dma-heap
ioctl being common to all implementations, it just becomes a
configuration matter if we want to change the heap we rely on for
protected/restricted buffer allocation. And because heaps have
unique/well-known names, users can still default to (or rely solely on)
the TEE-SPD implementation if they want.

> 
> >  
> > > - TEE subsystem already has a well defined user-space interface for
> > > managing shared memory buffers with TEE and restricted DMA buffers
> > > will be yet another interface managed along similar lines.  
> >
> > Okay, so the very reason I'm asking about the dma-buf heap interface is
> > because there might be cases where the protected/restricted allocation
> > doesn't go through the TEE (Mediatek has a TEE-free implementation
> > for instance, but I realize vendor implementations are probably not the
> > best selling point :-/).  
> 
> You can always have a system with memory and peripheral access
> permissions setup during boot (or even have a pre-configured hardware
> as a special case) prior to booting up the kernel too. But that even
> gets somehow configured by a TEE implementation during boot, so
> calling it a TEE-free implementation seems over-simplified and not a
> scalable solution. However, this patchset [1] from Mediatek requires
> runtime TEE interaction too.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.wu@mediatek.com/
> 
> > If we expose things as a dma-heap, we have
> > a solution where integrators can pick the dma-heap they think is
> > relevant for protected buffer allocations without the various drivers
> > (GPU, video codec, ...) having to implement a dispatch function for all
> > possible implementations. The same goes for userspace allocations,
> > where passing a dma-heap name, is simpler than supporting different
> > ioctl()s based on the allocation backend.  
> 
> There have been several attempts with DMA heaps in the past which all
> resulted in a very vendor specific vertically integrated solution. But
> the solution with TEE subsystem aims to make it generic and vendor
> agnostic.

Just because all previous protected/restricted dma-heap effort
failed to make it upstream, doesn't mean dma-heap is the wrong way of
exposing this feature IMHO.

Regards,

Boris

