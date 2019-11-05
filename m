Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55CB4EFEFA
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 14:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389168AbfKENuz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 08:50:55 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46633 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388615AbfKENuz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 08:50:55 -0500
Received: by mail-oi1-f195.google.com with SMTP id n14so1805236oie.13
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2019 05:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=X3WH5qgCjdjTfEBC5QWqCj9RCp2b9w56vnVS224gMaQ=;
        b=jlLy8EVCEDlabwj1xVdY7hbgzc90XXxq5yum+CdP60OjwhGUULezg0sfY+bkK/8dLB
         yjJU7i8UsLrfYML0FM/J/QAufN1XdR1EZPPmV8PA4ahG21s6+pIcJs//cEYF4orsLa/J
         Lck+s/qlVYb0TDmvcJR+io4agcK9aHXgzGyyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X3WH5qgCjdjTfEBC5QWqCj9RCp2b9w56vnVS224gMaQ=;
        b=hdsHThwrpgq1JIB+u86Mg2o+/r7/J0O7lsrhSnFfs9p21DgLKznx35tzWmOAfTTiP2
         ktBDONIyCFtTcUx+0/RdxsoMl1gIceBCPV2PViyv+PCQ7ONoIOtP4URz3aZHBRj7btRv
         dXxcaa5P512yzKFI8mzYL144qB4Jxhjc3au4zc9lFdDrxOvGb7xwYAbtTYhFJNAH4xf5
         Z/YkBY8D9u50yCWZ8uD/8rngSmOqyUPUCuBr11Q811XMoe2vcdt9fdZ2s+rUurmxzAbS
         6ZpXFltv1DYSFnabzbnoEJF5TxbasotYHBK6Ob8760ML6MKkRdu+Etzfmr2/cUY0/Sq8
         U5Kw==
X-Gm-Message-State: APjAAAWDiWxN1iXHusTzJy6Y4lsOsOupfaJzOGFNUEmEnoixSLVHkPu3
        CJfgveFaqgKr84UPxK6FaXRsNvHBQO2im3EIZrx4Fw==
X-Google-Smtp-Source: APXvYqztZWp/1+PTkppdYkiJpHyZg08lbPMjBAFKULh9vuxjWqtRC7wQlOlPuNuS1e+GerZcGvGLUt2ipuqS1YeTi/o=
X-Received: by 2002:a05:6808:4cf:: with SMTP id a15mr3865723oie.132.1572961853926;
 Tue, 05 Nov 2019 05:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20191029104049.9011-1-christian.koenig@amd.com>
 <20191029104049.9011-6-christian.koenig@amd.com> <20191105105252.GE10326@phenom.ffwll.local>
 <0c506743-1def-2c49-886a-4fa125b33151@gmail.com>
In-Reply-To: <0c506743-1def-2c49-886a-4fa125b33151@gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 5 Nov 2019 14:50:42 +0100
Message-ID: <CAKMK7uEimcoB2vojTHDxQ1p2GaK7kBJQ3hWFzYoMtmDJYabwfA@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 5, 2019 at 2:39 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 05.11.19 um 11:52 schrieb Daniel Vetter:
> > On Tue, Oct 29, 2019 at 11:40:49AM +0100, Christian K=C3=B6nig wrote:
> >> Implement the importer side of unpinned DMA-buf handling.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 28 +++++++++++++++++++=
+-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  6 +++++
> >>   2 files changed, 33 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_dma_buf.c
> >> index 3629cfe53aad..af39553c51ad 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> >> @@ -456,7 +456,33 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev,=
 struct dma_buf *dma_buf)
> >>      return ERR_PTR(ret);
> >>   }
> >>
> >> +/**
> >> + * amdgpu_dma_buf_move_notify - &attach.move_notify implementation
> >> + *
> >> + * @attach: the DMA-buf attachment
> >> + *
> >> + * Invalidate the DMA-buf attachment, making sure that the we re-crea=
te the
> >> + * mapping before the next use.
> >> + */
> >> +static void
> >> +amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
> >> +{
> >> +    struct ttm_operation_ctx ctx =3D { false, false };
> >> +    struct drm_gem_object *obj =3D attach->importer_priv;
> >> +    struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> >> +    struct ttm_placement placement =3D {};
> >> +    int r;
> >> +
> >> +    if (bo->tbo.mem.mem_type =3D=3D TTM_PL_SYSTEM)
> >> +            return;
> >> +
> >> +    r =3D ttm_bo_validate(&bo->tbo, &placement, &ctx);
> >> +    if (r)
> >> +            DRM_ERROR("Failed to invalidate DMA-buf import (%d))\n", =
r);
> > Where do you update pagetables?
> >
> > The only thing I've found is in the amdgpu CS code, which is way to lat=
e
> > for this stuff here. Plus TTM doesn't handle virtual memory at all (asi=
de
> > from the gart tt), so clearly you need to call into amdgpu code somewhe=
re
> > for this. But I didn't find it, neither in your ->move_notify nor the
> > ->move callback in ttm_bo_driver.
> >
> > How does this work?
>
> Page tables are not updated until the next command submission, e.g. in
> amdgpu_cs.c
>
> This is save since all previous command submissions are added to the
> dma_resv object as fences and the dma_buf can't be moved before those
> are signaled.

Hm, I thought you still allow explicit buffer lists for each cs in
amdgpu? Code looks at least like that, not everything goes through the
context working set stuff.

How do you prevent the security leak if userspace simply lies about
not using a given buffer in a batch, and then abusing that to read
that virtual address range anyway and peek at whatever is now going to
be there when an eviction happened?
-Daniel

>
> Christian.
>
> > -Daniel
> >
> >> +}
> >> +
> >>   static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops =3D=
 {
> >> +    .move_notify =3D amdgpu_dma_buf_move_notify
> >>   };
> >>
> >>   /**
> >> @@ -492,7 +518,7 @@ struct drm_gem_object *amdgpu_gem_prime_import(str=
uct drm_device *dev,
> >>              return obj;
> >>
> >>      attach =3D dma_buf_dynamic_attach(dma_buf, dev->dev,
> >> -                                    &amdgpu_dma_buf_attach_ops, NULL)=
;
> >> +                                    &amdgpu_dma_buf_attach_ops, obj);
> >>      if (IS_ERR(attach)) {
> >>              drm_gem_object_put(obj);
> >>              return ERR_CAST(attach);
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_object.c
> >> index ac776d2620eb..cfa46341c9a7 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >> @@ -861,6 +861,9 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo,=
 u32 domain,
> >>              return 0;
> >>      }
> >>
> >> +    if (bo->tbo.base.import_attach)
> >> +            dma_buf_pin(bo->tbo.base.import_attach);
> >> +
> >>      bo->flags |=3D AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
> >>      /* force to pin into visible video ram */
> >>      if (!(bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS))
> >> @@ -944,6 +947,9 @@ int amdgpu_bo_unpin(struct amdgpu_bo *bo)
> >>
> >>      amdgpu_bo_subtract_pin_size(bo);
> >>
> >> +    if (bo->tbo.base.import_attach)
> >> +            dma_buf_unpin(bo->tbo.base.import_attach);
> >> +
> >>      for (i =3D 0; i < bo->placement.num_placement; i++) {
> >>              bo->placements[i].lpfn =3D 0;
> >>              bo->placements[i].flags &=3D ~TTM_PL_FLAG_NO_EVICT;
> >> --
> >> 2.17.1
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
