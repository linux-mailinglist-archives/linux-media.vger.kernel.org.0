Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE78E26E042
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 18:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbgIQQGr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 12:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbgIQQDU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 12:03:20 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FA3C06178A
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 08:37:14 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id g10so2290738otq.9
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 08:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZKdwGNTuB7raHchRws1uZpYC5kiBgIgkW7sRbNdes8U=;
        b=ISCJ5Tw66UvgaeWJoGMvoGpBgdi+Pvh73WzxPCKZycvbr4Kw5zYOwmcCQjHLfF+3da
         CYy+53x/nyxrzX0KXw6ljYFdDcKO3M9i08qHW5NqtLtlz6ZhbasQ8xieyUjx4qmoUfzZ
         Zbi23eh19F5Vb4GtV/XcziMcnv0MJy1iuV014=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZKdwGNTuB7raHchRws1uZpYC5kiBgIgkW7sRbNdes8U=;
        b=gF8xeN8jdLV177AGSQkPCLAg/TuzmTerWT4vUbXK5Wmuv5kRytadQKfBXeYu8mmzqG
         g6u/24cvdzOXeGGT43ApG0RjMoyZZKQZZWMeOZwnYxqH/MdSY0o66SWdAxfh6ySwKNIU
         tBgFB+Db7x/kOtrK+Fx0cymz6ujSQ0mtQPYZzMqCZiWWmqJCli+ahnoRg8cwfAvZ1rS+
         yAy+/LN2WPGRn7GMBxlhx5pmawRAvyWjH1LrI0Plctjo6OxdPMAFWAZPXG/0H/vGtmug
         dGQgXoH1hPDWlAyG+b/mO78Be2KkppRYdiKnvvs+Dm4EPqdy5lfFEcaXyJjCiM3pvN7i
         hM5A==
X-Gm-Message-State: AOAM532TYjjjincGKQskr9vmQEIOoTVRCd45aJ5O29a71p0vShUIfDCz
        nW/vDhvKyCh8DevftPDQFIplgW/vJiEkI5TloxChbw==
X-Google-Smtp-Source: ABdhPJzGgOa/Oz2wRUro/hKXS9FrrveYmtnBfxpRy+S4Y7u9DCAavZtFsw1BfFfAu8kbrs7cNgN2/BHLCGrXvdc8BOY=
X-Received: by 2002:a05:6830:14d9:: with SMTP id t25mr21146655otq.188.1600357033519;
 Thu, 17 Sep 2020 08:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com> <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca> <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca> <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
 <20200917143551.GG8409@ziepe.ca> <5b330920-c789-fac7-e9b1-49f3bc1097a8@gmail.com>
 <20200917152456.GH8409@ziepe.ca>
In-Reply-To: <20200917152456.GH8409@ziepe.ca>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 17 Sep 2020 17:37:01 +0200
Message-ID: <CAKMK7uHQLAHXC_aBZZco0e3tbAqnNuW8QdJk=-V-yM2khw5e=Q@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 5:24 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Sep 17, 2020 at 04:54:44PM +0200, Christian K=C3=B6nig wrote:
> > Am 17.09.20 um 16:35 schrieb Jason Gunthorpe:
> > > On Thu, Sep 17, 2020 at 02:24:29PM +0200, Christian K=C3=B6nig wrote:
> > > > Am 17.09.20 um 14:18 schrieb Jason Gunthorpe:
> > > > > On Thu, Sep 17, 2020 at 02:03:48PM +0200, Christian K=C3=B6nig wr=
ote:
> > > > > > Am 17.09.20 um 13:31 schrieb Jason Gunthorpe:
> > > > > > > On Thu, Sep 17, 2020 at 10:09:12AM +0200, Daniel Vetter wrote=
:
> > > > > > >
> > > > > > > > Yeah, but it doesn't work when forwarding from the drm char=
dev to the
> > > > > > > > dma-buf on the importer side, since you'd need a ton of dif=
ferent
> > > > > > > > address spaces. And you still rely on the core code picking=
 up your
> > > > > > > > pgoff mangling, which feels about as risky to me as the vma=
 file
> > > > > > > > pointer wrangling - if it's not consistently applied the re=
verse map
> > > > > > > > is toast and unmap_mapping_range doesn't work correctly for=
 our needs.
> > > > > > > I would think the pgoff has to be translated at the same time=
 the
> > > > > > > vm->vm_file is changed?
> > > > > > >
> > > > > > > The owner of the dma_buf should have one virtual address spac=
e and FD,
> > > > > > > all its dma bufs should be linked to it, and all pgoffs trans=
lated to
> > > > > > > that space.
> > > > > > Yeah, that is exactly like amdgpu is doing it.
> > > > > >
> > > > > > Going to document that somehow when I'm done with TTM cleanups.
> > > > > BTW, while people are looking at this, is there a way to go from =
a VMA
> > > > > to a dma_buf that owns it?
> > > > Only a driver specific one.
> > > Sounds OK
> > >
> > > > For TTM drivers vma->vm_private_data points to the buffer object. N=
ot sure
> > > > about the drivers using GEM only.
> > > Why are drivers in control of the vma? I would think dma_buf should b=
e
> > > the vma owner. IIRC module lifetime correctness essentially hings on
> > > the module owner of the struct file
> >
> > Because the page fault handling is completely driver specific.
> >
> > We could install some DMA-buf vmops, but that would just be another lay=
er of
> > redirection.

Uh geez I didn't know amdgpu was doing that :-/

Since this is on, I guess the inverse of trying to convert a userptr
into a dma-buf is properly rejected?

> If it is already taking a page fault I'm not sure the extra function
> call indirection is going to be a big deal. Having a uniform VMA
> sounds saner than every driver custom rolling something.
>
> When I unwound a similar mess in RDMA all the custom VMA stuff in the
> drivers turned out to be generally buggy, at least.
>
> Is vma->vm_file->private_data universally a dma_buf pointer at least?

Nope. I think if you want this without some large scale rewrite of a
lot of code we'd need a vmops->get_dmabuf or similar. Not pretty, but
would get the job done.

> > > So, user VA -> find_vma -> dma_buf object -> dma_buf operations on th=
e
> > > memory it represents
> >
> > Ah, yes we are already doing this in amdgpu as well. But only for DMA-b=
ufs
> > or more generally buffers which are mmaped by this driver instance.
>
> So there is no general dma_buf service? That is a real bummer

Mostly historical reasons and "it's complicated". One problem is that
dma-buf isn't a powerful enough interface that drivers could use it
for all their native objects, e.g. userptr doesn't pass through it,
and clever cache flushing tricks aren't allowed and a bunch of other
things. So there's some serious roadblocks before we could have a
common allocator (or set of allocators) behind dma-buf.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
