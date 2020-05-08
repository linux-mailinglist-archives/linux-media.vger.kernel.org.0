Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 382FB1C9F76
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 02:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgEHAL2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 20:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726480AbgEHAL2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 20:11:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65684C05BD43
        for <linux-media@vger.kernel.org>; Thu,  7 May 2020 17:11:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A04D329;
        Fri,  8 May 2020 02:11:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588896685;
        bh=8HqLKIiW4kNe6jbWW+3KuwYo4dkxOd+zovw79HxFiYI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UyNytcYmkpxPJLQDuTLIeTEk44E7xlkt83MaUmg4rP/cfLW1BMSUTIF9uWKm1rpoC
         9jjSF+BxwNCBrtELZLMhnJhxi8Jl6khYqj5UXmfFUv4taVMPPvVD9HqIWDNWd83mk5
         q3L2BGVo/+EDiKA01lsmakC66W9BgwVYJPPbs7dk=
Date:   Fri, 8 May 2020 03:11:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [PATCH v2 06/34] staging: vc04_services: Add new vc-sm-cma driver
Message-ID: <20200508001119.GI5838@pendragon.ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-7-laurent.pinchart@ideasonboard.com>
 <4e42a593f16614e913613150a90e851acbfcaa8c.camel@suse.de>
 <CAPY8ntB3RCwzCzj+v0QEQp19f-X7tgfhFZ_DK3-LUiWXGK0eNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntB3RCwzCzj+v0QEQp19f-X7tgfhFZ_DK3-LUiWXGK0eNA@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Wed, May 06, 2020 at 08:24:38PM +0100, Dave Stevenson wrote:
> On Wed, 6 May 2020 at 19:04, Nicolas Saenz Julienne wrote:
> > On Mon, 2020-05-04 at 12:25 +0300, Laurent Pinchart wrote:
> >> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> >>
> >> Add Broadcom VideoCore Shared Memory support.
> >>
> >> This new driver allows contiguous memory blocks to be imported
> >> into the VideoCore VPU memory map, and manages the lifetime of
> >> those objects, only releasing the source dmabuf once the VPU has
> >> confirmed it has finished with it.
> >
> > I'm still digesting all this, but a question came up, who is using the
> > ioctls?
> 
> We have a userspace library that uses it [1].
> It is used by things like MMAL to share buffers between the VPU and
> ARM, rather than having to get VCHI to copy all the data between
> mirrored buffers.
> 
> I think what has happened here is that Laurent has picked up the
> version of the driver from the top of our downstream kernel tree.
> For libcamera and the ISP driver, we need a significantly smaller
> feature set, basically import of dmabufs only, no allocations or cache
> management. For the ISP driver it's mainly dmabuf import from
> videobuf2 for the image buffers, but there's also a need to pass in
> lens shading tables which are relatively large. With a small amount of
> rework in libcamera, we can make it so that we use dma-buf heaps to do
> the allocation, and pass in a dmabuf fd to the ISP driver to then map
> onto the VPU. That removes all the ioctls handling from this driver.
> 
> Downstream we do have other use cases that want to be able to do other
> functions on shared memory, but that too should be reworkable into
> using dma-buf heaps for allocations, and vcsm only handles importing
> dmabufs via an ioctl. All that can be hidden away in the vcsm library,
> so applications don't care.
> We've also got some legacy code kicking around, as there was
> originally a version of the driver that mapped the VPU's memory blocks
> to the ARM. That's why the vcsm library has two code paths through
> almost every function - one for each driver.
> 
> Laurent: What's your view? Halt the review this particular patch for
> now and rework, or try and get this all integrated?
> Mainline obviously already has dma-buf heaps merged, whilst I have a
> PR cherry-picking it back into our downstream 5.4. The main reason it
> hasn't been merged is that I haven't had a test case to prove it
> works. The rework should be relatively simple, but will need small
> updates to both libcamera and ISP driver.

My preference would be to go for a solution based on dma-buf heap right
away for mainline, to minimize the code going into staging. There's no
hurry there, and I can help integrating the changes in libcamera if
needed.

> [1] https://github.com/raspberrypi/userland/tree/master/host_applications/linux/libs/sm
> 
> >> Driver upported from the RaspberryPi BSP at revision:
> >> 890691d1c996 ("staging: vc04_services: Fix vcsm overflow bug when
> >> counting transactions")
> >> forward ported to recent mainline kernel version.
> >>
> >> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> >> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> >> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >> ---
> >>  drivers/staging/vc04_services/Kconfig         |    2 +
> >>  drivers/staging/vc04_services/Makefile        |    1 +
> >>  .../include/linux/broadcom/vc_sm_cma_ioctl.h  |  114 ++
> >>  .../staging/vc04_services/vc-sm-cma/Kconfig   |   10 +
> >>  .../staging/vc04_services/vc-sm-cma/Makefile  |   13 +
> >>  drivers/staging/vc04_services/vc-sm-cma/TODO  |    1 +
> >>  .../staging/vc04_services/vc-sm-cma/vc_sm.c   | 1732 +++++++++++++++++
> >>  .../staging/vc04_services/vc-sm-cma/vc_sm.h   |   84 +
> >>  .../vc04_services/vc-sm-cma/vc_sm_cma_vchi.c  |  505 +++++
> >>  .../vc04_services/vc-sm-cma/vc_sm_cma_vchi.h  |   63 +
> >>  .../vc04_services/vc-sm-cma/vc_sm_defs.h      |  300 +++
> >>  .../vc04_services/vc-sm-cma/vc_sm_knl.h       |   28 +
> >>  12 files changed, 2853 insertions(+)
> >>  create mode 100644
> >> drivers/staging/vc04_services/include/linux/broadcom/vc_sm_cma_ioctl.h
> >>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/Kconfig
> >>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/Makefile
> >>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/TODO
> >>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
> >>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm.h
> >>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c
> >>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.h
> >>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_defs.h
> >>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_knl.h

-- 
Regards,

Laurent Pinchart
