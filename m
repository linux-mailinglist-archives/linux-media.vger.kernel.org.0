Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E802A0789
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 15:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgJ3OLi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 10:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbgJ3OLd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 10:11:33 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D92FC0613D4
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 07:11:33 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id l16so6835705eds.3
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fGLh8FE7n+kGnPiOSCfCu+B491Brb7ePqBRZY6cItBg=;
        b=LH6iU5G+qAZ4T7sqXNGE44q/WiF+g2smHT8tK2NZZq846wCXnKZVs/i0NAbqwfc9xk
         21Yj3MNkwi0ukryfrHB9hVgWhM+cdTTWfsDLp+g3D7Iig02N7iwYOeg6SfA5q4dylm2H
         zlOSbk28N2b27zmw/TwjqgMUPI5sLxmAXsXzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fGLh8FE7n+kGnPiOSCfCu+B491Brb7ePqBRZY6cItBg=;
        b=s/173V4D3TU+0QItzGx9Gd7wycGKPc6phNFK8Wg6PjZ5enU2iaK8SYcWtOraBZ6tq7
         tjLgrlTR/fbfCvgEkLCR/DKKmWQThWgt4J/kB0M0FIUk3kYL65cAWiZ7c4UtbkuKpu/d
         4OvciwsNrHW765hVFy8krH4/bfXsGGx1RgpPXoDYgO5InYcI4C9rJBEyV0rX4bHPPhQ4
         Wmjy84DT3AWlZARRPex+2Cw565UmaL6++yP7ikwANb8WL3X7Y6srY9yoxBsoYK4QY/hq
         j8KddzUsR8FabxK3SH2XrI/izs00OTBo4urdpL4c5JWbymu9uPf+NxgZldy2GC6AwZY0
         iaOQ==
X-Gm-Message-State: AOAM530MOWyra5sGxrJqYAvvw2OYeqal6DM3ZqCimJcPynTjZJEwCmba
        O8jCBdFBkPsOKwNYGxvCAmllGwqTOkoggQ==
X-Google-Smtp-Source: ABdhPJx3GlU5rHpAvEy+hgcEVds0jelTU2csqoeCcupHiV2lF9H59BzNnQDubxnNgpPLMpdzdeH75w==
X-Received: by 2002:a50:9548:: with SMTP id v8mr2506756eda.115.1604067091707;
        Fri, 30 Oct 2020 07:11:31 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id j22sm3128487edp.77.2020.10.30.07.11.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 07:11:26 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id b8so6661672wrn.0
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 07:11:25 -0700 (PDT)
X-Received: by 2002:adf:e892:: with SMTP id d18mr3615109wrm.103.1604067085454;
 Fri, 30 Oct 2020 07:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch> <20201030100815.2269-6-daniel.vetter@ffwll.ch>
In-Reply-To: <20201030100815.2269-6-daniel.vetter@ffwll.ch>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 30 Oct 2020 15:11:14 +0100
X-Gmail-Original-Message-ID: <CAAFQd5ANOAzVf+tC1iYKXeY0ALahtYrG7xtKHXHmvv1xh7si3g@mail.gmail.com>
Message-ID: <CAAFQd5ANOAzVf+tC1iYKXeY0ALahtYrG7xtKHXHmvv1xh7si3g@mail.gmail.com>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm <kvm@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 30, 2020 at 11:08 AM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:
>
> This is used by media/videbuf2 for persistent dma mappings, not just
> for a single dma operation and then freed again, so needs
> FOLL_LONGTERM.
>
> Unfortunately current pup_locked doesn't support FOLL_LONGTERM due to
> locking issues. Rework the code to pull the pup path out from the
> mmap_sem critical section as suggested by Jason.
>
> By relying entirely on the vma checks in pin_user_pages and follow_pfn
> (for vm_flags and vma_is_fsdax) we can also streamline the code a lot.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Pawel Osciak <pawel@osciak.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> --
> v2: Streamline the code and further simplify the loop checks (Jason)
>
> v5: Review from Tomasz:
> - fix page counting for the follow_pfn case by resetting ret
> - drop gup_flags paramater, now unused
> ---
>  .../media/common/videobuf2/videobuf2-memops.c |  3 +-
>  include/linux/mm.h                            |  2 +-
>  mm/frame_vector.c                             | 53 ++++++-------------
>  3 files changed, 19 insertions(+), 39 deletions(-)
>

Thanks, looks good to me now.

Acked-by: Tomasz Figa <tfiga@chromium.org>

From reading the code, this is quite unlikely to introduce any
behavior changes, but just to be safe, did you have a chance to test
this with some V4L2 driver?

Best regards,
Tomasz

> diff --git a/drivers/media/common/videobuf2/videobuf2-memops.c b/drivers/=
media/common/videobuf2/videobuf2-memops.c
> index 6e9e05153f4e..9dd6c27162f4 100644
> --- a/drivers/media/common/videobuf2/videobuf2-memops.c
> +++ b/drivers/media/common/videobuf2/videobuf2-memops.c
> @@ -40,7 +40,6 @@ struct frame_vector *vb2_create_framevec(unsigned long =
start,
>         unsigned long first, last;
>         unsigned long nr;
>         struct frame_vector *vec;
> -       unsigned int flags =3D FOLL_FORCE | FOLL_WRITE;
>
>         first =3D start >> PAGE_SHIFT;
>         last =3D (start + length - 1) >> PAGE_SHIFT;
> @@ -48,7 +47,7 @@ struct frame_vector *vb2_create_framevec(unsigned long =
start,
>         vec =3D frame_vector_create(nr);
>         if (!vec)
>                 return ERR_PTR(-ENOMEM);
> -       ret =3D get_vaddr_frames(start & PAGE_MASK, nr, flags, vec);
> +       ret =3D get_vaddr_frames(start & PAGE_MASK, nr, vec);
>         if (ret < 0)
>                 goto out_destroy;
>         /* We accept only complete set of PFNs */
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ef360fe70aaf..d6b8e30dce2e 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1765,7 +1765,7 @@ struct frame_vector {
>  struct frame_vector *frame_vector_create(unsigned int nr_frames);
>  void frame_vector_destroy(struct frame_vector *vec);
>  int get_vaddr_frames(unsigned long start, unsigned int nr_pfns,
> -                    unsigned int gup_flags, struct frame_vector *vec);
> +                    struct frame_vector *vec);
>  void put_vaddr_frames(struct frame_vector *vec);
>  int frame_vector_to_pages(struct frame_vector *vec);
>  void frame_vector_to_pfns(struct frame_vector *vec);
> diff --git a/mm/frame_vector.c b/mm/frame_vector.c
> index 10f82d5643b6..f8c34b895c76 100644
> --- a/mm/frame_vector.c
> +++ b/mm/frame_vector.c
> @@ -32,13 +32,12 @@
>   * This function takes care of grabbing mmap_lock as necessary.
>   */
>  int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
> -                    unsigned int gup_flags, struct frame_vector *vec)
> +                    struct frame_vector *vec)
>  {
>         struct mm_struct *mm =3D current->mm;
>         struct vm_area_struct *vma;
>         int ret =3D 0;
>         int err;
> -       int locked;
>
>         if (nr_frames =3D=3D 0)
>                 return 0;
> @@ -48,40 +47,26 @@ int get_vaddr_frames(unsigned long start, unsigned in=
t nr_frames,
>
>         start =3D untagged_addr(start);
>
> -       mmap_read_lock(mm);
> -       locked =3D 1;
> -       vma =3D find_vma_intersection(mm, start, start + 1);
> -       if (!vma) {
> -               ret =3D -EFAULT;
> -               goto out;
> -       }
> -
> -       /*
> -        * While get_vaddr_frames() could be used for transient (kernel
> -        * controlled lifetime) pinning of memory pages all current
> -        * users establish long term (userspace controlled lifetime)
> -        * page pinning. Treat get_vaddr_frames() like
> -        * get_user_pages_longterm() and disallow it for filesystem-dax
> -        * mappings.
> -        */
> -       if (vma_is_fsdax(vma)) {
> -               ret =3D -EOPNOTSUPP;
> -               goto out;
> -       }
> -
> -       if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> +       ret =3D pin_user_pages_fast(start, nr_frames,
> +                                 FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM=
,
> +                                 (struct page **)(vec->ptrs));
> +       if (ret > 0) {
>                 vec->got_ref =3D true;
>                 vec->is_pfns =3D false;
> -               ret =3D pin_user_pages_locked(start, nr_frames,
> -                       gup_flags, (struct page **)(vec->ptrs), &locked);
> -               goto out;
> +               goto out_unlocked;
>         }
>
> +       mmap_read_lock(mm);
>         vec->got_ref =3D false;
>         vec->is_pfns =3D true;
> +       ret =3D 0;
>         do {
>                 unsigned long *nums =3D frame_vector_pfns(vec);
>
> +               vma =3D find_vma_intersection(mm, start, start + 1);
> +               if (!vma)
> +                       break;
> +
>                 while (ret < nr_frames && start + PAGE_SIZE <=3D vma->vm_=
end) {
>                         err =3D follow_pfn(vma, start, &nums[ret]);
>                         if (err) {
> @@ -92,17 +77,13 @@ int get_vaddr_frames(unsigned long start, unsigned in=
t nr_frames,
>                         start +=3D PAGE_SIZE;
>                         ret++;
>                 }
> -               /*
> -                * We stop if we have enough pages or if VMA doesn't comp=
letely
> -                * cover the tail page.
> -                */
> -               if (ret >=3D nr_frames || start < vma->vm_end)
> +               /* Bail out if VMA doesn't completely cover the tail page=
. */
> +               if (start < vma->vm_end)
>                         break;
> -               vma =3D find_vma_intersection(mm, start, start + 1);
> -       } while (vma && vma->vm_flags & (VM_IO | VM_PFNMAP));
> +       } while (ret < nr_frames);
>  out:
> -       if (locked)
> -               mmap_read_unlock(mm);
> +       mmap_read_unlock(mm);
> +out_unlocked:
>         if (!ret)
>                 ret =3D -EFAULT;
>         if (ret > 0)
> --
> 2.28.0
>
