Return-Path: <linux-media+bounces-17633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8A596C9A6
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 23:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A2111C22C82
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 21:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8039B158DC0;
	Wed,  4 Sep 2024 21:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YEOC6V1b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4975915531A
	for <linux-media@vger.kernel.org>; Wed,  4 Sep 2024 21:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725486163; cv=none; b=jzsf3a3mqSHiY6Cxt8crh06KGBbDc0jehFv57IgjrD7cAqyydzKmFeer7v/Tu32WgTjLC3AnPE+8hhu7xg4w+i+XmDx35+YPh43VYSk59G5HkYf6Fa2gv8/sN/SXhFCi/DZvENfcQnMPsgiH20sdhyEt92giFYlf4IKf010llhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725486163; c=relaxed/simple;
	bh=KtTrjbXMm5Ep1uqcyAukOJBqnTT0O5VTFz1w8zRQVh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gsUWIL8E2uKOCunV4t/0kMeprpNpax9lzwF8TbKPN9bu+wXTfHAnVxZnaq8OU2ygH+N821eqOkJm3roFbNWf/eF84o/j/5TljHTUbZVPuUL9ldU0s0UKQkHD/tVPEPZONodSnCl4myuf2slHM970AoYZeGivbE9fiJuTayksTw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YEOC6V1b; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-457c6389a3aso38561cf.1
        for <linux-media@vger.kernel.org>; Wed, 04 Sep 2024 14:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725486161; x=1726090961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUOw5lMiHDw0MiG7UAI15FhQeJ9HSg6Beuvp398enyw=;
        b=YEOC6V1b9STIWCN0RxUV4cWor4ieyNwsugHs82oE7NkcPTeobYz//qs74/EQsB/l0+
         0trT4T3BsyhSJN8Jxx8jcCwm2igpYoAB2qkUIa3vNN/1sK5ycvE1jiXHOPGzxtu72oVq
         uAw0gQFKizjhzesvwRaXrmOh+OtbcNGy1IkYwwkAT5wNhZFRnDzOROGN2+x7LgqkJOtm
         yJUo5xZqk4PQkRosrhmVPJhIZhPSFLl+Fod6OljKjwOrjYSrt2bVnWxP8NG4lpqPEXLp
         jRX56kBIN+sxhWsw+GCyE7Xjavyix9ADEhV0c53UmQYLti8YDB58Reh+WWAh6MFORcDR
         40Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725486161; x=1726090961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUOw5lMiHDw0MiG7UAI15FhQeJ9HSg6Beuvp398enyw=;
        b=jovwBPyIwyWlVlPoIYKgpG3dMS4HkNv5tdZJG3W0jivMtwykkQyJqEwIXHRn/Xp5jN
         6sJi5lEznVgazsJfTVCFmsBmHHKQksHOqGWVquZ/sLZZjTEmc6i4+kfXPMbS4pD5ERxR
         LvlaehSibxa++l/pHWAoSD1Sw5cv2YqyvuCTXEl/ngAMCA0CV2j6EtTUykxHwRZZbSzb
         ttcwhYiyvkPeuOhR0GpqrJT2F9malSyTbZK7rPtXAHEvgrsxJPYLBoBAeRjQ7JgtWeca
         2OU5E7j/Eq2OC7CjOuloZoHxuuMccCGPfDioIujBmPee4ZWccBLkVIs7ly2GhhfD2wwG
         kT3A==
X-Forwarded-Encrypted: i=1; AJvYcCUYDk4cTE9SS9owyvV9rzzCbH849EywMevOO8uXh6YFiIUWb5TUdBr3L9ed9TkfPHfcIGYX62wsUkaeBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVizl1esXzvB048vquA53HxtslejmJRWLZxE6oSkpdySIrFArc
	W7Ov7GUQcMTuujV2ZGjmASIK3dzNA2Tf318HE50dUdM+1LWvXGZve0a/WR4M4yY4FDEhcVJZ4gO
	CJ1qNkP+6rzGz23GzO/0Hdmmo7E2OgFHalFG9
X-Google-Smtp-Source: AGHT+IEpGF7+WsKzz/JrGdpbLM/PeRMTZKHHeKwab0nvhh64NIvNlNBwZyTBj3hwa0VujqMyfqFoFxJtF/XvbPvKPO0=
X-Received: by 2002:a05:622a:6790:b0:456:7d9f:2af8 with SMTP id
 d75a77b69052e-458033f9c82mr245311cf.7.1725486160847; Wed, 04 Sep 2024
 14:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-5-jens.wiklander@linaro.org> <CABdmKX2KzswmiDY4oWw69_rPWs8d_Cqp7OXouSeMQaYX1SDSmw@mail.gmail.com>
 <CAHUa44FYYFVQWf0DGUXNHoOVQEC0-HRyYa0386dHNjo4y1qSiQ@mail.gmail.com>
In-Reply-To: <CAHUa44FYYFVQWf0DGUXNHoOVQEC0-HRyYa0386dHNjo4y1qSiQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 4 Sep 2024 14:42:28 -0700
Message-ID: <CABdmKX0qd0RoTn2TBQTs9zdf=_JP8pW8hFRUR_7n_t-sfxsGdg@mail.gmail.com>
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

On Wed, Sep 4, 2024 at 2:44=E2=80=AFAM Jens Wiklander <jens.wiklander@linar=
o.org> wrote:
>
> On Tue, Sep 3, 2024 at 7:50=E2=80=AFPM T.J. Mercier <tjmercier@google.com=
> wrote:
> >
> > On Fri, Aug 30, 2024 at 12:04=E2=80=AFAM Jens Wiklander
> > <jens.wiklander@linaro.org> wrote:
> > >
> > > Add a Linaro restricted heap using the linaro,restricted-heap binding=
s
> > > implemented based on the generic restricted heap.
> > >
> > > The bindings defines a range of physical restricted memory. The heap
> > > manages this address range using genalloc. The allocated dma-buf file
> > > descriptor can later be registered with the TEE subsystem for later u=
se
> > > via Trusted Applications in the secure world.
> > >
> > > Co-developed-by: Olivier Masse <olivier.masse@nxp.com>
> > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > ---
> > >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> > >  drivers/dma-buf/heaps/Makefile                |   1 +
> > >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++=
++
> > >  3 files changed, 176 insertions(+)
> > >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> > >
> > > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kc=
onfig
> > > index 58903bc62ac8..82e2c5d09242 100644
> > > --- a/drivers/dma-buf/heaps/Kconfig
> > > +++ b/drivers/dma-buf/heaps/Kconfig
> > > @@ -28,3 +28,13 @@ config DMABUF_HEAPS_RESTRICTED_MTK
> > >         help
> > >           Enable restricted dma-buf heaps for MediaTek platform. This=
 heap is backed by
> > >           TEE client interfaces. If in doubt, say N.
> > > +
> > > +config DMABUF_HEAPS_RESTRICTED_LINARO
> > > +       bool "Linaro DMA-BUF Restricted Heap"
> > > +       depends on DMABUF_HEAPS_RESTRICTED
> > > +       help
> > > +         Choose this option to enable the Linaro restricted dma-buf =
heap.
> > > +         The restricted heap pools are defined according to the DT. =
Heaps
> > > +         are allocated in the pools using gen allocater.
> > > +         If in doubt, say N.
> > > +
> > > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/M=
akefile
> > > index 0028aa9d875f..66b2f67c47b5 100644
> > > --- a/drivers/dma-buf/heaps/Makefile
> > > +++ b/drivers/dma-buf/heaps/Makefile
> > > @@ -2,4 +2,5 @@
> > >  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
> > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)  +=3D restricted_heap.o
> > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)      +=3D restricted_heap_=
mtk.o
> > > +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_LINARO)   +=3D restricted_heap_=
linaro.o
> > >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
> > > diff --git a/drivers/dma-buf/heaps/restricted_heap_linaro.c b/drivers=
/dma-buf/heaps/restricted_heap_linaro.c
> > > new file mode 100644
> > > index 000000000000..4b08ed514023
> > > --- /dev/null
> > > +++ b/drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > @@ -0,0 +1,165 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * DMABUF secure heap exporter
> > > + *
> > > + * Copyright 2021 NXP.
> > > + * Copyright 2024 Linaro Limited.
> > > + */
> > > +
> > > +#define pr_fmt(fmt)     "rheap_linaro: " fmt
> > > +
> > > +#include <linux/dma-buf.h>
> > > +#include <linux/err.h>
> > > +#include <linux/genalloc.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_fdt.h>
> > > +#include <linux/of_reserved_mem.h>
> > > +#include <linux/scatterlist.h>
> > > +#include <linux/slab.h>
> > > +
> > > +#include "restricted_heap.h"
> > > +
> > > +#define MAX_HEAP_COUNT 2
> >
> > Are multiple supported because of what Cyrille mentioned here about per=
missions?
> > https://lore.kernel.org/lkml/DBBPR04MB7514E006455AEA407041E4F788709@DBB=
PR04MB7514.eurprd04.prod.outlook.com/
>
> Yes, I kept that as is.

Ok thanks.

> > So this is just some arbitrary limit? I'd prefer to have some sort of
> > documentation about this.
>
> How about removing the limit and using dynamic allocation instead?

That works too!

>
> Thanks,
> Jens
>
> >
> >
> > > +#define HEAP_NAME_LEN  32
> > > +
> > > +struct resmem_restricted {
> > > +       phys_addr_t base;
> > > +       phys_addr_t size;
> > > +
> > > +       char name[HEAP_NAME_LEN];
> > > +
> > > +       bool no_map;
> > > +};
> > > +
> > > +static struct resmem_restricted restricted_data[MAX_HEAP_COUNT] =3D =
{0};
> > > +static unsigned int restricted_data_count;
> > > +
> > > +static int linaro_restricted_memory_allocate(struct restricted_heap =
*heap,
> > > +                                            struct restricted_buffer=
 *buf)
> > > +{
> > > +       struct gen_pool *pool =3D heap->priv_data;
> > > +       unsigned long pa;
> > > +       int ret;
> > > +
> > > +       buf->size =3D ALIGN(buf->size, PAGE_SIZE);
> > > +       pa =3D gen_pool_alloc(pool, buf->size);
> > > +       if (!pa)
> > > +               return -ENOMEM;
> > > +
> > > +       ret =3D sg_alloc_table(&buf->sg_table, 1, GFP_KERNEL);
> > > +       if (ret) {
> > > +               gen_pool_free(pool, pa, buf->size);
> > > +               return ret;
> > > +       }
> > > +
> > > +       sg_set_page(buf->sg_table.sgl, phys_to_page(pa), buf->size, 0=
);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static void linaro_restricted_memory_free(struct restricted_heap *he=
ap,
> > > +                                         struct restricted_buffer *b=
uf)
> > > +{
> > > +       struct gen_pool *pool =3D heap->priv_data;
> > > +       struct scatterlist *sg;
> > > +       unsigned int i;
> > > +
> > > +       for_each_sg(buf->sg_table.sgl, sg, buf->sg_table.nents, i)
> > > +               gen_pool_free(pool, page_to_phys(sg_page(sg)), sg->le=
ngth);
> > > +       sg_free_table(&buf->sg_table);
> > > +}
> > > +
> > > +static const struct restricted_heap_ops linaro_restricted_heap_ops =
=3D {
> > > +       .alloc =3D linaro_restricted_memory_allocate,
> > > +       .free =3D linaro_restricted_memory_free,
> > > +};
> > > +
> > > +static int add_heap(struct resmem_restricted *mem)
> > > +{
> > > +       struct restricted_heap *heap;
> > > +       struct gen_pool *pool;
> > > +       int ret;
> > > +
> > > +       if (mem->base =3D=3D 0 || mem->size =3D=3D 0) {
> > > +               pr_err("restricted_data base or size is not correct\n=
");
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       heap =3D kzalloc(sizeof(*heap), GFP_KERNEL);
> > > +       if (!heap)
> > > +               return -ENOMEM;
> > > +
> > > +       pool =3D gen_pool_create(PAGE_SHIFT, -1);
> > > +       if (!pool) {
> > > +               ret =3D -ENOMEM;
> > > +               goto err_free_heap;
> > > +       }
> > > +
> > > +       ret =3D gen_pool_add(pool, mem->base, mem->size, -1);
> > > +       if (ret)
> > > +               goto err_free_pool;
> > > +
> > > +       heap->no_map =3D mem->no_map;
> > > +       heap->priv_data =3D pool;
> > > +       heap->name =3D mem->name;
> > > +       heap->ops =3D &linaro_restricted_heap_ops;
> > > +
> > > +       ret =3D restricted_heap_add(heap);
> > > +       if (ret)
> > > +               goto err_free_pool;
> > > +
> > > +       return 0;
> > > +
> > > +err_free_pool:
> > > +       gen_pool_destroy(pool);
> > > +err_free_heap:
> > > +       kfree(heap);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static int __init rmem_restricted_heap_setup(struct reserved_mem *rm=
em)
> > > +{
> > > +       size_t len =3D HEAP_NAME_LEN;
> > > +       const char *s;
> > > +       bool no_map;
> > > +
> > > +       if (WARN_ONCE(restricted_data_count >=3D MAX_HEAP_COUNT,
> > > +                     "Cannot handle more than %u restricted heaps\n"=
,
> > > +                     MAX_HEAP_COUNT))
> > > +               return -EINVAL;
> > > +
> > > +       no_map =3D of_get_flat_dt_prop(rmem->fdt_node, "no-map", NULL=
);
> > > +       s =3D strchr(rmem->name, '@');
> > > +       if (s)
> > > +               len =3D umin(s - rmem->name + 1, len);
> > > +
> > > +       restricted_data[restricted_data_count].base =3D rmem->base;
> > > +       restricted_data[restricted_data_count].size =3D rmem->size;
> > > +       restricted_data[restricted_data_count].no_map =3D no_map;
> > > +       strscpy(restricted_data[restricted_data_count].name, rmem->na=
me, len);
> > > +
> > > +       restricted_data_count++;
> > > +       return 0;
> > > +}
> > > +
> > > +RESERVEDMEM_OF_DECLARE(linaro_restricted_heap, "linaro,restricted-he=
ap",
> > > +                      rmem_restricted_heap_setup);
> > > +
> > > +static int linaro_restricted_heap_init(void)
> > > +{
> > > +       unsigned int i;
> > > +       int ret;
> > > +
> > > +       for (i =3D 0; i < restricted_data_count; i++) {
> > > +               ret =3D add_heap(&restricted_data[i]);
> > > +               if (ret)
> > > +                       return ret;
> > > +       }
> > > +       return 0;
> > > +}
> > > +
> > > +module_init(linaro_restricted_heap_init);
> > > +MODULE_DESCRIPTION("Linaro Restricted Heap Driver");
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.34.1
> > >

