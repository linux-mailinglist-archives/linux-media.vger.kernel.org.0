Return-Path: <linux-media+bounces-35925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBB6AE9584
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 08:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A35965A6BE2
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 06:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70B5221F1F;
	Thu, 26 Jun 2025 06:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T48MoJZd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176CF1A0BF1;
	Thu, 26 Jun 2025 06:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750917631; cv=none; b=V2wUmA8uMUPxZm9q8cRYKWv0t/VoXk9dQJ1xl4on4h0IpPydwoa6pkO13hp05x6nnU6xakKPHe8hf57sGGzVQ7jOu0PuTz+8x4S5KXwNE2dxeCxcC3jpYehNt8YAGggk/LRzyxZnBwrZHBW+K3xZ/rNqc56FnpMK9FXfrke3Nm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750917631; c=relaxed/simple;
	bh=1IC3NED1WmJ6zM0ZcQYiI5Mq35crc/Becc3EighbXJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E43gz8bGJtE3rBFY2OYQTKHcHKHBIEHrgcaI8HbsIYVfms73bAxAvC0cs3K6S9/8jRpNmW0+AXPaVO4Pspa1Y70zH2R0T50JBL3mWgikZXGT0hg5NOdhQmMjN1aS3HXWM9gOrNA1aDbWUkWusD3hY1j2XF4czQdRFEYxnpUhv70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T48MoJZd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750917629; x=1782453629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1IC3NED1WmJ6zM0ZcQYiI5Mq35crc/Becc3EighbXJI=;
  b=T48MoJZdm4k8RkurSrNf+cB1PHChVcddCBczkyq8NDzRSAZG6p5UER1v
   5Ak5iaQm7BHadJjquKWJb1NxjB7IZgGth+zNqHgW3+ITQjF/J7RjyZXk+
   od8SSN5p2xtEAaH5I1gVZQp9PBVAAdMHub28I0U8v+67df4kbdyRbWCiE
   wXHRiuZW/On0XjNmXSi2jo8llcvwzlglNveVaZiWPIxMOA8j0DYBNRm0/
   kj4xdus/sRKvzUmJsiBDqSXlUPoOfQ2+I7Lq4saBHiu4zQM8j1HX1spTi
   tP7kOnBzJbizMyEv5iSEZtEDencwTQR8ue7nsQjD+/yMdWZJGNutQKI8D
   w==;
X-CSE-ConnectionGUID: 6fZpEDDaSzySxhvf3TPtIg==
X-CSE-MsgGUID: qYfUIelFTZm8/jnYY2RD5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64634368"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="64634368"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 23:00:29 -0700
X-CSE-ConnectionGUID: pD4mn+nNQvqXmeMi+AqS5Q==
X-CSE-MsgGUID: tlO3YhIzTKOYRk+fD2DkRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="152540140"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.122])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 23:00:25 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CC73911FB5F;
	Thu, 26 Jun 2025 09:00:22 +0300 (EEST)
Date: Thu, 26 Jun 2025 06:00:22 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Devarsh Thakkar <devarsht@ti.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: cadence: cdns-csi2rx: Support multiple
 pixels per clock cycle
Message-ID: <aFzh9jF0ZgODThJF@kekkonen.localdomain>
References: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
 <20250410-probe_fixes-v2-5-801bc6eebdea@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-probe_fixes-v2-5-801bc6eebdea@ideasonboard.com>

Hi Jai,

Thanks for the patchset.

On Thu, Apr 10, 2025 at 12:19:03PM +0530, Jai Luthra wrote:
> The output pixel interface is a parallel bus (32 bits), which
> supports sending multiple pixels (1, 2 or 4) per clock cycle for
> smaller pixel widths like RAW8-RAW16.
> 
> Dual-pixel and Quad-pixel modes can be a requirement if the export rate
> of the Cadence IP in Single-pixel mode maxes out before the maximum
> supported DPHY-RX frequency, which is the case with TI's integration of
> this IP [1].
> 
> So, we export a function that lets the downstream hardware block request
> a higher pixel-per-clock on a particular output pad.
> 
> We check if we can support the requested pixels per clock given the
> known maximum for the currently configured format. If not, we set it
> to the highest feasible value and return this value to the caller.
> 
> [1] Section 12.6.1.4.8.14 CSI_RX_IF Programming Restrictions of AM62 TRM
> 
> Link: https://www.ti.com/lit/pdf/spruj16
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 75 +++++++++++++++++++++-------
>  drivers/media/platform/cadence/cdns-csi2rx.h | 19 +++++++
>  2 files changed, 76 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 608298c72462031515d9ad01c6b267bf7375a5bf..154eaacc39ad294db0524e88be888bd0929af071 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2017 Cadence Design Systems Inc.
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> @@ -22,6 +23,8 @@
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>  
> +#include "cdns-csi2rx.h"
> +
>  #define CSI2RX_DEVICE_CFG_REG			0x000
>  
>  #define CSI2RX_SOFT_RESET_REG			0x004
> @@ -53,6 +56,8 @@
>  
>  #define CSI2RX_STREAM_CFG_REG(n)		(CSI2RX_STREAM_BASE(n) + 0x00c)
>  #define CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF		(1 << 8)

Not a fault of this patch but this should use BIT(). Or at the very least
(1U << 8). I.e. this isn't a bug but the pattern is bad. It'd be nice to
fix this in a separate patch.

> +#define CSI2RX_STREAM_CFG_NUM_PIXELS_MASK		GENMASK(5, 4)
> +#define CSI2RX_STREAM_CFG_NUM_PIXELS(n)			((n) >> 1)
>  
>  #define CSI2RX_LANES_MAX	4
>  #define CSI2RX_STREAMS_MAX	4
> @@ -68,7 +73,10 @@ enum csi2rx_pads {
>  
>  struct csi2rx_fmt {
>  	u32				code;
> +	/* width of a single pixel on CSI-2 bus */
>  	u8				bpp;
> +	/* max pixels per clock supported on output bus */
> +	u8				max_pixels;
>  };
>  
>  struct csi2rx_priv {
> @@ -90,6 +98,7 @@ struct csi2rx_priv {
>  	struct reset_control		*pixel_rst[CSI2RX_STREAMS_MAX];
>  	struct phy			*dphy;
>  
> +	u8				num_pixels[CSI2RX_STREAMS_MAX];
>  	u8				lanes[CSI2RX_LANES_MAX];
>  	u8				num_lanes;
>  	u8				max_lanes;
> @@ -106,22 +115,22 @@ struct csi2rx_priv {
>  };
>  
>  static const struct csi2rx_fmt formats[] = {
> -	{ .code	= MEDIA_BUS_FMT_YUYV8_1X16, .bpp = 16, },
> -	{ .code	= MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16, },
> -	{ .code	= MEDIA_BUS_FMT_YVYU8_1X16, .bpp = 16, },
> -	{ .code	= MEDIA_BUS_FMT_VYUY8_1X16, .bpp = 16, },
> -	{ .code	= MEDIA_BUS_FMT_SBGGR8_1X8, .bpp = 8, },
> -	{ .code	= MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8, },
> -	{ .code	= MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8, },
> -	{ .code	= MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8, },
> -	{ .code	= MEDIA_BUS_FMT_Y8_1X8,     .bpp = 8, },
> -	{ .code	= MEDIA_BUS_FMT_SBGGR10_1X10, .bpp = 10, },
> -	{ .code	= MEDIA_BUS_FMT_SGBRG10_1X10, .bpp = 10, },
> -	{ .code	= MEDIA_BUS_FMT_SGRBG10_1X10, .bpp = 10, },
> -	{ .code	= MEDIA_BUS_FMT_SRGGB10_1X10, .bpp = 10, },
> -	{ .code	= MEDIA_BUS_FMT_RGB565_1X16,  .bpp = 16, },
> -	{ .code	= MEDIA_BUS_FMT_RGB888_1X24,  .bpp = 24, },
> -	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, },
> +	{ .code	= MEDIA_BUS_FMT_YUYV8_1X16, .bpp = 16, .max_pixels = 2, },
> +	{ .code	= MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16, .max_pixels = 2, },
> +	{ .code	= MEDIA_BUS_FMT_YVYU8_1X16, .bpp = 16, .max_pixels = 2, },
> +	{ .code	= MEDIA_BUS_FMT_VYUY8_1X16, .bpp = 16, .max_pixels = 2, },
> +	{ .code	= MEDIA_BUS_FMT_SBGGR8_1X8, .bpp = 8, .max_pixels = 4, },
> +	{ .code	= MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8, .max_pixels = 4, },
> +	{ .code	= MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8, .max_pixels = 4, },
> +	{ .code	= MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8, .max_pixels = 4, },
> +	{ .code	= MEDIA_BUS_FMT_Y8_1X8,     .bpp = 8, .max_pixels = 4, },
> +	{ .code	= MEDIA_BUS_FMT_SBGGR10_1X10, .bpp = 10, .max_pixels = 2, },
> +	{ .code	= MEDIA_BUS_FMT_SGBRG10_1X10, .bpp = 10, .max_pixels = 2, },
> +	{ .code	= MEDIA_BUS_FMT_SGRBG10_1X10, .bpp = 10, .max_pixels = 2, },
> +	{ .code	= MEDIA_BUS_FMT_SRGGB10_1X10, .bpp = 10, .max_pixels = 2, },
> +	{ .code	= MEDIA_BUS_FMT_RGB565_1X16,  .bpp = 16, .max_pixels = 1, },
> +	{ .code	= MEDIA_BUS_FMT_RGB888_1X24,  .bpp = 24, .max_pixels = 1, },
> +	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, .max_pixels = 1, },
>  };
>  
>  static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
> @@ -276,8 +285,10 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  
>  		reset_control_deassert(csi2rx->pixel_rst[i]);
>  
> -		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF,
> -		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
> +		reg = CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF;
> +		reg |= FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
> +				  csi2rx->num_pixels[i]);
> +		writel(reg, csi2rx->base + CSI2RX_STREAM_CFG_REG(i));

I'd write this as:

		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF |
		       FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
				  csi2rx->num_pixels[i]),
		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));

But up to you.

>  
>  		/*
>  		 * Enable one virtual channel. When multiple virtual channels
> @@ -458,6 +469,34 @@ static int csi2rx_init_state(struct v4l2_subdev *subdev,
>  	return csi2rx_set_fmt(subdev, state, &format);
>  }
>  
> +int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
> +			      u8 *ppc)
> +{
> +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> +	const struct csi2rx_fmt *csi_fmt;
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_mbus_framefmt *fmt;
> +	int ret = 0;

ret is redundant.

> +
> +	if (!ppc || pad < CSI2RX_PAD_SOURCE_STREAM0 || pad >= CSI2RX_PAD_MAX)
> +		return -EINVAL;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(subdev);
> +	fmt = v4l2_subdev_state_get_format(state, pad);
> +	csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
> +
> +	/* Reduce requested PPC if it is too high */
> +	*ppc = min(*ppc, csi_fmt->max_pixels);
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	csi2rx->num_pixels[pad - CSI2RX_PAD_SOURCE_STREAM0] =
> +		CSI2RX_STREAM_CFG_NUM_PIXELS(*ppc);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(cdns_csi2rx_negotiate_ppc);

EXPORT_SYMBOL_GPL(). Or maybe use a namespace?

> +
>  static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
>  	.enum_mbus_code	= csi2rx_enum_mbus_code,
>  	.get_fmt	= v4l2_subdev_get_fmt,
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.h b/drivers/media/platform/cadence/cdns-csi2rx.h

I wonder if it'd be better to put this under include/media.

> new file mode 100644
> index 0000000000000000000000000000000000000000..128d47e8513c99c083f49e249e876be6d19389f6
> --- /dev/null
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +#ifndef CDNS_CSI2RX_H
> +#define CDNS_CSI2RX_H
> +
> +#include <media/v4l2-subdev.h>
> +
> +/**
> + * cdns_csi2rx_negotiate_ppc - Negotiate pixel-per-clock on output interface
> + *
> + * @subdev: point to &struct v4l2_subdev
> + * @pad: pad number of the source pad
> + * @ppc: pointer to requested pixel-per-clock value
> + *
> + * Returns 0 on success, negative error code otherwise.
> + */
> +int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
> +			      u8 *ppc);
> +
> +#endif
> 

-- 
Regards,

Sakari Ailus

