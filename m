Return-Path: <linux-media+bounces-18547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9775E9859E9
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 14:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF3F0B22CB5
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 12:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3E51B1510;
	Wed, 25 Sep 2024 11:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D1tMJt/X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B911B14FF
	for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 11:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727264476; cv=none; b=W6v+Dv/0a+zQXBDbYIdGIh7h3Co+VYuNZAO1OtJWgHWHCBFubk6lvOiBqz74lSa1Tc0YT6OJLsjbBPDuS+oGY2wEVRVpcL9GcDlhZdXH9NJIPF/z3h1LfeRXoE+8lIFzlJb5gqNUp4auGN3Uid8t9ObpY8oVcEYZeJfgOMpn4G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727264476; c=relaxed/simple;
	bh=1TjHviNtJD6f6Ks5DxlP5+P6W1/bFmhn5hpDnHZbYtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TactrszkEYFyUJ6s/OK8GXCgMxQNN3ACBzuP4LcllmXdOUauAEzd19AWTYTQSDf0N4kzu6OlhlHMt0Ez7OKGuWw1wVCKveULKVoF5ibwhKmCbZmhno2ds+GlsmbjJ/XNOrmfRy3R+fKKnwcDiW77Tw2ZpHzVvYEBLVFP26dIa5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D1tMJt/X; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5365c512b00so1394005e87.3
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 04:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727264471; x=1727869271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eq5kqVdxIPnr1qj+gRKTOVccfM5+TlCgxfIme/nC8tk=;
        b=D1tMJt/XpgwY3G3W7ZEBendA454+LkkYn/lNnMUi/tu0Tg/j3QHP8rbsI9Dpsl2Zp9
         phYLFOvBfyaEOKIo69om0rX90++/qEDSBsRGRIhClseVxb6DUdgDd6FVLf5QTvxSTc9J
         +pr14TS/gzvEg72q+1ZkRYu8Yfjb0p3J0ywxYMPwVoFqxL+ZEaf8pE0SSJS+u4nGuMHe
         sPBCLkUtYuJMAq3tsJDHmcIGirA7xomgjM7JKhtGNWemnetD+3gVp/hf6JQaNQu8dd1E
         ZumVcMvcC3n/TtvL9ImNE8GnmEbnpu6HLiBF025FH/ieKv55GQN/VegxFl3litChnlby
         p4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727264471; x=1727869271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eq5kqVdxIPnr1qj+gRKTOVccfM5+TlCgxfIme/nC8tk=;
        b=I17fhI5QRC9QmccWo7BaJPk3/VGT+8wqHcRSXCwtf4FW0XgAlOAf016W92oHJw5cGH
         OzoxStLCGJxMbetSkX68tqOC4aauXjnkJQ3xltnol74xYA3LnPixG59n+crBs1AiA/WA
         +fmQl8AD/Mun8YTQP0+QEcze5DPfaPhN5TqBgzoE+MTIFKiZbq61ouJip1Hvf9xkLiq/
         t6rNlgmewIBvXlHBFAB+MCHLVESy4Ylz1l7wagqtt/vR2sw8DoXfi6f2LpZJ6hbqgbbN
         5ziXTuC3N26k7OiJke6lMoWgODPWkYUjFcnnOBlW5Y3pFZTLSKuChqLBvmTEmjxtGEnG
         BrWA==
X-Forwarded-Encrypted: i=1; AJvYcCV/jCq7aWUq5Ft2syYS+US63xs/lmavYuXSppNhLjNGOmLDonvzGbPKnFiVGs5NGMO7DCmGSyIEC1dtOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3MfHODpofwhbSDUDPghnFH60V2j9j8gXqqKfLBgwqVhp0Xkr3
	x7fQ6RVNDH/Gkdvf3pEDlIQv6w0tKHAAWt61dNudMTixo+m/D8FoIPY1QEVUtg0=
X-Google-Smtp-Source: AGHT+IHqv2IMWN3oXR6umOJo26p2rI5FNSuQAxfP5Ks/Hkq3jsOKqQQKyJ6wBA/PwN9+yj2xFK6XGw==
X-Received: by 2002:a05:6512:3d0a:b0:52e:74d5:89ae with SMTP id 2adb3069b0e04-5387c7799d8mr1295841e87.39.1727264470164;
        Wed, 25 Sep 2024 04:41:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a85e5bf3sm500872e87.75.2024.09.25.04.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 04:41:09 -0700 (PDT)
Date: Wed, 25 Sep 2024 14:41:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [RFC PATCH 0/4] Linaro restricted heap
Message-ID: <bktt4yanmfn4gjljy2wxmigj6mncpga237oxyf4g4h2vxu2a3q@asnsn7smi4u2>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <20240925071504.GA3519798@rayden>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925071504.GA3519798@rayden>

On Wed, Sep 25, 2024 at 09:15:04AM GMT, Jens Wiklander wrote:
> On Mon, Sep 23, 2024 at 09:33:29AM +0300, Dmitry Baryshkov wrote:
> > Hi,
> > 
> > On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> > > Hi,
> > > 
> > > This patch set is based on top of Yong Wu's restricted heap patch set [1].
> > > It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
> > > 
> > > The Linaro restricted heap uses genalloc in the kernel to manage the heap
> > > carvout. This is a difference from the Mediatek restricted heap which
> > > relies on the secure world to manage the carveout.
> > > 
> > > I've tried to adress the comments on [2], but [1] introduces changes so I'm
> > > afraid I've had to skip some comments.
> > 
> > I know I have raised the same question during LPC (in connection to
> > Qualcomm's dma-heap implementation). Is there any reason why we are
> > using generic heaps instead of allocating the dma-bufs on the device
> > side?
> > 
> > In your case you already have TEE device, you can use it to allocate and
> > export dma-bufs, which then get imported by the V4L and DRM drivers.
> > 
> > I have a feeling (I might be completely wrong here) that by using
> > generic dma-buf heaps we can easily end up in a situation when the
> > userspace depends heavily on the actual platform being used (to map the
> > platform to heap names). I think we should instead depend on the
> > existing devices (e.g. if there is a TEE device, use an IOCTL to
> > allocate secured DMA BUF from it, otherwise check for QTEE device,
> > otherwise check for some other vendor device).
> 
> That makes sense, it's similar to what we do with TEE_IOC_SHM_ALLOC
> where we allocate from a carveout reserverd for shared memory with the
> secure world. It was even based on dma-buf until commit dfd0743f1d9e
> ("tee: handle lookup of shm with reference count 0").
> 
> We should use a new TEE_IOC_*_ALLOC for these new dma-bufs to avoid
> confusion and to have more freedom when designing the interface.
> 
> > 
> > The mental experiment to check if the API is correct is really simple:
> > Can you use exactly the same rootfs on several devices without
> > any additional tuning (e.g. your QEMU, HiKey, a Mediatek board, Qualcomm
> > laptop, etc)?
> 
> No, I don't think so.

Then the API needs to be modified.

Or the userspace needs to be modified in the way similar to Vulkan /
OpenCL / glvnd / VA / VDPU: platform-specific backends, coexisting on a
single rootfs.

It is more or less fine to have platform-specific rootfs when we are
talking about the embedded, resource-limited devices. But for the
end-user devices we must be able to install a generic distro with no
device-specific packages being selected.

> 
> > 
> > > 
> > > This can be tested on QEMU with the following steps:
> > > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
> > >         -b prototype/sdp-v1
> > > repo sync -j8
> > > cd build
> > > make toolchains -j4
> > > make all -j$(nproc)
> > > make run-only
> > > # login and at the prompt:
> > > xtest --sdp-basic
> > > 
> > > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > > list dependencies needed to build the above.
> > > 
> > > The tests are pretty basic, mostly checking that a Trusted Application in
> > > the secure world can access and manipulate the memory.
> > 
> > - Can we test that the system doesn't crash badly if user provides
> >   non-secured memory to the users which expect a secure buffer?
> > 
> > - At the same time corresponding entities shouldn't decode data to the
> >   buffers accessible to the rest of the sytem.
> 
> I'll a few tests along that.
> 
> Thanks,
> Jens
> 
> > 
> > > 
> > > Cheers,
> > > Jens
> > > 
> > > [1] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
> > > [2] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/
> > > 
> > > Changes since Olivier's post [2]:
> > > * Based on Yong Wu's post [1] where much of dma-buf handling is done in
> > >   the generic restricted heap
> > > * Simplifications and cleanup
> > > * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
> > >   support"
> > > * Replaced the word "secure" with "restricted" where applicable
> > > 
> > > Etienne Carriere (1):
> > >   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
> > > 
> > > Jens Wiklander (2):
> > >   dma-buf: heaps: restricted_heap: add no_map attribute
> > >   dma-buf: heaps: add Linaro restricted dmabuf heap support
> > > 
> > > Olivier Masse (1):
> > >   dt-bindings: reserved-memory: add linaro,restricted-heap
> > > 
> > >  .../linaro,restricted-heap.yaml               |  56 ++++++
> > >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> > >  drivers/dma-buf/heaps/Makefile                |   1 +
> > >  drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
> > >  drivers/dma-buf/heaps/restricted_heap.h       |   2 +
> > >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
> > >  drivers/tee/tee_core.c                        |  38 ++++
> > >  drivers/tee/tee_shm.c                         | 104 ++++++++++-
> > >  include/linux/tee_drv.h                       |  11 ++
> > >  include/uapi/linux/tee.h                      |  29 +++
> > >  10 files changed, 426 insertions(+), 7 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
> > >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

