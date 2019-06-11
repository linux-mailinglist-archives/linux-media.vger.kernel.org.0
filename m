Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4B03CA76
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 13:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389558AbfFKLze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 07:55:34 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49423 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389499AbfFKLze (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 07:55:34 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hafND-0007Sn-KS; Tue, 11 Jun 2019 13:55:31 +0200
Message-ID: <1560254131.13886.9.camel@pengutronix.de>
Subject: Re: [PATCH v3 08/10] media: hantro: add initial i.MX8MQ support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Date:   Tue, 11 Jun 2019 13:55:31 +0200
In-Reply-To: <93cad5e2-12ef-10e2-e18f-4c22a82d3b04@xs4all.nl>
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
         <20190531085523.10892-9-p.zabel@pengutronix.de>
         <cfabcdc7-baff-82d8-2b24-5a18a9c50441@xs4all.nl>
         <20190603220256.1922901a@collabora.com>
         <93cad5e2-12ef-10e2-e18f-4c22a82d3b04@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2019-06-04 at 12:42 +0200, Hans Verkuil wrote:
> On 6/3/19 10:02 PM, Boris Brezillon wrote:
> > On Mon, 3 Jun 2019 14:45:37 +0200
> > Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > 
> > > On 5/31/19 10:55 AM, Philipp Zabel wrote:
> > > > For now this just enables MPEG-2 decoding on the Hantro G1 on i.MX8MQ.
> > > > 
> > > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > ---
> > > > Changes since v2 [1]:
> > > >  - Adapted to changes in patches 4 and 5
> > > > 
> > > > [1] https://patchwork.linuxtv.org/patch/56420/
> > > > ---
> > > >  drivers/staging/media/hantro/Kconfig        |   8 +-
> > > >  drivers/staging/media/hantro/Makefile       |   1 +
> > > >  drivers/staging/media/hantro/hantro_drv.c   |   1 +
> > > >  drivers/staging/media/hantro/hantro_hw.h    |   1 +
> > > >  drivers/staging/media/hantro/imx8m_vpu_hw.c | 171 ++++++++++++++++++++
> > > >  5 files changed, 178 insertions(+), 4 deletions(-)
> > > >  create mode 100644 drivers/staging/media/hantro/imx8m_vpu_hw.c
> > > > 
> > > > diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
> > > > index 660cca358f04..6fdb72df7bd3 100644
> > > > --- a/drivers/staging/media/hantro/Kconfig
> > > > +++ b/drivers/staging/media/hantro/Kconfig
> > > > @@ -1,15 +1,15 @@
> > > >  # SPDX-License-Identifier: GPL-2.0
> > > >  config VIDEO_HANTRO
> > > >  	tristate "Hantro VPU driver"
> > > > -	depends on ARCH_ROCKCHIP || COMPILE_TEST
> > > > +	depends on ARCH_MXC || ARCH_ROCKCHIP || COMPILE_TEST
> > > >  	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > >  	depends on MEDIA_CONTROLLER_REQUEST_API
> > > >  	select VIDEOBUF2_DMA_CONTIG
> > > >  	select VIDEOBUF2_VMALLOC
> > > >  	select V4L2_MEM2MEM_DEV
> > > >  	help
> > > > -	  Support for the Hantro IP based Video Processing Unit present on
> > > > -	  Rockchip SoC, which accelerates video and image encoding and
> > > > -	  decoding.
> > > > +	  Support for the Hantro IP based Video Processing Units present on
> > > > +	  Rockchip and NXP i.MX8M SoCs, which accelerate video and image
> > > > +	  encoding and decoding.
> > > >  	  To compile this driver as a module, choose M here: the module
> > > >  	  will be called hantro-vpu.
> > > > diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
> > > > index 14f17a4e48cb..1dac16af451e 100644
> > > > --- a/drivers/staging/media/hantro/Makefile
> > > > +++ b/drivers/staging/media/hantro/Makefile
> > > > @@ -9,5 +9,6 @@ hantro-vpu-y += \
> > > >  		rk3399_vpu_hw.o \
> > > >  		rk3399_vpu_hw_jpeg_enc.o \
> > > >  		rk3399_vpu_hw_mpeg2_dec.o \
> > > > +		imx8m_vpu_hw.o \
> > > >  		hantro_jpeg.o \
> > > >  		hantro_mpeg2.o  
> > > 
> > > I'm a bit concerned about how this is organized. As far as I can tell,
> > > enabling this driver would compile both rockchip and imx8 code into the
> > > same driver. You would expect that only the code for the selected
> > > architectures would be compiled in (or all if COMPILE_TEST is set, of course).
> > > 
> > > Can you take a look at this?
> > 
> > Shouldn't be hard to do:
> > 
> > config VIDEO_HANTRO
> > 	tristate "Hantro VPU driver"
> > 	...
> > 
> > config VIDEO_HANTRO_ROCKCHIP
> > 	bool "Rockchip Hantro VPU driver"
> > 	depends on ARCH_ROCKCHIP || COMPILE_TEST
> > 	depends on VIDEO_HANTRO
> > 	...
> > 
> > config VIDEO_HANTRO_IMX8
> > 	bool "IMX8 Hantro VPU driver"
> > 	depends on ARCH_IMX || COMPILE_TEST
> > 	depends on VIDEO_HANTRO
> > 	...
> > 
> > hantro-vpu-$(VIDEO_HANTRO_RK3288)	+= rkxxxx...
> > hantro-vpu-$(VIDEO_HANTRO_IMX8)		+= imx8...
> > 
> > and a couple of #ifdef in rockchip_vpu_drv.c.
> > 
> > This being said, I think most of the code in the SoC specific files
> > could be shared if we find a way to abstract the reg layout (using
> > regmap/reg_field?), leaving a small amount of SoC-specific code, so I'm
> > not sure it's a big deal if have support for all SoCs compiled in. What
> > could be a problem though is if each SoC starts pulling its own set of
> > dependencies.
> > 
> 
> I'd rather we do this right from the start. It's easy enough to implement,
> and it is cleaner this way.

I'm not sure the size difference is worth the additional Kconfig
options, but I'll add them and see.

regards
Philipp
