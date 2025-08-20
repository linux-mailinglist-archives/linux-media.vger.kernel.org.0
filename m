Return-Path: <linux-media+bounces-40485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE778B2E584
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 21:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D4694E1AEE
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 19:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB6825FA29;
	Wed, 20 Aug 2025 19:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lq6YGCZq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F15921883E;
	Wed, 20 Aug 2025 19:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755717440; cv=none; b=Xun/GiNo1rLofgAjlUZZ0qEB7MnXFrDvMwLPmk/G7UdnNt3PfARs63mfGy9ONtYyrr+zxhQRIX/QvBy3KNmpK8UgaaYJ8iWpPMX6hG3CUuYm68ZdPlCgpw9K9WfK6/yyWXt+5Z6wchFhzT70Wrg2FCMDEiq0o/2d34pH3KvUDb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755717440; c=relaxed/simple;
	bh=0/A8H1icU7FHYjzi9o9I32XxVYe3rNCvwIhcn7eOUVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQojyEHNq5daFdkPqvSy4n/ahHJ9yPJtKo4AN2rbk5J6J1jC431FbovzwsmQzXZ9TnpW+gJhP4On/DiCgQARwevf1jX2VwBSKQsetdyyqMy2x8Vm7ng2iGnxv7BB3BuXETC89EDFbuJGnCp9BgtSRTMnsWBzf2L/Og0ZLSVzg2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lq6YGCZq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 78A056A6;
	Wed, 20 Aug 2025 21:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755717376;
	bh=0/A8H1icU7FHYjzi9o9I32XxVYe3rNCvwIhcn7eOUVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lq6YGCZqiJjWB+4roTs5N/By7nrBAZ5l0TnHKytw1JW6ZWhR9Vu5xdjZ3rqh9JNnm
	 9K85WLCDazpXukhKoWkJ+oM0FgLiyi0iLEuR1Mw4GwlrCrRUMogeVMr7nDDHGaIYbM
	 z4KdIfWJx0BtWK137W5ByY775Z0y6gM/41I0Ulmg=
Date: Wed, 20 Aug 2025 22:16:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
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
Subject: Re: [PATCH v2 04/32] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_dt()
Message-ID: <20250820191651.GB1722@pendragon.ideasonboard.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
 <20250808-95_cam-v2-4-4b29fa6919a7@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250808-95_cam-v2-4-4b29fa6919a7@nxp.com>

Hi Frank,

Thank you for the patch.

On Fri, Aug 08, 2025 at 06:39:07PM -0400, Frank Li wrote:
> CSI2 data type is defined by MIPI Camera Serial Interface 2 Spec Ver4.1.
> See section 9.4.
> 
> Add helper function media_bus_fmt_to_csi2_dt() to convert media bus fmt to
> MIPI defined data type and avoid below duplicated static array in each CSI2
> drivers.
> 
> 	{
> 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> 		.data_type = MIPI_CSI2_DT_YUV422_8B,
> 	}
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 44 +++++++++++++++++++++++++++++++++++
>  include/media/mipi-csi2.h             |  3 +++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 3a48b6a55c6e322696b910dd519def4f0b4a58fb..fcc01030beb347499da2a3c8539793d20f6f512c 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -701,6 +701,50 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
>  
> +int media_bus_fmt_to_csi2_dt(int bus_fmt)
> +{
> +	switch (bus_fmt) {
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +		return MIPI_CSI2_DT_YUV422_8B;
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		return MIPI_CSI2_DT_RGB565;
> +	case MEDIA_BUS_FMT_BGR888_1X24:
> +		return MIPI_CSI2_DT_RGB888;
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case MEDIA_BUS_FMT_Y8_1X8:
> +		return MIPI_CSI2_DT_RAW8;
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_Y10_1X10:
> +		return MIPI_CSI2_DT_RAW10;
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +	case MEDIA_BUS_FMT_Y12_1X12:
> +		return MIPI_CSI2_DT_RAW12;
> +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> +		return MIPI_CSI2_DT_RAW14;
> +	case MEDIA_BUS_FMT_SBGGR16_1X16:
> +	case MEDIA_BUS_FMT_SGBRG16_1X16:
> +	case MEDIA_BUS_FMT_SGRBG16_1X16:
> +	case MEDIA_BUS_FMT_SRGGB16_1X16:
> +		return MIPI_CSI2_DT_RAW16;
> +
> +	default:
> +		return MIPI_CSI2_DT_NULL;

I would use 0 here. MIPI_CSI2_DT_NULL is equal to 0x10, and I'm
concerned about driver comparing the return value of the function to 0.

> +	}
> +}
> +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_dt);
> +

We have something similar for pixel formats, with the v4l2_format_info
structure and the v4l2_format_info() lookup function. Adding information
about media bus formats to the V4L2 core seems to be a good idea.

Regarding the implementation, I think you should mimick what we do for
the pixel formats, and add the data to an info structure with a lookup
function.

>  int media_bus_fmt_to_csi2_bpp(int bus_fmt)
>  {
>  	switch (bus_fmt) {
> diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
> index c5b4e8e1ca93803568b1eee85f7f99c3a45a0b6e..35de536b9b65b49ad9e2914437d26d0e4240cf38 100644
> --- a/include/media/mipi-csi2.h
> +++ b/include/media/mipi-csi2.h
> @@ -8,6 +8,8 @@
>  #ifndef _MEDIA_MIPI_CSI2_H
>  #define _MEDIA_MIPI_CSI2_H
>  
> +/* DT value ref to MIPI Camera Serial Interface 2 Spec Ver4.1 section 9.4 */
> +
>  /* Short packet data types */
>  #define MIPI_CSI2_DT_FS			0x00
>  #define MIPI_CSI2_DT_FE			0x01
> @@ -44,6 +46,7 @@
>  #define MIPI_CSI2_DT_RAW20		0x2f
>  #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
>  
> +int media_bus_fmt_to_csi2_dt(int buf_fmt);
>  int media_bus_fmt_to_csi2_bpp(int bus_fmt);
>  
>  #endif /* _MEDIA_MIPI_CSI2_H */
> 
> 

-- 
Regards,

Laurent Pinchart

