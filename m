Return-Path: <linux-media+bounces-18045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C199972949
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 08:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B05A61C2108B
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 06:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C7B17A589;
	Tue, 10 Sep 2024 06:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CBzntBuK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B25B172BA8
	for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725948421; cv=none; b=YOWZHw/fWnp2V/IaqvjvoaO1TP+9aMPvXjReObJu8qfcDGeKjBuvzS2s2zwra1RfuoDLvL4X0EOhBOBI9WXjZLqgnfv440I7nhCJvwaTPq8P3aR8sbHUTbQaOvp7g4juNxT74tkrm1SN9Nlh5KN/iUmmeSzVmP2+ISDkDsFQyBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725948421; c=relaxed/simple;
	bh=Y4IUApUSHTsnmcu4wF4wE4pQLfT7M//t+j035MFadwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tqN5NockWrGwP+JjdsFAyRZLiXYRMuUkskGPzrVc02xXNMPHg8gpfGTx6njMmmit2rbah4zgHrtGlx1SQh9tdvGjMH9xkgQMAQlZ7hZoLieTleoWQKlz31VPNFvXelIMt4GgARDdH5JtSsut0JHwfwj8RYeNAhVY1OkoohGqxE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CBzntBuK; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-27b55c4b35eso2429491fac.3
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2024 23:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725948418; x=1726553218; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9MHdiQIKbQZ7sHVzFN+NNCUWOQwDHp5p4yZrC2v9dg=;
        b=CBzntBuK2A80ovZYB1HZeo1BQcV1R3JOEpzWXtSSPd97UEQgaaQ/giTYolQiIlr+L0
         h8PwVtwiwPLypvtN/15CnRw1nWQWh9v47565FNPzLypO8K9hzscNCsxmp+q3g5u0Heyw
         iTEVkuW8Na+SOpW2LzN7YMOKjwAqPKOTvuvnj+hkqo/QEM/W1w7iufVPCGlwcbWyUxKo
         L+Oa6hURcTi9CrPmrEe/ep93cCXFh/K39VS9lgOkpgXOngus3Kc8EmxaNJDPbwnnhxt1
         UreKI9e7FOGBDmO/wFWkv5kpE27cFx9CeeM5PRWF8FhPMjvhbF7GIv2uRsStrbuIsvez
         CRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725948418; x=1726553218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9MHdiQIKbQZ7sHVzFN+NNCUWOQwDHp5p4yZrC2v9dg=;
        b=wkPOKkRzfiVz1JepVaX7LmIsAbjzPxL+VA4GBR2qBHFKZyi3aAa1AZZL5adzNlBYUk
         j4RFPPzDkpNsz0Cswp6z6kpg8jx64RS4rifTW4kJc9N3ohJ+NRfMtbXgLTqpcuH4egeR
         Ua1GhQtCrdIQi9fQqwQVHIzuqzgu9G413j13T2bgGaqcCfOj6vwDRHDiA8IRn3h97CKA
         nTwS6mcTxy9tbM4jvMxAaIaLNusX08vfAWsfwGGsyUKWc/d8gtXONbouqVIo7MI5SXPU
         POAVLd4BH/5VLohga3oKG5ZkhFwYj5e8/ZAMHOPzunZHfQ0FGTfxI3vpsifUsI+m5pCb
         0KCw==
X-Forwarded-Encrypted: i=1; AJvYcCW5QCREz+uSh2s2QxyXCIvRbFqk2+TyEsM8q4VYRXNxgUrhwcCKag6YM7GALbsFVsCQCGmSX0O83gBlDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsYFsLFb0+OchMZjktnWYnXULwcaJEgumQI1Zm8xSxiCETP4jE
	jDSWJjGbi0+nBW9QCEjxV5Nr/zolDZ8h+flOqLpzKplA6+P2k9octah7sESM9jTEoD58eS/qUd1
	sMUruSxdeQWF8yhV+2++qTw6VeAz9zTD6e+JRnQ==
X-Google-Smtp-Source: AGHT+IEICe98dkZbn2Ns9nln8TerGdgfmay8kae6nOnNQUjTdvKEr1T8PPGslpKcLz8r5N2w/0aeGsRv9D3S4R0GNlg=
X-Received: by 2002:a05:6870:9122:b0:278:22d3:53 with SMTP id
 586e51a60fabf-27b82e076cdmr13465979fac.12.1725948418296; Mon, 09 Sep 2024
 23:06:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-5-jens.wiklander@linaro.org> <CABdmKX2KzswmiDY4oWw69_rPWs8d_Cqp7OXouSeMQaYX1SDSmw@mail.gmail.com>
 <CAHUa44FYYFVQWf0DGUXNHoOVQEC0-HRyYa0386dHNjo4y1qSiQ@mail.gmail.com> <CABdmKX0qd0RoTn2TBQTs9zdf=_JP8pW8hFRUR_7n_t-sfxsGdg@mail.gmail.com>
In-Reply-To: <CABdmKX0qd0RoTn2TBQTs9zdf=_JP8pW8hFRUR_7n_t-sfxsGdg@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 10 Sep 2024 08:06:46 +0200
Message-ID: <CAHUa44E-7UMseWSEeneYYnAPyhH___=a1YYR6uaOVTNZytzg7g@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] dma-buf: heaps: add Linaro restricted dmabuf heap support
To: "T.J. Mercier" <tjmercier@google.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 11:42=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Wed, Sep 4, 2024 at 2:44=E2=80=AFAM Jens Wiklander <jens.wiklander@lin=
aro.org> wrote:
> >
> > On Tue, Sep 3, 2024 at 7:50=E2=80=AFPM T.J. Mercier <tjmercier@google.c=
om> wrote:
> > >
> > > On Fri, Aug 30, 2024 at 12:04=E2=80=AFAM Jens Wiklander
> > > <jens.wiklander@linaro.org> wrote:
> > > >
> > > > Add a Linaro restricted heap using the linaro,restricted-heap bindi=
ngs
> > > > implemented based on the generic restricted heap.
> > > >
> > > > The bindings defines a range of physical restricted memory. The hea=
p
> > > > manages this address range using genalloc. The allocated dma-buf fi=
le
> > > > descriptor can later be registered with the TEE subsystem for later=
 use
> > > > via Trusted Applications in the secure world.
> > > >
> > > > Co-developed-by: Olivier Masse <olivier.masse@nxp.com>
> > > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > ---
> > > >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> > > >  drivers/dma-buf/heaps/Makefile                |   1 +
> > > >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++=
++++
> > > >  3 files changed, 176 insertions(+)
> > > >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > >
> > > > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/=
Kconfig
> > > > index 58903bc62ac8..82e2c5d09242 100644
> > > > --- a/drivers/dma-buf/heaps/Kconfig
> > > > +++ b/drivers/dma-buf/heaps/Kconfig
> > > > @@ -28,3 +28,13 @@ config DMABUF_HEAPS_RESTRICTED_MTK
> > > >         help
> > > >           Enable restricted dma-buf heaps for MediaTek platform. Th=
is heap is backed by
> > > >           TEE client interfaces. If in doubt, say N.
> > > > +
> > > > +config DMABUF_HEAPS_RESTRICTED_LINARO
> > > > +       bool "Linaro DMA-BUF Restricted Heap"
> > > > +       depends on DMABUF_HEAPS_RESTRICTED
> > > > +       help
> > > > +         Choose this option to enable the Linaro restricted dma-bu=
f heap.
> > > > +         The restricted heap pools are defined according to the DT=
. Heaps
> > > > +         are allocated in the pools using gen allocater.
> > > > +         If in doubt, say N.
> > > > +
> > > > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps=
/Makefile
> > > > index 0028aa9d875f..66b2f67c47b5 100644
> > > > --- a/drivers/dma-buf/heaps/Makefile
> > > > +++ b/drivers/dma-buf/heaps/Makefile
> > > > @@ -2,4 +2,5 @@
> > > >  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
> > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)  +=3D restricted_heap.o
> > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)      +=3D restricted_hea=
p_mtk.o
> > > > +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_LINARO)   +=3D restricted_hea=
p_linaro.o
> > > >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
> > > > diff --git a/drivers/dma-buf/heaps/restricted_heap_linaro.c b/drive=
rs/dma-buf/heaps/restricted_heap_linaro.c
> > > > new file mode 100644
> > > > index 000000000000..4b08ed514023
> > > > --- /dev/null
> > > > +++ b/drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > > @@ -0,0 +1,165 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * DMABUF secure heap exporter
> > > > + *
> > > > + * Copyright 2021 NXP.
> > > > + * Copyright 2024 Linaro Limited.
> > > > + */
> > > > +
> > > > +#define pr_fmt(fmt)     "rheap_linaro: " fmt
> > > > +
> > > > +#include <linux/dma-buf.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/genalloc.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/of_fdt.h>
> > > > +#include <linux/of_reserved_mem.h>
> > > > +#include <linux/scatterlist.h>
> > > > +#include <linux/slab.h>
> > > > +
> > > > +#include "restricted_heap.h"
> > > > +
> > > > +#define MAX_HEAP_COUNT 2
> > >
> > > Are multiple supported because of what Cyrille mentioned here about p=
ermissions?
> > > https://lore.kernel.org/lkml/DBBPR04MB7514E006455AEA407041E4F788709@D=
BBPR04MB7514.eurprd04.prod.outlook.com/
> >
> > Yes, I kept that as is.
>
> Ok thanks.
>
> > > So this is just some arbitrary limit? I'd prefer to have some sort of
> > > documentation about this.
> >
> > How about removing the limit and using dynamic allocation instead?
>
> That works too!

It turns out that was easier said than done. The limit is hardcoded
because dynamic memory allocation isn't available at that stage during
boot. We have a short description of this heap in Kconfig. I'll add
something about the limit there if that makes sense.

Thanks,
Jens

