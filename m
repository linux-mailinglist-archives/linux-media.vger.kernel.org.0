Return-Path: <linux-media+bounces-31222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B14A9F4AE
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 17:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9F973BB207
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 15:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B3725DCFB;
	Mon, 28 Apr 2025 15:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1ROdUv5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8F22528EB;
	Mon, 28 Apr 2025 15:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745854821; cv=none; b=uBsc2Bj1btDilgbPEsKvajWm74v9P6fIm/eI0/spcMjUIeQwHN7L3WNXQhfHFvf23yq6AKLu86CIfAzcJH4HtNas9lHndb+QxYj0PzIg+1foxIFNCWI8ie9e6yQtqMLm54nRA2fNDHHmj5aZcfLJ0WEOQM/sp3BEA2/4To1/i6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745854821; c=relaxed/simple;
	bh=nDnWSYm2uhi44SrpmNV/sw0ueOaJSKlGmyHJtCM9s4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiJ4EW2RoSpJUwh3ILJETiujk/Rr+8TFBtX7SG8ydhJvuzPnwfttZVF13SMzzD7zz1ecxe5pBf7PNp///EvzbBQyP0tqf59RzoXAuKgh2GakWwrTm5H629zpCTZhlYRurOryc9T14Z1D6ojGQawv1bT8EON2A1oxE0sIjDHntZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1ROdUv5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745854819; x=1777390819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nDnWSYm2uhi44SrpmNV/sw0ueOaJSKlGmyHJtCM9s4E=;
  b=C1ROdUv5uEVOy5WmZjYH4jZzJ7XVrZAiBcnWVgKHrvocFPmMwrM7y2I9
   Sl2GkjRi4E8u9JCVPT2rhYwXMaHUGeQ1VVi1unTSd0JRvUDpYb+UBO2CI
   NkkoZkI8BPwBElYOZMSx/vz86AkLIXkjT9imyRoiTIGrRu0VrPECW6vu5
   sXQcnfbcOAG6uRPXArOQPG3bl6TsYrmoU8fribPtFJM2fisPlzCtS42fN
   wA9L6UVkgld8cqjMpBHPV18cAzcrp4B22fBWuzos3t+VPignWn4T7NklF
   4NViNnciylr5dAwswBW+Imt0I8jkASoJcsLFKIKLRR8F6uXnzdtdmm/wk
   A==;
X-CSE-ConnectionGUID: U0/0gudKSf+huzV2Jf3B3w==
X-CSE-MsgGUID: vHRJUO/rRV2D+HS3AqSGiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51261005"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="51261005"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 08:40:18 -0700
X-CSE-ConnectionGUID: QXZPgBYiRWSthXzzyKmoSw==
X-CSE-MsgGUID: PUvveIRiSM+GHLWP7gNzQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="133866951"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 08:40:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5B17A1208E5;
	Mon, 28 Apr 2025 18:40:10 +0300 (EEST)
Date: Mon, 28 Apr 2025 15:40:10 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 07/11] media: rockchip: rkcif: add support for mipi
 csi-2 receiver
Message-ID: <aA-hWug1bpRR_qYh@kekkonen.localdomain>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
 <20250306-v6-8-topic-rk3568-vicap-v5-7-f02152534f3c@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-v6-8-topic-rk3568-vicap-v5-7-f02152534f3c@wolfvision.net>

Hi Michael,

On Thu, Mar 06, 2025 at 05:56:08PM +0100, Michael Riesch wrote:
> The RK3568 Video Capture (VICAP) unit features a MIPI CSI-2 receiver
> that can receive video data and write it into system memory using the
> ping-pong scheme. Add support for it.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 695 +++++++++++++++++++++
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   2 +
>  .../media/platform/rockchip/rkcif/rkcif-common.h   |  16 +
>  drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |   1 +
>  .../platform/rockchip/rkcif/rkcif-interface.c      |   5 +-
>  drivers/media/platform/rockchip/rkcif/rkcif-regs.h |  24 +-
>  6 files changed, 741 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> index 0c3f7b8cfa18..dcc0c4aeeec4 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> @@ -6,22 +6,717 @@
>   * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
>   */
>  
> +#include <linux/interrupt.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
>  #include "rkcif-capture-mipi.h"
>  #include "rkcif-common.h"
> +#include "rkcif-interface.h"
> +#include "rkcif-regs.h"
>  #include "rkcif-stream.h"
>  
> +#define RKCIF_MIPI_CTRL0_COMPACT_EN    BIT(6)
> +#define RKCIF_MIPI_CTRL0_CROP_EN       BIT(5)
> +#define RKCIF_MIPI_CTRL0_TYPE(type)    ((type) << 1)
> +#define RKCIF_MIPI_CTRL0_TYPE_RAW8     RKCIF_MIPI_CTRL0_TYPE(0x0)
> +#define RKCIF_MIPI_CTRL0_TYPE_RAW10    RKCIF_MIPI_CTRL0_TYPE(0x1)
> +#define RKCIF_MIPI_CTRL0_TYPE_RAW12    RKCIF_MIPI_CTRL0_TYPE(0x2)
> +#define RKCIF_MIPI_CTRL0_TYPE_RGB888   RKCIF_MIPI_CTRL0_TYPE(0x3)
> +#define RKCIF_MIPI_CTRL0_TYPE_YUV422SP RKCIF_MIPI_CTRL0_TYPE(0x4)
> +#define RKCIF_MIPI_CTRL0_TYPE_YUV420SP RKCIF_MIPI_CTRL0_TYPE(0x5)
> +#define RKCIF_MIPI_CTRL0_TYPE_YUV400   RKCIF_MIPI_CTRL0_TYPE(0x6)
> +#define RKCIF_MIPI_CTRL0_CAP_EN	       BIT(0)
> +
> +#define RKCIF_MIPI_INT_FRAME0_END(id)  BIT(8 + (id) * 2 + 0)
> +#define RKCIF_MIPI_INT_FRAME1_END(id)  BIT(8 + (id) * 2 + 1)
> +
> +static const struct rkcif_output_fmt mipi_out_fmts[] = {
> +	/* YUV formats */
> +	{
> +		.fourcc = V4L2_PIX_FMT_YUYV,
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.depth = 16,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_YUV422_8B,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_UYVY,
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.depth = 16,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_YUV422_8B,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_YVYU,
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
> +		.depth = 16,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_YUV422_8B,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_VYUY,
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
> +		.depth = 16,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_YUV422_8B,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
> +		},
> +	},
> +	/* RGB formats */
> +	{
> +		.fourcc = V4L2_PIX_FMT_RGB24,
> +		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.depth = 24,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RGB888,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RGB888,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_BGR24,
> +		.mbus_code = MEDIA_BUS_FMT_BGR888_1X24,
> +		.depth = 24,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RGB888,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RGB888,
> +		},
> +	},
> +	/* Bayer formats */
> +	{
> +		.fourcc = V4L2_PIX_FMT_SBGGR8,
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.depth = 8,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW8,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGBRG8,
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.depth = 8,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW8,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGRBG8,
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.depth = 8,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW8,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SRGGB8,
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.depth = 8,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW8,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SBGGR10,
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.depth = 10,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW10,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SBGGR10P,
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.depth = 10,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW10,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGBRG10,
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.depth = 10,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW10,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGBRG10P,
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.depth = 10,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW10,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGRBG10,
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.depth = 10,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW10,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGRBG10P,
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.depth = 10,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW10,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SRGGB10,
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.depth = 10,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW10,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SRGGB10P,
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.depth = 10,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW10,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SBGGR12,
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.depth = 12,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW12,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SBGGR12P,
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.depth = 12,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW12,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGBRG12,
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.depth = 12,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW12,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGBRG12P,
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.depth = 12,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW12,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGRBG12,
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.depth = 12,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW12,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGRBG12P,
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.depth = 12,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW12,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SRGGB12,
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.depth = 12,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW12,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SRGGB12P,
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.depth = 12,
> +		.cplanes = 1,
> +		.mipi = {
> +			.dt = MIPI_CSI2_DT_RAW12,
> +			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
> +		},
> +	},
> +};
> +
> +static const struct rkcif_input_fmt mipi_in_fmts[] = {
> +	/* YUV formats */
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
> +	},
> +	/* RGB formats */
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_BGR888_1X24,
> +	},
> +	/* Bayer formats */
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +	},
> +};
> +
> +const struct rkcif_mipi_match_data rk3568_vicap_mipi_match_data = {
> +	.mipi_num = 1,
> +	.regs = {
> +		[RKCIF_MIPI_CTRL] = 0x20,
> +		[RKCIF_MIPI_INTEN] = 0xa4,
> +		[RKCIF_MIPI_INTSTAT] = 0xa8,
> +	},
> +	.regs_id = {
> +		[RKCIF_ID0] = {
> +			[RKCIF_MIPI_CTRL0] = 0x00,
> +			[RKCIF_MIPI_CTRL1] = 0x04,
> +			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x24,
> +			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x2c,
> +			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x34,
> +			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x3c,
> +			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x28,
> +			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x30,
> +			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x38,
> +			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x40,
> +			[RKCIF_MIPI_CROP_START] = 0xbc,
> +		},
> +		[RKCIF_ID1] = {
> +			[RKCIF_MIPI_CTRL0] = 0x08,
> +			[RKCIF_MIPI_CTRL1] = 0x0c,
> +			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x44,
> +			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x4c,
> +			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x54,
> +			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x5c,
> +			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x48,
> +			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x50,
> +			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x58,
> +			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x60,
> +			[RKCIF_MIPI_CROP_START] = 0xc0,
> +		},
> +		[RKCIF_ID2] = {
> +			[RKCIF_MIPI_CTRL0] = 0x10,
> +			[RKCIF_MIPI_CTRL1] = 0x14,
> +			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x64,
> +			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x6c,
> +			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x74,
> +			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x7c,
> +			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x68,
> +			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x70,
> +			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x78,
> +			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x80,
> +			[RKCIF_MIPI_CROP_START] = 0xc4,
> +		},
> +		[RKCIF_ID3] = {
> +			[RKCIF_MIPI_CTRL0] = 0x18,
> +			[RKCIF_MIPI_CTRL1] = 0x1c,
> +			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x84,
> +			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x8c,
> +			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x94,
> +			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x9c,
> +			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x88,
> +			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x90,
> +			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x98,
> +			[RKCIF_MIPI_FRAME1_VLW_UV] = 0xa0,
> +			[RKCIF_MIPI_CROP_START] = 0xc8,
> +		},
> +	},
> +	.blocks = {
> +		{
> +			.offset = 0x80,
> +		},
> +	},
> +};
> +
> +static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
> +					      unsigned int index)
> +{
> +	struct rkcif_device *rkcif = interface->rkcif;
> +	unsigned int block, offset, reg;
> +
> +	block = interface->index - RKCIF_MIPI_BASE;
> +
> +	if (WARN_ON(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> +	    WARN_ON(index > RKCIF_MIPI_REGISTER_MAX))
> +		return RKCIF_REGISTER_NOTSUPPORTED;
> +
> +	offset = rkcif->match_data->mipi->blocks[block].offset;
> +	reg = rkcif->match_data->mipi->regs[index];
> +	if (reg == RKCIF_REGISTER_NOTSUPPORTED)
> +		return reg;
> +
> +	return offset + reg;
> +}
> +
> +static inline unsigned int rkcif_mipi_id_get_reg(struct rkcif_stream *stream,
> +						 unsigned int index)
> +{
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	unsigned int block, id, offset, reg;
> +
> +	block = stream->interface->index - RKCIF_MIPI_BASE;
> +	id = stream->id;
> +
> +	if (WARN_ON(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> +	    WARN_ON(id > RKCIF_ID_MAX) ||
> +	    WARN_ON(index > RKCIF_MIPI_ID_REGISTER_MAX))

I think WARN_ON_ONCE() would be reasonable.

> +		return RKCIF_REGISTER_NOTSUPPORTED;
> +
> +	offset = rkcif->match_data->mipi->blocks[block].offset;
> +	reg = rkcif->match_data->mipi->regs_id[id][index];
> +	if (reg == RKCIF_REGISTER_NOTSUPPORTED)
> +		return reg;
> +
> +	return offset + reg;
> +}
> +
> +static inline __maybe_unused void
> +rkcif_mipi_write(struct rkcif_interface *interface, unsigned int index, u32 val)
> +{
> +	unsigned int addr = rkcif_mipi_get_reg(interface, index);
> +
> +	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
> +		return;
> +
> +	writel(val, interface->rkcif->base_addr + addr);
> +}
> +
> +static inline __maybe_unused void
> +rkcif_mipi_stream_write(struct rkcif_stream *stream, unsigned int index,
> +			u32 val)
> +{
> +	unsigned int addr = rkcif_mipi_id_get_reg(stream, index);
> +
> +	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
> +		return;
> +
> +	writel(val, stream->rkcif->base_addr + addr);
> +}
> +
> +static inline __maybe_unused u32
> +rkcif_mipi_read(struct rkcif_interface *interface, unsigned int index)
> +{
> +	unsigned int addr = rkcif_mipi_get_reg(interface, index);
> +
> +	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
> +		return 0;
> +
> +	return readl(interface->rkcif->base_addr + addr);
> +}
> +
> +static inline __maybe_unused u32
> +rkcif_mipi_stream_read(struct rkcif_stream *stream, unsigned int index)
> +{
> +	unsigned int addr = rkcif_mipi_id_get_reg(stream, index);
> +
> +	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
> +		return 0;
> +
> +	return readl(stream->rkcif->base_addr + addr);
> +}
> +
> +static void rkcif_mipi_queue_buffer(struct rkcif_stream *stream,
> +				    unsigned int index)
> +{
> +	struct rkcif_buffer *buffer = stream->buffers[index];
> +	u32 frm_addr_y, frm_addr_uv;
> +
> +	frm_addr_y = index ? RKCIF_MIPI_FRAME1_ADDR_Y :
> +			     RKCIF_MIPI_FRAME0_ADDR_Y;
> +	frm_addr_uv = index ? RKCIF_MIPI_FRAME1_ADDR_UV :
> +			      RKCIF_MIPI_FRAME0_ADDR_UV;
> +
> +	rkcif_mipi_stream_write(stream, frm_addr_y,
> +				buffer->buff_addr[RKCIF_PLANE_Y]);
> +	rkcif_mipi_stream_write(stream, frm_addr_uv,
> +				buffer->buff_addr[RKCIF_PLANE_UV]);
> +}
> +
> +static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
> +{
> +	struct rkcif_interface *interface = stream->interface;
> +	const struct rkcif_output_fmt *active_out_fmt;
> +	struct v4l2_subdev_state *state;
> +	u32 ctrl0 = 0, ctrl1 = 0, int_temp = 0, int_mask = 0, vlw = 0;
> +	u16 height, width;
> +	int ret = -EINVAL;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
> +
> +	active_out_fmt = rkcif_stream_find_output_fmt(stream, false,
> +						      stream->pix.pixelformat);
> +	if (!active_out_fmt)
> +		goto out;
> +
> +	height = stream->pix.height;
> +	width = stream->pix.width;
> +	/* TODO there may be different factors and/or alignment constraints */
> +	vlw = ALIGN(width * 2, 8);
> +
> +	ctrl0 |= active_out_fmt->mipi.dt << 10;
> +	ctrl0 |= active_out_fmt->mipi.ctrl0_val;
> +	ctrl0 |= RKCIF_MIPI_CTRL0_CROP_EN;
> +	ctrl0 |= RKCIF_MIPI_CTRL0_CAP_EN;
> +
> +	ctrl1 = RKCIF_XY_COORD(width, height);
> +
> +	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
> +	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
> +
> +	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
> +	int_temp |= int_mask;
> +	rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, int_temp);
> +
> +	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
> +	int_temp &= ~int_mask;
> +	rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, int_temp);
> +
> +	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_Y, vlw);
> +	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_Y, vlw);
> +	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_UV, vlw);
> +	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_UV, vlw);
> +	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, 0x0);
> +	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
> +	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
> +
> +	ret = 0;
> +
> +out:
> +	v4l2_subdev_unlock_state(state);
> +	return ret;
> +}
> +
> +static void rkcif_mipi_stop_streaming(struct rkcif_stream *stream)
> +{
> +	struct rkcif_interface *interface = stream->interface;
> +	struct v4l2_subdev_state *state;
> +	u32 int_temp = 0, int_mask = 0;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
> +
> +	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, 0);
> +
> +	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
> +	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
> +
> +	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
> +	int_temp &= ~int_mask;
> +	rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, int_temp);
> +
> +	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
> +	int_temp &= ~int_mask;
> +	rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, int_temp);
> +
> +	stream->stopping = false;
> +
> +	v4l2_subdev_unlock_state(state);
> +}
> +
> +static void rkcif_mipi_set_crop(struct rkcif_stream *stream, u16 left, u16 top)
> +{
> +	u32 val;
> +
> +	val = RKCIF_XY_COORD(left, top);
> +	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, val);
> +}
> +
>  irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
>  {
> +	struct device *dev = ctx;
> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
>  	irqreturn_t ret = IRQ_NONE;
> +	u32 intstat;
> +
> +	for (int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
> +		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
> +		struct rkcif_interface *interface = &rkcif->interfaces[index];
> +
> +		intstat = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
> +		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, intstat);
> +
> +		for (int j = 0; j < interface->streams_num; j++) {
> +			struct rkcif_stream *stream = &interface->streams[j];
> +
> +			if (intstat & RKCIF_MIPI_INT_FRAME0_END(stream->id) ||
> +			    intstat & RKCIF_MIPI_INT_FRAME1_END(stream->id)) {
> +				rkcif_stream_pingpong(stream);
> +				ret = IRQ_HANDLED;
> +			}
> +		}
> +	}
>  
>  	return ret;
>  }
>  
>  int rkcif_mipi_register(struct rkcif_device *rkcif)
>  {
> +	int ret, i;
> +
> +	if (!rkcif->match_data->mipi)
> +		return 0;
> +
> +	for (i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
> +		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
> +		struct rkcif_interface *interface = &rkcif->interfaces[index];
> +
> +		interface->index = index;
> +		interface->type = RKCIF_IF_MIPI;
> +		interface->in_fmts = mipi_in_fmts;
> +		interface->in_fmts_num = ARRAY_SIZE(mipi_in_fmts);
> +		interface->set_crop = rkcif_mipi_set_crop;
> +		interface->streams_num = 0;
> +		ret = rkcif_interface_register(rkcif, interface);
> +		if (ret)
> +			continue;
> +
> +		for (int j = 0; j < 4; j++) {

Could you give a human-readable (macro) name for 4?

> +			struct rkcif_stream *stream = &interface->streams[j];
> +
> +			stream->id = j;
> +			stream->interface = interface;
> +			stream->out_fmts = mipi_out_fmts;
> +			stream->out_fmts_num = ARRAY_SIZE(mipi_out_fmts);
> +			stream->queue_buffer = rkcif_mipi_queue_buffer;
> +			stream->start_streaming = rkcif_mipi_start_streaming;
> +			stream->stop_streaming = rkcif_mipi_stop_streaming;
> +			ret = rkcif_stream_register(rkcif, stream);
> +			if (ret)
> +				goto err;
> +			interface->streams_num++;
> +		}
> +	}
> +
>  	return 0;
> +
> +err:
> +	for (; i >= 0; i--) {

	for (i++; i--; )

And you can make i unsigned. :-) Up to you. Same elsewhere, too.

> +		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
> +		struct rkcif_interface *interface = &rkcif->interfaces[index];
> +
> +		for (int j = 0; j < interface->streams_num; j++)
> +			rkcif_stream_unregister(&interface->streams[j]);
> +
> +		rkcif_interface_unregister(interface);
> +	}
> +	return ret;
>  }
>  
>  void rkcif_mipi_unregister(struct rkcif_device *rkcif)
>  {
> +	if (!rkcif->match_data->mipi)
> +		return;
> +
> +	for (int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {

unsigned int i?

> +		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
> +		struct rkcif_interface *interface = &rkcif->interfaces[index];
> +
> +		for (int j = 0; j < interface->streams_num; j++)

unsigned int j?

This applies elsewhere, too.

> +			rkcif_stream_unregister(&interface->streams[j]);
> +
> +		rkcif_interface_unregister(interface);
> +	}
>  }
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
> index ee1a50a59505..48d04a60c750 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
> @@ -11,6 +11,8 @@
>  
>  #include "rkcif-common.h"
>  
> +extern const struct rkcif_mipi_match_data rk3568_vicap_mipi_match_data;
> +
>  int rkcif_mipi_register(struct rkcif_device *rkcif);
>  
>  void rkcif_mipi_unregister(struct rkcif_device *rkcif);
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> index 32f6f0238656..99249a85048e 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> @@ -93,9 +93,14 @@ struct rkcif_output_fmt {
>  	u32 fourcc;
>  	u32 mbus_code;
>  	u8 cplanes;
> +	u8 depth;
>  
>  	union {
>  		u32 dvp_fmt_val;
> +		struct {
> +			u8 dt;
> +			u32 ctrl0_val;
> +		} mipi;
>  	};
>  };
>  
> @@ -183,6 +188,16 @@ struct rkcif_interface {
>  	void (*set_crop)(struct rkcif_stream *stream, u16 left, u16 top);
>  };
>  
> +struct rkcif_mipi_match_data {
> +	unsigned int mipi_num;
> +	unsigned int regs[RKCIF_MIPI_REGISTER_MAX];
> +	unsigned int regs_id[RKCIF_ID_MAX][RKCIF_MIPI_ID_REGISTER_MAX];
> +
> +	struct {
> +		unsigned int offset;
> +	} blocks[RKCIF_MIPI_MAX - RKCIF_MIPI_BASE];
> +};
> +
>  struct rkcif_dvp_match_data {
>  	const struct rkcif_input_fmt *in_fmts;
>  	unsigned int in_fmts_num;
> @@ -198,6 +213,7 @@ struct rkcif_match_data {
>  	const char *const *clks;
>  	unsigned int clks_num;
>  	const struct rkcif_dvp_match_data *dvp;
> +	const struct rkcif_mipi_match_data *mipi;
>  };
>  
>  struct rkcif_device {
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> index 2f45229183f6..5cc4e458ffa1 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> @@ -49,6 +49,7 @@ static const struct rkcif_match_data rk3568_vicap_match_data = {
>  	.clks = rk3568_vicap_clks,
>  	.clks_num = ARRAY_SIZE(rk3568_vicap_clks),
>  	.dvp = &rk3568_vicap_dvp_match_data,
> +	.mipi = &rk3568_vicap_mipi_match_data,
>  };
>  
>  static const struct of_device_id rkcif_plat_of_match[] = {
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> index 7131de68de2c..163ee9e2fc6f 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> @@ -188,7 +188,10 @@ static int rkcif_interface_enable_streams(struct v4l2_subdev *sd,
>  		stream = &interface->streams[RKCIF_ID0];
>  		rkcif_interface_apply_crop(stream, state);
>  	} else {
> -		/* TODO implement for MIPI */
> +		for_each_active_route(&state->routing, route) {
> +			stream = &interface->streams[route->sink_stream];
> +			rkcif_interface_apply_crop(stream, state);
> +		}
>  	}
>  
>  	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_IF_PAD_SINK,
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
> index 07fd64174e80..3d1f0c45c638 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
> @@ -30,7 +30,29 @@ enum rkcif_dvp_register_index {
>  	RKCIF_DVP_REGISTER_MAX
>  };
>  
> -#define RKCIF_REGISTER_NOTSUPPORTED           0x420000
> +enum rkcif_mipi_register_index {
> +	RKCIF_MIPI_CTRL,
> +	RKCIF_MIPI_INTEN,
> +	RKCIF_MIPI_INTSTAT,
> +	RKCIF_MIPI_REGISTER_MAX
> +};
> +
> +enum rkcif_mipi_id_register_index {
> +	RKCIF_MIPI_CTRL0,
> +	RKCIF_MIPI_CTRL1,
> +	RKCIF_MIPI_FRAME0_ADDR_Y,
> +	RKCIF_MIPI_FRAME0_ADDR_UV,
> +	RKCIF_MIPI_FRAME0_VLW_Y,
> +	RKCIF_MIPI_FRAME0_VLW_UV,
> +	RKCIF_MIPI_FRAME1_ADDR_Y,
> +	RKCIF_MIPI_FRAME1_ADDR_UV,
> +	RKCIF_MIPI_FRAME1_VLW_Y,
> +	RKCIF_MIPI_FRAME1_VLW_UV,
> +	RKCIF_MIPI_CROP_START,
> +	RKCIF_MIPI_ID_REGISTER_MAX
> +};
> +
> +#define RKCIF_REGISTER_NOTSUPPORTED	       0x420000
>  
>  #define RKCIF_FETCH_Y(VAL)		       ((VAL) & 0x1fff)

Any other reason for macro target alignment than this is what the driver
uses? It'd be nice to clean it up but this is outside the scope of the set
IMO.

>  
> 

-- 
Regards,

Sakari Ailus

