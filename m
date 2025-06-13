Return-Path: <linux-media+bounces-34753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAC7AD8C37
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 14:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53B0B1E0F7C
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 12:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C17F1DDD1;
	Fri, 13 Jun 2025 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSHmln6s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE231CAA4;
	Fri, 13 Jun 2025 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749818057; cv=none; b=c/vFBUid76xyd95LB/jO8PGE9/PrNnNEmZ0vQ6udEs0q4SByBwTQ0kBA74x1EQmIxahCdYSAunuSnt3xtQn4ExRNWm6j65XZhjAekuRbEXUdF2+0leM51xEXZblphTZotIZ+ZNpj2X5/XPmpFeqoeUy93nuy0mvxJcZpGK47RfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749818057; c=relaxed/simple;
	bh=2rD4/7t4NzzlnUFqAvGpFXsLwHzl759mO44GYryqtGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/PcVMthTxXXKPLy1qbvk3QlpbjucHeWRPaAAg8wlmER5EDihg7NtE77FbCDzdCqz6X+/5O4czi2ThRx82UO0m3w4Cy7ar1MlM6LSdcXOxrkJHPszLAHYygKeU91CVDksTIpc3tQ7G3eR7pKaN3qpt40pE9sOl/ZwkVm62O5in0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSHmln6s; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749818054; x=1781354054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2rD4/7t4NzzlnUFqAvGpFXsLwHzl759mO44GYryqtGM=;
  b=BSHmln6sVpa1uOTzwj3SiYpvgG3HQeDfhZawQuJY5xbk6v2AITL3lKVq
   VDLAKXaKLFj1ThWFp9KkxMq/V0pAOskvNrH3QkuaVFhGrBRmMilZjiUWb
   p2xmBpR9vOIaU8eWJheyBTF4UTbua5l6yxaSQyDDRBmKrwBirAjmMjw8t
   qIpZRcpwzhDniSFdlm7ElyeTx4x2+vV7c+sDH8HGD/rRm2zF2lN/78Ogq
   brRGG3AedMEAn9qD67KA2oP7c/HwlDPUXkd1zYz8rJ1cKwEui2o2Xpc6j
   JQwNbZCXO644Z3rvQjB21Ua1uXPZt8ZjrlHh6dmOh4Wx6CdrEMBEAlAG1
   Q==;
X-CSE-ConnectionGUID: ygaCHNJCS7itmSWorHYGIg==
X-CSE-MsgGUID: NmSvbENEQym/WmigYNeg/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="62683938"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="62683938"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:34:12 -0700
X-CSE-ConnectionGUID: PkWdDxcTSGK3y6sWXRBqSg==
X-CSE-MsgGUID: zYj+eGvFR7i3xbHOOgvYtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="178717594"
Received: from abityuts-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.147])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:34:03 -0700
Date: Fri, 13 Jun 2025 14:33:56 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Markus Elfring <Markus.Elfring@web.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v8 06/13] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <656zxutvwytnd5i5l3nknni47r3wofmmwtxycleekjtrkbgfeo@xm7xbzirh3ce>
References: <20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com>
 <20240220-rk3568-vicap-v8-6-9d9cbc4b524d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v8-6-9d9cbc4b524d@collabora.com>

Hi Michael,

Thank you for the patch.

On Wed, Jun 11, 2025 at 07:06:51PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs
> in different variations. For example, the PX30 Video Input Processor (VIP)
> is able to receive video data via the Digital Video Port (DVP, a parallel
> data interface) and transfer it into system memory using a
> double-buffering mechanism called ping-pong mode.
> The RK3568 Video Capture (VICAP) unit, on the other hand, features a DVP
> and a MIPI CSI-2 receiver that can receive video data independently
> (both using the ping-pong scheme).
> The different variants may have additional features, such as scaling
> and/or cropping.
> Finally, the RK3588 VICAP unit constitutes an essential piece of the
> camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
> units, and a data path multiplexer (to scaler units, to ISP, ...).
> 
> Add a basic media controller centric V4L2 driver for the Rockchip CIF with
>  - support for the PX30 VIP
>  - support for the RK3568 VICAP DVP
>  - abstraction for the ping-pong scheme to allow for future extensions
>  - abstraction for the INTERFACE and CROP parts to allow for future
>    extensions
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
> Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  MAINTAINERS                                        |   1 +
>  drivers/media/platform/rockchip/Kconfig            |   1 +
>  drivers/media/platform/rockchip/Makefile           |   1 +
>  drivers/media/platform/rockchip/rkcif/Kconfig      |  18 +
>  drivers/media/platform/rockchip/rkcif/Makefile     |   7 +
>  .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 864 +++++++++++++++++++++
>  .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  24 +
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.c   |  27 +
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |  20 +
>  .../media/platform/rockchip/rkcif/rkcif-common.h   | 220 ++++++
>  drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 301 +++++++
>  .../platform/rockchip/rkcif/rkcif-interface.c      | 423 ++++++++++
>  .../platform/rockchip/rkcif/rkcif-interface.h      |  30 +
>  drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 132 ++++
>  .../media/platform/rockchip/rkcif/rkcif-stream.c   | 634 +++++++++++++++
>  .../media/platform/rockchip/rkcif/rkcif-stream.h   |  31 +
>  16 files changed, 2734 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 159ed29e196a..40d806c206be 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21430,6 +21430,7 @@ S:	Maintained
>  F:	Documentation/admin-guide/media/rkcif*
>  F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
>  F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> +F:	drivers/media/platform/rockchip/rkcif/
>  
>  ROCKCHIP CRYPTO DRIVERS
>  M:	Corentin Labbe <clabbe@baylibre.com>
> diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
> index b41d3960c1b4..549f4e9f443e 100644
> --- a/drivers/media/platform/rockchip/Kconfig
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -3,4 +3,5 @@
>  comment "Rockchip media platform drivers"
>  
>  source "drivers/media/platform/rockchip/rga/Kconfig"
> +source "drivers/media/platform/rockchip/rkcif/Kconfig"
>  source "drivers/media/platform/rockchip/rkisp1/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/platform/rockchip/Makefile
> index 4f782b876ac9..6aba32c8830c 100644
> --- a/drivers/media/platform/rockchip/Makefile
> +++ b/drivers/media/platform/rockchip/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y += rga/
> +obj-y += rkcif/
>  obj-y += rkisp1/
> diff --git a/drivers/media/platform/rockchip/rkcif/Kconfig b/drivers/media/platform/rockchip/rkcif/Kconfig
> new file mode 100644
> index 000000000000..efd82ac35bd8
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/Kconfig
> @@ -0,0 +1,18 @@
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
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called rockchip-cif.
> diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
> new file mode 100644
> index 000000000000..818424972c7b
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-cif.o
> +rockchip-cif-objs += rkcif-dev.o \
> +	rkcif-capture-dvp.o \
> +	rkcif-capture-mipi.o \
> +	rkcif-interface.o \
> +	rkcif-stream.o
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
> new file mode 100644
> index 000000000000..0180d8c94b07
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
> @@ -0,0 +1,864 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "rkcif-capture-dvp.h"
> +#include "rkcif-common.h"
> +#include "rkcif-interface.h"
> +#include "rkcif-regs.h"
> +#include "rkcif-stream.h"
> +
> +static const struct rkcif_output_fmt dvp_out_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_422 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_UVUV,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV16M,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_422 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_UVUV,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV61,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_422 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_VUVU,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV61M,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_422 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_VUVU,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV12,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_420 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_UVUV,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV12M,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_420 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_UVUV,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV21,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_420 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_VUVU,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV21M,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_420 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_VUVU,
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
> +static const struct rkcif_input_fmt px30_dvp_in_fmts[] = {
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	}
> +};
> +
> +const struct rkcif_dvp_match_data rkcif_px30_vip_dvp_match_data = {
> +	.in_fmts = px30_dvp_in_fmts,
> +	.in_fmts_num = ARRAY_SIZE(px30_dvp_in_fmts),
> +	.out_fmts = dvp_out_fmts,
> +	.out_fmts_num = ARRAY_SIZE(dvp_out_fmts),
> +	.has_scaler = true,
> +	.regs = {
> +		[RKCIF_DVP_CTRL] = 0x00,
> +		[RKCIF_DVP_INTEN] = 0x04,
> +		[RKCIF_DVP_INTSTAT] = 0x08,
> +		[RKCIF_DVP_FOR] = 0x0c,
> +		[RKCIF_DVP_LINE_NUM_ADDR] = 0x10,
> +		[RKCIF_DVP_FRM0_ADDR_Y] = 0x14,
> +		[RKCIF_DVP_FRM0_ADDR_UV] = 0x18,
> +		[RKCIF_DVP_FRM1_ADDR_Y] = 0x1c,
> +		[RKCIF_DVP_FRM1_ADDR_UV] = 0x20,
> +		[RKCIF_DVP_VIR_LINE_WIDTH] = 0x24,
> +		[RKCIF_DVP_SET_SIZE] = 0x28,
> +		[RKCIF_DVP_SCL_CTRL] = 0x48,
> +		[RKCIF_DVP_FRAME_STATUS] = 0x60,
> +		[RKCIF_DVP_LAST_LINE] = 0x68,
> +		[RKCIF_DVP_LAST_PIX] = 0x6c,
> +	},
> +};
> +
> +static const struct rkcif_input_fmt rk3568_dvp_in_fmts[] = {
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
> +			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
> +			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
> +			       RKCIF_FORMAT_BT1120_YC_SWAP |
> +			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       RKCIF_FORMAT_BT1120_YC_SWAP |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
> +			       RKCIF_FORMAT_BT1120_YC_SWAP |
> +			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       RKCIF_FORMAT_BT1120_YC_SWAP |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +};
> +
> +static void rk3568_dvp_grf_setup(struct rkcif_device *rkcif)
> +{
> +	u32 con1 = RK3568_GRF_WRITE_ENABLE(RK3568_GRF_VI_CON1_CIF_DATAPATH |
> +					   RK3568_GRF_VI_CON1_CIF_CLK_DELAYNUM);
> +
> +	if (!rkcif->grf)
> +		return;
> +
> +	con1 |= rkcif->interfaces[RKCIF_DVP].dvp.dvp_clk_delay &
> +		RK3568_GRF_VI_CON1_CIF_CLK_DELAYNUM;
> +
> +	if (rkcif->interfaces[RKCIF_DVP].vep.bus.parallel.flags &
> +	    V4L2_MBUS_PCLK_SAMPLE_DUALEDGE)
> +		con1 |= RK3568_GRF_VI_CON1_CIF_DATAPATH;
> +
> +	regmap_write(rkcif->grf, RK3568_GRF_VI_CON1, con1);
> +}
> +
> +const struct rkcif_dvp_match_data rkcif_rk3568_vicap_dvp_match_data = {
> +	.in_fmts = rk3568_dvp_in_fmts,
> +	.in_fmts_num = ARRAY_SIZE(rk3568_dvp_in_fmts),
> +	.out_fmts = dvp_out_fmts,
> +	.out_fmts_num = ARRAY_SIZE(dvp_out_fmts),
> +	.setup = rk3568_dvp_grf_setup,
> +	.has_scaler = false,
> +	.regs = {
> +		[RKCIF_DVP_CTRL] = 0x00,
> +		[RKCIF_DVP_INTEN] = 0x04,
> +		[RKCIF_DVP_INTSTAT] = 0x08,
> +		[RKCIF_DVP_FOR] = 0x0c,
> +		[RKCIF_DVP_LINE_NUM_ADDR] = 0x2c,
> +		[RKCIF_DVP_FRM0_ADDR_Y] = 0x14,
> +		[RKCIF_DVP_FRM0_ADDR_UV] = 0x18,
> +		[RKCIF_DVP_FRM1_ADDR_Y] = 0x1c,
> +		[RKCIF_DVP_FRM1_ADDR_UV] = 0x20,
> +		[RKCIF_DVP_VIR_LINE_WIDTH] = 0x24,
> +		[RKCIF_DVP_SET_SIZE] = 0x28,
> +		[RKCIF_DVP_CROP] = 0x34,
> +		[RKCIF_DVP_FRAME_STATUS] = 0x3c,
> +		[RKCIF_DVP_LAST_LINE] = 0x44,
> +		[RKCIF_DVP_LAST_PIX] = 0x48,
> +	},
> +};
> +
> +static inline unsigned int cif_dvp_get_addr(struct rkcif_device *rkcif,
> +					    unsigned int index)
> +{
> +	if (WARN_ON_ONCE(index >= RKCIF_DVP_REGISTER_MAX))
> +		return RKCIF_REGISTER_NOTSUPPORTED;
> +
> +	return rkcif->match_data->dvp->regs[index];
> +}
> +
> +static inline __maybe_unused void cif_dvp_write(struct rkcif_device *rkcif,
> +						unsigned int index, u32 val)
> +{
> +	unsigned int addr = cif_dvp_get_addr(rkcif, index);
> +
> +	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
> +		return;
> +
> +	writel(val, rkcif->base_addr + addr);
> +}
> +
> +static inline __maybe_unused u32 cif_dvp_read(struct rkcif_device *rkcif,
> +					      unsigned int index)
> +{
> +	unsigned int addr = cif_dvp_get_addr(rkcif, index);
> +
> +	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
> +		return 0;
> +
> +	return readl(rkcif->base_addr + addr);
> +}
> +
> +static void cif_dvp_queue_buffer(struct rkcif_stream *stream,
> +				 unsigned int index)
> +{
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	struct rkcif_buffer *buffer = stream->buffers[index];
> +	u32 frm_addr_y, frm_addr_uv;
> +
> +	frm_addr_y = index ? RKCIF_DVP_FRM1_ADDR_Y : RKCIF_DVP_FRM0_ADDR_Y;
> +	frm_addr_uv = index ? RKCIF_DVP_FRM1_ADDR_UV : RKCIF_DVP_FRM0_ADDR_UV;
> +
> +	cif_dvp_write(rkcif, frm_addr_y, buffer->buff_addr[RKCIF_PLANE_Y]);
> +	cif_dvp_write(rkcif, frm_addr_uv, buffer->buff_addr[RKCIF_PLANE_UV]);
> +}
> +
> +static int cif_dvp_start_streaming(struct rkcif_stream *stream)
> +{
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	struct rkcif_interface *interface = stream->interface;
> +	struct v4l2_mbus_config_parallel *parallel;
> +	struct v4l2_mbus_framefmt *source_fmt;
> +	struct v4l2_subdev_state *state;
> +	const struct rkcif_input_fmt *active_in_fmt;
> +	const struct rkcif_output_fmt *active_out_fmt;
> +	u32 val = 0;
> +	int ret = -EINVAL;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
> +	source_fmt = v4l2_subdev_state_get_format(state, RKCIF_IF_PAD_SRC,
> +						  stream->id);
> +	if (!source_fmt)
> +		goto out;
> +
> +	active_in_fmt = rkcif_interface_find_input_fmt(interface, false,
> +						       source_fmt->code);
> +	active_out_fmt = rkcif_stream_find_output_fmt(stream, false,
> +						      stream->pix.pixelformat);
> +	if (!active_in_fmt || !active_out_fmt)
> +		goto out;
> +
> +	parallel = &interface->vep.bus.parallel;
> +	if (parallel->bus_width == 16 &&
> +	    (parallel->flags & V4L2_MBUS_PCLK_SAMPLE_DUALEDGE))
> +		val |= RKCIF_FORMAT_BT1120_CLOCK_DOUBLE_EDGES;
> +	val |= active_in_fmt->dvp_fmt_val;
> +	val |= active_out_fmt->dvp_fmt_val;
> +	cif_dvp_write(rkcif, RKCIF_DVP_FOR, val);
> +
> +	val = stream->pix.width;
> +	if (active_in_fmt->fmt_type == RKCIF_FMT_TYPE_RAW)
> +		val = stream->pix.width * 2;
> +	cif_dvp_write(rkcif, RKCIF_DVP_VIR_LINE_WIDTH, val);
> +
> +	val = RKCIF_XY_COORD(stream->pix.width, stream->pix.height);
> +	cif_dvp_write(rkcif, RKCIF_DVP_SET_SIZE, val);
> +
> +	cif_dvp_write(rkcif, RKCIF_DVP_FRAME_STATUS, RKCIF_FRAME_STAT_CLS);
> +	cif_dvp_write(rkcif, RKCIF_DVP_INTSTAT, RKCIF_INTSTAT_CLS);
> +	if (rkcif->match_data->dvp->has_scaler) {
> +		val = active_in_fmt->fmt_type == RKCIF_FMT_TYPE_YUV ?
> +			      RKCIF_SCL_CTRL_ENABLE_YUV_16BIT_BYPASS :
> +			      RKCIF_SCL_CTRL_ENABLE_RAW_16BIT_BYPASS;
> +		cif_dvp_write(rkcif, RKCIF_DVP_SCL_CTRL, val);
> +	}
> +
> +	cif_dvp_write(rkcif, RKCIF_DVP_INTEN,
> +		      RKCIF_INTEN_FRAME_END_EN |
> +		      RKCIF_INTEN_PST_INF_FRAME_END_EN);
> +
> +	cif_dvp_write(rkcif, RKCIF_DVP_CTRL,
> +		      RKCIF_CTRL_AXI_BURST_16 | RKCIF_CTRL_MODE_PINGPONG |
> +		      RKCIF_CTRL_ENABLE_CAPTURE);
> +
> +	ret = 0;
> +
> +out:
> +	v4l2_subdev_unlock_state(state);
> +	return ret;
> +}
> +
> +static void cif_dvp_stop_streaming(struct rkcif_stream *stream)
> +{
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	u32 val;
> +
> +	val = cif_dvp_read(rkcif, RKCIF_DVP_CTRL);
> +	cif_dvp_write(rkcif, RKCIF_DVP_CTRL,
> +		      val & (~RKCIF_CTRL_ENABLE_CAPTURE));
> +	cif_dvp_write(rkcif, RKCIF_DVP_INTEN, 0x0);
> +	cif_dvp_write(rkcif, RKCIF_DVP_INTSTAT, 0x3ff);
> +	cif_dvp_write(rkcif, RKCIF_DVP_FRAME_STATUS, 0x0);
> +
> +	stream->stopping = false;
> +}
> +
> +static void cif_dvp_reset_stream(struct rkcif_device *rkcif)
> +{
> +	u32 ctl = cif_dvp_read(rkcif, RKCIF_DVP_CTRL);
> +
> +	cif_dvp_write(rkcif, RKCIF_DVP_CTRL,
> +		      ctl & (~RKCIF_CTRL_ENABLE_CAPTURE));
> +	cif_dvp_write(rkcif, RKCIF_DVP_CTRL, ctl | RKCIF_CTRL_ENABLE_CAPTURE);
> +}
> +
> +static void rkcif_dvp_set_crop(struct rkcif_stream *stream, u16 left, u16 top)
> +{
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	u32 val;
> +
> +	val = RKCIF_XY_COORD(left, top);
> +	cif_dvp_write(rkcif, RKCIF_DVP_CROP, val);
> +}
> +
> +irqreturn_t rkcif_dvp_isr(int irq, void *ctx)
> +{
> +	struct device *dev = ctx;
> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
> +	struct rkcif_stream *stream;
> +	u32 intstat, lastline, lastpix, cif_frmst;
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	if (!rkcif->match_data->dvp)
> +		return ret;
> +
> +	intstat = cif_dvp_read(rkcif, RKCIF_DVP_INTSTAT);
> +	cif_frmst = cif_dvp_read(rkcif, RKCIF_DVP_FRAME_STATUS);
> +	lastline = RKCIF_FETCH_Y(cif_dvp_read(rkcif, RKCIF_DVP_LAST_LINE));
> +	lastpix = RKCIF_FETCH_Y(cif_dvp_read(rkcif, RKCIF_DVP_LAST_PIX));
> +
> +	if (intstat & RKCIF_INTSTAT_FRAME_END) {
> +		cif_dvp_write(rkcif, RKCIF_DVP_INTSTAT,
> +			      RKCIF_INTSTAT_FRAME_END_CLR |
> +			      RKCIF_INTSTAT_LINE_END_CLR);
> +
> +		stream = &rkcif->interfaces[RKCIF_DVP].streams[RKCIF_ID0];
> +
> +		if (stream->stopping) {
> +			cif_dvp_stop_streaming(stream);
> +			wake_up(&stream->wq_stopped);
> +			ret = IRQ_HANDLED;
> +			goto out;
> +		}
> +
> +		if (lastline != stream->pix.height) {
> +			v4l2_err(&rkcif->v4l2_dev,
> +				 "bad frame, irq:%#x frmst:%#x size:%dx%d\n",
> +				 intstat, cif_frmst, lastpix, lastline);
> +
> +			cif_dvp_reset_stream(rkcif);
> +		}
> +
> +		rkcif_stream_pingpong(stream);
> +
> +		ret = IRQ_HANDLED;
> +	}
> +out:
> +	return ret;
> +}
> +
> +int rkcif_dvp_register(struct rkcif_device *rkcif)
> +{
> +	struct rkcif_interface *interface;
> +	unsigned int streams_num;
> +	int ret;
> +
> +	if (!rkcif->match_data->dvp)
> +		return 0;
> +
> +	interface = &rkcif->interfaces[RKCIF_DVP];
> +	interface->index = RKCIF_DVP;
> +	interface->type = RKCIF_IF_DVP;
> +	interface->in_fmts = rkcif->match_data->dvp->in_fmts;
> +	interface->in_fmts_num = rkcif->match_data->dvp->in_fmts_num;
> +	interface->set_crop = rkcif_dvp_set_crop;
> +	ret = rkcif_interface_register(rkcif, interface);
> +	if (ret)
> +		return ret;
> +
> +	if (rkcif->match_data->dvp->setup)
> +		rkcif->match_data->dvp->setup(rkcif);
> +
> +	streams_num = rkcif->match_data->dvp->has_ids ? 4 : 1;
> +	for (unsigned int i = 0; i < streams_num; i++) {
> +		struct rkcif_stream *stream = &interface->streams[i];
> +
> +		stream->id = i;
> +		stream->interface = interface;
> +		stream->out_fmts = rkcif->match_data->dvp->out_fmts;
> +		stream->out_fmts_num = rkcif->match_data->dvp->out_fmts_num;
> +		stream->queue_buffer = cif_dvp_queue_buffer;
> +		stream->start_streaming = cif_dvp_start_streaming;
> +		stream->stop_streaming = cif_dvp_stop_streaming;
> +
> +		ret = rkcif_stream_register(rkcif, stream);
> +		if (ret)
> +			goto err_streams_unregister;
> +
> +		interface->streams_num++;
> +	}
> +
> +	return 0;
> +
> +err_streams_unregister:
> +	for (unsigned int i = 0; i < interface->streams_num; i++)
> +		rkcif_stream_unregister(&interface->streams[i]);
> +
> +	rkcif_interface_unregister(interface);
> +
> +	return ret;
> +}
> +
> +void rkcif_dvp_unregister(struct rkcif_device *rkcif)
> +{
> +	struct rkcif_interface *interface;
> +
> +	if (!rkcif->match_data->dvp)
> +		return;
> +
> +	interface = &rkcif->interfaces[RKCIF_DVP];
> +
> +	for (unsigned int i = 0; i < interface->streams_num; i++)
> +		rkcif_stream_unregister(&interface->streams[i]);
> +
> +	rkcif_interface_unregister(interface);
> +}
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h
> new file mode 100644
> index 000000000000..4bd72d41ec2f
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#ifndef _RKCIF_CAPTURE_DVP_H
> +#define _RKCIF_CAPTURE_DVP_H
> +
> +#include "rkcif-common.h"
> +
> +extern const struct rkcif_dvp_match_data rkcif_px30_vip_dvp_match_data;
> +extern const struct rkcif_dvp_match_data rkcif_rk3568_vicap_dvp_match_data;
> +
> +int rkcif_dvp_register(struct rkcif_device *rkcif);
> +
> +void rkcif_dvp_unregister(struct rkcif_device *rkcif);
> +
> +irqreturn_t rkcif_dvp_isr(int irq, void *ctx);
> +
> +#endif
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> new file mode 100644
> index 000000000000..0c3f7b8cfa18
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#include "rkcif-capture-mipi.h"
> +#include "rkcif-common.h"
> +#include "rkcif-stream.h"
> +
> +irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
> +{
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	return ret;
> +}
> +
> +int rkcif_mipi_register(struct rkcif_device *rkcif)
> +{
> +	return 0;
> +}
> +
> +void rkcif_mipi_unregister(struct rkcif_device *rkcif)
> +{
> +}
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
> new file mode 100644
> index 000000000000..ee1a50a59505
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#ifndef _RKCIF_CAPTURE_MIPI_H
> +#define _RKCIF_CAPTURE_MIPI_H
> +
> +#include "rkcif-common.h"
> +
> +int rkcif_mipi_register(struct rkcif_device *rkcif);
> +
> +void rkcif_mipi_unregister(struct rkcif_device *rkcif);
> +
> +irqreturn_t rkcif_mipi_isr(int irq, void *ctx);
> +
> +#endif
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> new file mode 100644
> index 000000000000..5e7bff585bca
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> @@ -0,0 +1,220 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#ifndef _RKCIF_COMMON_H
> +#define _RKCIF_COMMON_H
> +
> +#include <linux/clk.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +
> +#include <media/media-device.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "rkcif-regs.h"
> +
> +#define RKCIF_DRIVER_NAME "rockchip-cif"
> +#define RKCIF_CLK_MAX	  4
> +
> +enum rkcif_format_type {
> +	RKCIF_FMT_TYPE_INVALID,
> +	RKCIF_FMT_TYPE_YUV,
> +	RKCIF_FMT_TYPE_RAW,
> +};
> +
> +enum rkcif_id_index {
> +	RKCIF_ID0,
> +	RKCIF_ID1,
> +	RKCIF_ID2,
> +	RKCIF_ID3,
> +	RKCIF_ID_MAX
> +};
> +
> +enum rkcif_interface_index {
> +	RKCIF_DVP,
> +	RKCIF_MIPI_BASE,
> +	RKCIF_MIPI1 = RKCIF_MIPI_BASE,
> +	RKCIF_MIPI2,
> +	RKCIF_MIPI3,
> +	RKCIF_MIPI4,
> +	RKCIF_MIPI5,
> +	RKCIF_MIPI6,
> +	RKCIF_MIPI_MAX,
> +	RKCIF_IF_MAX = RKCIF_MIPI_MAX
> +};
> +
> +enum rkcif_interface_pad_index {
> +	RKCIF_IF_PAD_SINK,
> +	RKCIF_IF_PAD_SRC,
> +	RKCIF_IF_PAD_MAX
> +};
> +
> +enum rkcif_interface_status {
> +	RKCIF_IF_INACTIVE,
> +	RKCIF_IF_ACTIVE,
> +};
> +
> +enum rkcif_interface_type {
> +	RKCIF_IF_INVALID,
> +	RKCIF_IF_DVP,
> +	RKCIF_IF_MIPI,
> +};
> +
> +enum rkcif_plane_index {
> +	RKCIF_PLANE_Y,
> +	RKCIF_PLANE_UV,
> +	RKCIF_PLANE_MAX
> +};
> +
> +struct rkcif_input_fmt {
> +	u32 mbus_code;
> +
> +	enum rkcif_format_type fmt_type;
> +	enum v4l2_field field;
> +
> +	union {
> +		u32 dvp_fmt_val;
> +	};
> +};
> +
> +struct rkcif_output_fmt {
> +	u32 fourcc;
> +	u32 mbus_code;
> +	u8 cplanes;
> +
> +	union {
> +		u32 dvp_fmt_val;
> +	};
> +};
> +
> +struct rkcif_buffer {
> +	struct vb2_v4l2_buffer vb;
> +	struct list_head queue;
> +	dma_addr_t buff_addr[VIDEO_MAX_PLANES];
> +	bool is_dummy;
> +};
> +
> +struct rkcif_dummy_buffer {
> +	struct rkcif_buffer buffer;
> +	void *vaddr;
> +	u32 size;
> +};
> +
> +struct rkcif_interface;
> +
> +struct rkcif_remote {
> +	struct v4l2_async_connection async_conn;
> +	struct v4l2_subdev *sd;
> +
> +	struct rkcif_interface *interface;
> +};
> +
> +struct rkcif_stream {
> +	enum rkcif_id_index id;
> +	struct rkcif_device *rkcif;
> +	struct rkcif_interface *interface;
> +	const struct rkcif_output_fmt *out_fmts;
> +	unsigned int out_fmts_num;
> +
> +	/* in ping-pong mode, two buffers can be provided to the HW */
> +	struct rkcif_buffer *buffers[2];
> +	int frame_idx;
> +	int frame_phase;
> +
> +	/* in case of no available buffer, HW can write to the dummy buffer */
> +	struct rkcif_dummy_buffer dummy;
> +
> +	bool stopping;
> +	wait_queue_head_t wq_stopped;
> +
> +	/* queue of available buffers plus spinlock that protects it */
> +	spinlock_t driver_queue_lock;
> +	struct list_head driver_queue;
> +
> +	/* lock used by the V4L2 core */
> +	struct mutex vlock;
> +
> +	struct media_pad pad;
> +	struct media_pipeline pipeline;
> +	struct v4l2_pix_format_mplane pix;
> +	struct vb2_queue buf_queue;
> +	struct video_device vdev;
> +
> +	void (*queue_buffer)(struct rkcif_stream *stream, unsigned int index);
> +	int (*start_streaming)(struct rkcif_stream *stream);
> +	void (*stop_streaming)(struct rkcif_stream *stream);
> +};
> +
> +struct rkcif_dvp {
> +	u32 dvp_clk_delay;
> +};
> +
> +struct rkcif_interface {
> +	enum rkcif_interface_type type;
> +	enum rkcif_interface_status status;
> +	enum rkcif_interface_index index;
> +	struct rkcif_device *rkcif;
> +	struct rkcif_remote *remote;
> +	struct rkcif_stream streams[RKCIF_ID_MAX];
> +	unsigned int streams_num;
> +	const struct rkcif_input_fmt *in_fmts;
> +	unsigned int in_fmts_num;
> +
> +	struct media_pad pads[RKCIF_IF_PAD_MAX];
> +	struct v4l2_fwnode_endpoint vep;
> +	struct v4l2_subdev sd;
> +
> +	union {
> +		struct rkcif_dvp dvp;
> +	};
> +
> +	void (*set_crop)(struct rkcif_stream *stream, u16 left, u16 top);
> +};
> +
> +struct rkcif_dvp_match_data {
> +	const struct rkcif_input_fmt *in_fmts;
> +	unsigned int in_fmts_num;
> +	const struct rkcif_output_fmt *out_fmts;
> +	unsigned int out_fmts_num;
> +	void (*setup)(struct rkcif_device *rkcif);
> +	bool has_scaler;
> +	bool has_ids;
> +	unsigned int regs[RKCIF_DVP_REGISTER_MAX];
> +};
> +
> +struct rkcif_match_data {
> +	const char *const *clks;
> +	unsigned int clks_num;
> +	const struct rkcif_dvp_match_data *dvp;
> +};
> +
> +struct rkcif_device {
> +	struct device *dev;
> +
> +	const struct rkcif_match_data *match_data;
> +	struct clk_bulk_data clks[RKCIF_CLK_MAX];
> +	unsigned int clks_num;
> +	struct regmap *grf;
> +	struct reset_control *reset;
> +	void __iomem *base_addr;
> +
> +	struct rkcif_interface interfaces[RKCIF_IF_MAX];
> +
> +	struct media_device media_dev;
> +	struct v4l2_device v4l2_dev;
> +	struct v4l2_async_notifier notifier;
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> new file mode 100644
> index 000000000000..b9463d135451
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> @@ -0,0 +1,301 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
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
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +
> +#include "rkcif-capture-dvp.h"
> +#include "rkcif-capture-mipi.h"
> +#include "rkcif-common.h"
> +
> +static const char *const px30_vip_clks[] = {
> +	"aclk",
> +	"hclk",
> +	"pclk",
> +};
> +
> +static const struct rkcif_match_data px30_vip_match_data = {
> +	.clks = px30_vip_clks,
> +	.clks_num = ARRAY_SIZE(px30_vip_clks),
> +	.dvp = &rkcif_px30_vip_dvp_match_data,
> +};
> +
> +static const char *const rk3568_vicap_clks[] = {
> +	"aclk",
> +	"hclk",
> +	"dclk",
> +	"iclk",
> +};
> +
> +static const struct rkcif_match_data rk3568_vicap_match_data = {
> +	.clks = rk3568_vicap_clks,
> +	.clks_num = ARRAY_SIZE(rk3568_vicap_clks),
> +	.dvp = &rkcif_rk3568_vicap_dvp_match_data,
> +};
> +
> +static const struct of_device_id rkcif_plat_of_match[] = {
> +	{
> +		.compatible = "rockchip,px30-vip",
> +		.data = &px30_vip_match_data,
> +	},
> +	{
> +		.compatible = "rockchip,rk3568-vicap",
> +		.data = &rk3568_vicap_match_data,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, rkcif_plat_of_match);
> +
> +static int rkcif_notifier_bound(struct v4l2_async_notifier *notifier,
> +				struct v4l2_subdev *sd,
> +				struct v4l2_async_connection *asd)
> +{
> +	struct rkcif_device *rkcif =
> +		container_of(notifier, struct rkcif_device, notifier);
> +	struct rkcif_remote *remote =
> +		container_of(asd, struct rkcif_remote, async_conn);
> +	struct media_pad *sink_pad =
> +		&remote->interface->pads[RKCIF_IF_PAD_SINK];
> +	int ret;
> +
> +	ret = v4l2_create_fwnode_links_to_pad(sd, sink_pad,
> +					      MEDIA_LNK_FL_ENABLED);
> +	if (ret) {
> +		dev_err(rkcif->dev, "failed to link source pad of %s\n",
> +			sd->name);
> +		return ret;
> +	}
> +
> +	remote->sd = sd;
> +
> +	return 0;
> +}
> +
> +static int rkcif_notifier_complete(struct v4l2_async_notifier *notifier)
> +{
> +	struct rkcif_device *rkcif =
> +		container_of(notifier, struct rkcif_device, notifier);
> +
> +	return v4l2_device_register_subdev_nodes(&rkcif->v4l2_dev);
> +}
> +
> +static const struct v4l2_async_notifier_operations rkcif_notifier_ops = {
> +	.bound = rkcif_notifier_bound,
> +	.complete = rkcif_notifier_complete,
> +};
> +
> +static int rkcif_register(struct rkcif_device *rkcif)
> +{
> +	struct v4l2_async_notifier *ntf = &rkcif->notifier;
> +	int ret;
> +
> +	v4l2_async_nf_init(ntf, &rkcif->v4l2_dev);
> +	ntf->ops = &rkcif_notifier_ops;
> +
> +	ret = rkcif_dvp_register(rkcif);
> +	if (ret && ret != -ENODEV)
> +		goto err_notifier_cleanup;
> +
> +	ret = rkcif_mipi_register(rkcif);
> +	if (ret && ret != -ENODEV)
> +		goto err_dvp_unregister;
> +
> +	ret = v4l2_async_nf_register(ntf);
> +	if (ret)
> +		goto err_mipi_unregister;
> +
> +	return 0;
> +
> +err_mipi_unregister:
> +	rkcif_mipi_unregister(rkcif);
> +err_dvp_unregister:
> +	rkcif_dvp_unregister(rkcif);
> +err_notifier_cleanup:
> +	v4l2_async_nf_cleanup(&rkcif->notifier);
> +	return ret;
> +}
> +
> +static void rkcif_unregister(struct rkcif_device *rkcif)
> +{
> +	v4l2_async_nf_unregister(&rkcif->notifier);
> +	rkcif_mipi_unregister(rkcif);
> +	rkcif_dvp_unregister(rkcif);
> +	v4l2_async_nf_cleanup(&rkcif->notifier);
> +}
> +
> +static irqreturn_t rkcif_isr(int irq, void *ctx)
> +{
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	if (rkcif_dvp_isr(irq, ctx) == IRQ_HANDLED)
> +		ret = IRQ_HANDLED;
> +
> +	if (rkcif_mipi_isr(irq, ctx) == IRQ_HANDLED)
> +		ret = IRQ_HANDLED;
> +
> +	return ret;
> +}
> +
> +static int rkcif_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rkcif_device *rkcif;
> +	int ret, irq;
> +
> +	rkcif = devm_kzalloc(dev, sizeof(*rkcif), GFP_KERNEL);
> +	if (!rkcif)
> +		return -ENOMEM;
> +
> +	rkcif->match_data = of_device_get_match_data(dev);
> +	if (!rkcif->match_data)
> +		return -ENODEV;
> +
> +	dev_set_drvdata(dev, rkcif);
> +	rkcif->dev = dev;
> +
> +	rkcif->base_addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(rkcif->base_addr))
> +		return PTR_ERR(rkcif->base_addr);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(dev, irq, rkcif_isr, IRQF_SHARED,
> +			       dev_driver_string(dev), dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request irq\n");
> +
> +	if (rkcif->match_data->clks_num > RKCIF_CLK_MAX)
> +		return dev_err_probe(dev, -EINVAL, "invalid number of clocks\n");
> +	rkcif->clks_num = rkcif->match_data->clks_num;
> +	for (unsigned int i = 0; i < rkcif->clks_num; i++)
> +		rkcif->clks[i].id = rkcif->match_data->clks[i];
> +	ret = devm_clk_bulk_get(dev, rkcif->clks_num, rkcif->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get clocks\n");
> +
> +	rkcif->reset = devm_reset_control_array_get_exclusive(dev);
> +	if (IS_ERR(rkcif->reset))
> +		return PTR_ERR(rkcif->reset);
> +
> +	rkcif->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
> +						     "rockchip,grf");
> +	if (IS_ERR(rkcif->grf))
> +		rkcif->grf = NULL;
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	rkcif->media_dev.dev = dev;
> +	strscpy(rkcif->media_dev.model, RKCIF_DRIVER_NAME,
> +		sizeof(rkcif->media_dev.model));
> +	media_device_init(&rkcif->media_dev);
> +
> +	rkcif->v4l2_dev.mdev = &rkcif->media_dev;
> +	ret = v4l2_device_register(dev, &rkcif->v4l2_dev);
> +	if (ret)
> +		goto err_media_dev_cleanup;
> +
> +	ret = media_device_register(&rkcif->media_dev);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register media device: %d\n", ret);
> +		goto err_v4l2_dev_unregister;
> +	}
> +
> +	ret = rkcif_register(rkcif);
> +	if (ret) {
> +		dev_err(dev, "failed to register media entities: %d\n", ret);
> +		goto err_media_dev_unregister;
> +	}
> +
> +	return 0;
> +
> +err_media_dev_unregister:
> +	media_device_unregister(&rkcif->media_dev);
> +err_v4l2_dev_unregister:
> +	v4l2_device_unregister(&rkcif->v4l2_dev);
> +err_media_dev_cleanup:
> +	media_device_cleanup(&rkcif->media_dev);
> +	pm_runtime_disable(&pdev->dev);
> +	return ret;
> +}
> +
> +static void rkcif_remove(struct platform_device *pdev)
> +{
> +	struct rkcif_device *rkcif = platform_get_drvdata(pdev);
> +
> +	rkcif_unregister(rkcif);
> +	media_device_unregister(&rkcif->media_dev);
> +	v4l2_device_unregister(&rkcif->v4l2_dev);
> +	media_device_cleanup(&rkcif->media_dev);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static int rkcif_runtime_suspend(struct device *dev)
> +{
> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
> +
> +	/*
> +	 * Reset CIF (CRU, DMA, FIFOs) to allow a clean resume.
> +	 * Since this resets the IOMMU too, we cannot issue this reset when
> +	 * resuming.
> +	 */
> +	reset_control_assert(rkcif->reset);
> +	udelay(5);
> +	reset_control_deassert(rkcif->reset);
> +
> +	clk_bulk_disable_unprepare(rkcif->clks_num, rkcif->clks);
> +
> +	return 0;
> +}
> +
> +static int rkcif_runtime_resume(struct device *dev)
> +{
> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(rkcif->clks_num, rkcif->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops rkcif_plat_pm_ops = {
> +	.runtime_suspend = rkcif_runtime_suspend,
> +	.runtime_resume = rkcif_runtime_resume,
> +};
> +
> +static struct platform_driver rkcif_plat_drv = {
> +	.driver = {
> +		   .name = RKCIF_DRIVER_NAME,
> +		   .of_match_table = rkcif_plat_of_match,
> +		   .pm = &rkcif_plat_pm_ops,
> +	},
> +	.probe = rkcif_probe,
> +	.remove = rkcif_remove,
> +};
> +module_platform_driver(rkcif_plat_drv);
> +
> +MODULE_DESCRIPTION("Rockchip Camera Interface (CIF) platform driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> new file mode 100644
> index 000000000000..45a232ea96e3
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> @@ -0,0 +1,423 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "rkcif-common.h"
> +#include "rkcif-interface.h"
> +
> +static inline struct rkcif_interface *to_rkcif_interface(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct rkcif_interface, sd);
> +}
> +
> +static const struct media_entity_operations rkcif_interface_media_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
> +};
> +
> +static int rkcif_interface_set_fmt(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state,
> +				   struct v4l2_subdev_format *format)
> +{
> +	struct rkcif_interface *interface = to_rkcif_interface(sd);
> +	const struct rkcif_input_fmt *input;
> +	struct v4l2_mbus_framefmt *sink, *src;
> +
> +	/* the format on the source pad always matches the sink pad */
> +	if (format->pad == RKCIF_IF_PAD_SRC)
> +		return v4l2_subdev_get_fmt(sd, state, format);
> +
> +	input = rkcif_interface_find_input_fmt(interface, true,
> +					       format->format.code);
> +	format->format.code = input->mbus_code;
> +
> +	sink = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> +	if (!sink)
> +		return -EINVAL;
> +
> +	*sink = format->format;
> +
> +	/* propagate the format to the source pad */
> +	src = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!src)
> +		return -EINVAL;
> +
> +	*src = *sink;
> +
> +	return 0;
> +}
> +
> +static int rkcif_interface_get_sel(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state,
> +				   struct v4l2_subdev_selection *sel)
> +{
> +	struct v4l2_mbus_framefmt *sink;
> +	struct v4l2_rect *crop;
> +	int ret = 0;
> +
> +	if (sel->pad != RKCIF_IF_PAD_SRC)
> +		return -EINVAL;
> +
> +	sink = v4l2_subdev_state_get_opposite_stream_format(state, sel->pad,
> +							    sel->stream);
> +	if (!sink)
> +		return -EINVAL;
> +
> +	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
> +	if (!crop)
> +		return -EINVAL;
> +
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sel->r.left = 0;
> +		sel->r.top = 0;
> +		sel->r.width = sink->width;
> +		sel->r.height = sink->height;
> +		break;
> +	case V4L2_SEL_TGT_CROP:
> +		sel->r = *crop;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int rkcif_interface_set_sel(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state,
> +				   struct v4l2_subdev_selection *sel)
> +{
> +	struct v4l2_mbus_framefmt *sink, *src;
> +	struct v4l2_rect *crop;
> +
> +	if (sel->pad != RKCIF_IF_PAD_SRC || sel->target != V4L2_SEL_TGT_CROP)
> +		return -EINVAL;
> +
> +	sink = v4l2_subdev_state_get_opposite_stream_format(state, sel->pad,
> +							    sel->stream);
> +	if (!sink)
> +		return -EINVAL;
> +
> +	src = v4l2_subdev_state_get_format(state, sel->pad, sel->stream);
> +	if (!src)
> +		return -EINVAL;
> +
> +	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
> +	if (!crop)
> +		return -EINVAL;
> +
> +	/* only starting point of crop can be specified */
> +	sel->r.height = sink->height - sel->r.top;
> +	sel->r.width = sink->width - sel->r.left;
> +	*crop = sel->r;
> +
> +	src->height = sel->r.height;
> +	src->width = sel->r.width;
> +
> +	return 0;
> +}
> +
> +static int rkcif_interface_set_routing(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *state,
> +				       enum v4l2_subdev_format_whence which,
> +				       struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	ret = v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	if (ret)
> +		return ret;
> +
> +	for (unsigned int i = 0; i < routing->num_routes; i++) {
> +		const struct v4l2_subdev_route *route = &routing->routes[i];
> +
> +		if (route->source_stream >= RKCIF_ID_MAX)
> +			return -EINVAL;
> +	}
> +
> +	ret = v4l2_subdev_set_routing(sd, state, routing);
> +
> +	return ret;
> +}
> +
> +static int rkcif_interface_apply_crop(struct rkcif_stream *stream,
> +				      struct v4l2_subdev_state *state)
> +{
> +	struct rkcif_interface *interface = stream->interface;
> +	struct v4l2_rect *crop;
> +
> +	crop = v4l2_subdev_state_get_crop(state, RKCIF_IF_PAD_SRC, stream->id);
> +	if (!crop)
> +		return -EINVAL;
> +
> +	if (interface->set_crop)
> +		interface->set_crop(stream, crop->left, crop->top);
> +
> +	return 0;
> +}
> +
> +static int rkcif_interface_enable_streams(struct v4l2_subdev *sd,
> +					  struct v4l2_subdev_state *state,
> +					  u32 pad, u64 streams_mask)
> +{
> +	struct rkcif_interface *interface = to_rkcif_interface(sd);
> +	struct rkcif_stream *stream;
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_subdev *remote_sd;
> +	struct media_pad *remote_pad;
> +	u64 mask;
> +
> +	remote_pad =
> +		media_pad_remote_pad_first(&sd->entity.pads[RKCIF_IF_PAD_SINK]);
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	/* DVP has one crop setting for all IDs */
> +	if (interface->type == RKCIF_IF_DVP) {
> +		stream = &interface->streams[RKCIF_ID0];
> +		rkcif_interface_apply_crop(stream, state);
> +	} else {
> +		/* TODO implement for MIPI */
> +		return -EOPNOTSUPP;
> +	}
> +
> +	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_IF_PAD_SINK,
> +					       RKCIF_IF_PAD_SRC, &streams_mask);
> +
> +	return v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
> +}
> +
> +static int rkcif_interface_disable_streams(struct v4l2_subdev *sd,
> +					   struct v4l2_subdev_state *state,
> +					   u32 pad, u64 streams_mask)
> +{
> +	struct v4l2_subdev *remote_sd;
> +	struct media_pad *remote_pad;
> +	u64 mask;
> +
> +	remote_pad =
> +		media_pad_remote_pad_first(&sd->entity.pads[RKCIF_IF_PAD_SINK]);
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_IF_PAD_SINK,
> +					       RKCIF_IF_PAD_SRC, &streams_mask);
> +
> +	return v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
> +}
> +
> +static const struct v4l2_subdev_pad_ops rkcif_interface_pad_ops = {
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = rkcif_interface_set_fmt,
> +	.get_selection = rkcif_interface_get_sel,
> +	.set_selection = rkcif_interface_set_sel,
> +	.set_routing = rkcif_interface_set_routing,
> +	.enable_streams = rkcif_interface_enable_streams,
> +	.disable_streams = rkcif_interface_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops rkcif_interface_ops = {
> +	.pad = &rkcif_interface_pad_ops,
> +};
> +
> +static int rkcif_interface_init_state(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *state)
> +{
> +	struct rkcif_interface *interface = to_rkcif_interface(sd);
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = RKCIF_IF_PAD_SINK,
> +			.sink_stream = 0,
> +			.source_pad = RKCIF_IF_PAD_SRC,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +	struct v4l2_subdev_krouting routing = {
> +		.len_routes = ARRAY_SIZE(routes),
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +	const struct v4l2_mbus_framefmt dvp_default_format = {
> +		.width = 3840,
> +		.height = 2160,
> +		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.field = V4L2_FIELD_NONE,
> +		.colorspace = V4L2_COLORSPACE_REC709,
> +		.ycbcr_enc = V4L2_YCBCR_ENC_709,
> +		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> +		.xfer_func = V4L2_XFER_FUNC_NONE,
> +	};
> +	const struct v4l2_mbus_framefmt mipi_default_format = {
> +		.width = 3840,
> +		.height = 2160,
> +		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.field = V4L2_FIELD_NONE,
> +		.colorspace = V4L2_COLORSPACE_RAW,
> +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
> +		.quantization = V4L2_QUANTIZATION_FULL_RANGE,
> +		.xfer_func = V4L2_XFER_FUNC_NONE,
> +	};
> +	const struct v4l2_mbus_framefmt *default_format;
> +	int ret;
> +
> +	default_format = (interface->type == RKCIF_IF_DVP) ?
> +				 &dvp_default_format :
> +				 &mipi_default_format;
> +
> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> +					       default_format);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_internal_ops rkcif_interface_internal_ops = {
> +	.init_state = rkcif_interface_init_state,
> +};
> +
> +static int rkcif_interface_add(struct rkcif_interface *interface)
> +{
> +	struct rkcif_device *rkcif = interface->rkcif;
> +	struct rkcif_remote *remote;
> +	struct v4l2_async_notifier *ntf = &rkcif->notifier;
> +	struct v4l2_fwnode_endpoint *vep = &interface->vep;
> +	struct device *dev = rkcif->dev;
> +	struct fwnode_handle *ep;
> +	u32 dvp_clk_delay = 0;
> +	int ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), interface->index,
> +					     0, 0);
> +	if (!ep)
> +		return -ENODEV;
> +
> +	vep->bus_type = V4L2_MBUS_UNKNOWN;
> +	ret = v4l2_fwnode_endpoint_parse(ep, vep);
> +	if (ret)
> +		goto complete;
> +
> +	if (interface->type == RKCIF_IF_DVP) {
> +		if (vep->bus_type != V4L2_MBUS_BT656 &&
> +		    vep->bus_type != V4L2_MBUS_PARALLEL) {
> +			ret = dev_err_probe(dev, -EINVAL,
> +					    "unsupported bus type\n");
> +			goto complete;
> +		}
> +
> +		fwnode_property_read_u32(ep, "rockchip,dvp-clk-delay",
> +					 &dvp_clk_delay);
> +		interface->dvp.dvp_clk_delay = dvp_clk_delay;
> +	}
> +
> +	remote = v4l2_async_nf_add_fwnode_remote(ntf, ep, struct rkcif_remote);
> +	if (IS_ERR(remote)) {
> +		ret = PTR_ERR(remote);
> +		goto complete;
> +	}
> +
> +	remote->interface = interface;
> +	interface->remote = remote;
> +	interface->status = RKCIF_IF_ACTIVE;
> +	ret = 0;
> +
> +complete:
> +	fwnode_handle_put(ep);
> +
> +	return ret;
> +}
> +
> +int rkcif_interface_register(struct rkcif_device *rkcif,
> +			     struct rkcif_interface *interface)
> +{
> +	struct media_pad *pads = interface->pads;
> +	struct v4l2_subdev *sd = &interface->sd;
> +	int ret;
> +
> +	interface->rkcif = rkcif;
> +
> +	v4l2_subdev_init(sd, &rkcif_interface_ops);
> +	sd->dev = rkcif->dev;
> +	sd->entity.ops = &rkcif_interface_media_ops;
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> +	sd->internal_ops = &rkcif_interface_internal_ops;
> +	sd->owner = THIS_MODULE;
> +
> +	if (interface->type == RKCIF_IF_DVP)
> +		snprintf(sd->name, sizeof(sd->name), "rkcif-dvp0");
> +	else if (interface->type == RKCIF_IF_MIPI)
> +		snprintf(sd->name, sizeof(sd->name), "rkcif-mipi%d",
> +			 interface->index - RKCIF_MIPI_BASE);
> +
> +	pads[RKCIF_IF_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +	pads[RKCIF_IF_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&sd->entity, RKCIF_IF_PAD_MAX, pads);
> +	if (ret)
> +		goto err;
> +
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		goto err_entity_cleanup;
> +
> +	ret = v4l2_device_register_subdev(&rkcif->v4l2_dev, sd);
> +	if (ret) {
> +		dev_err(sd->dev, "failed to register subdev\n");
> +		goto err_subdev_cleanup;
> +	}
> +
> +	ret = rkcif_interface_add(interface);
> +	if (ret)
> +		goto err_subdev_unregister;
> +
> +	return 0;
> +
> +err_subdev_unregister:
> +	v4l2_device_unregister_subdev(sd);
> +err_subdev_cleanup:
> +	v4l2_subdev_cleanup(sd);
> +err_entity_cleanup:
> +	media_entity_cleanup(&sd->entity);
> +err:
> +	return ret;
> +}
> +
> +void rkcif_interface_unregister(struct rkcif_interface *interface)
> +{
> +	struct v4l2_subdev *sd = &interface->sd;
> +
> +	if (interface->status != RKCIF_IF_ACTIVE)
> +		return;
> +
> +	v4l2_device_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +}
> +
> +const struct rkcif_input_fmt *
> +rkcif_interface_find_input_fmt(struct rkcif_interface *interface, bool ret_def,
> +			       u32 mbus_code)
> +{
> +	const struct rkcif_input_fmt *fmt;
> +
> +	WARN_ON(interface->in_fmts_num == 0);
> +
> +	for (unsigned int i = 0; i < interface->in_fmts_num; i++) {
> +		fmt = &interface->in_fmts[i];
> +		if (fmt->mbus_code == mbus_code)
> +			return fmt;
> +	}
> +	if (ret_def)
> +		return &interface->in_fmts[0];
> +	else
> +		return NULL;
> +}
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.h b/drivers/media/platform/rockchip/rkcif/rkcif-interface.h
> new file mode 100644
> index 000000000000..f37fde4cc6a2
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Abstraction for the INTERFACE and CROP parts of the different CIF variants.
> + * They shall be represented as V4L2 subdevice with one sink pad and one
> + * source pad. The sink pad is connected to a subdevice: either the subdevice
> + * provided by the driver of the companion chip connected to the DVP, or the
> + * subdevice provided by the MIPI CSI Receiver driver in
> + * rkcif-mipi-csi-receiver.c. The source pad is connected to an instance of the
> + * DMA abstraction in rkcif-stream.c.
> + *
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#ifndef _RKCIF_INTERFACE_H
> +#define _RKCIF_INTERFACE_H
> +
> +#include "rkcif-common.h"
> +
> +int rkcif_interface_register(struct rkcif_device *rkcif,
> +			     struct rkcif_interface *interface);
> +
> +void rkcif_interface_unregister(struct rkcif_interface *interface);
> +
> +const struct rkcif_input_fmt *
> +rkcif_interface_find_input_fmt(struct rkcif_interface *interface, bool ret_def,
> +			       u32 mbus_code);
> +
> +#endif
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
> new file mode 100644
> index 000000000000..07fd64174e80
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
> @@ -0,0 +1,132 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#ifndef _RKCIF_REGS_H
> +#define _RKCIF_REGS_H
> +
> +enum rkcif_dvp_register_index {
> +	RKCIF_DVP_CTRL,
> +	RKCIF_DVP_INTEN,
> +	RKCIF_DVP_INTSTAT,
> +	RKCIF_DVP_FOR,
> +	RKCIF_DVP_LINE_NUM_ADDR,
> +	RKCIF_DVP_FRM0_ADDR_Y,
> +	RKCIF_DVP_FRM0_ADDR_UV,
> +	RKCIF_DVP_FRM1_ADDR_Y,
> +	RKCIF_DVP_FRM1_ADDR_UV,
> +	RKCIF_DVP_VIR_LINE_WIDTH,
> +	RKCIF_DVP_SET_SIZE,
> +	RKCIF_DVP_SCL_CTRL,
> +	RKCIF_DVP_CROP,
> +	RKCIF_DVP_FRAME_STATUS,
> +	RKCIF_DVP_LAST_LINE,
> +	RKCIF_DVP_LAST_PIX,
> +	RKCIF_DVP_REGISTER_MAX
> +};
> +
> +#define RKCIF_REGISTER_NOTSUPPORTED           0x420000
> +
> +#define RKCIF_FETCH_Y(VAL)		       ((VAL) & 0x1fff)
> +
> +#define RKCIF_CTRL_ENABLE_CAPTURE	       BIT(0)
> +#define RKCIF_CTRL_MODE_PINGPONG	       BIT(1)
> +#define RKCIF_CTRL_MODE_LINELOOP	       BIT(2)
> +#define RKCIF_CTRL_AXI_BURST_16		       (0xf << 12)
> +
> +#define RKCIF_INTEN_FRAME_END_EN	       BIT(0)
> +#define RKCIF_INTEN_LINE_ERR_EN		       BIT(2)
> +#define RKCIF_INTEN_BUS_ERR_EN		       BIT(6)
> +#define RKCIF_INTEN_SCL_ERR_EN		       BIT(7)
> +#define RKCIF_INTEN_PST_INF_FRAME_END_EN       BIT(9)
> +
> +#define RKCIF_INTSTAT_CLS		       0x3ff
> +#define RKCIF_INTSTAT_FRAME_END		       BIT(0)
> +#define RKCIF_INTSTAT_LINE_END		       BIT(1)
> +#define RKCIF_INTSTAT_LINE_ERR		       BIT(2)
> +#define RKCIF_INTSTAT_PIX_ERR		       BIT(3)
> +#define RKCIF_INTSTAT_DFIFO_OF		       BIT(5)
> +#define RKCIF_INTSTAT_BUS_ERR		       BIT(6)
> +#define RKCIF_INTSTAT_PRE_INF_FRAME_END	       BIT(8)
> +#define RKCIF_INTSTAT_PST_INF_FRAME_END	       BIT(9)
> +#define RKCIF_INTSTAT_FRAME_END_CLR	       BIT(0)
> +#define RKCIF_INTSTAT_LINE_END_CLR	       BIT(1)
> +#define RKCIF_INTSTAT_LINE_ERR_CLR	       BIT(2)
> +#define RKCIF_INTSTAT_PST_INF_FRAME_END_CLR    BIT(9)
> +#define RKCIF_INTSTAT_ERR		       0xfc
> +
> +#define RKCIF_FRAME_STAT_CLS		       0x00
> +#define RKCIF_FRAME_FRM0_STAT_CLS	       0x20
> +
> +#define RKCIF_FORMAT_VSY_HIGH_ACTIVE	       BIT(0)
> +#define RKCIF_FORMAT_HSY_LOW_ACTIVE	       BIT(1)
> +
> +#define RKCIF_FORMAT_INPUT_MODE_YUV	       (0x00 << 2)
> +#define RKCIF_FORMAT_INPUT_MODE_PAL	       (0x02 << 2)
> +#define RKCIF_FORMAT_INPUT_MODE_NTSC	       (0x03 << 2)
> +#define RKCIF_FORMAT_INPUT_MODE_BT1120	       (0x07 << 2)
> +#define RKCIF_FORMAT_INPUT_MODE_RAW	       (0x04 << 2)
> +#define RKCIF_FORMAT_INPUT_MODE_JPEG	       (0x05 << 2)
> +#define RKCIF_FORMAT_INPUT_MODE_MIPI	       (0x06 << 2)
> +
> +#define RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY      (0x00 << 5)
> +#define RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU      (0x01 << 5)
> +#define RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY      (0x02 << 5)
> +#define RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV      (0x03 << 5)
> +#define RKCIF_FORMAT_YUV_INPUT_422	       (0x00 << 7)
> +#define RKCIF_FORMAT_YUV_INPUT_420	       BIT(7)
> +
> +#define RKCIF_FORMAT_INPUT_420_ORDER_ODD       BIT(8)
> +
> +#define RKCIF_FORMAT_CCIR_INPUT_ORDER_EVEN     BIT(9)
> +
> +#define RKCIF_FORMAT_RAW_DATA_WIDTH_8	       (0x00 << 11)
> +#define RKCIF_FORMAT_RAW_DATA_WIDTH_10	       (0x01 << 11)
> +#define RKCIF_FORMAT_RAW_DATA_WIDTH_12	       (0x02 << 11)
> +
> +#define RKCIF_FORMAT_YUV_OUTPUT_422	       (0x00 << 16)
> +#define RKCIF_FORMAT_YUV_OUTPUT_420	       BIT(16)
> +
> +#define RKCIF_FORMAT_OUTPUT_420_ORDER_EVEN     (0x00 << 17)
> +#define RKCIF_FORMAT_OUTPUT_420_ORDER_ODD      BIT(17)
> +
> +#define RKCIF_FORMAT_RAWD_DATA_LITTLE_ENDIAN   (0x00 << 18)
> +#define RKCIF_FORMAT_RAWD_DATA_BIG_ENDIAN      BIT(18)
> +
> +#define RKCIF_FORMAT_UV_STORAGE_ORDER_UVUV     (0x00 << 19)
> +#define RKCIF_FORMAT_UV_STORAGE_ORDER_VUVU     BIT(19)
> +
> +#define RKCIF_FORMAT_BT1120_CLOCK_SINGLE_EDGES (0x00 << 24)
> +#define RKCIF_FORMAT_BT1120_CLOCK_DOUBLE_EDGES BIT(24)
> +#define RKCIF_FORMAT_BT1120_TRANSMIT_INTERFACE (0x00 << 25)
> +#define RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS  BIT(25)
> +#define RKCIF_FORMAT_BT1120_YC_SWAP	       BIT(26)
> +
> +#define RKCIF_SCL_CTRL_ENABLE_SCL_DOWN	       BIT(0)
> +#define RKCIF_SCL_CTRL_ENABLE_SCL_UP	       BIT(1)
> +#define RKCIF_SCL_CTRL_ENABLE_YUV_16BIT_BYPASS BIT(4)
> +#define RKCIF_SCL_CTRL_ENABLE_RAW_16BIT_BYPASS BIT(5)
> +#define RKCIF_SCL_CTRL_ENABLE_32BIT_BYPASS     BIT(6)
> +#define RKCIF_SCL_CTRL_DISABLE_32BIT_BYPASS    (0x00 << 6)
> +
> +#define RKCIF_INTSTAT_F0_READY		       BIT(0)
> +#define RKCIF_INTSTAT_F1_READY		       BIT(1)
> +
> +#define RKCIF_XY_COORD(x, y)		       (((y) << 16) | (x))
> +
> +/* GRF register offsets */
> +#define RK3568_GRF_VI_CON0		       0x340
> +#define RK3568_GRF_VI_CON1		       0x344
> +#define RK3568_GRF_VI_STATUS0		       0x348
> +
> +#define RK3568_GRF_VI_CON1_CIF_DATAPATH	       BIT(9)
> +#define RK3568_GRF_VI_CON1_CIF_CLK_DELAYNUM    GENMASK(6, 0)
> +
> +#define RK3568_GRF_WRITE_ENABLE(x)	       ((x) << 16)
> +
> +#endif
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> new file mode 100644
> index 000000000000..ddded47ce53f
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -0,0 +1,634 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#include <linux/pm_runtime.h>
> +
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "rkcif-common.h"
> +#include "rkcif-stream.h"
> +
> +#define CIF_REQ_BUFS_MIN 1
> +#define CIF_MIN_WIDTH	 64
> +#define CIF_MIN_HEIGHT	 64
> +#define CIF_MAX_WIDTH	 8192
> +#define CIF_MAX_HEIGHT	 8192
> +
> +static inline struct rkcif_buffer *to_rkcif_buffer(struct vb2_v4l2_buffer *vb)
> +{
> +	return container_of(vb, struct rkcif_buffer, vb);
> +}
> +
> +static inline struct rkcif_stream *to_rkcif_stream(struct video_device *vdev)
> +{
> +	return container_of(vdev, struct rkcif_stream, vdev);
> +}
> +
> +static struct rkcif_buffer *rkcif_stream_pop_buffer(struct rkcif_stream *stream)
> +{
> +	struct rkcif_buffer *buffer;
> +
> +	guard(spinlock_irqsave)(&stream->driver_queue_lock);
> +
> +	if (list_empty(&stream->driver_queue))
> +		return NULL;
> +
> +	buffer = list_first_entry(&stream->driver_queue, struct rkcif_buffer,
> +				  queue);
> +	list_del(&buffer->queue);
> +
> +	return buffer;
> +}
> +
> +static void rkcif_stream_push_buffer(struct rkcif_stream *stream,
> +				     struct rkcif_buffer *buffer)
> +{
> +	guard(spinlock_irqsave)(&stream->driver_queue_lock);
> +
> +	list_add_tail(&buffer->queue, &stream->driver_queue);
> +}
> +
> +static inline void rkcif_stream_return_buffer(struct rkcif_buffer *buffer,
> +					      enum vb2_buffer_state state)
> +{
> +	struct vb2_v4l2_buffer *vb = &buffer->vb;
> +
> +	vb2_buffer_done(&vb->vb2_buf, state);
> +}
> +
> +static void rkcif_stream_complete_buffer(struct rkcif_stream *stream,
> +					 struct rkcif_buffer *buffer)
> +{
> +	struct vb2_v4l2_buffer *vb = &buffer->vb;
> +
> +	vb->vb2_buf.timestamp = ktime_get_ns();
> +	vb->sequence = stream->frame_idx;
> +	vb2_buffer_done(&vb->vb2_buf, VB2_BUF_STATE_DONE);
> +	stream->frame_idx++;
> +}
> +
> +void rkcif_stream_pingpong(struct rkcif_stream *stream)
> +{
> +	struct rkcif_buffer *buffer;
> +
> +	buffer = stream->buffers[stream->frame_phase];
> +	if (!buffer->is_dummy)
> +		rkcif_stream_complete_buffer(stream, buffer);
> +
> +	buffer = rkcif_stream_pop_buffer(stream);
> +	if (buffer) {
> +		stream->buffers[stream->frame_phase] = buffer;
> +		stream->buffers[stream->frame_phase]->is_dummy = false;
> +	} else {
> +		stream->buffers[stream->frame_phase] = &stream->dummy.buffer;
> +		stream->buffers[stream->frame_phase]->is_dummy = true;
> +		dev_dbg(stream->rkcif->dev,
> +			"no buffer available, frame will be dropped\n");
> +	}
> +
> +	if (stream->queue_buffer)
> +		stream->queue_buffer(stream, stream->frame_phase);
> +
> +	stream->frame_phase = 1 - stream->frame_phase;
> +}
> +
> +static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
> +{
> +	struct v4l2_pix_format_mplane *pix = &stream->pix;
> +
> +	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
> +	if (!stream->buffers[0])
> +		goto err_buff_0;
> +
> +	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
> +	if (!stream->buffers[1])
> +		goto err_buff_1;
> +
> +	if (stream->queue_buffer) {
> +		stream->queue_buffer(stream, 0);
> +		stream->queue_buffer(stream, 1);
> +	}
> +
> +	stream->dummy.size = pix->num_planes * pix->plane_fmt[0].sizeimage;
> +	stream->dummy.vaddr =
> +		dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
> +				&stream->dummy.buffer.buff_addr[0], GFP_KERNEL,
> +				DMA_ATTR_NO_KERNEL_MAPPING);
> +	if (!stream->dummy.vaddr)
> +		goto err_dummy;
> +
> +	for (unsigned int i = 1; i < pix->num_planes; i++)
> +		stream->dummy.buffer.buff_addr[i] =
> +			stream->dummy.buffer.buff_addr[i - 1] +
> +			pix->plane_fmt[i - 1].bytesperline * pix->height;
> +
> +	return 0;
> +
> +err_dummy:
> +	rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEUED);
> +	stream->buffers[1] = NULL;
> +
> +err_buff_1:
> +	rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEUED);
> +	stream->buffers[0] = NULL;
> +err_buff_0:
> +	return -EINVAL;
> +}
> +
> +static void rkcif_stream_return_all_buffers(struct rkcif_stream *stream,
> +					    enum vb2_buffer_state state)
> +{
> +	struct rkcif_buffer *buffer;
> +
> +	if (stream->buffers[0] && !stream->buffers[0]->is_dummy) {
> +		rkcif_stream_return_buffer(stream->buffers[0], state);
> +		stream->buffers[0] = NULL;
> +	}
> +
> +	if (stream->buffers[1] && !stream->buffers[1]->is_dummy) {
> +		rkcif_stream_return_buffer(stream->buffers[1], state);
> +		stream->buffers[1] = NULL;
> +	}
> +
> +	while ((buffer = rkcif_stream_pop_buffer(stream)))
> +		rkcif_stream_return_buffer(buffer, state);
> +
> +	if (stream->dummy.vaddr) {
> +		dma_free_attrs(stream->rkcif->dev, stream->dummy.size,
> +			       stream->dummy.vaddr,
> +			       stream->dummy.buffer.buff_addr[0],
> +			       DMA_ATTR_NO_KERNEL_MAPPING);
> +		stream->dummy.vaddr = NULL;
> +	}
> +}
> +
> +static int rkcif_stream_setup_queue(struct vb2_queue *queue,
> +				    unsigned int *num_buffers,
> +				    unsigned int *num_planes,
> +				    unsigned int sizes[],
> +				    struct device *alloc_devs[])
> +{
> +	struct rkcif_stream *stream = queue->drv_priv;
> +	struct v4l2_pix_format_mplane *pix = &stream->pix;
> +
> +	if (*num_planes) {
> +		if (*num_planes != pix->num_planes)
> +			return -EINVAL;
> +
> +		for (unsigned int i = 0; i < pix->num_planes; i++)
> +			if (sizes[i] < pix->plane_fmt[i].sizeimage)
> +				return -EINVAL;
> +	} else {
> +		*num_planes = pix->num_planes;
> +		for (unsigned int i = 0; i < pix->num_planes; i++)
> +			sizes[i] = pix->plane_fmt[i].sizeimage;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rkcif_stream_prepare_buffer(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct rkcif_buffer *buffer = to_rkcif_buffer(vbuf);
> +	struct rkcif_stream *stream = vb->vb2_queue->drv_priv;
> +	const struct rkcif_output_fmt *fmt;
> +	struct v4l2_pix_format_mplane *pix = &stream->pix;
> +	unsigned int i;
> +
> +	memset(buffer->buff_addr, 0, sizeof(buffer->buff_addr));
> +	for (i = 0; i < pix->num_planes; i++)
> +		buffer->buff_addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
> +
> +	/* apply fallback for non-mplane formats, if required */
> +	if (pix->num_planes == 1) {
> +		fmt = rkcif_stream_find_output_fmt(stream, true,
> +						   pix->pixelformat);
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
> +			dev_err(stream->rkcif->dev,
> +				"user buffer too small (%ld < %ld)\n",
> +				vb2_plane_size(vb, i), size);
> +			return -EINVAL;
> +		}
> +
> +		vb2_set_plane_payload(vb, i, size);
> +	}
> +
> +	vbuf->field = V4L2_FIELD_NONE;
> +
> +	return 0;
> +}
> +
> +static void rkcif_stream_queue_buffer(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct rkcif_buffer *buffer = to_rkcif_buffer(vbuf);
> +	struct rkcif_stream *stream = vb->vb2_queue->drv_priv;
> +
> +	rkcif_stream_push_buffer(stream, buffer);
> +}
> +
> +static int rkcif_stream_start_streaming(struct vb2_queue *queue,
> +					unsigned int count)
> +{
> +	struct rkcif_stream *stream = queue->drv_priv;
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	u64 mask;
> +	int ret;
> +
> +	stream->frame_idx = 0;
> +	stream->frame_phase = 0;
> +
> +	ret = video_device_pipeline_start(&stream->vdev, &stream->pipeline);
> +	if (ret) {
> +		dev_err(rkcif->dev, "failed to start pipeline %d\n", ret);
> +		goto err_out;
> +	}
> +
> +	ret = pm_runtime_resume_and_get(rkcif->dev);
> +	if (ret < 0) {
> +		dev_err(rkcif->dev, "failed to get runtime pm, %d\n", ret);
> +		goto err_pipeline_stop;
> +	}
> +
> +	ret = rkcif_stream_init_buffers(stream);
> +	if (ret)
> +		goto err_runtime_put;
> +
> +	if (stream->start_streaming) {
> +		ret = stream->start_streaming(stream);
> +		if (ret < 0)
> +			goto err_runtime_put;
> +	}
> +
> +	mask = BIT_ULL(stream->id);
> +	ret = v4l2_subdev_enable_streams(&stream->interface->sd,
> +					 RKCIF_IF_PAD_SRC, mask);
> +	if (ret < 0)
> +		goto err_stop_stream;
> +
> +	return 0;
> +
> +err_stop_stream:
> +	if (stream->stop_streaming)
> +		stream->stop_streaming(stream);
> +err_runtime_put:
> +	pm_runtime_put(rkcif->dev);
> +err_pipeline_stop:
> +	video_device_pipeline_stop(&stream->vdev);
> +err_out:
> +	rkcif_stream_return_all_buffers(stream, VB2_BUF_STATE_QUEUED);
> +	return ret;
> +}
> +
> +static void rkcif_stream_stop_streaming(struct vb2_queue *queue)
> +{
> +	struct rkcif_stream *stream = queue->drv_priv;
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	u64 mask;
> +	int ret;
> +
> +	mask = BIT_ULL(stream->id);
> +	v4l2_subdev_disable_streams(&stream->interface->sd, RKCIF_IF_PAD_SRC,
> +				    mask);
> +
> +	stream->stopping = true;
> +	ret = wait_event_timeout(stream->wq_stopped, !stream->stopping,
> +				 msecs_to_jiffies(1000));
> +
> +	if (!ret && stream->stop_streaming)
> +		stream->stop_streaming(stream);
> +
> +	pm_runtime_put(rkcif->dev);
> +
> +	rkcif_stream_return_all_buffers(stream, VB2_BUF_STATE_ERROR);
> +
> +	video_device_pipeline_stop(&stream->vdev);
> +}
> +
> +static const struct vb2_ops rkcif_stream_vb2_ops = {
> +	.queue_setup = rkcif_stream_setup_queue,
> +	.buf_prepare = rkcif_stream_prepare_buffer,
> +	.buf_queue = rkcif_stream_queue_buffer,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +	.start_streaming = rkcif_stream_start_streaming,
> +	.stop_streaming = rkcif_stream_stop_streaming,
> +};
> +
> +static void rkcif_stream_fill_format(struct rkcif_stream *stream,
> +				     struct v4l2_pix_format_mplane *pix)
> +{
> +	const struct rkcif_output_fmt *fmt;
> +	u32 height, width;
> +
> +	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
> +	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
> +	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
> +	v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);

The rkcif supports the SRGGB10P: the packed version of the SRGGB10.

When you try to capture with SRGGB10P, the following fails in
v4l2_fill_pixfmt_mp()

	info = v4l2_format_info(pixelformat);
	if (!info)
		return -EINVAL;

The return value is not checked in rkcif_stream_fill_format() resulting
in a call to queue_setup returning with sizes[0] = 0

This will cause a kernel Warning in the vb2_core_reqbufs() because
plane_size = 0

Exactly here:

	for (i = 0; i < num_planes; i++)
		if (WARN_ON(!plane_sizes[i])) {
			ret = -EINVAL;
			goto error;
		}

I still don't have the solution here but wanted to let you know about
it.

--
Kind Regards
Mehdi Djait

