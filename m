Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E177251EA4
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 19:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgHYRwi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 13:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHYRwg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 13:52:36 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CB6C061574
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2020 10:52:36 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g75so2947835wme.4
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2020 10:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UXMcwQWgr3lVOVuIZYC1hqw3RvXPbFCSwK/asVFUmWE=;
        b=Rr2rq8T+gV3AUoWRbEnnk24I5XckwYAbAwPzhRzNIQ7Zzp+R8XSgJOvQLyVHQ7/3vc
         UO0ByoAZzfiKcM1vAbFalcqisYDI5fZQzAfatioWfzpIZ+XUt996pYGjCrZ6G/fpVFIr
         GPUW7gMzOwNF9vTWYhx3vdzQkTKassJbiiUcbtomEl+63eXV51nGBY45CfKyZMRUPo+G
         DDM9rDLJKBqTl6ATYCr+ebouPEkWSs+j7IoJKoe6cTdjb3AkAh12y1yvGhxjWuET85SG
         BGKY+bnh8Eb7dW6k6F+vG4nvObU9QgQ6bA+PCz+DzgTdHzVH8sxXPPDDq54DdS7GP6d9
         Zydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UXMcwQWgr3lVOVuIZYC1hqw3RvXPbFCSwK/asVFUmWE=;
        b=Swj2jKmbYDZz0kz8+ifsZkZpGLfgnHYLoyEuK17DCpcTC3c/o8JJbKcw7ucxZrzUA/
         LpmQhAKUIRvcDyNOP4yWxvUegOP0nW4wxVogLjpLKM5sRgAs3urbK7ik4eNMIfPprfI3
         0d9j+hW/xWfedLf0UaBNZhoJ8Q0B/xRxxdPSJYCbOPQVDrryrrwJaSNHr/yiN6ZO1VaS
         vZrz7hGPpyAbTjruXvd2KYgoYe7hLFGekmmRuE22MPAeq0uPplgfBQm8kKt6gifcPSEm
         QCtF2UMKhY06ZzZNCALk8uC3nTsH1EaX6sIa/9NF5uPtvk3jsxLEBV81gIQ28NgoSOAu
         gIBQ==
X-Gm-Message-State: AOAM532X0ZbLP7VggRBDjb8xieKn0D+ApQoanzJPx4pXb0wtU0oxkXyN
        nrGvpcissPXa6oUSFv5yB/AaduO2LUIXUUg7k8kgZw==
X-Google-Smtp-Source: ABdhPJw2xJVNdTCaI2P7I4fS70Bbkc6aLQ8SaQhDQJRD1dNp4k3SgINbYyZlsqIYIzUSzJbNds/SwIT75kW8njxJFRU=
X-Received: by 2002:a1c:2543:: with SMTP id l64mr2908019wml.96.1598377954439;
 Tue, 25 Aug 2020 10:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-7-laurent.pinchart@ideasonboard.com> <4e42a593f16614e913613150a90e851acbfcaa8c.camel@suse.de>
 <CAPY8ntB3RCwzCzj+v0QEQp19f-X7tgfhFZ_DK3-LUiWXGK0eNA@mail.gmail.com> <20200824163952.t7hfri4ml4gjnddq@uno.localdomain>
In-Reply-To: <20200824163952.t7hfri4ml4gjnddq@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 25 Aug 2020 18:52:18 +0100
Message-ID: <CAPY8ntAmQxC4rTNsmfNb10XWR4bYHsMEPLei3c9Zdu00wr-_JQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/34] staging: vc04_services: Add new vc-sm-cma driver
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Mon, 24 Aug 2020 at 17:36, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Dave, Nicolas, Laurent,
>
> On Wed, May 06, 2020 at 08:24:38PM +0100, Dave Stevenson wrote:
> > Hi Nicolas
> >
> > On Wed, 6 May 2020 at 19:04, Nicolas Saenz Julienne
> > <nsaenzjulienne@suse.de> wrote:
> > >
> > > Hi Laurent, Dave,
> > >
> > > On Mon, 2020-05-04 at 12:25 +0300, Laurent Pinchart wrote:
> > > > From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> > > >
> > > > Add Broadcom VideoCore Shared Memory support.
> > > >
> > > > This new driver allows contiguous memory blocks to be imported
> > > > into the VideoCore VPU memory map, and manages the lifetime of
> > > > those objects, only releasing the source dmabuf once the VPU has
> > > > confirmed it has finished with it.
> > > >
> > >
> > > I'm still digesting all this, but a question came up, who is using the
> > > ioctls?
> >
> > We have a userspace library that uses it [1].
> > It is used by things like MMAL to share buffers between the VPU and
> > ARM, rather than having to get VCHI to copy all the data between
> > mirrored buffers.
> >
> > I think what has happened here is that Laurent has picked up the
> > version of the driver from the top of our downstream kernel tree.
> > For libcamera and the ISP driver, we need a significantly smaller
> > feature set, basically import of dmabufs only, no allocations or cache
> > management. For the ISP driver it's mainly dmabuf import from
> > videobuf2 for the image buffers, but there's also a need to pass in
> > lens shading tables which are relatively large. With a small amount of
> > rework in libcamera, we can make it so that we use dma-buf heaps to do
> > the allocation, and pass in a dmabuf fd to the ISP driver to then map
> > onto the VPU. That removes all the ioctls handling from this driver.
> >
> > Downstream we do have other use cases that want to be able to do other
> > functions on shared memory, but that too should be reworkable into
> > using dma-buf heaps for allocations, and vcsm only handles importing
> > dmabufs via an ioctl. All that can be hidden away in the vcsm library,
> > so applications don't care.
> > We've also got some legacy code kicking around, as there was
> > originally a version of the driver that mapped the VPU's memory blocks
> > to the ARM. That's why the vcsm library has two code paths through
> > almost every function - one for each driver.
> >
> > Laurent: What's your view? Halt the review this particular patch for
> > now and rework, or try and get this all integrated?
> > Mainline obviously already has dma-buf heaps merged, whilst I have a
> > PR cherry-picking it back into our downstream 5.4. The main reason it
> > hasn't been merged is that I haven't had a test case to prove it
> > works. The rework should be relatively simple, but will need small
> > updates to both libcamera and ISP driver.
>
> As months have passed, libcamera moved to allocate lens shading tables
> using dma-buf heaps and the only user I can name of the vc-sm-cma
> driver is the actual ISP, that needs to import the dmabuf pointing to
> the lens shading maps with vc_sm_cma_import_dmabuf().

You've also got vc04_services/vchiq-mmal/mmal-vchiq.c importing
dmabufs, either from vb2_contig or imported from elsewhere when using
VB2_MEMORY_DMABUF.

> Upstreaming the whole vc-sm-cma driver as it is for this single kAPI
> seems a bit a no-go. Dave, what would you prefer here ? Should I
> provide a minimal vc-sm-cam driver that only performs buffer importing
> to support the ISP driver ? Is the buffer importing into VPU there to
> stay or is its usage transitional and can be kept out of the next
> submission of this series ?

Both imports are here to stay as the VPU needs to be able to use those
blocks of memory.

This first iteration picked up a fair number of extraneous lumps (eg
the caching calls).
I got a reminder last week that I promised a reworked version of
vc-sm-cma to you and I hadn't done it - sorry, juggling too many
things. I'll get on it now, so nudge me if I haven't pushed it to you
by the end of the week for your review.

We can trim it down significantly now that we have dma-heaps in and
working. There's a niggle that the current dma-heaps are always cached
on the ARM, but that just means that the user has to be careful to use
DMA_BUF_IOCTL_SYNC correctly (which they should be doing anyway).

Whilst waiting for that, the Unicam driver, and the prep work in
mmal-vchiq could all be pushed first, and ideally as two independent
patchsets as there are no inter-dependencies between them.

  Dave

> Thanks
>   j
>
> >
> >   Dave
> >
> > [1] https://github.com/raspberrypi/userland/tree/master/host_applications/linux/libs/sm
> >
> > > Regards,
> > > Nicolas
> > >
