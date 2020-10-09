Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A6B2891B9
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 21:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388859AbgJITbh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 15:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388676AbgJITbf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 15:31:35 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E68C0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 12:31:33 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id i12so10043191ota.5
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 12:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ySYcyJJ3sOG5YMU4GVRG3lJgkS40H3Co9lykIQ/+sFM=;
        b=hXg/sBmJSAZ0qahG3krkGP++08QEfAEMObPCQZW5DNP0jHoKuyBCogfErWstdU2/EU
         4l6+qOuyilHrRv6mQOMt0oKIaOKSkC6+0fry3akULqNmxrd1f0WP5RaWhgCgr3v3riEu
         U91Cvo/twFXWkhQ9v9MjLxy+AB8Sb+wfsvumA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ySYcyJJ3sOG5YMU4GVRG3lJgkS40H3Co9lykIQ/+sFM=;
        b=QqQYPppA3su5obOrdT251Phe0SA3Llws/7W1iLNUk8SzvxtgWcjM+nrXqIVmVjCqUF
         vZ3hT1zDaNGXvpc+fAOHVUYKsN538WDkYgblAtQFAqaxiCScw4x6SgDK0aMtct2bD/xA
         6Np/D1pG2lmGDDeQvduRHBQYDhMPnYfkwVCu1BgIIBYm+pCOZYvQYgbtoJc3+yt2LIoZ
         2HIi77fVhtvcQ9lvLBajvRnb3uYOjxLjfC5TCbVs/CO/FW+Tx222TfXuNurjeUUz5smh
         EfnQYfHnSytscy0WJ/2+VHwKIoUigBDdcSxgqYNHQv438Aek9lJBb6QVgt95g6YXJKnX
         9ziQ==
X-Gm-Message-State: AOAM530I+ejsMLSe0b/lMgRsgMNswTL7tx2X7X77QqYeuq+49kINUXfJ
        FPlyBxVoOM0YyPRzsrX2qcfQeGJdaot/AHFlG9kFHA==
X-Google-Smtp-Source: ABdhPJyt5F3KZ1qsKCAYucLfuox0J0LV3cC5oyQ21k96htMG1d9Z2x9WEkAwzZmqGd0OEOmrQ583B82fEkZeh8i2caA=
X-Received: by 2002:a05:6830:1647:: with SMTP id h7mr10464001otr.281.1602271892694;
 Fri, 09 Oct 2020 12:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch> <20201009123421.67a80d72@coco.lan>
 <20201009122111.GN5177@ziepe.ca> <20201009143723.45609bfb@coco.lan>
 <20201009124850.GP5177@ziepe.ca> <CAKMK7uF-hrSwzFQkp6qEP88hM1Qg8TMQOunuRHh=f2+D8MaMRg@mail.gmail.com>
 <20201009180145.GB5177@ziepe.ca>
In-Reply-To: <20201009180145.GB5177@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 9 Oct 2020 21:31:21 +0200
Message-ID: <CAKMK7uGnKX-n+4eoa+tStJxsBzuPq1HF5tDjo8ph4PXqFKQ0pg@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 9, 2020 at 8:01 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Oct 09, 2020 at 07:52:05PM +0200, Daniel Vetter wrote:
>
> > > > If this is the case, the proper fix seems to have a GFP_NOT_MOVABLE
> > > > flag that it would be denying the core mm code to set __GFP_MOVABLE.
> > >
> > > We can't tell from the VMA these kinds of details..
> > >
> > > It has to go the other direction, evey mmap that might be used as a
> > > userptr here has to be found and the VMA specially created to allow
> > > its use. At least that is a kernel only change, but will need people
> > > with the HW to do this work.
> >
> > I think the only reasonable way to keep this working is:
> > - add a struct dma_buf *vma_tryget_dma_buf(struct vm_area_struct *vma);
> > - add dma-buf export support to fbdev and v4l
> > - roll this out everywhere we still need it.
>
> It seems to me there is a technical way forward to restore user
> compat, so it is really no different than RDMA/DRM pain we both
> suffered before.
>
> Thus no justification to NAK it. If media wants things to keep working
> they have to do the technical path like you outline above.
>
> > Realistically this just isn't going to happen.
>
> If your series goes ahead it will get solved. Someone will take on the
> huge project to either add DMA buf to the drivers people still care
> about, or do the work above to transparently handle in kernel.
>
> If we allow things to keep working without consequence then nobody
> will do it.
>
> The only reason we did the 4 years of work in RDMA was because Linus
> went in and broke the uABI for a security fix. It was hundreds of
> patches to fix it, so I don't have much sympathy for "it is too hard"
> here.

Oh fully agreeing with you here, I just wanted to lay out that a)
there is a solid plan to fix it and b) it's way too much work for me
to just type it as a part of a "learn me some core mm semantics"
project :-)

I was hoping that we could get away with a special marker for
problematic vma, and filter those out. But after all the digging I've
noticed that on anything remotely modern, there's just nothing left.
Device memory management has become massively more dynamic in the past
10 years.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
