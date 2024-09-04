Return-Path: <linux-media+bounces-17547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA74A96B73E
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90D4A283131
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 09:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B271CF7C8;
	Wed,  4 Sep 2024 09:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpmcJQP2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5650D1CF5D3
	for <linux-media@vger.kernel.org>; Wed,  4 Sep 2024 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443088; cv=none; b=ko1bneST1zUGtf9A9uaNYDo5h/dIQJcynPu7v9Zah/IdwQnbgcKA2lqypVO4KjhQHYjmDiudaYqQ7ckP1N7lmzQljnZb+/usbPT95ADhsU1G/23qLythavPk6uhb3a/yD/FAKVlkYz1O8HVDJRQ8zQg2wEl7Hb9CzGgEg2nkFb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443088; c=relaxed/simple;
	bh=53KQMKdddkRzVChyYYieGDdAE3/h5i7iLJdjg5YVy20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rIn15soJgFHF3v2WnCEThdNSqLSctv9DDZIiPjbyDyArx1tuP9GtR0/Xu2pa6sn70jnN28PAJydjP3LhqntXIn7Yq8efxe8oF+pr18eTMmeheFfOP/TGUtLUH8kot4k0Pr9QTiKRLl0VCyiRjSXBdwRm6FCbGNqt4Tm/BbXEW04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QpmcJQP2; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-277fa3de06fso1517273fac.0
        for <linux-media@vger.kernel.org>; Wed, 04 Sep 2024 02:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725443085; x=1726047885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2jCB3Mh2D7e/fKcpdcpOCelHevV01EHEW0KXFzYpnE=;
        b=QpmcJQP26+JgfBVQ/EU7q+YCy9PTEpGrJYaLCwAjMl5eMNxh+ZbzCvrgJHG6be2tf8
         g7aw+G02hc4uc8lUTqWHt9oMSP3AcfOhl4UOiKJlMSNN7vrTWw0x5w7HqsIUQhMGJqlt
         QdbkrsFl6rpt4aLj/2S0uh9IUxBCculv0ZEhX08BmNaCnEVwTpHuag6DkPQqVPeY5+Pj
         /wg8ODF/5x14wQCxxfpypHG2WzVPbgitbST9PoykXoZjQ+sd068Zs1bXQe+890WMokB7
         IvCbYDfyHFYT1J7rnh8Db8VcdTTdqwExckO46NB2L7yHvTydswkTwiB+6myGgyT/RJmk
         uaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725443085; x=1726047885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2jCB3Mh2D7e/fKcpdcpOCelHevV01EHEW0KXFzYpnE=;
        b=SaRhdyLC7nGI5Cg8JfPOPKGwMlZADhSIM0rDuWbt8u+VPwJbQ6Blz443+hTnIcoQry
         DhusoSxQc3CzHWoZyGfUFWRYIKhtytSKCuYBo//jUTY70bmKJ1cQ47XPVuYO4aiCtbKR
         sBDfiIKyQppzdfzST2Z7JCvC++5VANnH/MdbMPeLF7tIhllWfj6vxHKtQrEZuUReY+J1
         5f2Eha5SZM8T/o8zgt6Y/GPdd1jpAPfu6mFyVfJNSoXNRm0oBuRjs5Uql8c54IouDFGt
         WLK9Pi/NdwYqC/lvbX1RJuS5/Ggd+0hRY4LYWRNcKzLz5oY2ycyZhR+jKFAk4zDW+xVs
         WBwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc5oyc4lgovOJCcGC5SGjNg6W/y4hmIqNV+BW1de8ABMHUA61LHXFM/VQC6zh4PRFB/nzgkpBB8evPNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YywaNAOx59xrPJzL1nbHpn/jfuPFSbWf0pCXsUTQvk5PIOJfdsD
	SrQBcZi9kIW6G0yil76xdvCDDG+7n8ren9gFv/109k6dF3/paZzGaHptboPBBgV6lkhlOUtc+Z9
	oEtuoEuZdbtXXHHHxZFwTXqV42+VS83oH74zoiA==
X-Google-Smtp-Source: AGHT+IGYbHJdBZDqXfJaLvPa+cheRpz0nZvpY4lYVwTEuIeN+wJEbeHIAIs0Kb9fRcKIKf3+GKU49MLlqIZtGriKRJU=
X-Received: by 2002:a05:6870:171d:b0:25d:f0ba:eab7 with SMTP id
 586e51a60fabf-27810b95f26mr7655971fac.18.1725443085257; Wed, 04 Sep 2024
 02:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-5-jens.wiklander@linaro.org> <CABdmKX2KzswmiDY4oWw69_rPWs8d_Cqp7OXouSeMQaYX1SDSmw@mail.gmail.com>
In-Reply-To: <CABdmKX2KzswmiDY4oWw69_rPWs8d_Cqp7OXouSeMQaYX1SDSmw@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 4 Sep 2024 11:44:33 +0200
Message-ID: <CAHUa44FYYFVQWf0DGUXNHoOVQEC0-HRyYa0386dHNjo4y1qSiQ@mail.gmail.com>
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

On Tue, Sep 3, 2024 at 7:50=E2=80=AFPM T.J. Mercier <tjmercier@google.com> =
wrote:
>
> On Fri, Aug 30, 2024 at 12:04=E2=80=AFAM Jens Wiklander
> <jens.wiklander@linaro.org> wrote:
> >
> > Add a Linaro restricted heap using the linaro,restricted-heap bindings
> > implemented based on the generic restricted heap.
> >
> > The bindings defines a range of physical restricted memory. The heap
> > manages this address range using genalloc. The allocated dma-buf file
> > descriptor can later be registered with the TEE subsystem for later use
> > via Trusted Applications in the secure world.
> >
> > Co-developed-by: Olivier Masse <olivier.masse@nxp.com>
> > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> >  drivers/dma-buf/heaps/Makefile                |   1 +
> >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
> >  3 files changed, 176 insertions(+)
> >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> >
> > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kcon=
fig
> > index 58903bc62ac8..82e2c5d09242 100644
> > --- a/drivers/dma-buf/heaps/Kconfig
> > +++ b/drivers/dma-buf/heaps/Kconfig
> > @@ -28,3 +28,13 @@ config DMABUF_HEAPS_RESTRICTED_MTK
> >         help
> >           Enable restricted dma-buf heaps for MediaTek platform. This h=
eap is backed by
> >           TEE client interfaces. If in doubt, say N.
> > +
> > +config DMABUF_HEAPS_RESTRICTED_LINARO
> > +       bool "Linaro DMA-BUF Restricted Heap"
> > +       depends on DMABUF_HEAPS_RESTRICTED
> > +       help
> > +         Choose this option to enable the Linaro restricted dma-buf he=
ap.
> > +         The restricted heap pools are defined according to the DT. He=
aps
> > +         are allocated in the pools using gen allocater.
> > +         If in doubt, say N.
> > +
> > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Mak=
efile
> > index 0028aa9d875f..66b2f67c47b5 100644
> > --- a/drivers/dma-buf/heaps/Makefile
> > +++ b/drivers/dma-buf/heaps/Makefile
> > @@ -2,4 +2,5 @@
> >  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
> >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)  +=3D restricted_heap.o
> >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)      +=3D restricted_heap_mt=
k.o
> > +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_LINARO)   +=3D restricted_heap_li=
naro.o
> >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
> > diff --git a/drivers/dma-buf/heaps/restricted_heap_linaro.c b/drivers/d=
ma-buf/heaps/restricted_heap_linaro.c
> > new file mode 100644
> > index 000000000000..4b08ed514023
> > --- /dev/null
> > +++ b/drivers/dma-buf/heaps/restricted_heap_linaro.c
> > @@ -0,0 +1,165 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * DMABUF secure heap exporter
> > + *
> > + * Copyright 2021 NXP.
> > + * Copyright 2024 Linaro Limited.
> > + */
> > +
> > +#define pr_fmt(fmt)     "rheap_linaro: " fmt
> > +
> > +#include <linux/dma-buf.h>
> > +#include <linux/err.h>
> > +#include <linux/genalloc.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_fdt.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/scatterlist.h>
> > +#include <linux/slab.h>
> > +
> > +#include "restricted_heap.h"
> > +
> > +#define MAX_HEAP_COUNT 2
>
> Are multiple supported because of what Cyrille mentioned here about permi=
ssions?
> https://lore.kernel.org/lkml/DBBPR04MB7514E006455AEA407041E4F788709@DBBPR=
04MB7514.eurprd04.prod.outlook.com/

Yes, I kept that as is.

>
> So this is just some arbitrary limit? I'd prefer to have some sort of
> documentation about this.

How about removing the limit and using dynamic allocation instead?

Thanks,
Jens

>
>
> > +#define HEAP_NAME_LEN  32
> > +
> > +struct resmem_restricted {
> > +       phys_addr_t base;
> > +       phys_addr_t size;
> > +
> > +       char name[HEAP_NAME_LEN];
> > +
> > +       bool no_map;
> > +};
> > +
> > +static struct resmem_restricted restricted_data[MAX_HEAP_COUNT] =3D {0=
};
> > +static unsigned int restricted_data_count;
> > +
> > +static int linaro_restricted_memory_allocate(struct restricted_heap *h=
eap,
> > +                                            struct restricted_buffer *=
buf)
> > +{
> > +       struct gen_pool *pool =3D heap->priv_data;
> > +       unsigned long pa;
> > +       int ret;
> > +
> > +       buf->size =3D ALIGN(buf->size, PAGE_SIZE);
> > +       pa =3D gen_pool_alloc(pool, buf->size);
> > +       if (!pa)
> > +               return -ENOMEM;
> > +
> > +       ret =3D sg_alloc_table(&buf->sg_table, 1, GFP_KERNEL);
> > +       if (ret) {
> > +               gen_pool_free(pool, pa, buf->size);
> > +               return ret;
> > +       }
> > +
> > +       sg_set_page(buf->sg_table.sgl, phys_to_page(pa), buf->size, 0);
> > +
> > +       return 0;
> > +}
> > +
> > +static void linaro_restricted_memory_free(struct restricted_heap *heap=
,
> > +                                         struct restricted_buffer *buf=
)
> > +{
> > +       struct gen_pool *pool =3D heap->priv_data;
> > +       struct scatterlist *sg;
> > +       unsigned int i;
> > +
> > +       for_each_sg(buf->sg_table.sgl, sg, buf->sg_table.nents, i)
> > +               gen_pool_free(pool, page_to_phys(sg_page(sg)), sg->leng=
th);
> > +       sg_free_table(&buf->sg_table);
> > +}
> > +
> > +static const struct restricted_heap_ops linaro_restricted_heap_ops =3D=
 {
> > +       .alloc =3D linaro_restricted_memory_allocate,
> > +       .free =3D linaro_restricted_memory_free,
> > +};
> > +
> > +static int add_heap(struct resmem_restricted *mem)
> > +{
> > +       struct restricted_heap *heap;
> > +       struct gen_pool *pool;
> > +       int ret;
> > +
> > +       if (mem->base =3D=3D 0 || mem->size =3D=3D 0) {
> > +               pr_err("restricted_data base or size is not correct\n")=
;
> > +               return -EINVAL;
> > +       }
> > +
> > +       heap =3D kzalloc(sizeof(*heap), GFP_KERNEL);
> > +       if (!heap)
> > +               return -ENOMEM;
> > +
> > +       pool =3D gen_pool_create(PAGE_SHIFT, -1);
> > +       if (!pool) {
> > +               ret =3D -ENOMEM;
> > +               goto err_free_heap;
> > +       }
> > +
> > +       ret =3D gen_pool_add(pool, mem->base, mem->size, -1);
> > +       if (ret)
> > +               goto err_free_pool;
> > +
> > +       heap->no_map =3D mem->no_map;
> > +       heap->priv_data =3D pool;
> > +       heap->name =3D mem->name;
> > +       heap->ops =3D &linaro_restricted_heap_ops;
> > +
> > +       ret =3D restricted_heap_add(heap);
> > +       if (ret)
> > +               goto err_free_pool;
> > +
> > +       return 0;
> > +
> > +err_free_pool:
> > +       gen_pool_destroy(pool);
> > +err_free_heap:
> > +       kfree(heap);
> > +
> > +       return ret;
> > +}
> > +
> > +static int __init rmem_restricted_heap_setup(struct reserved_mem *rmem=
)
> > +{
> > +       size_t len =3D HEAP_NAME_LEN;
> > +       const char *s;
> > +       bool no_map;
> > +
> > +       if (WARN_ONCE(restricted_data_count >=3D MAX_HEAP_COUNT,
> > +                     "Cannot handle more than %u restricted heaps\n",
> > +                     MAX_HEAP_COUNT))
> > +               return -EINVAL;
> > +
> > +       no_map =3D of_get_flat_dt_prop(rmem->fdt_node, "no-map", NULL);
> > +       s =3D strchr(rmem->name, '@');
> > +       if (s)
> > +               len =3D umin(s - rmem->name + 1, len);
> > +
> > +       restricted_data[restricted_data_count].base =3D rmem->base;
> > +       restricted_data[restricted_data_count].size =3D rmem->size;
> > +       restricted_data[restricted_data_count].no_map =3D no_map;
> > +       strscpy(restricted_data[restricted_data_count].name, rmem->name=
, len);
> > +
> > +       restricted_data_count++;
> > +       return 0;
> > +}
> > +
> > +RESERVEDMEM_OF_DECLARE(linaro_restricted_heap, "linaro,restricted-heap=
",
> > +                      rmem_restricted_heap_setup);
> > +
> > +static int linaro_restricted_heap_init(void)
> > +{
> > +       unsigned int i;
> > +       int ret;
> > +
> > +       for (i =3D 0; i < restricted_data_count; i++) {
> > +               ret =3D add_heap(&restricted_data[i]);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +       return 0;
> > +}
> > +
> > +module_init(linaro_restricted_heap_init);
> > +MODULE_DESCRIPTION("Linaro Restricted Heap Driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.34.1
> >

