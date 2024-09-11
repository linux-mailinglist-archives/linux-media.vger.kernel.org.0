Return-Path: <linux-media+bounces-18147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 285F2974A02
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 07:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D4DF1F273C8
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 05:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF7B762EF;
	Wed, 11 Sep 2024 05:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jY4QXMZR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04367346F
	for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 05:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726034330; cv=none; b=fjxothNJqVSaYWlavBC+Yq1ZKGKKVisjOTgxc+ACeVtGJfQ3aHI1M7hLfobR246ZRunk6yy6Efo32eY2+ipFvMGTwwHCsrpVDbUrfpeG3tlwuIV//nkTS2Zquv+n7TgAA4Sa/MsiggqK9rgiQ7OKaCrrZBbJWJ+AbUOAIQ4EcwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726034330; c=relaxed/simple;
	bh=3ok7yo4oBzKzexipDG+AmGLtd7pJpE6pVgjrRvNErKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZDQhL44Wlx7gBoc89kWpDT37mOpJng1KdmgO92W8gX9lKvBREBEyqom6L7pwA5L7EORGY/dB4dWeIN04Apfk0CtMAI0w6N2i3hrRJbLY6x1oJUbFHFFNJOpunVYsT+4//WPkHKutAuByatwXr1uBTs3IPX2A4oSxHWLpoAfSJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jY4QXMZR; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5e19b1656ddso3333564eaf.0
        for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 22:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726034328; x=1726639128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQuYmmGkZQSTH3xLGsMnzwcqDZfFYWN76TvS9W1XNG8=;
        b=jY4QXMZRtLCK/vEGOaqo8u4etn4aT/lAp4dpProalGyAuzvuNMuSYLdFUvvePotunc
         GMaY/LmwsYMqgwaWmt5bFhGi5VAfI5u8ngMR0LvPvdWn3hCPIaFbd+5m81iEDh04Kon7
         fVq3UisznPEs/A0a652KC0JVzBMZaubo1/QmVMRXmgdkg7oYHCvYUln/8pP31aTxyWRD
         7RuXh5/Hi/V63Q2K7g956hiOTOMNdciQiej0SyiW9XGS4jHJ5pFaHUoLN6xQFW6naWqF
         MjGUmQhabvsnb1scbXDyC524v4z4/sQN4icGIw3y3fS1NjVEfTHBadH2/5RcF5qwpACs
         0/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726034328; x=1726639128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQuYmmGkZQSTH3xLGsMnzwcqDZfFYWN76TvS9W1XNG8=;
        b=bDRIeh4RiYUNN44DxKiEILxHYTE6iQ6L/MzN8IibEy45oY6wqYHjdpAuwgh7/BYiSW
         Zk9EAg8YfM3fs0CWxmJV9K4fIersCLeRDcpiB9vWxfKLv05L0e3xuMIUveaAVgLQLRiz
         jNI4xa6Ca+ykaLjtySL3dCtake+j47a3tlF4+PstiHr6LsawOrehmgPjwP7imTT60EPp
         7HM/kyzpQfEBqG+WbMMkH1wAkXyQ2rx45XdVFnC8bSTb70BwfvK2O6WOvpQyfC2hVX1K
         vFqsCnneBpZ26okbNfXOLtEtN/v0SoCulOJdICVsJi4+MKduL9WGwI7+EKgTdv5FY1ul
         KY1A==
X-Forwarded-Encrypted: i=1; AJvYcCXA2rsHkTPyWs9z1zVoko7Zs3VQtP7WkkRuI41lfenI1cE0TEg0h/CnQrFXnGIlL2BdJQgSOrJ+uUJccQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiUC0vMmEZVYe6wKJ6leAyPdfHaaX6FAqUFQt5mmQsv3w22I9s
	E1nxIhIzF54o4M786NfOPBKwZD/jqkWqDwvj0Ik6XOcqFbsOUqjDXK0LhSVOQvfGRJjPzca9GxH
	jI+ayS9MA3NPe+Cx920+JiX0PANFGgnx3TpyNdA==
X-Google-Smtp-Source: AGHT+IGW84UWOA5xC2203pkvht57DpEX0/BC3BhwlaltfaRSJeBxnIuKEFhXcRdVK9MgL8mADdwKjHbUJPQhBWPPeEQ=
X-Received: by 2002:a05:6870:469e:b0:277:ca2f:905 with SMTP id
 586e51a60fabf-27b82fab148mr16719695fac.29.1726034327791; Tue, 10 Sep 2024
 22:58:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-5-jens.wiklander@linaro.org> <CABdmKX2KzswmiDY4oWw69_rPWs8d_Cqp7OXouSeMQaYX1SDSmw@mail.gmail.com>
 <CAHUa44FYYFVQWf0DGUXNHoOVQEC0-HRyYa0386dHNjo4y1qSiQ@mail.gmail.com>
 <CABdmKX0qd0RoTn2TBQTs9zdf=_JP8pW8hFRUR_7n_t-sfxsGdg@mail.gmail.com>
 <CAHUa44E-7UMseWSEeneYYnAPyhH___=a1YYR6uaOVTNZytzg7g@mail.gmail.com> <CABdmKX2Tsp-KG6_Lth7VUcZcxCfgbsBYqZ5N2h574J+sNP2SxA@mail.gmail.com>
In-Reply-To: <CABdmKX2Tsp-KG6_Lth7VUcZcxCfgbsBYqZ5N2h574J+sNP2SxA@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 11 Sep 2024 07:58:36 +0200
Message-ID: <CAHUa44G9j4rOZHX+XCQyM+mkru12Hy01iyj=USHHiD0raTDfZA@mail.gmail.com>
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

On Tue, Sep 10, 2024 at 5:08=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Mon, Sep 9, 2024 at 11:06=E2=80=AFPM Jens Wiklander
> <jens.wiklander@linaro.org> wrote:
> >
> > On Wed, Sep 4, 2024 at 11:42=E2=80=AFPM T.J. Mercier <tjmercier@google.=
com> wrote:
> > >
> > > On Wed, Sep 4, 2024 at 2:44=E2=80=AFAM Jens Wiklander <jens.wiklander=
@linaro.org> wrote:
> > > >
> > > > On Tue, Sep 3, 2024 at 7:50=E2=80=AFPM T.J. Mercier <tjmercier@goog=
le.com> wrote:
> > > > >
> > > > > On Fri, Aug 30, 2024 at 12:04=E2=80=AFAM Jens Wiklander
> > > > > <jens.wiklander@linaro.org> wrote:
> > > > > >
> > > > > > Add a Linaro restricted heap using the linaro,restricted-heap b=
indings
> > > > > > implemented based on the generic restricted heap.
> > > > > >
> > > > > > The bindings defines a range of physical restricted memory. The=
 heap
> > > > > > manages this address range using genalloc. The allocated dma-bu=
f file
> > > > > > descriptor can later be registered with the TEE subsystem for l=
ater use
> > > > > > via Trusted Applications in the secure world.
> > > > > >
> > > > > > Co-developed-by: Olivier Masse <olivier.masse@nxp.com>
> > > > > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > > ---
> > > > > >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> > > > > >  drivers/dma-buf/heaps/Makefile                |   1 +
> > > > > >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++=
++++++++
> > > > > >  3 files changed, 176 insertions(+)
> > > > > >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linar=
o.c
> > > > > >
> > > > > > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/he=
aps/Kconfig
> > > > > > index 58903bc62ac8..82e2c5d09242 100644
> > > > > > --- a/drivers/dma-buf/heaps/Kconfig
> > > > > > +++ b/drivers/dma-buf/heaps/Kconfig
> > > > > > @@ -28,3 +28,13 @@ config DMABUF_HEAPS_RESTRICTED_MTK
> > > > > >         help
> > > > > >           Enable restricted dma-buf heaps for MediaTek platform=
. This heap is backed by
> > > > > >           TEE client interfaces. If in doubt, say N.
> > > > > > +
> > > > > > +config DMABUF_HEAPS_RESTRICTED_LINARO
> > > > > > +       bool "Linaro DMA-BUF Restricted Heap"
> > > > > > +       depends on DMABUF_HEAPS_RESTRICTED
> > > > > > +       help
> > > > > > +         Choose this option to enable the Linaro restricted dm=
a-buf heap.
> > > > > > +         The restricted heap pools are defined according to th=
e DT. Heaps
> > > > > > +         are allocated in the pools using gen allocater.
> > > > > > +         If in doubt, say N.
> > > > > > +
> > > > > > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/h=
eaps/Makefile
> > > > > > index 0028aa9d875f..66b2f67c47b5 100644
> > > > > > --- a/drivers/dma-buf/heaps/Makefile
> > > > > > +++ b/drivers/dma-buf/heaps/Makefile
> > > > > > @@ -2,4 +2,5 @@
> > > > > >  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
> > > > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)  +=3D restricted_heap.o
> > > > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)      +=3D restricted=
_heap_mtk.o
> > > > > > +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_LINARO)   +=3D restricted=
_heap_linaro.o
> > > > > >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
> > > > > > diff --git a/drivers/dma-buf/heaps/restricted_heap_linaro.c b/d=
rivers/dma-buf/heaps/restricted_heap_linaro.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..4b08ed514023
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > > > > @@ -0,0 +1,165 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > +/*
> > > > > > + * DMABUF secure heap exporter
> > > > > > + *
> > > > > > + * Copyright 2021 NXP.
> > > > > > + * Copyright 2024 Linaro Limited.
> > > > > > + */
> > > > > > +
> > > > > > +#define pr_fmt(fmt)     "rheap_linaro: " fmt
> > > > > > +
> > > > > > +#include <linux/dma-buf.h>
> > > > > > +#include <linux/err.h>
> > > > > > +#include <linux/genalloc.h>
> > > > > > +#include <linux/module.h>
> > > > > > +#include <linux/of.h>
> > > > > > +#include <linux/of_fdt.h>
> > > > > > +#include <linux/of_reserved_mem.h>
> > > > > > +#include <linux/scatterlist.h>
> > > > > > +#include <linux/slab.h>
> > > > > > +
> > > > > > +#include "restricted_heap.h"
> > > > > > +
> > > > > > +#define MAX_HEAP_COUNT 2
> > > > >
> > > > > Are multiple supported because of what Cyrille mentioned here abo=
ut permissions?
> > > > > https://lore.kernel.org/lkml/DBBPR04MB7514E006455AEA407041E4F7887=
09@DBBPR04MB7514.eurprd04.prod.outlook.com/
> > > >
> > > > Yes, I kept that as is.
> > >
> > > Ok thanks.
> > >
> > > > > So this is just some arbitrary limit? I'd prefer to have some sor=
t of
> > > > > documentation about this.
> > > >
> > > > How about removing the limit and using dynamic allocation instead?
> > >
> > > That works too!
> >
> > It turns out that was easier said than done. The limit is hardcoded
> > because dynamic memory allocation isn't available at that stage during
> > boot. We have a short description of this heap in Kconfig. I'll add
> > something about the limit there if that makes sense.
> >
> > Thanks,
> > Jens
>
> Ah ok sounds good.
>
> I noticed one other thing, linaro_restricted_heap_init and add_heap
> should probably have __init. Last week I sent a patch to add that for
> the CMA and system heaps.

Thanks, I'll add it.

Cheers,
Jens

