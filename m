Return-Path: <linux-media+bounces-33364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10850AC3C8F
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 11:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98BAC3B6FEC
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 09:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7ACA1F03DE;
	Mon, 26 May 2025 09:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FuozTGzt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34332CCDB
	for <linux-media@vger.kernel.org>; Mon, 26 May 2025 09:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251323; cv=none; b=M9PRLsx4K62XmANKYZTCublEvck4cQ+OokZoVgGHGHJR4Cc3ODSFQ/37GN45egZqw1lGjFY7+0+wOFPAurleK+iN77PDUreknisolBoygNJbXvW01TJxGa7q66LTYNf6CSXwVXNq971gkegw4Bj4Hn95R9HCi7BiwH2e7WBkKg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251323; c=relaxed/simple;
	bh=ajs/MFJSY0PG9G/qVtgcFXqbL6B9HudVGubMWG4QBvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mIM6GqZRORV3j9L3oX1dircnPJKRZkAf5NzPRz/rdRr939/76djNB5Qu07uoPIM+jmA1q8MIxD7yETIFcfJr7PsPeDmlizxkT6+KQAxiuTUZt3UIFfsWUbe6ycaZxUiHaj0YIOuD6nVX88zMyBKT6ru6Cv9spdgWCkV16UazB9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FuozTGzt; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-404da7584adso832700b6e.3
        for <linux-media@vger.kernel.org>; Mon, 26 May 2025 02:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748251319; x=1748856119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53ua48kPxy8ZlB5Khz3jNgjUQRcX7ad7dpgywMRYq/U=;
        b=FuozTGztbQ/L68atkgGcumMQ0TeQSvqVdA+X6QASzbb+mLJE0xuRoiGqOmaxdsWkBe
         +QHgWjz+okFWHWt5AszvokTO72c2BJWSliHEmUiu2Dol5ttTjvjxsZbntxJaoZ/u/sdD
         k8keLJVYyIEQfzPYth/sCOb2eRyNONNThNWx5RCXcGfYtZVToIJRuqlf4YUyMDAN8XV7
         psrwpGF3xHigVkwPWSn0kib4XS5vjwCbFJNj2lXrrZCq7YAFP2lNuXp/HbibloroaHHx
         uKc8IwMsJ9G5I7fclrvn2m0bGE5HPGyM9sd3tkP+nvxs8lB8nw/gBqzi6MaqXJ9UteJE
         8tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748251319; x=1748856119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53ua48kPxy8ZlB5Khz3jNgjUQRcX7ad7dpgywMRYq/U=;
        b=HPmr7IOCxYeXYXfD48JK1hEqVCJeVo4zxlKqhypQ9hcOJEU28599/2tsHvEsiKelCw
         r8ufcM1GwbuH0XGa1+7xpDeGuJCodtiRRKUGNB1p1g5XGgOs2+Ejy4yIREewXmS+pO8U
         +r6QeU/Zi+K7Lc5OyrzHMJErWwHRr7F+1+W2IEB66f/F2irUiyrlr2qYox4k0jXsY3IR
         N7bW0tTwDDNsrwfgLE/kZLMDQaz6c0CbjZsgtK8m/R/j7fSZrLbj0FGej3faOfJ1iIfQ
         cyA9kfWnb5zAJ6yfnEEP0ckgmKVs6WTSvsRAlI4wga3lFvaC6c+MeZUNv6XFGBUH8+gj
         nEBg==
X-Forwarded-Encrypted: i=1; AJvYcCXrDf4me3utwM8N+lLClxJOjPYZ/Oay3Xza0p4FgKiXmiwV5DWEB8GMhFx4A2wL9Orv/Axlpg5Msk8MCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkRI94ZUjqa56ek4TX0idMLodio6ZAdo/fqWGcuOo6rI4fXpuy
	ptFem4q6gCDxaJiJeaM1kM/9OPQ0Sa1aUWfDilC4zgOPp0Unk4bvM3DmwX0ZQXXCz+2Nruqg1xZ
	DYQOTPkZTSpqT6zBsTdJkwkBDoxkgyaQqiEeKnW4gZg==
X-Gm-Gg: ASbGncu5HGwCRDJci/pRodClgY2f7n+EbkRb7qUnX1yZRIfeTfKh0jIRUFO51kPM9zr
	yCF7v9HwbC/YZqRLfgrYUYG4Ea3Yxmyt1xdQvv8FFXUX0tsGgPLufEb2JUyFwZLLwF6LU2RNeNN
	QQ+zML5XyPBArWFGyltoJ9JksQqtXoBvplkg==
X-Google-Smtp-Source: AGHT+IFq5JZekHnxWc3sg2RWJXDb6uZ9CM+A22YqbDlbRKnubyEazTYamiLb0ugXmmhMYRQ6G3WVBNUuNH4AYqeD19U=
X-Received: by 2002:a05:6808:3c44:b0:404:e2fe:ee9b with SMTP id
 5614622812f47-406467f6e09mr4084598b6e.15.1748251319604; Mon, 26 May 2025
 02:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-7-jens.wiklander@linaro.org> <aDQWt5Ck1Bo01Z_4@sumit-X1>
In-Reply-To: <aDQWt5Ck1Bo01Z_4@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 26 May 2025 11:21:47 +0200
X-Gm-Features: AX0GCFvNzG6NkiJ-eN9bCOPUdD2632rQhBqnsSHNlg_n4KEoEPp6J0_ZkxvvwnI
Message-ID: <CAHUa44E4-z7-7DQjyGXYRiZDf6mRBKYZDuxWFGy+3JxtWO1ocg@mail.gmail.com>
Subject: Re: [PATCH v9 6/9] tee: add tee_shm_alloc_dma_mem()
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 9:22=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, May 20, 2025 at 05:16:49PM +0200, Jens Wiklander wrote:
> > Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
> > represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM to
> > identify it as DMA memory. The allocated memory will later be lent to
> > the TEE to be used as protected memory.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/tee_shm.c    | 74 ++++++++++++++++++++++++++++++++++++++--
> >  include/linux/tee_core.h |  5 +++
> >  2 files changed, 77 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index e1ed52ee0a16..92a6a35e1a1e 100644
> > --- a/drivers/tee/tee_shm.c
> > +++ b/drivers/tee/tee_shm.c
> > @@ -5,6 +5,8 @@
> >  #include <linux/anon_inodes.h>
> >  #include <linux/device.h>
> >  #include <linux/dma-buf.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/highmem.h>
> >  #include <linux/idr.h>
> >  #include <linux/io.h>
> >  #include <linux/mm.h>
> > @@ -13,9 +15,14 @@
> >  #include <linux/tee_core.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/uio.h>
> > -#include <linux/highmem.h>
> >  #include "tee_private.h"
> >
> > +struct tee_shm_dma_mem {
> > +     struct tee_shm shm;
> > +     dma_addr_t dma_addr;
> > +     struct page *page;
> > +};
> > +
> >  static void shm_put_kernel_pages(struct page **pages, size_t page_coun=
t)
> >  {
> >       size_t n;
> > @@ -49,7 +56,14 @@ static void tee_shm_release(struct tee_device *teede=
v, struct tee_shm *shm)
> >       struct tee_shm *parent_shm =3D NULL;
> >       void *p =3D shm;
> >
> > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > +     if (shm->flags & TEE_SHM_DMA_MEM) {
> > +             struct tee_shm_dma_mem *dma_mem;
> > +
> > +             dma_mem =3D container_of(shm, struct tee_shm_dma_mem, shm=
);
> > +             p =3D dma_mem;
> > +             dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
> > +                            dma_mem->dma_addr, DMA_BIDIRECTIONAL);
>
> Although the kernel bot already found a randconfig issue, it looks like
> we need to add Kconfig dependencies like HAS_DMA, DMA_CMA etc.
>
> Also, I was thinking if we should rather add a new TEE subsystem
> specific Kconfig option like: TEE_DMABUF_HEAPS which can then be used to
> select whatever dependency is needed as well as act as a gating Kconfig
> for relevant features.

You mean something like this?

--- a/drivers/tee/Kconfig
+++ b/drivers/tee/Kconfig
@@ -13,6 +13,14 @@ menuconfig TEE

 if TEE

+config TEE_DMABUF_HEAPS
+       bool
+       depends on HAS_DMA && DMABUF_HEAPS
+
+config TEE_STATIC_PROTMEM_POOL
+       bool
+       depends on HAS_IOMEM && TEE_DMABUF_HEAPS
+

Cheers,
Jens

>
> -Sumit
>
> > +     } else if (shm->flags & TEE_SHM_DMA_BUF) {
> >               struct tee_shm_dmabuf_ref *ref;
> >
> >               ref =3D container_of(shm, struct tee_shm_dmabuf_ref, shm)=
;
> > @@ -306,6 +320,62 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_=
context *ctx, size_t size)
> >  }
> >  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> >
> > +/**
> > + * tee_shm_alloc_dma_mem() - Allocate DMA memory as shared memory obje=
ct
> > + * @ctx:     Context that allocates the shared memory
> > + * @page_count:      Number of pages
> > + *
> > + * The allocated memory is expected to be lent (made inaccessible to t=
he
> > + * kernel) to the TEE while it's used and returned (accessible to the
> > + * kernel again) before it's freed.
> > + *
> > + * This function should normally only be used internally in the TEE
> > + * drivers.
> > + *
> > + * @returns a pointer to 'struct tee_shm'
> > + */
> > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > +                                   size_t page_count)
> > +{
> > +     struct tee_device *teedev =3D ctx->teedev;
> > +     struct tee_shm_dma_mem *dma_mem;
> > +     dma_addr_t dma_addr;
> > +     struct page *page;
> > +
> > +     if (!tee_device_get(teedev))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     page =3D dma_alloc_pages(&teedev->dev, page_count * PAGE_SIZE,
> > +                            &dma_addr, DMA_BIDIRECTIONAL, GFP_KERNEL);
> > +     if (!page)
> > +             goto err_put_teedev;
> > +
> > +     dma_mem =3D kzalloc(sizeof(*dma_mem), GFP_KERNEL);
> > +     if (!dma_mem)
> > +             goto err_free_pages;
> > +
> > +     refcount_set(&dma_mem->shm.refcount, 1);
> > +     dma_mem->shm.ctx =3D ctx;
> > +     dma_mem->shm.paddr =3D page_to_phys(page);
> > +     dma_mem->dma_addr =3D dma_addr;
> > +     dma_mem->page =3D page;
> > +     dma_mem->shm.size =3D page_count * PAGE_SIZE;
> > +     dma_mem->shm.flags =3D TEE_SHM_DMA_MEM;
> > +
> > +     teedev_ctx_get(ctx);
> > +
> > +     return &dma_mem->shm;
> > +
> > +err_free_pages:
> > +     dma_free_pages(&teedev->dev, page_count * PAGE_SIZE, page, dma_ad=
dr,
> > +                    DMA_BIDIRECTIONAL);
> > +err_put_teedev:
> > +     tee_device_put(teedev);
> > +
> > +     return ERR_PTR(-ENOMEM);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> > +
> >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t =
align,
> >                            int (*shm_register)(struct tee_context *ctx,
> >                                                struct tee_shm *shm,
> > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > index 02c07f661349..925690e1020b 100644
> > --- a/include/linux/tee_core.h
> > +++ b/include/linux/tee_core.h
> > @@ -29,6 +29,8 @@
> >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool */
> >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driver *=
/
> >  #define TEE_SHM_DMA_BUF              BIT(4)  /* Memory with dma-buf ha=
ndle */
> > +#define TEE_SHM_DMA_MEM              BIT(5)  /* Memory allocated with =
*/
> > +                                     /* dma_alloc_pages() */
> >
> >  #define TEE_DEVICE_FLAG_REGISTERED   0x1
> >  #define TEE_MAX_DEV_NAME_LEN         32
> > @@ -310,6 +312,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
> >   */
> >  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t=
 size);
> >
> > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > +                                   size_t page_count);
> > +
> >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t =
align,
> >                            int (*shm_register)(struct tee_context *ctx,
> >                                                struct tee_shm *shm,
> > --
> > 2.43.0
> >

