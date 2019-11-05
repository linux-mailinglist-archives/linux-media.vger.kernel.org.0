Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D669DF0134
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 16:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389732AbfKEPXj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 10:23:39 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38498 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389546AbfKEPXi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 10:23:38 -0500
Received: by mail-ot1-f67.google.com with SMTP id v24so12647546otp.5
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2019 07:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LxwshiFr5e2ZtxT2Hxol1kZjO1B/XzDnPF3ado31LHI=;
        b=N55OWs/JxvzzLd+yEhuUfqNqyRwuavuf9IrljR1faXsHl300NTSHh9idKuISUvDiXI
         dnYulBzavnwkzZdme0UOgd92FynhnOZe27Y61Uh9fgAK64nzb9cEHzdfnNpC8kf/c4Y/
         R0ndcIBddb5VIJFo4pB5+CSDSMlgTs9a/zhdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LxwshiFr5e2ZtxT2Hxol1kZjO1B/XzDnPF3ado31LHI=;
        b=V3PxvBlxaqBPxh1qi1koSCd28wMm1/a5/uVYSx6NoXirdfCR81bPu4VcvQ45Yc/R5D
         /JpOntLCAysmy24Vl36CRlnIp/EXqZxJAEE+gXB8FEZdVOr8THbKFX15qYac+gFPNNvd
         Cj58SDkTrLNNZjF4WB6je9qWt35BDo5Kiqx0fzXvQw8h9IwZnOcQf9xA225S/nALVYEI
         UIHws76uPbL4ReYwOSKlKtky3MXlN7EfXzEysncgmauPmlnWB5CXnFzfyfs4ZgSgKi/U
         4U3fvuNB/rEUaNkVJ4Rt9mUi/O7RqJEG1n6soc5FzP3a6gqnIN7qSQSV6EqpjhD8X4Og
         rIMg==
X-Gm-Message-State: APjAAAU/qFLKpHltDLrzH+/is/ZQfa1oRui3SXzpuDzcdNt7Lqj1fwph
        /x0FBiov3spbdpn54VPtIyNWT/r3dOzBq77WaTTQ1g==
X-Google-Smtp-Source: APXvYqx6OnrDPbCcXP6o7wS2ut2klb7MNADkXR8KPe/4mnIJiBOmc3DLOdI8O7co5ZI+ylGHftj5hun28U6DLv37Yps=
X-Received: by 2002:a05:6830:1649:: with SMTP id h9mr1894412otr.281.1572967417450;
 Tue, 05 Nov 2019 07:23:37 -0800 (PST)
MIME-Version: 1.0
References: <20191029104049.9011-1-christian.koenig@amd.com>
 <20191029104049.9011-6-christian.koenig@amd.com> <20191105105252.GE10326@phenom.ffwll.local>
 <0c506743-1def-2c49-886a-4fa125b33151@gmail.com> <CAKMK7uEimcoB2vojTHDxQ1p2GaK7kBJQ3hWFzYoMtmDJYabwfA@mail.gmail.com>
 <7d430beb-7f88-ca51-b3d6-9b7c95954234@amd.com>
In-Reply-To: <7d430beb-7f88-ca51-b3d6-9b7c95954234@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 5 Nov 2019 16:23:26 +0100
Message-ID: <CAKMK7uFX+qmURcyxEfffWJqDBzZJWRZV68id-=iXxpcyU_nkYg@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify
To:     "Koenig, Christian" <Christian.Koenig@amd.com>
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

On Tue, Nov 5, 2019 at 4:20 PM Koenig, Christian
<Christian.Koenig@amd.com> wrote:
>
> Am 05.11.19 um 14:50 schrieb Daniel Vetter:
> > On Tue, Nov 5, 2019 at 2:39 PM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Am 05.11.19 um 11:52 schrieb Daniel Vetter:
> >>> On Tue, Oct 29, 2019 at 11:40:49AM +0100, Christian K=C3=B6nig wrote:
> >>>> Implement the importer side of unpinned DMA-buf handling.
> >>>>
> >>>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>> ---
> >>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 28 ++++++++++++++++=
++++-
> >>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  6 +++++
> >>>>    2 files changed, 33 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_dma_buf.c
> >>>> index 3629cfe53aad..af39553c51ad 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> >>>> @@ -456,7 +456,33 @@ amdgpu_dma_buf_create_obj(struct drm_device *de=
v, struct dma_buf *dma_buf)
> >>>>       return ERR_PTR(ret);
> >>>>    }
> >>>>
> >>>> +/**
> >>>> + * amdgpu_dma_buf_move_notify - &attach.move_notify implementation
> >>>> + *
> >>>> + * @attach: the DMA-buf attachment
> >>>> + *
> >>>> + * Invalidate the DMA-buf attachment, making sure that the we re-cr=
eate the
> >>>> + * mapping before the next use.
> >>>> + */
> >>>> +static void
> >>>> +amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
> >>>> +{
> >>>> +    struct ttm_operation_ctx ctx =3D { false, false };
> >>>> +    struct drm_gem_object *obj =3D attach->importer_priv;
> >>>> +    struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> >>>> +    struct ttm_placement placement =3D {};
> >>>> +    int r;
> >>>> +
> >>>> +    if (bo->tbo.mem.mem_type =3D=3D TTM_PL_SYSTEM)
> >>>> +            return;
> >>>> +
> >>>> +    r =3D ttm_bo_validate(&bo->tbo, &placement, &ctx);
> >>>> +    if (r)
> >>>> +            DRM_ERROR("Failed to invalidate DMA-buf import (%d))\n"=
, r);
> >>> Where do you update pagetables?
> >>>
> >>> The only thing I've found is in the amdgpu CS code, which is way to l=
ate
> >>> for this stuff here. Plus TTM doesn't handle virtual memory at all (a=
side
> >>> from the gart tt), so clearly you need to call into amdgpu code somew=
here
> >>> for this. But I didn't find it, neither in your ->move_notify nor the
> >>> ->move callback in ttm_bo_driver.
> >>>
> >>> How does this work?
> >> Page tables are not updated until the next command submission, e.g. in
> >> amdgpu_cs.c
> >>
> >> This is save since all previous command submissions are added to the
> >> dma_resv object as fences and the dma_buf can't be moved before those
> >> are signaled.
> > Hm, I thought you still allow explicit buffer lists for each cs in
> > amdgpu? Code looks at least like that, not everything goes through the
> > context working set stuff.
> >
> > How do you prevent the security leak if userspace simply lies about
> > not using a given buffer in a batch, and then abusing that to read
> > that virtual address range anyway and peek at whatever is now going to
> > be there when an eviction happened?
>
> Oh, yeah that is a really good point. And no that isn't handled
> correctly at all.
>
> I wanted to rework that for quite some time now, but always got into
> issues with TTM.
>
> Thanks for the notice, so I need to put my TTM rework before of this.
> Crap, that adds a whole bunch of TODOs to my list.

Ok, I think that also clears up some confusion we had around
notify_move semantics, where I wanted to add more fences from within
the callback (for the pipelined gpu pagetable clearing) and you didn't
really see the point. I dumped my overall thoughts on all things open
here on the cover letter, but yeah probably best if you wire up the pt
clearing in amdgpu first. Then we can easier see what we'll need to
funnel that through dma-buf.

Cheers, Daniel

>
> Regards,
> Christian.
>
> > -Daniel
> >
> >> Christian.
> >>
> >>> -Daniel
> >>>
> >>>> +}
> >>>> +
> >>>>    static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops =
=3D {
> >>>> +    .move_notify =3D amdgpu_dma_buf_move_notify
> >>>>    };
> >>>>
> >>>>    /**
> >>>> @@ -492,7 +518,7 @@ struct drm_gem_object *amdgpu_gem_prime_import(s=
truct drm_device *dev,
> >>>>               return obj;
> >>>>
> >>>>       attach =3D dma_buf_dynamic_attach(dma_buf, dev->dev,
> >>>> -                                    &amdgpu_dma_buf_attach_ops, NUL=
L);
> >>>> +                                    &amdgpu_dma_buf_attach_ops, obj=
);
> >>>>       if (IS_ERR(attach)) {
> >>>>               drm_gem_object_put(obj);
> >>>>               return ERR_CAST(attach);
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_object.c
> >>>> index ac776d2620eb..cfa46341c9a7 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >>>> @@ -861,6 +861,9 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *b=
o, u32 domain,
> >>>>               return 0;
> >>>>       }
> >>>>
> >>>> +    if (bo->tbo.base.import_attach)
> >>>> +            dma_buf_pin(bo->tbo.base.import_attach);
> >>>> +
> >>>>       bo->flags |=3D AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
> >>>>       /* force to pin into visible video ram */
> >>>>       if (!(bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS))
> >>>> @@ -944,6 +947,9 @@ int amdgpu_bo_unpin(struct amdgpu_bo *bo)
> >>>>
> >>>>       amdgpu_bo_subtract_pin_size(bo);
> >>>>
> >>>> +    if (bo->tbo.base.import_attach)
> >>>> +            dma_buf_unpin(bo->tbo.base.import_attach);
> >>>> +
> >>>>       for (i =3D 0; i < bo->placement.num_placement; i++) {
> >>>>               bo->placements[i].lpfn =3D 0;
> >>>>               bo->placements[i].flags &=3D ~TTM_PL_FLAG_NO_EVICT;
> >>>> --
> >>>> 2.17.1
> >>>>
> >>>> _______________________________________________
> >>>> dri-devel mailing list
> >>>> dri-devel@lists.freedesktop.org
> >>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
