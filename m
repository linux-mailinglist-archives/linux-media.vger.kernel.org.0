Return-Path: <linux-media+bounces-62358-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BlhMJk3DmpC8gUAu9opvQ
	(envelope-from <linux-media+bounces-62358-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 00:37:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 377BF59C274
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 00:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC04B311E0D4
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 22:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8713BED5C;
	Wed, 20 May 2026 22:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e33zni2q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805843BF680;
	Wed, 20 May 2026 22:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779316191; cv=none; b=GOaM+X8Tchm/ri0nX0nIHcT1Dzpe3IX5holiGwzKQzIugaYyyHOPAvyLIR3MD7em3h6Oc0+uqLTLjxBY3JPj1xxMB2MtcCwx+SDfTjd/zMrzXb40sRTDquSSqWDvmDbjcnrcLKftYDkQSVdY8e6N2sby1uEnvQ1/ZkRRmyh45SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779316191; c=relaxed/simple;
	bh=CB/ZwQnnOqCZBEUIm4XJwtc6s54lz/fjEQ/ke802YhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BND+m/DPHegzAnWB0kYn3TVDoa08uxi7YxXH5lI9ZoFIHzC2rf6nb0XM3Be4ZkzIZPbfjO3K1z3wIIMBzz2+PKrGWTQ/j6s1GbSPS0mTyKwiHqkS5o4NtPiMRO2y8PtFM1lsnhgfb5H9AbxGKb5+CGgur3f3ioErh8JIEdOuDss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e33zni2q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1274B268;
	Thu, 21 May 2026 00:29:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779316173;
	bh=CB/ZwQnnOqCZBEUIm4XJwtc6s54lz/fjEQ/ke802YhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e33zni2qMnVMFEczGf/Nvoi1LKf6Z8y3TYZ+djqub3jbOsZh86Ho0Q2bbxZQfdW39
	 DPJ+NUBH5X5KX2PKxQyGq0Lgu3K9l6LUBr/mAU6lBP1iGXbsgHJkmF7Ub4a0DrjxuA
	 8vu+tzivc4GyU0v7Wvu3UcUv5sO1LIhaPyWixvBE=
Date: Thu, 21 May 2026 00:29:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v7 2/2] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Message-ID: <20260520222945.GE9017@killaraus.ideasonboard.com>
References: <20260518-csi_formatter-v7-0-562b750557e3@oss.nxp.com>
 <20260518-csi_formatter-v7-2-562b750557e3@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518-csi_formatter-v7-2-562b750557e3@oss.nxp.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62358-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,linux.dev:email]
X-Rspamd-Queue-Id: 377BF59C274
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Guoniu,

Thank you for the patch.

On Mon, May 18, 2026 at 10:19:47AM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The CSI pixel formatter is a module found on i.MX95 used to reformat
> packet info, pixel and non-pixel data from CSI-2 host controller to
> match Pixel Link(PL) definition.
> 
> Add data formatting support.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v7:
> - Update references from imx9 to imx95 for consistency with dt-bindings
> - Enable PM runtime before async registration
> 
> Changes in v6:
> - Remove unused header includes
> - Unify macro naming: VCx/VCX -> VC and parameter x -> vc
> - Remove unused format field from csi_formatter struct
> - Use compact initialization for formats array
> - Make find_csi_format() return NULL instead of default format
> - Use unsigned int for array index in find_csi_format()
> - Add err_ prefix to error handling labels
> - Add v4l2_subdev_cleanup() and reorder cleanup sequence
> - Update enable_streams debug output format
> - Rename VC_MAX to VC_NUM and fix boundary check
> - Update CSI formatter Kconfig description
> - Use v4l2_subdev_get_frame_desc_passthrough() helper
> - Fix error paths in async registration and probe
> - Add mutex to protect enabled_streams
> - Switch to devm_pm_runtime_enable()
> - Remove redundant num_routes check in set_routing
> - Optimize get_index_by_dt() and add warning for unsupported type
> - csi_formatter_start/stop_stream: Process all streams in mask
> ---
>  MAINTAINERS                                      |   8 +
>  drivers/media/platform/nxp/Kconfig               |  14 +
>  drivers/media/platform/nxp/Makefile              |   1 +
>  drivers/media/platform/nxp/imx95-csi-formatter.c | 776 +++++++++++++++++++++++
>  4 files changed, 799 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 81d53481d3f7..837e14fe7a12 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19265,6 +19265,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
>  F:	drivers/media/platform/nxp/imx-jpeg
>  
> +NXP i.MX 95 CSI PIXEL FORMATTER V4L2 DRIVER
> +M:	Guoniu Zhou <guoniu.zhou@nxp.com>
> +L:	imx@lists.linux.dev
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> +F:	drivers/media/platform/nxp/imx95-csi-formatter.c
> +
>  NXP i.MX CLOCK DRIVERS
>  M:	Abel Vesa <abelvesa@kernel.org>
>  R:	Peng Fan <peng.fan@nxp.com>
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> index 40e3436669e2..82caae94a728 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -28,6 +28,20 @@ config VIDEO_IMX8MQ_MIPI_CSI2
>  	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8MQ
>  	  SoC.
>  
> +config VIDEO_IMX95_CSI_FORMATTER
> +	tristate "NXP i.MX95 CSI Pixel Formatter driver"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This driver provides support for the CSI Pixel Formatter found on
> +	  i.MX95 series SoCs. This module unpacks the pixels received from the
> +	  CSI-2 interface and reformats them to meet pixel link requirements.
> +
> +	  Say Y here to enable CSI Pixel Formater module for i.MX95 SoC.
> +
>  config VIDEO_IMX_MIPI_CSIS
>  	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
> index 4d90eb713652..6410115d870e 100644
> --- a/drivers/media/platform/nxp/Makefile
> +++ b/drivers/media/platform/nxp/Makefile
> @@ -6,6 +6,7 @@ obj-y += imx8-isi/
>  
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
> +obj-$(CONFIG_VIDEO_IMX95_CSI_FORMATTER) += imx95-csi-formatter.o
>  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
>  obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
>  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
> diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/media/platform/nxp/imx95-csi-formatter.c
> new file mode 100644
> index 000000000000..45240b7422b4
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
> @@ -0,0 +1,776 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +/* CSI Pixel Formatter registers map */
> +
> +#define CSI_VC_INTERLACED_LINE_CNT(vc)		(0x00 + (vc) * 0x04)
> +#define INTERLACED_ODD_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(13, 0), (x))
> +#define INTERLACED_EVEN_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(29, 16), (x))
> +
> +#define CSI_VC_INTERLACED_CTRL			0x20
> +
> +#define CSI_VC_INTERLACED_ERR			0x24
> +#define CSI_VC_ERR_MASK				GENMASK(7, 0)
> +#define CSI_VC_ERR(vc)				BIT((vc))
> +
> +#define CSI_VC_YUV420_FIRST_LINE_EVEN		0x28
> +#define YUV420_FIRST_LINE_EVEN(vc)		BIT((vc))
> +
> +#define CSI_RAW32_CTRL				0x30
> +#define CSI_VC_RAW32_MODE(vc)			BIT((vc))
> +#define CSI_VC_RAW32_SWAP_MODE(vc)		BIT((vc) + 8)
> +
> +#define STREAM_FENCING_CTRL			0x34
> +#define CSI_VC_STREAM_FENCING(vc)		BIT((vc))
> +#define CSI_VC_STREAM_FENCING_RST(vc)		BIT((vc) + 8)
> +
> +#define STREAM_FENCING_STS			0x38
> +#define STREAM_FENCING_STS_MASK			GENMASK(7, 0)
> +
> +#define CSI_VC_NON_PIXEL_DATA_TYPE(vc)		(0x40 + (vc) * 0x04)
> +
> +#define CSI_VC_PIXEL_DATA_CTRL(vc)		(0x60 + (vc) * 0x04)
> +#define NEW_VC(vc)				FIELD_PREP(GENMASK(3, 1), vc)
> +#define REROUTE_VC_ENABLE			BIT(0)
> +
> +#define CSI_VC_ROUTE_PIXEL_DATA_TYPE(vc)	(0x80 + (vc) * 0x04)
> +
> +#define CSI_VC_NON_PIXEL_DATA_CTRL(vc)		(0xa0 + (vc) * 0x04)
> +
> +#define CSI_VC_PIXEL_DATA_TYPE(vc)		(0xc0 + (vc) * 0x04)
> +
> +#define CSI_VC_PIXEL_DATA_TYPE_ERR(vc)		(0xe0 + (vc) * 0x04)
> +
> +#define CSI_FORMATTER_PAD_SINK			0
> +#define CSI_FORMATTER_PAD_SOURCE		1
> +#define CSI_FORMATTER_PAD_NUM			2
> +
> +#define CSI_FORMATTER_VC_NUM			8 /* Number of virtual channels */
> +
> +struct formatter_pix_format {
> +	u32 code;
> +	u32 data_type;
> +};
> +
> +struct csi_formatter {
> +	struct device *dev;
> +	struct regmap *regs;
> +	struct clk *clk;
> +
> +	struct v4l2_subdev sd;
> +	struct v4l2_subdev *csi_sd;
> +	struct v4l2_async_notifier notifier;
> +	struct media_pad pads[CSI_FORMATTER_PAD_NUM];
> +	const struct formatter_pix_format *fmt;

State shouldn't be stored in csi_formatter. You can drop this field, and
look up the formatter_pix_format in csi_formatter_start_stream() using
the media bus code stored in the active state.

> +
> +	u32 remote_pad;
> +	u32 reg_offset;
> +
> +	/* Protects enabled_streams */
> +	struct mutex lock;
> +	u64 enabled_streams;
> +};
> +
> +struct dt_index {
> +	u8 dtype;
> +	u8 index;
> +};
> +
> +/*
> + * The index should correspond to the bit index define in register
> + * which enable the data type of pixel data transported by Formatter.
> + */
> +static const struct dt_index formatter_dt_to_index_map[] = {
> +	{ .dtype = MIPI_CSI2_DT_YUV420_8B,        .index = 0 },
> +	{ .dtype = MIPI_CSI2_DT_YUV420_8B_LEGACY, .index = 2 },
> +	{ .dtype = MIPI_CSI2_DT_YUV422_8B,        .index = 6 },
> +	{ .dtype = MIPI_CSI2_DT_RGB444,		  .index = 8 },
> +	{ .dtype = MIPI_CSI2_DT_RGB555,           .index = 9 },
> +	{ .dtype = MIPI_CSI2_DT_RGB565,           .index = 10 },
> +	{ .dtype = MIPI_CSI2_DT_RGB666,           .index = 11 },
> +	{ .dtype = MIPI_CSI2_DT_RGB888,           .index = 12 },
> +	{ .dtype = MIPI_CSI2_DT_RAW6,             .index = 16 },
> +	{ .dtype = MIPI_CSI2_DT_RAW7,             .index = 17 },
> +	{ .dtype = MIPI_CSI2_DT_RAW8,             .index = 18 },
> +	{ .dtype = MIPI_CSI2_DT_RAW10,            .index = 19 },
> +	{ .dtype = MIPI_CSI2_DT_RAW12,            .index = 20 },
> +	{ .dtype = MIPI_CSI2_DT_RAW14,            .index = 21 },
> +	{ .dtype = MIPI_CSI2_DT_RAW16,            .index = 22 },
> +};
> +
> +static const struct formatter_pix_format formats[] = {
> +	/* YUV formats */
> +	{ MEDIA_BUS_FMT_UYVY8_1X16,	MIPI_CSI2_DT_YUV422_8B },
> +	/* RGB formats */
> +	{ MEDIA_BUS_FMT_RGB565_1X16,	MIPI_CSI2_DT_RGB565 },
> +	{ MEDIA_BUS_FMT_RGB888_1X24,	MIPI_CSI2_DT_RGB888 },
> +	/* RAW (Bayer and greyscale) formats */
> +	{ MEDIA_BUS_FMT_SBGGR8_1X8,	MIPI_CSI2_DT_RAW8 },
> +	{ MEDIA_BUS_FMT_SGBRG8_1X8,	MIPI_CSI2_DT_RAW8 },
> +	{ MEDIA_BUS_FMT_SGRBG8_1X8,	MIPI_CSI2_DT_RAW8 },
> +	{ MEDIA_BUS_FMT_SRGGB8_1X8,	MIPI_CSI2_DT_RAW8 },
> +	{ MEDIA_BUS_FMT_Y8_1X8,		MIPI_CSI2_DT_RAW8 },
> +	{ MEDIA_BUS_FMT_SBGGR10_1X10,	MIPI_CSI2_DT_RAW10 },
> +	{ MEDIA_BUS_FMT_SGBRG10_1X10,	MIPI_CSI2_DT_RAW10 },
> +	{ MEDIA_BUS_FMT_SGRBG10_1X10,	MIPI_CSI2_DT_RAW10 },
> +	{ MEDIA_BUS_FMT_SRGGB10_1X10,	MIPI_CSI2_DT_RAW10 },
> +	{ MEDIA_BUS_FMT_Y10_1X10,	MIPI_CSI2_DT_RAW10 },
> +	{ MEDIA_BUS_FMT_SBGGR12_1X12,	MIPI_CSI2_DT_RAW12 },
> +	{ MEDIA_BUS_FMT_SGBRG12_1X12,	MIPI_CSI2_DT_RAW12 },
> +	{ MEDIA_BUS_FMT_SGRBG12_1X12,	MIPI_CSI2_DT_RAW12 },
> +	{ MEDIA_BUS_FMT_SRGGB12_1X12,	MIPI_CSI2_DT_RAW12 },
> +	{ MEDIA_BUS_FMT_Y12_1X12,	MIPI_CSI2_DT_RAW12 },
> +	{ MEDIA_BUS_FMT_SBGGR14_1X14,	MIPI_CSI2_DT_RAW14 },
> +	{ MEDIA_BUS_FMT_SGBRG14_1X14,	MIPI_CSI2_DT_RAW14 },
> +	{ MEDIA_BUS_FMT_SGRBG14_1X14,	MIPI_CSI2_DT_RAW14 },
> +	{ MEDIA_BUS_FMT_SRGGB14_1X14,	MIPI_CSI2_DT_RAW14 },
> +	{ MEDIA_BUS_FMT_SBGGR16_1X16,	MIPI_CSI2_DT_RAW16 },
> +	{ MEDIA_BUS_FMT_SGBRG16_1X16,	MIPI_CSI2_DT_RAW16 },
> +	{ MEDIA_BUS_FMT_SGRBG16_1X16,	MIPI_CSI2_DT_RAW16 },
> +	{ MEDIA_BUS_FMT_SRGGB16_1X16,	MIPI_CSI2_DT_RAW16 },
> +};
> +
> +static const struct v4l2_mbus_framefmt formatter_default_fmt = {
> +	.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +	.width = 1920U,
> +	.height = 1080U,
> +	.field = V4L2_FIELD_NONE,
> +	.colorspace = V4L2_COLORSPACE_SMPTE170M,
> +	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
> +	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
> +	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> +};
> +
> +static const struct formatter_pix_format *find_csi_format(u32 code)

You have a mix of function naming schemes. Some start with formatter_,
some with csi_formatter_, and some have no driver-specific prefer at
all. Could you please unify them to use the same prefix ?

> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(formats); i++)
> +		if (code == formats[i].code)
> +			return &formats[i];
> +
> +	return NULL;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * V4L2 subdev operations
> + */
> +
> +static inline struct csi_formatter *sd_to_formatter(struct v4l2_subdev *sdev)
> +{
> +	return container_of(sdev, struct csi_formatter, sd);
> +}
> +
> +static int __formatter_subdev_set_routing(struct v4l2_subdev *sd,
> +					  struct v4l2_subdev_state *state,
> +					  struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	ret = v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> +						&formatter_default_fmt);
> +}
> +
> +static int formatter_subdev_init_state(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *sd_state)
> +{
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = CSI_FORMATTER_PAD_SINK,
> +			.sink_stream = 0,
> +			.source_pad = CSI_FORMATTER_PAD_SOURCE,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +
> +	struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +
> +	return __formatter_subdev_set_routing(sd, sd_state, &routing);
> +}
> +
> +static int formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
> +					   struct v4l2_subdev_state *sd_state,
> +					   struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->pad == CSI_FORMATTER_PAD_SOURCE) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index > 0)
> +			return -EINVAL;
> +
> +		fmt = v4l2_subdev_state_get_format(sd_state, code->pad,
> +						   code->stream);
> +		code->code = fmt->code;
> +		return 0;
> +	}
> +
> +	if (code->index >= ARRAY_SIZE(formats))
> +		return -EINVAL;
> +
> +	code->code = formats[code->index].code;
> +
> +	return 0;
> +}
> +
> +static int formatter_subdev_set_fmt(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *sd_state,
> +				    struct v4l2_subdev_format *sdformat)
> +{
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +	struct formatter_pix_format const *format;
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	if (sdformat->pad == CSI_FORMATTER_PAD_SOURCE)
> +		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> +
> +	/*
> +	 * Validate the media bus code and clamp and align the size.
> +	 *
> +	 * The total number of bits per line must be a multiple of 8. We thus
> +	 * need to align the width for formats that are not multiples of 8
> +	 * bits.

Where is this done ?

> +	 */
> +	format = find_csi_format(sdformat->format.code);
> +	if (!format)
> +		format = &formats[0];
> +
> +	v4l_bound_align_image(&sdformat->format.width, 1, 0xffff, 2,
> +			      &sdformat->format.height, 1, 0xffff, 0, 0);
> +
> +	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad,
> +					   sdformat->stream);
> +	*fmt = sdformat->format;
> +
> +	/* Set default code if user set an invalid value */
> +	fmt->code = format->code;
> +
> +	/* Propagate the format from sink stream to source stream */
> +	fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat->pad,
> +							   sdformat->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt = sdformat->format;
> +
> +	/* Store the CSIS format descriptor for active formats. */
> +	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +		formatter->fmt = format;
> +
> +	return 0;
> +}
> +
> +static int formatter_subdev_set_routing(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state,
> +					enum v4l2_subdev_format_whence which,
> +					struct v4l2_subdev_krouting *routing)
> +{
> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE &&
> +	    media_entity_is_streaming(&sd->entity))
> +		return -EBUSY;
> +
> +	return __formatter_subdev_set_routing(sd, state, routing);
> +}
> +
> +static inline void formatter_write(struct csi_formatter *formatter,
> +				   unsigned int reg, unsigned int value)
> +{
> +	u32 offset = formatter->reg_offset;
> +
> +	regmap_write(formatter->regs, reg + offset, value);
> +}
> +
> +static u8 get_index_by_dt(u8 data_type)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(formatter_dt_to_index_map); ++i) {
> +		const struct dt_index *entry = &formatter_dt_to_index_map[i];
> +
> +		if (data_type == entry->dtype)
> +			return entry->index;
> +	}
> +
> +	pr_warn_once("Unsupported data type 0x%x, using default\n", data_type);
> +
> +	return formatter_dt_to_index_map[0].index;
> +}
> +
> +static int get_vc(struct csi_formatter *formatter, unsigned int stream)
> +{
> +	struct v4l2_mbus_frame_desc source_fd;
> +	struct v4l2_mbus_frame_desc_entry *entry = NULL;
> +	unsigned int i;
> +	int vc;
> +	int ret;
> +
> +	/*
> +	 * Return virtual channel 0 as default value when remote subdev
> +	 * don't implement .get_frame_desc subdev callback
> +	 */
> +	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
> +			       formatter->remote_pad, &source_fd);
> +	if (ret < 0)
> +		return (ret == -ENOIOCTLCMD) ? 0 : ret;
> +
> +	for (i = 0; i < source_fd.num_entries; ++i) {
> +		if (source_fd.entry[i].stream == stream) {
> +			entry = &source_fd.entry[i];
> +			break;
> +		}
> +	}
> +
> +	if (!entry) {
> +		dev_err(formatter->dev,
> +			"Can't find valid frame desc corresponding to stream %d\n", stream);
> +		return -EPIPE;
> +	}
> +
> +	vc = entry->bus.csi2.vc;
> +
> +	if (vc < 0 || vc >= CSI_FORMATTER_VC_NUM) {
> +		dev_err(formatter->dev, "Invalid virtual channel %d\n", vc);
> +		return -EINVAL;
> +	}
> +
> +	return vc;
> +}
> +
> +static void csi_formatter_stop_stream(struct csi_formatter *formatter,
> +				     u64 stream_mask)
> +{
> +	unsigned int i;
> +	int ret;
> +	int vc;
> +
> +	for (i = 0; i < V4L2_FRAME_DESC_ENTRY_MAX; ++i) {

I don't understand why you iterate over the maximum number of descriptor
entries.

> +		if (!(stream_mask & BIT(i)))
> +			continue;
> +
> +		ret = get_vc(formatter, i);

This function calls the source's get_frame_desc operation, which will
return the exact same descriptors for every iterateion of this loop. You
should call the operation before the loop.

> +		if (WARN_ON(ret < 0)) {
> +			dev_err(formatter->dev,
> +				"Failed to get VC for stream %d: %d\n", i, ret);
> +			continue;
> +		}
> +
> +		vc = ret;
> +
> +		formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), 0);
> +	}
> +}
> +
> +static int csi_formatter_start_stream(struct csi_formatter *formatter,
> +				      u64 stream_mask)
> +{
> +	const struct formatter_pix_format *fmt = formatter->fmt;
> +	u64 configured_streams = 0;
> +	unsigned int i;
> +	u32 val;
> +	int ret;
> +	int vc;
> +
> +	for (i = 0; i < V4L2_FRAME_DESC_ENTRY_MAX; ++i) {
> +		if (!(stream_mask & BIT(i)))
> +			continue;
> +
> +		val = BIT(get_index_by_dt(fmt->data_type));

Is the formatter limited to using the same data type of all VCs ?

> +
> +		ret = get_vc(formatter, i);
> +		if (ret < 0)
> +			goto err_cleanup;
> +
> +		vc = ret;
> +
> +		formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), val);
> +		configured_streams |= BIT(i);
> +	}
> +
> +	return 0;
> +
> +err_cleanup:
> +	csi_formatter_stop_stream(formatter, configured_streams);
> +	return ret;
> +}
> +
> +static int formatter_subdev_enable_streams(struct v4l2_subdev *sd,
> +					   struct v4l2_subdev_state *state,
> +					   u32 pad, u64 streams_mask)
> +{
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +	struct device *dev = formatter->dev;
> +	u64 sink_streams;
> +	int ret;
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       CSI_FORMATTER_PAD_SOURCE,
> +						       CSI_FORMATTER_PAD_SINK,
> +						       &streams_mask);
> +	if (!sink_streams || !streams_mask)
> +		return -EINVAL;
> +
> +	dev_dbg(dev, "Enable streams: pad=%u sink=0x%llx source=0x%llx\n",
> +		formatter->remote_pad, sink_streams, streams_mask);

Is this still useful, especially given that v4l2_subdev_enable_streams()
prints a debug message already ?

> +
> +	if (!formatter->csi_sd) {

If you set the MUST_CONNECT flag on the sink pad this will never happen,
as the V4L2 core will refuse to start streaming without an enabled link
on the sink. This will simplify the driver.

> +		dev_err(dev, "CSI controller not linked with formatter\n");
> +		return -EPIPE;
> +	}
> +
> +	guard(mutex)(&formatter->lock);
> +
> +	if (!formatter->enabled_streams) {
> +		ret = pm_runtime_resume_and_get(formatter->dev);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to resume runtime PM: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = csi_formatter_start_stream(formatter, streams_mask);
> +	if (ret)
> +		goto err_runtime_put;
> +
> +	ret = v4l2_subdev_enable_streams(formatter->csi_sd,
> +					 formatter->remote_pad,
> +					 sink_streams);
> +	if (ret)
> +		goto err_stop_stream;
> +
> +	formatter->enabled_streams |= streams_mask;
> +
> +	return 0;
> +
> +err_stop_stream:
> +	csi_formatter_stop_stream(formatter, streams_mask);
> +err_runtime_put:
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put(formatter->dev);
> +	return ret;
> +}
> +
> +static int formatter_subdev_disable_streams(struct v4l2_subdev *sd,
> +					    struct v4l2_subdev_state *state,
> +					    u32 pad, u64 streams_mask)
> +{
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +	u64 sink_streams;
> +	int ret;
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       CSI_FORMATTER_PAD_SOURCE,
> +						       CSI_FORMATTER_PAD_SINK,
> +						       &streams_mask);
> +	if (!sink_streams || !streams_mask)
> +		return -EINVAL;
> +
> +	guard(mutex)(&formatter->lock);
> +
> +	ret = v4l2_subdev_disable_streams(formatter->csi_sd, formatter->remote_pad,
> +					  sink_streams);
> +	if (ret)
> +		dev_err(formatter->dev, "Failed to disable streams: %d\n", ret);
> +
> +	csi_formatter_stop_stream(formatter, streams_mask);
> +
> +	formatter->enabled_streams &= ~streams_mask;
> +
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put(formatter->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_pad_ops formatter_subdev_pad_ops = {
> +	.enum_mbus_code		= formatter_subdev_enum_mbus_code,
> +	.get_fmt		= v4l2_subdev_get_fmt,
> +	.set_fmt		= formatter_subdev_set_fmt,
> +	.get_frame_desc		= v4l2_subdev_get_frame_desc_passthrough,
> +	.set_routing		= formatter_subdev_set_routing,
> +	.enable_streams		= formatter_subdev_enable_streams,
> +	.disable_streams	= formatter_subdev_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops formatter_subdev_ops = {
> +	.pad = &formatter_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops formatter_internal_ops = {
> +	.init_state = formatter_subdev_init_state,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Media entity operations
> + */
> +
> +static const struct media_entity_operations formatter_entity_ops = {
> +	.link_validate	= v4l2_subdev_link_validate,
> +	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
> +};
> +
> +static int csi_formatter_subdev_init(struct csi_formatter *formatter)
> +{
> +	struct v4l2_subdev *sd = &formatter->sd;
> +	int ret;
> +
> +	v4l2_subdev_init(sd, &formatter_subdev_ops);
> +
> +	snprintf(sd->name, sizeof(sd->name), "%s", dev_name(formatter->dev));
> +	sd->internal_ops = &formatter_internal_ops;
> +
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +		     V4L2_SUBDEV_FL_HAS_EVENTS |
> +		     V4L2_SUBDEV_FL_STREAMS;
> +	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> +	sd->entity.ops = &formatter_entity_ops;
> +	sd->dev = formatter->dev;
> +
> +	formatter->pads[CSI_FORMATTER_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +	formatter->pads[CSI_FORMATTER_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&sd->entity, CSI_FORMATTER_PAD_NUM,
> +				     formatter->pads);
> +	if (ret) {
> +		dev_err(formatter->dev, "Failed to init pads\n");
> +		return ret;
> +	}
> +
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		media_entity_cleanup(&sd->entity);
> +
> +	return ret;
> +}
> +
> +static inline struct csi_formatter *
> +notifier_to_formatter(struct v4l2_async_notifier *n)
> +{
> +	return container_of(n, struct csi_formatter, notifier);
> +}
> +
> +static int csi_formatter_notify_bound(struct v4l2_async_notifier *notifier,
> +				      struct v4l2_subdev *sd,
> +				      struct v4l2_async_connection *asc)
> +{
> +	const unsigned int link_flags = MEDIA_LNK_FL_IMMUTABLE
> +				      | MEDIA_LNK_FL_ENABLED;
> +	struct csi_formatter *formatter = notifier_to_formatter(notifier);
> +	struct v4l2_subdev *sdev = &formatter->sd;
> +	struct media_pad *sink = &sdev->entity.pads[CSI_FORMATTER_PAD_SINK];
> +	struct media_pad *remote_pad;
> +	int ret;
> +
> +	formatter->csi_sd = sd;
> +
> +	dev_dbg(formatter->dev, "Bound subdev: %s pad\n", sd->name);
> +
> +	ret = v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
> +	if (ret < 0)
> +		return ret;
> +
> +	remote_pad = media_pad_remote_pad_first(sink);
> +	if (!remote_pad) {
> +		dev_err(formatter->dev, "Pipe not setup correctly\n");
> +		return -EPIPE;
> +	}
> +	formatter->remote_pad = remote_pad->index;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations formatter_notify_ops = {
> +	.bound = csi_formatter_notify_bound,
> +};
> +
> +static int csi_formatter_async_register(struct csi_formatter *formatter)
> +{
> +	struct device *dev = formatter->dev;
> +	struct v4l2_async_connection *asc;
> +	int ret;
> +
> +	struct fwnode_handle *ep __free(fwnode_handle) =
> +		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +						FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -ENOTCONN;
> +
> +	v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
> +
> +	asc = v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
> +					      struct v4l2_async_connection);
> +	if (IS_ERR(asc)) {
> +		ret = PTR_ERR(asc);
> +		goto err_cleanup_notifier;
> +	}
> +
> +	formatter->notifier.ops = &formatter_notify_ops;
> +
> +	ret = v4l2_async_nf_register(&formatter->notifier);
> +	if (ret)
> +		goto err_cleanup_notifier;
> +
> +	ret = v4l2_async_register_subdev(&formatter->sd);
> +	if (ret)
> +		goto err_unregister_notifier;
> +
> +	return 0;
> +
> +err_unregister_notifier:
> +	v4l2_async_nf_unregister(&formatter->notifier);
> +err_cleanup_notifier:
> +	v4l2_async_nf_cleanup(&formatter->notifier);
> +	return ret;
> +}
> +
> +static void csi_formatter_async_unregister(struct csi_formatter *formatter)
> +{
> +	v4l2_async_unregister_subdev(&formatter->sd);
> +	v4l2_async_nf_unregister(&formatter->notifier);
> +	v4l2_async_nf_cleanup(&formatter->notifier);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Suspend/resume
> + */
> +
> +static int csi_formatter_runtime_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	clk_disable_unprepare(formatter->clk);
> +
> +	return 0;
> +}
> +
> +static int csi_formatter_runtime_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	return clk_prepare_enable(formatter->clk);
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(csi_formatter_pm_ops,
> +				 csi_formatter_runtime_suspend,
> +				 csi_formatter_runtime_resume, NULL);
> +
> +static int csi_formatter_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct csi_formatter *formatter;
> +	u32 val;
> +	int ret;
> +
> +	formatter = devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
> +	if (!formatter)
> +		return -ENOMEM;
> +
> +	formatter->dev = dev;
> +
> +	ret = devm_mutex_init(dev, &formatter->lock);
> +	if (ret)
> +		return ret;
> +
> +	formatter->regs = syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(formatter->regs))
> +		return dev_err_probe(dev, PTR_ERR(formatter->regs),
> +				     "Failed to get csi formatter regmap\n");
> +
> +	ret = of_property_read_u32(dev->of_node, "reg", &val);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get csi formatter reg property\n");
> +
> +	formatter->reg_offset = val;

I'd like to see how the device is integrated in DT to validate the usage
of reg here. The example in the DT bindings only shows the formatter's
device node, I don't know what the parent device is.

> +
> +	formatter->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(formatter->clk))
> +		return dev_err_probe(dev, PTR_ERR(formatter->clk),
> +				     "Failed to get pixel clock\n");
> +
> +	ret = csi_formatter_subdev_init(formatter);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "formatter subdev init fail\n");
> +
> +	/* Initialize formatter pixel format */
> +	formatter->fmt = &formats[0];
> +
> +	platform_set_drvdata(pdev, &formatter->sd);
> +
> +	/* Enable runtime PM. */
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		goto err_cleanup_subdev;
> +
> +	ret = csi_formatter_async_register(formatter);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to register async subdevice\n");
> +		goto err_cleanup_subdev;
> +	}
> +
> +	return 0;
> +
> +err_cleanup_subdev:
> +	v4l2_subdev_cleanup(&formatter->sd);
> +	media_entity_cleanup(&formatter->sd.entity);
> +	return ret;
> +}
> +
> +static void csi_formatter_remove(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	csi_formatter_async_unregister(formatter);
> +
> +	v4l2_subdev_cleanup(&formatter->sd);
> +	media_entity_cleanup(&formatter->sd.entity);
> +}
> +
> +static const struct of_device_id csi_formatter_of_match[] = {
> +	{ .compatible = "fsl,imx95-csi-formatter" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, csi_formatter_of_match);
> +
> +static struct platform_driver csi_formatter_device_driver = {
> +	.driver = {
> +		.name           = "csi-pixel-formatter",
> +		.of_match_table = csi_formatter_of_match,
> +		.pm             = pm_ptr(&csi_formatter_pm_ops),
> +	},
> +	.probe  = csi_formatter_probe,
> +	.remove = csi_formatter_remove,
> +};
> +
> +module_platform_driver(csi_formatter_device_driver);
> +
> +MODULE_AUTHOR("NXP Semiconductor, Inc.");
> +MODULE_DESCRIPTION("NXP i.MX95 CSI Pixel Formatter driver");
> +MODULE_LICENSE("GPL");

-- 
Regards,

Laurent Pinchart

