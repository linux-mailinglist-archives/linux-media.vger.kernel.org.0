Return-Path: <linux-media+bounces-45637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FD4C0C94B
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 10:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07448188DC58
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 09:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E484086344;
	Mon, 27 Oct 2025 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="P8ErnzhB"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB012E5B08;
	Mon, 27 Oct 2025 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761555908; cv=pass; b=K+G9mCkj1iRo6VIuCqEAbBuMEy+g2Ntdfxi4XWJ8zAZq1TJd9iei75JOl3SHEITHKBjKXah8y83ca3yRA8VI+8awvmgv7oN06GAmSUrfXuBQz7LlINFiWjKR+W2/XRJwS2eqWIrnEhYUsCKQfC1y1OkmftJIOS6DVUrhxjNQsNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761555908; c=relaxed/simple;
	bh=DheLGWs8zpFqp2XZRYH5J4ZCdlD7dMLLkaxrbyt6IGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/KEUrqakXH4tG6UQAamm9V9ajzcUZ/OVwL5Iy83dNC9+FT1rnVEY+IEoqirmz9TYZkBW/stniqKchVHzGBEUMDltoVzuimxvutTQyuIU0LbY679FrIPFdSF3OeVABoyPpyY6Wi6ctL7rqLEOJrD0Cpirt+n0f03IJ7hq9RK3ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=P8ErnzhB; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4cw6yr153cz49Q40;
	Mon, 27 Oct 2025 11:04:52 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1761555894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J6h8BZM5Df6BFUTY5gHb3S7KnPIxy/4cb4Luc3alCgI=;
	b=P8ErnzhB76V4qAJ42MiMIH92NEnqseMR/oYnK1OcFiBeWTxbxhKvps68dYfcxz4VEDS0X4
	bepP2JU4hF9a2aBEIZCtJ8AQFWdvMOQT0NRfhTZJGXO9hk+W0TF8LbpgNTqhsIdKqZzd4m
	6v/KtutcAFqMBwgPnu6GxKHilnpo5eHNizlMgDzsa8w8AImkDdClqPOXy6ufPwC81j5YyQ
	8uLzK59mFp49n9IFhQGeBBzIhIZVB6d0z2D6u0PBKM55kuDKKg1/P1IJPB6hmSoz24AYbl
	TFldoauAltBaeNkGnmAqxrl66QMreRgeu6p4T9L0+ITVTDR47QS9iNl1odrkcw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1761555894; a=rsa-sha256;
	cv=none;
	b=Sh1w1WL46TMuuAfYdh/4QBgvKvOiNxG/PsI6oPQunUUwEqK5uZRkgt4+fJP43VvrlYiBXY
	LsNMYUiBpeXim/3Cgx6Y/qdUdJiSF/7LTykPGQlsRMOON3BsG+bID2RR/aipz8XN0+wHAn
	mXNrZSWoPhUVyx+fAuUpMgUYBq8GlfgP2qafTouRZve4aq6WnTUys/Q6JRPe61tSfbzG8F
	tFhYfULNFQvFnscUMUMWgPsnY9n3VJ9n5QfCY2q3Xl9tMijyeoQYF54hHVPyDLF+BEyziL
	xICcACz/GsPZOlOmup6umb9fq1ULZUcy52i9vMO85/ScDg/HpROdqBDbA0REBA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1761555894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J6h8BZM5Df6BFUTY5gHb3S7KnPIxy/4cb4Luc3alCgI=;
	b=ajv7n9Ys4KDO/0nEAvLrTHHZtYl/Yfy1EI4T4yJpIzcb4b8HxNGAs+lGvdTFwFe7u7qaMz
	0OoFDX0P5UryzOBLr01gms0H+qZO3lekMbBdhgZSnOiJFbt6LeXGRQV3N4EUm4qeIpgdjz
	uA2872QKO9pQSqjuOtmhht9uguVPvOmEkH98yamm5oOsw8La+3VagpeM7FWwsrRZ0X3LvY
	CDV6hjIufalSfDYgFpduWmuZhE6OFrg5ZN6XqbR7H/1g/m7Pu9vF5S8LQ8slDMZqgTaAOM
	dWsYuaLgGJ7szzuqQz8f1XbogOo4KWqXpXNj6+oXxKymMPGrkZRD2xl07ROsMw==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C69ED634C5B;
	Mon, 27 Oct 2025 11:04:51 +0200 (EET)
Date: Mon, 27 Oct 2025 11:04:51 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <aP81s4FDhj0-3WFh@valkosipuli.retiisi.eu>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-3-c9286fbb34b9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-95_cam-v3-3-c9286fbb34b9@nxp.com>

Hi Frank,

On Thu, Aug 21, 2025 at 04:15:38PM -0400, Frank Li wrote:
> Add helper function media_bus_fmt_to_csi2_bpp() to get media bus fmt's bpp
> to reduce codes such as
> 
> 	static const struct imx7_csi_pixfmt pixel_formats[] = {
>         {
>                 .fourcc = V4L2_PIX_FMT_UYVY,
>                 .codes  = IMX_BUS_FMTS(
>                         MEDIA_BUS_FMT_UYVY8_2X8,
>                         MEDIA_BUS_FMT_UYVY8_1X16
>                 ),
>                 .yuv    = true,
>                 .bpp    = 16,
>         },
> 	....
> 
> .bpp can be removed from pixel_formats with this helper function.
> 
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
> Only add known map for dt type. Need update media_bus_fmt_info when new
> mapping used.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v3:
> - squash two help function patch to one.
> - use media_bus_fmt_info to do map.
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 149 ++++++++++++++++++++++++++++++++++
>  include/media/mipi-csi2.h             |  30 +++++++
>  2 files changed, 179 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index a5334aa35992e5f57fb228c33d40c51fdafdc135..a75987aa5fc69d6368709b7d521bede666da9513 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -46,6 +46,7 @@
>  #include <linux/uaccess.h>
>  #include <asm/io.h>
>  #include <asm/div64.h>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ctrls.h>
> @@ -757,3 +758,151 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
>  	return clk_hw->clk;
>  }
>  EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
> +
> +static const struct media_bus_fmt_info media_bus_fmt_info[] = {
> +	{ .fmt = MEDIA_BUS_FMT_RGB444_1X12, .bpp = 12},

Please add a comma and a whitespace before the closing brace.

> +	{ .fmt = MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_RGB565_1X16, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_BGR565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_BGR565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_RGB565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_RGB565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X18, .bpp = 18},
> +	{ .fmt = MEDIA_BUS_FMT_RGB666_2X9_BE, .bpp = 18},
> +	{ .fmt = MEDIA_BUS_FMT_BGR666_1X18, .bpp = 18},
> +	{ .fmt = MEDIA_BUS_FMT_RBG888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_BGR666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_RGB565_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, .bpp = 21},
> +	{ .fmt = MEDIA_BUS_FMT_BGR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_BGR888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_GBR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_RGB888_2X12_BE, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_RGB888_2X12_LE, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_RGB888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_RGB888_3X8_DELTA, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG, .bpp = 28},
> +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA, .bpp = 28},
> +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X30_CPADLO, .bpp = 30},
> +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X30_CPADLO, .bpp = 30},
> +	{ .fmt = MEDIA_BUS_FMT_ARGB8888_1X32, .bpp = 32},
> +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X32_PADHI, .bpp = 32},
> +	{ .fmt = MEDIA_BUS_FMT_RGB101010_1X30, .bpp = 30},
> +	{ .fmt = MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG, .bpp = 35},
> +	{ .fmt = MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA, .bpp = 35},
> +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X36_CPADLO, .bpp = 36},
> +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X36_CPADLO, .bpp = 36},
> +	{ .fmt = MEDIA_BUS_FMT_RGB121212_1X36, .bpp = 36},
> +	{ .fmt = MEDIA_BUS_FMT_RGB161616_1X48, .bpp = 48},
> +
> +	{ .fmt = MEDIA_BUS_FMT_Y8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> +	{ .fmt = MEDIA_BUS_FMT_UV8_1X8, .bpp = 8},
> +	{ .fmt = MEDIA_BUS_FMT_UYVY8_1_5X8, .bpp = 40},
> +	{ .fmt = MEDIA_BUS_FMT_VYUY8_1_5X8, .bpp = 40},
> +	{ .fmt = MEDIA_BUS_FMT_YUYV8_1_5X8, .bpp = 40},
> +	{ .fmt = MEDIA_BUS_FMT_YVYU8_1_5X8, .bpp = 40},
> +	{ .fmt = MEDIA_BUS_FMT_UYVY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_VYUY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_YUYV8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_YVYU8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_Y10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> +	{ .fmt = MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_UYVY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> +	{ .fmt = MEDIA_BUS_FMT_VYUY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> +	{ .fmt = MEDIA_BUS_FMT_YUYV10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> +	{ .fmt = MEDIA_BUS_FMT_YVYU10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> +	{ .fmt = MEDIA_BUS_FMT_Y12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> +	{ .fmt = MEDIA_BUS_FMT_UYVY12_2X12, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_VYUY12_2X12, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_YUYV12_2X12, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_YVYU12_2X12, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_Y14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> +	{ .fmt = MEDIA_BUS_FMT_Y16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_UYVY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_VYUY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_YUYV8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_YVYU8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_YDYUYDYV8_1X16, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_UYVY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> +	{ .fmt = MEDIA_BUS_FMT_VYUY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> +	{ .fmt = MEDIA_BUS_FMT_YUYV10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> +	{ .fmt = MEDIA_BUS_FMT_YVYU10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> +	{ .fmt = MEDIA_BUS_FMT_VUY8_1X24, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_YUV8_1X24, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_UYYVYY8_0_5X24, .dt = MIPI_CSI2_DT_YUV420_8B, .bpp = 120},
> +	{ .fmt = MEDIA_BUS_FMT_UYVY12_1X24, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_VYUY12_1X24, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_YUYV12_1X24, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_YVYU12_1X24, .bpp = 24},
> +	{ .fmt = MEDIA_BUS_FMT_YUV10_1X30, .bpp = 30},
> +	{ .fmt = MEDIA_BUS_FMT_UYYVYY10_0_5X30, .bpp = 150},
> +	{ .fmt = MEDIA_BUS_FMT_AYUV8_1X32, .bpp = 32},
> +	{ .fmt = MEDIA_BUS_FMT_UYYVYY12_0_5X36, .bpp = 180},
> +	{ .fmt = MEDIA_BUS_FMT_YUV12_1X36, .bpp = 36},
> +	{ .fmt = MEDIA_BUS_FMT_YUV16_1X48, .bpp = 48},
> +	{ .fmt = MEDIA_BUS_FMT_UYYVYY16_0_5X48, .bpp = 240},

That's quite many bits per pixel. Is the value correct (looks like bits per
sample rather)? There are other, too, that seem quite high.

> +
> +	{ .fmt = MEDIA_BUS_FMT_SBGGR8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> +	{ .fmt = MEDIA_BUS_FMT_SGBRG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> +	{ .fmt = MEDIA_BUS_FMT_SGRBG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> +	{ .fmt = MEDIA_BUS_FMT_SRGGB8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8, .bpp = 8},
> +	{ .fmt = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8, .bpp = 8},
> +	{ .fmt = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8, .bpp = 8},
> +	{ .fmt = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8, .bpp = 8},
> +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8, .bpp = 8},
> +	{ .fmt = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8, .bpp = 8},
> +	{ .fmt = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8, .bpp = 8},
> +	{ .fmt = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8, .bpp = 8},
> +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_BE, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_LE, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> +	{ .fmt = MEDIA_BUS_FMT_SGBRG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> +	{ .fmt = MEDIA_BUS_FMT_SGRBG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> +	{ .fmt = MEDIA_BUS_FMT_SRGGB10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> +	{ .fmt = MEDIA_BUS_FMT_SBGGR12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> +	{ .fmt = MEDIA_BUS_FMT_SGBRG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> +	{ .fmt = MEDIA_BUS_FMT_SGRBG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> +	{ .fmt = MEDIA_BUS_FMT_SRGGB12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> +	{ .fmt = MEDIA_BUS_FMT_SBGGR14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> +	{ .fmt = MEDIA_BUS_FMT_SGBRG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> +	{ .fmt = MEDIA_BUS_FMT_SGRBG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> +	{ .fmt = MEDIA_BUS_FMT_SRGGB14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> +	{ .fmt = MEDIA_BUS_FMT_SBGGR16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_SGBRG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_SGRBG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_SRGGB16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> +
> +	{ .fmt = MEDIA_BUS_FMT_JPEG_1X8, .bpp = 8},
> +
> +	{ .fmt = MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8, .bpp = 8},
> +
> +	{ .fmt = MEDIA_BUS_FMT_AHSV8888_1X32, .bpp = 8},
> +
> +	{ .fmt = MEDIA_BUS_FMT_META_8, .bpp = 8},
> +	{ .fmt = MEDIA_BUS_FMT_META_10, .bpp = 10},
> +	{ .fmt = MEDIA_BUS_FMT_META_12, .bpp = 12},
> +	{ .fmt = MEDIA_BUS_FMT_META_14, .bpp = 14},
> +	{ .fmt = MEDIA_BUS_FMT_META_16, .bpp = 16},
> +	{ .fmt = MEDIA_BUS_FMT_META_20, .bpp = 20},
> +	{ .fmt = MEDIA_BUS_FMT_META_24, .bpp = 24},
> +};
> +
> +const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt)
> +{
> +	int i;

unsigned int, please. You can also declare it within the loop.

> +
> +	for (i = 0; i < ARRAY_SIZE(media_bus_fmt_info); i++)
> +		if (media_bus_fmt_info[i].fmt == bus_fmt)
> +			return &media_bus_fmt_info[i];
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(media_bus_fmt_info_get);
> diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
> index 40fc0264250d779ab5dfa7d2fe16e6f1382c07d4..3227d28224b7c32ef2745548391da9e792cfa559 100644
> --- a/include/media/mipi-csi2.h
> +++ b/include/media/mipi-csi2.h
> @@ -8,6 +8,8 @@
>  #ifndef _MEDIA_MIPI_CSI2_H
>  #define _MEDIA_MIPI_CSI2_H
>  
> +/* DT value ref to MIPI Camera Serial Interface 2 Spec Ver4.1 section 9.4 */

I'm not sure if I'd add such a reference here. At least it shouldn't be in
this patch.

> +
>  /* Short packet data types */
>  #define MIPI_CSI2_DT_FS			0x00
>  #define MIPI_CSI2_DT_FE			0x01
> @@ -44,4 +46,32 @@
>  #define MIPI_CSI2_DT_RAW20		0x2f
>  #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
>  
> +/**
> + * struct media_bus_fmt_info - information about a media bus format
> + * @fmt: media bus format identifier (MEDIA_BUS_FMT_*)
> + * @dt: data type define in MIPI spec (MIPI_CSI2_DT *)
> + * @bpp: bit width per pixel
> + */

I wonder if we should keep this out of sight from drivers. That'd mean
moving the functions below to the .c file, too.

> +struct media_bus_fmt_info {
> +	u32 fmt;
> +	u32 dt;

dt can be u8, too.

> +	u8 bpp;
> +};
> +
> +const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt);
> +
> +static inline int media_bus_fmt_to_csi2_dt(int bus_fmt)

u32

> +{
> +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> +
> +	return info ? info->dt : 0;
> +}
> +
> +static inline int media_bus_fmt_to_csi2_bpp(int bus_fmt)

u32

> +{
> +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> +
> +	return info ? info->bpp : 0;
> +}
> +
>  #endif /* _MEDIA_MIPI_CSI2_H */
> 

-- 
Kind regards,

Sakari Ailus

