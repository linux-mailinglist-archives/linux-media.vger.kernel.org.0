Return-Path: <linux-media+bounces-43877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5050ABC29B6
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 22:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 307E64E197B
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 20:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11AB23C38C;
	Tue,  7 Oct 2025 20:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSQLOYxQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E911F63CD;
	Tue,  7 Oct 2025 20:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759867992; cv=none; b=gb8aAeji/BpYUc76p0x2AcApw8hXxTJKsCZnDW/UXwilwKGI+Ih+VWpl8lkwvmc9fmygtM8/T2oZ8hqzdIUtbLX4Mtb1CjRM+KX3tauI5yYw5i7NrEp2cT6Z2HLyMuMzFb5T8yjYpgedO2+IWXwhYvaFpnE4kIockCMRozeqtsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759867992; c=relaxed/simple;
	bh=VYp8Z1vt2fC0/uCiopNC4WL9epUJcqHv1c61YWN1sJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+19q9HoU3PXnPuxbrUcic+zZpIi5kPYTcxaOmsD1UcYqsfrYAVvyGS5lKvpV0Lg333p4/cr4hrRqiG4zFvMbTsj1M5nHhrAigsEufEBETs+750gEY5Ks6se6PIOJRFPkDJ4SYbq5/43uVMsHG1w23ElBY+rRFaZhRkali8MKfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSQLOYxQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759867990; x=1791403990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VYp8Z1vt2fC0/uCiopNC4WL9epUJcqHv1c61YWN1sJs=;
  b=mSQLOYxQ0YL0RH+I9diCO8g4PJccIXHywu8irLV/c2/brJSI1DDM4CYd
   fAvd1rD/5ywm2tvwI3HqxWwH+uTVmMIAMvnGIJbxpK4eRleQv+oDh1XZV
   mhCzhUswD8gLmhloJ3krwvZ5afOC2ZFJnTPRL3nkPNdiHdCXDGY6tBJDc
   UhA5+umEQYFI/Ud3vM2FfcsAkCTsvM3a4Gj5SduLRvH8pZBl8vFIwdxFD
   O2Y4TWrk8xG+DEctnn7W+MUWy/S/79bjwtMpCuiWdGR23I0dd1w7nnYka
   kLL7K2/wjCqi0rzpMK6q7wyhYAJXsg7/dd0BbVXFxeJ+gPN2InYtOUAvn
   Q==;
X-CSE-ConnectionGUID: 8yGyVsddR1qTls3FA3UcAQ==
X-CSE-MsgGUID: h4cGvFF2T4um7ruSjj+D6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64677692"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="64677692"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2025 13:13:08 -0700
X-CSE-ConnectionGUID: uqPAlkH0TXW7Tt+cNZsTxw==
X-CSE-MsgGUID: te7ISSmtQNylZSwyyMOi3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="180064598"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.53])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2025 13:13:01 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 81E0F11F8B0;
	Tue, 07 Oct 2025 23:12:58 +0300 (EEST)
Date: Tue, 7 Oct 2025 23:12:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v11 10/17] media: rockchip: rkcif: add support for px30
 vip dvp capture
Message-ID: <aOV0SrQWlVUTx1-R@kekkonen.localdomain>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <20240220-rk3568-vicap-v11-10-af0eada54e5d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v11-10-af0eada54e5d@collabora.com>

Hi Michael,

A few small comments below, feel free to address these in a patch on top.
But let's see if the DT bindings comments result in any changes.

On Wed, Sep 17, 2025 at 05:38:50PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The PX30 Video Input Processor (VIP) unit features a Digital Video
> Port (DVP). Add support for the DVP in general and for the PX30
> VIP DVP in particular.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  drivers/media/platform/rockchip/rkcif/Makefile     |   1 +
>  .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 588 +++++++++++++++++++++
>  .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  23 +
>  .../media/platform/rockchip/rkcif/rkcif-common.h   |  28 +
>  drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  15 +
>  drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 131 +++++
>  6 files changed, 786 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
> index 256335d95050..a36e294d569d 100644
> --- a/drivers/media/platform/rockchip/rkcif/Makefile
> +++ b/drivers/media/platform/rockchip/rkcif/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-cif.o
>  
> +rockchip-cif-objs += rkcif-capture-dvp.o
>  rockchip-cif-objs += rkcif-dev.o
>  rockchip-cif-objs += rkcif-interface.o
>  rockchip-cif-objs += rkcif-stream.o
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
> new file mode 100644
> index 000000000000..35e2b685a4d8
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
> @@ -0,0 +1,588 @@
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
> +static inline unsigned int rkcif_dvp_get_addr(struct rkcif_device *rkcif,
> +					      unsigned int index)
> +{
> +	if (WARN_ON_ONCE(index >= RKCIF_DVP_REGISTER_MAX))
> +		return RKCIF_REGISTER_NOTSUPPORTED;
> +
> +	return rkcif->match_data->dvp->regs[index];
> +}
> +
> +static inline __maybe_unused void rkcif_dvp_write(struct rkcif_device *rkcif,
> +						  unsigned int index, u32 val)
> +{
> +	unsigned int addr = rkcif_dvp_get_addr(rkcif, index);
> +
> +	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
> +		return;
> +
> +	writel(val, rkcif->base_addr + addr);
> +}
> +
> +static inline __maybe_unused u32 rkcif_dvp_read(struct rkcif_device *rkcif,
> +						unsigned int index)
> +{
> +	unsigned int addr = rkcif_dvp_get_addr(rkcif, index);
> +
> +	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
> +		return 0;
> +
> +	return readl(rkcif->base_addr + addr);
> +}
> +
> +static void rkcif_dvp_queue_buffer(struct rkcif_stream *stream,
> +				   unsigned int index)
> +{
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	struct rkcif_buffer *buffer = stream->buffers[index];
> +	u32 frm_addr_y, frm_addr_uv;
> +
> +	frm_addr_y = index ? RKCIF_DVP_FRM1_ADDR_Y : RKCIF_DVP_FRM0_ADDR_Y;
> +	frm_addr_uv = index ? RKCIF_DVP_FRM1_ADDR_UV : RKCIF_DVP_FRM0_ADDR_UV;
> +
> +	rkcif_dvp_write(rkcif, frm_addr_y, buffer->buff_addr[RKCIF_PLANE_Y]);
> +	rkcif_dvp_write(rkcif, frm_addr_uv, buffer->buff_addr[RKCIF_PLANE_UV]);
> +}
> +
> +static int rkcif_dvp_start_streaming(struct rkcif_stream *stream)
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
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_FOR, val);
> +
> +	val = stream->pix.width;
> +	if (active_in_fmt->fmt_type == RKCIF_FMT_TYPE_RAW)
> +		val = stream->pix.width * 2;
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_VIR_LINE_WIDTH, val);
> +
> +	val = RKCIF_XY_COORD(stream->pix.width, stream->pix.height);
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_SET_SIZE, val);
> +
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_FRAME_STATUS, RKCIF_FRAME_STAT_CLS);
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_INTSTAT, RKCIF_INTSTAT_CLS);
> +	if (rkcif->match_data->dvp->has_scaler) {
> +		val = active_in_fmt->fmt_type == RKCIF_FMT_TYPE_YUV ?
> +			      RKCIF_SCL_CTRL_ENABLE_YUV_16BIT_BYPASS :
> +			      RKCIF_SCL_CTRL_ENABLE_RAW_16BIT_BYPASS;
> +		rkcif_dvp_write(rkcif, RKCIF_DVP_SCL_CTRL, val);
> +	}
> +
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_INTEN,
> +			RKCIF_INTEN_FRAME_END_EN |
> +			RKCIF_INTEN_PST_INF_FRAME_END_EN);
> +
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL,
> +			RKCIF_CTRL_AXI_BURST_16 | RKCIF_CTRL_MODE_PINGPONG |
> +			RKCIF_CTRL_ENABLE_CAPTURE);
> +
> +	ret = 0;
> +
> +out:
> +	v4l2_subdev_unlock_state(state);
> +	return ret;
> +}
> +
> +static void rkcif_dvp_stop_streaming(struct rkcif_stream *stream)
> +{
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	u32 val;
> +
> +	val = rkcif_dvp_read(rkcif, RKCIF_DVP_CTRL);
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL,
> +			val & (~RKCIF_CTRL_ENABLE_CAPTURE));
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_INTEN, 0x0);
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_INTSTAT, 0x3ff);
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_FRAME_STATUS, 0x0);
> +
> +	stream->stopping = false;
> +}
> +
> +static void rkcif_dvp_reset_stream(struct rkcif_device *rkcif)
> +{
> +	u32 ctl = rkcif_dvp_read(rkcif, RKCIF_DVP_CTRL);
> +
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL,
> +			ctl & (~RKCIF_CTRL_ENABLE_CAPTURE));
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL, ctl | RKCIF_CTRL_ENABLE_CAPTURE);
> +}
> +
> +static void rkcif_dvp_set_crop(struct rkcif_stream *stream, u16 left, u16 top)
> +{
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	u32 val;
> +
> +	val = RKCIF_XY_COORD(left, top);
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_CROP, val);
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
> +	intstat = rkcif_dvp_read(rkcif, RKCIF_DVP_INTSTAT);
> +	cif_frmst = rkcif_dvp_read(rkcif, RKCIF_DVP_FRAME_STATUS);
> +	lastline = RKCIF_FETCH_Y(rkcif_dvp_read(rkcif, RKCIF_DVP_LAST_LINE));
> +	lastpix = RKCIF_FETCH_Y(rkcif_dvp_read(rkcif, RKCIF_DVP_LAST_PIX));
> +
> +	if (intstat & RKCIF_INTSTAT_FRAME_END) {
> +		rkcif_dvp_write(rkcif, RKCIF_DVP_INTSTAT,
> +				RKCIF_INTSTAT_FRAME_END_CLR |
> +				RKCIF_INTSTAT_LINE_END_CLR);
> +
> +		stream = &rkcif->interfaces[RKCIF_DVP].streams[RKCIF_ID0];
> +
> +		if (stream->stopping) {
> +			rkcif_dvp_stop_streaming(stream);
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
> +			rkcif_dvp_reset_stream(rkcif);
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
> +		stream->queue_buffer = rkcif_dvp_queue_buffer;
> +		stream->start_streaming = rkcif_dvp_start_streaming;
> +		stream->stop_streaming = rkcif_dvp_stop_streaming;
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
> index 000000000000..5c58088dd348
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h
> @@ -0,0 +1,23 @@
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
> +
> +int rkcif_dvp_register(struct rkcif_device *rkcif);
> +
> +void rkcif_dvp_unregister(struct rkcif_device *rkcif);
> +
> +irqreturn_t rkcif_dvp_isr(int irq, void *ctx);
> +
> +#endif
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> index 395ec7e7e13b..597743e0c2fc 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> @@ -23,6 +23,8 @@
>  #include <media/v4l2-subdev.h>
>  #include <media/videobuf2-v4l2.h>
>  
> +#include "rkcif-regs.h"
> +
>  #define RKCIF_DRIVER_NAME "rockchip-cif"
>  #define RKCIF_CLK_MAX	  4
>  
> @@ -83,17 +85,31 @@ struct rkcif_dummy_buffer {
>  	u32 size;
>  };
>  
> +enum rkcif_plane_index {
> +	RKCIF_PLANE_Y,
> +	RKCIF_PLANE_UV,
> +	RKCIF_PLANE_MAX
> +};
> +
>  struct rkcif_input_fmt {
>  	u32 mbus_code;
>  
>  	enum rkcif_format_type fmt_type;
>  	enum v4l2_field field;
> +
> +	union {
> +		u32 dvp_fmt_val;
> +	};
>  };
>  
>  struct rkcif_output_fmt {
>  	u32 fourcc;
>  	u32 mbus_code;
>  	u8 cplanes;
> +
> +	union {
> +		u32 dvp_fmt_val;
> +	};
>  };
>  
>  struct rkcif_interface;
> @@ -167,9 +183,21 @@ struct rkcif_interface {
>  	void (*set_crop)(struct rkcif_stream *stream, u16 left, u16 top);
>  };
>  
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
>  struct rkcif_match_data {
>  	const char *const *clks;
>  	unsigned int clks_num;
> +	const struct rkcif_dvp_match_data *dvp;
>  };
>  
>  struct rkcif_device {
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> index 331634e5e74b..285676445e44 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> @@ -22,6 +22,7 @@
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-mc.h>
>  
> +#include "rkcif-capture-dvp.h"
>  #include "rkcif-common.h"
>  
>  static const char *const px30_vip_clks[] = {
> @@ -33,6 +34,7 @@ static const char *const px30_vip_clks[] = {
>  static const struct rkcif_match_data px30_vip_match_data = {
>  	.clks = px30_vip_clks,
>  	.clks_num = ARRAY_SIZE(px30_vip_clks),
> +	.dvp = &rkcif_px30_vip_dvp_match_data,
>  };
>  
>  static const char *const rk3568_vicap_clks[] = {
> @@ -62,11 +64,21 @@ MODULE_DEVICE_TABLE(of, rkcif_plat_of_match);
>  
>  static int rkcif_register(struct rkcif_device *rkcif)
>  {
> +	int ret;
> +
> +	ret = rkcif_dvp_register(rkcif);
> +	if (ret && ret != -ENODEV)
> +		goto err;

	return ret == -ENODEV ? 0 : ret;

> +
>  	return 0;
> +
> +err:
> +	return ret;
>  }
>  
>  static void rkcif_unregister(struct rkcif_device *rkcif)
>  {
> +	rkcif_dvp_unregister(rkcif);
>  }
>  
>  static int rkcif_notifier_bound(struct v4l2_async_notifier *notifier,
> @@ -111,6 +123,9 @@ static irqreturn_t rkcif_isr(int irq, void *ctx)
>  {
>  	irqreturn_t ret = IRQ_NONE;
>  
> +	if (rkcif_dvp_isr(irq, ctx) == IRQ_HANDLED)
> +		ret = IRQ_HANDLED;
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
> new file mode 100644
> index 000000000000..d50b6e14b5af
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
> @@ -0,0 +1,131 @@
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
> +#define RKCIF_REGISTER_NOTSUPPORTED	      0x420000
> +#define RKCIF_FETCH_Y(VAL)		      ((VAL) & 0x1fff)
> +#define RKCIF_XY_COORD(x, y)		       (((y) << 16) | (x))

Why the use of spaces for alignment to a column not divisible by 8? For a
new header that doesn't seem to make sense.

> +
> +/* DVP register contents */
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
> +/* GRF register offsets and contents */
> +#define RK3568_GRF_VI_CON0		       0x340
> +#define RK3568_GRF_VI_CON1		       0x344
> +#define RK3568_GRF_VI_STATUS0		       0x348
> +
> +#define RK3568_GRF_VI_CON1_CIF_DATAPATH	       BIT(9)
> +#define RK3568_GRF_VI_CON1_CIF_CLK_DELAYNUM    GENMASK(6, 0)
> +
> +#define RK3568_GRF_WRITE_ENABLE(x)	       ((x) << 16)
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
> +#endif
> 

-- 
Kind regards,

Sakari Ailus

