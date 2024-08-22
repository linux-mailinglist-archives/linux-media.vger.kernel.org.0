Return-Path: <linux-media+bounces-16604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B06995B986
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 17:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D08401F23077
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 15:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17131CC892;
	Thu, 22 Aug 2024 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGdf6yYy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC011CC8A3
	for <linux-media@vger.kernel.org>; Thu, 22 Aug 2024 15:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724339534; cv=none; b=H9YrIGS6kB5E0PKPH1V+xPtJw1N1NxkZWydZbSVz81wau5CMSiEyhwJ8lj/2BkGQxM5PVNXLtESSnK1wZFQCBSFZFjuFRNUBk0VmYreFneExgF1m9vuW6t+NezlXKFn1jeWOcxFR18f1DvIqeGwhaQdy88szT8J8FS7gKKnfrsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724339534; c=relaxed/simple;
	bh=gA6H6vFpf7GM6RrL4t5PzyVE3XI+sqGxTDadnkAmLK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpvZ2R/NS4iPGRVlLxJT6/0uo1s0gM26zJ9qWf+yXrJ0OGd8hEIoCv4Zz6Dg179KgoVikBWuCUeuVzKtz6+mpYUEWTKgQa622WQmOkCMkNM51XQhihCVJMch2VV0mvxNV/38EgsXimiKQU9SVjAhfJJzfXcMReoTxNb8FdJVvIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zGdf6yYy; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f040733086so8176741fa.1
        for <linux-media@vger.kernel.org>; Thu, 22 Aug 2024 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724339530; x=1724944330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TWv+mzh3DTgixeu4UaNi8undy9enZO8UogSQ6mlVfs=;
        b=zGdf6yYyhWuLYz8bb9LlU5Vv3EFwSC+WiSvJG/XTN1IxtjSRD570rzFgtnV4W4mqou
         w5YPL+VWQaJCMmiq9ink5NBXJ0jek/EEdbFx/lUxgXYpxdLLBHzXmxjv+O9TGPrRDko4
         3pgQaDsL7X/8Nll/akQePjaRxLRnrYHfHKzyOd6TAdhhpCVY4gkslBRsxbHRCCrXGoHQ
         NyZ9+IxnwQWGHVyJjoE3tCrYcHuVSbrcBYsLfnZM0nuBMlzliTj5bTZx2V9YdBOQ1HCD
         N1SEDGSriG4wJW8XG+O4AFVZUwk74RzqMJ3F8272DYyAl3yfrEhpu/Cy3lsAxW/fc1rr
         xj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724339530; x=1724944330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TWv+mzh3DTgixeu4UaNi8undy9enZO8UogSQ6mlVfs=;
        b=bJ4DFNrS4G5j1WfCm+U6ZQtJLPhgK2Hv++6xZv8pzzVzGCFuetvmnB+7TbRjAhD+kh
         vKn3E7Io2j1Q8OYE6a4ReHVK7Gg2el8fluiKGPbBrwkMFlhHgNdiSAmJ6bnzV3nJo+nF
         oVf0OesrF3o9+J25DyVmit1Z2QaGhe3ObNnLm1Fei3WFTNWVdMmyq0O4+XEegRUc0k9A
         g/ZbPr/dnNDjZhA/njL6GBF2Sv3O/dZlh0ClZ8TzIASRA0BXzOTUa1klPBMN+ECTO7Bl
         ETK2lWTCHb7PwzhBwGa10ReRyWJ4G9XtSXdr56SIWFlxdDz8Gb24EH6BLdNvSvZH+lQZ
         adHA==
X-Forwarded-Encrypted: i=1; AJvYcCXa63OUiPPSiGr23+nPKVFW5LKPbLpVKTl8MNrE4K7DuTenxS9NAew/GZsXQm7XUVMrdMaTp/2NrilwlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv0eW7/+6YFnSvEZeVDaEZIiLYLcs9IBRIKX8oq9624cFakuwV
	ex421yfkynRXc9Hu4pDfhwthAv6kq/o/p1KHDyE8QeRF2GEBpvt4d+F9LNiL/GcT/arNxRN5Y5y
	maTgcd/59FJQkNA45EnkHILBNYkaq/F8ltD03pw==
X-Google-Smtp-Source: AGHT+IFiLmEsOvYvdr3VyiyqB861aTavzd4tiwin4hjTDIgK3KZVq4VStdlXBdk3Plh+1gYEh1qgoVqRfz/lcHt5430=
X-Received: by 2002:a05:651c:1547:b0:2ef:2b38:879c with SMTP id
 38308e7fff4ca-2f405c7c266mr14899621fa.3.1724339529793; Thu, 22 Aug 2024
 08:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240515112308.10171-1-yong.wu@mediatek.com> <20240515112308.10171-8-yong.wu@mediatek.com>
In-Reply-To: <20240515112308.10171-8-yong.wu@mediatek.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 22 Aug 2024 17:11:57 +0200
Message-ID: <CAHUa44GHtEGsXagwLLAix7HxpjZt45rsZkWCb4i0LUmr54Xjqg@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] dma-buf: heaps: restricted_heap: Add MediaTek
 restricted heap and heap_init
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com, 
	Sumit Semwal <sumit.semwal@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, tjmercier@google.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Robin Murphy <robin.murphy@arm.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>, 
	Joakim Bech <joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, 
	Pavel Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>, 
	willy@infradead.org, Logan Gunthorpe <logang@deltatee.com>, Daniel Vetter <daniel@ffwll.ch>, 
	jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com, 
	youlin.pei@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 1:25=E2=80=AFPM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> Add a MediaTek restricted heap which uses TEE service call to restrict
> buffer. Currently this restricted heap is NULL, Prepare for the later
> patch. Mainly there are two changes:
> a) Add a heap_init ops since TEE probe late than restricted heap, thus
>    initialize the heap when we require the buffer the first time.
> b) Add a priv_data for each heap, like the special data used by MTK
>    (such as "TEE session") can be placed in priv_data.
>
> Currently our heap depends on CMA which could only be bool, thus
> depend on "TEE=3Dy".
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/Kconfig               |   7 ++
>  drivers/dma-buf/heaps/Makefile              |   1 +
>  drivers/dma-buf/heaps/restricted_heap.c     |  11 ++
>  drivers/dma-buf/heaps/restricted_heap.h     |   2 +
>  drivers/dma-buf/heaps/restricted_heap_mtk.c | 115 ++++++++++++++++++++
>  5 files changed, 136 insertions(+)
>  create mode 100644 drivers/dma-buf/heaps/restricted_heap_mtk.c
>
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfi=
g
> index e54506f480ea..84f748fb2856 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -21,3 +21,10 @@ config DMABUF_HEAPS_RESTRICTED
>           heap is to manage buffers that are inaccessible to the kernel a=
nd user space.
>           There may be several ways to restrict it, for example it may be=
 encrypted or
>           protected by a TEE or hypervisor. If in doubt, say N.
> +
> +config DMABUF_HEAPS_RESTRICTED_MTK
> +       bool "MediaTek DMA-BUF Restricted Heap"
> +       depends on DMABUF_HEAPS_RESTRICTED && TEE=3Dy
> +       help
> +         Enable restricted dma-buf heaps for MediaTek platform. This hea=
p is backed by
> +         TEE client interfaces. If in doubt, say N.
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makef=
ile
> index a2437c1817e2..0028aa9d875f 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)  +=3D restricted_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)      +=3D restricted_heap_mtk.=
o
>  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
> diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/he=
aps/restricted_heap.c
> index 4e45d46a6467..8bc8a5e3f969 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.c
> +++ b/drivers/dma-buf/heaps/restricted_heap.c
> @@ -151,11 +151,22 @@ restricted_heap_allocate(struct dma_heap *heap, uns=
igned long size,
>                          unsigned long fd_flags, unsigned long heap_flags=
)
>  {
>         struct restricted_heap *rheap =3D dma_heap_get_drvdata(heap);
> +       const struct restricted_heap_ops *ops =3D rheap->ops;
>         struct restricted_buffer *restricted_buf;
>         DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>         struct dma_buf *dmabuf;
>         int ret;
>
> +       /*
> +        * In some implements, TEE is required to protect buffer. However=
 TEE probe
> +        * may be late, Thus heap_init is performed when the first buffer=
 is requested.
> +        */
> +       if (ops->heap_init) {
> +               ret =3D ops->heap_init(rheap);
> +               if (ret)
> +                       return ERR_PTR(ret);
> +       }
> +
>         restricted_buf =3D kzalloc(sizeof(*restricted_buf), GFP_KERNEL);
>         if (!restricted_buf)
>                 return ERR_PTR(-ENOMEM);
> diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/he=
aps/restricted_heap.h
> index 6d9599a4a34e..2a33a1c7a48b 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.h
> +++ b/drivers/dma-buf/heaps/restricted_heap.h
> @@ -19,6 +19,8 @@ struct restricted_heap {
>         const char              *name;
>
>         const struct restricted_heap_ops *ops;
> +
> +       void                    *priv_data;
>  };
>
>  struct restricted_heap_ops {
> diff --git a/drivers/dma-buf/heaps/restricted_heap_mtk.c b/drivers/dma-bu=
f/heaps/restricted_heap_mtk.c
> new file mode 100644
> index 000000000000..52e805eb9858
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/restricted_heap_mtk.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DMABUF restricted heap exporter for MediaTek
> + *
> + * Copyright (C) 2024 MediaTek Inc.
> + */
> +#define pr_fmt(fmt)     "rheap_mtk: " fmt
> +
> +#include <linux/dma-buf.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/tee_drv.h>
> +#include <linux/uuid.h>
> +
> +#include "restricted_heap.h"
> +
> +#define TZ_TA_MEM_UUID_MTK             "4477588a-8476-11e2-ad15-e41f1390=
d676"
> +
> +#define TEE_PARAM_NUM                  4
> +
> +enum mtk_secure_mem_type {
> +       /*
> +        * MediaTek static chunk memory carved out for TrustZone. The mem=
ory
> +        * management is inside the TEE.
> +        */
> +       MTK_SECURE_MEMORY_TYPE_CM_TZ    =3D 1,
> +};
> +
> +struct mtk_restricted_heap_data {
> +       struct tee_context      *tee_ctx;
> +       u32                     tee_session;
> +
> +       const enum mtk_secure_mem_type mem_type;
> +
> +};
> +
> +static int mtk_tee_ctx_match(struct tee_ioctl_version_data *ver, const v=
oid *data)
> +{
> +       return ver->impl_id =3D=3D TEE_IMPL_ID_OPTEE;
> +}
> +
> +static int mtk_tee_session_init(struct mtk_restricted_heap_data *data)
> +{
> +       struct tee_param t_param[TEE_PARAM_NUM] =3D {0};
> +       struct tee_ioctl_open_session_arg arg =3D {0};
> +       uuid_t ta_mem_uuid;
> +       int ret;
> +
> +       data->tee_ctx =3D tee_client_open_context(NULL, mtk_tee_ctx_match=
, NULL, NULL);
> +       if (IS_ERR(data->tee_ctx)) {
> +               pr_err_once("%s: open context failed, ret=3D%ld\n", __fun=
c__,
> +                           PTR_ERR(data->tee_ctx));
> +               return -ENODEV;
> +       }
> +
> +       arg.num_params =3D TEE_PARAM_NUM;
> +       arg.clnt_login =3D TEE_IOCTL_LOGIN_PUBLIC;
> +       ret =3D uuid_parse(TZ_TA_MEM_UUID_MTK, &ta_mem_uuid);
> +       if (ret)
> +               goto close_context;
> +       memcpy(&arg.uuid, &ta_mem_uuid.b, sizeof(ta_mem_uuid));
> +
> +       ret =3D tee_client_open_session(data->tee_ctx, &arg, t_param);
> +       if (ret < 0 || arg.ret) {
> +               pr_err_once("%s: open session failed, ret=3D%d:%d\n",
> +                           __func__, ret, arg.ret);
> +               ret =3D -EINVAL;
> +               goto close_context;
> +       }
> +       data->tee_session =3D arg.session;
> +       return 0;
> +
> +close_context:
> +       tee_client_close_context(data->tee_ctx);

There's a
data->tee_ctx =3D NULL;
missing here.

Cheers,
Jens

> +       return ret;
> +}
> +
> +static int mtk_restricted_heap_init(struct restricted_heap *rheap)
> +{
> +       struct mtk_restricted_heap_data *data =3D rheap->priv_data;
> +
> +       if (!data->tee_ctx)
> +               return mtk_tee_session_init(data);
> +       return 0;
> +}
> +
> +static const struct restricted_heap_ops mtk_restricted_heap_ops =3D {
> +       .heap_init              =3D mtk_restricted_heap_init,
> +};
> +
> +static struct mtk_restricted_heap_data mtk_restricted_heap_data =3D {
> +       .mem_type               =3D MTK_SECURE_MEMORY_TYPE_CM_TZ,
> +};
> +
> +static struct restricted_heap mtk_restricted_heaps[] =3D {
> +       {
> +               .name           =3D "restricted_mtk_cm",
> +               .ops            =3D &mtk_restricted_heap_ops,
> +               .priv_data      =3D &mtk_restricted_heap_data,
> +       },
> +};
> +
> +static int mtk_restricted_heap_initialize(void)
> +{
> +       struct restricted_heap *rheap =3D mtk_restricted_heaps;
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(mtk_restricted_heaps); i++, rheap++)
> +               restricted_heap_add(rheap);
> +       return 0;
> +}
> +module_init(mtk_restricted_heap_initialize);
> +MODULE_DESCRIPTION("MediaTek Restricted Heap Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

