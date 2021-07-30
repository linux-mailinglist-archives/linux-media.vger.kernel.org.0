Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9DA3DBD56
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 18:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbhG3QvE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 12:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbhG3QvC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 12:51:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6EAC06175F;
        Fri, 30 Jul 2021 09:50:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8E1C2A3;
        Fri, 30 Jul 2021 18:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627663855;
        bh=qu530mp2hGZEeKcYHqsAqEzs4BaoXP8nEK4urmbpg2U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O4VFyMZYs5gmTADz9LZU7rEV1WUoRK13p7oAJG1EH7cYMJlbn0Ix5fDBKfrpc4TH7
         agNCIAVHowcIWT06Cku0fXm42sQWdNCLMMk3ZYuUapeoFw7tX6I8k+EajiB4P8vS8C
         SH3h5kIqe7TULeYedFjqDLKczcMoq+YbxnKnBwvg=
Date:   Fri, 30 Jul 2021 19:50:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] media: vimc: Add support for contiguous DMA buffers
Message-ID: <YQQt57eOq6mETHPW@pendragon.ideasonboard.com>
References: <20210730001939.30769-1-laurent.pinchart+renesas@ideasonboard.com>
 <40a1fed8-456e-97c5-9aa7-715a4a4c816b@collabora.com>
 <CAAEAJfAv_yVUFQm7NYas46nXUQpBS1=3iuiJC+-bCTm5+AJCKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAAEAJfAv_yVUFQm7NYas46nXUQpBS1=3iuiJC+-bCTm5+AJCKg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Fri, Jul 30, 2021 at 01:13:20PM -0300, Ezequiel Garcia wrote:
> On Fri, 30 Jul 2021 at 09:35, Dafna Hirschfeld wrote:
> > On 30.07.21 02:19, Laurent Pinchart wrote:
> > > The vimc driver is used for testing purpose, and some test use cases
> > > involve sharing buffers with a consumer device. Consumers often require
> > > DMA contiguous memory, which vimc doesn't currently support. This leads
> > > in the best case to usage of bounce buffers, which is very slow, and in
> > > the worst case in a complete failure.
> > >
> > > Add support for the dma-contig allocator in vimc to support those use
> > > cases properly. The allocator is selected through a new "allocator"
> > > module parameter, which defaults to vmalloc.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >   drivers/media/test-drivers/vimc/vimc-capture.c |  9 +++++++--
> > >   drivers/media/test-drivers/vimc/vimc-common.h  |  2 ++
> > >   drivers/media/test-drivers/vimc/vimc-core.c    | 10 ++++++++++
> > >   3 files changed, 19 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
> > > index 5e9fd902cd37..92b69a6529fb 100644
> > > --- a/drivers/media/test-drivers/vimc/vimc-capture.c
> > > +++ b/drivers/media/test-drivers/vimc/vimc-capture.c
> > > @@ -7,6 +7,7 @@
> > >
> > >   #include <media/v4l2-ioctl.h>
> > >   #include <media/videobuf2-core.h>
> > > +#include <media/videobuf2-dma-contig.h>
> > >   #include <media/videobuf2-vmalloc.h>
> > >
> > >   #include "vimc-common.h"
> > > @@ -423,14 +424,18 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
> > >       /* Initialize the vb2 queue */
> > >       q = &vcap->queue;
> > >       q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> > > -     q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> > > +     q->io_modes = VB2_MMAP | VB2_DMABUF;
> >
> > maybe to be on the safe side VB2_DMABUF should be set only if vimc_allocator==1 ?
> >
> > > +     if (vimc_allocator != 1)
> >
> > maybe define a macro instead of `1` ?
> 
> This is maybe an overkill, but you can make the parameter accept strings
> instead of integers, which makes it "modprobe vimc allocator=vmalloc",
> and improves a bit user-friendlyness.
> 
> See drivers/media/pci/tw686x/tw686x-core.c.
> 
> For a test driver, it is worth the trouble, maybe?

I copied the values from vivid, which uses an array of integers. As vimc
needs a single parameter only, a string could make more sense. I'll
submit a v3 with a string if there's a consensus for that.

-- 
Regards,

Laurent Pinchart
