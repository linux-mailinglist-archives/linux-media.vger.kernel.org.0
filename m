Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16BD0282282
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 10:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbgJCIea (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 04:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgJCIea (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Oct 2020 04:34:30 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021BDC0613D0;
        Sat,  3 Oct 2020 01:34:29 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id m7so3688817oie.0;
        Sat, 03 Oct 2020 01:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MwiC6YyUZFKsR0OxsiL5dqCxbE9WNpSWpYmDHi3uZb4=;
        b=s2B2+iZ2DS5bAdFajuwTOZbSgIS0kvKB9eFuoSekzKVBfHj6VYFZcLuQc7DFDKFRCh
         0CzYQdJqdyNjQ4+AaYAD+BcfFg6UYJwfzDTabb5ckgFbh9G5tbV/b3a8Tb8IaHYrXK9e
         YgjqWIYUIHDI9NisNeGL+94NPhn5X4ZU0t2nCZ97bNiFv5fdQPbyjjcVbsXDTTkWWBS0
         dPHhV578Mo38EZCUj2h3XEEx/Q7Onc584hjVNjFimVQJrJaXv4PvgfPdCovKR3YG2ZqV
         bCyL8nTePjit6Q7hnm+hTCotVghPI21Ao+zOAy3SfUT52mcspFE34Tjxj+XjcX2EPsmH
         xyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MwiC6YyUZFKsR0OxsiL5dqCxbE9WNpSWpYmDHi3uZb4=;
        b=R2keyKu6YxFHYjPi/BJzqLIoUQIHwwo6itGsgO2v075eMYVbBDBXRaOMcc9WCHWBVH
         bTF4O4CFHDr1Kpafj6IfBYdiewPft/kR+iBnnKxQSjlRfFwjObUYTEoLJmklk4kiCKTB
         CiFKodyZ04FXs5PFLqvCzZLOQpiVLD+deWuEzS8HjZkBT9kr/iyTbvBZQsKR5pOO4Jdw
         1AWlTzSSpzL1al3/ddtI6izX1pcsOS5UiuF/rODEiDGaQ+LOWCq+VREKfsZqhbAIqG3y
         N6DjVSAj5EcbUPZRYqJglzVVIVr6zh+doNjdihgF0AZGW0ehNesYAIDq9I/5pdt4rZGP
         xkBg==
X-Gm-Message-State: AOAM533oJ36Tmz/SaIBSxhMW6h/uCWmQS0vYViSUfwxJ/YV+z2olpFwh
        XPGmAcK/40PMRZSRrTjS1jvqqliR9Aetk8s14Js=
X-Google-Smtp-Source: ABdhPJwz6YDv9Y3Szh9uKYhc8PvVg5MEbm5BaRdTqy54FwkGbFwyabTSxzLcQSKtnQ+lvxanp34yvku05esUVnF4kVA=
X-Received: by 2002:a05:6808:3bb:: with SMTP id n27mr3285560oie.130.1601714069143;
 Sat, 03 Oct 2020 01:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch> <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com> <20201002233118.GM9916@ziepe.ca>
In-Reply-To: <20201002233118.GM9916@ziepe.ca>
From:   Oded Gabbay <oded.gabbay@gmail.com>
Date:   Sat, 3 Oct 2020 11:34:01 +0300
Message-ID: <CAFCwf10rfYB0GdZEhbaJ0CXT3H0pW0cDz2Zbk5mkqn+9Hyu27Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
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
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 3, 2020 at 2:31 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
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
>
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
>
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
Yes, no problem, I'll do it very soon.
Thanks,
Oded

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
>
> After he three places above should use pin_user_pages_fast(), then
> this whole broken API should be moved into videobuf2-memops.c and a
> big fat "THIS DOESN'T WORK" stuck on it.
>
> videobuf2 should probably use P2P DMA buf for this instead.
>
> Jason
