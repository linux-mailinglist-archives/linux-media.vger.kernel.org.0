Return-Path: <linux-media+bounces-45756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C1EC13888
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 97BE74F2161
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769D1241691;
	Tue, 28 Oct 2025 08:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PA5YjWEI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB0D2D73AB;
	Tue, 28 Oct 2025 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761639670; cv=none; b=X/wBgx9qsDp3f2nMvRj5xnd5Chu5OkjG7o8xy8Te1leB4KBnk2DKEitXl6swydUH6f1BrYwAcJJaJXIB26kq/FYN/bN9sdSO+VwHTXtdW0t09wqc1PN65coJnaYS9Hax4CMy6IxcbtdV7IxsX7ytjFmH3kbcqsGq/85xbww1jkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761639670; c=relaxed/simple;
	bh=it5d+s+qFjiygrtw3yR/GLsBerISGax/FU8vTHZyhGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUAIqXcPKjWmZdWU9xo5CwlZb90OsEZagMYxta4CiY8TTdYgDYneT+kVBetKMGXOlgS+RtAJCWQOGnh5uxC8JANpQztaNV+JCHAKDmu0CLZCBNW+9J0XwQrulnprY/uk9mkyzabbgm5kukdNLy5NYzIanYO5OIJe9jBH54Yf2tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PA5YjWEI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 725C016CD;
	Tue, 28 Oct 2025 09:19:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761639556;
	bh=it5d+s+qFjiygrtw3yR/GLsBerISGax/FU8vTHZyhGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PA5YjWEIc1E634AtmZrZhNB7x2BtiYuUqs+pgEmkQA7VlGVK10i+/JBKsSW9ZcmRt
	 P2WRluXFHxeEUv8rCcZEt5k/jZwM3ZxYUencFIJBcdXyBtM6uyr4TyxqyK9Y3R1JIz
	 LMSUxgIQDHYn1wNp8psDJp3NWFPDQm40OZSuxZJA=
Date: Tue, 28 Oct 2025 10:20:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 03/31] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Message-ID: <20251028082051.GY13023@pendragon.ideasonboard.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-3-c9286fbb34b9@nxp.com>
 <20251027013204.GT13023@pendragon.ideasonboard.com>
 <aP+lAoHwQ5L3qmt2@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP+lAoHwQ5L3qmt2@lizhi-Precision-Tower-5810>

On Mon, Oct 27, 2025 at 12:59:46PM -0400, Frank Li wrote:
> On Mon, Oct 27, 2025 at 03:32:04AM +0200, Laurent Pinchart wrote:
> > On Thu, Aug 21, 2025 at 04:15:38PM -0400, Frank Li wrote:
> > > Add helper function media_bus_fmt_to_csi2_bpp() to get media bus fmt's bpp
> > > to reduce codes such as
> > >
> > > 	static const struct imx7_csi_pixfmt pixel_formats[] = {
> > >         {
> > >                 .fourcc = V4L2_PIX_FMT_UYVY,
> > >                 .codes  = IMX_BUS_FMTS(
> > >                         MEDIA_BUS_FMT_UYVY8_2X8,
> > >                         MEDIA_BUS_FMT_UYVY8_1X16
> > >                 ),
> > >                 .yuv    = true,
> > >                 .bpp    = 16,
> > >         },
> > > 	....
> > >
> > > .bpp can be removed from pixel_formats with this helper function.
> > >
> > > CSI2 data type is defined by MIPI Camera Serial Interface 2 Spec Ver4.1.
> > > See section 9.4.
> > >
> > > Add helper function media_bus_fmt_to_csi2_dt() to convert media bus fmt to
> > > MIPI defined data type and avoid below duplicated static array in each CSI2
> > > drivers.
> > >
> > > 	{
> > > 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> > > 		.data_type = MIPI_CSI2_DT_YUV422_8B,
> > > 	}
> > >
> > > Only add known map for dt type. Need update media_bus_fmt_info when new
> > > mapping used.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > Change in v3:
> > > - squash two help function patch to one.
> > > - use media_bus_fmt_info to do map.
> > > ---
> > >  drivers/media/v4l2-core/v4l2-common.c | 149 ++++++++++++++++++++++++++++++++++
> > >  include/media/mipi-csi2.h             |  30 +++++++
> > >  2 files changed, 179 insertions(+)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > > index a5334aa35992e5f57fb228c33d40c51fdafdc135..a75987aa5fc69d6368709b7d521bede666da9513 100644
> > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > @@ -46,6 +46,7 @@
> > >  #include <linux/uaccess.h>
> > >  #include <asm/io.h>
> > >  #include <asm/div64.h>
> > > +#include <media/mipi-csi2.h>
> > >  #include <media/v4l2-common.h>
> > >  #include <media/v4l2-device.h>
> > >  #include <media/v4l2-ctrls.h>
> > > @@ -757,3 +758,151 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> > >  	return clk_hw->clk;
> > >  }
> > >  EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
> > > +
> > > +static const struct media_bus_fmt_info media_bus_fmt_info[] = {
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB444_1X12, .bpp = 12},
> >
> > Missing space before }.
> >
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB565_1X16, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_BGR565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> >
> > Let's not specify .dt for formats that must not be used with CSI-2
> > buses.
> 
> Do you know which not used CSI-2 bus, or where I can get such information?

The discussion is ongoing, see
https://lore.kernel.org/linux-media/20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org/.

I think we can safely assume that we won't change the policy of using a
media bus code that transmits a pixel in a single sample. That means
we'll use _1X16 codes but never _2X8. For the colour components order,
we need to wait for a conclusion in the above mail thread.

> > > +	{ .fmt = MEDIA_BUS_FMT_BGR565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X18, .bpp = 18},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB666_2X9_BE, .bpp = 18},
> > > +	{ .fmt = MEDIA_BUS_FMT_BGR666_1X18, .bpp = 18},
> > > +	{ .fmt = MEDIA_BUS_FMT_RBG888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_BGR666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB565_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, .bpp = 21},
> > > +	{ .fmt = MEDIA_BUS_FMT_BGR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_BGR888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_GBR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB888_2X12_BE, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB888_2X12_LE, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB888_3X8_DELTA, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG, .bpp = 28},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA, .bpp = 28},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X30_CPADLO, .bpp = 30},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X30_CPADLO, .bpp = 30},
> > > +	{ .fmt = MEDIA_BUS_FMT_ARGB8888_1X32, .bpp = 32},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X32_PADHI, .bpp = 32},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB101010_1X30, .bpp = 30},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG, .bpp = 35},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA, .bpp = 35},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X36_CPADLO, .bpp = 36},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X36_CPADLO, .bpp = 36},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB121212_1X36, .bpp = 36},
> > > +	{ .fmt = MEDIA_BUS_FMT_RGB161616_1X48, .bpp = 48},
> > > +
> > > +	{ .fmt = MEDIA_BUS_FMT_Y8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> > > +	{ .fmt = MEDIA_BUS_FMT_UV8_1X8, .bpp = 8},
> > > +	{ .fmt = MEDIA_BUS_FMT_UYVY8_1_5X8, .bpp = 40},
> >
> > This doesn't seem correct.
> 
> I add by surfix <m>X<n>, Is my understand about <m>X<n> wrong?  or
> MEDIA_BUS_FMT_UYVY8_1_5X8 itself is wrong?


1_5X8 means 1.5 * 8.

> > > +	{ .fmt = MEDIA_BUS_FMT_VYUY8_1_5X8, .bpp = 40},
> > > +	{ .fmt = MEDIA_BUS_FMT_YUYV8_1_5X8, .bpp = 40},
> > > +	{ .fmt = MEDIA_BUS_FMT_YVYU8_1_5X8, .bpp = 40},
> > > +	{ .fmt = MEDIA_BUS_FMT_UYVY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_VYUY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_YUYV8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_YVYU8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_Y10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> > > +	{ .fmt = MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_UYVY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > > +	{ .fmt = MEDIA_BUS_FMT_VYUY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > > +	{ .fmt = MEDIA_BUS_FMT_YUYV10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > > +	{ .fmt = MEDIA_BUS_FMT_YVYU10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > > +	{ .fmt = MEDIA_BUS_FMT_Y12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> > > +	{ .fmt = MEDIA_BUS_FMT_UYVY12_2X12, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_VYUY12_2X12, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_YUYV12_2X12, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_YVYU12_2X12, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_Y14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> > > +	{ .fmt = MEDIA_BUS_FMT_Y16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_UYVY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_VYUY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_YUYV8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_YVYU8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_YDYUYDYV8_1X16, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_UYVY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > > +	{ .fmt = MEDIA_BUS_FMT_VYUY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > > +	{ .fmt = MEDIA_BUS_FMT_YUYV10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > > +	{ .fmt = MEDIA_BUS_FMT_YVYU10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > > +	{ .fmt = MEDIA_BUS_FMT_VUY8_1X24, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_YUV8_1X24, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_UYYVYY8_0_5X24, .dt = MIPI_CSI2_DT_YUV420_8B, .bpp = 120},
> > > +	{ .fmt = MEDIA_BUS_FMT_UYVY12_1X24, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_VYUY12_1X24, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_YUYV12_1X24, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_YVYU12_1X24, .bpp = 24},
> > > +	{ .fmt = MEDIA_BUS_FMT_YUV10_1X30, .bpp = 30},
> > > +	{ .fmt = MEDIA_BUS_FMT_UYYVYY10_0_5X30, .bpp = 150},
> > > +	{ .fmt = MEDIA_BUS_FMT_AYUV8_1X32, .bpp = 32},
> > > +	{ .fmt = MEDIA_BUS_FMT_UYYVYY12_0_5X36, .bpp = 180},
> > > +	{ .fmt = MEDIA_BUS_FMT_YUV12_1X36, .bpp = 36},
> > > +	{ .fmt = MEDIA_BUS_FMT_YUV16_1X48, .bpp = 48},
> > > +	{ .fmt = MEDIA_BUS_FMT_UYYVYY16_0_5X48, .bpp = 240},
> > > +
> > > +	{ .fmt = MEDIA_BUS_FMT_SBGGR8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> > > +	{ .fmt = MEDIA_BUS_FMT_SGBRG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> > > +	{ .fmt = MEDIA_BUS_FMT_SGRBG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> > > +	{ .fmt = MEDIA_BUS_FMT_SRGGB8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> > > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8, .bpp = 8},
> > > +	{ .fmt = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8, .bpp = 8},
> > > +	{ .fmt = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8, .bpp = 8},
> > > +	{ .fmt = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8, .bpp = 8},
> > > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8, .bpp = 8},
> > > +	{ .fmt = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8, .bpp = 8},
> > > +	{ .fmt = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8, .bpp = 8},
> > > +	{ .fmt = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8, .bpp = 8},
> > > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_BE, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_LE, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> > > +	{ .fmt = MEDIA_BUS_FMT_SGBRG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> > > +	{ .fmt = MEDIA_BUS_FMT_SGRBG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> > > +	{ .fmt = MEDIA_BUS_FMT_SRGGB10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> > > +	{ .fmt = MEDIA_BUS_FMT_SBGGR12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> > > +	{ .fmt = MEDIA_BUS_FMT_SGBRG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> > > +	{ .fmt = MEDIA_BUS_FMT_SGRBG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> > > +	{ .fmt = MEDIA_BUS_FMT_SRGGB12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> > > +	{ .fmt = MEDIA_BUS_FMT_SBGGR14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> > > +	{ .fmt = MEDIA_BUS_FMT_SGBRG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> > > +	{ .fmt = MEDIA_BUS_FMT_SGRBG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> > > +	{ .fmt = MEDIA_BUS_FMT_SRGGB14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> > > +	{ .fmt = MEDIA_BUS_FMT_SBGGR16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_SGBRG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_SGRBG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_SRGGB16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> > > +
> > > +	{ .fmt = MEDIA_BUS_FMT_JPEG_1X8, .bpp = 8},
> > > +
> > > +	{ .fmt = MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8, .bpp = 8},
> > > +
> > > +	{ .fmt = MEDIA_BUS_FMT_AHSV8888_1X32, .bpp = 8},
> > > +
> > > +	{ .fmt = MEDIA_BUS_FMT_META_8, .bpp = 8},
> > > +	{ .fmt = MEDIA_BUS_FMT_META_10, .bpp = 10},
> > > +	{ .fmt = MEDIA_BUS_FMT_META_12, .bpp = 12},
> > > +	{ .fmt = MEDIA_BUS_FMT_META_14, .bpp = 14},
> > > +	{ .fmt = MEDIA_BUS_FMT_META_16, .bpp = 16},
> > > +	{ .fmt = MEDIA_BUS_FMT_META_20, .bpp = 20},
> > > +	{ .fmt = MEDIA_BUS_FMT_META_24, .bpp = 24},
> > > +};
> > > +
> > > +const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt)
> > > +{
> > > +	int i;
> >
> > unsigned
> >
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(media_bus_fmt_info); i++)
> > > +		if (media_bus_fmt_info[i].fmt == bus_fmt)
> > > +			return &media_bus_fmt_info[i];
> >
> > Add curly braces for the "for" statement.
> >
> > > +
> > > +	return NULL;
> > > +}
> > > +EXPORT_SYMBOL_GPL(media_bus_fmt_info_get);
> > > diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
> > > index 40fc0264250d779ab5dfa7d2fe16e6f1382c07d4..3227d28224b7c32ef2745548391da9e792cfa559 100644
> > > --- a/include/media/mipi-csi2.h
> > > +++ b/include/media/mipi-csi2.h
> > > @@ -8,6 +8,8 @@
> > >  #ifndef _MEDIA_MIPI_CSI2_H
> > >  #define _MEDIA_MIPI_CSI2_H
> > >
> > > +/* DT value ref to MIPI Camera Serial Interface 2 Spec Ver4.1 section 9.4 */
> > > +
> > >  /* Short packet data types */
> > >  #define MIPI_CSI2_DT_FS			0x00
> > >  #define MIPI_CSI2_DT_FE			0x01
> > > @@ -44,4 +46,32 @@
> > >  #define MIPI_CSI2_DT_RAW20		0x2f
> > >  #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
> > >
> > > +/**
> > > + * struct media_bus_fmt_info - information about a media bus format
> > > + * @fmt: media bus format identifier (MEDIA_BUS_FMT_*)
> >
> > We usually name this "code".
> >
> > > + * @dt: data type define in MIPI spec (MIPI_CSI2_DT *)
> > > + * @bpp: bit width per pixel
> >
> > You will need to define this much more precisely. In particular, how is
> > padding handled ? How about compressed formats such as JPEG ? How about
> > the LVDS formats, how are the control bits accounted for ?
> >
> > I understand you're trying to share code between two drivers, but I'm
> > not sure we will be able to come up with a standard definition of bpp
> > that will match the needs of all drivers. It feels that this information
> > would be better stored in driver-specific tables.
> 
> 80% is duplicated codes if stored in driver-specific tables. If driver use
> difference defination, they can create customerized table. This one at
> least cover more than 80% case.

In that case we need a clear and precise definition of the 'bpp' field.

> > > + */
> > > +struct media_bus_fmt_info {
> > > +	u32 fmt;
> > > +	u32 dt;
> > > +	u8 bpp;
> > > +};
> > > +
> > > +const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt);
> > > +
> > > +static inline int media_bus_fmt_to_csi2_dt(int bus_fmt)
> > > +{
> > > +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> > > +
> > > +	return info ? info->dt : 0;
> > > +}
> > > +
> > > +static inline int media_bus_fmt_to_csi2_bpp(int bus_fmt)
> > > +{
> > > +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> > > +
> > > +	return info ? info->bpp : 0;
> > > +}
> > > +
> >
> > These are not specific to CSI-2, they belong to a different header.
> > v4l2-common.h is an option, given that the implementation goes to
> > v4l2-common.c.
> >
> > >  #endif /* _MEDIA_MIPI_CSI2_H */
> > >
> > >

-- 
Regards,

Laurent Pinchart

