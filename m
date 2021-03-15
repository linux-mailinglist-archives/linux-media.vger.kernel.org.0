Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1268A33C876
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 22:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbhCOVbN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 17:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232482AbhCOVan (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 17:30:43 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15D8C06174A
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 14:30:43 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id u62so20174688oib.6
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 14:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SgZW0+rc5pzyqjKsS4Yped9fvoRIww8OGAYn+UxfO4k=;
        b=JSlA2uxDJ+CZ5OGFYc4O643eTdsPjdi2pD7zR4aNdDwc1vF44uM/aw1CEE5wwpsJq8
         uw1cGIh2mvh9wQgWIIKnS7jUTLGpXObz6PAUodIcaMeM12EbxmIZOcs78yRjCuMTsPnN
         Gw7GkDiV/kSdf3qQLVk0XKUSdt1FyADsCv/NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SgZW0+rc5pzyqjKsS4Yped9fvoRIww8OGAYn+UxfO4k=;
        b=sKo1MHmdAaC2riB+ir5EW/wAuZ0WmhaqLf3+Ib9dwoP396z7koqY5kRJDGBTTQflS9
         CzwwoHrpU7mvMm5sgTBgNbcK1yJPawzSae7BV1kVOeqHuaZoOt98j7MFy4ccVSinvTv1
         BkJpbvlAGrysEyPiWf8sthdx0R/BQFxQM0ft/mcNRdRSR+BWmLjFBQgNGbmvHGI5ff8Q
         fX5rI/A+dukLimehiciBvRwR6LCiUnc5np0prqLy+7NeFL5sltKP2ToFOAXMkThrtF+A
         4RlkdbRvjwKygwgtHI6AhO/aYSqFasqGn02mBHwnXb1OLopFjncBu3SUwhbrCoCXhtcb
         ig8w==
X-Gm-Message-State: AOAM5336Es4FsEU/2dtl7v9DSNdskaxgT/RACLHxi3xXVju/aFVA2O+8
        r0h4d/dJg/BfhmOjSWiWyDBEg9XvvN2rkdeyTE5kbw==
X-Google-Smtp-Source: ABdhPJxp9Z55WZOHpsvw9TRL+FR+Tj/K5sC9Y1Isfs3+EZxgTlLRl+upwO4b5rwajihfy94crAv1cU+9QqzJbIrGYWA=
X-Received: by 2002:aca:170a:: with SMTP id j10mr867562oii.128.1615843842283;
 Mon, 15 Mar 2021 14:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200311034351.1275197-3-jason@jlekstrand.net>
 <20200317212115.419358-1-jason@jlekstrand.net> <64eed158-22a8-10a7-7686-c972f8542649@daenzer.net>
 <20200930095542.GY438822@phenom.ffwll.local> <CAOFGe97Q_j8PWq90rQoVk-qY95LM=o+hhWYg+Gsi9sp8+FD+NQ@mail.gmail.com>
In-Reply-To: <CAOFGe97Q_j8PWq90rQoVk-qY95LM=o+hhWYg+Gsi9sp8+FD+NQ@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 15 Mar 2021 22:30:31 +0100
Message-ID: <CAKMK7uE34xvL8-9TS1i8FtrFiaw5A4ZeTSaOvHnn0UGp1dj4MQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] RFC: dma-buf: Add an API for importing and exporting
 sync files (v5)
To:     Jason Ekstrand <jason@jlekstrand.net>
Cc:     =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
        Chenbo Feng <fengc@google.com>,
        Daniel Stone <daniels@collabora.com>,
        James Jones <jajones@nvidia.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Hackmann <ghackmann@google.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@google.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Jesse Hall <jessehall@google.com>,
        Dave Airlie <airlied@redhat.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 15, 2021 at 10:11 PM Jason Ekstrand <jason@jlekstrand.net> wrot=
e:
>
> On Wed, Sep 30, 2020 at 4:55 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Sep 30, 2020 at 11:39:06AM +0200, Michel D=C3=A4nzer wrote:
> > > On 2020-03-17 10:21 p.m., Jason Ekstrand wrote:
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
> > > > v2 (Jason Ekstrand):
> > > >   - Use a wrapper dma_fence_array of all fences including the new o=
ne
> > > >     when importing an exclusive fence.
> > > >
> > > > v3 (Jason Ekstrand):
> > > >   - Lock around setting shared fences as well as exclusive
> > > >   - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
> > > >   - Initialize ret to 0 in dma_buf_wait_sync_file
> > > >
> > > > v4 (Jason Ekstrand):
> > > >   - Use the new dma_resv_get_singleton helper
> > > >
> > > > v5 (Jason Ekstrand):
> > > >   - Rename the IOCTLs to import/export rather than wait/signal
> > > >   - Drop the WRITE flag and always get/set the exclusive fence
> > > >
> > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > >
> > > What's the status of this? DMA_BUF_IOCTL_EXPORT_SYNC_FILE would be us=
eful
> > > for Wayland compositors to wait for client buffers to become ready wi=
thout
> > > being prone to getting delayed by later HW access to them, so it woul=
d be
> > > nice to merge that at least (if DMA_BUF_IOCTL_IMPORT_SYNC_FILE is sti=
ll
> > > controversial).
> >
> > I think the missing bits are just the usual stuff
> > - igt testcases
> > - userspace using the new ioctls
> > - review of the entire pile
> >
> > I don't think there's any fundamental objections aside from "no one eve=
r
> > pushed this over the finish line".
>
> I just re-upped the patch series and you should have been on the CC
> for the cover letter.  The Mesa MR is here:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037  I'm
> going to try and knock out an IGT test quick but I don't know how much
> is really practical to test in that environment besides a basic fuzz
> for "does the IOCTL return a sync file".

With vgem you should be able to control the interface fully, since
that allows you to control dma_fences we attach to stuff. Or at least
it has some of the ingredients, and a bunch of igts test it. E.g. we
have one that creates a fence with vgem and then checks (using crc)
that your display driver works correctly with the page flip.

> I've dropped all the sync_file import stuff in the latest version.  It
> would have been useful for testing but it's also where all the scary
> stuff lives and I'm no longer convinced it solves any real problems
> for userspace.

Yeah vgem should allow you to get at least some of that sorted.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
