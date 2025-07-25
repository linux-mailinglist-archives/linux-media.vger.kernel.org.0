Return-Path: <linux-media+bounces-38430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3350B114FD
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 02:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73D72189C3D1
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 00:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3633E29A1;
	Fri, 25 Jul 2025 00:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vqJIqWVf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B434634;
	Fri, 25 Jul 2025 00:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753401853; cv=none; b=X3eX082KffAGP6JNftnB6K8PgHg+TLXwgMwNRuPR7YVVn0c3VuHXdhwq36CX+GifzMiTelXr2ThS2RxswAKAmBfe6oYg+HymUxCuu3jt/ZsS2nCOTHtATbcekTYgQB8DR+u4TE9n1L7YO3VjIgTfIAxQT4yf+/zjPK3cudDZkOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753401853; c=relaxed/simple;
	bh=paRL7lUkiCFj50dlW21bp0ixJnDFpnsc1d28+/nSkvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mel08SMrKvKvPbrJyOu9a0WjowAoOHJVbVpQpEuLub2jO9FX/afmOFADNyUIqOimwd55aVKJseZ2kbdFsi044CVK/ZSk+S6xCNExbFWU/yBtCeWmDXlX1pI+g+cdm0HF0CVt1ZEkOsmcvSG/RMIhQ7Lbqm2JhCqQBn39h5bWqmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vqJIqWVf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 72967C66;
	Fri, 25 Jul 2025 02:03:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753401809;
	bh=paRL7lUkiCFj50dlW21bp0ixJnDFpnsc1d28+/nSkvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vqJIqWVfO6VZ87XVEP6qwg8954IYYK1jjPjCndkuuz2DZfRKOhFDGBnBoDrF52uZQ
	 H0xQJvBJWjONAv8YGImPsE8o92Spd5y89Y6Dfz2B3jOYCDkgWgWuLWq+VAMeN7YvSW
	 9pER5V0lWmvJsR30Apfhbjq7Njd0iicZ7rFoB184=
Date: Fri, 25 Jul 2025 03:04:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@nxp.com
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
Message-ID: <20250725000404.GW11202@pendragon.ideasonboard.com>
References: <20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com>
 <20250708-imx8qxp_pcam-v3-2-c8533e405df1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708-imx8qxp_pcam-v3-2-c8533e405df1@nxp.com>

Hi Frank,

Thank you for the patch.

On Tue, Jul 08, 2025 at 01:48:43PM -0400, Frank Li via B4 Relay wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
> 
> Add a V4L2 sub-device driver for the CPI controller found on i.MX8QXP,
> i.MX8QM, and i.MX93 SoCs. This controller supports parallel camera sensors
> and enables image data capture through a parallel interface.
> 
> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - replace csi with cpi
> - use __free(fwnode_handle) to simpilfy code
> - remove imx91 driver data, which is the same as imx93
> 
> change in v2
> - remove MODULE_ALIAS
> - use devm_pm_runtime_enable() and cleanup remove function
> - change output format to 1x16. controller convert 2x8 to 1x16 format
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/media/platform/nxp/Kconfig            |  11 +
>  drivers/media/platform/nxp/Makefile           |   1 +
>  drivers/media/platform/nxp/imx-parallel-cpi.c | 920 ++++++++++++++++++++++++++
>  4 files changed, 933 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8ae0667d2bb41fb6a1549bd3b2b33f326cbd1303..14842a3b860a6f23846f12a684eedcbb9eb69e19 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15112,6 +15112,7 @@ F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
>  F:	drivers/media/platform/nxp/imx-mipi-csis.c
> +F:	drivers/media/platform/nxp/imx-parallel-cpi.c
>  F:	drivers/media/platform/nxp/imx7-media-csi.c
>  F:	drivers/media/platform/nxp/imx8mq-mipi-csi2.c
>  
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> index 40e3436669e213fdc5da70821dc0b420e1821f4f..504ae1c6494f331c16124a224421ac7acd433ba5 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -39,6 +39,17 @@ config VIDEO_IMX_MIPI_CSIS
>  	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
>  	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
>  
> +config VIDEO_IMX_PARALLEL_CPI
> +	tristate "NXP i.MX9/i.MX8 Parallel CPI Driver"

I'd write it in numerical order, "i.MX8/i.MX9"

> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  Video4Linux2 sub-device driver for PARALLEL CPI receiver found
> +	  on some iMX8 and iMX9 SoCs.
> +
>  source "drivers/media/platform/nxp/imx8-isi/Kconfig"
>  
>  # mem2mem drivers
> diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
> index 4d90eb71365259ebdda84ea58483e1c4131d3ac7..5346919d2f1083b51ec99b66981c5d38b3df960c 100644
> --- a/drivers/media/platform/nxp/Makefile
> +++ b/drivers/media/platform/nxp/Makefile
> @@ -7,5 +7,6 @@ obj-y += imx8-isi/
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
>  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
> +obj-$(CONFIG_VIDEO_IMX_PARALLEL_CPI) += imx-parallel-cpi.o
>  obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
>  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
> diff --git a/drivers/media/platform/nxp/imx-parallel-cpi.c b/drivers/media/platform/nxp/imx-parallel-cpi.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..718f02bf70c4d0ae74ecf842c1ecb1a1afbcdd45
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx-parallel-cpi.c
> @@ -0,0 +1,920 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * i.MX Parallel CPI receiver driver.
> + *
> + * Copyright 2019-2025 NXP
> + *
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/debugfs.h>

I don't think you use this.

> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/interrupt.h>

I don't think you use this either.

> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/mfd/syscon.h>

Alphabetical order please.

> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>

This doesn't seem needed.

> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>

Same here.

> +#include <linux/spinlock.h>

And here. Please verify all headers, drop the ones you don't need, and
add any you may have forgotten. That includes the media/ headers.

> +
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define IMX_CPI_DEF_MBUS_CODE			MEDIA_BUS_FMT_UYVY8_2X8
> +#define IMX_CPI_DEF_PIX_WIDTH			1920
> +#define IMX_CPI_DEF_PIX_HEIGHT			1080

Those macros are used in a single location only (or will be in the next
version), drop them and use the values directly in imx_cpi_default_fmt.

> +
> +#define IMX_CPI_MAX_PIX_WIDTH			0xffff
> +#define IMX_CPI_MAX_PIX_HEIGHT			0xffff
> +
> +#define IMX_CPI_PAD_SINK			0
> +#define IMX_CPI_PAD_SOURCE			1
> +#define IMX_CPI_PADS_NUM			2
> +
> +/* CI_PI INTERFACE CONTROL */
> +#define IF_CTRL_REG_PL_ENABLE			BIT(0)
> +#define IF_CTRL_REG_PL_VALID			BIT(1)
> +#define IF_CTRL_REG_DATA_TYPE_SEL		BIT(8)
> +#define IF_CTRL_REG_DATA_TYPE(x)		FIELD_PREP(GENMASK(13, 9), (x))
> +
> +#define DATA_TYPE_OUT_NULL			0x00
> +#define DATA_TYPE_OUT_RGB			0x04
> +#define DATA_TYPE_OUT_YUV444			0x08
> +#define DATA_TYPE_OUT_YYU420_ODD		0x10
> +#define DATA_TYPE_OUT_YYU420_EVEN		0x12
> +#define DATA_TYPE_OUT_YYY_ODD			0x18
> +#define DATA_TYPE_OUT_UYVY_EVEN			0x1a
> +#define DATA_TYPE_OUT_RAW			0x1c
> +
> +#define IF_CTRL_REG_IF_FORCE_HSYNV_OVERRIDE	0x4
> +#define IF_CTRL_REG_IF_FORCE_VSYNV_OVERRIDE	0x2
> +#define IF_CTRL_REG_IF_FORCE_DATA_ENABLE_OVERRIDE	0x1
> +
> +/* CPI INTERFACE CONTROL REG */
> +#define CPI_CTRL_REG_CPI_EN			BIT(0)
> +#define CPI_CTRL_REG_PIXEL_CLK_POL		BIT(1)
> +#define CPI_CTRL_REG_HSYNC_POL			BIT(2)
> +#define CPI_CTRL_REG_VSYNC_POL			BIT(3)
> +#define CPI_CTRL_REG_DE_POL			BIT(4)
> +#define CPI_CTRL_REG_PIXEL_DATA_POL		BIT(5)
> +#define CPI_CTRL_REG_CCIR_EXT_VSYNC_EN		BIT(6)
> +#define CPI_CTRL_REG_CCIR_EN			BIT(7)
> +#define CPI_CTRL_REG_CCIR_VIDEO_MODE		BIT(8)
> +#define CPI_CTRL_REG_CCIR_NTSC_EN		BIT(9)
> +#define CPI_CTRL_REG_CCIR_VSYNC_RESET_EN	BIT(10)
> +#define CPI_CTRL_REG_CCIR_ECC_ERR_CORRECT_EN	BIT(11)
> +#define CPI_CTRL_REG_HSYNC_FORCE_EN		BIT(12)
> +#define CPI_CTRL_REG_VSYNC_FORCE_EN		BIT(13)
> +#define CPI_CTRL_REG_GCLK_MODE_EN		BIT(14)
> +#define CPI_CTRL_REG_VALID_SEL			BIT(15)
> +#define CPI_CTRL_REG_RAW_OUT_SEL		BIT(16)
> +#define CPI_CTRL_REG_HSYNC_OUT_SEL		BIT(17)
> +#define CPI_CTRL_REG_HSYNC_PULSE(x)		FIELD_PREP(GENMASK(21, 19), (x))
> +#define CPI_CTRL_REG_UV_SWAP_EN			BIT(22)
> +#define CPI_CTRL_REG_DATA_TYPE_IN(x)		FIELD_PREP(GENMASK(26, 23), (x))
> +#define CPI_CTRL_REG_MASK_VSYNC_COUNTER(x)	FIELD_PREP(GENMASK(28, 27), (x))
> +#define CPI_CTRL_REG_SOFTRST			BIT(31)
> +
> +/* CPI INTERFACE STATUS */
> +#define CPI_STATUS_FIELD_TOGGLE			BIT(0)
> +#define CPI_STATUS_ECC_ERROR			BIT(1)
> +
> +/* CPI INTERFACE CONTROL REG1 */
> +#define CPI_CTRL_REG1_PIXEL_WIDTH(v)		FIELD_PREP(GENMASK(15, 0), (v))
> +#define CPI_CTRL_REG1_VSYNC_PULSE(v)		FIELD_PREP(GENMASK(31, 16), (v))
> +
> +/* Need match field DATA_TYPE_IN definition at CPI CTRL register */
> +enum cpi_in_data_type {
> +	CPI_IN_DT_UYVY_BT656_8 = 0x0,
> +	CPI_IN_DT_UYVY_BT656_10,
> +	CPI_IN_DT_RGB_8,
> +	CPI_IN_DT_BGR_8,
> +	CPI_IN_DT_YVYU_8 = 0x5,
> +	CPI_IN_DT_YUV_8,
> +	CPI_IN_DT_RAW_8 = 0x9,
> +	CPI_IN_DT_RAW_10,
> +};
> +
> +enum {
> +	PI_MODE_INIT,

Not used.

> +	PI_GATE_CLOCK_MODE,
> +	PI_CCIR_MODE,
> +};
> +
> +enum {
> +	PI_V1,
> +	PI_V2,
> +};
> +
> +static const char *const imx_cpi_clk_id[] = {
> +	"pixel",
> +	"ipg",
> +};
> +
> +#define PCPIDEV_NUM_CLKS   ARRAY_SIZE(imx_cpi_clk_id)

Drop this macro and use ARRAY_SIZE() in the single location below.

> +
> +struct imx_cpi_plat_data {
> +	u32 version;
> +	u32 if_ctrl_reg;
> +	u32 interface_status;
> +	u32 interface_ctrl_reg;
> +	u32 interface_ctrl_reg1;
> +	u8 def_hsync_pol;
> +	u8 def_vsync_pol;
> +	u8 def_pixel_clk_pol;
> +	u8 def_cpi_in_data_type;
> +};
> +
> +struct cpi_pm_domain {
> +	struct device *dev;
> +	struct device_link *link;
> +};
> +
> +struct imx_cpi_device {
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct reset_control *mrst;
> +	struct regulator *pcpi_phy_regulator;

Those two fields are unusued.

> +	struct clk_bulk_data clks[PCPIDEV_NUM_CLKS];
> +
> +	struct v4l2_subdev sd;
> +	struct media_pad pads[IMX_CPI_PADS_NUM];
> +	struct v4l2_async_notifier notifier;
> +
> +	struct v4l2_mbus_framefmt format;

Unused.

> +	const struct imx_cpi_plat_data *pdata;
> +	struct imx_cpi_pix_format const *pcpidev_fmt;

Unused.

> +
> +	struct {
> +		struct v4l2_subdev *sd;
> +		const struct media_pad *pad;
> +	} source;
> +
> +	struct cpi_pm_domain pm_domains[2];

Unused.

> +
> +	u8 mode;
> +	u8 uv_swap;
> +};
> +
> +struct imx_cpi_pix_format {
> +	u32 code;
> +	u32 output;
> +	u32 data_type;

This isn't used. It seems a bit weird though that .def_cpi_in_data_type
is used, but not the per-format data type.

> +	u8 width;
> +};
> +
> +static const struct imx_cpi_pix_format imx_cpi_formats[] = {
> +	/* YUV formats. */
> +	{
> +		.code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.output = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.data_type = CPI_IN_DT_YVYU_8,
> +		.width = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.output = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.data_type = CPI_IN_DT_YVYU_8,
> +		.width = 16,
> +	},
> +};
> +
> +static const struct imx_cpi_plat_data imx8qxp_pdata = {
> +	.version = PI_V1,
> +	.if_ctrl_reg = 0x0,
> +	.interface_status = 0x20,
> +	.interface_ctrl_reg = 0x10,
> +	.interface_ctrl_reg1 = 0x30,
> +	.def_hsync_pol = 1,
> +	.def_vsync_pol = 0,
> +	.def_pixel_clk_pol = 0,
> +	.def_cpi_in_data_type = CPI_IN_DT_UYVY_BT656_8,
> +};
> +
> +static const struct imx_cpi_plat_data imx93_pdata = {
> +	.version = PI_V2,
> +	.if_ctrl_reg = 0x0,
> +	.interface_status = 0x4,
> +	.interface_ctrl_reg = 0x8,
> +	.interface_ctrl_reg1 = 0xc,
> +	.def_hsync_pol = 0,
> +	.def_vsync_pol = 1,
> +	.def_pixel_clk_pol = 0,

This is the same for the two variants. Do you plan to support other
variants that will have default clock polarities ? If not, drop this.

> +	.def_cpi_in_data_type = CPI_IN_DT_YVYU_8,
> +};
> +
> +static void imx_cpi_regs_dump(struct imx_cpi_device *pcpidev)
> +{
> +	struct device *dev = pcpidev->dev;
> +	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
> +	u32 i;
> +
> +	struct {
> +		u32 offset;
> +		const char *const name;
> +	} registers[] = {
> +		{ pdata->if_ctrl_reg, "HW_IF_CTRL_REG" },
> +		{ pdata->interface_ctrl_reg, "HW_CPI_CTRL_REG" },
> +		{ pdata->interface_status, "HW_CPI_STATUS" },
> +		{ pdata->interface_ctrl_reg1, "HW_CPI_CTRL_REG1" },
> +
> +	};
> +
> +	for (i = 0; i < ARRAY_SIZE(registers); i++) {
> +		u32 reg = readl(pcpidev->regs + registers[i].offset);
> +
> +		dev_dbg(dev, "%20s[0x%.2x]: 0x%.8x\n",
> +			registers[i].name, registers[i].offset, reg);
> +	}
> +}
> +
> +static const struct imx_cpi_pix_format *find_imx_cpi_format(u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(imx_cpi_formats); i++)
> +		if (code == imx_cpi_formats[i].code)
> +			return &imx_cpi_formats[i];
> +
> +	return NULL;
> +}
> +
> +static void imx_cpi_sw_reset(struct imx_cpi_device *pcpidev)
> +{
> +	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
> +	u32 val;
> +
> +	/* Softwaret Reset */
> +	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
> +	val |= CPI_CTRL_REG_SOFTRST;
> +	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
> +
> +	usleep_range(500, 1000);
> +	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
> +	val &= ~CPI_CTRL_REG_SOFTRST;
> +	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
> +}
> +
> +static void imx_cpi_hw_config(struct imx_cpi_device *pcpidev)
> +{
> +	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
> +	u32 val;
> +
> +	/* Software Reset */
> +	imx_cpi_sw_reset(pcpidev);
> +
> +	/* Config PL Data Type */
> +	val = readl(pcpidev->regs + pdata->if_ctrl_reg);
> +	val |= IF_CTRL_REG_DATA_TYPE(DATA_TYPE_OUT_YUV444);

Don't you need to clear the field first ? Same everywhere else where
applicable.

> +	writel(val, pcpidev->regs + pdata->if_ctrl_reg);
> +
> +	/* Enable sync Force */
> +	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
> +	val |= (CPI_CTRL_REG_HSYNC_FORCE_EN | CPI_CTRL_REG_VSYNC_FORCE_EN);
> +	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
> +
> +	/* Enable Pixel Link */
> +	val = readl(pcpidev->regs + pdata->if_ctrl_reg);
> +	val |= IF_CTRL_REG_PL_ENABLE;
> +	writel(val, pcpidev->regs + pdata->if_ctrl_reg);
> +
> +	/* Enable Pixel Link */
> +	val = readl(pcpidev->regs + pdata->if_ctrl_reg);
> +	val |= IF_CTRL_REG_PL_VALID;
> +	writel(val, pcpidev->regs + pdata->if_ctrl_reg);
> +
> +	/* Config CTRL REG */
> +	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
> +
> +	val |= (CPI_CTRL_REG_DATA_TYPE_IN(pdata->def_cpi_in_data_type) |
> +		FIELD_PREP(CPI_CTRL_REG_HSYNC_POL, pdata->def_hsync_pol) |
> +		FIELD_PREP(CPI_CTRL_REG_VSYNC_POL, pdata->def_vsync_pol) |
> +		FIELD_PREP(CPI_CTRL_REG_PIXEL_CLK_POL, pdata->def_pixel_clk_pol) |

You should parse the polarities from the device tree.

> +		CPI_CTRL_REG_MASK_VSYNC_COUNTER(3) |
> +		CPI_CTRL_REG_HSYNC_PULSE(2));
> +
> +	if (pcpidev->uv_swap)
> +		val |= CPI_CTRL_REG_UV_SWAP_EN;
> +
> +	if (pcpidev->mode & PI_GATE_CLOCK_MODE) {

mode is hardcoded to PI_GATE_CLOCK_MODE. And the mode seem exclusive, so
they shouldn't be handled as a bitmask, especially given that the
PI_GATE_CLOCK_MODE and PI_CCIR_MODE enumerators have a single bit set
only by accident.

> +		val |= CPI_CTRL_REG_GCLK_MODE_EN;
> +	} else if (pcpidev->mode & PI_CCIR_MODE) {
> +		val |= (CPI_CTRL_REG_CCIR_EN |
> +			CPI_CTRL_REG_CCIR_VSYNC_RESET_EN |
> +			CPI_CTRL_REG_CCIR_EXT_VSYNC_EN |
> +			CPI_CTRL_REG_CCIR_ECC_ERR_CORRECT_EN);
> +	}
> +
> +	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
> +}
> +
> +static int get_interface_ctrl_reg1_param(struct imx_cpi_device *pcpidev,

imx_cpi_ prefix please.

> +					 u32 *pixel_width, u32 *vsync_pulse,
> +					 const struct v4l2_mbus_framefmt *format)
> +{
> +	u32 version = pcpidev->pdata->version;

No need for the variable.

> +
> +	switch (version) {
> +	case PI_V1:
> +		*pixel_width = format->width - 1;
> +		*vsync_pulse = format->width << 1;
> +		break;
> +	case PI_V2:
> +		*pixel_width = format->width << 3;
> +		*vsync_pulse = format->width - 1;
> +		break;
> +	default:
> +		dev_err(pcpidev->dev, "Not support PI version %d\n", version);
> +		return -EINVAL;

This can't happen. You can make this function void and drop the error
check in the caller. Actually, as the caller is rather simple, and this
function is very simple too, you can just inline it in the caller.

> +	}
> +
> +	return 0;
> +}
> +
> +static void imx_cpi_config_ctrl_reg1(struct imx_cpi_device *pcpidev,
> +				     const struct v4l2_mbus_framefmt *format)
> +{
> +	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
> +	struct device *dev = pcpidev->dev;
> +	u32 pixel_width;
> +	u32 vsync_pulse;
> +	u32 val;
> +	int ret;
> +
> +	dev_dbg(dev, "%s %dx%d, fmt->code:0x%0x\n", __func__,
> +		format->width, format->height, format->code);
> +
> +	if (format->width <= 0 || format->height <= 0) {
> +		dev_err(dev, "%s width/height invalid\n", __func__);
> +		return;
> +	}

This can't happen.

> +
> +	ret = get_interface_ctrl_reg1_param(pcpidev, &pixel_width,
> +					    &vsync_pulse, format);
> +	if (ret < 0)
> +		return;
> +
> +	val = (CPI_CTRL_REG1_PIXEL_WIDTH(pixel_width) |
> +	       CPI_CTRL_REG1_VSYNC_PULSE(vsync_pulse));

No need for parentheses.

> +	writel(val, pcpidev->regs + pdata->interface_ctrl_reg1);
> +}
> +
> +static void imx_cpi_enable(struct imx_cpi_device *pcpidev)
> +{
> +	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
> +	u32 val;
> +
> +	/* Enable CPI */
> +	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
> +	val |= CPI_CTRL_REG_CPI_EN;
> +	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
> +
> +	/* Disable SYNC Force */
> +	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
> +	val &= ~(CPI_CTRL_REG_HSYNC_FORCE_EN | CPI_CTRL_REG_VSYNC_FORCE_EN);
> +	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
> +}
> +
> +static void imx_cpi_disable(struct imx_cpi_device *pcpidev)
> +{
> +	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
> +	u32 val;
> +
> +	/* Enable Sync Force */
> +	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
> +	val |= (CPI_CTRL_REG_HSYNC_FORCE_EN | CPI_CTRL_REG_VSYNC_FORCE_EN);

No need for parentheses.

> +	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
> +
> +	/* Disable CPI */
> +	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
> +	val &= ~CPI_CTRL_REG_CPI_EN;
> +	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
> +
> +	/* Disable Pixel Link */
> +	val = readl(pcpidev->regs + pdata->if_ctrl_reg);
> +	val &= ~(IF_CTRL_REG_PL_VALID | IF_CTRL_REG_PL_ENABLE);
> +	writel(val, pcpidev->regs + pdata->if_ctrl_reg);
> +}
> +
> +static void imx_cpi_start_stream(struct imx_cpi_device *pcpidev,
> +				 const struct v4l2_mbus_framefmt *format,
> +				 const struct imx_cpi_pix_format *pcpidev_fmt)
> +{
> +	if (pcpidev_fmt->code == MEDIA_BUS_FMT_YUYV8_2X8 ||
> +	    pcpidev_fmt->code == MEDIA_BUS_FMT_UYVY8_2X8)
> +		pcpidev->uv_swap = 1;

Pass the information required to calculate this to the
imx_cpi_hw_config() function and drop the uv_swap field.

> +
> +	imx_cpi_hw_config(pcpidev);
> +	imx_cpi_config_ctrl_reg1(pcpidev, format);
> +	imx_cpi_enable(pcpidev);
> +	imx_cpi_regs_dump(pcpidev);
> +}
> +
> +static void imx_cpi_stop_stream(struct imx_cpi_device *pcpidev)
> +{
> +	imx_cpi_regs_dump(pcpidev);
> +	imx_cpi_disable(pcpidev);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Async subdev notifier
> + */
> +
> +static struct imx_cpi_device *
> +notifier_to_imx_cpi_device(struct v4l2_async_notifier *n)
> +{
> +	return container_of(n, struct imx_cpi_device, notifier);
> +}
> +
> +static struct imx_cpi_device *
> +sd_to_imx_cpi_device(struct v4l2_subdev *sdev)
> +{
> +	return container_of(sdev, struct imx_cpi_device, sd);
> +}
> +
> +static int imx_cpi_notify_bound(struct v4l2_async_notifier *notifier,
> +				struct v4l2_subdev *sd,
> +				struct v4l2_async_connection *asd)
> +{
> +	struct imx_cpi_device *pcpidev = notifier_to_imx_cpi_device(notifier);
> +	struct media_pad *sink = &pcpidev->sd.entity.pads[IMX_CPI_PAD_SINK];
> +
> +	return v4l2_create_fwnode_links_to_pad(sd, sink, 0);
> +}
> +
> +static const struct v4l2_async_notifier_operations imx_cpi_notify_ops = {
> +	.bound = imx_cpi_notify_bound,
> +};
> +
> +static int imx_cpi_async_register(struct imx_cpi_device *pcpidev)
> +{
> +	struct v4l2_fwnode_endpoint vep = {
> +		.bus_type = V4L2_MBUS_PARALLEL,
> +	};
> +	struct v4l2_async_connection *asd;
> +	struct fwnode_handle *ep __free(fwnode_handle) = NULL;
> +	int ret;
> +
> +	v4l2_async_subdev_nf_init(&pcpidev->notifier, &pcpidev->sd);

Move this after v4l2_fwnode_endpoint_parse() so you won't need to
cleanup if DT parsing fails.

> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(pcpidev->dev), 0, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -ENOTCONN;
> +
> +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +	if (ret)
> +		return ret;
> +
> +	asd = v4l2_async_nf_add_fwnode_remote(&pcpidev->notifier, ep,
> +					      struct v4l2_async_connection);
> +	if (IS_ERR(asd))
> +		return PTR_ERR(asd);
> +
> +	pcpidev->notifier.ops = &imx_cpi_notify_ops;

Move this just after v4l2_async_subdev_nf_init().

> +	ret = v4l2_async_nf_register(&pcpidev->notifier);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_async_register_subdev(&pcpidev->sd);

This will need to move to the probe function, see below.

> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Media entity operations
> + */
> +
> +static int imx_cpi_link_setup(struct media_entity *entity,
> +			      const struct media_pad *local_pad,
> +			      const struct media_pad *remote_pad,
> +			      u32 flags)
> +{
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct imx_cpi_device *pcpidev = sd_to_imx_cpi_device(sd);
> +	struct v4l2_subdev *remote_sd;
> +
> +	dev_dbg(pcpidev->dev, "link setup %s -> %s", remote_pad->entity->name,
> +		local_pad->entity->name);
> +
> +	/* We only care about the link to the source. */
> +	if (!(local_pad->flags & MEDIA_PAD_FL_SINK))
> +		return 0;
> +
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +	if (flags & MEDIA_LNK_FL_ENABLED) {
> +		if (pcpidev->source.sd)
> +			return -EBUSY;
> +
> +		pcpidev->source.sd = remote_sd;
> +		pcpidev->source.pad = remote_pad;
> +	} else {
> +		pcpidev->source.sd = NULL;
> +		pcpidev->source.pad = NULL;
> +	}

You only support one connected subdev, so you can make the sink link
immutable and avoid the complexity here. source.sd and source.pad can be
assigned in the notifier .bound() handler.

> +
> +	return 0;
> +}
> +
> +static const struct media_entity_operations imx_cpi_entity_ops = {
> +	.link_setup = imx_cpi_link_setup,
> +	.link_validate = v4l2_subdev_link_validate,
> +	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
> +};
> +
> +static int imx_cpi_set_fmt(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *sd_state,
> +			   struct v4l2_subdev_format *sdformat)
> +{
> +	struct imx_cpi_pix_format const *pcpidev_fmt;
> +	struct imx_cpi_device *pcpidev = sd_to_imx_cpi_device(sd);
> +	struct device *dev = pcpidev->dev;
> +	struct v4l2_mbus_framefmt *fmt;
> +	unsigned int align;
> +
> +	/*
> +	 * The Parallel cpi can't transcode in any way, the source format
> +	 * can't be modified.
> +	 */
> +	if (sdformat->pad == IMX_CPI_PAD_SOURCE)
> +		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> +
> +	/*
> +	 * Validate the media bus code and clamp and align the size.
> +	 *
> +	 * The total number of bits per line must be a multiple of 8. We thus
> +	 * need to align the width for formats that are not multiples of 8
> +	 * bits.

All formats are multiples of 16 bits.

> +	 */
> +	pcpidev_fmt = find_imx_cpi_format(sdformat->format.code);
> +	if (!pcpidev_fmt)
> +		pcpidev_fmt = &imx_cpi_formats[0];
> +
> +	switch (pcpidev_fmt->width % 8) {
> +	case 0:
> +		align = 0;
> +		break;
> +	case 4:
> +		align = 1;
> +		break;
> +	case 2:
> +	case 6:
> +		align = 2;
> +		break;
> +	default:
> +		/* 1, 3, 5, 7 */
> +		align = 3;
> +		break;
> +	}
> +
> +	v4l_bound_align_image(&sdformat->format.width, 1,
> +			      IMX_CPI_MAX_PIX_WIDTH, align,
> +			      &sdformat->format.height, 1,
> +			      IMX_CPI_MAX_PIX_HEIGHT, 0, 0);
> +
> +	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
> +	if (!fmt)
> +		return -EINVAL;

I don't think this can return an error.

> +
> +	fmt->code = pcpidev_fmt->code;
> +	fmt->width = sdformat->format.width;
> +	fmt->height = sdformat->format.height;
> +	fmt->field = V4L2_FIELD_NONE;
> +	fmt->colorspace = sdformat->format.colorspace;
> +	fmt->quantization = sdformat->format.quantization;
> +	fmt->xfer_func = sdformat->format.xfer_func;
> +	fmt->ycbcr_enc = sdformat->format.ycbcr_enc;
> +
> +	sdformat->format = *fmt;
> +
> +	/* Propagate the format from sink to source. */
> +	fmt = v4l2_subdev_state_get_format(sd_state, IMX_CPI_PAD_SOURCE);
> +	*fmt = sdformat->format;
> +
> +	/* The format on the source pad might change due to unpacking. */
> +	fmt->code = pcpidev_fmt->output;
> +
> +	dev_dbg(dev, "%s: fmt_code:0x%0x, %dx%d\n", __func__,
> +		fmt->code, fmt->width, fmt->height);

I think you can drop this, it's useful for development, but less so in
upstream.

> +	return 0;
> +}
> +
> +static const struct v4l2_mbus_framefmt imx_cpi_default_fmt = {

This isn't used.

> +	.code = IMX_CPI_DEF_MBUS_CODE,
> +	.width = IMX_CPI_DEF_PIX_WIDTH,
> +	.height = IMX_CPI_DEF_PIX_HEIGHT,
> +	.field = V4L2_FIELD_NONE,
> +	.colorspace = V4L2_COLORSPACE_SMPTE170M,
> +	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
> +	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
> +	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> +};
> +
> +static int imx_cpi_init_state(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *sd_state)
> +{
> +	struct v4l2_subdev_format fmt = {
> +		.pad = IMX_CPI_PAD_SINK,
> +	};
> +
> +	fmt.format.code = imx_cpi_formats[0].code;
> +	fmt.format.width = IMX_CPI_DEF_PIX_WIDTH;
> +	fmt.format.height = IMX_CPI_DEF_PIX_HEIGHT;
> +
> +	fmt.format.colorspace = V4L2_COLORSPACE_SMPTE170M;
> +	fmt.format.xfer_func =
> +	    V4L2_MAP_XFER_FUNC_DEFAULT(fmt.format.colorspace);
> +	fmt.format.ycbcr_enc =
> +	    V4L2_MAP_YCBCR_ENC_DEFAULT(fmt.format.colorspace);
> +	fmt.format.quantization =
> +	    V4L2_MAP_QUANTIZATION_DEFAULT(false,
> +					  fmt.format.colorspace,
> +					  fmt.format.ycbcr_enc);
> +
> +	return imx_cpi_set_fmt(sd, sd_state, &fmt);

If possible, I'd just get the sink and source pad formats with
v4l2_subdev_get_fmt() here and set them to imx_cpi_default_fmt. That
will be simpler.

> +}
> +
> +static int imx_cpi_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct imx_cpi_device *pcpidev = sd_to_imx_cpi_device(sd);
> +	const struct v4l2_mbus_framefmt *format;
> +	const struct imx_cpi_pix_format *pcpidev_fmt;
> +	struct v4l2_subdev_state *state;
> +	int ret;
> +
> +	if (!enable) {
> +		v4l2_subdev_disable_streams(pcpidev->source.sd,
> +					    pcpidev->source.pad->index, BIT(0));
> +
> +		imx_cpi_stop_stream(pcpidev);
> +
> +		pm_runtime_put(pcpidev->dev);
> +
> +		return 0;
> +	}
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	format = v4l2_subdev_state_get_format(state, IMX_CPI_PAD_SINK);
> +	pcpidev_fmt = find_imx_cpi_format(format->code);
> +
> +	ret = pm_runtime_resume_and_get(pcpidev->dev);
> +	if (ret < 0)
> +		goto err_unlock;
> +
> +	imx_cpi_start_stream(pcpidev, format, pcpidev_fmt);
> +
> +	ret = v4l2_subdev_enable_streams(pcpidev->source.sd,
> +					 pcpidev->source.pad->index, BIT(0));
> +	if (ret < 0)
> +		goto err_stop;
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	return 0;
> +
> +err_stop:
> +	imx_cpi_stop_stream(pcpidev);
> +	pm_runtime_put(pcpidev->dev);
> +err_unlock:
> +	v4l2_subdev_unlock_state(state);
> +	return ret;
> +}
> +
> +static int imx_cpi_enum_mbus_code(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	/*
> +	 * The PARALLEL CPI can't transcode in any way, the source format
> +	 * is identical to the sink format.
> +	 */
> +	if (code->pad == IMX_CPI_PAD_SOURCE) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index > 0)
> +			return -EINVAL;
> +
> +		fmt = v4l2_subdev_state_get_format(sd_state, code->pad);
> +		code->code = fmt->code;
> +		return 0;
> +	}
> +
> +	if (code->pad != IMX_CPI_PAD_SINK)
> +		return -EINVAL;
> +
> +	if (code->index >= ARRAY_SIZE(imx_cpi_formats))
> +		return -EINVAL;
> +
> +	code->code = imx_cpi_formats[code->index].code;
> +
> +	return 0;
> +}
> +
> +static int imx_cpi_get_frame_desc(struct v4l2_subdev *sd,
> +				  unsigned int pad,
> +				  struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
> +	const struct imx_cpi_pix_format *pcpidev_fmt;
> +	const struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_subdev_state *state;
> +
> +	if (pad != IMX_CPI_PAD_SOURCE)
> +		return -EINVAL;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	fmt = v4l2_subdev_state_get_format(state, IMX_CPI_PAD_SOURCE);
> +	pcpidev_fmt = find_imx_cpi_format(fmt->code);
> +	v4l2_subdev_unlock_state(state);
> +
> +	if (!pcpidev_fmt)
> +		return -EPIPE;

This can't happen, as the format on the source pad is guaranteed to be
valid at all times.

> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
> +	fd->num_entries = 1;
> +
> +	entry->flags = 0;
> +	entry->pixelcode = pcpidev_fmt->code;

Use fmt->code, and drop the pcpidev_fmt lookup.

> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops imx_cpi_video_ops = {
> +	.s_stream = imx_cpi_s_stream,

.s_stream() is deprecated, please implement .enable_streams() and
.disable_streams(), and set .s_stream to v4l2_subdev_s_stream_helper.

> +};
> +
> +static const struct v4l2_subdev_pad_ops imx_cpi_pad_ops = {
> +	.enum_mbus_code = imx_cpi_enum_mbus_code,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = imx_cpi_set_fmt,
> +	.get_frame_desc = imx_cpi_get_frame_desc,
> +};
> +
> +static const struct v4l2_subdev_ops imx_cpi_subdev_ops = {
> +	.pad = &imx_cpi_pad_ops,
> +	.video = &imx_cpi_video_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops imx_cpi_internal_ops = {
> +	.init_state = imx_cpi_init_state,
> +};
> +
> +static int imx_cpi_clk_get(struct imx_cpi_device *pcpidev)
> +{
> +	unsigned int i;
> +	int ret = 0;

Drop ret.

> +
> +	for (i = 0; i < PCPIDEV_NUM_CLKS; i++)

Use ARRAY_SIZE(pcpidev->clks) instead of PCPIDEV_NUM_CLKS. Same below.

> +		pcpidev->clks[i].id = imx_cpi_clk_id[i];
> +
> +	ret = devm_clk_bulk_get(pcpidev->dev, PCPIDEV_NUM_CLKS, pcpidev->clks);

Return directly here.

> +
> +	return ret;
> +}
> +
> +/* ----------------------------------------------------------------------
> + * Suspend/resume
> + */

Add a blank line.

> +static int __maybe_unused imx_cpi_runtime_suspend(struct device *dev)

Drop __maybe_unused, it's not needed when using RUNTIME_PM_OPS() and
pm_ptr().

> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx_cpi_device *pcpidev = sd_to_imx_cpi_device(sd);
> +
> +	clk_bulk_disable_unprepare(PCPIDEV_NUM_CLKS, pcpidev->clks);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused imx_cpi_runtime_resume(struct device *dev)

Here too.

> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx_cpi_device *pcpidev = sd_to_imx_cpi_device(sd);
> +
> +	return clk_bulk_prepare_enable(PCPIDEV_NUM_CLKS, pcpidev->clks);
> +}
> +
> +static const struct dev_pm_ops imx_cpi_pm_ops = {
> +	RUNTIME_PM_OPS(imx_cpi_runtime_suspend, imx_cpi_runtime_resume, NULL)


> +};
> +
> +static int imx_cpi_subdev_init(struct imx_cpi_device *pcpidev)
> +{
> +	struct v4l2_subdev *sd = &pcpidev->sd;
> +	int ret;
> +
> +	v4l2_subdev_init(sd, &imx_cpi_subdev_ops);
> +
> +	sd->internal_ops = &imx_cpi_internal_ops;
> +	sd->owner = THIS_MODULE;

Not needed. Does this come from copying code from an existing driver ?
If so, please send a patch to fix that driver and lower the amount of
cargo-cult.

> +	snprintf(sd->name, sizeof(sd->name), "parallel-%s",
> +		 dev_name(pcpidev->dev));
> +
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sd->ctrl_handler = NULL;

Not needed.

> +
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->entity.ops = &imx_cpi_entity_ops;
> +
> +	sd->dev = pcpidev->dev;
> +
> +	pcpidev->pads[IMX_CPI_PAD_SINK].flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;

The media subsystem wraps lines to 80 columns, with exceptions when
doing so would significantly decrease readability. Please check through
the driver.

> +	pcpidev->pads[IMX_CPI_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
> +						       MEDIA_PAD_FL_MUST_CONNECT;

Weird indentation. Use either

	pcpidev->pads[IMX_CPI_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
						  MEDIA_PAD_FL_MUST_CONNECT;

or

	pcpidev->pads[IMX_CPI_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE
						| MEDIA_PAD_FL_MUST_CONNECT;

> +
> +	ret = media_entity_pads_init(&sd->entity, IMX_CPI_PADS_NUM, pcpidev->pads);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		media_entity_cleanup(&sd->entity);
> +
> +	return ret;
> +}
> +
> +static void imx_cpi_cleanup(void *data)
> +{
> +	struct imx_cpi_device *pcpidev = data;
> +
> +	v4l2_subdev_cleanup(&pcpidev->sd);
> +	media_entity_cleanup(&pcpidev->sd.entity);
> +	v4l2_async_nf_unregister(&pcpidev->notifier);
> +	v4l2_async_nf_cleanup(&pcpidev->notifier);
> +	v4l2_async_unregister_subdev(&pcpidev->sd);
> +}
> +
> +static int imx_cpi_probe(struct platform_device *pdev)
> +{
> +	struct imx_cpi_device *pcpidev;
> +	struct device *dev = &pdev->dev;
> +	int ret = 0;

No need to initialize this to 0.

> +
> +	pcpidev = devm_kzalloc(dev, sizeof(*pcpidev), GFP_KERNEL);
> +	if (!pcpidev)
> +		return -ENOMEM;
> +
> +	pcpidev->dev = dev;
> +	platform_set_drvdata(pdev, pcpidev);
> +
> +	pcpidev->pdata = of_device_get_match_data(dev);
> +
> +	pcpidev->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pcpidev->regs))
> +		return dev_err_probe(dev, PTR_ERR(pcpidev->regs),
> +				     "Failed to get regs\n");
> +
> +	ret = imx_cpi_clk_get(pcpidev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = imx_cpi_subdev_init(pcpidev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(dev, imx_cpi_cleanup, pcpidev);
> +	if (ret)
> +		return ret;

Are you sure that all the cleanup calls in imx_cpi_cleanup() are safe if
imx_cpi_async_register() fails below ? I think manual error handling is
better, with a .remove() function.

> +
> +	pcpidev->mode = PI_GATE_CLOCK_MODE;

I'd move this just after assigning pdata to group all static
initialization together.

> +
> +	platform_set_drvdata(pdev, &pcpidev->sd);

That's the second platform_set_drvdata() call. Drop it, keep the first
one, and turn

	struct v4l2_subdev *sd = dev_get_drvdata(dev);
	struct imx_cpi_device *pcpidev = sd_to_imx_cpi_device(sd);

above into

	struct imx_cpi_device *pcpidev = dev_get_drvdata(dev);

> +
> +	ret = imx_cpi_async_register(pcpidev);
> +	if (ret < 0)
> +		return ret;
> +
> +	devm_pm_runtime_enable(dev);

Please use runtime PM autosuspend. This also needs to be enabled before
calling v4l2_async_register_subdev(), as the subdev could get used as
soon as it gets registered.

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id imx_cpi_of_match[] = {
> +	{.compatible = "fsl,imx8qxp-pcif", .data = &imx8qxp_pdata },

Missing space after the curly brace.

> +	{.compatible = "fsl,imx93-pcif", .data = &imx93_pdata },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, imx_cpi_of_match);
> +
> +static struct platform_driver _driver = {

_driver is quite uncommon. You can use the same prefix as in the rest of
the driver and name this imx_cpi_driver.

> +	.probe = imx_cpi_probe,
> +	.driver = {
> +		.of_match_table = imx_cpi_of_match,
> +		.name = "imx-parallel-cpi",
> +		.pm = pm_ptr(&imx_cpi_pm_ops),
> +	},
> +};
> +
> +module_platform_driver(_driver);
> +
> +MODULE_DESCRIPTION("i.MX9 Parallel CPI receiver driver");
> +MODULE_LICENSE("GPL");

-- 
Regards,

Laurent Pinchart

