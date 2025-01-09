Return-Path: <linux-media+bounces-24493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D0EA07263
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 11:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92CCE3A73F6
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 10:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9351F215773;
	Thu,  9 Jan 2025 10:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfa7mQf5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062DA19E965;
	Thu,  9 Jan 2025 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736417251; cv=none; b=GYgew4jHJQrKI2u42J1EKwYcM7miXpGTtmG++4/ZhfaXOfBh/nn/f8dDOcShBVQEbVXKHBvvw8VdUc/e8kl4dXbMs1fOCe+XaQQGKs7P4xV1TiMmQ0eNyRPgupwauv6YmwoWt7qy6BOJTYdBf07rTw7q0lQ8wyc6j1v1sKhKJE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736417251; c=relaxed/simple;
	bh=fkIckTDs/3slj5YHCvx3ermXbJ+8O6/6GmOPmb5bPBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMFT9wdM8oIhwuMFTrFzfHk7UpcBtMiHPlqKffyyMUrXebjhhxsbEE1+3bHmM5r3RVcTAhyk898mnlBbMWXJ+clMn75nNy5HH48ZBjidYI8sbknSrpNmPz9N+eGKYmcw6W1RrJZ6YNCkeXl6A0AW6Rgcy8PqoRwH0RjGhud6Fbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfa7mQf5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736417247; x=1767953247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fkIckTDs/3slj5YHCvx3ermXbJ+8O6/6GmOPmb5bPBA=;
  b=bfa7mQf5rP3fGhJh2T/oxcI3OwrKwD8sAGumIDgFhXy6pCFNc+aAzLM+
   PEQPDVrvDAG4C7ZVCXCDYbepDd1Mi+KABRbSPn7En2ruaEGtWGXAsCW83
   sMBSCin8NH8ESIYvhjSLqBvlRsXD9x6G/f5AvI7n+QJkVffI2lQvqqUwv
   TFImWNX7462ID+1uiBBxGg32j0daRtNJf6D2bqB/aRAeopf3wr1lD7RpB
   bb9j+PzLmb3h5MIZzj8Xxgc7UAV0PUjS+Ukz+XaNGfXv2/IBdecrc/PSZ
   WB1L4IPiwzklfu94s2/+wq39JSg1n7ED6ce9u2xEuqfK4Qa1CGesHlLMo
   w==;
X-CSE-ConnectionGUID: liQiQmW2T+i54JXtO5aTYQ==
X-CSE-MsgGUID: mVLCGIrKRImdwbds7yXo+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40436529"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="40436529"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 02:07:25 -0800
X-CSE-ConnectionGUID: bGaKKYm1T6WHNy/UlEF50Q==
X-CSE-MsgGUID: nBtvtj9sQYibUCuibjgykA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126652519"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 02:07:20 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7DE181201CA;
	Thu,  9 Jan 2025 12:07:17 +0200 (EET)
Date: Thu, 9 Jan 2025 10:07:17 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: Re: [PATCH v2 4/6] media: rockchip: add a driver for the rockchip
 camera interface (cif)
Message-ID: <Z3-f1SrrRjMnB-1C@kekkonen.localdomain>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
 <20241217-v6-8-topic-rk3568-vicap-v2-4-b1d488fcc0d3@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-v6-8-topic-rk3568-vicap-v2-4-b1d488fcc0d3@wolfvision.net>

Hi Michael,

Thanks for the update.

On Tue, Dec 17, 2024 at 04:55:16PM +0100, Michael Riesch wrote:
> The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs
> in different variations. For example, the PX30 Video Input Processor (VIP)
> is able to receive video data via the Digital Video Port (DVP, a parallel
> data interface and transfer it into system memory using a double-buffering
> mechanism called ping-pong mode. The RK3568 Video Capture (VICAP) unit,
> on the other hand, features a DVP and a MIPI CSI-2 receiver that can
> receive video data independently (both using the ping-pong scheme).
> The different variants may have additional features, such as scaling
> and/or cropping.
> Finally, the RK3588 VICAP unit constitutes an essential piece of the
> camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
> units, and different data path multiplexers (to system memory, to ISP,
> ...).
> 
> Add a basic media controller centric V4L2 driver for the Rockchip CIF with
>  - support for the PX30 VIP
>  - support for the RK3568 VICAP DVP
>  - abstraction for the ping-pong scheme to allow for future extensions
> 
> [PX30 VIP support v1-v5]
> Co-developed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> [PX30 VIP support v6-v13]
> Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> [added RK3568 VICAP DVP support]
> [refactored to media controller centric driver, added mplane support]
> Co-developed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  MAINTAINERS                                        |   1 +
>  drivers/media/platform/rockchip/Kconfig            |   1 +
>  drivers/media/platform/rockchip/Makefile           |   1 +
>  drivers/media/platform/rockchip/cif/Kconfig        |  15 +
>  drivers/media/platform/rockchip/cif/Makefile       |   3 +
>  .../media/platform/rockchip/cif/cif-capture-dvp.c  | 794 +++++++++++++++++++++
>  .../media/platform/rockchip/cif/cif-capture-dvp.h  |  24 +
>  drivers/media/platform/rockchip/cif/cif-common.h   | 163 +++++
>  drivers/media/platform/rockchip/cif/cif-dev.c      | 405 +++++++++++
>  drivers/media/platform/rockchip/cif/cif-regs.h     | 132 ++++
>  drivers/media/platform/rockchip/cif/cif-stream.c   | 676 ++++++++++++++++++
>  drivers/media/platform/rockchip/cif/cif-stream.h   |  24 +
>  12 files changed, 2239 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8dbeb2927a08..fefa848ea37c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20224,6 +20224,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
>  F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> +F:	drivers/media/platform/rockchip/cif/
>  
>  ROCKCHIP CRYPTO DRIVERS
>  M:	Corentin Labbe <clabbe@baylibre.com>
> diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
> index b41d3960c1b4..f73d68d1d2b6 100644
> --- a/drivers/media/platform/rockchip/Kconfig
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -2,5 +2,6 @@
>  
>  comment "Rockchip media platform drivers"
>  
> +source "drivers/media/platform/rockchip/cif/Kconfig"
>  source "drivers/media/platform/rockchip/rga/Kconfig"
>  source "drivers/media/platform/rockchip/rkisp1/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/platform/rockchip/Makefile
> index 4f782b876ac9..1a7aa1f8e134 100644
> --- a/drivers/media/platform/rockchip/Makefile
> +++ b/drivers/media/platform/rockchip/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-y += cif/
>  obj-y += rga/
>  obj-y += rkisp1/
> diff --git a/drivers/media/platform/rockchip/cif/Kconfig b/drivers/media/platform/rockchip/cif/Kconfig
> new file mode 100644
> index 000000000000..f53e79a4b42d
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/cif/Kconfig
> @@ -0,0 +1,15 @@
> +config VIDEO_ROCKCHIP_CIF
> +	tristate "Rockchip Camera Interface (CIF)"
> +	depends on VIDEO_DEV
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on PM && COMMON_CLK
> +	select MEDIA_CONTROLLER
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This is a driver for Rockchip Camera Interface (CIF). It is featured
> +	  in many Rockchips SoCs in different variations, such as the PX30
> +	  Video Input Processor (VIP, one Digital Video Port (DVP)) or the
> +	  RK3568 Video Capture (VICAP, one DVP, one MIPI CSI-2 receiver) unit.
> diff --git a/drivers/media/platform/rockchip/cif/Makefile b/drivers/media/platform/rockchip/cif/Makefile
> new file mode 100644
> index 000000000000..1bd0d17ba1c4
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/cif/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-cif.o
> +rockchip-cif-objs += cif-dev.o cif-capture-dvp.o cif-stream.o
> diff --git a/drivers/media/platform/rockchip/cif/cif-capture-dvp.c b/drivers/media/platform/rockchip/cif/cif-capture-dvp.c
> new file mode 100644
> index 000000000000..95ff8a986e01
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/cif/cif-capture-dvp.c
> @@ -0,0 +1,794 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2024 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "cif-capture-dvp.h"
> +#include "cif-common.h"
> +#include "cif-regs.h"
> +#include "cif-stream.h"
> +
> +static struct cif_output_fmt dvp_out_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV16,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_OUTPUT_422 |
> +			       CIF_FORMAT_UV_STORAGE_ORDER_UVUV,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV61,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_OUTPUT_422 |
> +			       CIF_FORMAT_UV_STORAGE_ORDER_VUVU,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV12,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_OUTPUT_420 |
> +			       CIF_FORMAT_UV_STORAGE_ORDER_UVUV,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV21,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_OUTPUT_420 |
> +			       CIF_FORMAT_UV_STORAGE_ORDER_VUVU,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_RGB24,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_RGB565,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_BGR666,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SRGGB8,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGRBG8,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGBRG8,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SBGGR8,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SRGGB10,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGRBG10,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGBRG10,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SBGGR10,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SRGGB12,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGRBG12,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGBRG12,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SBGGR12,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SBGGR16,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_Y16,
> +		.cplanes = 1,
> +	},
> +};
> +
> +static const struct cif_input_fmt px30_dvp_in_fmts[] = {
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y12_1X12,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	}
> +};
> +
> +const struct cif_dvp_match_data px30_vip_dvp_match_data = {
> +	.in_fmts = px30_dvp_in_fmts,
> +	.in_fmts_num = ARRAY_SIZE(px30_dvp_in_fmts),
> +	.out_fmts = dvp_out_fmts,
> +	.out_fmts_num = ARRAY_SIZE(dvp_out_fmts),
> +	.has_scaler = true,
> +	.regs = {
> +		[CIF_DVP_CTRL] = 0x00,
> +		[CIF_DVP_INTEN] = 0x04,
> +		[CIF_DVP_INTSTAT] = 0x08,
> +		[CIF_DVP_FOR] = 0x0c,
> +		[CIF_DVP_LINE_NUM_ADDR] = 0x10,
> +		[CIF_DVP_FRM0_ADDR_Y] = 0x14,
> +		[CIF_DVP_FRM0_ADDR_UV] = 0x18,
> +		[CIF_DVP_FRM1_ADDR_Y] = 0x1c,
> +		[CIF_DVP_FRM1_ADDR_UV] = 0x20,
> +		[CIF_DVP_VIR_LINE_WIDTH] = 0x24,
> +		[CIF_DVP_SET_SIZE] = 0x28,
> +		[CIF_DVP_SCL_CTRL] = 0x48,
> +		[CIF_DVP_FRAME_STATUS] = 0x60,
> +		[CIF_DVP_LAST_LINE] = 0x68,
> +		[CIF_DVP_LAST_PIX] = 0x6c,
> +	},
> +};
> +
> +static const struct cif_input_fmt rk3568_dvp_in_fmts[] = {
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.fmt_type = CIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       CIF_FORMAT_INPUT_MODE_BT1120 |
> +			       CIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       CIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       CIF_FORMAT_INPUT_MODE_BT1120 |
> +			       CIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       CIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       CIF_FORMAT_INPUT_MODE_BT1120 |
> +			       CIF_FORMAT_BT1120_YC_SWAP |
> +			       CIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       CIF_FORMAT_BT1120_YC_SWAP |
> +			       CIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       CIF_FORMAT_INPUT_MODE_BT1120 |
> +			       CIF_FORMAT_BT1120_YC_SWAP |
> +			       CIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
> +		.dvp_fmt_val = CIF_FORMAT_YUV_INPUT_422 |
> +			       CIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       CIF_FORMAT_BT1120_YC_SWAP |
> +			       CIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y12_1X12,
> +		.dvp_fmt_val = CIF_FORMAT_INPUT_MODE_RAW |
> +			       CIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = CIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +};
> +
> +static void rk3568_dvp_grf_setup(struct cif_device *cif_dev)
> +{
> +	u32 con1 = RK3568_GRF_WRITE_ENABLE(RK3568_GRF_VI_CON1_CIF_DATAPATH |
> +					   RK3568_GRF_VI_CON1_CIF_CLK_DELAYNUM);
> +
> +	if (!cif_dev->grf)
> +		return;
> +
> +	con1 |= RK3568_GRF_SET_CLK_DELAYNUM(cif_dev->dvp.cif_clk_delaynum);
> +
> +	if (cif_dev->dvp.vep.bus.parallel.flags &
> +	    V4L2_MBUS_PCLK_SAMPLE_DUALEDGE)
> +		con1 |= RK3568_GRF_VI_CON1_CIF_DATAPATH;
> +
> +	regmap_write(cif_dev->grf, RK3568_GRF_VI_CON1, con1);
> +}
> +
> +const struct cif_dvp_match_data rk3568_vicap_dvp_match_data = {
> +	.in_fmts = rk3568_dvp_in_fmts,
> +	.in_fmts_num = ARRAY_SIZE(rk3568_dvp_in_fmts),
> +	.out_fmts = dvp_out_fmts,
> +	.out_fmts_num = ARRAY_SIZE(dvp_out_fmts),
> +	.setup = rk3568_dvp_grf_setup,
> +	.has_scaler = false,
> +	.regs = {
> +		[CIF_DVP_CTRL] = 0x00,
> +		[CIF_DVP_INTEN] = 0x04,
> +		[CIF_DVP_INTSTAT] = 0x08,
> +		[CIF_DVP_FOR] = 0x0c,
> +		[CIF_DVP_LINE_NUM_ADDR] = 0x2c,
> +		[CIF_DVP_FRM0_ADDR_Y] = 0x14,
> +		[CIF_DVP_FRM0_ADDR_UV] = 0x18,
> +		[CIF_DVP_FRM1_ADDR_Y] = 0x1c,
> +		[CIF_DVP_FRM1_ADDR_UV] = 0x20,
> +		[CIF_DVP_VIR_LINE_WIDTH] = 0x24,
> +		[CIF_DVP_SET_SIZE] = 0x28,
> +		[CIF_DVP_FRAME_STATUS] = 0x3c,
> +		[CIF_DVP_LAST_LINE] = 0x44,
> +		[CIF_DVP_LAST_PIX] = 0x48,
> +	},
> +};
> +
> +static inline unsigned int cif_dvp_get_addr(struct cif_device *cif_device,
> +					    unsigned int index)
> +{
> +	if (index >= CIF_DVP_REGISTER_MAX)
> +		return CIF_DVP_REGISTER_INVALID;
> +
> +	return cif_device->match_data->dvp->regs[index];
> +}
> +
> +static inline void cif_dvp_write(struct cif_device *cif_dev, unsigned int index,
> +				 u32 val)
> +{
> +	unsigned int addr = cif_dvp_get_addr(cif_dev, index);
> +
> +	if (addr == CIF_DVP_REGISTER_INVALID)
> +		return;
> +
> +	writel(val, cif_dev->base_addr + addr);
> +}
> +
> +static inline u32 cif_dvp_read(struct cif_device *cif_dev, unsigned int index)
> +{
> +	unsigned int addr = cif_dvp_get_addr(cif_dev, index);
> +
> +	if (addr == CIF_DVP_REGISTER_INVALID)
> +		return 0;
> +
> +	return readl(cif_dev->base_addr + addr);
> +}
> +
> +static void cif_dvp_queue_buffer(struct cif_stream *stream, unsigned int index)
> +{
> +	struct cif_device *cif_dev = stream->cif_dev;
> +	struct cif_buffer *buffer = stream->buffers[index];
> +	u32 frm_addr_y, frm_addr_uv;
> +
> +	frm_addr_y = index ? CIF_DVP_FRM1_ADDR_Y : CIF_DVP_FRM0_ADDR_Y;
> +	frm_addr_uv = index ? CIF_DVP_FRM1_ADDR_UV : CIF_DVP_FRM0_ADDR_UV;
> +
> +	cif_dvp_write(cif_dev, frm_addr_y, buffer->buff_addr[CIF_PLANE_Y]);
> +	cif_dvp_write(cif_dev, frm_addr_uv, buffer->buff_addr[CIF_PLANE_UV]);
> +}
> +
> +static int cif_dvp_start_streaming(struct cif_stream *stream)
> +{
> +	u32 val, fmt_type, xfer_mode = 0;
> +	struct cif_device *cif_dev = stream->cif_dev;
> +	struct v4l2_mbus_config_parallel *parallel;
> +
> +	fmt_type = stream->active_in_fmt->fmt_type;
> +
> +	parallel = &cif_dev->dvp.vep.bus.parallel;
> +	if ((parallel->bus_width == 16) &&
> +	    (parallel->flags & V4L2_MBUS_PCLK_SAMPLE_DUALEDGE))
> +		xfer_mode |= CIF_FORMAT_BT1120_CLOCK_DOUBLE_EDGES;
> +
> +	val = stream->active_out_fmt->dvp_fmt_val |
> +	      stream->active_in_fmt->dvp_fmt_val | xfer_mode;
> +	cif_dvp_write(cif_dev, CIF_DVP_FOR, val);
> +
> +	val = stream->pix.width;
> +	if (stream->active_in_fmt->fmt_type == CIF_FMT_TYPE_RAW)
> +		val = stream->pix.width * 2;
> +
> +	cif_dvp_write(cif_dev, CIF_DVP_VIR_LINE_WIDTH, val);
> +	cif_dvp_write(cif_dev, CIF_DVP_SET_SIZE,
> +		      stream->pix.width | (stream->pix.height << 16));
> +
> +	cif_dvp_write(cif_dev, CIF_DVP_FRAME_STATUS, CIF_FRAME_STAT_CLS);
> +	cif_dvp_write(cif_dev, CIF_DVP_INTSTAT, CIF_INTSTAT_CLS);
> +	if (cif_dev->match_data->dvp->has_scaler)
> +		cif_dvp_write(cif_dev, CIF_DVP_SCL_CTRL,
> +			      (fmt_type == CIF_FMT_TYPE_YUV) ?
> +				      CIF_SCL_CTRL_ENABLE_YUV_16BIT_BYPASS :
> +				      CIF_SCL_CTRL_ENABLE_RAW_16BIT_BYPASS);
> +
> +	cif_dvp_write(cif_dev, CIF_DVP_INTEN,
> +		      CIF_INTEN_FRAME_END_EN | CIF_INTEN_PST_INF_FRAME_END_EN);
> +
> +	cif_dvp_write(cif_dev, CIF_DVP_CTRL,
> +		      CIF_CTRL_AXI_BURST_16 | CIF_CTRL_MODE_PINGPONG |
> +			      CIF_CTRL_ENABLE_CAPTURE);
> +	return 0;
> +}
> +
> +static void cif_dvp_stop_streaming(struct cif_stream *stream)
> +{
> +	struct cif_device *cif_dev = stream->cif_dev;
> +	u32 val;
> +
> +	val = cif_dvp_read(cif_dev, CIF_DVP_CTRL);
> +	cif_dvp_write(cif_dev, CIF_DVP_CTRL, val & (~CIF_CTRL_ENABLE_CAPTURE));
> +	cif_dvp_write(cif_dev, CIF_DVP_INTEN, 0x0);
> +	cif_dvp_write(cif_dev, CIF_DVP_INTSTAT, 0x3ff);
> +	cif_dvp_write(cif_dev, CIF_DVP_FRAME_STATUS, 0x0);
> +
> +	stream->stopping = false;
> +}
> +
> +static void cif_dvp_reset_stream(struct cif_device *cif_dev)
> +{
> +	u32 ctl = cif_dvp_read(cif_dev, CIF_DVP_CTRL);
> +
> +	cif_dvp_write(cif_dev, CIF_DVP_CTRL, ctl & (~CIF_CTRL_ENABLE_CAPTURE));
> +	cif_dvp_write(cif_dev, CIF_DVP_CTRL, ctl | CIF_CTRL_ENABLE_CAPTURE);
> +}
> +
> +irqreturn_t cif_dvp_isr(int irq, void *ctx)
> +{
> +	struct device *dev = ctx;
> +	struct cif_device *cif_dev = dev_get_drvdata(dev);
> +	struct cif_stream *stream = &cif_dev->dvp.stream;
> +	unsigned int intstat;
> +	u32 lastline, lastpix, ctl, cif_frmst;
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	if (!cif_dev->match_data->dvp)
> +		return ret;
> +
> +	intstat = cif_dvp_read(cif_dev, CIF_DVP_INTSTAT);
> +	cif_frmst = cif_dvp_read(cif_dev, CIF_DVP_FRAME_STATUS);
> +	lastline =
> +		CIF_FETCH_Y_LAST_LINE(cif_dvp_read(cif_dev, CIF_DVP_LAST_LINE));
> +	lastpix =
> +		CIF_FETCH_Y_LAST_LINE(cif_dvp_read(cif_dev, CIF_DVP_LAST_PIX));
> +	ctl = cif_dvp_read(cif_dev, CIF_DVP_CTRL);
> +
> +	/*
> +	 * The following IRQs are enabled:
> +	 *  - PST_INF_FRAME_END: cif FIFO is ready, this is prior to FRAME_END
> +	 *  - FRAME_END: cif has saved frame to memory
> +	 */
> +
> +	if (intstat & CIF_INTSTAT_PST_INF_FRAME_END) {
> +		cif_dvp_write(cif_dev, CIF_DVP_INTSTAT,
> +			      CIF_INTSTAT_PST_INF_FRAME_END_CLR);
> +
> +		if (stream->stopping)
> +			/* To stop cif ASAP, before FRAME_END IRQ */
> +			cif_dvp_write(cif_dev, CIF_DVP_CTRL,
> +				      ctl & (~CIF_CTRL_ENABLE_CAPTURE));
> +
> +		ret = IRQ_HANDLED;
> +	}
> +
> +	if (intstat & CIF_INTSTAT_FRAME_END) {
> +		cif_dvp_write(cif_dev, CIF_DVP_INTSTAT,
> +			      CIF_INTSTAT_FRAME_END_CLR |
> +				      CIF_INTSTAT_LINE_END_CLR);
> +
> +		if (stream->stopping) {
> +			cif_dvp_stop_streaming(stream);
> +			wake_up(&stream->wq_stopped);
> +			return IRQ_HANDLED;
> +		}
> +
> +		if (lastline != stream->pix.height) {
> +			v4l2_err(&cif_dev->v4l2_dev,
> +				 "bad frame, irq:%#x frmst:%#x size:%dx%d\n",
> +				 intstat, cif_frmst, lastpix, lastline);
> +
> +			cif_dvp_reset_stream(cif_dev);
> +		}
> +
> +		cif_stream_pingpong(stream);
> +
> +		ret = IRQ_HANDLED;
> +	}
> +
> +	return ret;
> +}
> +
> +int cif_dvp_register(struct cif_device *cif_dev)
> +{
> +	struct cif_stream *stream = &cif_dev->dvp.stream;
> +	const struct cif_stream_config config = {
> +		.name = CIF_DRIVER_NAME "-dvp",
> +	};
> +	int ret;
> +
> +	stream->in_fmts = cif_dev->match_data->dvp->in_fmts;
> +	stream->in_fmts_num = cif_dev->match_data->dvp->in_fmts_num;
> +	stream->out_fmts = cif_dev->match_data->dvp->out_fmts;
> +	stream->out_fmts_num = cif_dev->match_data->dvp->out_fmts_num;
> +	stream->queue_buffer = cif_dvp_queue_buffer;
> +	stream->start_streaming = cif_dvp_start_streaming;
> +	stream->stop_streaming = cif_dvp_stop_streaming;
> +
> +	if (cif_dev->match_data->dvp->setup)
> +		cif_dev->match_data->dvp->setup(cif_dev);
> +
> +	ret = cif_stream_register(cif_dev, stream, &config);

How about just passing the string if there's nothing else in config? Or do
you expect to add something else in the future?

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +void cif_dvp_unregister(struct cif_device *cif_dev)
> +{
> +	struct cif_stream *stream = &cif_dev->dvp.stream;
> +
> +	cif_stream_unregister(stream);
> +}
> diff --git a/drivers/media/platform/rockchip/cif/cif-capture-dvp.h b/drivers/media/platform/rockchip/cif/cif-capture-dvp.h
> new file mode 100644
> index 000000000000..48dd1b7185dc
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/cif/cif-capture-dvp.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2024 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#ifndef _CIF_CAPTURE_DVP_H
> +#define _CIF_CAPTURE_DVP_H
> +
> +#include "cif-common.h"
> +
> +extern const struct cif_dvp_match_data px30_vip_dvp_match_data;
> +extern const struct cif_dvp_match_data rk3568_vicap_dvp_match_data;
> +
> +int cif_dvp_register(struct cif_device *dev);
> +
> +void cif_dvp_unregister(struct cif_device *dev);
> +
> +irqreturn_t cif_dvp_isr(int irq, void *ctx);
> +
> +#endif
> diff --git a/drivers/media/platform/rockchip/cif/cif-common.h b/drivers/media/platform/rockchip/cif/cif-common.h
> new file mode 100644
> index 000000000000..c90b705d6bb4
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/cif/cif-common.h
> @@ -0,0 +1,163 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2024 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#ifndef _CIF_COMMON_H
> +#define _CIF_COMMON_H
> +
> +#include <linux/clk.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +
> +#include <media/media-device.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "cif-regs.h"
> +
> +#define CIF_DRIVER_NAME "rockchip-cif"
> +#define CIF_DEFAULT_WIDTH 640
> +#define CIF_DEFAULT_HEIGHT 480
> +#define CIF_CLKS_MAX 4
> +
> +enum cif_fmt_type {
> +	CIF_FMT_TYPE_YUV = 0,
> +	CIF_FMT_TYPE_RAW,
> +};
> +
> +enum cif_plane_index {
> +	CIF_PLANE_Y = 0,
> +	CIF_PLANE_UV = 1,
> +};
> +
> +struct cif_input_fmt {
> +	u32 mbus_code;
> +
> +	enum cif_fmt_type fmt_type;
> +	enum v4l2_field field;
> +
> +	union {
> +		u32 dvp_fmt_val;
> +	};
> +};
> +
> +struct cif_output_fmt {
> +	u32 fourcc;
> +	u32 mbus_code;
> +	u8 cplanes;
> +
> +	union {
> +		u32 dvp_fmt_val;
> +	};
> +};
> +
> +struct cif_buffer {
> +	struct vb2_v4l2_buffer vb;
> +	struct list_head queue;
> +	dma_addr_t buff_addr[VIDEO_MAX_PLANES];
> +	bool is_dummy;
> +};
> +
> +struct cif_dummy_buffer {
> +	struct cif_buffer buffer;
> +	void *vaddr;
> +	u32 size;
> +};
> +
> +struct cif_stream;
> +
> +struct cif_remote {
> +	struct v4l2_async_connection async_conn;
> +	struct v4l2_subdev *sd;
> +	struct cif_stream *stream;
> +	int source_pad;
> +};
> +
> +struct cif_stream {
> +	struct cif_device *cif_dev;
> +	struct cif_remote *remote;
> +
> +	/* in ping-pong mode, two buffers can be provided to the HW */
> +	struct cif_buffer *buffers[2];
> +	int frame_idx;
> +	int frame_phase;
> +
> +	/* in case of no available buffer, HW can write to the dummy buffer */
> +	struct cif_dummy_buffer dummy;
> +
> +	bool stopping;
> +	wait_queue_head_t wq_stopped;
> +
> +	/* queue of available buffers plus spinlock that protects it */
> +	spinlock_t driver_queue_lock;
> +	struct list_head driver_queue;
> +
> +	/* Lock used by the V4L core. */
> +	struct mutex vlock;
> +	struct video_device vdev;
> +	struct vb2_queue buf_queue;
> +	struct media_pad pad;
> +	struct media_pipeline pipeline;
> +
> +	struct v4l2_pix_format_mplane pix;
> +	const struct cif_input_fmt *active_in_fmt;
> +	const struct cif_output_fmt *active_out_fmt;
> +
> +	const struct cif_input_fmt *in_fmts;
> +	unsigned int in_fmts_num;
> +	const struct cif_output_fmt *out_fmts;
> +	unsigned int out_fmts_num;
> +
> +	void (*queue_buffer)(struct cif_stream *stream, unsigned int index);
> +	int (*start_streaming)(struct cif_stream *stream);
> +	void (*stop_streaming)(struct cif_stream *stream);
> +};
> +
> +struct cif_dvp {
> +	struct cif_stream stream;
> +	struct v4l2_fwnode_endpoint vep;
> +	u32 cif_clk_delaynum;
> +};
> +
> +struct cif_dvp_match_data {
> +	const struct cif_input_fmt *in_fmts;
> +	unsigned int in_fmts_num;
> +	const struct cif_output_fmt *out_fmts;
> +	unsigned int out_fmts_num;
> +	void (*setup)(struct cif_device *cif_dev);
> +	bool has_scaler;
> +	unsigned int regs[CIF_DVP_REGISTER_MAX];
> +};
> +
> +struct cif_match_data {
> +	const char *const *clks;
> +	unsigned int clks_num;
> +	const struct cif_dvp_match_data *dvp;
> +};
> +
> +struct cif_device {
> +	struct device *dev;
> +
> +	struct clk_bulk_data clks[CIF_CLKS_MAX];
> +	unsigned int clks_num;
> +	struct regmap *grf;
> +	struct reset_control *cif_rst;
> +	int irq;
> +	void __iomem *base_addr;
> +
> +	const struct cif_match_data *match_data;
> +	struct cif_dvp dvp;
> +
> +	struct media_device media_dev;
> +	struct v4l2_device v4l2_dev;
> +	struct v4l2_async_notifier notifier;
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/rockchip/cif/cif-dev.c b/drivers/media/platform/rockchip/cif/cif-dev.c
> new file mode 100644
> index 000000000000..c3aafcf740f1
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/cif/cif-dev.c
> @@ -0,0 +1,405 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2024 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#include "cif-capture-dvp.h"
> +#include "cif-common.h"
> +
> +const char *const px30_vip_clks[] = {
> +	"aclk",
> +	"hclk",
> +	"pclk",
> +};
> +
> +static const struct cif_match_data px30_vip_match_data = {
> +	.clks = px30_vip_clks,
> +	.clks_num = ARRAY_SIZE(px30_vip_clks),
> +	.dvp = &px30_vip_dvp_match_data,
> +};
> +
> +const char *const rk3568_vicap_clks[] = {
> +	"aclk",
> +	"hclk",
> +	"dclk",
> +	"iclk",
> +};
> +
> +static const struct cif_match_data rk3568_vicap_match_data = {
> +	.clks = rk3568_vicap_clks,
> +	.clks_num = ARRAY_SIZE(rk3568_vicap_clks),
> +	.dvp = &rk3568_vicap_dvp_match_data,
> +};
> +
> +static const struct of_device_id cif_plat_of_match[] = {
> +	{
> +		.compatible = "rockchip,px30-vip",
> +		.data = &px30_vip_match_data,
> +	},
> +	{
> +		.compatible = "rockchip,rk3568-vicap",
> +		.data = &rk3568_vicap_match_data,
> +	},
> +	{},

Sentinel entries shouldn't have trailing commas.

> +};
> +
> +static void cif_notify(struct v4l2_subdev *sd, unsigned int notification,
> +		       void *arg)
> +{
> +	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
> +	struct cif_device *cif =
> +		container_of(v4l2_dev, struct cif_device, v4l2_dev);
> +	struct video_device *vdev = NULL;
> +
> +	if ((cif->dvp.stream.remote) && (cif->dvp.stream.remote->sd == sd))

How about inverting the condition and retuning if it's true? Then the
initialisation in declaration also becomes redundant.

What is this being used for btw.?

> +		vdev = &cif->dvp.stream.vdev;
> +
> +	if (!vdev)
> +		return;
> +
> +	switch (notification) {
> +	case V4L2_DEVICE_NOTIFY_EVENT:
> +		v4l2_event_queue(vdev, arg);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static int cif_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
> +				     struct v4l2_subdev *sd,
> +				     struct v4l2_async_connection *asd)
> +{
> +	struct cif_device *cif_dev =
> +		container_of(notifier, struct cif_device, notifier);
> +	struct cif_remote *remote =
> +		container_of(asd, struct cif_remote, async_conn);
> +	int source_pad;
> +	int ret;
> +
> +	source_pad = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
> +						 MEDIA_PAD_FL_SOURCE);
> +	if (source_pad < 0) {
> +		dev_err(cif_dev->dev, "failed to find source pad for %s\n",
> +			sd->name);
> +		return source_pad;
> +	}
> +
> +	remote->sd = sd;
> +	remote->source_pad = source_pad;
> +
> +	ret = media_create_pad_link(&sd->entity, source_pad,
> +				    &remote->stream->vdev.entity, 0,
> +				    MEDIA_LNK_FL_ENABLED);

Could you use v4l2_create_fwnode_links_to_pad() here?

> +	if (ret) {
> +		dev_err(cif_dev->dev, "failed to link source pad of %s\n",
> +			sd->name);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cif_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
> +{
> +	struct cif_device *cif_dev =
> +		container_of(notifier, struct cif_device, notifier);
> +
> +	return v4l2_device_register_subdev_nodes(&cif_dev->v4l2_dev);
> +}
> +
> +static const struct v4l2_async_notifier_operations cif_subdev_notifier_ops = {
> +	.bound = cif_subdev_notifier_bound,
> +	.complete = cif_subdev_notifier_complete,
> +};
> +
> +static int cif_subdev_notifier_register(struct cif_device *cif_dev, int index)

This function name is misleading. It does not register a notifier, it
prepares one though.

> +{
> +	struct v4l2_async_notifier *ntf = &cif_dev->notifier;
> +	struct v4l2_fwnode_endpoint *vep;
> +	struct cif_remote *remote;
> +	struct device *dev = cif_dev->dev;
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), index, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -ENODEV;
> +
> +	if (index == 0) {

index seems to be always 0.

> +		vep = &cif_dev->dvp.vep;
> +
> +		vep->bus_type = V4L2_MBUS_UNKNOWN;
> +		ret = v4l2_fwnode_endpoint_parse(ep, vep);
> +		if (ret)
> +			goto complete;
> +
> +		if (vep->bus_type != V4L2_MBUS_BT656 &&
> +		    vep->bus_type != V4L2_MBUS_PARALLEL) {
> +			v4l2_err(&cif_dev->v4l2_dev, "unsupported bus type\n");
> +			goto complete;
> +		}
> +
> +		remote = v4l2_async_nf_add_fwnode_remote(ntf, ep,
> +							 struct cif_remote);
> +		if (IS_ERR(remote)) {
> +			ret = PTR_ERR(remote);
> +			goto complete;
> +		}
> +
> +		cif_dev->dvp.stream.remote = remote;
> +		remote->stream = &cif_dev->dvp.stream;
> +	} else {
> +		ret = -ENODEV;
> +		goto complete;
> +	}
> +
> +complete:
> +	fwnode_handle_put(ep);
> +
> +	return ret;
> +}
> +
> +static void cif_subdev_notifier_unregister(struct cif_device *cif_dev,
> +					   int index)

This seems to be redundant.

> +{
> +}
> +
> +static int cif_entities_register(struct cif_device *cif_dev)

This function appears to be misnamed.

> +{
> +	struct v4l2_async_notifier *ntf = &cif_dev->notifier;
> +	struct device *dev = cif_dev->dev;
> +	int ret;
> +
> +	v4l2_async_nf_init(ntf, &cif_dev->v4l2_dev);
> +	ntf->ops = &cif_subdev_notifier_ops;
> +
> +	if (cif_dev->match_data->dvp) {
> +		ret = cif_subdev_notifier_register(cif_dev, 0);
> +		if (ret) {
> +			dev_err(dev,
> +				"failed to register notifier for dvp: %d\n",
> +				ret);
> +			goto err;
> +		}
> +
> +		ret = cif_dvp_register(cif_dev);
> +		if (ret) {
> +			dev_err(dev, "failed to register dvp: %d\n", ret);
> +			goto err_dvp_notifier_unregister;
> +		}
> +	}
> +
> +	ret = v4l2_async_nf_register(ntf);
> +	if (ret)
> +		goto err_notifier_cleanup;
> +
> +	return 0;
> +
> +err_notifier_cleanup:
> +	if (cif_dev->match_data->dvp)
> +		cif_dvp_unregister(cif_dev);
> +err_dvp_notifier_unregister:
> +	if (cif_dev->match_data->dvp)
> +		cif_subdev_notifier_unregister(cif_dev, 0);
> +	v4l2_async_nf_cleanup(ntf);
> +err:
> +	return ret;
> +}
> +
> +static void cif_entities_unregister(struct cif_device *cif_dev)
> +{
> +	v4l2_async_nf_unregister(&cif_dev->notifier);
> +	v4l2_async_nf_cleanup(&cif_dev->notifier);
> +
> +	if (cif_dev->match_data->dvp) {
> +		cif_subdev_notifier_unregister(cif_dev, 0);
> +		cif_dvp_unregister(cif_dev);
> +	}
> +}
> +
> +static irqreturn_t cif_isr(int irq, void *ctx)
> +{
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	if (cif_dvp_isr(irq, ctx) == IRQ_HANDLED)
> +		ret = IRQ_HANDLED;
> +
> +	return ret;
> +}
> +
> +static int cif_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct cif_device *cif_dev;
> +	u32 cif_clk_delaynum = 0;
> +	int ret, irq, i;
> +
> +	cif_dev = devm_kzalloc(dev, sizeof(*cif_dev), GFP_KERNEL);
> +	if (!cif_dev)
> +		return -ENOMEM;
> +
> +	cif_dev->match_data = of_device_get_match_data(dev);
> +	if (!cif_dev->match_data)
> +		return -ENODEV;
> +
> +	dev_set_drvdata(dev, cif_dev);
> +	cif_dev->dev = dev;
> +
> +	cif_dev->base_addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(cif_dev->base_addr))
> +		return PTR_ERR(cif_dev->base_addr);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(dev, irq, cif_isr, IRQF_SHARED,
> +			       dev_driver_string(dev), dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request irq\n");
> +	cif_dev->irq = irq;

Where do you need the irq field?

> +
> +	cif_dev->clks_num = cif_dev->match_data->clks_num;
> +	for (i = 0; (i < cif_dev->clks_num) && (i < CIF_CLKS_MAX); i++)
> +		cif_dev->clks[i].id = cif_dev->match_data->clks[i];
> +	ret = devm_clk_bulk_get(dev, cif_dev->clks_num, cif_dev->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get clocks\n");
> +
> +	cif_dev->cif_rst = devm_reset_control_array_get_exclusive(dev);
> +	if (IS_ERR(cif_dev->cif_rst))
> +		return PTR_ERR(cif_dev->cif_rst);
> +
> +	cif_dev->grf =
> +		syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
> +	if (IS_ERR(cif_dev->grf))
> +		cif_dev->grf = NULL;
> +
> +	if (cif_dev->match_data->dvp) {
> +		of_property_read_u32(dev->of_node, "rockchip,cif-clk-delaynum",
> +				     &cif_clk_delaynum);
> +		cif_dev->dvp.cif_clk_delaynum = cif_clk_delaynum;
> +	}
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	cif_dev->media_dev.dev = dev;
> +	strscpy(cif_dev->media_dev.model, CIF_DRIVER_NAME,
> +		sizeof(cif_dev->media_dev.model));
> +	media_device_init(&cif_dev->media_dev);
> +
> +	cif_dev->v4l2_dev.mdev = &cif_dev->media_dev;
> +	cif_dev->v4l2_dev.notify = cif_notify;
> +	strscpy(cif_dev->v4l2_dev.name, CIF_DRIVER_NAME,
> +		sizeof(cif_dev->v4l2_dev.name));

Do you need to set the name? v4l2_device_register() assigns a default one.

> +
> +	ret = v4l2_device_register(dev, &cif_dev->v4l2_dev);
> +	if (ret)
> +		goto err_media_dev_cleanup;
> +
> +	ret = media_device_register(&cif_dev->media_dev);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register media device: %d\n", ret);
> +		goto err_v4l2_dev_unregister;
> +	}
> +
> +	ret = cif_entities_register(cif_dev);
> +	if (ret) {
> +		dev_err(dev, "failed to register media entities: %d\n", ret);
> +		goto err_media_dev_unregister;
> +	}
> +
> +	return 0;
> +
> +err_media_dev_unregister:
> +	media_device_unregister(&cif_dev->media_dev);
> +err_v4l2_dev_unregister:
> +	v4l2_device_unregister(&cif_dev->v4l2_dev);
> +err_media_dev_cleanup:
> +	media_device_cleanup(&cif_dev->media_dev);
> +	pm_runtime_disable(&pdev->dev);
> +	return ret;
> +}
> +
> +static void cif_remove(struct platform_device *pdev)
> +{
> +	struct cif_device *cif_dev = platform_get_drvdata(pdev);
> +
> +	cif_entities_unregister(cif_dev);
> +	media_device_unregister(&cif_dev->media_dev);
> +	v4l2_device_unregister(&cif_dev->v4l2_dev);
> +	media_device_cleanup(&cif_dev->media_dev);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static int cif_runtime_suspend(struct device *dev)
> +{
> +	struct cif_device *cif_dev = dev_get_drvdata(dev);
> +
> +	/*
> +	 * Reset CIF (CRU, DMA, FIFOs) to allow a clean resume.
> +	 * Since this resets the IOMMU too, we cannot issue this reset when
> +	 * resuming.
> +	 */
> +	reset_control_assert(cif_dev->cif_rst);
> +	udelay(5);
> +	reset_control_deassert(cif_dev->cif_rst);
> +
> +	clk_bulk_disable_unprepare(cif_dev->clks_num, cif_dev->clks);
> +
> +	return 0;
> +}
> +
> +static int cif_runtime_resume(struct device *dev)
> +{
> +	struct cif_device *cif_dev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(cif_dev->clks_num, cif_dev->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops cif_plat_pm_ops = {
> +	.runtime_suspend = cif_runtime_suspend,
> +	.runtime_resume = cif_runtime_resume,
> +};
> +
> +static struct platform_driver cif_plat_drv = {
> +	.driver = {
> +		   .name = CIF_DRIVER_NAME,
> +		   .of_match_table = cif_plat_of_match,
> +		   .pm = &cif_plat_pm_ops,
> +	},
> +	.probe = cif_probe,
> +	.remove_new = cif_remove,
> +};
> +module_platform_driver(cif_plat_drv);
> +
> +MODULE_DESCRIPTION("Rockchip Camera Interface (CIF) platform driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/rockchip/cif/cif-regs.h b/drivers/media/platform/rockchip/cif/cif-regs.h
> new file mode 100644
> index 000000000000..eb32998ae056
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/cif/cif-regs.h
> @@ -0,0 +1,132 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2024 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#ifndef _CIF_REGS_H
> +#define _CIF_REGS_H
> +
> +enum cif_dvp_register {
> +	CIF_DVP_CTRL,
> +	CIF_DVP_INTEN,
> +	CIF_DVP_INTSTAT,
> +	CIF_DVP_FOR,
> +	CIF_DVP_LINE_NUM_ADDR,
> +	CIF_DVP_FRM0_ADDR_Y,
> +	CIF_DVP_FRM0_ADDR_UV,
> +	CIF_DVP_FRM1_ADDR_Y,
> +	CIF_DVP_FRM1_ADDR_UV,
> +	CIF_DVP_VIR_LINE_WIDTH,
> +	CIF_DVP_SET_SIZE,
> +	CIF_DVP_SCL_CTRL,
> +	CIF_DVP_FRAME_STATUS,
> +	CIF_DVP_LAST_LINE,
> +	CIF_DVP_LAST_PIX,
> +	CIF_DVP_REGISTER_MAX,
> +	CIF_DVP_REGISTER_INVALID,
> +};
> +
> +#define CIF_FETCH_Y_LAST_LINE(VAL)		((VAL) & 0x1fff)
> +
> +#define CIF_CTRL_ENABLE_CAPTURE			BIT(0)
> +#define CIF_CTRL_MODE_PINGPONG			BIT(1)
> +#define CIF_CTRL_MODE_LINELOOP			BIT(2)
> +#define CIF_CTRL_AXI_BURST_16			(0xf << 12)
> +
> +#define CIF_INTEN_FRAME_END_EN			BIT(0)
> +#define CIF_INTEN_LINE_ERR_EN			BIT(2)
> +#define CIF_INTEN_BUS_ERR_EN			BIT(6)
> +#define CIF_INTEN_SCL_ERR_EN			BIT(7)
> +#define CIF_INTEN_PST_INF_FRAME_END_EN		BIT(9)
> +
> +#define CIF_INTSTAT_CLS				0x3ff
> +#define CIF_INTSTAT_FRAME_END			BIT(0)
> +#define CIF_INTSTAT_LINE_END			BIT(1)
> +#define CIF_INTSTAT_LINE_ERR			BIT(2)
> +#define CIF_INTSTAT_PIX_ERR			BIT(3)
> +#define CIF_INTSTAT_DFIFO_OF			BIT(5)
> +#define CIF_INTSTAT_BUS_ERR			BIT(6)
> +#define CIF_INTSTAT_PRE_INF_FRAME_END		BIT(8)
> +#define CIF_INTSTAT_PST_INF_FRAME_END		BIT(9)
> +#define CIF_INTSTAT_FRAME_END_CLR		BIT(0)
> +#define CIF_INTSTAT_LINE_END_CLR		BIT(1)
> +#define CIF_INTSTAT_LINE_ERR_CLR		BIT(2)
> +#define CIF_INTSTAT_PST_INF_FRAME_END_CLR	BIT(9)
> +#define CIF_INTSTAT_ERR				0xfc
> +
> +#define CIF_FRAME_STAT_CLS			0x00
> +#define CIF_FRAME_FRM0_STAT_CLS			0x20
> +
> +#define CIF_FORMAT_VSY_HIGH_ACTIVE		BIT(0)
> +#define CIF_FORMAT_HSY_LOW_ACTIVE		BIT(1)
> +
> +#define CIF_FORMAT_INPUT_MODE_YUV		(0x00 << 2)
> +#define CIF_FORMAT_INPUT_MODE_PAL		(0x02 << 2)
> +#define CIF_FORMAT_INPUT_MODE_NTSC		(0x03 << 2)
> +#define CIF_FORMAT_INPUT_MODE_BT1120		(0x07 << 2)
> +#define CIF_FORMAT_INPUT_MODE_RAW		(0x04 << 2)
> +#define CIF_FORMAT_INPUT_MODE_JPEG		(0x05 << 2)
> +#define CIF_FORMAT_INPUT_MODE_MIPI		(0x06 << 2)
> +
> +#define CIF_FORMAT_YUV_INPUT_ORDER_UYVY		(0x00 << 5)
> +#define CIF_FORMAT_YUV_INPUT_ORDER_YVYU		(0x01 << 5)
> +#define CIF_FORMAT_YUV_INPUT_ORDER_VYUY		(0x02 << 5)
> +#define CIF_FORMAT_YUV_INPUT_ORDER_YUYV		(0x03 << 5)
> +#define CIF_FORMAT_YUV_INPUT_422		(0x00 << 7)
> +#define CIF_FORMAT_YUV_INPUT_420		BIT(7)
> +
> +#define CIF_FORMAT_INPUT_420_ORDER_ODD		BIT(8)
> +
> +#define CIF_FORMAT_CCIR_INPUT_ORDER_EVEN	BIT(9)
> +
> +#define CIF_FORMAT_RAW_DATA_WIDTH_8		(0x00 << 11)
> +#define CIF_FORMAT_RAW_DATA_WIDTH_10		(0x01 << 11)
> +#define CIF_FORMAT_RAW_DATA_WIDTH_12		(0x02 << 11)
> +
> +#define CIF_FORMAT_YUV_OUTPUT_422		(0x00 << 16)
> +#define CIF_FORMAT_YUV_OUTPUT_420		BIT(16)
> +
> +#define CIF_FORMAT_OUTPUT_420_ORDER_EVEN	(0x00 << 17)
> +#define CIF_FORMAT_OUTPUT_420_ORDER_ODD		BIT(17)
> +
> +#define CIF_FORMAT_RAWD_DATA_LITTLE_ENDIAN	(0x00 << 18)
> +#define CIF_FORMAT_RAWD_DATA_BIG_ENDIAN		BIT(18)
> +
> +#define CIF_FORMAT_UV_STORAGE_ORDER_UVUV	(0x00 << 19)
> +#define CIF_FORMAT_UV_STORAGE_ORDER_VUVU	BIT(19)
> +
> +#define CIF_FORMAT_BT1120_CLOCK_SINGLE_EDGES	(0x00 << 24)
> +#define CIF_FORMAT_BT1120_CLOCK_DOUBLE_EDGES	BIT(24)
> +#define CIF_FORMAT_BT1120_TRANSMIT_INTERFACE	(0x00 << 25)
> +#define CIF_FORMAT_BT1120_TRANSMIT_PROGRESS	BIT(25)
> +#define CIF_FORMAT_BT1120_YC_SWAP		BIT(26)
> +
> +#define CIF_SCL_CTRL_ENABLE_SCL_DOWN		BIT(0)
> +#define CIF_SCL_CTRL_ENABLE_SCL_UP		BIT(1)
> +#define CIF_SCL_CTRL_ENABLE_YUV_16BIT_BYPASS	BIT(4)
> +#define CIF_SCL_CTRL_ENABLE_RAW_16BIT_BYPASS	BIT(5)
> +#define CIF_SCL_CTRL_ENABLE_32BIT_BYPASS	BIT(6)
> +#define CIF_SCL_CTRL_DISABLE_32BIT_BYPASS	(0x00 << 6)
> +
> +#define CIF_INTSTAT_F0_READY			BIT(0)
> +#define CIF_INTSTAT_F1_READY			BIT(1)
> +
> +#define CIF_CROP_Y_SHIFT			16
> +#define CIF_CROP_X_SHIFT			0
> +
> +/* GRF register offsets */
> +#define RK3568_GRF_VI_CON0			0x340
> +#define RK3568_GRF_VI_CON1			0x344
> +#define RK3568_GRF_VI_STATUS0			0x348
> +
> +#define RK3568_GRF_VI_CON1_CIF_DATAPATH		BIT(9)
> +#define RK3568_GRF_VI_CON1_CIF_CLK_DELAYNUM	0x7f
> +#define RK3568_GRF_SET_CLK_DELAYNUM(x)		((x) & 0x7f)
> +
> +#define RK3568_GRF_WRITE_ENABLE(x)		((x) << 16)
> +
> +#endif
> diff --git a/drivers/media/platform/rockchip/cif/cif-stream.c b/drivers/media/platform/rockchip/cif/cif-stream.c
> new file mode 100644
> index 000000000000..a56ec3ac675c
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/cif/cif-stream.c
> @@ -0,0 +1,676 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2024 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "cif-common.h"
> +#include "cif-stream.h"
> +
> +#define CIF_REQ_BUFS_MIN 8
> +#define CIF_MIN_WIDTH 64
> +#define CIF_MIN_HEIGHT 64
> +#define CIF_MAX_WIDTH 8192
> +#define CIF_MAX_HEIGHT 8192
> +
> +static inline struct cif_buffer *to_cif_buffer(struct vb2_v4l2_buffer *vb)
> +{
> +	return container_of(vb, struct cif_buffer, vb);
> +}
> +
> +static inline struct cif_stream *to_cif_stream(struct video_device *vdev)
> +{
> +	return container_of(vdev, struct cif_stream, vdev);
> +}
> +
> +static const struct cif_output_fmt *
> +cif_stream_find_output_fmt(struct cif_stream *stream, u32 pixelfmt)
> +{
> +	const struct cif_output_fmt *fmt;
> +	unsigned int i;
> +
> +	for (i = 0; i < stream->out_fmts_num; i++) {
> +		fmt = &stream->out_fmts[i];
> +		if (fmt->fourcc == pixelfmt)
> +			return fmt;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct cif_buffer *cif_stream_pop_buffer(struct cif_stream *stream)
> +{
> +	struct cif_buffer *buffer = NULL;
> +	unsigned long lock_flags;
> +
> +	spin_lock_irqsave(&stream->driver_queue_lock, lock_flags);
> +
> +	if (list_empty(&stream->driver_queue))
> +		goto err_empty;
> +
> +	buffer = list_first_entry(&stream->driver_queue, struct cif_buffer,
> +				  queue);
> +	list_del(&buffer->queue);
> +
> +err_empty:
> +	spin_unlock_irqrestore(&stream->driver_queue_lock, lock_flags);
> +	return buffer;
> +}
> +
> +static void cif_stream_push_buffer(struct cif_stream *stream,
> +				   struct cif_buffer *buffer)
> +{
> +	unsigned long lock_flags;
> +
> +	spin_lock_irqsave(&stream->driver_queue_lock, lock_flags);
> +	list_add_tail(&buffer->queue, &stream->driver_queue);
> +	spin_unlock_irqrestore(&stream->driver_queue_lock, lock_flags);
> +}
> +
> +static inline void cif_stream_return_buffer(struct cif_stream *stream,

stream is unused here.

> +					    struct cif_buffer *buffer,
> +					    enum vb2_buffer_state state)
> +{
> +	struct vb2_v4l2_buffer *vb = &buffer->vb;
> +
> +	vb2_buffer_done(&vb->vb2_buf, state);
> +}
> +
> +static void cif_stream_complete_buffer(struct cif_stream *stream,
> +				       struct cif_buffer *buffer)
> +{
> +	struct vb2_v4l2_buffer *vb = &buffer->vb;
> +
> +	vb->vb2_buf.timestamp = ktime_get_ns();
> +	vb->sequence = stream->frame_idx;
> +	vb2_buffer_done(&vb->vb2_buf, VB2_BUF_STATE_DONE);
> +	stream->frame_idx++;
> +}
> +
> +void cif_stream_pingpong(struct cif_stream *stream)
> +{
> +	struct cif_buffer *buffer;
> +
> +	if (!stream->buffers[stream->frame_phase]->is_dummy)
> +		cif_stream_complete_buffer(
> +			stream, stream->buffers[stream->frame_phase]);
> +
> +	buffer = cif_stream_pop_buffer(stream);
> +	if (buffer) {
> +		stream->buffers[stream->frame_phase] = buffer;
> +		stream->buffers[stream->frame_phase]->is_dummy = false;
> +	} else {
> +		stream->buffers[stream->frame_phase] = &stream->dummy.buffer;
> +		stream->buffers[stream->frame_phase]->is_dummy = true;
> +		dev_warn(stream->cif_dev->dev,
> +			 "no buffer available, frame will be dropped\n");
> +	}
> +
> +	if (stream->queue_buffer)
> +		stream->queue_buffer(stream, stream->frame_phase);
> +
> +	stream->frame_phase = 1 - stream->frame_phase;
> +}
> +
> +static int cif_stream_init_buffers(struct cif_stream *stream)
> +{
> +	const struct cif_output_fmt *fmt = stream->active_out_fmt;
> +	struct v4l2_pix_format_mplane *pix = &stream->pix;
> +	int i;
> +
> +	stream->buffers[0] = cif_stream_pop_buffer(stream);
> +	if (!stream->buffers[0])
> +		goto err_buff_0;
> +
> +	stream->buffers[1] = cif_stream_pop_buffer(stream);
> +	if (!stream->buffers[1])
> +		goto err_buff_1;
> +
> +	if (stream->queue_buffer) {
> +		stream->queue_buffer(stream, 0);
> +		stream->queue_buffer(stream, 1);
> +	}
> +
> +	stream->dummy.size = fmt->cplanes * pix->plane_fmt[0].sizeimage;
> +	stream->dummy.vaddr =
> +		dma_alloc_attrs(stream->cif_dev->dev, stream->dummy.size,
> +				&stream->dummy.buffer.buff_addr[0], GFP_KERNEL,
> +				DMA_ATTR_NO_KERNEL_MAPPING);
> +	if (!stream->dummy.vaddr)
> +		goto err_dummy;
> +
> +	for (i = 1; i < fmt->cplanes; i++)
> +		stream->dummy.buffer.buff_addr[i] =
> +			stream->dummy.buffer.buff_addr[i - 1] +
> +			pix->plane_fmt[i - 1].bytesperline * pix->height;
> +
> +	return 0;
> +
> +err_dummy:
> +	cif_stream_return_buffer(stream, stream->buffers[1],
> +				 VB2_BUF_STATE_QUEUED);
> +	stream->buffers[1] = NULL;
> +
> +err_buff_1:
> +	cif_stream_return_buffer(stream, stream->buffers[0],
> +				 VB2_BUF_STATE_QUEUED);
> +	stream->buffers[0] = NULL;
> +err_buff_0:
> +	return -EINVAL;
> +}
> +
> +static void cif_stream_return_all_buffers(struct cif_stream *stream,
> +					  enum vb2_buffer_state state)
> +{
> +	struct cif_buffer *buffer;
> +
> +	dma_free_attrs(stream->cif_dev->dev, stream->dummy.size,
> +		       stream->dummy.vaddr, stream->dummy.buffer.buff_addr[0],
> +		       DMA_ATTR_NO_KERNEL_MAPPING);
> +
> +	if (stream->buffers[0]) {
> +		cif_stream_return_buffer(stream, stream->buffers[0], state);
> +		stream->buffers[0] = NULL;
> +	}
> +
> +	if (stream->buffers[1]) {
> +		cif_stream_return_buffer(stream, stream->buffers[1], state);
> +		stream->buffers[1] = NULL;
> +	}
> +
> +	while ((buffer = cif_stream_pop_buffer(stream)))
> +		cif_stream_return_buffer(stream, buffer, state);
> +}
> +
> +static int cif_stream_setup_queue(struct vb2_queue *queue,
> +				  unsigned int *num_buffers,
> +				  unsigned int *num_planes,
> +				  unsigned int sizes[],
> +				  struct device *alloc_devs[])
> +{
> +	struct cif_stream *stream = queue->drv_priv;
> +	struct v4l2_pix_format_mplane *pix = &stream->pix;
> +	unsigned int i;
> +
> +	if (*num_planes) {
> +		if (*num_planes != pix->num_planes)
> +			return -EINVAL;
> +
> +		for (i = 0; i < pix->num_planes; i++)
> +			if (sizes[i] < pix->plane_fmt[i].sizeimage)
> +				return -EINVAL;
> +	} else {
> +		*num_planes = pix->num_planes;
> +		for (i = 0; i < pix->num_planes; i++)
> +			sizes[i] = pix->plane_fmt[i].sizeimage;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cif_stream_prepare_buffer(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct cif_buffer *buffer = to_cif_buffer(vbuf);
> +	struct cif_stream *stream = vb->vb2_queue->drv_priv;
> +	const struct cif_output_fmt *fmt = stream->active_out_fmt;
> +	struct v4l2_pix_format_mplane *pix = &stream->pix;
> +	unsigned int i;
> +
> +	memset(buffer->buff_addr, 0, sizeof(buffer->buff_addr));
> +	for (i = 0; i < pix->num_planes; i++)
> +		buffer->buff_addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
> +
> +	/* apply fallback for non-mplane formats, if required */
> +	if (pix->num_planes == 1) {
> +		for (i = 1; i < fmt->cplanes; i++)
> +			buffer->buff_addr[i] =
> +				buffer->buff_addr[i - 1] +
> +				pix->plane_fmt[i - 1].bytesperline *
> +					pix->height;
> +	}
> +
> +	for (i = 0; i < pix->num_planes; i++) {
> +		unsigned long size = pix->plane_fmt[i].sizeimage;
> +
> +		if (vb2_plane_size(vb, i) < size) {
> +			dev_err(stream->cif_dev->dev,
> +				"user buffer too small (%ld < %ld)\n",
> +				vb2_plane_size(vb, i), size);
> +			return -EINVAL;
> +		}
> +
> +		vb2_set_plane_payload(vb, i, size);
> +	}
> +
> +	return 0;
> +}
> +
> +static void cif_stream_queue_buffer(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct cif_buffer *buffer = to_cif_buffer(vbuf);
> +	struct cif_stream *stream = vb->vb2_queue->drv_priv;
> +
> +	cif_stream_push_buffer(stream, buffer);
> +}
> +
> +static int cif_stream_start_streaming(struct vb2_queue *queue,
> +				      unsigned int count)
> +{
> +	struct cif_stream *stream = queue->drv_priv;
> +	struct cif_device *cif_dev = stream->cif_dev;
> +	struct v4l2_subdev *sd = stream->remote->sd;
> +	int ret;
> +
> +	stream->frame_idx = 0;
> +	stream->frame_phase = 0;
> +
> +	ret = video_device_pipeline_start(&stream->vdev, &stream->pipeline);
> +	if (ret) {
> +		dev_err(cif_dev->dev, "failed to start pipeline %d\n", ret);
> +		goto err_out;
> +	}
> +
> +	ret = pm_runtime_resume_and_get(cif_dev->dev);
> +	if (ret < 0) {
> +		dev_err(cif_dev->dev, "failed to get runtime pm, %d\n", ret);
> +		goto err_pipeline_stop;
> +	}
> +
> +	ret = cif_stream_init_buffers(stream);
> +	if (ret)
> +		goto err_runtime_put;
> +
> +	if (stream->start_streaming) {
> +		ret = stream->start_streaming(stream);
> +		if (ret < 0)
> +			goto err_runtime_put;
> +	}
> +
> +	ret = v4l2_subdev_call(sd, video, s_stream, 1);

Could you use v4l2_subdev_enable_streams() instead for this?

See e.g. drivers/media/pci/intel/ipu6 for an example.

> +	if (ret < 0)
> +		goto err_stop_stream;
> +
> +	return 0;
> +
> +err_stop_stream:
> +	if (stream->stop_streaming)
> +		stream->stop_streaming(stream);
> +err_runtime_put:
> +	pm_runtime_put(cif_dev->dev);
> +err_pipeline_stop:
> +	video_device_pipeline_stop(&stream->vdev);
> +err_out:
> +	cif_stream_return_all_buffers(stream, VB2_BUF_STATE_QUEUED);
> +	return ret;
> +}
> +
> +static void cif_stream_stop_streaming(struct vb2_queue *queue)
> +{
> +	struct cif_stream *stream = queue->drv_priv;
> +	struct cif_device *cif_dev = stream->cif_dev;
> +	struct v4l2_subdev *sd = stream->remote->sd;
> +	int ret;
> +
> +	v4l2_subdev_call(sd, video, s_stream, 0);

Similarly here.

> +
> +	stream->stopping = true;
> +	ret = wait_event_timeout(stream->wq_stopped, !stream->stopping,
> +				 msecs_to_jiffies(1000));
> +
> +	if (!ret && stream->stop_streaming)
> +		stream->stop_streaming(stream);
> +
> +	pm_runtime_put(cif_dev->dev);
> +
> +	cif_stream_return_all_buffers(stream, VB2_BUF_STATE_ERROR);
> +
> +	video_device_pipeline_stop(&stream->vdev);
> +}
> +
> +static const struct vb2_ops cif_stream_vb2_ops = {
> +	.queue_setup = cif_stream_setup_queue,
> +	.buf_prepare = cif_stream_prepare_buffer,
> +	.buf_queue = cif_stream_queue_buffer,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +	.start_streaming = cif_stream_start_streaming,
> +	.stop_streaming = cif_stream_stop_streaming,
> +};
> +
> +static int cif_stream_try_format(struct file *file, void *fh,
> +				 struct v4l2_format *f)
> +{
> +	struct cif_stream *stream = video_drvdata(file);
> +	const struct cif_output_fmt *fmt;
> +	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
> +	struct v4l2_subdev *sd = stream->remote->sd;
> +	struct v4l2_subdev_format sd_fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +	};
> +	u32 height, width;
> +	int ret;
> +
> +	fmt = cif_stream_find_output_fmt(stream, pix->pixelformat);
> +	if (!fmt)
> +		fmt = &stream->out_fmts[0];
> +
> +	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
> +	if (ret < 0)
> +		return ret;
> +
> +	height = clamp_t(u32, sd_fmt.format.height, CIF_MIN_HEIGHT,
> +			 CIF_MAX_HEIGHT);
> +	width = clamp_t(u32, sd_fmt.format.width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
> +
> +	pix->field = sd_fmt.format.field;
> +	pix->colorspace = sd_fmt.format.colorspace;
> +	pix->ycbcr_enc = sd_fmt.format.ycbcr_enc;
> +	pix->quantization = sd_fmt.format.quantization;
> +	pix->xfer_func = sd_fmt.format.xfer_func;
> +
> +	v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
> +
> +	return 0;
> +}
> +
> +static int cif_stream_set_format(struct file *file, void *priv,
> +				 struct v4l2_format *f)
> +{
> +	struct cif_stream *stream = video_drvdata(file);
> +	int ret;
> +
> +	if (vb2_is_busy(&stream->buf_queue))
> +		return -EBUSY;
> +
> +	ret = cif_stream_try_format(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	stream->pix = f->fmt.pix_mp;
> +	stream->active_out_fmt =
> +		cif_stream_find_output_fmt(stream, f->fmt.pix_mp.pixelformat);
> +
> +	return 0;
> +}
> +
> +static int cif_stream_get_format(struct file *file, void *fh,
> +				 struct v4l2_format *f)
> +{
> +	struct cif_stream *stream = video_drvdata(file);
> +
> +	f->fmt.pix_mp = stream->pix;
> +
> +	return 0;
> +}
> +
> +static int cif_stream_enum_formats(struct file *file, void *priv,
> +				   struct v4l2_fmtdesc *f)
> +{
> +	struct cif_stream *stream = video_drvdata(file);
> +
> +	if (f->index >= stream->out_fmts_num)
> +		return -EINVAL;
> +
> +	f->pixelformat = stream->out_fmts[f->index].fourcc;
> +
> +	return 0;
> +}
> +
> +static int cif_stream_enum_framesizes(struct file *file, void *fh,
> +				      struct v4l2_frmsizeenum *fsize)
> +{
> +	struct cif_stream *stream = video_drvdata(file);
> +	struct v4l2_subdev_frame_size_enum fse = {
> +		.index = fsize->index,
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +	};
> +	struct v4l2_subdev *sd = stream->remote->sd;
> +	const struct cif_output_fmt *fmt;
> +	int ret;
> +
> +	fmt = cif_stream_find_output_fmt(stream, fsize->pixel_format);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	fse.code = fmt->mbus_code;
> +
> +	ret = v4l2_subdev_call(sd, pad, enum_frame_size, NULL, &fse);

You shouldn't get this information from the sensor driver but just convey
what this device supports.

> +	if (ret)
> +		return ret;
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
> +	fsize->discrete.width = fse.max_width;
> +	fsize->discrete.height = fse.max_height;
> +
> +	/* some variants may have a scaler in the path. */
> +	/* TODO: add support for them */
> +
> +	return 0;
> +}
> +
> +static int cif_stream_enum_frameintervals(struct file *file, void *fh,
> +					  struct v4l2_frmivalenum *fival)
> +{
> +	struct cif_stream *stream = video_drvdata(file);
> +	struct v4l2_subdev *sd = stream->remote->sd;
> +	struct v4l2_subdev_frame_interval_enum fie = {
> +		.index = fival->index,
> +		.width = fival->width,
> +		.height = fival->height,
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +	};
> +	const struct cif_output_fmt *fmt;
> +	int ret;
> +
> +	fmt = cif_stream_find_output_fmt(stream, fival->pixel_format);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	fie.code = fmt->mbus_code;
> +
> +	ret = v4l2_subdev_call(sd, pad, enum_frame_interval, NULL, &fie);
> +	if (ret)
> +		return ret;

Enumerating frame intervals on a video device isn't relevant for an
MC-centric driver. I.e. you can drop this.

> +
> +	fival->type = V4L2_FRMSIZE_TYPE_DISCRETE;
> +	fival->discrete = fie.interval;
> +
> +	return 0;
> +}
> +
> +static int cif_stream_querycap(struct file *file, void *priv,
> +			       struct v4l2_capability *cap)
> +{
> +	struct cif_stream *stream = video_drvdata(file);
> +	struct device *dev = stream->cif_dev->dev;
> +
> +	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
> +	strscpy(cap->card, dev->driver->name, sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> +		 dev_name(dev));

The bus_info field is already filled by the framework.

> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops cif_stream_ioctl_ops = {
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +	.vidioc_try_fmt_vid_cap_mplane = cif_stream_try_format,
> +	.vidioc_s_fmt_vid_cap_mplane = cif_stream_set_format,
> +	.vidioc_g_fmt_vid_cap_mplane = cif_stream_get_format,
> +	.vidioc_enum_fmt_vid_cap = cif_stream_enum_formats,
> +	.vidioc_enum_framesizes = cif_stream_enum_framesizes,
> +	.vidioc_enum_frameintervals = cif_stream_enum_frameintervals,
> +	.vidioc_querycap = cif_stream_querycap,
> +	.vidioc_subscribe_event = v4l2_src_change_event_subscribe,
> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +};
> +
> +static int cif_stream_link_validate(struct media_link *link)
> +{
> +	struct video_device *vdev =
> +		media_entity_to_video_device(link->sink->entity);
> +	struct v4l2_subdev *sd =
> +		media_entity_to_v4l2_subdev(link->source->entity);
> +	struct cif_stream *stream = to_cif_stream(vdev);
> +	struct v4l2_subdev_format sd_fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.pad = 0,
> +	};
> +	const struct cif_input_fmt *cif_in_fmt = NULL;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
> +	if (ret < 0)
> +		goto err_out;
> +
> +	for (i = 0; i < stream->in_fmts_num; i++) {
> +		if (sd_fmt.format.code == stream->in_fmts[i].mbus_code &&
> +		    sd_fmt.format.field == stream->in_fmts[i].field) {
> +			cif_in_fmt = &stream->in_fmts[i];
> +			break;
> +		}
> +	}
> +	if (!cif_in_fmt) {
> +		dev_err(stream->cif_dev->dev,
> +			"remote's mbus code not supported\n");
> +		goto err_out;
> +	}
> +
> +	if (sd_fmt.format.height != stream->pix.height ||
> +	    sd_fmt.format.width != stream->pix.width) {
> +		dev_err(stream->cif_dev->dev,

This should be dev_dbg() for the error can be triggered by the user by
providing a bad configuration (and thus filling logs). Same above actually.

> +			"link '%s':%u -> '%s':%u not valid: %ux%u != %ux%u\n",
> +			link->source->entity->name, link->source->index,
> +			link->sink->entity->name, link->sink->index,
> +			sd_fmt.format.width, sd_fmt.format.height,
> +			stream->pix.width, stream->pix.height);
> +		goto err_out;
> +	}
> +
> +	stream->active_in_fmt = cif_in_fmt;
> +	return 0;
> +
> +err_out:
> +	stream->active_in_fmt = NULL;
> +	return -EPIPE;
> +}
> +
> +static const struct media_entity_operations cif_stream_media_ops = {
> +	.link_validate = cif_stream_link_validate,
> +};
> +
> +static const struct v4l2_file_operations cif_stream_file_ops = {
> +	.open = v4l2_fh_open,
> +	.release = vb2_fop_release,
> +	.unlocked_ioctl = video_ioctl2,
> +	.poll = vb2_fop_poll,
> +	.mmap = vb2_fop_mmap,
> +};
> +
> +static int cif_stream_init_vb2_queue(struct vb2_queue *q,
> +				     struct cif_stream *stream)
> +{
> +	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
> +	q->drv_priv = stream;
> +	q->ops = &cif_stream_vb2_ops;
> +	q->mem_ops = &vb2_dma_contig_memops;
> +	q->buf_struct_size = sizeof(struct cif_buffer);
> +	q->min_queued_buffers = CIF_REQ_BUFS_MIN;
> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->lock = &stream->vlock;
> +	q->dev = stream->cif_dev->dev;
> +
> +	return vb2_queue_init(q);
> +}
> +
> +int cif_stream_register(struct cif_device *cif_dev, struct cif_stream *stream,
> +			const struct cif_stream_config *config)
> +{
> +	struct v4l2_device *v4l2_dev = &cif_dev->v4l2_dev;
> +	struct video_device *vdev = &stream->vdev;
> +	int ret;
> +
> +	stream->cif_dev = cif_dev;
> +
> +	INIT_LIST_HEAD(&stream->driver_queue);
> +	spin_lock_init(&stream->driver_queue_lock);
> +
> +	init_waitqueue_head(&stream->wq_stopped);
> +
> +	mutex_init(&stream->vlock);
> +
> +	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING |
> +			    V4L2_CAP_IO_MC;
> +	vdev->entity.ops = &cif_stream_media_ops;
> +	vdev->fops = &cif_stream_file_ops;
> +	vdev->ioctl_ops = &cif_stream_ioctl_ops;
> +	vdev->lock = &stream->vlock;
> +	vdev->minor = -1;
> +	vdev->release = video_device_release_empty;
> +	vdev->v4l2_dev = v4l2_dev;
> +	vdev->vfl_dir = VFL_DIR_RX;
> +	video_set_drvdata(vdev, stream);
> +
> +	stream->pad.flags = MEDIA_PAD_FL_SINK;
> +
> +	cif_stream_init_vb2_queue(&stream->buf_queue, stream);
> +
> +	vdev->queue = &stream->buf_queue;
> +	if (config->name)
> +		strscpy(vdev->name, config->name, sizeof(vdev->name));
> +
> +	ret = media_entity_pads_init(&vdev->entity, 1, &stream->pad);
> +	if (ret < 0) {
> +		dev_err(cif_dev->dev, "failed to initialize media pads: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret < 0) {
> +		dev_err(cif_dev->dev, "failed to register video device: %d\n",
> +			ret);
> +		goto err_media_entity_cleanup;
> +	}
> +
> +	v4l2_info(v4l2_dev, "registered %s as /dev/video%d\n", vdev->name,
> +		  vdev->num);
> +
> +	return 0;
> +
> +err_media_entity_cleanup:
> +	media_entity_cleanup(&stream->vdev.entity);
> +	return ret;
> +}
> +
> +void cif_stream_unregister(struct cif_stream *stream)
> +{
> +	video_unregister_device(&stream->vdev);
> +	media_entity_cleanup(&stream->vdev.entity);
> +}
> diff --git a/drivers/media/platform/rockchip/cif/cif-stream.h b/drivers/media/platform/rockchip/cif/cif-stream.h
> new file mode 100644
> index 000000000000..5bfa260eda83
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/cif/cif-stream.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2024 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#ifndef _CIF_STREAM_H
> +#define _CIF_STREAM_H
> +
> +#include "cif-common.h"
> +
> +struct cif_stream_config {
> +	const char *name;
> +};
> +
> +void cif_stream_pingpong(struct cif_stream *stream);
> +
> +int cif_stream_register(struct cif_device *cif_dev, struct cif_stream *stream,
> +			const struct cif_stream_config *config);
> +
> +void cif_stream_unregister(struct cif_stream *stream);

There are other CIFs out there. I think it'd be good to use either some
Rockchip specific prefix (rk maybe?) or a namespace.

> +
> +#endif
> 

-- 
Kind regards,

Sakari Ailus

