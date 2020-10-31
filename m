Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A35532A184B
	for <lists+linux-media@lfdr.de>; Sat, 31 Oct 2020 15:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbgJaOpz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Oct 2020 10:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727355AbgJaOpz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Oct 2020 10:45:55 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E9AC061A04
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2020 07:45:53 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id x203so9775054oia.10
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2020 07:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JLPsjE+MlwvsxgdGKdmSa81kAiwbx7LbyLf73CS0dDE=;
        b=IwlsFIoKECoEUZj/Jg06paZwt/CdCeCczvaQYk8enrF7HQcd2nvT6ued/hjaBptstg
         cHl/tkfB13X4twj9ntZBMf2jeKj5j0CTJJlaQbR7IddN6hwWOLdY0xSTZRHvRA+oN0ME
         is9R26h/BLxrmLX/3TuHEGh3RbI98xXctp27w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JLPsjE+MlwvsxgdGKdmSa81kAiwbx7LbyLf73CS0dDE=;
        b=Qj4D1WQ3UGSIvZh6OQkA6hS56psL1wlNG9AC21BJQ4z5Jw0vHdDvQdIGpTzAFJoGa8
         cO9BibUAQC5mMIyhagpAfDRZK8Ef1Y7iEWY0PnOG3YHw7Ojb9oSgd7p4hQlK3e1s2r/p
         YLUPN1G4KG4oNGX7l/aVxF5mFl58KwziyUuJmST8DVGsq06SyTpDlsrLvOr6z+sjMoOH
         8C1mGK9B3LOj2gsWTXAjmmWrd48UBD5X+laQdT2e1P3dCb+zSO2B0IFca9kHntz0oI/J
         NyP0iKu/EgTDVKxfIslZUgdIvhxW8Cy5NzHiEVwQZPV9xivLnQOb54VBJCi/mZVLDBd7
         AbMA==
X-Gm-Message-State: AOAM531EBn97BYL1FDZ+Uen3dVvLVb2x457FmqsYyPUR4H7lc46tSsu0
        EG3jMgjMJ8EuyoE/GsWqYrSWhKnnkizZ1vOqeskkmw==
X-Google-Smtp-Source: ABdhPJy/ew0e2L6OGzHK912IFQV/SRRltGCVY26MHGICOYWrwLV9hceCTs5CTofxQaf7JxYI0Pzocj5wATlZCgl45/M=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr4975012oia.14.1604155552761;
 Sat, 31 Oct 2020 07:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch> <20201030100815.2269-6-daniel.vetter@ffwll.ch>
 <446b2d5b-a1a1-a408-f884-f17a04b72c18@nvidia.com>
In-Reply-To: <446b2d5b-a1a1-a408-f884-f17a04b72c18@nvidia.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Sat, 31 Oct 2020 15:45:41 +0100
Message-ID: <CAKMK7uGDW2f0oOvwgryCHxQFHyh3Tsk6ENsMGmtZ-EnH57tMSA@mail.gmail.com>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 31, 2020 at 3:55 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 10/30/20 3:08 AM, Daniel Vetter wrote:
> > This is used by media/videbuf2 for persistent dma mappings, not just
> > for a single dma operation and then freed again, so needs
> > FOLL_LONGTERM.
> >
> > Unfortunately current pup_locked doesn't support FOLL_LONGTERM due to
> > locking issues. Rework the code to pull the pup path out from the
> > mmap_sem critical section as suggested by Jason.
> >
> > By relying entirely on the vma checks in pin_user_pages and follow_pfn
>
> There are vma checks in pin_user_pages(), but this patch changes things
> to call pin_user_pages_fast(). And that does not have the vma checks.
> More below about this:
>
> > (for vm_flags and vma_is_fsdax) we can also streamline the code a lot.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Pawel Osciak <pawel@osciak.com>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Cc: Tomasz Figa <tfiga@chromium.org>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: linux-mm@kvack.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > --
> > v2: Streamline the code and further simplify the loop checks (Jason)
> >
> > v5: Review from Tomasz:
> > - fix page counting for the follow_pfn case by resetting ret
> > - drop gup_flags paramater, now unused
> > ---
> >   .../media/common/videobuf2/videobuf2-memops.c |  3 +-
> >   include/linux/mm.h                            |  2 +-
> >   mm/frame_vector.c                             | 53 ++++++------------=
-
> >   3 files changed, 19 insertions(+), 39 deletions(-)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-memops.c b/driver=
s/media/common/videobuf2/videobuf2-memops.c
> > index 6e9e05153f4e..9dd6c27162f4 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-memops.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-memops.c
> > @@ -40,7 +40,6 @@ struct frame_vector *vb2_create_framevec(unsigned lon=
g start,
> >       unsigned long first, last;
> >       unsigned long nr;
> >       struct frame_vector *vec;
> > -     unsigned int flags =3D FOLL_FORCE | FOLL_WRITE;
> >
> >       first =3D start >> PAGE_SHIFT;
> >       last =3D (start + length - 1) >> PAGE_SHIFT;
> > @@ -48,7 +47,7 @@ struct frame_vector *vb2_create_framevec(unsigned lon=
g start,
> >       vec =3D frame_vector_create(nr);
> >       if (!vec)
> >               return ERR_PTR(-ENOMEM);
> > -     ret =3D get_vaddr_frames(start & PAGE_MASK, nr, flags, vec);
> > +     ret =3D get_vaddr_frames(start & PAGE_MASK, nr, vec);
> >       if (ret < 0)
> >               goto out_destroy;
> >       /* We accept only complete set of PFNs */
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index ef360fe70aaf..d6b8e30dce2e 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -1765,7 +1765,7 @@ struct frame_vector {
> >   struct frame_vector *frame_vector_create(unsigned int nr_frames);
> >   void frame_vector_destroy(struct frame_vector *vec);
> >   int get_vaddr_frames(unsigned long start, unsigned int nr_pfns,
> > -                  unsigned int gup_flags, struct frame_vector *vec);
> > +                  struct frame_vector *vec);
> >   void put_vaddr_frames(struct frame_vector *vec);
> >   int frame_vector_to_pages(struct frame_vector *vec);
> >   void frame_vector_to_pfns(struct frame_vector *vec);
> > diff --git a/mm/frame_vector.c b/mm/frame_vector.c
> > index 10f82d5643b6..f8c34b895c76 100644
> > --- a/mm/frame_vector.c
> > +++ b/mm/frame_vector.c
> > @@ -32,13 +32,12 @@
> >    * This function takes care of grabbing mmap_lock as necessary.
> >    */
> >   int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
> > -                  unsigned int gup_flags, struct frame_vector *vec)
> > +                  struct frame_vector *vec)
> >   {
> >       struct mm_struct *mm =3D current->mm;
> >       struct vm_area_struct *vma;
> >       int ret =3D 0;
> >       int err;
> > -     int locked;
> >
> >       if (nr_frames =3D=3D 0)
> >               return 0;
> > @@ -48,40 +47,26 @@ int get_vaddr_frames(unsigned long start, unsigned =
int nr_frames,
> >
> >       start =3D untagged_addr(start);
> >
> > -     mmap_read_lock(mm);
> > -     locked =3D 1;
> > -     vma =3D find_vma_intersection(mm, start, start + 1);
> > -     if (!vma) {
> > -             ret =3D -EFAULT;
> > -             goto out;
> > -     }
> > -
> > -     /*
> > -      * While get_vaddr_frames() could be used for transient (kernel
> > -      * controlled lifetime) pinning of memory pages all current
> > -      * users establish long term (userspace controlled lifetime)
> > -      * page pinning. Treat get_vaddr_frames() like
> > -      * get_user_pages_longterm() and disallow it for filesystem-dax
> > -      * mappings.
> > -      */
> > -     if (vma_is_fsdax(vma)) {
> > -             ret =3D -EOPNOTSUPP;
> > -             goto out;
> > -     }
> > -
> > -     if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
>
> By removing this check from this location, and changing from
> pin_user_pages_locked() to pin_user_pages_fast(), I *think* we end up
> losing the check entirely. Is that intended? If so it could use a comment
> somewhere to explain why.

Yeah this wasn't intentional. I think I needed to drop the _locked
version to prep for FOLL_LONGTERM, and figured _fast is always better.
But I didn't realize that _fast doesn't have the vma checks, gup.c got
me a bit confused.

I'll remedy this in all the patches where this applies (because a
VM_IO | VM_PFNMAP can point at struct page backed memory, and that
exact use-case is what we want to stop with the unsafe_follow_pfn work
since it wreaks things like cma or security).

Aside: I do wonder whether the lack for that check isn't a problem.
VM_IO | VM_PFNMAP generally means driver managed, which means the
driver isn't going to consult the page pin count or anything like that
(at least not necessarily) when revoking or moving that memory, since
we're assuming it's totally under driver control. So if pup_fast can
get into such a mapping, we might have a problem.
-Daniel

> thanks,
> --
> John Hubbard
> NVIDIA
>
> > +     ret =3D pin_user_pages_fast(start, nr_frames,
> > +                               FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM=
,
> > +                               (struct page **)(vec->ptrs));
> > +     if (ret > 0) {
> >               vec->got_ref =3D true;
> >               vec->is_pfns =3D false;
> > -             ret =3D pin_user_pages_locked(start, nr_frames,
> > -                     gup_flags, (struct page **)(vec->ptrs), &locked);
> > -             goto out;
> > +             goto out_unlocked;
> >       }
> >
> > +     mmap_read_lock(mm);
> >       vec->got_ref =3D false;
> >       vec->is_pfns =3D true;
> > +     ret =3D 0;
> >       do {
> >               unsigned long *nums =3D frame_vector_pfns(vec);
> >
> > +             vma =3D find_vma_intersection(mm, start, start + 1);
> > +             if (!vma)
> > +                     break;
> > +
> >               while (ret < nr_frames && start + PAGE_SIZE <=3D vma->vm_=
end) {
> >                       err =3D follow_pfn(vma, start, &nums[ret]);
> >                       if (err) {
> > @@ -92,17 +77,13 @@ int get_vaddr_frames(unsigned long start, unsigned =
int nr_frames,
> >                       start +=3D PAGE_SIZE;
> >                       ret++;
> >               }
> > -             /*
> > -              * We stop if we have enough pages or if VMA doesn't comp=
letely
> > -              * cover the tail page.
> > -              */
> > -             if (ret >=3D nr_frames || start < vma->vm_end)
> > +             /* Bail out if VMA doesn't completely cover the tail page=
. */
> > +             if (start < vma->vm_end)
> >                       break;
> > -             vma =3D find_vma_intersection(mm, start, start + 1);
> > -     } while (vma && vma->vm_flags & (VM_IO | VM_PFNMAP));
> > +     } while (ret < nr_frames);
> >   out:
> > -     if (locked)
> > -             mmap_read_unlock(mm);
> > +     mmap_read_unlock(mm);
> > +out_unlocked:
> >       if (!ret)
> >               ret =3D -EFAULT;
> >       if (ret > 0)
> >
>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
