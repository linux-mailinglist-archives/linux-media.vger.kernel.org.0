Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40ED8DB2C9
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 18:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503030AbfJQQus convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 17 Oct 2019 12:50:48 -0400
Received: from mailoutvs8.siol.net ([185.57.226.199]:55111 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2394336AbfJQQus (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 12:50:48 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 30B93521752;
        Thu, 17 Oct 2019 18:50:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ctlfp8DRqJtw; Thu, 17 Oct 2019 18:50:43 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id AAB075217B6;
        Thu, 17 Oct 2019 18:50:43 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id D71F4521752;
        Thu, 17 Oct 2019 18:50:42 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
        mark.rutland@arm.com, mchehab@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 5/6] media: sun4i: Add H3 deinterlace driver
Date:   Thu, 17 Oct 2019 18:50:42 +0200
Message-ID: <1811024.Ag6lDGI2hk@jernej-laptop>
In-Reply-To: <d768b2bc-a942-03a6-253d-4bcc31f1b11e@xs4all.nl>
References: <20191016192807.1278987-1-jernej.skrabec@siol.net> <20191016192807.1278987-6-jernej.skrabec@siol.net> <d768b2bc-a942-03a6-253d-4bcc31f1b11e@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne četrtek, 17. oktober 2019 ob 09:51:28 CEST je Hans Verkuil napisal(a):
> On 10/16/19 9:28 PM, Jernej Skrabec wrote:
> > Allwinner H3 SoC contains deinterlace unit, which has several modes of
> > operation - bypass, weave, bob and mixed (advanced) mode. I don't know
> > how mixed mode works, but according to Allwinner it gives best results,
> > so they use it exclusively. Currently this mode is also hardcoded here.
> > 
> > For each interleaved frame queued, this driver produces 2 deinterlaced
> > frames. Deinterlaced frames are based on 2 consequtive output buffers,
> > except for the first 2, where same output buffer is given to peripheral
> > as current and previous.
> > 
> > There is no documentation for this core, so register layout and fixed
> > values were taken from BSP driver.
> > 
> > I'm not sure if maximum size of the image unit is capable to process is
> > governed by size of "flag" buffers, frequency or it really is some HW
> > limitation. Currently driver can process full HD image in ~15ms (7.5ms
> > for each capture buffer), which allows to process 1920x1080@60i video
> > smoothly in real time.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> > 
> >  MAINTAINERS                                   |    7 +
> >  drivers/media/platform/sunxi/Kconfig          |    1 +
> >  drivers/media/platform/sunxi/Makefile         |    1 +
> >  drivers/media/platform/sunxi/sun8i-di/Kconfig |   11 +
> >  .../media/platform/sunxi/sun8i-di/Makefile    |    2 +
> >  .../media/platform/sunxi/sun8i-di/sun8i-di.c  | 1020 +++++++++++++++++
> >  .../media/platform/sunxi/sun8i-di/sun8i-di.h  |  237 ++++
> >  7 files changed, 1279 insertions(+)
> >  create mode 100644 drivers/media/platform/sunxi/sun8i-di/Kconfig
> >  create mode 100644 drivers/media/platform/sunxi/sun8i-di/Makefile
> >  create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> >  create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c7b48525822a..c375455125fb 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4646,6 +4646,13 @@ M:	"Maciej W. Rozycki" <macro@linux-mips.org>
> > 
> >  S:	Maintained
> >  F:	drivers/net/fddi/defxx.*
> > 
> > +DEINTERLACE DRIVERS FOR ALLWINNER H3
> > +M:	Jernej Skrabec <jernej.skrabec@siol.net>
> > +L:	linux-media@vger.kernel.org
> > +T:	git git://linuxtv.org/media_tree.git
> > +S:	Maintained
> > +F:	drivers/media/platform/sunxi/sun8i-di/
> > +
> > 
> >  DELL SMBIOS DRIVER
> >  M:	Pali Rohár <pali.rohar@gmail.com>
> >  M:	Mario Limonciello <mario.limonciello@dell.com>
> > 
> > diff --git a/drivers/media/platform/sunxi/Kconfig
> > b/drivers/media/platform/sunxi/Kconfig index 71808e93ac2e..d7a5621bf327
> > 100644
> > --- a/drivers/media/platform/sunxi/Kconfig
> > +++ b/drivers/media/platform/sunxi/Kconfig
> > @@ -1,2 +1,3 @@
> > 
> >  source "drivers/media/platform/sunxi/sun4i-csi/Kconfig"
> >  source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
> > 
> > +source "drivers/media/platform/sunxi/sun8i-di/Kconfig"
> 
> This is a m2m driver, so this belongs in drivers/media/platform/Kconfig in
> the Memory-to-memory section.
> 
> > diff --git a/drivers/media/platform/sunxi/Makefile
> > b/drivers/media/platform/sunxi/Makefile index a05127529006..3878cb4efdc2
> > 100644
> > --- a/drivers/media/platform/sunxi/Makefile
> > +++ b/drivers/media/platform/sunxi/Makefile
> > @@ -1,2 +1,3 @@
> > 
> >  obj-y		+= sun4i-csi/
> >  obj-y		+= sun6i-csi/
> > 
> > +obj-y		+= sun8i-di/
> > diff --git a/drivers/media/platform/sunxi/sun8i-di/Kconfig
> > b/drivers/media/platform/sunxi/sun8i-di/Kconfig new file mode 100644
> > index 000000000000..dbd77a61e3b3
> > --- /dev/null
> > +++ b/drivers/media/platform/sunxi/sun8i-di/Kconfig
> > @@ -0,0 +1,11 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config VIDEO_SUN8I_DEINTERLACE
> > +	tristate "Allwinner Deinterlace driver"
> > +	depends on VIDEO_DEV && VIDEO_V4L2
> > +	depends on HAS_DMA
> > +	depends on OF
> > +	depends on PM
> > +	select VIDEOBUF2_DMA_CONTIG
> > +	select V4L2_MEM2MEM_DEV
> > +	help
> > +	   Support for the Allwinner Deinterlace unit found on some SoCs.
> 
> Shouldn't this depend on ARCH_SUNXI || COMPILE_TEST?
> And also on COMMON_CLK?

Yes to both. Also I don't see a reason why it would depend on HAS_DMA, so I 
will remove that.

Best regards,
Jernej

> 
> Regards,
> 
> 	Hans




