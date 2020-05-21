Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02021DCB97
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 13:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbgEULCE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 07:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728661AbgEULCE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 07:02:04 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4BEC061A0E
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 04:02:03 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g12so5036781wrw.1
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 04:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H/EB0L7fdA2/BLWqIU0cQbM0PRe576dQcwQvfKybGHo=;
        b=djZBcmQu2GnI9Ej3ukb8Kr8qt0VCMJTHHhqub1f3YH6Viu5HLiS/CjJT85Ja7tz4WJ
         Cdc7TSBjhQF9wwyVX7WtZ4OgJnXQgfG2a9b+eqM+qVIrMk6mpL6TVKTTvuaPds0TnMn5
         iY9UdbJCir6EQqJ8fLpicc4V0d2TiUDVxEYURuicFFcU2s1EcAQOB0kLb9vr5HZ6BReS
         7v/HVa7yDocxdjSLcunw8j/tmaXwN6N4wavsNj/IuPv/P7/3RXhn0QOpAc5yiTrgBp1G
         2Ew1EalTJ7zXwyvHGE5PquxPtjxBzvawItXSXhqQ49bPOkuOTAdSNRRPBx2alXFSrMhV
         A8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H/EB0L7fdA2/BLWqIU0cQbM0PRe576dQcwQvfKybGHo=;
        b=nHZkVdHfii5D4BFw1yuz0eadHPSBEZcbgPCeehDdYEj+VAA2HOShnXiUuChgZrN0Ws
         2KUJlFb2g3KjFnoNuZyC6V4xJBzeFJzUH1uaEe537EaXfgEEiAJqTHqfnjWLNEbJ4Xtf
         rMTdJ/Ghl8gcAXv4tMoZUEQFPCrJd2URbLUUcDfBtQCBZ199he8vLfXf4NKbl1shy+jw
         VjwM9h6m/A05yagVHMlr0ixdGMNrDYsF4YSn8XGE8lhoLthh2Jr8XIdV/RPDe6EyYBra
         2CakUZuezUj085vGXOZQaATUWgw8NUnhtpXssE8hFbhN1+A8se9HNLfT4/TbdHCpE5wQ
         qAKA==
X-Gm-Message-State: AOAM532E9I8jplD06fRkeOsv0T9eypB8WzYhvVNlF36+Hld+14GLa7Zn
        fXK/u6AlGijqcrOgYY3S2LHxY0hy03dhcFq8Z+x9gWxn
X-Google-Smtp-Source: ABdhPJyHA2R58FsuHQSQkgksL7vtiV3Cn1WHx3CgWivxeHw4lfJqMEtkvR1VrwzVT8faD5WusQfe8IyYw08D8Bj+6xw=
X-Received: by 2002:adf:cd0d:: with SMTP id w13mr8598786wrm.150.1590058922408;
 Thu, 21 May 2020 04:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-7-laurent.pinchart@ideasonboard.com> <9b42ad8c4c39ac3873e7c3ea2951bea1caef8bd1.camel@suse.de>
 <CAPY8ntCZsFtko4LMUsfSEUV9LwtJ9bdjXK4ZVJ3KFd18vzRp5A@mail.gmail.com> <a18a3f213b7d26a0f9a420dbda7eb739d3aab1d9.camel@suse.de>
In-Reply-To: <a18a3f213b7d26a0f9a420dbda7eb739d3aab1d9.camel@suse.de>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 21 May 2020 12:01:44 +0100
Message-ID: <CAPY8ntBqEMaLGq6aGZBqmAyy_0nhxYBvpRi-F7OG1JqdEwOHTQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/34] staging: vc04_services: Add new vc-sm-cma driver
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicholas

On Wed, 20 May 2020 at 15:41, Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> On Mon, 2020-05-18 at 16:48 +0100, Dave Stevenson wrote:
> > Hi Nicolas
> > > > +     exp_info.ops = &dma_buf_import_ops;
> > > > +     exp_info.size = import.size;
> > > > +     exp_info.flags = O_RDWR;
> > > > +     exp_info.priv = buffer;
> > > > +
> > > > +     buffer->dma_buf = dma_buf_export(&exp_info);
> > >
> > > Could you comment on the need for this second dma_buf? I've only reviewed
> > > code
> > > related to mmal-vchiq imports, but it seems to me that it would be saner to
> > > do
> > > the unmapping and unattaching explicitly as opposed to having this second
> > > buffer refcount hit 0. Although, I can imagine this being needed for the
> > > userspace interface.
> >
> > Indeed, as it is needed for the userspace interface it seemed to make
> > more sense to have common handling rather than two code paths doing
> > nearly the same thing but in different ways.
> > Downstream we need a userspace import at least to allow MMAL to set up
> > zero copy, so unless it raises any real objections then it would be
> > useful to keep it.
> >
> > > When you talk about moving to dmabuf heaps, I've pictured a specific dmabuf
> > > heap for vc4 that takes care of all the importing and unimporting (aside
> > > from
> > > cma allocations). Am I right? If so, I'm pretty confident we can do away
> > > with
> > > this.
> >
> > (Note I'm talking about the VideoCore4 VPU and other blocks, and not
> > the vc4 DRM/KMS and V3D drivers)
> >
> > No, I'm looking at using the existing cma_heap driver to do the
> > allocations, and then this driver will import them and handle the
> > lifetime on behalf of the VPU. There's no need for VPU allocations to
> > be split off into yet another heap.
>
> Fair enough.
>
> > One of the things we are trying to get away from is having the gpu_mem
> > reserved lump that Linux can't get access to at all, so allocating
> > from the CMA heap and importing to the VPU avoids that.
>
> That's great! Will this also apply at some point to the GPU side of things? I
> vaguely recall having to reserve up to 300M on rpi3 to get mesa to work on a
> desktop environment.

None of this has any involvement with the vc4 V3D or v3d DRM/KMS
drivers. gpu_mem (the size of the VPU's relocatable heap) shouldn't
have affected that at all other than being another carveout.

I did have code working where VPU relocatable heap alloc calls made a
VCHIQ call across to this driver, it made an allocation using
dma_alloc_contig, and then passed all the required information back.
Whilst it worked in all the use cases we tested, there were still a
few reservations over potential deadlocks depending on exactly who
called what when. There were also discussions on how to tell users
that everything had changed, gpu_mem no longer did anything much, and
please set up CMA regions. The best time is probably on either a new
Debian/Raspbian release, or possibly when bumping to the next LTS
kernel, but we just know there will be complaints whenever we do it.

If/when the world quietens down a bit I may look at resurrecting it
again. It fitted in better when this driver was doing allocations, but
if we can arrange that there is no need to work backwards from an
internal allocation VPU handle to a dmabuf, then actually the
allocation and dma map code can be relatively self-contained.

> > I'll give some history here, which also hopefully covers your query
> > over switching mmal-vchiq to zero copy.
> >
> > Almost all the VC4 blocks need contiguous memory, so fragmentation was
> > an issue. To resolve that we (back in Broadcom days) had the
> > "relocatable heap" - allocations that needed to be locked before
> > access and unlocked after. Unlocked blocks could be copied and moved
> > around to free up larger contiguous blocks. These allocations use a
> > handle instead of a pointer, and have internal refcounting etc.
> > Basically providing some of the features of an MMU when you don't have
> > one.
> >
> > The original VCSM driver allowed userspace to make a relocatable heap
> > allocation, lock it, and the kernel to map the relevant pages into the
> > ARM memory space. Now you have a shared buffer, and VCHIQ no longer
> > has to copy the data back and forth. (Cache flushing was also
> > handled).
> > So MMAL in zero copy mode passes the VPU relocatable heap handle
> > across in the VCHIQ message, not a pointer to the actual data. VCSM
> > did the allocation on behalf of the MMAL client, and provides the
> > mapping and VPU handle to the buffer. This still leaves the allocation
> > being made from gpu_mem though.
> >
> > The rewrite (vc-sm-cma) was to make use of an import feature into the
> > relocatable heap, termed internally as mem wrapping. Take a CMA
> > allocation made by something, pass the DMA address and size across to
> > the VPU, and it can insert it as a relocatable heap object that can be
> > used in exactly the same way gpu_mem allocations. gpu_mem can now be
> > shrunk in size :-) It was using a dma-buf as a convenient object to
> > manage the allocation, and handle importing buffers allocated by other
> > subsystems
> > Note that we still have refcounting internally to the relocatable
> > heap, so at the point the client says it has finished with it, the VPU
> > may not have done. When the last relocatable heap reference is
> > released, the kernel gets a callback (VC_SM_MSG_TYPE_RELEASED), and it
> > is only at that point that it is safe to drop the reference to the
> > imported dmabuf.
> >
> > V4L2 can do the relevant import and wrapping to a relocatable heap
> > handle as part of the buffer passing. MMAL needs to do it manually
> > from userspace as VCHIQ is the only in-kernel service that it uses,
> > hence we need an import ioctl and free mechanism (if the handle is a
> > dmabuf, then that's close).
> >
> >
> > From a platform level it would be nice to have the userspace ioctl for
> > importing a dmabuf in mainline, however it isn't necessary for the
> > V4L2 use cases that we're trying to upstream here. The driver without
> > userspace API would look pretty much like the one in [1]. I'll try and
> > update that to include the basic import userspace API to give a
> > comparison.
> > I don't mind which way this goes as to whether the userspace ioctl
> > remains as downstream patches, but losing the dmabuf as the handle
> > within vc-sm-cma will make that patch huge, and they're almost
> > guaranteed to diverge.
> > Ignore the caching ioctls - they're irrelevant.
> >
> > I hope that makes the situation a little clearer.
>
> Thanks a lot for the in-depth explanation, it does indeed. Actually, it
> wouldn't hurt to add a subset of this into a text file alongside with the new
> driver.

OK, I'll look at tidying things up before Laurent and co push another
version for review.

  Dave
