Return-Path: <linux-media+bounces-11901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B18C8CF742
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 03:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A66B5B20E7C
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 01:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233721854;
	Mon, 27 May 2024 01:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MfYkNk7r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19341FBA
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 01:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716772773; cv=none; b=ayA0rlnm4G5Uq5tjheUPUXYaTdaJyecDO7twvj4rr1XIkbTttsE+VcSKvQ2sKAcbBnO3vpd39RJ+qvWioS7ZSUVJRc6Vb4CnsLWYkCw8SzX/aRHvZY81mtKff+EptkZ1DbjL8guxpCaZBvsH702TkhuVagXFGk84nHeA6v5cZBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716772773; c=relaxed/simple;
	bh=Nw9zBtXPrL0SFwDtoKxV31ELQ6/HGYqHFv70s/mLiXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bt2PussVvKVyhEIDivRYtzYosJDIBkFpA/Yd7Bv1qXW99D3v8acR9R6mpRbMD7LnN5RMTHdpXb9sU4dcM0B7FKu99p+EjKH6qWCNzbaWMmFF01xec/pUyh69ts4vIhzj9smUtTT/aC2wJ21qtnGqHKhGhAaAoqFZLzHX1yMYcPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MfYkNk7r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 942548E0;
	Mon, 27 May 2024 03:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716772760;
	bh=Nw9zBtXPrL0SFwDtoKxV31ELQ6/HGYqHFv70s/mLiXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MfYkNk7rIDmjvtg1L9s5qwprqq7H5cwx9cY77PU4QNENGqZmNuNI09ZA2/yiUE406
	 RoY25SbwbiRB50UXt/0Jt4zRe87rOpAdWSeqr1TLf55wOE6th4pTCDgzBXksAZIjn2
	 WQdbNEZA3yvC5cvWVFmG/2yc8weVI5xkmAneq9Lg=
Date: Mon, 27 May 2024 04:19:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v7 7/8] media: raspberrypi: Add support for PiSP BE
Message-ID: <20240527011911.GD24374@pendragon.ideasonboard.com>
References: <20240524140024.161313-1-jacopo.mondi@ideasonboard.com>
 <20240524140024.161313-8-jacopo.mondi@ideasonboard.com>
 <ZlOimSRFNNt1fdN3@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZlOimSRFNNt1fdN3@valkosipuli.retiisi.eu>

Hi Sakari,

On Sun, May 26, 2024 at 08:59:05PM +0000, Sakari Ailus wrote:
> Hi Jacppo,
> 
> Thanks for the update.
> 
> A few comments on the driver itself...
> 
> On Fri, May 24, 2024 at 04:00:22PM +0200, Jacopo Mondi wrote:
> > From: Naushir Patuck <naush@raspberrypi.com>
> > 
> > Add support for the Raspberry Pi PiSP Back End.
> > 
> > The driver has been upported from the Raspberry Pi kernel at revision
> > f74893f8a0c2 ("drivers: media: pisp_be: Update seqeuence numbers of the
> > buffers").
> > 
> > The ISP documentation is available at:
> > https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> > 
> > Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Signed-off-by: Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  MAINTAINERS                                   |    1 +
> >  drivers/media/platform/Kconfig                |    1 +
> >  drivers/media/platform/Makefile               |    1 +
> >  drivers/media/platform/raspberrypi/Kconfig    |    5 +
> >  drivers/media/platform/raspberrypi/Makefile   |    3 +
> >  .../platform/raspberrypi/pisp_be/Kconfig      |   12 +
> >  .../platform/raspberrypi/pisp_be/Makefile     |    6 +
> >  .../platform/raspberrypi/pisp_be/pisp_be.c    | 1848 +++++++++++++++++
> >  .../raspberrypi/pisp_be/pisp_be_formats.h     |  519 +++++
> >  9 files changed, 2396 insertions(+)
> >  create mode 100644 drivers/media/platform/raspberrypi/Kconfig
> >  create mode 100644 drivers/media/platform/raspberrypi/Makefile
> >  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Kconfig
> >  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Makefile
> >  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> >  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h

[snip]

> > diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > new file mode 100644
> > index 000000000000..c4d13462eb81
> > --- /dev/null
> > +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > @@ -0,0 +1,1848 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * PiSP Back End driver.
> > + * Copyright (c) 2021-2024 Raspberry Pi Limited.
> > + *
> > + */
> > +#include <linux/clk.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/lockdep.h>
> > +#include <linux/media/raspberrypi/pisp_be_config.h>
> 
> Where is the header included from? If it's just this driver, then I'd put
> it in the driver's directory.
> 
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +#include <media/videobuf2-vmalloc.h>
> > +
> > +#include "pisp_be_formats.h"
> > +
> > +/* Maximum number of config buffers possible */
> > +#define PISP_BE_NUM_CONFIG_BUFFERS VB2_MAX_FRAME
> > +
> > +/*
> > + * We want to support 2 independent instances allowing 2 simultaneous users
> > + * of the ISP-BE (of course they share hardware, platform resources and mutex).
> > + * Each such instance comprises a group of device nodes representing input
> > + * and output queues, and a media controller device node to describe them.
> > + */
> > +#define PISPBE_NUM_NODE_GROUPS 2
> 
> While MC and V4L2 don't have a good support for contexts currently, just
> duplicating the device nodes is a really poor solution. We should do better
> than that. If we merge this, where is the limit in the number of contexts?
> Is it 4? 8? Or when we run out of minor numbers?
> 
> One API-based solution could be moving the IOCTL interface to MC device
> node only. This wouldn't be a small change so I'm not proposing doing that
> now.

I think we could also use the request API. It is a bit more cumbersome
to use from a userspace point of view, but this driver is meant to be
used from libcamera, so we can isolate applications from the extra
burden.

We will need to add support for formats in the request API (or rather
for requests in the format ioctls).

From a kernel point of view, the helpers used by the codec drivers may
not be suitable for ISP drivers, but I don't think it would be very
difficult to implement other helpers is needed, isolating the ISP driver
from the complexity of the request API.

This doesn't preclude developing a better userspace API with ioctls on
the MC device node only at a later point. If the above-mentioned kernel
helpers are done right, transitioning to a new userspace API will have
minimal impact on drivers.

> The two short term alternatives I can think of are:
> 
> - Merge the driver with one set of device nodes. Once the better APIs are
>   available, move to use those.

That could be a suitable short term option. It would allow merging the
userspace code in libcamera, which I would really like to do sooner than
later.

> - Merge the driver to the staging tree. I'm not very eager to go this route
>   as the drivers simply end up being abandoned in the staging tree. Work to
>   get the driver out of staging should continue.

I don't like this option. Regardless of whether this particular driver
would end up bit-rotting in drivers/staging/ or not (I do agree most
drivers do, we should discuss the IPU3 ImgU driver at some point), I
think the code quality is suitable for drivers/media/.

> Perhaps the upside here is that this isn't the only device that would
> benefit from better context support in MC/V4L2 so multiple parties have
> incentives to have this matter addressed.

[snip]

-- 
Regards,

Laurent Pinchart

