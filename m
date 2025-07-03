Return-Path: <linux-media+bounces-36633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EC9AF6A43
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 08:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C94A91C454EB
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 06:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86157291C20;
	Thu,  3 Jul 2025 06:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uL70UOkq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E184734CF5;
	Thu,  3 Jul 2025 06:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751524092; cv=none; b=AgDRuRHHTqlF47qr2QdZJeM8VF/F/hgkOXPgoDyiaS7IkoSZnYDHdiJQd5sCanH0vycC4C2LVuhiw3yNey5q7zuKu8sv0t8cWhRMlTYa4Gn3iiZYzsBBcHA4kSN1sCU8U61Duhl1AfahlK5wOOfxPr+9VUT5o2hUAl08Wz0nd/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751524092; c=relaxed/simple;
	bh=T72yXCmWdX5uoyXouBY6LyB4JVY9V6cpBLUYnY5mazQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGlCKRnEHYsIpJk5Kqgazf2RFNCnNsi6EIpYuQkdCJ+4X/OHKefSdB4s30FglZcO2/oRoNOZqA5VK0uHyRLJv0liUEXZrnFm/Aj8BBiE35C8KcqY0ER9B1DOGNPZvEd9U5I3oU/38w/dvDroAv0Tzi1cMaVx2U/cEjjuVM8jGao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uL70UOkq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16EEC4CEEB;
	Thu,  3 Jul 2025 06:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751524091;
	bh=T72yXCmWdX5uoyXouBY6LyB4JVY9V6cpBLUYnY5mazQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uL70UOkq3bTbtQc6sV0B15O2BmBs+JKSMF5sViA6FpL5BEFxDRZ2EMCCuGe1EvaaM
	 APZWQiXwZQJcn56XDKHVuOI7rLGD+Xs1E9FreeF9wIQa/PhwbDmEI2TrrmyJAXfJPW
	 Z4SP060V1akKVI83GrwoWWlMtTY2fI8hb8AaPKjyYUNuOivHvr7vDLpkkSxtsGGVQq
	 BsI2UOgEyyShfWxVYe1VW8CodBSutQeeW7mRVA5n+7s/A9ym5TU6fkXMS4V6/NfxKK
	 81RwZTsLAY8ADwAK5VkoPb9oT0b5ELh2S5CI7coneJ4PeHDrPqfaJHCSJxbm9ZVGci
	 O5fq+JWp5PBQA==
Date: Thu, 3 Jul 2025 11:58:01 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	robin.murphy@arm.com
Subject: Re: [PATCH v10 6/9] tee: add tee_shm_alloc_dma_mem()
Message-ID: <aGYi8QkgI3WyeN59@sumit-X1>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-7-jens.wiklander@linaro.org>
 <aFFSWDiVsxA1CbCX@sumit-X1>
 <CAHUa44HP5EbURyLCmawMLc0d5jz1oTQZ53V1w2h0-ngUC2hbEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44HP5EbURyLCmawMLc0d5jz1oTQZ53V1w2h0-ngUC2hbEw@mail.gmail.com>

On Wed, Jun 18, 2025 at 09:03:00AM +0200, Jens Wiklander wrote:
> On Tue, Jun 17, 2025 at 1:32 PM Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > On Tue, Jun 10, 2025 at 03:13:50PM +0200, Jens Wiklander wrote:
> > > Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
> > > represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM to
> > > identify it as DMA memory. The allocated memory will later be lent to
> > > the TEE to be used as protected memory.
> > >
> > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > ---
> > >  drivers/tee/tee_shm.c    | 85 +++++++++++++++++++++++++++++++++++++++-
> > >  include/linux/tee_core.h |  5 +++
> > >  2 files changed, 88 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > > index e63095e84644..60b0f3932cee 100644
> > > --- a/drivers/tee/tee_shm.c
> > > +++ b/drivers/tee/tee_shm.c
> > > @@ -5,6 +5,8 @@
> > >  #include <linux/anon_inodes.h>
> > >  #include <linux/device.h>
> > >  #include <linux/dma-buf.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/highmem.h>
> > >  #include <linux/idr.h>
> > >  #include <linux/io.h>
> > >  #include <linux/mm.h>
> > > @@ -13,9 +15,14 @@
> > >  #include <linux/tee_core.h>
> > >  #include <linux/uaccess.h>
> > >  #include <linux/uio.h>
> > > -#include <linux/highmem.h>
> > >  #include "tee_private.h"
> > >
> > > +struct tee_shm_dma_mem {
> > > +     struct tee_shm shm;
> > > +     dma_addr_t dma_addr;
> > > +     struct page *page;
> > > +};
> > > +
> > >  static void shm_put_kernel_pages(struct page **pages, size_t page_count)
> > >  {
> > >       size_t n;
> > > @@ -48,7 +55,16 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
> > >  {
> > >       void *p = shm;
> > >
> > > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > > +     if (shm->flags & TEE_SHM_DMA_MEM) {
> > > +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
> >
> > nit: this config check can be merged into the above if check.
> 
> No, because dma_free_pages() is only defined if
> CONFIG_TEE_DMABUF_HEAPS is enabled.

It looks like you misunderstood my above comment, I rather meant:

	if (IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS) &&
	    (shm->flags & TEE_SHM_DMA_MEM))

-Sumit

> 
> >
> > > +             struct tee_shm_dma_mem *dma_mem;
> > > +
> > > +             dma_mem = container_of(shm, struct tee_shm_dma_mem, shm);
> > > +             p = dma_mem;
> > > +             dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
> > > +                            dma_mem->dma_addr, DMA_BIDIRECTIONAL);
> > > +#endif
> > > +     } else if (shm->flags & TEE_SHM_DMA_BUF) {
> >
> > Do we need a similar config check for this flag too?
> 
> No, because DMA_SHARED_BUFFER is selected, so the dma_buf functions are defined.
> 
> Cheers,
> Jens
> 
> 
> >
> > With these addressed, feel free to add:
> >
> > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >
> > -Sumit
> >
> > >               struct tee_shm_dmabuf_ref *ref;
> > >
> > >               ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
> > > @@ -303,6 +319,71 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
> > >  }
> > >  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> > >
> > > +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
> > > +/**
> > > + * tee_shm_alloc_dma_mem() - Allocate DMA memory as shared memory object
> > > + * @ctx:     Context that allocates the shared memory
> > > + * @page_count:      Number of pages
> > > + *
> > > + * The allocated memory is expected to be lent (made inaccessible to the
> > > + * kernel) to the TEE while it's used and returned (accessible to the
> > > + * kernel again) before it's freed.
> > > + *
> > > + * This function should normally only be used internally in the TEE
> > > + * drivers.
> > > + *
> > > + * @returns a pointer to 'struct tee_shm'
> > > + */
> > > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > > +                                   size_t page_count)
> > > +{
> > > +     struct tee_device *teedev = ctx->teedev;
> > > +     struct tee_shm_dma_mem *dma_mem;
> > > +     dma_addr_t dma_addr;
> > > +     struct page *page;
> > > +
> > > +     if (!tee_device_get(teedev))
> > > +             return ERR_PTR(-EINVAL);
> > > +
> > > +     page = dma_alloc_pages(&teedev->dev, page_count * PAGE_SIZE,
> > > +                            &dma_addr, DMA_BIDIRECTIONAL, GFP_KERNEL);
> > > +     if (!page)
> > > +             goto err_put_teedev;
> > > +
> > > +     dma_mem = kzalloc(sizeof(*dma_mem), GFP_KERNEL);
> > > +     if (!dma_mem)
> > > +             goto err_free_pages;
> > > +
> > > +     refcount_set(&dma_mem->shm.refcount, 1);
> > > +     dma_mem->shm.ctx = ctx;
> > > +     dma_mem->shm.paddr = page_to_phys(page);
> > > +     dma_mem->dma_addr = dma_addr;
> > > +     dma_mem->page = page;
> > > +     dma_mem->shm.size = page_count * PAGE_SIZE;
> > > +     dma_mem->shm.flags = TEE_SHM_DMA_MEM;
> > > +
> > > +     teedev_ctx_get(ctx);
> > > +
> > > +     return &dma_mem->shm;
> > > +
> > > +err_free_pages:
> > > +     dma_free_pages(&teedev->dev, page_count * PAGE_SIZE, page, dma_addr,
> > > +                    DMA_BIDIRECTIONAL);
> > > +err_put_teedev:
> > > +     tee_device_put(teedev);
> > > +
> > > +     return ERR_PTR(-ENOMEM);
> > > +}
> > > +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> > > +#else
> > > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > > +                                   size_t page_count)
> > > +{
> > > +     return ERR_PTR(-EINVAL);
> > > +}
> > > +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> > > +#endif
> > > +
> > >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
> > >                            int (*shm_register)(struct tee_context *ctx,
> > >                                                struct tee_shm *shm,
> > > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > > index f17710196c4c..e46a53e753af 100644
> > > --- a/include/linux/tee_core.h
> > > +++ b/include/linux/tee_core.h
> > > @@ -29,6 +29,8 @@
> > >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool */
> > >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driver */
> > >  #define TEE_SHM_DMA_BUF              BIT(4)  /* Memory with dma-buf handle */
> > > +#define TEE_SHM_DMA_MEM              BIT(5)  /* Memory allocated with */
> > > +                                     /* dma_alloc_pages() */
> > >
> > >  #define TEE_DEVICE_FLAG_REGISTERED   0x1
> > >  #define TEE_MAX_DEV_NAME_LEN         32
> > > @@ -310,6 +312,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
> > >   */
> > >  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size);
> > >
> > > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > > +                                   size_t page_count);
> > > +
> > >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
> > >                            int (*shm_register)(struct tee_context *ctx,
> > >                                                struct tee_shm *shm,
> > > --
> > > 2.43.0
> > >

