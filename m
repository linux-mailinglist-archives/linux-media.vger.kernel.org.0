Return-Path: <linux-media+bounces-33365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ABAAC3CF5
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 11:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88DB0188D8C7
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 09:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F31F1EFFB2;
	Mon, 26 May 2025 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFHrONzK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D621DDC22;
	Mon, 26 May 2025 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252018; cv=none; b=hB8Uux2E/IUcjm3cBZPSDrfKnC9v0mCJoJQ1hOyy4zPPAewlwlUJoiWQMY+/Ih04ZxI+1yZmAwQEPu2zbod3xEU1pde5200cJxzT6jCjI0om3ZjeBSbugLiOG0mx2zInKCN0fQ2D0MPVSa/N9SNK/F/9xg5afMpSL+JTBUD3mh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252018; c=relaxed/simple;
	bh=j5u6GeKfGRt01uKZ1DWq/krRDd3IxYawjOABhTomJIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQdcwTpMm5gvqrCIX6FWwRqdZU+RNCdFcuXoul578B3M1+11Aej7XuiQ5lDAx0W3NlZ+a5fzImpkbiNqtY7t86Jjeg88JlR2JoJ7l5KQCOl7bI6B9bLl6TYawEwzM3gI7YRoMjmxmFM4wm5T5Wm8PBCftYyownrbBfKAHLYiLFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFHrONzK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F021BC4CEEE;
	Mon, 26 May 2025 09:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748252017;
	bh=j5u6GeKfGRt01uKZ1DWq/krRDd3IxYawjOABhTomJIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CFHrONzKTbnwow4S3bzcO7VcXUvND1JG7WNzhUwiL/79/1EFCNY4mOro9s/dAOOXO
	 hpVqP+S3ihCrM5yUwGl4inEqAqShAvKpwH6gcaELHHRLfpGZnvfglnq4negLhrSDKj
	 ffkH4Qp4Hh3QuQV7kVC7Yz/qmmu6EVJTUJFKckrQ9WaEcL1hwpLVAribKGZw+s3NDe
	 mmB7/TD8aHKtOl4M5LS8l1JVI2KWIad8fxJO2lXBXPqWThHnCooVYmdP77Ad1IIHCL
	 PMxuD73WteTm6D+j0tW0mJb8+4bEfg3y0CxP7uTSudEQoCtCzK8GonUTWkvTEwdDHM
	 gDU8BP68rKMyQ==
Date: Mon, 26 May 2025 15:03:21 +0530
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
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Subject: Re: [PATCH v9 6/9] tee: add tee_shm_alloc_dma_mem()
Message-ID: <aDQ1YR5jbcOFctty@sumit-X1>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-7-jens.wiklander@linaro.org>
 <aDQWt5Ck1Bo01Z_4@sumit-X1>
 <CAHUa44E4-z7-7DQjyGXYRiZDf6mRBKYZDuxWFGy+3JxtWO1ocg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44E4-z7-7DQjyGXYRiZDf6mRBKYZDuxWFGy+3JxtWO1ocg@mail.gmail.com>

On Mon, May 26, 2025 at 11:21:47AM +0200, Jens Wiklander wrote:
> On Mon, May 26, 2025 at 9:22 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > On Tue, May 20, 2025 at 05:16:49PM +0200, Jens Wiklander wrote:
> > > Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
> > > represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM to
> > > identify it as DMA memory. The allocated memory will later be lent to
> > > the TEE to be used as protected memory.
> > >
> > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > ---
> > >  drivers/tee/tee_shm.c    | 74 ++++++++++++++++++++++++++++++++++++++--
> > >  include/linux/tee_core.h |  5 +++
> > >  2 files changed, 77 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > > index e1ed52ee0a16..92a6a35e1a1e 100644
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
> > > @@ -49,7 +56,14 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
> > >       struct tee_shm *parent_shm = NULL;
> > >       void *p = shm;
> > >
> > > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > > +     if (shm->flags & TEE_SHM_DMA_MEM) {
> > > +             struct tee_shm_dma_mem *dma_mem;
> > > +
> > > +             dma_mem = container_of(shm, struct tee_shm_dma_mem, shm);
> > > +             p = dma_mem;
> > > +             dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
> > > +                            dma_mem->dma_addr, DMA_BIDIRECTIONAL);
> >
> > Although the kernel bot already found a randconfig issue, it looks like
> > we need to add Kconfig dependencies like HAS_DMA, DMA_CMA etc.
> >
> > Also, I was thinking if we should rather add a new TEE subsystem
> > specific Kconfig option like: TEE_DMABUF_HEAPS which can then be used to
> > select whatever dependency is needed as well as act as a gating Kconfig
> > for relevant features.
> 
> You mean something like this?
> 
> --- a/drivers/tee/Kconfig
> +++ b/drivers/tee/Kconfig
> @@ -13,6 +13,14 @@ menuconfig TEE
> 
>  if TEE
> 
> +config TEE_DMABUF_HEAPS
> +       bool
> +       depends on HAS_DMA && DMABUF_HEAPS

Yeah this looks fine to me but needs to be tested if DMA_CMA is a
dependency here too.

> +
> +config TEE_STATIC_PROTMEM_POOL
> +       bool
> +       depends on HAS_IOMEM && TEE_DMABUF_HEAPS

The static and dynamic protected memory pools should get auto enabled if
TEE_DMABUF_HEAPS is enabled since they are pre-requisite to provide the
protected heaps support. Something like:

+config TEE_STATIC_PROTMEM_POOL
+       bool
+       default y if TEE_DMABUF_HEAPS
+       depends on HAS_IOMEM

-Sumit

> +
> 
> Cheers,
> Jens
> 
> >
> > -Sumit
> >
> > > +     } else if (shm->flags & TEE_SHM_DMA_BUF) {
> > >               struct tee_shm_dmabuf_ref *ref;
> > >
> > >               ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
> > > @@ -306,6 +320,62 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
> > >  }
> > >  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> > >
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
> > > +
> > >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
> > >                            int (*shm_register)(struct tee_context *ctx,
> > >                                                struct tee_shm *shm,
> > > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > > index 02c07f661349..925690e1020b 100644
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

