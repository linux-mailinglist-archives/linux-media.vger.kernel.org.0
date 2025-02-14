Return-Path: <linux-media+bounces-26163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3844A36240
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 16:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6787918943EB
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 15:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC667267387;
	Fri, 14 Feb 2025 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AeNKlk6K"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11056250BF8;
	Fri, 14 Feb 2025 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739548146; cv=none; b=tc7mll070285R2LYu0KU5/hn9NG8YoyC0B8vuxUwTbzpOs7W5XcHJYVZYUFWkjghMaARX4g9MRr6bGnRTfL8Z2lvkhMZiYTH0AJXJ/CcMP09dXoRmtSK+PZqVvHkxSVKHgOzZAaRn+BmVHahorFSyp+8ECZtSnBxAFLZ3ng3+cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739548146; c=relaxed/simple;
	bh=r7iHmY+on8D66t7zNqiSl/lx5SQ1muJfxYiuvuOyezg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A5wOxlq1VmMT9COztb9rj4b6it4foiVV/46u2rJf+LpedcH9dLatFgrunxtARnMKXk8wOLNam28FA0Vt7PF9AmWYIRHJNSiAvnlpmLsetzGugYM6HoG4hMbZc9ioQ1xrpLASJNOiqbsFv/k+EN/wGoM44ahus+XZ9omxac3MBco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AeNKlk6K; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739548142;
	bh=r7iHmY+on8D66t7zNqiSl/lx5SQ1muJfxYiuvuOyezg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AeNKlk6K5SOAeptmDJ2rIyAViKtZSHR6RcOxXRpQkjiKGTa7UtWXj+nOrb97yIFGs
	 RnCwJUBxlfroe8OXXVmYQLSCCrddUAzTFMUb22u5xXxvbuXYVpW67P291d2JJbzG1n
	 so3ZLvwhD3dWUoNLXSlek6ITZkGHcSL3LBNboSQrYslgyMU1E3nWvczT68tSEFGx7M
	 YXFw5rmjfhQRjxcUPp01idyy5lf4Y5T/Br2Xm/fKcf6AM4dvdhs1BhgLiRoeHhcgtx
	 WmxD37bkQK6tW10iU4c4QJckIK//9HZqb7bxMR6Ol/zmIabMU9BVcWvhORKGG1RHap
	 nH+tDx3Bi10YQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6064717E0E95;
	Fri, 14 Feb 2025 16:49:01 +0100 (CET)
Date: Fri, 14 Feb 2025 16:48:56 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Daniel Stone
 <daniel@fooishbar.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org, Olivier Masse
 <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Yong Wu
 <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <20250214164856.0d2ead8a@collabora.com>
In-Reply-To: <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
	<20250212205613.4400a888@collabora.com>
	<CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
	<20250213093557.278f5d19@collabora.com>
	<CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
	<20250213134008.4cbef142@collabora.com>
	<CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
	<CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
	<CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
	<CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
	<CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 14 Feb 2025 18:37:14 +0530
Sumit Garg <sumit.garg@linaro.org> wrote:

> On Fri, 14 Feb 2025 at 15:37, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >
> > Hi,
> >
> > On Thu, Feb 13, 2025 at 6:39=E2=80=AFPM Daniel Stone <daniel@fooishbar.=
org> wrote: =20
> > >
> > > Hi,
> > >
> > > On Thu, 13 Feb 2025 at 15:57, Jens Wiklander <jens.wiklander@linaro.o=
rg> wrote: =20
> > > > On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooish=
bar.org> wrote: =20
> > > > > But just because TEE is one good backend implementation, doesn't =
mean
> > > > > it should be the userspace ABI. Why should userspace care that TE=
E has
> > > > > mediated the allocation instead of it being a predefined range wi=
thin
> > > > > DT? =20
> > > >
> > > > The TEE may very well use a predefined range that part is abstracted
> > > > with the interface. =20
> > >
> > > Of course. But you can also (and this has been shipped on real
> > > devices) handle this without any per-allocation TEE needs by simply
> > > allocating from a memory range which is predefined within DT.
> > >
> > > From the userspace point of view, why should there be one ABI to
> > > allocate memory from a predefined range which is delivered by DT to
> > > the kernel, and one ABI to allocate memory from a predefined range
> > > which is mediated by TEE? =20
> >
> > We need some way to specify the protection profile (or use case as
> > I've called it in the ABI) required for the buffer. Whether it's
> > defined in DT seems irrelevant.
> > =20
> > > =20
> > > > >  What advantage
> > > > > does userspace get from having to have a different codepath to ge=
t a
> > > > > different handle to memory? What about x86?
> > > > >
> > > > > I think this proposal is looking at it from the wrong direction.
> > > > > Instead of working upwards from the implementation to userspace, =
start
> > > > > with userspace and work downwards. The interesting property to fo=
cus
> > > > > on is allocating memory, not that EL1 is involved behind the scen=
es. =20
> > > >
> > > > From what I've gathered from earlier discussions, it wasn't much of=
 a
> > > > problem for userspace to handle this. If the kernel were to provide=
 it
> > > > via a different ABI, how would it be easier to implement in the
> > > > kernel? I think we need an example to understand your suggestion. =
=20
> > >
> > > It is a problem for userspace, because we need to expose acceptable
> > > parameters for allocation through the entire stack. If you look at the
> > > dmabuf documentation in the kernel for how buffers should be allocated
> > > and exchanged, you can see the negotiation flow for modifiers. This
> > > permeates through KMS, EGL, Vulkan, Wayland, GStreamer, and more. =20
> >
> > What dma-buf properties are you referring to?
> > dma_heap_ioctl_allocate() accepts a few flags for the resulting file
> > descriptor and no flags for the heap itself.
> > =20
> > >
> > > Standardising on heaps allows us to add those in a similar way. =20
> >
> > How would you solve this with heaps? Would you use one heap for each
> > protection profile (use case), add heap_flags, or do a bit of both?

I would say one heap per-profile.

>=20
> Christian gave an historical background here [1] as to why that hasn't
> worked in the past with DMA heaps given the scalability issues.
>=20
> [1] https://lore.kernel.org/dri-devel/e967e382-6cca-4dee-8333-39892d532f7=
1@gmail.com/

Hm, I fail to see where Christian dismiss the dma-heaps solution in
this email. He even says:

> If the memory is not physically attached to any device, but rather just=20
memory attached to the CPU or a system wide memory controller then=20
expose the memory as DMA-heap with specific requirements (e.g. certain=20
sized pages, contiguous, restricted, encrypted, ...).

>=20
> > =20
> > > If we
> > > have to add different allocation mechanisms, then the complexity
> > > increases, permeating not only into all the different userspace APIs,
> > > but also into the drivers which need to support every different
> > > allocation mechanism even if they have no opinion on it - e.g. Mali
> > > doesn't care in any way whether the allocation comes from a heap or
> > > TEE or ACPI or whatever, it cares only that the memory is protected.
> > >
> > > Does that help? =20
> >
> > I think you're missing the stage where an unprotected buffer is
> > received and decrypted into a protected buffer. If you use the TEE for
> > decryption or to configure the involved devices for the use case, it
> > makes sense to let the TEE allocate the buffers, too. A TEE doesn't
> > have to be an OS in the secure world, it can be an abstraction to
> > support the use case depending on the design. So the restricted buffer
> > is already allocated before we reach Mali in your example.
> >
> > Allocating restricted buffers from the TEE subsystem saves us from
> > maintaining proxy dma-buf heaps. =20

Honestly, when I look at dma-heap implementations, they seem
to be trivial shells around existing (more complex) allocators, and the
boiler plate [1] to expose a dma-heap is relatively small. The dma-buf
implementation, you already have, so we're talking about a hundred
lines of code to maintain, which shouldn't be significantly more than
what you have for the new ioctl() to be honest. And I'll insist on what
Daniel said, it's a small price to pay to have a standard interface to
expose to userspace. If dma-heaps are not used for this kind things, I
honestly wonder what they will be used for...

Regards,

Boris

[1]https://elixir.bootlin.com/linux/v6.13.2/source/drivers/dma-buf/heaps/sy=
stem_heap.c#L314

