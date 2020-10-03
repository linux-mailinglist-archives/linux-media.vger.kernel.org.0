Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C7A28233F
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 11:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725813AbgJCJke (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 05:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgJCJke (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Oct 2020 05:40:34 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE08C0613E7
        for <linux-media@vger.kernel.org>; Sat,  3 Oct 2020 02:40:34 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id q21so3832811ota.8
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2020 02:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1IZAi5s6+kebXuKy30pJzhrn3uVlK6wzZN8mckpc+wk=;
        b=GL35iCc9L9oiUfbl52pEr/agxgzU4rhePYOaPgaSpdvfft2Ih+b6BO9rUrVs+VKESO
         h3krhGRnnJ87U/QwQ78vNhd79cC2ElpmbWWAUdHmo0V6B+fgotJnWqTv6/OMfhxSBxEB
         BEX9HN1OATqeSZ+sY31qtk7NPPktObx69lSig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1IZAi5s6+kebXuKy30pJzhrn3uVlK6wzZN8mckpc+wk=;
        b=XhAZB2VOQQIAM5qoUronDfxiDSpm3vkMkfaTDUUJRktWyu7zodf6BTWNjt9vzCBHkI
         LsxYTrpuuvMg+ifvUkbLTz1ZNn1RUZl2UxT6oOEpykmGqLZtNm2/ll4LZHvnov8noIYn
         tytTDJopcjer/7XkfFjy/gJ5S4n55PWkUkBNR/aI1HKFmDH+6g7fIpitx4jgPAO+Tp1m
         vRoRCu3zNaYDF7oNUhZ+tUHiweNgcBvKy2zqnRxchEHxPY1bcGdCcpF5UwHHnBdyL4jr
         EHtt3r9U3E4BYW2h5AtZSmf+0DqtDV2c/phgImLgr/M1/w50ss+IKOtyIG125RCoS/Na
         ms7w==
X-Gm-Message-State: AOAM532FTYWsLMij11rl0lEWxKR5b9qWObbMHAZu5lPMjf7Lltlg5Zm7
        Chw1KYg4DXRpVF3JZLD9SGLF6nYK+FxRLNFolfAOVw==
X-Google-Smtp-Source: ABdhPJyQ8w5gNa/gr9PqCnmPBfR+rJ2mhoqpvlr+kvRInvo5nifYfALu47116jzszjdcGvv+jDhvijH5X5aOBGv6DWE=
X-Received: by 2002:a05:6830:11d8:: with SMTP id v24mr504776otq.188.1601718033491;
 Sat, 03 Oct 2020 02:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch> <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com> <20201002233118.GM9916@ziepe.ca>
In-Reply-To: <20201002233118.GM9916@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Sat, 3 Oct 2020 11:40:22 +0200
Message-ID: <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Oded Gabbay <oded.gabbay@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 3, 2020 at 1:31 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Oct 02, 2020 at 08:16:48PM +0200, Daniel Vetter wrote:
> > On Fri, Oct 2, 2020 at 8:06 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > On Fri, Oct 02, 2020 at 07:53:03PM +0200, Daniel Vetter wrote:
> > > > For $reasons I've stumbled over this code and I'm not sure the chan=
ge
> > > > to the new gup functions in 55a650c35fea ("mm/gup: frame_vector:
> > > > convert get_user_pages() --> pin_user_pages()") was entirely correc=
t.
> > > >
> > > > This here is used for long term buffers (not just quick I/O) like
> > > > RDMA, and John notes this in his patch. But I thought the rule for
> > > > these is that they need to add FOLL_LONGTERM, which John's patch
> > > > didn't do.
> > > >
> > > > There is already a dax specific check (added in b7f0554a56f2 ("mm:
> > > > fail get_vaddr_frames() for filesystem-dax mappings")), so this see=
ms
> > > > like the prudent thing to do.
> > > >
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > Cc: John Hubbard <jhubbard@nvidia.com>
> > > > Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> > > > Cc: Jan Kara <jack@suse.cz>
> > > > Cc: Dan Williams <dan.j.williams@intel.com>
> > > > Cc: linux-mm@kvack.org
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > Cc: linux-samsung-soc@vger.kernel.org
> > > > Cc: linux-media@vger.kernel.org
> > > > Hi all,
> > > >
> > > > I stumbled over this and figured typing this patch can't hurt. Real=
ly
> > > > just to maybe learn a few things about how gup/pup is supposed to b=
e
> > > > used (we have a bit of that in drivers/gpu), this here isn't really
> > > > ralated to anything I'm doing.
> > >
> > > FOLL_FORCE is a pretty big clue it should be FOLL_LONGTERM, IMHO
> >
> > Since you're here ... I've noticed that ib sets FOLL_FORCE when the ib
> > verb access mode indicates possible writes. I'm not really clear on
> > why FOLL_WRITE isn't enough any why you need to be able to write
> > through a vma that's write protected currently.
>
> Ah, FOLL_FORCE | FOLL_WRITE means *read* confusingly enough, and the
> only reason you'd want this version for read is if you are doing
> longterm stuff. I wrote about this recently:
>
> https://lore.kernel.org/linux-mm/20200928235739.GU9916@ziepe.ca/

Ah, so essentially it serves as a FOLL_GET_COW_ISSUES_OUT_OF_MY_WAY. I
think documentation for this, and/or just automatically adding the
flag set combination would be really good. But I see John is already
on top of that it seems.

Thanks for the explainer.

> > > Since every driver does this wrong anything that uses this is creatin=
g
> > > terrifying security issues.
> > >
> > > IMHO this whole API should be deleted :(
> >
> > Yeah that part I just tried to conveniently ignore. I guess this dates
> > back to a time when ioremaps where at best fixed, and there wasn't
> > anything like a gpu driver dynamically managing vram around, resulting
> > in random entirely unrelated things possibly being mapped to that set
> > of pfns.
>
> No, it was always wrong. Prior to GPU like cases the lifetime of the
> PTE was tied to the vma and when the vma becomes free the driver can
> move the things in the PTEs to 'free'. Easy to trigger use-after-free
> issues and devices like RDMA have security contexts attached to these
> PTEs so it becomes a serious security bug to do something like this.
>
> > The underlying follow_pfn is also used in other places within
> > drivers/media, so this doesn't seem to be an accident, but actually
> > intentional.
>
> Looking closely, there are very few users, most *seem* pointless, but
> maybe there is a crazy reason?
>
> The sequence
>   get_vaddr_frames();
>   frame_vector_to_pages();
>   sg_alloc_table_from_pages();
>
> Should be written
>   pin_user_pages_fast(FOLL_LONGTERM);
>   sg_alloc_table_from_pages()

Ok, that takes care of exynos and habanalabs. I'll try and wack
together a patch for exynos, that driver is a bit special - first arm
soc driver and we merged it fully well aware that it's full of warts,
just as a show to make it clear that drivers/gpu is also interested in
small gpu drivers ...

> There is some 'special' code in frame_vector_to_pages() that tries to
> get a struct page for things from a VM_IO or VM_PFNMAP...
>
> Oh snap, that is *completely* broken! If the first VMA is IO|PFNMAP
> then get_vaddr_frames() iterates over all VMAs in the range, of any
> kind and extracts the PTEs then blindly references them! This means it
> can be used to use after free normal RAM struct pages!! Gah!
>
> Wow. Okay. That has to go.
>
> So, I *think* we can assume there is no sane cases where
> frame_vector_to_pages() succeeds but pin_user_pages() wasn't called.
>
> That means the users here:
>  - habanalabs:  Hey Oded can you fix this up?
>
>  - gpu/exynos: Daniel can you get someone there to stop using it?
>
>  - media/videobuf via vb2_dma_sg_get_userptr()
>
> Should all be switched to the standard pin_user_pages sequence
> above.
>
> That leaves the only interesting places as vb2_dc_get_userptr() and
> vb2_vmalloc_get_userptr() which both completely fail to follow the
> REQUIRED behavior in the function's comment about checking PTEs. It
> just DMA maps them. Badly broken.
>
> Guessing this hackery is for some embedded P2P DMA transfer?

Yeah, see also the follow_pfn trickery in
videobuf_dma_contig_user_get(), I think this is fully intentional and
userspace abi we can't break :-/

It's mildly better than just sharing phys_addr_t through userspace and
blindly trusting it, which is what all the out-of-tree crap did, but
only mildly.

> After he three places above should use pin_user_pages_fast(), then
> this whole broken API should be moved into videobuf2-memops.c and a
> big fat "THIS DOESN'T WORK" stuck on it.
>
> videobuf2 should probably use P2P DMA buf for this instead.

Yup this should be done with dma_buf instead, and v4l has that. But
old uapi and all that. This is why I said we might need a new
VM_DYNAMIC_PFNMAP or so, to make follow_pfn not resolve this in the
case where the driver manages the underlying iomem range (or whatever
it is) dynamically and moves buffer objects around, like drm drivers
do. But I looked, and we've run out of vma->vm_flags :-(

The other problem is that I also have no real working clue about all
the VM_* flags and what they all mean, and whether drm drivers set the
right ones in all cases (they probably don't, but oh well).
Documentation for this stuff in headers is a bit thin at times.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
