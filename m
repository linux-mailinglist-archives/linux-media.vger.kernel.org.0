Return-Path: <linux-media+bounces-26116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F459A33AF0
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 10:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4784B3A2AD4
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 09:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C9C20D4EF;
	Thu, 13 Feb 2025 09:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bGK35HcU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21D2206F15
	for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739438175; cv=none; b=PLMgzhkgfNZnAUOdGW2zkBZ7VK4LFdQ/ZDQD6ugMKAtmwPTviLnzvX0Y+AJDu8MiPKw32J8rZO66ss6cNONLrCEE+ZBLGBOrCqiud8oXwGHMyUPf1dizE5cAqbobPKPXvaBWTfsZAAMI6g4pr0wpE97bHt954dlNARTeRphkbog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739438175; c=relaxed/simple;
	bh=BAacpC/hwDG/mtj28XuI3plzqqG6lLKWx9Gqjj8DVbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAax6we8K8s5nRv14RHzJnUnhtxMN+15AhDUJ3XOFF7OA78BO39BcJzWHiAeHGDOYrumol7WgftcQ0kfL/HLVlPYnHUNiV/TmqtWgvsif8X7T/khJUxBZnihFbo6iyD5p/Ad5bcLV3VwPwdFvsxAywOQvNpg6ns9JUqIVofWtHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bGK35HcU; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4bbd703245aso140818137.1
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739438172; x=1740042972; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BAacpC/hwDG/mtj28XuI3plzqqG6lLKWx9Gqjj8DVbw=;
        b=bGK35HcUSNOQnieapheMrO16NJzE05eFRFEbjW5B08JXsJ791jx9Z2lJUaLbS6gDgi
         sZCsemkw1llT98hffttdGwRGOL3Ar3D6Th/4dCH2VdOB9PGyZqRgXTbw/TlRIBYc9Gaa
         sljRDJHhHQcApp2x6++vnIUiTEAfFetsjzwlJHVnmWqYdIfm0j5nsg4IPYJRd482aGHw
         VBpGoLlNdRxeBp0Rovyba2wiK5fjPztB2uiQ74YB3GIyaTQOb4xpsuVBQVOGSTP9sP3n
         KxQVm5HkHDDLwHKD8y8/E3SiWUrkLqf/6L3e8KkYSQ+ASfzeOG7347FvdkijH3vZjryP
         Nv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739438172; x=1740042972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAacpC/hwDG/mtj28XuI3plzqqG6lLKWx9Gqjj8DVbw=;
        b=fYrphJqyJS+Af0ZA6UBcwogdD5sEQPNvZWIX85eUTj6ibqhGqex9C8PAzXqxENQV91
         I/fXNHDPrYB8e4ITIt4kn2ItopeN92RdHhGNTwvPJyOhBMK1NwczFPPEFkW+w0T4O0fv
         /YE7bmLBsmvRpmpujw87XrNiZi5jxZDEdA/phTh4LGv2R0ZDuy2Js84zJMGhcrLircR8
         Ue21wRet3IA8zdQ1snJN1oYwi1Z/8/rh81h8DR9Zu8/pPxduf26KBStEHIY9P1RQudlT
         RPx7QVdcdk3R5HNrL+plK4wDzkJBTq1sAebIhOwveXbm2q42Q/ipJ75fy7e1Q1j36Kop
         tkMg==
X-Forwarded-Encrypted: i=1; AJvYcCWPTnOl3VaoZAAyr1Yqkz8kFHdjG1Wz880HIpBRVz/h85s3vFcQMuUtJZJXVt3y/81YtI+IQiKFCwkiXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC1TRfibAAbzlK60EfdCXveErkLnS0ogqfd+oBv0A8TnXigCJa
	xNZ1hm5omh22QN6QphZr5g5/b8a9CqBB/45dx3aAorD3qdCzuNX/Nz/fjanhBh9zu5qGJ7iyT+l
	/UztG9YvXL1xdRtwe1pRBAE/OGB44acGIPQJSEg==
X-Gm-Gg: ASbGnct0VXKtttGC5L2MGwosYhq9quh07XA0FZ2iuKbf8xfdsetc9idq0RDYmOhIzV1
	aP9C9GT7ujajxo0bASxxyZ8nB/wv/IoGPxRue7ZiPW2EOyFl5mFKY9KGGR33lVqLC0M/3nRoENX
	M=
X-Google-Smtp-Source: AGHT+IHuPpL4xteSdbWgrL0r9v96spUDd3pY29fru20lM3gKm1cy1XWf5xoLNbeh3qhFcvaDPibH3i24OVPTFa+BmLk=
X-Received: by 2002:a05:6102:2912:b0:4b9:bc52:e050 with SMTP id
 ada2fe7eead31-4bc0351978amr3199364137.2.1739438172547; Thu, 13 Feb 2025
 01:16:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com>
In-Reply-To: <20250213093557.278f5d19@collabora.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 13 Feb 2025 14:46:01 +0530
X-Gm-Features: AWEUYZm0Wp1I6dLShCTCErZfuQ5_X523x-MqvIqYj1fsBxxxtOs8WA89SI1vekc
Message-ID: <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Feb 2025 at 14:06, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Thu, 13 Feb 2025 12:11:52 +0530
> Sumit Garg <sumit.garg@linaro.org> wrote:
>
> > Hi Boris,
> >
> > On Thu, 13 Feb 2025 at 01:26, Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > >
> > > +Florent, who's working on protected-mode support in Panthor.
> > >
> > > Hi Jens,
> > >
> > > On Tue, 17 Dec 2024 11:07:36 +0100
> > > Jens Wiklander <jens.wiklander@linaro.org> wrote:
> > >
> > > > Hi,
> > > >
> > > > This patch set allocates the restricted DMA-bufs via the TEE subsystem.
> > >
> > > We're currently working on protected-mode support for Panthor [1] and it
> > > looks like your series (and the OP-TEE implementation that goes with
> > > it) would allow us to have a fully upstream/open solution for the
> > > protected content use case we're trying to support. I need a bit more
> > > time to play with the implementation but this looks very promising
> > > (especially the lend rstmem feature, which might help us allocate our
> > > FW sections that are supposed to execute code accessing protected
> > > content).
> >
> > Glad to hear that, if you can demonstrate an open source use case
> > based on this series then it will help to land it. We really would
> > love to see support for restricted DMA-buf consumers be it GPU, crypto
> > accelerator, media pipeline etc.
> >
> > >
> > > >
> > > > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > > > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> > > > restrictions for the memory used for the DMA-bufs.
> > > >
> > > > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> > > > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> > > > how to allocate the restricted physical memory.
> > >
> > > I'll probably have more questions soon, but here's one to start: any
> > > particular reason you didn't go for a dma-heap to expose restricted
> > > buffer allocation to userspace? I see you already have a cdev you can
> > > take ioctl()s from, but my understanding was that dma-heap was the
> > > standard solution for these device-agnostic/central allocators.
> >
> > This series started with the DMA heap approach only here [1] but later
> > discussions [2] lead us here. To point out specifically:
> >
> > - DMA heaps require reliance on DT to discover static restricted
> > regions carve-outs whereas via the TEE implementation driver (eg.
> > OP-TEE) those can be discovered dynamically.
>
> Hm, the system heap [1] doesn't rely on any DT information AFAICT.

Yeah but all the prior vendor specific secure/restricted DMA heaps
relied on DT information.

> The dynamic allocation scheme, where the TEE implementation allocates a
> chunk of protected memory for us would have a similar behavior, I guess.

In a dynamic scheme, the allocation will still be from CMA or system
heap depending on TEE implementation capabilities but the restriction
will be enforced via interaction with TEE.

>
> > - Dynamic allocation of buffers and making them restricted requires
> > vendor specific driver hooks with DMA heaps whereas the TEE subsystem
> > abstracts that out with underlying TEE implementation (eg. OP-TEE)
> > managing the dynamic buffer restriction.
>
> Yeah, the lend rstmem feature is clearly something tee specific, and I
> think that's okay to assume the user knows the protection request
> should go through the tee subsystem in that case.

Yeah but how will the user discover that? Rather than that it's better
for the user to directly ask the TEE device to allocate restricted
memory without worrying about how the memory restriction gets
enforced.

>
> > - TEE subsystem already has a well defined user-space interface for
> > managing shared memory buffers with TEE and restricted DMA buffers
> > will be yet another interface managed along similar lines.
>
> Okay, so the very reason I'm asking about the dma-buf heap interface is
> because there might be cases where the protected/restricted allocation
> doesn't go through the TEE (Mediatek has a TEE-free implementation
> for instance, but I realize vendor implementations are probably not the
> best selling point :-/).

You can always have a system with memory and peripheral access
permissions setup during boot (or even have a pre-configured hardware
as a special case) prior to booting up the kernel too. But that even
gets somehow configured by a TEE implementation during boot, so
calling it a TEE-free implementation seems over-simplified and not a
scalable solution. However, this patchset [1] from Mediatek requires
runtime TEE interaction too.

[1] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.wu@mediatek.com/

> If we expose things as a dma-heap, we have
> a solution where integrators can pick the dma-heap they think is
> relevant for protected buffer allocations without the various drivers
> (GPU, video codec, ...) having to implement a dispatch function for all
> possible implementations. The same goes for userspace allocations,
> where passing a dma-heap name, is simpler than supporting different
> ioctl()s based on the allocation backend.

There have been several attempts with DMA heaps in the past which all
resulted in a very vendor specific vertically integrated solution. But
the solution with TEE subsystem aims to make it generic and vendor
agnostic.

>
> [1]https://elixir.bootlin.com/linux/v6.13.2/source/drivers/dma-buf/heaps/system_heap.c#L424

-Sumit

