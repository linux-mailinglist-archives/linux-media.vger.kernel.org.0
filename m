Return-Path: <linux-media+bounces-38482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 770FCB1235C
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 19:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 653D6189398E
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 17:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF71E2EFDBE;
	Fri, 25 Jul 2025 17:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GUoipYeI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B8248CFC;
	Fri, 25 Jul 2025 17:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753466242; cv=none; b=INne48bsPD12/5Jior8Oull0yhQJs4htW4y318YpozR214F9kUY/O1ghI5SrZoAMyvkZ2Ea4djoxdgGZXIgsptfnrhH6INOZysE1ZiNUCcP7p4BLMXF+zpna0r8uFlCFk9T4JBjzDeDVFl/pnPcO8x+uITfd99ayAMUoCUczLQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753466242; c=relaxed/simple;
	bh=5ldzZ9vyLUpLw7BH0/+el75YcJaK4n9pqdRVPuEkdaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXVEX6nQkbYZb2kG+SOusgIwiGuwF/Bd2EHu+2/8E2SRrEG1d7Ys5VIa43a+okXxZHbhPnwD8G8zqU4oKpXRZdtTSDqr+jPzZ3HcUDI+LgtNUTFewddpEsejBoHh/oXR3QQyPXstOGtbd7LrcK9EB+KxQIuIhizHDPK0QAPhxzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GUoipYeI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0FEA0C66;
	Fri, 25 Jul 2025 19:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753466197;
	bh=5ldzZ9vyLUpLw7BH0/+el75YcJaK4n9pqdRVPuEkdaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GUoipYeI4r5hxShSrw8p3pKpANuUknHdeOB6tf2trLpU50/AJJHr2gSz0BvuCacl0
	 0ntiCKiiL74GFeFu/Ve3GUvIUxwe9JPu+bCOJCB4aVY3Ls/b3dDYN3wABpEzw/GBgk
	 YM80nWbUZ6egMPhVsFIE1V0L1aIEyGQr47DuN5Yo=
Date: Fri, 25 Jul 2025 20:57:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>,
	Zhipeng Wang <zhipeng.wang_1@nxp.com>
Subject: Re: [PATCH v3 2/4] media: nxp: add V4L2 subdev driver for camera
 parallel interface (CPI)
Message-ID: <20250725175711.GA27425@pendragon.ideasonboard.com>
References: <20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com>
 <20250708-imx8qxp_pcam-v3-2-c8533e405df1@nxp.com>
 <20250725000404.GW11202@pendragon.ideasonboard.com>
 <aIOk9W/RBKmS8uVQ@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aIOk9W/RBKmS8uVQ@lizhi-Precision-Tower-5810>

On Fri, Jul 25, 2025 at 11:38:29AM -0400, Frank Li wrote:
> On Fri, Jul 25, 2025 at 03:04:04AM +0300, Laurent Pinchart wrote:
> > Hi Frank,
> >
> > Thank you for the patch.
> >
> > On Tue, Jul 08, 2025 at 01:48:43PM -0400, Frank Li via B4 Relay wrote:
> > > From: Alice Yuan <alice.yuan@nxp.com>
> > >
> > > Add a V4L2 sub-device driver for the CPI controller found on i.MX8QXP,
> > > i.MX8QM, and i.MX93 SoCs. This controller supports parallel camera sensors
> > > and enables image data capture through a parallel interface.
> > >
> > > Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> > > Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> > > Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > change in v3
> > > - replace csi with cpi
> > > - use __free(fwnode_handle) to simpilfy code
> > > - remove imx91 driver data, which is the same as imx93
> > >
> > > change in v2
> > > - remove MODULE_ALIAS
> > > - use devm_pm_runtime_enable() and cleanup remove function
> > > - change output format to 1x16. controller convert 2x8 to 1x16 format
> > > ---
> > >  MAINTAINERS                                   |   1 +
> > >  drivers/media/platform/nxp/Kconfig            |  11 +
> > >  drivers/media/platform/nxp/Makefile           |   1 +
> > >  drivers/media/platform/nxp/imx-parallel-cpi.c | 920 ++++++++++++++++++++++++++
> > >  4 files changed, 933 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 8ae0667d2bb41fb6a1549bd3b2b33f326cbd1303..14842a3b860a6f23846f12a684eedcbb9eb69e19 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15112,6 +15112,7 @@ F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > >  F:	drivers/media/platform/nxp/imx-mipi-csis.c
> > > +F:	drivers/media/platform/nxp/imx-parallel-cpi.c
> > >  F:	drivers/media/platform/nxp/imx7-media-csi.c
> > >  F:	drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > >
> > > diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> > > index 40e3436669e213fdc5da70821dc0b420e1821f4f..504ae1c6494f331c16124a224421ac7acd433ba5 100644
> > > --- a/drivers/media/platform/nxp/Kconfig
> > > +++ b/drivers/media/platform/nxp/Kconfig
> > > @@ -39,6 +39,17 @@ config VIDEO_IMX_MIPI_CSIS
> > >  	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
> > >  	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
> > >
> > > +config VIDEO_IMX_PARALLEL_CPI
> > > +	tristate "NXP i.MX9/i.MX8 Parallel CPI Driver"
> >
> > I'd write it in numerical order, "i.MX8/i.MX9"
> >
> > > +	depends on ARCH_MXC || COMPILE_TEST
> > > +	depends on VIDEO_DEV
> > > +	select MEDIA_CONTROLLER
> > > +	select V4L2_FWNODE
> > > +	select VIDEO_V4L2_SUBDEV_API
> > > +	help
> > > +	  Video4Linux2 sub-device driver for PARALLEL CPI receiver found
> > > +	  on some iMX8 and iMX9 SoCs.
> > > +
> > >  source "drivers/media/platform/nxp/imx8-isi/Kconfig"
> > >
> > >  # mem2mem drivers
> > > diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
> > > index 4d90eb71365259ebdda84ea58483e1c4131d3ac7..5346919d2f1083b51ec99b66981c5d38b3df960c 100644
> > > --- a/drivers/media/platform/nxp/Makefile
> > > +++ b/drivers/media/platform/nxp/Makefile
> > > @@ -7,5 +7,6 @@ obj-y += imx8-isi/
> > >  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
> > >  obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
> > >  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
> > > +obj-$(CONFIG_VIDEO_IMX_PARALLEL_CPI) += imx-parallel-cpi.o
> > >  obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
> > >  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
> > > diff --git a/drivers/media/platform/nxp/imx-parallel-cpi.c b/drivers/media/platform/nxp/imx-parallel-cpi.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..718f02bf70c4d0ae74ecf842c1ecb1a1afbcdd45
> > > --- /dev/null
> > > +++ b/drivers/media/platform/nxp/imx-parallel-cpi.c
> > > @@ -0,0 +1,920 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * i.MX Parallel CPI receiver driver.
> > > + *
> > > + * Copyright 2019-2025 NXP
> > > + *
> > > + */
> > > +
> > > +#include <linux/bits.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/debugfs.h>
> >
> > I don't think you use this.
> >
> > > +#include <linux/delay.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/interrupt.h>
> >
> > I don't think you use this either.
> >
> > > +#include <linux/io.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/mfd/syscon.h>
> >
> > Alphabetical order please.
> >
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_domain.h>
> >
> > This doesn't seem needed.
> >
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <linux/reset.h>
> >
> > Same here.
> >
> > > +#include <linux/spinlock.h>
> >
> > And here. Please verify all headers, drop the ones you don't need, and
> > add any you may have forgotten. That includes the media/ headers.
> 
> Do you have good method to check it?

There are tools such as include-what-you-use, but I haven't tested that
one with the kernel.

> > > +
> > > +#include <media/v4l2-common.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-event.h>
> > > +#include <media/v4l2-fwnode.h>
> > > +#include <media/v4l2-mc.h>
> > > +#include <media/v4l2-subdev.h>
> 
> ...
> 
> > > +
> > > +	/* Software Reset */
> > > +	imx_cpi_sw_reset(pcpidev);
> > > +
> > > +	/* Config PL Data Type */
> > > +	val = readl(pcpidev->regs + pdata->if_ctrl_reg);
> > > +	val |= IF_CTRL_REG_DATA_TYPE(DATA_TYPE_OUT_YUV444);
> >
> > Don't you need to clear the field first ? Same everywhere else where
> > applicable.
> 
> imx_cpi_sw_reset() clean all register.

OK. I wonder if you could then replace some (most ? all ?) of the
read-update-write sequences with plain writes.

> > > +	writel(val, pcpidev->regs + pdata->if_ctrl_reg);
> > > +
> > > +	/* Enable sync Force */
> > > +	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
> > > +	val |= (CPI_CTRL_REG_HSYNC_FORCE_EN | CPI_CTRL_REG_VSYNC_FORCE_EN);
> > > +	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
> 
> ....

-- 
Regards,

Laurent Pinchart

