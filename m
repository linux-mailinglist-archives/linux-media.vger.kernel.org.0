Return-Path: <linux-media+bounces-26199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06994A37B33
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 07:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7469716BB52
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 06:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C943818DB00;
	Mon, 17 Feb 2025 06:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d+rdaDlD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6353D14A4C6
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 06:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739772789; cv=none; b=S45DDqR8oVA4wPRg3k4seXcZ+bpHis8yixUfOy3tN9P1E5zEL9224miBpnQ7u7Jd9//3TAEl+543QLQB2huby/WvHqQ2vIzCjCHos7hPNyLOq7I9zIbsZuxGIf0vEE2r03OR9HSyNiBVgntd/pKGKm75fwm6fL/Y8UwBWSPJHcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739772789; c=relaxed/simple;
	bh=gP/DhI4MQzs/dlT7ZaFU923WgrWtY1c1HT7wI1ePtA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUu+piC/0KQiaQojwTLmGRLZKXE4rk/p2i1NUPQCgj3S76V1X+9hxtKpOQnYeceuFjyn5KcWiV9GX1x3wrogL1zkm6PdxdkNZp7bL4bI4XMbB2rE7I9py3Z3i8nor3D9+TWKVpkFJYTssMoDXtAn+mJaYvaaLungik7Ap56gj9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d+rdaDlD; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4be4d72bceaso263152137.1
        for <linux-media@vger.kernel.org>; Sun, 16 Feb 2025 22:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739772786; x=1740377586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnZw/Q+2O7o0YRtcX5JOGAgQhTQPBSaQtuZqXRvPz8U=;
        b=d+rdaDlDHExgUoRZpQ0jw7IQNkmjMTftI3gbiENVsiHuA3NbP5q4Q+FwhJT6DwErHt
         AnlvTvmqNn4iQgIxNy7au1rPSOM+8Z65D/LN4675QSymnnBA8fS0FNLw13h5Uj4B+mnC
         PtwDJXoj2pa7zxfTUsiT+bBD0SjgDFQAxsoTwFUUNe3zrlkSY33q2Wt26azEnEhWmMZM
         r3qkdvmJVqlWk3vETlBzi6Da9QMrdweKjuJHK2UlHI/6oa8HQGntYZaxgQ6RvyNtlSSp
         X5M9lCsmiagGB0B0r4FdsszC4ytbbSPrkImYEHMaw9kpTOQ9uxFdsxCaY1fMGPUJTwTm
         CEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739772786; x=1740377586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnZw/Q+2O7o0YRtcX5JOGAgQhTQPBSaQtuZqXRvPz8U=;
        b=ll/R613U4zKUxS5iaXTl3tVlSQ2xybmSHGlMny6/4Rwc1YOTjT/pbjcjqfxr98gaTw
         ExXds11+e+KpTXixOPaMCZz6tSx/cl5WYQ5zEC+gZ2NOGqsEJaUarlLCnJmajzu6J6tG
         mbtl75hyylAOcrcbONkHJb9OWt53r/9u/sskpAkzy5qycvBNpP+OaXLrNcW5AtwfHD/o
         BexSMnn3qtswjLaF8frvmyzIAPdNXkl5R4Y7myTPJmjgdX+xIuukIKy32YrRb8ILXW1s
         Q8N7HBgS8nZeW9XkEazAqauJcuMaynETqpV3nQlZTl2kMam4VvxY/O+W+6DDlStA/3ic
         Mlxw==
X-Forwarded-Encrypted: i=1; AJvYcCVVr9pz6qUXUeeDRFhLZy9HiVNMGdo+ItnNUeVQHh2yxzB/qIQun71hHojXKvbbQJpEvnndp9TmmJnPlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5uymv374Kcub2EjgRTsPwMKj6dM1+1oV94zKecg1SRGqUrqYB
	uJuA+eyTVh727VUo9QVBXje9TykWOuD41YRp+gkqYC+e0uWvaSGKGM4i5Qsae6U1zSZT1kYUCuw
	G13blcviMQZhRU7R8QZKb5aFtHSOEb5AcolNZKQ==
X-Gm-Gg: ASbGncsZ4FIG7aHnpqfjdExGbpfpNM8YEjiKyk4081+GPkP8kwqoIMfIqAhFgHJ5F9z
	MG+T3fThBtDnsK/EWSUMRwVGTO3sC8rdbhC+uFTGkVRDllDyvcPfVdMvEd2NuHEOh/nzOmgFaVA
	==
X-Google-Smtp-Source: AGHT+IHc7dJI6eafhkqnIan6daijofUVFUvH3V4pTfdEga1AHuyGIsGH9uwlauqjjjaAaHI1sy0aprZ+BW4OP8MJfMs=
X-Received: by 2002:a05:6102:c89:b0:4bb:eb4a:f9f2 with SMTP id
 ada2fe7eead31-4bd3fcc5af7mr3186375137.9.1739772786167; Sun, 16 Feb 2025
 22:13:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com> <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com> <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
 <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
 <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com> <20250214164856.0d2ead8a@collabora.com>
In-Reply-To: <20250214164856.0d2ead8a@collabora.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 17 Feb 2025 11:42:55 +0530
X-Gm-Features: AWEUYZnqsQNR6HgNOQ-KCjeibuktCio21DDJEy1SbMXh6xWHOITZYYTdEw2pDRY
Message-ID: <CAFA6WYPc6EHQwcPuMZRm4C1P6SoDrCzEPUmju_meupB6NXQ1sg@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Daniel Stone <daniel@fooishbar.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 14 Feb 2025 at 21:19, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Fri, 14 Feb 2025 18:37:14 +0530
> Sumit Garg <sumit.garg@linaro.org> wrote:
>
> > On Fri, 14 Feb 2025 at 15:37, Jens Wiklander <jens.wiklander@linaro.org=
> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Feb 13, 2025 at 6:39=E2=80=AFPM Daniel Stone <daniel@fooishba=
r.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Thu, 13 Feb 2025 at 15:57, Jens Wiklander <jens.wiklander@linaro=
.org> wrote:
> > > > > On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooi=
shbar.org> wrote:
> > > > > > But just because TEE is one good backend implementation, doesn'=
t mean
> > > > > > it should be the userspace ABI. Why should userspace care that =
TEE has
> > > > > > mediated the allocation instead of it being a predefined range =
within
> > > > > > DT?
> > > > >
> > > > > The TEE may very well use a predefined range that part is abstrac=
ted
> > > > > with the interface.
> > > >
> > > > Of course. But you can also (and this has been shipped on real
> > > > devices) handle this without any per-allocation TEE needs by simply
> > > > allocating from a memory range which is predefined within DT.
> > > >
> > > > From the userspace point of view, why should there be one ABI to
> > > > allocate memory from a predefined range which is delivered by DT to
> > > > the kernel, and one ABI to allocate memory from a predefined range
> > > > which is mediated by TEE?
> > >
> > > We need some way to specify the protection profile (or use case as
> > > I've called it in the ABI) required for the buffer. Whether it's
> > > defined in DT seems irrelevant.
> > >
> > > >
> > > > > >  What advantage
> > > > > > does userspace get from having to have a different codepath to =
get a
> > > > > > different handle to memory? What about x86?
> > > > > >
> > > > > > I think this proposal is looking at it from the wrong direction=
.
> > > > > > Instead of working upwards from the implementation to userspace=
, start
> > > > > > with userspace and work downwards. The interesting property to =
focus
> > > > > > on is allocating memory, not that EL1 is involved behind the sc=
enes.
> > > > >
> > > > > From what I've gathered from earlier discussions, it wasn't much =
of a
> > > > > problem for userspace to handle this. If the kernel were to provi=
de it
> > > > > via a different ABI, how would it be easier to implement in the
> > > > > kernel? I think we need an example to understand your suggestion.
> > > >
> > > > It is a problem for userspace, because we need to expose acceptable
> > > > parameters for allocation through the entire stack. If you look at =
the
> > > > dmabuf documentation in the kernel for how buffers should be alloca=
ted
> > > > and exchanged, you can see the negotiation flow for modifiers. This
> > > > permeates through KMS, EGL, Vulkan, Wayland, GStreamer, and more.
> > >
> > > What dma-buf properties are you referring to?
> > > dma_heap_ioctl_allocate() accepts a few flags for the resulting file
> > > descriptor and no flags for the heap itself.
> > >
> > > >
> > > > Standardising on heaps allows us to add those in a similar way.
> > >
> > > How would you solve this with heaps? Would you use one heap for each
> > > protection profile (use case), add heap_flags, or do a bit of both?
>
> I would say one heap per-profile.
>

And then it would have a per vendor multiplication factor as each
vendor enforces memory restriction in a platform specific manner which
won't scale.

> >
> > Christian gave an historical background here [1] as to why that hasn't
> > worked in the past with DMA heaps given the scalability issues.
> >
> > [1] https://lore.kernel.org/dri-devel/e967e382-6cca-4dee-8333-39892d532=
f71@gmail.com/
>
> Hm, I fail to see where Christian dismiss the dma-heaps solution in
> this email. He even says:
>
> > If the memory is not physically attached to any device, but rather just
> memory attached to the CPU or a system wide memory controller then
> expose the memory as DMA-heap with specific requirements (e.g. certain
> sized pages, contiguous, restricted, encrypted, ...).

I am not saying Christian dismissed DMA heaps but rather how
scalability is an issue. What we are proposing here is a generic
interface via TEE to the firmware/Trusted OS which can perform all the
platform specific memory restrictions. This solution will scale across
vendors.

>
> >
> > >
> > > > If we
> > > > have to add different allocation mechanisms, then the complexity
> > > > increases, permeating not only into all the different userspace API=
s,
> > > > but also into the drivers which need to support every different
> > > > allocation mechanism even if they have no opinion on it - e.g. Mali
> > > > doesn't care in any way whether the allocation comes from a heap or
> > > > TEE or ACPI or whatever, it cares only that the memory is protected=
.
> > > >
> > > > Does that help?
> > >
> > > I think you're missing the stage where an unprotected buffer is
> > > received and decrypted into a protected buffer. If you use the TEE fo=
r
> > > decryption or to configure the involved devices for the use case, it
> > > makes sense to let the TEE allocate the buffers, too. A TEE doesn't
> > > have to be an OS in the secure world, it can be an abstraction to
> > > support the use case depending on the design. So the restricted buffe=
r
> > > is already allocated before we reach Mali in your example.
> > >
> > > Allocating restricted buffers from the TEE subsystem saves us from
> > > maintaining proxy dma-buf heaps.
>
> Honestly, when I look at dma-heap implementations, they seem
> to be trivial shells around existing (more complex) allocators, and the
> boiler plate [1] to expose a dma-heap is relatively small. The dma-buf
> implementation, you already have, so we're talking about a hundred
> lines of code to maintain, which shouldn't be significantly more than
> what you have for the new ioctl() to be honest.

It will rather be redundant vendor specific code under DMA heaps
calling into firmware/Trusted OS to enforce memory restrictions as you
can look into Mediatek example [1]. With TEE subsystem managing that
it won't be the case as we will provide a common abstraction for the
communication with underlying firmware/Trusted OS.

[1] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.wu=
@mediatek.com/

> And I'll insist on what
> Daniel said, it's a small price to pay to have a standard interface to
> expose to userspace. If dma-heaps are not used for this kind things, I
> honestly wonder what they will be used for...

Let's try not to forcefully find a use-case for DMA heaps when there
is a better alternative available. I am still failing to see why you
don't consider following as a standardised user-space interface:

"When user-space has to work with restricted memory, ask TEE device to
allocate it"

-Sumit

