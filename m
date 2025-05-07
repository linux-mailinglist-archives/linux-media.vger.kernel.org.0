Return-Path: <linux-media+bounces-31994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EEEAAE6BC
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 18:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6732C9C6471
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 16:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C5F28BA82;
	Wed,  7 May 2025 16:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FBOZS1mK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182EB17E4
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 16:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746635552; cv=none; b=hK22Thsi2eGXtKXVf012XYhENL6b+sISkezLHcj4TNN4AmYbBD0a/YEp0dIc9ztirzh1fOZvTZdO0Xb98vconX24+SkKrHZ/52bVDZe5tFJoOTDutcYNYAxdAcLhyDdxpJHwK1cPKXaqUhZf5DITc3ZgRzXEc2qCcY+XvCFM50k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746635552; c=relaxed/simple;
	bh=62Rnn2b8lcW2mH/oqwdt6kLZl283C5nn2zNoV7oipM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7x9EcfBPvapdD7gCT4b8pFv6HiK6KjeR+lOavhgvu4XEbG+Ek8IY1Ty3Mj/Gjgo9/j8+95+dtV1OJl9UUwv5cjuoPHgv7AJcz/izXv9isoUcGSVBJxTS+Fs7i2KpGWyD8yHpp/9SyY3ZmGzydZ8m1fx37X/sq5I+yM/126OLdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FBOZS1mK; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-603f54a6cb5so64044eaf.0
        for <linux-media@vger.kernel.org>; Wed, 07 May 2025 09:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746635550; x=1747240350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+qlQHRwkgL3c3/7UMifRdOJIYuZVejakUvQaBKdYYc=;
        b=FBOZS1mKwbRTOv4pGapBYY3uqFl8ka7snTPHgBaWBDEwdLV/ZPm09uUwSHCP0p4xT5
         5w7Iapkthx7lLn4FHrQYdHZ0XcAvMV6w9UPY91ns1wKkXSQNgN/cbHUr6vLMu0Og7q9Q
         zxRbHleG+feGqR51GItzGDCiE6LqocWaChwBmdXN+/2lmVdQmMmshWPverJ4f1PJ474d
         c+hBb5glvKFdp32Pyl3vJje7v6hyNXblGZQh9cYkA+RRgPv0kEwKkCDacXXCZqa/0tSO
         D817dzphtzFKZzbeoFaXKD3/4ApH2vAZaompz6cdzjRhbfQN3dOcHlqbDylpZ/8AMtPl
         Edbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746635550; x=1747240350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+qlQHRwkgL3c3/7UMifRdOJIYuZVejakUvQaBKdYYc=;
        b=ExQSqTDYPO9UdZ2Gx0EyuDNz7xdfz9iyxcdv93kBOjWPgnJn3nL+4T0k7Xs8jUwdU/
         X468nPz1P2CHvzv6bWHAi4e4lhBuH/iOaFnDN4CBt5clszbmcSaGY5leRvaFplrRIH/U
         WDQPGUDRSTi9oFPSjT7Uw/UQcdaaEFEaR6SdWMhl395NdyH6coiZFrjI2P+ChqLtEZ+g
         f4+uxZCOJptoToOzMhUY3C3O94YGF93NRWpTiMBUNg9CdINXAII5V29PWeAklSrXS8Qj
         gM0ARCJ0WzWyQmluQNBpcknE/wnzOzNzvgK6B5JrfICY/pBj/mF1LNiul4usiBhVsT8x
         bCDw==
X-Forwarded-Encrypted: i=1; AJvYcCVK+WKPLYnofVxrJHf9RDrut/bKzBuraN6QArIsJ0x6F+CuY6M0Hqay1oqrZEeAhwzJvQiVW8A1RaIDAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC56B99yGXTWOf7e5aWEpC21hOu9nv8HHL3xE8HRnUXDSbGfMP
	7Mv9Dqagj0fJ13jFUSOtc2g62EUINjRHwz237yjWb/wUTAG+yMgh7ZCcxstr1v80UMOXRFNqxZ/
	VYRHPqea5Iaftw5BFe9wR9SqK88b01eDQzA0P/xJJnmELrTMhwDA=
X-Gm-Gg: ASbGncvha+hQC91dUeS04C+RFQKrJngHz4dT01XlJHaL/IG68YJxCU4cKsa4zvEKFR3
	xTpACs1ph9Utige4itohdJcUM9U920/evXJRICdnIf/gsouPs8MVsxVkKpBfXdif3745NrweY8H
	CMHuoQPr9HkAF+qZ6g3O+rM94=
X-Google-Smtp-Source: AGHT+IFydqe8XP7ZbsEI4FJ7nHMo2qb0FBj+wx8QFnVlqVGZ0YgAt35WAhs9j3CQ76LLi08wMmQjhHHbpx9s0MvBOTg=
X-Received: by 2002:a05:6820:180a:b0:603:f191:a93c with SMTP id
 006d021491bc7-60828d3a917mr2866969eaf.6.1746635539868; Wed, 07 May 2025
 09:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-12-jens.wiklander@linaro.org> <4b2f7c31-c61b-45d8-b32e-16bb91c4289b@arm.com>
In-Reply-To: <4b2f7c31-c61b-45d8-b32e-16bb91c4289b@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 7 May 2025 18:32:08 +0200
X-Gm-Features: ATxdqUElU24AIG1nJsrzoZKKB0gEXwhwftpouBsM_UdwgzzPM34h3I_iZz1EmXw
Message-ID: <CAHUa44HEPF3w=b2O-4DcRUBgF4rJUUze8zy48_g_FCQ5Y34U6A@mail.gmail.com>
Subject: Re: [PATCH v8 11/14] tee: add tee_shm_alloc_cma_phys_mem()
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 2, 2025 at 5:11=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 02/05/2025 10:59 am, Jens Wiklander wrote:
> > Add tee_shm_alloc_cma_phys_mem() to allocate a physical memory using
> > from the default CMA pool. The memory is represented by a tee_shm objec=
t
> > using the new flag TEE_SHM_CMA_BUF to identify it as physical memory
> > from CMA.
>
> If and when it's possible to dynamically delegate any old kernel memory
> to the TEE, it's far from clear why that should involve poking around in
> CMA internals...
>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >   drivers/tee/tee_shm.c    | 55 ++++++++++++++++++++++++++++++++++++++-=
-
> >   include/linux/tee_core.h |  4 +++
> >   2 files changed, 57 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index e1ed52ee0a16..faaa0a87bb18 100644
> > --- a/drivers/tee/tee_shm.c
> > +++ b/drivers/tee/tee_shm.c
> > @@ -3,8 +3,11 @@
> >    * Copyright (c) 2015-2017, 2019-2021 Linaro Limited
> >    */
> >   #include <linux/anon_inodes.h>
> > +#include <linux/cma.h>
> >   #include <linux/device.h>
> >   #include <linux/dma-buf.h>
> > +#include <linux/dma-map-ops.h>
> > +#include <linux/highmem.h>
> >   #include <linux/idr.h>
> >   #include <linux/io.h>
> >   #include <linux/mm.h>
> > @@ -13,7 +16,6 @@
> >   #include <linux/tee_core.h>
> >   #include <linux/uaccess.h>
> >   #include <linux/uio.h>
> > -#include <linux/highmem.h>
> >   #include "tee_private.h"
> >
> >   static void shm_put_kernel_pages(struct page **pages, size_t page_cou=
nt)
> > @@ -49,7 +51,14 @@ static void tee_shm_release(struct tee_device *teede=
v, struct tee_shm *shm)
> >       struct tee_shm *parent_shm =3D NULL;
> >       void *p =3D shm;
> >
> > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > +     if (shm->flags & TEE_SHM_CMA_BUF) {
> > +#if IS_ENABLED(CONFIG_CMA)
> > +             struct page *page =3D phys_to_page(shm->paddr);
> > +             struct cma *cma =3D dev_get_cma_area(&shm->ctx->teedev->d=
ev);
>
> If you want dma_contiguous_default_area as the commit message implies,
> use dma_contiguous_default_area. Appearing to support per-device CMA
> pools but relying on the device not having one is pretty yucky.
>
> But again, why? If you want page-backed DMA-able memory, with all the
> other assumptions being made here, you may as well just rely on
> dma_alloc_pages(DMA_ATTR_SKIP_CPU_SYNC) doing what you want, while also
> being potentially more flexible for !CMA and non-invasive. Or at the
> very least, could the TEE delegation not be composed on top of the
> existing CMA heap allocator?

Thanks for suggesting dma_alloc_pages(). I'll use that in the next
version of the patch set.

Cheers,
Jens

>
> Thanks,
> Robin.
>
> > +
> > +             cma_release(cma, page, shm->size / PAGE_SIZE);
> > +#endif
> > +     } else if (shm->flags & TEE_SHM_DMA_BUF) {
> >               struct tee_shm_dmabuf_ref *ref;
> >
> >               ref =3D container_of(shm, struct tee_shm_dmabuf_ref, shm)=
;
> > @@ -306,6 +315,48 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_=
context *ctx, size_t size)
> >   }
> >   EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> >
> > +struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
> > +                                        size_t page_count, size_t alig=
n)
> > +{
> > +#if IS_ENABLED(CONFIG_CMA)
> > +     struct tee_device *teedev =3D ctx->teedev;
> > +     struct cma *cma =3D dev_get_cma_area(&teedev->dev);
> > +     struct tee_shm *shm;
> > +     struct page *page;
> > +
> > +     if (!tee_device_get(teedev))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     page =3D cma_alloc(cma, page_count, align, true/*no_warn*/);
> > +     if (!page)
> > +             goto err_put_teedev;
> > +
> > +     shm =3D kzalloc(sizeof(*shm), GFP_KERNEL);
> > +     if (!shm)
> > +             goto err_cma_crelease;
> > +
> > +     refcount_set(&shm->refcount, 1);
> > +     shm->ctx =3D ctx;
> > +     shm->paddr =3D page_to_phys(page);
> > +     shm->size =3D page_count * PAGE_SIZE;
> > +     shm->flags =3D TEE_SHM_CMA_BUF;
> > +
> > +     teedev_ctx_get(ctx);
> > +
> > +     return shm;
> > +
> > +err_cma_crelease:
> > +     cma_release(cma, page, page_count);
> > +err_put_teedev:
> > +     tee_device_put(teedev);
> > +
> > +     return ERR_PTR(-ENOMEM);
> > +#else
> > +     return ERR_PTR(-EINVAL);
> > +#endif
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_alloc_cma_phys_mem);
> > +
> >   int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t=
 align,
> >                            int (*shm_register)(struct tee_context *ctx,
> >                                                struct tee_shm *shm,
> > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > index 02c07f661349..3a4e1b00fcc7 100644
> > --- a/include/linux/tee_core.h
> > +++ b/include/linux/tee_core.h
> > @@ -29,6 +29,7 @@
> >   #define TEE_SHM_POOL                BIT(2)  /* Memory allocated from =
pool */
> >   #define TEE_SHM_PRIV                BIT(3)  /* Memory private to TEE =
driver */
> >   #define TEE_SHM_DMA_BUF             BIT(4)  /* Memory with dma-buf ha=
ndle */
> > +#define TEE_SHM_CMA_BUF              BIT(5)  /* CMA allocated memory *=
/
> >
> >   #define TEE_DEVICE_FLAG_REGISTERED  0x1
> >   #define TEE_MAX_DEV_NAME_LEN                32
> > @@ -310,6 +311,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
> >    */
> >   struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_=
t size);
> >
> > +struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
> > +                                        size_t page_count, size_t alig=
n);
> > +
> >   int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t=
 align,
> >                            int (*shm_register)(struct tee_context *ctx,
> >                                                struct tee_shm *shm,

