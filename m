Return-Path: <linux-media+bounces-35128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CDBADE42C
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 09:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C41E13A64C3
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 07:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5608B27780E;
	Wed, 18 Jun 2025 07:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MYG5Y75K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01975277C8A
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 07:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230201; cv=none; b=VWL2hcwa7cpInySxQoCnjAWhVkc5gCYV1lQqcUV9WIbVEZDh+E9xd5ud8B4bPABl9gY2k1FjgPN7xhOlEpJ4jgIsg72s5JywcKa+k4Adot5QCAKQkVybiWHplfCgxkUTdV0ex4UESysQ8oQ1L127bZ1+1rfF1CMB/wR8uIODcXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230201; c=relaxed/simple;
	bh=nE+ykYH6M9Fet691mrhbrL6msESON9HWWk+JwGOG8Yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e711h/tlezLOHE+kjJF+yG+HN8fHvKooK80c4kyvP2pLMlYo/GQuMmQWUqhP7YoC7sQD7sLvbwTQcNSL1kdRNRzfTM0mlmlT6pWN4ExF2n6CLjEOxWVpQZ+hbE592JLY6iB9tXbDEtdrgwNegvTV742KGJ9vhPokq4z4g2Afi3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MYG5Y75K; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-735a9e65471so4097490a34.1
        for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 00:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750230196; x=1750834996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8SFTx5dPQSfu8ZL7Jn6th2YUqqrMFvLWLfJm2Kbj0c=;
        b=MYG5Y75KljR3pnvNAn25LYB5WenC+0JzspS8MQwPItOyEq+QdSDqubQqwLUFWGfnD0
         BtXayRzmEiSOi8NrhBzstq2hgjz14z4vdFPFi/h4bxBsWKbDl1C+QSP1KdKb3/M7qe/o
         HskVFdpfdRVaOo6BOhWmXvrpdY5j4XJVPbYFj0t6N/cQDD1iAAvDsEtV36VH7bhvdD0r
         vHyBjsp7gCgpnL3SY8/bcO81g3V/mAq7AR1rYTn3f4TubicJlQlqgSi43cS+OEJ/9Seu
         L9W0fBe0qYkdXFENOrmacL856ESKHSJN+TdilVKYObwtfhGrDyHZf/G0M2ew/Bt6YLIF
         KZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230196; x=1750834996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8SFTx5dPQSfu8ZL7Jn6th2YUqqrMFvLWLfJm2Kbj0c=;
        b=xJUHnsoRkrh1ExgJ3X+dICswU8+nHGW41DB87tAGhik6h1kx39YvQI27d7A/LOPzDG
         bantiGqmHsdfqfKjlWoU2AJnGB5PMAWNM5ir7juRvstVgxlW2CKgQoYHAAECl/QquCAm
         HTHaQoqxDTSXCQoMPxExEPuBNlaRduRpdA2mVMdA4jMH9CRpIl9EgWi32Vj0/hxBA9xx
         XsTP5VzO5vHC9zlKTXS5tcN5RT27oRLuFOA2EjLpWJK03kKroHCHNHiW1arwC1Uq6G9I
         WkJp+RnYYNQWpRkO4om36w91RFkWHl2NepGXdzA/xkhbsip8CmLsMkT7xZs8JCqbS2+t
         9D+g==
X-Forwarded-Encrypted: i=1; AJvYcCX1I7KJQDaNCGvjl/6z2BTqIcE1Um+mHHhSB4MbCrJO3O2oR6fy+yChW/Vyz70M0FtymOMEyyEMJzdx8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzFHmjNEpnWfy+01Q2p3bE+JbqsSjXI9cPM/0NdkZInT8GecAv
	ov5gEsRL1xJHBKaeZwsLhg+wQzfhj6ffKUEYlSi4NgLgZ8G1LvrIDYevMtG5KJkc83XJvqCaYM9
	gJxGn2EEfjoJtKHYW3Ce7C5O2cJDd4UojaOlPMV4Bgg==
X-Gm-Gg: ASbGncvhsIeyqsQ5ALGWIm/cQuQplDNfLuBlR4bP7qcDzQeUCl953z0UlkHOl9wudZA
	JamXINwia7UM6xiMlcUIWvN3YCTZAejZB/v0CEyRRjqZM7UjlWUJE5cmxAht7JVR3fAWR/CNFIp
	2yUE4qyTRX2oRzvMrYzLny/gnRM5OMGVlaae6lG0jBOKQ=
X-Google-Smtp-Source: AGHT+IEYIeVC/jTVYCSxf/dGhqeDr1KHxYiJwAAX/5hmURj3RcHrh9D5I5KutnxKn6tUumkHdJ/1wa42+SytUsf+26I=
X-Received: by 2002:a05:6830:40c4:b0:72b:946e:ccc7 with SMTP id
 46e09a7af769-73a36091cbemr11291390a34.0.1750230191671; Wed, 18 Jun 2025
 00:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-7-jens.wiklander@linaro.org> <aFFSWDiVsxA1CbCX@sumit-X1>
In-Reply-To: <aFFSWDiVsxA1CbCX@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 18 Jun 2025 09:03:00 +0200
X-Gm-Features: AX0GCFvrA5yXpBPMnqH5JcYKZyhNKjMM65-tKAnroIXskFJp4M6WI4XH2u_9JeE
Message-ID: <CAHUa44HP5EbURyLCmawMLc0d5jz1oTQZ53V1w2h0-ngUC2hbEw@mail.gmail.com>
Subject: Re: [PATCH v10 6/9] tee: add tee_shm_alloc_dma_mem()
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
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 1:32=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, Jun 10, 2025 at 03:13:50PM +0200, Jens Wiklander wrote:
> > Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
> > represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM to
> > identify it as DMA memory. The allocated memory will later be lent to
> > the TEE to be used as protected memory.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/tee_shm.c    | 85 +++++++++++++++++++++++++++++++++++++++-
> >  include/linux/tee_core.h |  5 +++
> >  2 files changed, 88 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index e63095e84644..60b0f3932cee 100644
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
> > @@ -48,7 +55,16 @@ static void tee_shm_release(struct tee_device *teede=
v, struct tee_shm *shm)
> >  {
> >       void *p =3D shm;
> >
> > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > +     if (shm->flags & TEE_SHM_DMA_MEM) {
> > +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
>
> nit: this config check can be merged into the above if check.

No, because dma_free_pages() is only defined if
CONFIG_TEE_DMABUF_HEAPS is enabled.

>
> > +             struct tee_shm_dma_mem *dma_mem;
> > +
> > +             dma_mem =3D container_of(shm, struct tee_shm_dma_mem, shm=
);
> > +             p =3D dma_mem;
> > +             dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
> > +                            dma_mem->dma_addr, DMA_BIDIRECTIONAL);
> > +#endif
> > +     } else if (shm->flags & TEE_SHM_DMA_BUF) {
>
> Do we need a similar config check for this flag too?

No, because DMA_SHARED_BUFFER is selected, so the dma_buf functions are def=
ined.

Cheers,
Jens


>
> With these addressed, feel free to add:
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>
> -Sumit
>
> >               struct tee_shm_dmabuf_ref *ref;
> >
> >               ref =3D container_of(shm, struct tee_shm_dmabuf_ref, shm)=
;
> > @@ -303,6 +319,71 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_=
context *ctx, size_t size)
> >  }
> >  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> >
> > +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
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
> > +#else
> > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > +                                   size_t page_count)
> > +{
> > +     return ERR_PTR(-EINVAL);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> > +#endif
> > +
> >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t =
align,
> >                            int (*shm_register)(struct tee_context *ctx,
> >                                                struct tee_shm *shm,
> > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > index f17710196c4c..e46a53e753af 100644
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

