Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 144AB1704B7
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 17:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgBZQqV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 11:46:21 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:35225 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgBZQqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 11:46:20 -0500
Received: by mail-il1-f193.google.com with SMTP id g126so2962105ilh.2
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 08:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kKI4kWQKEzspQeYM9K+BK1k5xvPgxWGyOwZ0Q8mXp38=;
        b=MQrfs1+Yu+n3dZ2PfkIqvzmgcfvZIUiMCq4TN5kHF2Q5yumZEOoU8x8X7F33EZulpE
         mUVYe0oSDbb30Yr3TifvkMPI8ioxg926IYYDXUAkqLHH+KoGXn/RxwXyzB7LkIs02ub4
         87f9vh+uOAo6Gzp1tXGLrBzM/saVbEEJHVQSFXR6MzgmC9X/CHxWJ1dFv8P/i9Ue5aS3
         AVt0mC+1sKiXSbZOwbBjve8VtIjrHsPJGAzS4QGlJA5xI+GVNXf/ib5v4+Q45CeZYEVf
         ngO6cPnojHdD8/VFAfx14IFSkEElVqD9VD7b5lzDA4aKLl9WQcoR0RCA5p/EajhrOsOx
         JQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kKI4kWQKEzspQeYM9K+BK1k5xvPgxWGyOwZ0Q8mXp38=;
        b=NKBQl9Pwwid5DmzKYotfzti8opdsJu8oF1FT9YFOVkyc23T+SVgHiF/K+krMLK9vUh
         S5TMvUnTMc0hmYCIuV6gB2vVSzKM3cuiTfN6tTgk5E4iTr3R+CZVbzB8+3QE32UXiNyN
         w+RTQtxc22kjP7kkne1YQ8SWGjzgPM515/q4xIoWBTrAXjtPv/yAaIZ8jpIdFzQglS5j
         VZBe7j3aaGXRU1/q5vMSA22hLCi1pjOIweRsqZQ0cLffZw/OUx1hgW4mO7ScB7piTUwh
         JzxsFvs2JNweP7iIDVjQXt54eXcaUERQ1qIQTJ89THCWwpeL+emcHGocBCfrVRiQ4S4r
         Xbew==
X-Gm-Message-State: APjAAAV3DWh/WWHt9MLgUdEtkpown0uvEBMij2bcJHAJvZhfR4jCPpmb
        kKqY3jHfhY8yr3og1e+8Z9RirV2BKWzE61t78kyoEA==
X-Google-Smtp-Source: APXvYqxIbqr2hZiXl4nVmFvnV510/zMMM4B/0Pu4IexYFyg/y7AJ918fXZg1/ojhX2fb3yUT1Jgn3qJxpunX0mqq6lo=
X-Received: by 2002:a92:50a:: with SMTP id q10mr6324445ile.294.1582735579854;
 Wed, 26 Feb 2020 08:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20200225235856.975366-1-jason@jlekstrand.net> <8066d8b2-dd6a-10ef-a7bb-2c18a0661912@amd.com>
 <20200226100523.GQ2363188@phenom.ffwll.local> <CAOFGe94O66HL212aXqhi9tdYqw---Xm-fwNSV4pxHyPmpSGpbg@mail.gmail.com>
In-Reply-To: <CAOFGe94O66HL212aXqhi9tdYqw---Xm-fwNSV4pxHyPmpSGpbg@mail.gmail.com>
From:   Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date:   Wed, 26 Feb 2020 17:46:08 +0100
Message-ID: <CAP+8YyEUz29fXDW5kO_0ZG6c849=TuFWCK8ynT3LuM+Tn+rMzw@mail.gmail.com>
Subject: Re: [PATCH] RFC: dma-buf: Add an API for importing and exporting sync files
To:     Jason Ekstrand <jason@jlekstrand.net>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dave Airlie <airlied@redhat.com>,
        Jesse Hall <jessehall@google.com>,
        James Jones <jajones@nvidia.com>,
        Daniel Stone <daniels@collabora.com>,
        =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Chenbo Feng <fengc@google.com>,
        Greg Hackmann <ghackmann@google.com>,
        linux-media@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 26, 2020 at 4:29 PM Jason Ekstrand <jason@jlekstrand.net> wrote=
:
>
> On Wed, Feb 26, 2020 at 4:05 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Feb 26, 2020 at 10:16:05AM +0100, Christian K=C3=B6nig wrote:
> > > Hi Jason,
> > >
> > > Am 26.02.20 um 00:58 schrieb Jason Ekstrand:
> > > > Explicit synchronization is the future.  At least, that seems to be=
 what
> > > > most userspace APIs are agreeing on at this point.  However, most o=
f our
> > > > Linux APIs (both userspace and kernel UAPI) are currently built aro=
und
> > > > implicit synchronization with dma-buf.  While work is ongoing to ch=
ange
> > > > many of the userspace APIs and protocols to an explicit synchroniza=
tion
> > > > model, switching over piecemeal is difficult due to the number of
> > > > potential components involved.  On the kernel side, many drivers us=
e
> > > > dma-buf including GPU (3D/compute), display, v4l, and others.  In
> > > > userspace, we have X11, several Wayland compositors, 3D drivers, co=
mpute
> > > > drivers (OpenCL etc.), media encode/decode, and the list goes on.
> > > >
> > > > This patch provides a path forward by allowing userspace to manuall=
y
> > > > manage the fences attached to a dma-buf.  Alternatively, one can th=
ink
> > > > of this as making dma-buf's implicit synchronization simply a carri=
er
> > > > for an explicit fence.  This is accomplished by adding two IOCTLs t=
o
> > > > dma-buf for importing and exporting a sync file to/from the dma-buf=
.
> > > > This way a userspace component which is uses explicit synchronizati=
on,
> > > > such as a Vulkan driver, can manually set the write fence on a buff=
er
> > > > before handing it off to an implicitly synchronized component such =
as a
> > > > Wayland compositor or video encoder.  In this way, each of the diff=
erent
> > > > components can be upgraded to an explicit synchronization model one=
 at a
> > > > time as long as the userspace pieces connecting them are aware of i=
t and
> > > > import/export fences at the right times.
> > > >
> > > > There is a potential race condition with this API if userspace is n=
ot
> > > > careful.  A typical use case for implicit synchronization is to wai=
t for
> > > > the dma-buf to be ready, use it, and then signal it for some other
> > > > component.  Because a sync_file cannot be created until it is guara=
nteed
> > > > to complete in finite time, userspace can only signal the dma-buf a=
fter
> > > > it has already submitted the work which uses it to the kernel and h=
as
> > > > received a sync_file back.  There is no way to atomically submit a
> > > > wait-use-signal operation.  This is not, however, really a problem =
with
> > > > this API so much as it is a problem with explicit synchronization
> > > > itself.  The way this is typically handled is to have very explicit
> > > > ownership transfer points in the API or protocol which ensure that =
only
> > > > one component is using it at any given time.  Both X11 (via the PRE=
SENT
> > > > extension) and Wayland provide such ownership transfer points via
> > > > explicit present and idle messages.
> > > >
> > > > The decision was intentionally made in this patch to make the impor=
t and
> > > > export operations IOCTLs on the dma-buf itself rather than as a DRM
> > > > IOCTL.  This makes it the import/export operation universal across =
all
> > > > components which use dma-buf including GPU, display, v4l, and other=
s.
> > > > It also means that a userspace component can do the import/export
> > > > without access to the DRM fd which may be tricky to get in cases wh=
ere
> > > > the client communicates with DRM via a userspace API such as OpenGL=
 or
> > > > Vulkan.  At a future date we may choose to add direct import/export=
 APIs
> > > > to components such as drm_syncobj to avoid allocating a file descri=
ptor
> > > > and going through two ioctls.  However, that seems to be something =
of a
> > > > micro-optimization as import/export operations are likely to happen=
 at a
> > > > rate of a few per frame of rendered or decoded video.
> > > >
> > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > ---
> > > >
> > > > This is marked as an RFC because I intend it to start a discussion =
about
> > > > how to solve a problem.  The current patch compiles but that's it f=
or now.
> > > > I'll be writing IGT tests and Vulkan driver patches which exercise =
it over
> > > > the next couple of days.  In the mean time, feel free to tell me wh=
y you
> > > > think this is a great and/or terrible idea. :-)
> > >
> > > For the exporting part I think it is an absolutely great idea because=
 it
> > > simplifies compatibility with explicit sync quite a bit.
>
> Unfortunately, it only helps half of explicit sync and not the half
> that's hard to deal with from Vulkan. :-/
>
> > > But for the importing part it is a clear NAK at the moment. See we ca=
n't
> > > allow userspace to mess with DMA-buf fences in that way because it ri=
ps open
> > > a security hole you can push an elephant through.
>
> Oh, sure, I'm 100% sure I did that part wrong.  Why else would I send
> the patch but to have someone who actually knows what they're doing
> tell me how to do it correctly? :-P
>
> > > Just imagine that you access some DMA-buf with a shader and that oper=
ation
> > > is presented as a fence on the DMA-bufs reservation object. And now y=
ou can
> > > go ahead and replace that fence and free up the memory.
> > >
> > > Tricking the Linux kernel into allocating page tables in that freed m=
emory
> > > is trivial and that's basically it you can overwrite page tables with=
 your
> > > shader and gain access to all of system memory :)
> > >
> > > What we could do is to always make sure that the added fences will co=
mplete
> > > later than the already existing ones, but that is also rather tricky =
to get
> > > right. I wouldn't do that if we don't have a rather big use case for =
this.
>
> Right.  I thought about that but I'm still learning how dma_resv
> works.  It'd be easy enough to make a fence array that contains both
> the old fence and the new fence and replace the old fence with that.
> What I don't know is the proper way to replace the exclusive fence
> safely.  Some sort of atomic_cpxchg loop, perhaps?  I presume there's
> some way of doing it properly because DRM drivers are doing it all the
> time.

I think for an exclusive fence you may need to create a fence array
that includes the existing exclusive and shared fences in the dma_resv
combined with the added fence.

However, I'm not sure what the best way is to do garbage collection on
that so that we don't get an impossibly list of fence arrays. (Note
the dma_resv has a lock that needs to be taken before adding an
exclusive fence, might be useful). Some code that does a thing like
this is __dma_resv_make_exclusive in
drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c

The other piece of the puzzle is that on the submit path this would
need something to ignore implicit fences. And there semantically the
question comes up whether it is safe for a driver to ignore exclusive
fences from another driver. (and then we have amdgpu which has its own
rules on exclusiveness of its shared fences based on the context. e.g.
the current option to ignore implicit fences for a buffer still syncs
on exclusive fences on the buffer).









>
> > I think the main use-case for adding a fence is adding a write fence fo=
r
> > vk winsys buffers, which run without any sync at all. So essentially wh=
at
> > we'd do is promote one of the read fences which are already attached to=
 be
> > the write fence.
>
> Correct.  We're effectively doing an import in ANV today but we're
> doing it with a dummy execbuf which claims to write the BO and has a
> batch that's just MI_BATCH_BUFFER_END.
>
> > But yeah making sure we don't break any of the dma_resv guarantees abou=
t
> > how these fences works is going to be somewhat tricky. Probably can reu=
se
> > a big chunk of the fence container work we've done for syncobj timeline=
s,
> > since they have some of the same issues of having to chain fences to no=
t
> > break the world.
>
> Happy to not break the world.  I just don't know how yet. :-)
>
> --Jason
