Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC57201C95
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 22:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389705AbgFSUnf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 16:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389088AbgFSUnc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 16:43:32 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E7B4C0613EF
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 13:43:32 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id k4so9616079oik.2
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 13:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9/vStao3ifGYQOLbJNj3Rxj/tTeqgov6BzJ8gWfbJ1A=;
        b=AgcjpEksjSk/meUmImx4Ly4hcLbaJQ2LjS9UizwkCrgrYmH3wmTs84drjSSTYKERf+
         PsamWUOymvUvCKzjYP33oBhpNt2/D9LrLHY4oCRARGJ7HLSJ+/CuVYOstOjO2DfKtzn7
         1VYp/JHpuvG+5c+ka+eZ3g4RtJpYayImc4a7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9/vStao3ifGYQOLbJNj3Rxj/tTeqgov6BzJ8gWfbJ1A=;
        b=EvaBzplWzNsE6s3MzRytG4el84M1vDx3SOxE6BszYg+u31wxbmn+BRr7uLRkQ7G8GV
         oKyinnQIa4SBH1roe/BLw0jeVzoqlCcsMs4YqyoaCGA8JCVwwF7iKSQUAjy5S9lpIzce
         k3bmrA+ASDRok5jbJM9RxP4e+/xZPw/nUbS7vwCNey6T7i9SFqTI2WInMGLl9/iLy6VD
         Fy2oJ5x6tyaw6zQbS3E2r1CPUqygcRmApW7A8c9KsuyloAMhugbeHV3cUE3D3nDx1tGP
         I/bE5vQ3q6CfEWmhHbTRwibTH876oFBwnAdRA++aT78OSzwTPJTGwbntSPhvqvDW4gC/
         5zIg==
X-Gm-Message-State: AOAM530O7m786UnL6u8gHMUry/11u4wQDAgsex9mv8oAkJW1qFNl3eVu
        +2CcR19lRlUz5jbaerxwzfVZLlZlLPdYJuWiv67Srg==
X-Google-Smtp-Source: ABdhPJx1lZPqFNOPgShq1MnrWX/3UtpuEHFUA1gXpZi9tZWjkxiopQ1aXB5WqGz98ZH8/8j9ccq3QYl/2AFHKXO85qo=
X-Received: by 2002:aca:aaca:: with SMTP id t193mr4536847oie.14.1592599411245;
 Fri, 19 Jun 2020 13:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200618150051.GS20149@phenom.ffwll.local> <20200618172338.GM6578@ziepe.ca>
 <CAKMK7uEbqTu4q-amkLXyd1i8KNtLaoO2ZFoGqYiG6D0m0FKpOg@mail.gmail.com>
 <20200619113934.GN6578@ziepe.ca> <CAKMK7uE-kWA==Cko5uenMrcnopEjq42HxoDTDywzBAbHqsN13g@mail.gmail.com>
 <20200619151551.GP6578@ziepe.ca> <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
 <20200619172308.GQ6578@ziepe.ca> <20200619180935.GA10009@redhat.com>
 <20200619181849.GR6578@ziepe.ca> <20200619201011.GB13117@redhat.com>
In-Reply-To: <20200619201011.GB13117@redhat.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 19 Jun 2020 22:43:20 +0200
Message-ID: <CAKMK7uFZgQH3bP4iC9MPArpngeSHESK62KFEeJvYyV9NSJ_GRw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
To:     Jerome Glisse <jglisse@redhat.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= 
        <thomas_os@shipmail.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Thomas Hellstrom <thomas.hellstrom@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 19, 2020 at 10:10 PM Jerome Glisse <jglisse@redhat.com> wrote:
>
> On Fri, Jun 19, 2020 at 03:18:49PM -0300, Jason Gunthorpe wrote:
> > On Fri, Jun 19, 2020 at 02:09:35PM -0400, Jerome Glisse wrote:
> > > On Fri, Jun 19, 2020 at 02:23:08PM -0300, Jason Gunthorpe wrote:
> > > > On Fri, Jun 19, 2020 at 06:19:41PM +0200, Daniel Vetter wrote:
> > > >
> > > > > The madness is only that device B's mmu notifier might need to wa=
it
> > > > > for fence_B so that the dma operation finishes. Which in turn has=
 to
> > > > > wait for device A to finish first.
> > > >
> > > > So, it sound, fundamentally you've got this graph of operations acr=
oss
> > > > an unknown set of drivers and the kernel cannot insert itself in
> > > > dma_fence hand offs to re-validate any of the buffers involved?
> > > > Buffers which by definition cannot be touched by the hardware yet.
> > > >
> > > > That really is a pretty horrible place to end up..
> > > >
> > > > Pinning really is right answer for this kind of work flow. I think
> > > > converting pinning to notifers should not be done unless notifier
> > > > invalidation is relatively bounded.
> > > >
> > > > I know people like notifiers because they give a bit nicer performa=
nce
> > > > in some happy cases, but this cripples all the bad cases..
> > > >
> > > > If pinning doesn't work for some reason maybe we should address tha=
t?
> > >
> > > Note that the dma fence is only true for user ptr buffer which predat=
e
> > > any HMM work and thus were using mmu notifier already. You need the
> > > mmu notifier there because of fork and other corner cases.
> >
> > I wonder if we should try to fix the fork case more directly - RDMA
> > has this same problem and added MADV_DONTFORK a long time ago as a
> > hacky way to deal with it.
> >
> > Some crazy page pin that resolved COW in a way that always kept the
> > physical memory with the mm that initiated the pin?
>
> Just no way to deal with it easily, i thought about forcing the
> anon_vma (page->mapping for anonymous page) to the anon_vma that
> belongs to the vma against which the GUP was done but it would
> break things if page is already in other branch of a fork tree.
> Also this forbid fast GUP.
>
> Quite frankly the fork was not the main motivating factor. GPU
> can pin potentialy GBytes of memory thus we wanted to be able
> to release it but since Michal changes to reclaim code this is
> no longer effective.

What where how? My patch to annote reclaim paths with mmu notifier
possibility just landed in -mm, so if direct reclaim can't reclaim mmu
notifier'ed stuff anymore we need to know.

Also this would resolve the entire pain we're discussing in this
thread about dma_fence_wait deadlocking against anything that's not
GFP_ATOMIC ...
-Daniel

>
> User buffer should never end up in those weird corner case, iirc
> the first usage was for xorg exa texture upload, then generalize
> to texture upload in mesa and latter on to more upload cases
> (vertices, ...). At least this is what i remember today. So in
> those cases we do not expect fork, splice, mremap, mprotect, ...
>
> Maybe we can audit how user ptr buffer are use today and see if
> we can define a usage pattern that would allow to cut corner in
> kernel. For instance we could use mmu notifier just to block CPU
> pte update while we do GUP and thus never wait on dma fence.
>
> Then GPU driver just keep the GUP pin around until they are done
> with the page. They can also use the mmu notifier to keep a flag
> so that the driver know if it needs to redo a GUP ie:
>
> The notifier path:
>    GPU_mmu_notifier_start_callback(range)
>         gpu_lock_cpu_pagetable(range)
>         for_each_bo_in(bo, range) {
>             bo->need_gup =3D true;
>         }
>         gpu_unlock_cpu_pagetable(range)
>
>    GPU_validate_buffer_pages(bo)
>         if (!bo->need_gup)
>             return;
>         put_pages(bo->pages);
>         range =3D bo_vaddr_range(bo)
>         gpu_lock_cpu_pagetable(range)
>         GUP(bo->pages, range)
>         gpu_unlock_cpu_pagetable(range)
>
>
> Depending on how user_ptr are use today this could work.
>
>
> > (isn't this broken for O_DIRECT as well anyhow?)
>
> Yes it can in theory, if you have an application that does O_DIRECT
> and fork concurrently (ie O_DIRECT in one thread and fork in another).
> Note that O_DIRECT after fork is fine, it is an issue only if GUP_fast
> was able to lookup a page with write permission before fork had the
> chance to update it to read only for COW.
>
> But doing O_DIRECT (or anything that use GUP fast) in one thread and
> fork in another is inherently broken ie there is no way to fix it.
>
> See 17839856fd588f4ab6b789f482ed3ffd7c403e1f
>
> >
> > How does mmu_notifiers help the fork case anyhow? Block fork from
> > progressing?
>
> It enforce ordering between fork and GUP, if fork is first it blocks
> GUP and if forks is last then fork waits on GUP and then user buffer
> get invalidated.
>
> >
> > > I probably need to warn AMD folks again that using HMM means that you
> > > must be able to update the GPU page table asynchronously without
> > > fence wait.
> >
> > It is kind of unrelated to HMM, it just shouldn't be using mmu
> > notifiers to replace page pinning..
>
> Well my POV is that if you abide by rules HMM defined then you do
> not need to pin pages. The rule is asynchronous device page table
> update.
>
> Pinning pages is problematic it blocks many core mm features and
> it is just bad all around. Also it is inherently broken in front
> of fork/mremap/splice/...
>
> Cheers,
> J=C3=A9r=C3=B4me
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
