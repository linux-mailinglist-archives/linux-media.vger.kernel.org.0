Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBCD028A39F
	for <lists+linux-media@lfdr.de>; Sun, 11 Oct 2020 01:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390271AbgJJW4w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Oct 2020 18:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731520AbgJJTxu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Oct 2020 15:53:50 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57592C0613AD
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2020 03:54:01 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id t15so11405464otk.0
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2020 03:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kid7J+A/Wd8FKFLCdGKgzMsKnx5ZLnDQ6KOmisXcIDs=;
        b=hetiOf5IFXbFkUtjTPDACRx6O8/TnI/VjswYmbO3VBhYstT6NqT9X2x3eFvybc6gsJ
         EE8+AzEu4BQcajXzp1ZL5WHAnPRAnNJLzMT5F/8QAf7upL/UVuBJpK1bpolUyxhHB3TP
         VM+f548v/CmVhdRxf2iQzc0a1x8DbAaqx/KpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kid7J+A/Wd8FKFLCdGKgzMsKnx5ZLnDQ6KOmisXcIDs=;
        b=udp9iPmqMK++aqWk5r1WyAsFZgGCbFKI63s4eZ5xXM4FnndyixF+VrUacRshVfMLW8
         8da9VWfn5444xpryZSjYu08sNsIfY2jlO4zO+KOd1WE/oyLXOzCdP1bdyBJbiSxEccKR
         CLP96Na44g83amHYM+pWy8tL6Nyry15Z1jby5fQMAfE07uKJOynfOH69xpHGNh79NgAz
         +Ia0yZi6riwu7VMxiOOSntPkekdB1jneOImNR98Oer47iCBWiE+CLuI7C9My7zdK2Or/
         0nqpG/5y/lW5oqtcwZdclF4g6b15LytAIbzc8CcaSRzuV2ifXDwzdrOn1/7ViPm8GrOv
         00+w==
X-Gm-Message-State: AOAM532QZszHysLZaZTFfAp7qSWv6r+2M8zDt3sTbbGedQBrdsIgM9h/
        Kqns2RLQaSKAXNi6A2DRYJwTjI8Hxf85k1VQ/888Nw==
X-Google-Smtp-Source: ABdhPJx+JdEHfdRxaOV1K2wKGEH7PZhb9Ho2MShNadWAXfbctrgpIK/MYT0ZPOky7BdDt7uP2jc1R24HQzAp7RJ+t70=
X-Received: by 2002:a05:6830:8b:: with SMTP id a11mr568933oto.303.1602327240268;
 Sat, 10 Oct 2020 03:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch> <20201009123421.67a80d72@coco.lan>
 <20201009122111.GN5177@ziepe.ca> <20201009143723.45609bfb@coco.lan>
 <20201009124850.GP5177@ziepe.ca> <CAKMK7uF-hrSwzFQkp6qEP88hM1Qg8TMQOunuRHh=f2+D8MaMRg@mail.gmail.com>
 <20201010112122.587f9945@coco.lan>
In-Reply-To: <20201010112122.587f9945@coco.lan>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Sat, 10 Oct 2020 12:53:49 +0200
Message-ID: <CAKMK7uEKP5UMKeQHkTHWYUJkp=mz-Hvh-fJZy1KP3kT2xHpHrg@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
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

Hi Mauro,

You might want to read the patches more carefully, because what you're
demanding is what my patches do. Short summary:

- if STRICT_FOLLOW_PFN is set:
a) normal memory is handled as-is (i.e. your example works) through
the addition of FOLL_LONGTERM. This is the "pin the pages correctly"
approach you're demanding
b) for non-page memory (zerocopy sharing before dma-buf was upstreamed
is the only use-case for this) it is correctly rejected with -EINVAL

- if you do have blobby userspace which requires the zero-copy using
userptr to work, and doesn't have any of the fallbacks implemented
that you describe, this would be a regression. That's why
STRICT_FOLLOW_PFN can be unset. And yes there's a real security issue
in this usage, Marek also confirmed that the removal of the vma copy
code a few years ago essentially broke even the weak assumptions that
made the code work 10+ years ago when it was merged.

so tdlr; Everything you described will keep working even with the new
flag set, and everything you demand must be implemented _is_
implemented in this patch series.

Also please keep in mind that we are _not_ talking about the general
userptr support that was merge ~20 years ago. This patch series here
is _only_ about the zerocpy userptr support merged with 50ac952d2263
("[media] videobuf2-dma-sg: Support io userptr operations on io
memory") in 2013.

Why this hack was merged in 2013 when we merged dma-buf almost 2 years
before that I have no idea about. Imo that patch simply should never
have landed, and instead dma-buf support prioritized.

Cheers, Daniel


On Sat, Oct 10, 2020 at 11:21 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Fri, 9 Oct 2020 19:52:05 +0200
> Daniel Vetter <daniel.vetter@ffwll.ch> escreveu:
>
> > On Fri, Oct 9, 2020 at 2:48 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Fri, Oct 09, 2020 at 02:37:23PM +0200, Mauro Carvalho Chehab wrote:
> > >
> > > > I'm not a mm/ expert, but, from what I understood from Daniel's patch
> > > > description is that this is unsafe *only if*  __GFP_MOVABLE is used.
> > >
> > > No, it is unconditionally unsafe. The CMA movable mappings are
> > > specific VMAs that will have bad issues here, but there are other
> > > types too.
>
> I didn't check the mm dirty details, but I strongly suspect that the mm
> code has a way to prevent moving a mmapped page while it is still in usage.
>
> If not, then the entire movable pages concept sounds broken to me, and
> has to be fixed at mm subsystem.
>
> > >
> > > The only way to do something at a VMA level is to have a list of OK
> > > VMAs, eg because they were creatd via a special mmap helper from the
> > > media subsystem.
>
> I'm not sure if I'm following you on that. The media API can work with
> different ways of sending buffers to userspace:
>
>         - read();
>
>         - using the overlay mode. This interface is deprecated in
>           practice, being replaced by DMABUF. Only a few older hardware
>           supports it, and it depends on an special X11 helper driver
>           for it to work.
>
>         - via DMABUF:
>                 https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dmabuf.html
>
>         - via mmap, using a mmap helper:
>                 https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/mmap.html
>
>         - via mmap, using userspace-provided pointers:
>                 https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/userp.html
>
> The existing open-source programs usually chose one or more of the above
> modes. if the Kernel driver returns -EINVAL when an mmapped streaming I/O
> mode is not supported, userspace has to select a different method.
>
> Most userspace open source programs have fallback support: if one
> mmap I/O method fails, it selects another one, although this is not
> a mandatory requirement. I found (and fixed) a few ones that were
> relying exclusively on userptr support, but I didn't make a
> comprehensive check.
>
> Also there are a number of relevant closed-source apps that we have no
> idea about what methods they use, like Skype, and other similar
> videoconferencing programs. Breaking support for those, specially at
> a time where people are relying on it in order to participate on
> conferences and doing internal meetings is a **very bad** idea.
>
> So, whatever solution is taken, it should not be dumping warning
> messages at the system and tainting the Kernel, but, instead, checking
> if the userspace request is valid or not. If it is invalid, return the
> proper error code via the right V4L2 ioctl, in order to let userspace
> choose a different method. I the request is valid, refcount the pages
> for them to not be moved while they're still in usage.
>
> -
>
> Let me provide some background about how things work at the media
> subsytem. If you want to know more, the userspace-provided memory
> mapped pointers work is described here:
>
>         https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/userp.html#userp
>
> Basically, userspace calls either one of those ioctls:
>
>         VIDIOC_CREATE_BUFS:
>                 https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/vidioc-create-bufs.html
>
> Which is translated into a videobuf2 call to: vb2_ioctl_create_bufs()
>
>         VIDIOC_REQBUFS
>                 https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/vidioc-reqbufs.html#vidioc-reqbufs
>
> Which is translated into a videobuf2 call to: vb2_ioctl_reqbufs()
>
> Both internally calls vb2_verify_memory_type(), which is responsible
> for checking if the provided pointers are OK for the usage and/or do
> all necessary page allocations, and taking care of any special
> requirements. This could easily have some additional checks to
> verify if the requested VMA address has pages that are movable or
> not, ensuring that ensure that the VMA is OK, and locking them in
> order to prevent the mm code to move such pages while they are in
> usage by the media subsystem.
>
> Now, as I said before, I don't know the dirty details about how
> to lock those pages at the mm subsystem in order to avoid it
> to move the used pages. Yet, when vb2_create_framevec()
> is called, the check if VMA is OK should already be happened
> at vb2_verify_memory_type().
>
> -
>
> It should be noticed that the dirty hack added by patch 09/17
> and 10/17 affects *all* types of memory allocations at V4L2,
> as this kAPI is called by the 3 different memory models
> supported at the media subsystem:
>
>         drivers/media/common/videobuf2/videobuf2-vmalloc.c
>         drivers/media/common/videobuf2/videobuf2-dma-contig.c
>         drivers/media/common/videobuf2/videobuf2-dma-sg.c
>
> In other words, with this code:
>
>         int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
>                 unsigned long *pfn)
>         {
>         #ifdef CONFIG_STRICT_FOLLOW_PFN
>                 pr_info("unsafe follow_pfn usage rejected, see CONFIG_STRICT_FOLLOW_PFN\n");
>                 return -EINVAL;
>         #else
>                 WARN_ONCE(1, "unsafe follow_pfn usage\n");
>                 add_taint(TAINT_USER, LOCKDEP_STILL_OK);
>
>                 return follow_pfn(vma, address, pfn);
>         #endif
>
> you're unconditionally breaking the media userspace API support not
> only for embedded systems that could be using userptr instead of
> DMA_BUF, but also for *all* video devices, including USB cameras.
>
> This is **NOT** an acceptable solution.
>
> So, I stand my NACK to this approach.
>
> > > > Well, no drivers inside the media subsystem uses such flag, although
> > > > they may rely on some infrastructure that could be using it behind
> > > > the bars.
> > >
> > > It doesn't matter, nothing prevents the user from calling media APIs
> > > on mmaps it gets from other subsystems.
> >
> > I think a good first step would be to disable userptr of non struct
> > page backed storage going forward for any new hw support. Even on
> > existing drivers. dma-buf sharing has been around for long enough now
> > that this shouldn't be a problem. Unfortunately right now this doesn't
> > seem to exist, so the entire problem keeps getting perpetuated.
>
> Well, the media uAPI does support DMABUF (both import and export):
>
>         https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dmabuf.html
>         https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/vidioc-expbuf.html#vidioc-expbuf
>
> And I fully agree that newer programs should use DMABUF when sharing
> buffers with DRM subsystem, but that's not my main concern.
>
> What I do want is to not break userspace support nor to taint the Kernel
> due to a valid uAPI call.
>
> A valid uAPI call should check if the parameters passed though it are
> valid. If they are, it should handle. Otherwise, it should return
> -EINVAL, without tainting the Kernel or printing warning messages.
>
> The approach took by patches 09/17 and 10/17 doesn't do that.
> Instead, they just unconditionally breaks the media uAPI.
>
> What should be done, instead, is to drop patch 10/17, and work on
> a way for the code inside vb2_create_framevec() to ensure that, if
> USERPTR is used, the memory pages will be properly locked while the
> driver is using, returning -EINVAL only if there's no way to proceed,
> without tainting the Kernel.
>
> >
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
>
> Not sure how an userspace buffer could be mapped to be using it,
> specially since the buffer may not even be imported/exported
> from the DRM subsystem, but it could simply be allocated
> via glibc calloc()/malloc().
>
> > - add dma-buf export support to fbdev and v4l
>
> V4L has support for it already.
>
> > - roll this out everywhere we still need it.
>
> That's where things are hard. This is not like DRM, where the APIs
> are called via some open source libraries that are also managed
> by DRM upstream developers.
>
> In the case of the media subsystem, while we added a libv4l sometime
> ago, not all userspace apps use it, as a large part of them used
> to exist before the addition of the libraries. Also, we're currently
> trying to deprecate libv4l, at least for embedded systems, in favor
> of libcamera.
>
> On media, there are lots of closed source apps that uses the media API
> directly. Even talking about open source ones, there are lots of
> different apps, including not only media-specific apps, but also
> generic ones, like web browsers, which don't use the libraries we
> wrote.
>
> An userspace API breakage would take *huge* efforts and will take
> lots of time to have it merged everywhere. It will cause lots of
> troubles everywhere.
>
> > Realistically this just isn't going to happen.
>
> Why not? Any app developer could already use DMA-BUF if required,
> as the upstream support was added several years ago.
>
> > And anything else just
> > reimplements half of dma-buf,
>
> It is just the opposite: those uAPIs came years before dma-buf.
> In other words, it was dma-buf that re-implemented it ;-)
>
> Now, I agree with you that dma-buf is a way cooler than the past
> alternatives.
>
> -
>
> It sounds to me that you're considering on only one use case of
> USERPTR: to pass a buffer created from DRM. As far as I'm aware,
> only embedded userspace applications actually do that.
>
> Yet, there are a number of other applications that do something like
> the userptr_capture() function on this code:
>
>         https://git.linuxtv.org/v4l-utils.git/tree/contrib/test/v4l2grab.c
>
> E. g. using glibc alloc functions like calloc() to allocate memory,
> passing the user-allocated data to the Kernel via something like this:
>
>         struct v4l2_requestbuffers req;
>         struct v4l2_buffer buf;
>         int n_buffers = 2;
>
>         req.count  = 2;
>         req.type   = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>         req.memory = V4L2_MEMORY_USERPTR;
>         if (ioctl(fd, VIDIOC_REQBUFS, &req))
>                 return errno;
>
>         for (i = 0; i < req.count; ++i) {
>                 buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>                 buf.memory = V4L2_MEMORY_USERPTR;
>                 buf.index = i;
>                 buf.m.userptr = (unsigned long)buffers[i].start;
>                 buf.length = buffers[i].length;
>                 if (ioctl(fd, VIDIOC_QBUF, &buf))
>                         return errno;
>         }
>         if (ioctl(fd, VIDIOC_STREAMON, &req.type))
>                 return errno;
>
>         /* some capture loop */
>
>         ioctl(fd, VIDIOC_STREAMOFF, &req.type);
>
> I can't possibly see *any* security issues with the above code.
>
> As I said before, VIDIOC_REQBUFS should be checking if the userspace
> buffers are OK and ensure that their refcounts will be incremented,
> in order to avoid mm to move the pages used there, freeing the
> refconts when VIDIOC_STREAMOFF - or close(fd) - is called.
>
> > which is kinda pointless (you need
> > minimally refcounting and some way to get at a promise of a permanent
> > sg list for dma. Plus probably the vmap for kernel cpu access.
>
> Yeah, refcounting needs to happen.
>
> Thanks,
> Mauro



--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
