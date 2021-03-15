Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25BB233C849
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 22:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbhCOVMA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 17:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232821AbhCOVLp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 17:11:45 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C89BCC06174A
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 14:11:44 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id ox4so53052041ejb.11
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 14:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7XeKhr7CPuLWpezZdLdwR9imo7EjFN3I1W1hRStNFLA=;
        b=rOyTvbm0rpYHUYLb6C2cR5Mn1A5XpScpBFUv6Kl5IM8xCvvTNA8uxv/nnkuCW3pByP
         2lOD0x39Lei9K/01UDokzH2XVK5fzt3v5yHjAyQ1kJCd/Ms9wz04ZKMommZx3myn2u7o
         UI6qU194/xGxo6NXHcek5AcF5/YhlJLsziczLaHhoskd/afTJFIPwu+P/5D9X76Kz8we
         NtK60DIllezF4lzOt7+gqJC06bk2fOielWRwh2ZOYj2/2eONW0e4MMiyhwmRsydVF4rj
         bGaH6LP7f53BmuAVRkZGpR4LYSiDvmd2URmLzjo3O99uwRJGN1eS/SKvGDWoIqswdmdw
         qFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7XeKhr7CPuLWpezZdLdwR9imo7EjFN3I1W1hRStNFLA=;
        b=ntytem5yZ4b3FkT4WYU54wHCMb+PGYVTWzDTSarM2L0yXQcWrIfBaORxJycnd5MCAP
         bAsGha9w/DtYMLF8EVZtwPeLEF1uaob8/+7sW4E4i6HvUo0Kgx4UeyXBXxwK6Clr31xR
         F9S5vGyzDYuO6VRzz1AnfQl3E1+gfSCeFvg0KfmtVZZ/pPl1vwHn214u2OVOXvg+vRy8
         cRMTBPU+Al3deB/ScNWxsoXjY8jh7gz+N5EMDD7fAvO2EHE7KD/Kung/wL/6xZePusJ2
         YM6uzkDBuZUcdZfh9vVjrvcVNoQlrqSjNQP3JvCTKrndxrWrSA0iw0lHJovj1f9TRPX6
         qABA==
X-Gm-Message-State: AOAM533gho+oblVTWld5xzpeifbEKlhETeDcmrXw26QhnGkpZF+Ua2ro
        r9jaGUs7zA9DDsAeOTqGWe84h+ZR9EdLij45Rj5gXQ==
X-Google-Smtp-Source: ABdhPJwEJ88ZcVdgoanEAlOUeGO68D49y0u7/+I+EUFnzqqULVU3Leqo/AMSnmx6G/jgVGUfLRnJyqyIF10bzk7sxKo=
X-Received: by 2002:a17:906:b288:: with SMTP id q8mr25774469ejz.210.1615842703458;
 Mon, 15 Mar 2021 14:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200311034351.1275197-3-jason@jlekstrand.net>
 <20200317212115.419358-1-jason@jlekstrand.net> <64eed158-22a8-10a7-7686-c972f8542649@daenzer.net>
 <20200930095542.GY438822@phenom.ffwll.local>
In-Reply-To: <20200930095542.GY438822@phenom.ffwll.local>
From:   Jason Ekstrand <jason@jlekstrand.net>
Date:   Mon, 15 Mar 2021 16:11:32 -0500
Message-ID: <CAOFGe97Q_j8PWq90rQoVk-qY95LM=o+hhWYg+Gsi9sp8+FD+NQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] RFC: dma-buf: Add an API for importing and exporting
 sync files (v5)
To:     =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Chenbo Feng <fengc@google.com>,
        Daniel Stone <daniels@collabora.com>,
        James Jones <jajones@nvidia.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Hackmann <ghackmann@google.com>,
        linaro-mm-sig@lists.linaro.org,
        =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@google.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Jesse Hall <jessehall@google.com>,
        Dave Airlie <airlied@redhat.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 30, 2020 at 4:55 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Sep 30, 2020 at 11:39:06AM +0200, Michel D=C3=A4nzer wrote:
> > On 2020-03-17 10:21 p.m., Jason Ekstrand wrote:
> > > Explicit synchronization is the future.  At least, that seems to be w=
hat
> > > most userspace APIs are agreeing on at this point.  However, most of =
our
> > > Linux APIs (both userspace and kernel UAPI) are currently built aroun=
d
> > > implicit synchronization with dma-buf.  While work is ongoing to chan=
ge
> > > many of the userspace APIs and protocols to an explicit synchronizati=
on
> > > model, switching over piecemeal is difficult due to the number of
> > > potential components involved.  On the kernel side, many drivers use
> > > dma-buf including GPU (3D/compute), display, v4l, and others.  In
> > > userspace, we have X11, several Wayland compositors, 3D drivers, comp=
ute
> > > drivers (OpenCL etc.), media encode/decode, and the list goes on.
> > >
> > > This patch provides a path forward by allowing userspace to manually
> > > manage the fences attached to a dma-buf.  Alternatively, one can thin=
k
> > > of this as making dma-buf's implicit synchronization simply a carrier
> > > for an explicit fence.  This is accomplished by adding two IOCTLs to
> > > dma-buf for importing and exporting a sync file to/from the dma-buf.
> > > This way a userspace component which is uses explicit synchronization=
,
> > > such as a Vulkan driver, can manually set the write fence on a buffer
> > > before handing it off to an implicitly synchronized component such as=
 a
> > > Wayland compositor or video encoder.  In this way, each of the differ=
ent
> > > components can be upgraded to an explicit synchronization model one a=
t a
> > > time as long as the userspace pieces connecting them are aware of it =
and
> > > import/export fences at the right times.
> > >
> > > There is a potential race condition with this API if userspace is not
> > > careful.  A typical use case for implicit synchronization is to wait =
for
> > > the dma-buf to be ready, use it, and then signal it for some other
> > > component.  Because a sync_file cannot be created until it is guarant=
eed
> > > to complete in finite time, userspace can only signal the dma-buf aft=
er
> > > it has already submitted the work which uses it to the kernel and has
> > > received a sync_file back.  There is no way to atomically submit a
> > > wait-use-signal operation.  This is not, however, really a problem wi=
th
> > > this API so much as it is a problem with explicit synchronization
> > > itself.  The way this is typically handled is to have very explicit
> > > ownership transfer points in the API or protocol which ensure that on=
ly
> > > one component is using it at any given time.  Both X11 (via the PRESE=
NT
> > > extension) and Wayland provide such ownership transfer points via
> > > explicit present and idle messages.
> > >
> > > The decision was intentionally made in this patch to make the import =
and
> > > export operations IOCTLs on the dma-buf itself rather than as a DRM
> > > IOCTL.  This makes it the import/export operation universal across al=
l
> > > components which use dma-buf including GPU, display, v4l, and others.
> > > It also means that a userspace component can do the import/export
> > > without access to the DRM fd which may be tricky to get in cases wher=
e
> > > the client communicates with DRM via a userspace API such as OpenGL o=
r
> > > Vulkan.  At a future date we may choose to add direct import/export A=
PIs
> > > to components such as drm_syncobj to avoid allocating a file descript=
or
> > > and going through two ioctls.  However, that seems to be something of=
 a
> > > micro-optimization as import/export operations are likely to happen a=
t a
> > > rate of a few per frame of rendered or decoded video.
> > >
> > > v2 (Jason Ekstrand):
> > >   - Use a wrapper dma_fence_array of all fences including the new one
> > >     when importing an exclusive fence.
> > >
> > > v3 (Jason Ekstrand):
> > >   - Lock around setting shared fences as well as exclusive
> > >   - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
> > >   - Initialize ret to 0 in dma_buf_wait_sync_file
> > >
> > > v4 (Jason Ekstrand):
> > >   - Use the new dma_resv_get_singleton helper
> > >
> > > v5 (Jason Ekstrand):
> > >   - Rename the IOCTLs to import/export rather than wait/signal
> > >   - Drop the WRITE flag and always get/set the exclusive fence
> > >
> > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> >
> > What's the status of this? DMA_BUF_IOCTL_EXPORT_SYNC_FILE would be usef=
ul
> > for Wayland compositors to wait for client buffers to become ready with=
out
> > being prone to getting delayed by later HW access to them, so it would =
be
> > nice to merge that at least (if DMA_BUF_IOCTL_IMPORT_SYNC_FILE is still
> > controversial).
>
> I think the missing bits are just the usual stuff
> - igt testcases
> - userspace using the new ioctls
> - review of the entire pile
>
> I don't think there's any fundamental objections aside from "no one ever
> pushed this over the finish line".

I just re-upped the patch series and you should have been on the CC
for the cover letter.  The Mesa MR is here:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037  I'm
going to try and knock out an IGT test quick but I don't know how much
is really practical to test in that environment besides a basic fuzz
for "does the IOCTL return a sync file".

I've dropped all the sync_file import stuff in the latest version.  It
would have been useful for testing but it's also where all the scary
stuff lives and I'm no longer convinced it solves any real problems
for userspace.

--Jason
