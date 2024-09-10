Return-Path: <linux-media+bounces-18083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E51973B01
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E4EB1F25A9D
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 15:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BD7199952;
	Tue, 10 Sep 2024 15:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XyQE/Rs6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5713D196D9D
	for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725980905; cv=none; b=Ym6r2+I0RsaTcxAM+oyceGDt5+Tq4Ic2bufuGZ1+yntGkBiPmAJ6ACll3v1ULoJDiR9ek4IihWmamxfoM8O2Z2PRJDp1JyI45SU8xtxJYhs6HQtlEsbOHivbfgrWq4eetuP7Y3HS7HUtW3sW0hNlpHZfQk4W6oVDujjsBDO6yB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725980905; c=relaxed/simple;
	bh=cluOAdWLruGLWs8Mw2B0TasmbULw+4l6OXqP0XPa2Us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VckmdCILLVEoa9gIdN1/VQY+PJPTCBbyq12wQ+1fnlDtCnT5ogbvVwke9zbeYwqEx3/MLO5BZqCQX+BpVIpv2VZqcvYDDMXUCOrdtiKNlNyCud+lsHzDMnsdI8zc3dtomYkjJpGv81gEr6JDjeBpM4VPol2iNmmAgMJSred0y4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XyQE/Rs6; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4582b71df40so270301cf.1
        for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725980902; x=1726585702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiSPE2re4i7ztv5W1E1npIwrh98/6F2AGMg3S1xMoPU=;
        b=XyQE/Rs6MGv3uS1h1IkSeXNP1A53N6CWEaNQifNWySbKxS1+sD9unHX1l9sPgBaNAc
         +MtKsDgfChC/t2M76dnDREIvYqWo4DQi7ANR6X8IjcNvyIjLb5ZY4GLCHfaSrA96GqVW
         3QjoCGv53xr3P49ED3rvS+VxHLVmjcf0tpDZy/fDBtWrIMGRlqxa2NqY9nKQOrodcKfd
         GJRcuzQGktpCdYjvLd/kCuy4yq5fkkjOsiKsyFnq8KVfXxpfxbtohbW7p6/gpPvDuFO4
         REDoFrnBilflYCh3GLJ04gk9ssgNZlCJ1vpAxajm886o8qPVXTx15VNK2twqk4NkwQjB
         GReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725980902; x=1726585702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiSPE2re4i7ztv5W1E1npIwrh98/6F2AGMg3S1xMoPU=;
        b=A0Gb+6molPU/fyvvjtT3TOJw73yIKfqJB8ck9BNjlLnp/8Uf1DIrFd8+fhN1p1MDOI
         mYuKgwDbyHdPlQIesei5GLzqIfFjL/+E3LKYVqNXfwb6s6FajYbcceQOIROYL0/3oyhr
         Y/daR1/dXBlYOhG1l1DkSwUp7QCDXCWEhx0LQOQ4R69FyrrkQyGo80g0HOCcq7I9EuyF
         FTz0bPF32qRVQz8aIYp4T+k5YtF3gwLYOdgWXiQGgrbu+nU5pyTK4auNA+e9mpuZCb+h
         IfkzHuX1apZpvlAaetYIYM2vnDbkdTea0ZtgA1wg8iruZ5o8u1lKVb1fWboGJSab1zsM
         fF/A==
X-Forwarded-Encrypted: i=1; AJvYcCXV0PRXy3aZGFo5ycB6nDUDBGvLBHDtWEPJuf8Rsr+Hv7s3TN9Hw26/tNEpBHN9Ltz+WEC0I5/KvH0oag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGkDR+WI/uV71BYItGPPzCyv5dzxWogyIfieRx/1YkMaKs4jGh
	XZBoLU1yLOwBTo6T9EKWmuLAzPLIbO3KW18LEDNJKJjBg1CN+XdrjNLh/9CQ2PGAt80Nu/uVEwU
	37Sk13qRyaneUjduI2FxNN+5p7h0YnZoK4J8V
X-Google-Smtp-Source: AGHT+IGk/+MqjVLBNa+qD5EowmlfqCvCzaFlTfS1uq8t2r3RhadFZpBGCv9ceFcyyjW5GiIdk+Cu14iQs471/8FCg7c=
X-Received: by 2002:ac8:5dc6:0:b0:456:7ef1:929d with SMTP id
 d75a77b69052e-4583d0600f1mr4121411cf.12.1725980901915; Tue, 10 Sep 2024
 08:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-5-jens.wiklander@linaro.org> <CABdmKX2KzswmiDY4oWw69_rPWs8d_Cqp7OXouSeMQaYX1SDSmw@mail.gmail.com>
 <CAHUa44FYYFVQWf0DGUXNHoOVQEC0-HRyYa0386dHNjo4y1qSiQ@mail.gmail.com>
 <CABdmKX0qd0RoTn2TBQTs9zdf=_JP8pW8hFRUR_7n_t-sfxsGdg@mail.gmail.com> <CAHUa44E-7UMseWSEeneYYnAPyhH___=a1YYR6uaOVTNZytzg7g@mail.gmail.com>
In-Reply-To: <CAHUa44E-7UMseWSEeneYYnAPyhH___=a1YYR6uaOVTNZytzg7g@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 10 Sep 2024 08:08:10 -0700
Message-ID: <CABdmKX2Tsp-KG6_Lth7VUcZcxCfgbsBYqZ5N2h574J+sNP2SxA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] dma-buf: heaps: add Linaro restricted dmabuf heap support
To: Jens Wiklander <jens.wiklander@linaro.org>
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

On Mon, Sep 9, 2024 at 11:06=E2=80=AFPM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> On Wed, Sep 4, 2024 at 11:42=E2=80=AFPM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > On Wed, Sep 4, 2024 at 2:44=E2=80=AFAM Jens Wiklander <jens.wiklander@l=
inaro.org> wrote:
> > >
> > > On Tue, Sep 3, 2024 at 7:50=E2=80=AFPM T.J. Mercier <tjmercier@google=
.com> wrote:
> > > >
> > > > On Fri, Aug 30, 2024 at 12:04=E2=80=AFAM Jens Wiklander
> > > > <jens.wiklander@linaro.org> wrote:
> > > > >
> > > > > Add a Linaro restricted heap using the linaro,restricted-heap bin=
dings
> > > > > implemented based on the generic restricted heap.
> > > > >
> > > > > The bindings defines a range of physical restricted memory. The h=
eap
> > > > > manages this address range using genalloc. The allocated dma-buf =
file
> > > > > descriptor can later be registered with the TEE subsystem for lat=
er use
> > > > > via Trusted Applications in the secure world.
> > > > >
> > > > > Co-developed-by: Olivier Masse <olivier.masse@nxp.com>
> > > > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > ---
> > > > >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> > > > >  drivers/dma-buf/heaps/Makefile                |   1 +
> > > > >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++=
++++++
> > > > >  3 files changed, 176 insertions(+)
> > > > >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.=
c
> > > > >
> > > > > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heap=
s/Kconfig
> > > > > index 58903bc62ac8..82e2c5d09242 100644
> > > > > --- a/drivers/dma-buf/heaps/Kconfig
> > > > > +++ b/drivers/dma-buf/heaps/Kconfig
> > > > > @@ -28,3 +28,13 @@ config DMABUF_HEAPS_RESTRICTED_MTK
> > > > >         help
> > > > >           Enable restricted dma-buf heaps for MediaTek platform. =
This heap is backed by
> > > > >           TEE client interfaces. If in doubt, say N.
> > > > > +
> > > > > +config DMABUF_HEAPS_RESTRICTED_LINARO
> > > > > +       bool "Linaro DMA-BUF Restricted Heap"
> > > > > +       depends on DMABUF_HEAPS_RESTRICTED
> > > > > +       help
> > > > > +         Choose this option to enable the Linaro restricted dma-=
buf heap.
> > > > > +         The restricted heap pools are defined according to the =
DT. Heaps
> > > > > +         are allocated in the pools using gen allocater.
> > > > > +         If in doubt, say N.
> > > > > +
> > > > > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/hea=
ps/Makefile
> > > > > index 0028aa9d875f..66b2f67c47b5 100644
> > > > > --- a/drivers/dma-buf/heaps/Makefile
> > > > > +++ b/drivers/dma-buf/heaps/Makefile
> > > > > @@ -2,4 +2,5 @@
> > > > >  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
> > > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)  +=3D restricted_heap.o
> > > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)      +=3D restricted_h=
eap_mtk.o
> > > > > +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_LINARO)   +=3D restricted_h=
eap_linaro.o
> > > > >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
> > > > > diff --git a/drivers/dma-buf/heaps/restricted_heap_linaro.c b/dri=
vers/dma-buf/heaps/restricted_heap_linaro.c
> > > > > new file mode 100644
> > > > > index 000000000000..4b08ed514023
> > > > > --- /dev/null
> > > > > +++ b/drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > > > @@ -0,0 +1,165 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * DMABUF secure heap exporter
> > > > > + *
> > > > > + * Copyright 2021 NXP.
> > > > > + * Copyright 2024 Linaro Limited.
> > > > > + */
> > > > > +
> > > > > +#define pr_fmt(fmt)     "rheap_linaro: " fmt
> > > > > +
> > > > > +#include <linux/dma-buf.h>
> > > > > +#include <linux/err.h>
> > > > > +#include <linux/genalloc.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/of.h>
> > > > > +#include <linux/of_fdt.h>
> > > > > +#include <linux/of_reserved_mem.h>
> > > > > +#include <linux/scatterlist.h>
> > > > > +#include <linux/slab.h>
> > > > > +
> > > > > +#include "restricted_heap.h"
> > > > > +
> > > > > +#define MAX_HEAP_COUNT 2
> > > >
> > > > Are multiple supported because of what Cyrille mentioned here about=
 permissions?
> > > > https://lore.kernel.org/lkml/DBBPR04MB7514E006455AEA407041E4F788709=
@DBBPR04MB7514.eurprd04.prod.outlook.com/
> > >
> > > Yes, I kept that as is.
> >
> > Ok thanks.
> >
> > > > So this is just some arbitrary limit? I'd prefer to have some sort =
of
> > > > documentation about this.
> > >
> > > How about removing the limit and using dynamic allocation instead?
> >
> > That works too!
>
> It turns out that was easier said than done. The limit is hardcoded
> because dynamic memory allocation isn't available at that stage during
> boot. We have a short description of this heap in Kconfig. I'll add
> something about the limit there if that makes sense.
>
> Thanks,
> Jens

Ah ok sounds good.

I noticed one other thing, linaro_restricted_heap_init and add_heap
should probably have __init. Last week I sent a patch to add that for
the CMA and system heaps.

