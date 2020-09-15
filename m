Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E21526A40D
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 13:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgIOLWm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 07:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbgIOLSI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 07:18:08 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F6AC061224
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2020 04:07:30 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id n61so2785241ota.10
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2020 04:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wAqBxwSqHBPcdUvSTQKCijq+CRd5S/6aTYUwocFvz7g=;
        b=Ab3CclpcmjliQcUxf05Du8gVcg1tOOkwjfN7S7+mMKqY+QobElboTlKKG/K3TtoDAg
         jN9ksqtTvV5K0CkYWOyTD6EOOpJPBKcoEScWZBBaDrPlA0EBfsG9cf/MIcMhL1dmKZ7I
         /Vtos2xPEWUgcsEiyEAAfW1BnOmbyKfP4VBbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wAqBxwSqHBPcdUvSTQKCijq+CRd5S/6aTYUwocFvz7g=;
        b=Bjvv9cEwqN1prHt0zz1i/fedBMh72TnLVBdQnk7G56llEJyJz9HwmQnzKBNalx5YHg
         3PUc4/QZ5tzkYpbcZUj3nwCeRymqfxk2FCn/B3NgxHznVt8RW6+mIxOmeKDuQhTf8I+u
         KTLKYgkPC0z3M23HAxG6ph4fJ0+AJGqkxoKD1PFIyoZvudzsLPoxZutKYOLHwSJmbItL
         XdY912Eq8k2HxtPylP7siiQ+64A8JUlIB3ojxOvDfBHvkEIpYkOYJuIx1kP4ugNUjv+E
         jb0eg8dKBxApAuL7nMphrqv3GskzYAWPZk0ACTBUU3GOwQWDbOSIajnI+gaerh8Q4kV3
         IBTQ==
X-Gm-Message-State: AOAM532l0txREhUdJkLOvoQ7Lx8YGWks9xjjxedVzDZo/mnrlt/b/B8p
        Pwhmr3jvLjxdV25bAx9p5fqX4m8OUFFP8C88qITRSQ==
X-Google-Smtp-Source: ABdhPJy2dt3RJ1FG4/6bhDA1qzn4xmAgfk+y6FmsSUEi6ZJD7I1IcHsBaS6ztwX2Dy4bot9PsL6PWq1L3saj3QmAlOM=
X-Received: by 2002:a05:6830:14d9:: with SMTP id t25mr13128038otq.188.1600168050256;
 Tue, 15 Sep 2020 04:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <20200914132920.59183-2-christian.koenig@amd.com> <CAKMK7uHnZgCBUBQ-5D7gCj1v3Z4wKkeO91tefAoJE1B49JFtww@mail.gmail.com>
 <92b77d29-ae9b-b9cd-4e03-f193aa386cae@gmail.com>
In-Reply-To: <92b77d29-ae9b-b9cd-4e03-f193aa386cae@gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 15 Sep 2020 13:07:18 +0200
Message-ID: <CAKMK7uHDuzzh_w=7w7m3EoHyx+3HOVawoj2QbJL+9F1+1LULbw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/shmem-helpers: revert "Redirect mmap for imported dma-buf"
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Linux MM <linux-mm@kvack.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 15, 2020 at 1:03 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 15.09.20 um 12:39 schrieb Daniel Vetter:
> > On Mon, Sep 14, 2020 at 3:29 PM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> This reverts commit 26d3ac3cb04d171a861952e89324e347598a347f.
> >>
> >> We need to figure out if dma_buf_mmap() is valid or not first.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > The trouble is that doing dma-buf mmap by looking at the struct pages
> > behind the sg list and just inserting those into userspace doesn't
> > really work any better. You still won't get the unmap_mapping_range
> > and hence pte shoot-down. So maybe dma_buf_mmap forwarding doesn't
> > work, but this doesn't make it any better.
>
> Good point. Question is what should we do? Return -EPERM?

IIrc there's userspace which expects this to work, but I think it's
also only trying to do this with simpler drivers that don't need
unmap_mapping_range to work correctly. Or it's simply that no one ever
reported the bugs. It's a bit a mess :-/
-Daniel

>
> >
> > Also commit message should probably explain a bit the context here,
> > not a lot of people have been in our private discussion on this.
>
> Well, that's certain true.
>
> Christian.
>
> > -Daniel
> >
> >> ---
> >>   drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ---
> >>   1 file changed, 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/=
drm_gem_shmem_helper.c
> >> index 0a952f27c184..cd727343f72b 100644
> >> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> @@ -594,9 +594,6 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj,=
 struct vm_area_struct *vma)
> >>          /* Remove the fake offset */
> >>          vma->vm_pgoff -=3D drm_vma_node_start(&obj->vma_node);
> >>
> >> -       if (obj->import_attach)
> >> -               return dma_buf_mmap(obj->dma_buf, vma, 0);
> >> -
> >>          shmem =3D to_drm_gem_shmem_obj(obj);
> >>
> >>          ret =3D drm_gem_shmem_get_pages(shmem);
> >> --
> >> 2.17.1
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
