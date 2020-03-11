Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55EEF181C0A
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 16:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729898AbgCKPIR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 11:08:17 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34488 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729846AbgCKPIR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 11:08:17 -0400
Received: by mail-wr1-f65.google.com with SMTP id z15so3107487wrl.1
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 08:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D9+oQ/AkN6mT0HJLMTysmgvzQqWfDcsZo+DqGnqUceE=;
        b=HBdtMy7oumAOt97wxjYYeP+KqA9TVYMGitlhqfYx3qYWScj3y4mSTC3d1oNJgu0Tlj
         VsEMHGSgsvwX05rxKJDQYm0lJhuJVjj4jskKOPbyOCnN5VV+g4IOUXzQX7cjYbz84O1U
         4tmkalJmFNtTlVySKVUOjX9EFwNUji/4r5NNZj43KMix5/ElGiWg5Oxt4NK/gEkiylrN
         UtFR/S5osbOQM/xiev9JLDoxpsUtHc/UM6Ju8ul2awoaeKguQdiUTx0074Viohi7GT6h
         aWAyV7hFLs8MUis2VcG3HlBuTGWv8pKLOnzO+GrAE80yJSq4mwyqeJLdVNiIvhSp1wBq
         AKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D9+oQ/AkN6mT0HJLMTysmgvzQqWfDcsZo+DqGnqUceE=;
        b=RbpYCatxijdlHVASDkKW4KEvBWBXc03GkobwrVoh+99HH6KN/yOUmZXUxo1gb8b/Sq
         q2EbXuCoIWXTxwGSd3UIFd17KRQOKq6hhea6iPFV+aGNihy4ssoia97C6k0WnlgxbDP4
         B663vkf8ogj9R87opdaTUtu8iP5QFeudia5rrCAfGvy6yjXpqvySvEXmn4XJ8Ag4c52W
         9DWTGUgHHS8wMCuaEPWg/dz1uditszKNvj+GmYhsHvWDUtMgAMhud0DnNn/oeHEn5d8u
         8sNQ1yZfEyOZeJvaFQdbIfliCpuOqHY8+XEsHm3ZskYNYiIPMrdoF81GBCbNzQ1g/Rxs
         Vzow==
X-Gm-Message-State: ANhLgQ1LL5WImWEC/+gzXOsqpD4Pc2MWatpOeuy2lPUo0VIGUDJpYAWO
        Nksti/5JV3tfZStE3QzUUawbvsCj/gUiUnVUdKs=
X-Google-Smtp-Source: ADFU+vusHvnblWQ2EnefgfomrePe1WvcbbDa0+uv4vHliLmG2ZdGPa4rVAbpjUbTMu63R7e6B90WEWp4lchh/qc/tZc=
X-Received: by 2002:a5d:6688:: with SMTP id l8mr4891232wru.362.1583939294083;
 Wed, 11 Mar 2020 08:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200311135158.3310-1-christian.koenig@amd.com> <20200311135158.3310-6-christian.koenig@amd.com>
In-Reply-To: <20200311135158.3310-6-christian.koenig@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 11 Mar 2020 11:08:03 -0400
Message-ID: <CADnq5_Ma8yaoULpOkc0DL=CPb-euUaXy+e33mY6O00oG4892cw@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/amdgpu: add support for exporting VRAM using
 DMA-buf v2
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     Chunming Zhou <David1.Zhou@amd.com>,
        Christoph Hellwig <hch@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 11, 2020 at 9:52 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> We should be able to do this now after checking all the prerequisites.
>
> v2: fix entrie count in the sgt
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c  | 56 ++++++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      | 12 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 97 ++++++++++++++++++++
>  3 files changed, 151 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_dma_buf.c
> index bbf67800c8a6..43d8ed7dbd00 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -276,14 +276,21 @@ static struct sg_table *amdgpu_dma_buf_map(struct d=
ma_buf_attachment *attach,
>         struct dma_buf *dma_buf =3D attach->dmabuf;
>         struct drm_gem_object *obj =3D dma_buf->priv;
>         struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> +       struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
>         struct sg_table *sgt;
>         long r;
>
>         if (!bo->pin_count) {
> -               /* move buffer into GTT */
> +               /* move buffer into GTT or VRAM */
>                 struct ttm_operation_ctx ctx =3D { false, false };
> +               unsigned domains =3D AMDGPU_GEM_DOMAIN_GTT;
>
> -               amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_GTT=
);
> +               if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM &&
> +                   attach->peer2peer) {
> +                       bo->flags |=3D AMDGPU_GEM_CREATE_CPU_ACCESS_REQUI=
RED;
> +                       domains |=3D AMDGPU_GEM_DOMAIN_VRAM;
> +               }
> +               amdgpu_bo_placement_from_domain(bo, domains);
>                 r =3D ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>                 if (r)
>                         return ERR_PTR(r);
> @@ -293,20 +300,34 @@ static struct sg_table *amdgpu_dma_buf_map(struct d=
ma_buf_attachment *attach,
>                 return ERR_PTR(-EBUSY);
>         }
>
> -       sgt =3D drm_prime_pages_to_sg(bo->tbo.ttm->pages, bo->tbo.num_pag=
es);
> -       if (IS_ERR(sgt))
> -               return sgt;
> -
> -       if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
> -                             DMA_ATTR_SKIP_CPU_SYNC))
> -               goto error_free;
> +       switch (bo->tbo.mem.mem_type) {
> +       case TTM_PL_TT:
> +               sgt =3D drm_prime_pages_to_sg(bo->tbo.ttm->pages,
> +                                           bo->tbo.num_pages);
> +               if (IS_ERR(sgt))
> +                       return sgt;
> +
> +               if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, =
dir,
> +                                     DMA_ATTR_SKIP_CPU_SYNC))
> +                       goto error_free;
> +               break;
> +
> +       case TTM_PL_VRAM:
> +               r =3D amdgpu_vram_mgr_alloc_sgt(adev, &bo->tbo.mem, attac=
h->dev,
> +                                             dir, &sgt);
> +               if (r)
> +                       return ERR_PTR(r);
> +               break;
> +       default:
> +               return ERR_PTR(-EINVAL);
> +       }
>
>         return sgt;
>
>  error_free:
>         sg_free_table(sgt);
>         kfree(sgt);
> -       return ERR_PTR(-ENOMEM);
> +       return ERR_PTR(-EBUSY);
>  }
>
>  /**
> @@ -322,9 +343,18 @@ static void amdgpu_dma_buf_unmap(struct dma_buf_atta=
chment *attach,
>                                  struct sg_table *sgt,
>                                  enum dma_data_direction dir)
>  {
> -       dma_unmap_sg(attach->dev, sgt->sgl, sgt->nents, dir);
> -       sg_free_table(sgt);
> -       kfree(sgt);
> +       struct dma_buf *dma_buf =3D attach->dmabuf;
> +       struct drm_gem_object *obj =3D dma_buf->priv;
> +       struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> +       struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
> +
> +       if (sgt->sgl->page_link) {
> +               dma_unmap_sg(attach->dev, sgt->sgl, sgt->nents, dir);
> +               sg_free_table(sgt);
> +               kfree(sgt);
> +       } else {
> +               amdgpu_vram_mgr_free_sgt(adev, attach->dev, dir, sgt);
> +       }
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.h
> index 7551f3729445..a99d813b23a5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -24,8 +24,9 @@
>  #ifndef __AMDGPU_TTM_H__
>  #define __AMDGPU_TTM_H__
>
> -#include "amdgpu.h"
> +#include <linux/dma-direction.h>
>  #include <drm/gpu_scheduler.h>
> +#include "amdgpu.h"
>
>  #define AMDGPU_PL_GDS          (TTM_PL_PRIV + 0)
>  #define AMDGPU_PL_GWS          (TTM_PL_PRIV + 1)
> @@ -74,6 +75,15 @@ uint64_t amdgpu_gtt_mgr_usage(struct ttm_mem_type_mana=
ger *man);
>  int amdgpu_gtt_mgr_recover(struct ttm_mem_type_manager *man);
>
>  u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo);
> +int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
> +                             struct ttm_mem_reg *mem,
> +                             struct device *dev,
> +                             enum dma_data_direction dir,
> +                             struct sg_table **sgt);
> +void amdgpu_vram_mgr_free_sgt(struct amdgpu_device *adev,
> +                             struct device *dev,
> +                             enum dma_data_direction dir,
> +                             struct sg_table *sgt);
>  uint64_t amdgpu_vram_mgr_usage(struct ttm_mem_type_manager *man);
>  uint64_t amdgpu_vram_mgr_vis_usage(struct ttm_mem_type_manager *man);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_vram_mgr.c
> index 82a3299e53c0..c6e7f00c5b21 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -22,6 +22,7 @@
>   * Authors: Christian K=C3=B6nig
>   */
>
> +#include <linux/dma-mapping.h>
>  #include "amdgpu.h"
>  #include "amdgpu_vm.h"
>  #include "amdgpu_atomfirmware.h"
> @@ -458,6 +459,102 @@ static void amdgpu_vram_mgr_del(struct ttm_mem_type=
_manager *man,
>         mem->mm_node =3D NULL;
>  }
>
> +/**
> + * amdgpu_vram_mgr_alloc_sgt - allocate and fill a sg table
> + *
> + * @adev: amdgpu device pointer
> + * @mem: TTM memory object
> + * @dev: the other device
> + * @dir: dma direction
> + * @sgt: resulting sg table
> + *
> + * Allocate and fill a sg table from a VRAM allocation.
> + */
> +int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
> +                             struct ttm_mem_reg *mem,
> +                             struct device *dev,
> +                             enum dma_data_direction dir,
> +                             struct sg_table **sgt)
> +{
> +       struct drm_mm_node *node;
> +       struct scatterlist *sg;
> +       int num_entries =3D 0;
> +       unsigned int pages;
> +       int i, r;
> +
> +       *sgt =3D kmalloc(sizeof(*sg), GFP_KERNEL);
> +       if (!*sgt)
> +               return -ENOMEM;
> +
> +       for (pages =3D mem->num_pages, node =3D mem->mm_node;
> +            pages; pages -=3D node->size, ++node)
> +               ++num_entries;
> +
> +       r =3D sg_alloc_table(*sgt, num_entries, GFP_KERNEL);
> +       if (r)
> +               goto error_free;
> +
> +       for_each_sg((*sgt)->sgl, sg, num_entries, i)
> +               sg->length =3D 0;
> +
> +       node =3D mem->mm_node;
> +       for_each_sg((*sgt)->sgl, sg, num_entries, i) {
> +               phys_addr_t phys =3D (node->start << PAGE_SHIFT) +
> +                       adev->gmc.aper_base;
> +               size_t size =3D node->size << PAGE_SHIFT;
> +               dma_addr_t addr;
> +
> +               ++node;
> +               addr =3D dma_map_resource(dev, phys, size, dir,
> +                                       DMA_ATTR_SKIP_CPU_SYNC);
> +               r =3D dma_mapping_error(dev, addr);
> +               if (r)
> +                       goto error_unmap;
> +
> +               sg_set_dma_addr(sg, addr, size, 0);
> +       }
> +       return 0;
> +
> +error_unmap:
> +       for_each_sg((*sgt)->sgl, sg, num_entries, i) {
> +               if (!sg->length)
> +                       continue;
> +
> +               dma_unmap_resource(dev, sg->dma_address,
> +                                  sg->length, dir,
> +                                  DMA_ATTR_SKIP_CPU_SYNC);
> +       }
> +       sg_free_table(*sgt);
> +
> +error_free:
> +       kfree(*sgt);
> +       return r;
> +}
> +
> +/**
> + * amdgpu_vram_mgr_alloc_sgt - allocate and fill a sg table

This should be:
amdgpu_vram_mgr_free_sgt - unmap and free an sg table


> + *
> + * @adev: amdgpu device pointer
> + * @sgt: sg table to free
> + *
> + * Free a previously allocate sg table.
> + */
> +void amdgpu_vram_mgr_free_sgt(struct amdgpu_device *adev,
> +                             struct device *dev,
> +                             enum dma_data_direction dir,
> +                             struct sg_table *sgt)
> +{
> +       struct scatterlist *sg;
> +       int i;
> +
> +       for_each_sg(sgt->sgl, sg, sgt->nents, i)
> +               dma_unmap_resource(dev, sg->dma_address,
> +                                  sg->length, dir,
> +                                  DMA_ATTR_SKIP_CPU_SYNC);
> +       sg_free_table(sgt);
> +       kfree(sgt);
> +}
> +
>  /**
>   * amdgpu_vram_mgr_usage - how many bytes are used in this domain
>   *
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
