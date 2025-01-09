Return-Path: <linux-media+bounces-24479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E4DA06E04
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 07:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 609AB3A2D05
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 06:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04907214802;
	Thu,  9 Jan 2025 06:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HDTDRDz6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1A92144DD
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 06:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736402945; cv=none; b=oTpDYJeW+KBpFwb3+iXAYDqSaf7m0Nr8tW+HZ+XHhq8GNvlSHBtXWk3j47NX2l8CWDbmXk2QSZ4jY3bJYZoonZxh2QQJQg0xHYKUH9/KR/ji+nzXFnfymVSyFIOgI2UlAWnh1QndfAoEDTsq5Uh2UhwdGubfzo95V3Jy5cBBaRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736402945; c=relaxed/simple;
	bh=BPHagE0/RWjT5dajkjNtQG/0lS2lNohxsMU7JMUi5XE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWWQ6bDqVjctC3HTO1chvwff+MpbWZqOqaaai2X42uidikReFuX1rcdzvF3t9PMOxh8p1YfdCGiwG2mLiiHrcIxCrRvzpWs7CHOXxU371bfeUUAQqfxSqW1fP0LDIxNj93gVrqIoEEGYyZrYLiUYa6vH1aKWZ2ppYK/y7qDZaA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HDTDRDz6; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4afd68271b6so191200137.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2025 22:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736402942; x=1737007742; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vC9nJtt9rRq/geCAGZDFx6gLFWekfxOk8FhgpKUHqfQ=;
        b=HDTDRDz6llZ1q4U5uG08fTpB0t65JPPZ3jFFDQ43F5BgmLEo+aRza0AmhgXR/zkyp6
         jeur7W3eBCcC7kK5EUeb1VhCilGhpHKe7SPDPpWO0hTz/vBxCGHDjDy0SVePS9WIWd7i
         SNWPUsD9PUq2thmJMc3JgEPrrC5HgRricTbFbKi1DZccXEZ5lsxDdjFToXtoa9F02Qpv
         xEc17h+oXL7LdJa3dy+gfUvRBBW90tkVK83qDkvMnOcaHF3/rkeW1kuAjOaPQvuQeEC6
         KKKblACUl60FS+B4AJSSdaWJEC9sFlO9p4ATQlsKeJa5GmfbouuuVc9GHMQe1ok/i3sH
         7vIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736402942; x=1737007742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vC9nJtt9rRq/geCAGZDFx6gLFWekfxOk8FhgpKUHqfQ=;
        b=G/VWOCcUcdOt/qHOY4tyI/z4Erh8ESRYpIl6bSg3PgjRlgEOgm8A+nEdHD/HgrhK/h
         QGofpaF/gAK8hlJjANI2p4ikVZZ+04uIa+yTLsWMdA87SJlZLomYDDcjy4FwBHWkIAEO
         ak/jzC0AIwnM0TgkTp/Uixhy0gnDwiBP/XIIkSwQU9A2SzcRhjWA+doQC6s+6B1CA/iI
         A2jezf3CTE6kUUogZwwuP7aJZFb9V8TTKoijM6hQFtThnUOUeOo1VikOxeFjrddtS+BF
         fXwhSQjiV9kw5g3U7UV3GcXjmK2mdXz9QC9he/SIjvlY4IyZDxV5Zi5TW0bhvPFaMtOf
         QCFw==
X-Forwarded-Encrypted: i=1; AJvYcCUZLfEc/ng9ZXXQoNkXMdD5dThPG/H0PuCpu62p++ddelsfvYfX7GHHzwRFVTmDPd6O0zQRG2pVuXzHew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeV1uXp+mc81FMLJUNfWvdk6U223OtjSJhAy8FLQnfsf80Vi0b
	tUJOlLFi7Ds8s+S3U3qsDBm70q8Zia+t/4MKFXgpmieWV1Y0zmXmL/TEQLRpLEYSNwF8tfuabMp
	J8R53gELdAjDLPqx6tzpa77amgBv+5DQ/u0mxaQ==
X-Gm-Gg: ASbGnctFBmKAWR9kOz5EnMdB//ig53IGDRnwp4Rvl1oRlFOBE13sQ0p9MzISYVAR/Ja
	3Ccx7KwAGjnfY3d4J6f3KUfp0NbQk+ML4moQi+9xr
X-Google-Smtp-Source: AGHT+IFkDZGBtCpO5FflLFvbdwmJ3sWoUbJtvuojzOG7I1CBRhorYbwloT2u1hpJHzN4tOBjlfcQFIZrLZuRC0Ec89I=
X-Received: by 2002:a05:6102:c8b:b0:4b2:adfb:4f91 with SMTP id
 ada2fe7eead31-4b3d0fb1764mr3879731137.21.1736402941990; Wed, 08 Jan 2025
 22:09:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local> <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
 <Z36ujiS8yyG1mfbA@phenom.ffwll.local>
In-Reply-To: <Z36ujiS8yyG1mfbA@phenom.ffwll.local>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 9 Jan 2025 11:38:50 +0530
X-Gm-Features: AbW1kvZpkNiFcSMyeI-DgMLrpBLgsFpc30qEZPbPGQ78luMHwy5kGq6PCahL58k
Message-ID: <CAFA6WYPXxUQYe9TF3PB9C0NwCz1eceCdYNa1yoKpv320M20qDw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: simona.vetter@ffwll.ch
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2025 at 22:27, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>
> On Tue, Dec 24, 2024 at 12:05:19PM +0530, Sumit Garg wrote:
> > Hi Simona,
> >
> > On Wed, 18 Dec 2024 at 16:36, Simona Vetter <simona.vetter@ffwll.ch> wrote:
> > >
> > > On Tue, Dec 17, 2024 at 11:07:36AM +0100, Jens Wiklander wrote:
> > > > Hi,
> > > >
> > > > This patch set allocates the restricted DMA-bufs via the TEE subsystem.
> > > >
> > > > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > > > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> > > > restrictions for the memory used for the DMA-bufs.
> > > >
> > > > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> > > > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> > > > how to allocate the restricted physical memory.
> > > >
> > > > TEE_IOC_RSTMEM_ALLOC takes in addition to a size and flags parameters also
> > > > a use-case parameter. This is used by the backend TEE driver to decide on
> > > > allocation policy and which devices should be able to access the memory.
> > > >
> > > > Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
> > > > Recording) has been identified so far to serve as examples of what can be
> > > > expected. More use-cases can be added in userspace ABI, but it's up to the
> > > > backend TEE drivers to provide the implementation.
> > > >
> > > > Each use-case has it's own restricted memory pool since different use-cases
> > > > requires isolation from different parts of the system. A restricted memory
> > > > pool can be based on a static carveout instantiated while probing the TEE
> > > > backend driver, or dynamically allocated from CMA and made restricted as
> > > > needed by the TEE.
> > > >
> > > > This can be tested on QEMU with the following steps:
> > > > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
> > > >         -b prototype/sdp-v4
> > > > repo sync -j8
> > > > cd build
> > > > make toolchains -j$(nproc)
> > > > make SPMC_AT_EL=1 all -j$(nproc)
> > > > make SPMC_AT_EL=1 run-only
> > > > # login and at the prompt:
> > > > xtest --sdp-basic
> > > >
> > > > The SPMC_AT_EL=1 parameter configures the build with FF-A and an SPMC at
> > > > S-EL1 inside OP-TEE. The parameter can be changed into SPMC_AT_EL=n to test
> > > > without FF-A using the original SMC ABI instead. Please remember to do
> > > > %rm -rf ../trusted-firmware-a/build/qemu
> > > > for TF-A to be rebuilt properly using the new configuration.
> > > >
> > > > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > > > list dependencies needed to build the above.
> > > >
> > > > The tests are pretty basic, mostly checking that a Trusted Application in
> > > > the secure world can access and manipulate the memory. There are also some
> > > > negative tests for out of bounds buffers etc.
> > >
> > > I think I've dropped this on earlier encrypted dma-buf discussions for
> > > TEE, but can't find one right now ...
> >
> > Thanks for raising this query.
> >
> > >
> > > Do we have some open source userspace for this? To my knowledge we have
> > > two implementations of encrypted/content protected dma-buf in upstream
> > > right now in the amd and intel gpu drivers, and unless I'm mistaken they
> > > both have some minimal userspace supporting EXT_protected_textures:
> >
> > First of all to clarify the support Jens is adding here for allocating
> > restricted shared memory allocation in TEE subsystem is meant to be
> > generic and not specific to only secure media pipeline use-case. Then
> > here we not only have open source test applications but rather open
> > source firmware too (OP-TEE as a Trusted OS) [1] supporting this as a
> > core feature where we maintain a stable and extensible ABI among the
> > kernel and the OP-TEE core.
> >
> > Restricted memory is a feature enforced by hardware specific firewalls
> > where a particular TEE implementation governs which particular block
> > of memory is accessible to a particular peripheral or a CPU running in
> > a higher privileged mode than the Linux kernel. There can be numeric
> > use-cases surrounding that as follows:
> >
> > - Secure media pipeline where the contents gets decrypted and stored
> > in a restricted buffer which are then accessible only to media display
> > pipeline peripherals.
> > - Trusted user interface where a peripheral takes input from the user
> > and stores it in a restricted buffer which then is accessible to TEE
> > implementation only.
> > - Another possible use-case can be for the TEE implementation to store
> > key material in a restricted buffer which is only accessible to the
> > hardware crypto accelerator.
> >
> > I am sure there will be more use-cases related to this feature but
> > those will only be possible once we provide a stable and extensible
> > restricted memory interface among the Linux user-space and the secure
> > world user-space (normally referred to as Trusted Applications).
> >
> > [1] https://github.com/OP-TEE/optee_os/pull/7159
> >
> > >
> > > https://github.com/KhronosGroup/OpenGL-Registry/blob/main/extensions/EXT/EXT_protected_textures.txt
> > >
> > > It's not great, but it does just barely clear the bar in my opinion. I
> > > guess something in gstreamer or similar video pipeline framework would
> > > also do the job.
> > >
> > > Especially with the context of the uapi discussion in the v1/RFC thread I
> > > think we need more than a bare-bones testcase to make sure this works in
> > > actual use.
> >
> > Currently the TEE subsystem already supports a stable ABI for shared
> > memory allocator among Linux user-space and secure world user-space
> > here [2]. And the stable ABI for restricted memory is also along the
> > same lines meant to be a vendor neutral abstraction for the user-space
> > access. The current test cases not only test the interface but also
> > perform regression tests too.
> >
> > I am also in favour of end to end open source use-cases. But I fear
> > without progressing in a step wise manner as with this proposal we
> > would rather force developers to upstream all the software pieces in
> > one go which will be kind of a chicken and egg situation. I am sure
> > once this feature lands Mediatek folks will be interested to port
> > their secure video playback patchset [3] on top of it. Similarly other
> > silicon vendors like NXP, Qcom etc. will be motivated to do the same.
> >
> > [2] https://docs.kernel.org/userspace-api/tee.html
> > [3] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.wu@mediatek.com/
>
> We get entire opengl/vulkan driver stacks ready before we merge new drm
> drivers, I really don't think this is too hard from a technical pov. And I
> think the mediatek patches had the same issue of lacking userspace for it,
> so that's not moving things forward.
> -Sima
>

Okay fair enough, I think I get your point. Currently we are missing
at least one peripheral support being the consumer for these
restricted DMA-bufs. So I discussed with Jens offline that we can try
with a crypto peripheral use-case first which can simply be
demonstrated using the current OP-TEE client user-space.

Also, in crypto peripheral use-case we can target the symmetric crypto
use-case first which already has a concept of hardware backed
symmetric key [1]. IOW, we should be able to come up with a generic
symmetric crypto algorithm which can be supported by different crypto
accelerators using a TEE backed restricted key DMA buffer.

[1] https://www.youtube.com/watch?v=GbcpwUBFGDw

-Sumit

