Return-Path: <linux-media+bounces-18550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BE6986068
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 16:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFEEA28A2B8
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 14:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C1413D520;
	Wed, 25 Sep 2024 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NL3OQ/Dx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC001891A0
	for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 12:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268829; cv=none; b=qFx6zHrSa/OFjYQthjMZ/0GUuCRFL1USjzyFV0C6ZrxB3YP0/99WCK367zBcaTqsnm1Vx08haXEpkl2Evfa+sQ2oriO6OrYB2TEz0qABxlsQWAWblvFy7P8YH/i5WRt5Dsw/eUIQqWiVKYPUX1p78yxa2/XjBr/dYA6nfFE8FGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268829; c=relaxed/simple;
	bh=mT33v1BcdCHSqsM4CQRybDcheK6N+x0YaItl1abb8dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuAB1Ez+qBaVVuVRrV/M8s7XzUoKloiGoUfRwal7AVkqVbUxq+NnKVWAfaFAoFclZ5uM3gZpB+E5exCEb35gFocTedAp+I+ke8T1rX1sifTY7Ga6+Ju1vtHy29eoOiB9hHOK0ZO40LjdJ/H02DOiBj2Cs4CpXQ9s0TDGyNe+5qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NL3OQ/Dx; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-277f19ee2a2so3341220fac.1
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 05:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727268827; x=1727873627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3P64Nuj8GlT9wDKZ+1u3zuMiJRKJGP8MnD/jd+llEk=;
        b=NL3OQ/Dxp5tOsuIXl0Jx13baOoqlyTbWUA1iuGNJmxvl3dkW0/bqoi1Nb654LPToTG
         2zH+GZ6rcVQk1KmDwPZWBDmFTyMmPLFqyzDTYLiae1fcx2fzCbtGZ2TBo/M1bPqpQlPY
         vvLr1uXuP0YrWRh4uWjcRRh5dia/uswGKRHKHZLaYtYorl/IS6djuH1oe0+4OE+pDbeH
         WwwpeuLZx43+mlc0Ly2aRYrFtrGBzJmD5QqRsQVVK36h+VppUxnJY0RTIgPFXoex6W5b
         snJXtFaEdFZUOBUVC5cGKGMxIowuqPhEiQ7ld8vGrFFL3SiuSQtYEZCddwv3ftvg+uyO
         dR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727268827; x=1727873627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3P64Nuj8GlT9wDKZ+1u3zuMiJRKJGP8MnD/jd+llEk=;
        b=Ia4zTEf9qQhWqnIWOuT05rALiw+vFHoDPnNTGYFy6n62ChIBEMs2Rh7lx3H3lANW5Z
         dWORFZ4/Eg2EuUq/53KfIUJ02vRfloRGVvEqngoAKgQpyVeN4jmURFi/ZSbDr4lIY77l
         LttMauG3iqBE9czrFi8KBIwap7MDkchT7+IVdJca15FlI83kjwJuqd8psP+O2pDnRAXy
         cAlMGId48zJgnoCrBRXutpW2LbV6rDHIZxqZWBhsi4PoJSLlht8xhP1//oVxBj4IAel3
         Zdvv143EznoUtyJw878cTxafsn9Zav6PZrHOMCMiYjgzXfDb+VYMAuGqE3kgNDKcdyC/
         bhRg==
X-Forwarded-Encrypted: i=1; AJvYcCUouPZ6opNxYaa4wrBL4ak2H7d/9dMdiQxTGQiQnwQNnN5a8Wg8S9oZK4fsmfk9y1UVHMVGwijhw3v5Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YycMyc8awcUUa5qR3e9/dq5aWfuUfP3Wa9TxV5KlT8HPhFhwq1p
	N7RJEJWm7PtWlAGJgdn9SW86XF2z9PiN9d78IZRsWn/cm4vBnlniDjGQsBQAndffu17DTt1Gfi5
	2Hd6TcuFDC3RpG6xbP72e1EcLAOCCyHZRBcq32A==
X-Google-Smtp-Source: AGHT+IHSJDI5zJNXgia6m+wvn3Z88Lm1Gqvx0KTAh7NQ/EUXrFKHeoOj7pRQGL8LyhcvQBz8DCABmsPEnqj7Sd60oPU=
X-Received: by 2002:a05:6870:5487:b0:277:f329:f111 with SMTP id
 586e51a60fabf-286e141f056mr1950128fac.22.1727268826783; Wed, 25 Sep 2024
 05:53:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <20240925071504.GA3519798@rayden> <bktt4yanmfn4gjljy2wxmigj6mncpga237oxyf4g4h2vxu2a3q@asnsn7smi4u2>
In-Reply-To: <bktt4yanmfn4gjljy2wxmigj6mncpga237oxyf4g4h2vxu2a3q@asnsn7smi4u2>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 25 Sep 2024 14:53:34 +0200
Message-ID: <CAHUa44EvgcUg0QFvwsgU6BSs_BtZg6bO_5rx3CJbyCUPbiQZXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Linaro restricted heap
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 1:41=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Sep 25, 2024 at 09:15:04AM GMT, Jens Wiklander wrote:
> > On Mon, Sep 23, 2024 at 09:33:29AM +0300, Dmitry Baryshkov wrote:
> > > Hi,
> > >
> > > On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> > > > Hi,
> > > >
> > > > This patch set is based on top of Yong Wu's restricted heap patch s=
et [1].
> > > > It's also a continuation on Olivier's Add dma-buf secure-heap patch=
 set [2].
> > > >
> > > > The Linaro restricted heap uses genalloc in the kernel to manage th=
e heap
> > > > carvout. This is a difference from the Mediatek restricted heap whi=
ch
> > > > relies on the secure world to manage the carveout.
> > > >
> > > > I've tried to adress the comments on [2], but [1] introduces change=
s so I'm
> > > > afraid I've had to skip some comments.
> > >
> > > I know I have raised the same question during LPC (in connection to
> > > Qualcomm's dma-heap implementation). Is there any reason why we are
> > > using generic heaps instead of allocating the dma-bufs on the device
> > > side?
> > >
> > > In your case you already have TEE device, you can use it to allocate =
and
> > > export dma-bufs, which then get imported by the V4L and DRM drivers.
> > >
> > > I have a feeling (I might be completely wrong here) that by using
> > > generic dma-buf heaps we can easily end up in a situation when the
> > > userspace depends heavily on the actual platform being used (to map t=
he
> > > platform to heap names). I think we should instead depend on the
> > > existing devices (e.g. if there is a TEE device, use an IOCTL to
> > > allocate secured DMA BUF from it, otherwise check for QTEE device,
> > > otherwise check for some other vendor device).
> >
> > That makes sense, it's similar to what we do with TEE_IOC_SHM_ALLOC
> > where we allocate from a carveout reserverd for shared memory with the
> > secure world. It was even based on dma-buf until commit dfd0743f1d9e
> > ("tee: handle lookup of shm with reference count 0").
> >
> > We should use a new TEE_IOC_*_ALLOC for these new dma-bufs to avoid
> > confusion and to have more freedom when designing the interface.
> >
> > >
> > > The mental experiment to check if the API is correct is really simple=
:
> > > Can you use exactly the same rootfs on several devices without
> > > any additional tuning (e.g. your QEMU, HiKey, a Mediatek board, Qualc=
omm
> > > laptop, etc)?
> >
> > No, I don't think so.
>
> Then the API needs to be modified.

I don't think that is enough. I would have answered no even without
the secure data path in mind. Communication with the secure world is
still too fragmented.

>
> Or the userspace needs to be modified in the way similar to Vulkan /
> OpenCL / glvnd / VA / VDPU: platform-specific backends, coexisting on a
> single rootfs.

Yes, that's likely a needed step. But the first step is to have
something to relate to upstream, without that there's only an
ever-changing downstream ABI.

>
> It is more or less fine to have platform-specific rootfs when we are
> talking about the embedded, resource-limited devices. But for the
> end-user devices we must be able to install a generic distro with no
> device-specific packages being selected.

I'm not sure we can solve that problem here. But we should of course
not make matters worse. In the restricted heap patch set which this
patchset builds on we define a way to allocate memory from a
restricted heap, but we leave the problem of finding the right heap to
userspace.

Thanks,
Jens

>
> >
> > >
> > > >
> > > > This can be tested on QEMU with the following steps:
> > > > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_=
v8.xml \
> > > >         -b prototype/sdp-v1
> > > > repo sync -j8
> > > > cd build
> > > > make toolchains -j4
> > > > make all -j$(nproc)
> > > > make run-only
> > > > # login and at the prompt:
> > > > xtest --sdp-basic
> > > >
> > > > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > > > list dependencies needed to build the above.
> > > >
> > > > The tests are pretty basic, mostly checking that a Trusted Applicat=
ion in
> > > > the secure world can access and manipulate the memory.
> > >
> > > - Can we test that the system doesn't crash badly if user provides
> > >   non-secured memory to the users which expect a secure buffer?
> > >
> > > - At the same time corresponding entities shouldn't decode data to th=
e
> > >   buffers accessible to the rest of the sytem.
> >
> > I'll a few tests along that.
> >
> > Thanks,
> > Jens
> >
> > >
> > > >
> > > > Cheers,
> > > > Jens
> > > >
> > > > [1] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.w=
u@mediatek.com/
> > > > [2] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse=
@nxp.com/
> > > >
> > > > Changes since Olivier's post [2]:
> > > > * Based on Yong Wu's post [1] where much of dma-buf handling is don=
e in
> > > >   the generic restricted heap
> > > > * Simplifications and cleanup
> > > > * New commit message for "dma-buf: heaps: add Linaro restricted dma=
buf heap
> > > >   support"
> > > > * Replaced the word "secure" with "restricted" where applicable
> > > >
> > > > Etienne Carriere (1):
> > > >   tee: new ioctl to a register tee_shm from a dmabuf file descripto=
r
> > > >
> > > > Jens Wiklander (2):
> > > >   dma-buf: heaps: restricted_heap: add no_map attribute
> > > >   dma-buf: heaps: add Linaro restricted dmabuf heap support
> > > >
> > > > Olivier Masse (1):
> > > >   dt-bindings: reserved-memory: add linaro,restricted-heap
> > > >
> > > >  .../linaro,restricted-heap.yaml               |  56 ++++++
> > > >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> > > >  drivers/dma-buf/heaps/Makefile                |   1 +
> > > >  drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
> > > >  drivers/dma-buf/heaps/restricted_heap.h       |   2 +
> > > >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++=
++++
> > > >  drivers/tee/tee_core.c                        |  38 ++++
> > > >  drivers/tee/tee_shm.c                         | 104 ++++++++++-
> > > >  include/linux/tee_drv.h                       |  11 ++
> > > >  include/uapi/linux/tee.h                      |  29 +++
> > > >  10 files changed, 426 insertions(+), 7 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/reserved-memo=
ry/linaro,restricted-heap.yaml
> > > >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry

