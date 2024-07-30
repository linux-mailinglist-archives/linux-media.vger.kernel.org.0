Return-Path: <linux-media+bounces-15571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B961694131C
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 15:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5BFF1C234CE
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 13:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B90619FA77;
	Tue, 30 Jul 2024 13:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vJ08Wl9b"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFF655769;
	Tue, 30 Jul 2024 13:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722346199; cv=none; b=JkaiV7GdPLcHHSMBggQagyj4U16ZdL2J2A7ZubwuLPBIs8ldZ4ZGyvJdaHV91kBpgB1VQmze0meoos1713EQtNGi2wCdywxRUk1wKIWASdgePiTRBr2TDzgtzgz2JI8/vT6VnEBVgkPoq8knLnNNmPgHNZjwYX9/NDrx0ISi5ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722346199; c=relaxed/simple;
	bh=Mje+fUJrdGvXiAv9qt8Su1Vcowp7hJn6gEETqsgJI5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urOMAgIY+x9MzT4ZwVLy4zpS9Yu0ZnFTbadqGVA+s/upGuhVTtsSqojssTo2s/p+JZLInUchwT9lGArMuLbSsPCV6haGm01cAFRkj7xRuPRvNq/xp0AKbXEqozMS0KAF66cSWo7TDuYDsjskoXVwAEC13lCpVjcDhLkTV+btYUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vJ08Wl9b; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF98D8A9;
	Tue, 30 Jul 2024 15:29:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722346146;
	bh=Mje+fUJrdGvXiAv9qt8Su1Vcowp7hJn6gEETqsgJI5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJ08Wl9bYPmOrvmG/SdVzpnxHOq2+DanLaFAX9A7M92iB31UkjtmzlSPnQ35dwz1n
	 9ati30OHVhbYdYP7Ffg4HV6oDZj3LqBfMjJ7VMG2Q632QnzJnnjsjv9cy/Ug+dv9yb
	 80hcIG8JwpyMcYQj7qfJnFsYx3FbUK6/CnCbmKRo=
Date: Tue, 30 Jul 2024 16:29:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Andy Hsieh <andy.hsieh@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Louis Kuo <louis.kuo@mediatek.com>,
	Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH v6 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Message-ID: <20240730132931.GM1552@pendragon.ideasonboard.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-3-c374c9e0c672@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-3-c374c9e0c672@baylibre.com>

Hi Julien,

Thank you for the patch.

On Mon, Jul 29, 2024 at 04:48:02PM +0200, Julien Stephan wrote:
> From: Louis Kuo <louis.kuo@mediatek.com>
> 
> This will add the mediatek ISP3.0 seninf (sensor interface) driver found
> on several Mediatek SoCs such as the mt8365.
> 
> Then seninf module has 4 physical CSI-2 inputs. Depending on the soc they
> may not be all connected.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  MAINTAINERS                                        |    1 +
>  drivers/media/platform/mediatek/Kconfig            |    1 +
>  drivers/media/platform/mediatek/Makefile           |    1 +
>  drivers/media/platform/mediatek/isp/Kconfig        |    2 +
>  drivers/media/platform/mediatek/isp/Makefile       |    3 +
>  drivers/media/platform/mediatek/isp/isp_30/Kconfig |   16 +
>  .../media/platform/mediatek/isp/isp_30/Makefile    |    3 +
>  .../platform/mediatek/isp/isp_30/seninf/Makefile   |    5 +
>  .../mediatek/isp/isp_30/seninf/mtk_seninf.c        | 1576 ++++++++++++++++++++
>  .../mediatek/isp/isp_30/seninf/mtk_seninf_reg.h    |  117 ++
>  10 files changed, 1725 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9ac8c08ba692..5e697e288671 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14165,6 +14165,7 @@ M:	Andy Hsieh <andy.hsieh@mediatek.com>
>  S:	Supported
>  F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
>  F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> +F:	drivers/media/platform/mediatek/isp/isp_30/seninf/*
>  
>  MEDIATEK SMI DRIVER
>  M:	Yong Wu <yong.wu@mediatek.com>
> diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/platform/mediatek/Kconfig
> index 84104e2cd024..4e0a5a43f35e 100644
> --- a/drivers/media/platform/mediatek/Kconfig
> +++ b/drivers/media/platform/mediatek/Kconfig
> @@ -7,3 +7,4 @@ source "drivers/media/platform/mediatek/mdp/Kconfig"
>  source "drivers/media/platform/mediatek/vcodec/Kconfig"
>  source "drivers/media/platform/mediatek/vpu/Kconfig"
>  source "drivers/media/platform/mediatek/mdp3/Kconfig"
> +source "drivers/media/platform/mediatek/isp/Kconfig"

I know the alphabetical order is broken already, but let's not make it
worse.

> diff --git a/drivers/media/platform/mediatek/Makefile b/drivers/media/platform/mediatek/Makefile
> index 38e6ba917fe5..695f05f525a6 100644
> --- a/drivers/media/platform/mediatek/Makefile
> +++ b/drivers/media/platform/mediatek/Makefile
> @@ -4,3 +4,4 @@ obj-y += mdp/
>  obj-y += vcodec/
>  obj-y += vpu/
>  obj-y += mdp3/
> +obj-y += isp/

Same here.

> diff --git a/drivers/media/platform/mediatek/isp/Kconfig b/drivers/media/platform/mediatek/isp/Kconfig
> new file mode 100644
> index 000000000000..708b9a6660d2
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/isp/Kconfig
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +source "drivers/media/platform/mediatek/isp/isp_30/Kconfig"
> diff --git a/drivers/media/platform/mediatek/isp/Makefile b/drivers/media/platform/mediatek/isp/Makefile
> new file mode 100644
> index 000000000000..a81ab33d0dd3
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/isp/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-y += isp_30/
> diff --git a/drivers/media/platform/mediatek/isp/isp_30/Kconfig b/drivers/media/platform/mediatek/isp/isp_30/Kconfig
> new file mode 100644
> index 000000000000..9791312589fb
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/isp/isp_30/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config MTK_SENINF30
> +	tristate "MediaTek ISP3.0 SENINF driver"
> +	depends on VIDEO_V4L2_SUBDEV_API
> +	depends on MEDIA_CAMERA_SUPPORT

Replace these with

        select MEDIA_CONTROLLER
        select VIDEO_V4L2_SUBDEV_API

> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on OF
> +	select V4L2_FWNODE
> +	default n
> +	help
> +	  This driver provides a MIPI CSI-2 receiver interface to connect
> +	  an external camera module with MediaTek ISP3.0. It is able to handle
> +	  multiple cameras at the same time.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called mtk-seninf.
> diff --git a/drivers/media/platform/mediatek/isp/isp_30/Makefile b/drivers/media/platform/mediatek/isp/isp_30/Makefile
> new file mode 100644
> index 000000000000..ac3142de4739
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/isp/isp_30/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_MTK_SENINF30) += seninf/
> diff --git a/drivers/media/platform/mediatek/isp/isp_30/seninf/Makefile b/drivers/media/platform/mediatek/isp/isp_30/seninf/Makefile
> new file mode 100644
> index 000000000000..f28480d6d6c3
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/isp/isp_30/seninf/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +mtk-seninf-objs += mtk_seninf.o
> +
> +obj-$(CONFIG_MTK_SENINF30) += mtk-seninf.o
> diff --git a/drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c b/drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c
> new file mode 100644
> index 000000000000..44c6c2e417fb
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c
> @@ -0,0 +1,1576 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + */
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_platform.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/videodev2.h>
> +#include <media/media-device.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-dev.h>

I think this header isn't needed, you don't create any video_device.

> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "mtk_seninf_reg.h"
> +
> +#define SENINF_TIMESTAMP_STEP		0x67
> +#define SENINF_SETTLE_DELAY		0x15
> +#define SENINF_HS_TRAIL_PARAMETER	0x8
> +
> +#define SENINF_MAX_NUM_INPUTS		4
> +#define SENINF_MAX_NUM_OUTPUTS		6
> +#define SENINF_MAX_NUM_MUXES		6
> +#define SENINF_MAX_NUM_PADS		(SENINF_MAX_NUM_INPUTS + \
> +					 SENINF_MAX_NUM_OUTPUTS)
> +
> +#define SENINF_DEFAULT_BUS_FMT		MEDIA_BUS_FMT_SGRBG10_1X10
> +#define SENINF_DEFAULT_WIDTH		1920
> +#define SENINF_DEFAULT_HEIGHT		1080
> +
> +#define SENINF_PAD_10BIT		0
> +
> +#define SENINF_TEST_MODEL		0
> +#define SENINF_NORMAL_MODEL		1
> +#define SENINF_ALL_ERR_IRQ_EN		0x7f
> +#define SENINF_IRQ_CLR_SEL		0x80000000
> +
> +#define SENINF_MIPI_SENSOR		0x8
> +
> +#define MTK_CSI_MAX_LANES 4
> +
> +/* Port number in the device tree. */
> +enum mtk_seninf_port {
> +	CSI_PORT_0 = 0,	/* 4D1C or 2D1C */
> +	CSI_PORT_1,	/* 4D1C */
> +	CSI_PORT_2,	/* 4D1C */
> +	CSI_PORT_0B,	/* 2D1C */
> +};
> +
> +enum mtk_seninf_id {
> +	SENINF_1 = 0,
> +	SENINF_2 = 1,
> +	SENINF_3 = 2,
> +	SENINF_5 = 4,
> +};
> +
> +static const u32 port_to_seninf_id[] = {
> +	[CSI_PORT_0] = SENINF_1,
> +	[CSI_PORT_1] = SENINF_3,
> +	[CSI_PORT_2] = SENINF_5,
> +	[CSI_PORT_0B] = SENINF_2,
> +};
> +
> +enum mtk_seninf_phy_mode {
> +	SENINF_PHY_MODE_NONE,
> +	SENINF_PHY_MODE_4D1C,
> +	SENINF_PHY_MODE_2D1C,
> +};
> +
> +enum mtk_seninf_format_flag {
> +	MTK_SENINF_FORMAT_BAYER = BIT(0),
> +	MTK_SENINF_FORMAT_DPCM = BIT(1),
> +	MTK_SENINF_FORMAT_JPEG = BIT(2),
> +	MTK_SENINF_FORMAT_INPUT_ONLY = BIT(3),
> +};
> +
> +/**
> + * struct mtk_seninf_conf - Model-specific SENINF parameters
> + * @model: Model description
> + * @nb_inputs: Number of SENINF inputs
> + * @nb_muxes: Number of SENINF MUX (FIFO) instances
> + * @nb_outputs: Number of outputs (to CAM and CAMSV instances)
> + */
> +struct mtk_seninf_conf {
> +	const char *model;
> +	u8 nb_inputs;
> +	u8 nb_muxes;
> +	u8 nb_outputs;
> +};
> +
> +/**
> + * struct mtk_seninf_format_info - Information about media bus formats
> + * @code: V4L2 media bus code
> + * @flags: Flags describing the format, as a combination of MTK_SENINF_FORMAT_*
> + * @bpp: Bits per pixel
> + */
> +struct mtk_seninf_format_info {
> +	u32 code;
> +	u32 flags;
> +	u8 bpp;
> +};
> +
> +/**
> + * struct mtk_seninf_input - SENINF input block
> + * @pad: DT port and media entity pad number
> + * @seninf_id: SENINF hardware instance ID
> + * @base: Memory mapped I/O based address
> + * @seninf: Back pointer to the mtk_seninf
> + * @phy: PHY connected to the input
> + * @phy_mode: PHY operation mode (NONE when the input is not connected)
> + * @bus: CSI-2 bus configuration from DT
> + * @source_sd: Source subdev connected to the input
> + */
> +struct mtk_seninf_input {
> +	enum mtk_seninf_port pad;
> +	enum mtk_seninf_id seninf_id;
> +	void __iomem *base;
> +	struct mtk_seninf *seninf;
> +
> +	struct phy *phy;
> +	enum mtk_seninf_phy_mode phy_mode;
> +
> +	struct v4l2_mbus_config_mipi_csi2 bus;
> +
> +	struct v4l2_subdev *source_sd;
> +};
> +
> +/**
> + * struct mtk_seninf_mux - SENINF MUX channel
> + * @pad: DT port and media entity pad number
> + * @mux_id: MUX hardware instance ID
> + * @base: Memory mapped I/O based address
> + * @seninf: Back pointer to the mtk_seninf
> + */
> +struct mtk_seninf_mux {
> +	unsigned int pad;
> +	unsigned int mux_id;
> +	void __iomem *base;
> +	struct mtk_seninf *seninf;
> +};
> +
> +/**
> + * struct mtk_seninf - Top-level SENINF device
> + * @dev: The (platform) device
> + * @phy: PHYs at the SENINF inputs
> + * @num_clks: Number of clocks in the clks array
> + * @clks: Clocks
> + * @base: Memory mapped I/O base address
> + * @media_dev: Media controller device
> + * @v4l2_dev: V4L2 device
> + * @subdev: V4L2 subdevice
> + * @pads: Media entity pads
> + * @notifier: V4L2 async notifier for source subdevs
> + * @ctrl_handler: V4L2 controls handler
> + * @source_format: Active format on the source pad
> + * @inputs: Array of SENINF inputs
> + * @muxes: Array of MUXes
> + * @conf: Model-specific SENINF parameters
> + * @is_testmode: Whether or not the test pattern generator is enabled
> + */
> +struct mtk_seninf {
> +	struct device *dev;
> +	struct phy *phy[5];
> +	unsigned int num_clks;
> +	struct clk_bulk_data *clks;
> +	void __iomem *base;
> +
> +	struct media_device media_dev;
> +	struct v4l2_device v4l2_dev;
> +	struct v4l2_subdev subdev;
> +	struct media_pad pads[SENINF_MAX_NUM_PADS];
> +	struct v4l2_async_notifier notifier;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +
> +	struct mtk_seninf_input inputs[SENINF_MAX_NUM_INPUTS];
> +	struct mtk_seninf_mux muxes[SENINF_MAX_NUM_MUXES];
> +
> +	const struct mtk_seninf_conf *conf;
> +
> +	bool is_testmode;
> +};
> +
> +inline struct mtk_seninf *sd_to_mtk_seninf(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct mtk_seninf, subdev);
> +}
> +
> +static inline bool mtk_seninf_pad_is_sink(struct mtk_seninf *priv,
> +					  unsigned int pad)
> +{
> +	return pad < priv->conf->nb_inputs;
> +}
> +
> +static inline bool mtk_seninf_pad_is_source(struct mtk_seninf *priv,
> +					    unsigned int pad)
> +{
> +	return !mtk_seninf_pad_is_sink(priv, pad);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Formats
> + */
> +
> +static const struct mtk_seninf_format_info mtk_seninf_formats[] = {
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 14,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 14,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 14,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 14,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.flags = MTK_SENINF_FORMAT_BAYER,
> +		.bpp = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.bpp = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_VYUY8_1X16,
> +		.bpp = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.bpp = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_YVYU8_1X16,
> +		.bpp = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_JPEG_1X8,
> +		.flags = MTK_SENINF_FORMAT_JPEG,
> +		.bpp = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8,
> +		.flags = MTK_SENINF_FORMAT_JPEG,
> +		.bpp = 8,
> +	},
> +	/* Keep the input-only formats last. */
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
> +		.flags = MTK_SENINF_FORMAT_DPCM | MTK_SENINF_FORMAT_INPUT_ONLY,
> +		.bpp = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8,
> +		.flags = MTK_SENINF_FORMAT_DPCM | MTK_SENINF_FORMAT_INPUT_ONLY,
> +		.bpp = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8,
> +		.flags = MTK_SENINF_FORMAT_DPCM | MTK_SENINF_FORMAT_INPUT_ONLY,
> +		.bpp = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8,
> +		.flags = MTK_SENINF_FORMAT_DPCM | MTK_SENINF_FORMAT_INPUT_ONLY,
> +		.bpp = 8,
> +	}
> +};
> +
> +static const struct mtk_seninf_format_info *mtk_seninf_format_info(u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(mtk_seninf_formats); ++i) {
> +		if (mtk_seninf_formats[i].code == code)
> +			return &mtk_seninf_formats[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static void __mtk_seninf_update(struct mtk_seninf *priv, u32 reg,
> +				u32 mask, u32 value)
> +{
> +	u32 val = readl(priv->base + reg);
> +
> +	writel((val & ~mask) | (value & mask), priv->base + reg);
> +}
> +
> +#define mtk_seninf_update(priv, reg, field, val)		\
> +	__mtk_seninf_update(priv, reg, reg##_##field,		\
> +			    FIELD_PREP(reg##_##field, val))
> +
> +static void __mtk_seninf_input_update(struct mtk_seninf_input *input, u32 reg,
> +				      u32 mask, u32 value)
> +{
> +	u32 val = readl(input->base + reg);
> +
> +	writel((val & ~mask) | (value & mask), input->base + reg);
> +}
> +
> +#define mtk_seninf_input_update(input, reg, field, val)		\
> +	__mtk_seninf_input_update(input, reg, reg##_##field,	\
> +				  FIELD_PREP(reg##_##field, val))
> +
> +static u32 mtk_seninf_mux_read(struct mtk_seninf_mux *mux, u32 reg)
> +{
> +	return readl(mux->base + reg);
> +}
> +
> +static void mtk_seninf_mux_write(struct mtk_seninf_mux *mux, u32 reg,
> +				 u32 value)
> +{
> +	writel(value, mux->base + reg);
> +}
> +
> +static void __mtk_seninf_mux_update(struct mtk_seninf_mux *mux, u32 reg,
> +				    u32 mask, u32 value)
> +{
> +	u32 val = mtk_seninf_mux_read(mux, reg);
> +
> +	mtk_seninf_mux_write(mux, reg, (val & ~mask) | (value & mask));
> +}
> +
> +#define mtk_seninf_mux_update(mux, reg, field, val)		\
> +	__mtk_seninf_mux_update(mux, reg, reg##_##field,	\
> +				FIELD_PREP(reg##_##field, val))
> +
> +/* -----------------------------------------------------------------------------
> + * Hardware Configuration
> + *
> + * The SENINF is the camera sensor interface. On the input side it contains
> + * input channels (also named SENINF), each made of a CSI-2 receiver, an
> + * interface for parallel sensors, and a test pattern generator. The inputs are
> + * routed through a N:M crossbar switch (TOP MUX) to VC/DT filters with a FIFO
> + * (MUX). The MUX are routed to another N:M crossbar switch (CAM MUX), whose
> + * output is then connected to other IP cores.
> + *
> + *            +-------------------------------------------------------+
> + *            | SENINF                                                |
> + *            |                                                       |
> + * +-------+  |   +----------+    TOP MUX                             |
> + * |       |  |   |  SENINF  |      |\                        CAM MUX |
> + * | D-PHY | ---> | CSI-2 RX | ---> | |      +------------+      |\   |
> + * |       |  |   |   TPG    |   -> | | ---> | MUX (FIFO) | ---> | | ---> CAMSV
> + * +-------+  |   +----------+   -> | |      +------------+   -> | |  |
> + *            |                     |/                        -> | |  |
> + *            |                                                  |/   |
> + *            |                                                       |
> + *    ...     |       ...                         ...                --->
> + *            |                                                       |
> + *            |                                                       |
> + *            +-------------------------------------------------------+
> + *
> + * The number of PHYs, SENINF and MUX differ between SoCs. MT8167 has a single
> + * MUX and thus no output CAM MUX crossbar switch.
> + */
> +
> +static void mtk_seninf_csi2_setup_phy(struct mtk_seninf *priv)
> +{
> +	/* CSI0 */
> +	if (priv->inputs[CSI_PORT_0].phy) {
> +		struct mtk_seninf_input *input = &priv->inputs[CSI_PORT_0];

const

> +
> +		mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0, DPHY_MODE, 0 /* 4D1C*/);

As this is a V4L2 driver, I'm pretty sure someone will ask for

		mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
				  DPHY_MODE, 0 /* 4D1C*/);

I wouldn't care too much about going slightly over 80 characters, but
getting close to 100 where lines could be wrapped without hindering
readability will likely upset some people. Same in other places where
applicable.

> +		mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +				  CK_SEL_1, input->bus.clock_lane);
> +		mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0, CK_SEL_2, 2);
> +		mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +				  PHY_SENINF_LANE_MUX_CSI0_EN, 1);

You're reading and writing the same register 4 times to set 4 different
fields. This could be replaced by a single register access.

Can we improve this, here and everywhere else where applicable ? I won't
make it a blocker, but I really dislike this pattern :-(

> +	}
> +
> +	/* CSI1 */
> +	if (priv->inputs[CSI_PORT_1].phy) {
> +		struct mtk_seninf_input *input = &priv->inputs[CSI_PORT_1];

const here too.

> +
> +		mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI1, DPHY_MODE, 0 /* 4D1C */);
> +		mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI1,
> +				  CK_SEL_1, input->bus.clock_lane);
> +		mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI1,
> +				  PHY_SENINF_LANE_MUX_CSI1_EN, 1);
> +	}
> +}
> +
> +static void mtk_seninf_input_setup_csi2_rx(struct mtk_seninf_input *input)
> +{
> +	unsigned int lanes[MTK_CSI_MAX_LANES] = { };
> +	unsigned int i;
> +
> +	/*
> +	 * Configure data lane muxing. In 2D1C mode, lanes 0 to 2 correspond to
> +	 * CSIx[AB]_L{0,1,2}, and in 4D1C lanes 0 to 5 correspond to
> +	 * CSIxA_L{0,1,2}, CSIxB_L{0,1,2}.
> +	 *
> +	 * The clock lane must be skipped when calculating the index of the
> +	 * physical data lane. For instance, in 4D1C mode, the sensor clock
> +	 * lane is typically connected to lane 2 (CSIxA_L2), and the sensor
> +	 * data lanes 0-3 to lanes 1 (CSIxA_L1), 3 (CSIxB_L0), 0 (CSIxA_L0) and
> +	 * 4 (CSIxB_L1). The when skipping the clock lane, the data lane
> +	 * indices become 1, 2, 0 and 3.
> +	 */
> +	for (i = 0; i < input->bus.num_data_lanes; ++i) {
> +		lanes[i] = input->bus.data_lanes[i];
> +		if (lanes[i] > input->bus.clock_lane)
> +			lanes[i]--;
> +	}
> +
> +	mtk_seninf_input_update(input, MIPI_RX_CON24_CSI0, CSI0_BIST_LN0_MUX, lanes[0]);
> +	mtk_seninf_input_update(input, MIPI_RX_CON24_CSI0, CSI0_BIST_LN1_MUX, lanes[1]);
> +	mtk_seninf_input_update(input, MIPI_RX_CON24_CSI0, CSI0_BIST_LN2_MUX, lanes[2]);
> +	mtk_seninf_input_update(input, MIPI_RX_CON24_CSI0, CSI0_BIST_LN3_MUX, lanes[3]);
> +}
> +
> +static s64 mtk_seninf_get_clk_divider(struct mtk_seninf *priv,
> +				      enum mtk_seninf_id seninf_id,
> +				      u8 bpp, unsigned int num_data_lanes)
> +{
> +	struct media_entity *entity = &priv->subdev.entity;
> +	struct media_pad *pad;
> +	struct v4l2_subdev *sd;
> +	s64 link_frequency, pixel_clock;
> +
> +	if (!(entity->pads[seninf_id].flags & MEDIA_PAD_FL_SINK))
> +		return -ENODEV;
> +
> +	pad = media_pad_remote_pad_first(&entity->pads[seninf_id]);
> +	if (!pad)
> +		return -ENOENT;
> +
> +	if (!is_media_entity_v4l2_subdev(pad->entity))
> +		return -ENOENT;

Are those conditions that can happen ?

> +
> +	sd  = media_entity_to_v4l2_subdev(pad->entity);

s/sd  /sd /

> +	link_frequency = v4l2_get_link_freq(sd->ctrl_handler, bpp, num_data_lanes * 2);
> +	pixel_clock = div_u64(link_frequency * 2 * num_data_lanes, bpp);
> +	/*
> +	 * According to datasheet: Sensor master clock =  ISP_clock/(CLKCNT +1)
> +	 * we also have the following constraint: pixel_clock >= Sensor master clock
> +	 */
> +	return  div_u64(clk_get_rate(priv->clks[0].clk), pixel_clock) - 1;

s/return  /return /

> +}
> +
> +static int mtk_seninf_input_setup_csi2(struct mtk_seninf *priv,
> +					struct mtk_seninf_input *input,
> +					struct v4l2_subdev_state *state)
> +{
> +	const struct mtk_seninf_format_info *fmtinfo;
> +	const struct v4l2_mbus_framefmt *format;
> +	unsigned int num_data_lanes = input->bus.num_data_lanes;
> +	unsigned int val = 0;
> +	s64 clock_count;
> +
> +	format = v4l2_subdev_state_get_format(state, input->pad, 0);
> +	fmtinfo = mtk_seninf_format_info(format->code);
> +
> +	/* Configure timestamp */
> +	writel(SENINF_TIMESTAMP_STEP, input->base + SENINF_TG1_TM_STP);

Can we have a mtk_seninf_input_write(), the same way we have
mtk_seninf_mux_write() ? Same for writes to priv->base below, with a
mtk_seninf_write() inline function.

> +
> +	/* HQ */
> +	/*
> +	 * Configure phase counter. Zero means:
> +	 * - Sensor master clock: ISP_CLK
> +	 * - Sensor clock polarity: Rising edge
> +	 * - Sensor reset deasserted
> +	 * - Sensor powered up
> +	 * - Pixel clock inversion disabled
> +	 * - Sensor master clock polarity disabled
> +	 * - Phase counter disabled
> +	 */
> +	writel(0x0, input->base + SENINF_TG1_PH_CNT);
> +
> +	clock_count = mtk_seninf_get_clk_divider(priv, input->seninf_id, fmtinfo->bpp,
> +						 num_data_lanes);
> +	if (clock_count < 0)
> +		return clock_count;
> +
> +	clock_count = FIELD_PREP(GENMASK(21, 16), clock_count) | 0x1;

This field should be named with a macro in mtk_seninf_reg.h.

> +	writel(clock_count, input->base + SENINF_TG1_SEN_CK);
> +
> +	/* First Enable Sensor interface and select pad (0x1a04_0200) */
> +	mtk_seninf_input_update(input, SENINF_CTRL, SENINF_EN, 1);
> +	mtk_seninf_input_update(input, SENINF_CTRL, PAD2CAM_DATA_SEL, SENINF_PAD_10BIT);
> +	mtk_seninf_input_update(input, SENINF_CTRL, SENINF_SRC_SEL, 0);
> +	mtk_seninf_input_update(input, SENINF_CTRL_EXT, SENINF_CSI2_IP_EN, 1);
> +	mtk_seninf_input_update(input, SENINF_CTRL_EXT, SENINF_NCSI2_IP_EN, 0);
> +
> +	/* DPCM Enable */
> +	if (fmtinfo->flags & MTK_SENINF_FORMAT_DPCM)
> +		val = SENINF_CSI2_DPCM_DI_2A_DPCM_EN;
> +	else
> +		val = SENINF_CSI2_DPCM_DI_30_DPCM_EN;
> +	writel(val, input->base + SENINF_CSI2_DPCM);
> +
> +	/* Settle delay */
> +	mtk_seninf_input_update(input, SENINF_CSI2_LNRD_TIMING,
> +				DATA_SETTLE_PARAMETER, SENINF_SETTLE_DELAY);
> +
> +	/* CSI2 control */
> +	val = readl(input->base + SENINF_CSI2_CTL)
> +	      | (FIELD_PREP(SENINF_CSI2_CTL_ED_SEL, DATA_HEADER_ORDER_DI_WCL_WCH)
> +	      | SENINF_CSI2_CTL_CLOCK_LANE_EN | (BIT(num_data_lanes) - 1));
> +	writel(val, input->base + SENINF_CSI2_CTL);
> +
> +	mtk_seninf_input_update(input, SENINF_CSI2_RESYNC_MERGE_CTL, BYPASS_LANE_RESYNC, 0);
> +	mtk_seninf_input_update(input, SENINF_CSI2_RESYNC_MERGE_CTL, CDPHY_SEL, 0);
> +	mtk_seninf_input_update(input, SENINF_CSI2_RESYNC_MERGE_CTL, CPHY_LANE_RESYNC_CNT, 3);
> +	mtk_seninf_input_update(input, SENINF_CSI2_MODE, CSR_CSI2_MODE, 0);
> +	mtk_seninf_input_update(input, SENINF_CSI2_MODE, CSR_CSI2_HEADER_LEN, 0);
> +	mtk_seninf_input_update(input, SENINF_CSI2_DPHY_SYNC, SYNC_SEQ_MASK_0, 0xff00);
> +	mtk_seninf_input_update(input, SENINF_CSI2_DPHY_SYNC, SYNC_SEQ_PAT_0, 0x001d);
> +
> +	mtk_seninf_input_update(input, SENINF_CSI2_CTL, CLOCK_HS_OPTION, 0);
> +	mtk_seninf_input_update(input, SENINF_CSI2_CTL, HSRX_DET_EN, 0);
> +	mtk_seninf_input_update(input, SENINF_CSI2_CTL, HS_TRAIL_EN, 1);
> +	mtk_seninf_input_update(input, SENINF_CSI2_HS_TRAIL, HS_TRAIL_PARAMETER,
> +				SENINF_HS_TRAIL_PARAMETER);
> +
> +	/* Set debug port to output packet number */
> +	mtk_seninf_input_update(input, SENINF_CSI2_DGB_SEL, DEBUG_EN, 1);
> +	mtk_seninf_input_update(input, SENINF_CSI2_DGB_SEL, DEBUG_SEL, 0x1a);
> +
> +	/* HQ */
> +	writel(0xfffffffe, input->base + SENINF_CSI2_SPARE0);
> +
> +	/* Enable CSI2 IRQ mask */
> +	/* Turn on all interrupt */
> +	writel(0xffffffff, input->base + SENINF_CSI2_INT_EN);
> +	/* Write clear CSI2 IRQ */
> +	writel(0xffffffff, input->base + SENINF_CSI2_INT_STATUS);
> +	writel(0xffffffff, input->base + SENINF_CSI2_INT_STATUS_EXT);
> +	/* Enable CSI2 Extend IRQ mask */
> +	writel(0xffffffff, input->base + SENINF_CSI2_INT_EN_EXT);
> +	/* Reset the CSI2 to commit changes */
> +	mtk_seninf_input_update(input, SENINF_CTRL, CSI2_SW_RST, 1);
> +	udelay(1);
> +	mtk_seninf_input_update(input, SENINF_CTRL, CSI2_SW_RST, 0);
> +
> +	return 0;
> +}
> +
> +static void mtk_seninf_mux_setup(struct mtk_seninf_mux *mux,
> +				 struct mtk_seninf_input *input,
> +				 struct v4l2_subdev_state *state)
> +{
> +	const struct mtk_seninf_format_info *fmtinfo;
> +	const struct v4l2_mbus_framefmt *format;
> +	unsigned int pix_sel_ext;
> +	unsigned int pix_sel;
> +	unsigned int hs_pol = 0;
> +	unsigned int vs_pol = 0;
> +	unsigned int val;
> +	u32 rst_mask;
> +
> +	format = v4l2_subdev_state_get_format(state, input->pad, 0);
> +	fmtinfo = mtk_seninf_format_info(format->code);
> +
> +	/* Enable mux */
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_MUX_EN, 1);
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_SRC_SEL, SENINF_MIPI_SENSOR);
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL_EXT, SENINF_SRC_SEL_EXT, SENINF_NORMAL_MODEL);
> +
> +	pix_sel_ext = 0;
> +	pix_sel = 1;
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL_EXT, SENINF_PIX_SEL_EXT, pix_sel_ext);
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_PIX_SEL, pix_sel);
> +
> +	if (fmtinfo->flags & MTK_SENINF_FORMAT_JPEG) {
> +		mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FULL_WR_EN, 0);
> +		mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FLUSH_EN,
> +				      FIFO_FLUSH_EN_JPEG_2_PIXEL_MODE);
> +		mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_PUSH_EN,
> +				      FIFO_PUSH_EN_JPEG_2_PIXEL_MODE);
> +	} else {
> +		mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FULL_WR_EN, 2);
> +		mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FLUSH_EN,
> +				      FIFO_FLUSH_EN_NORMAL_MODE);
> +		mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_PUSH_EN, FIFO_PUSH_EN_NORMAL_MODE);
> +	}
> +
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_HSYNC_POL, hs_pol);
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_VSYNC_POL, vs_pol);
> +
> +	val = mtk_seninf_mux_read(mux, SENINF_MUX_CTRL);
> +	rst_mask = SENINF_MUX_CTRL_SENINF_IRQ_SW_RST | SENINF_MUX_CTRL_SENINF_MUX_SW_RST;
> +
> +	mtk_seninf_mux_write(mux, SENINF_MUX_CTRL, val | rst_mask);
> +	mtk_seninf_mux_write(mux, SENINF_MUX_CTRL, val & ~rst_mask);
> +
> +	/* HQ */
> +	val = SENINF_FIFO_FULL_SEL;
> +
> +	/* SPARE field meaning is unknown */
> +	val |= 0xc0000;
> +	mtk_seninf_mux_write(mux, SENINF_MUX_SPARE, val);
> +}
> +
> +static void mtk_seninf_top_mux_setup(struct mtk_seninf *priv,
> +				     enum mtk_seninf_id seninf_id,
> +				     struct mtk_seninf_mux *mux)
> +{
> +	unsigned int val;
> +
> +	/*
> +	 * Use the top mux (from SENINF input to MUX) to configure routing, and
> +	 * hardcode a 1:1 mapping from the MUX instances to the SENINF outputs.
> +	 */
> +	val = readl(priv->base + SENINF_TOP_MUX_CTRL)
> +		    & ~(0xf << (mux->mux_id * 4));
> +	val |= (seninf_id & 0xf) << (mux->mux_id * 4);
> +	writel(val, priv->base + SENINF_TOP_MUX_CTRL);
> +
> +	/*
> +	 * We currently support only seninf version 3.0
> +	 * where camsv0 and camsv1 are hardwired respectively to
> +	 * SENINF_CAM2 and SENINF_CAM3 i.e :
> +	 *  - SENINF_TOP_CAM_MUX_CTRL[11:8] = 0
> +	 *  - SENINF_TOP_CAM_MUX_CTRL[15:12] = 1
> +	 * so we hardcode it here
> +	 */
> +	mtk_seninf_update(priv, SENINF_TOP_CAM_MUX_CTRL, SENINF_CAM2_MUX_SRC_SEL, 0);
> +	mtk_seninf_update(priv, SENINF_TOP_CAM_MUX_CTRL, SENINF_CAM3_MUX_SRC_SEL, 1);
> +
> +}
> +
> +static void seninf_enable_test_pattern(struct mtk_seninf *priv,
> +				       struct v4l2_subdev_state *state)
> +{
> +	struct mtk_seninf_input *input = &priv->inputs[CSI_PORT_0];
> +	struct mtk_seninf_mux *mux = &priv->muxes[0];
> +	const struct mtk_seninf_format_info *fmtinfo;
> +	const struct v4l2_mbus_framefmt *format;
> +	unsigned int val;
> +	unsigned int pix_sel_ext;
> +	unsigned int pix_sel;
> +	unsigned int hs_pol = 0;
> +	unsigned int vs_pol = 0;
> +	unsigned int seninf = 0;
> +	unsigned int tm_size = 0;
> +	unsigned int mux_id = mux->mux_id;
> +
> +	format = v4l2_subdev_state_get_format(state, priv->conf->nb_inputs, 0);
> +	fmtinfo = mtk_seninf_format_info(format->code);
> +
> +	mtk_seninf_update(priv, SENINF_TOP_CTRL, MUX_LP_MODE, 0);
> +
> +	mtk_seninf_update(priv, SENINF_TOP_CTRL, SENINF_PCLK_EN, 1);
> +	mtk_seninf_update(priv, SENINF_TOP_CTRL, SENINF2_PCLK_EN, 1);
> +
> +	mtk_seninf_input_update(input, SENINF_CTRL, SENINF_EN, 1);
> +	mtk_seninf_input_update(input, SENINF_CTRL, SENINF_SRC_SEL, 1);
> +	mtk_seninf_input_update(input, SENINF_CTRL_EXT, SENINF_TESTMDL_IP_EN, 1);
> +
> +	mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_EN, 1);
> +	mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_PAT, 0xc);
> +	mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_VSYNC, 4);
> +	mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_DUMMYPXL, 0x28);
> +
> +	if (fmtinfo->flags & MTK_SENINF_FORMAT_BAYER)
> +		mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_FMT, 0x0);
> +	else
> +		mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_FMT, 0x1);
> +
> +	tm_size = FIELD_PREP(SENINF_TG1_TM_SIZE_TM_LINE, format->height + 8);
> +	switch (format->code) {
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_VYUY8_1X16:
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +	case MEDIA_BUS_FMT_YVYU8_1X16:
> +		tm_size |= FIELD_PREP(SENINF_TG1_TM_SIZE_TM_PXL, format->width * 2);
> +		break;
> +	default:
> +		tm_size |= FIELD_PREP(SENINF_TG1_TM_SIZE_TM_PXL, format->width);
> +		break;
> +	}
> +	writel(tm_size, input->base + SENINF_TG1_TM_SIZE);
> +
> +	writel(TEST_MODEL_CLK_DIVIDED_CNT, input->base + SENINF_TG1_TM_CLK);
> +	writel(TIME_STAMP_DIVIDER, input->base + SENINF_TG1_TM_STP);
> +
> +	/* Set top mux */
> +	val = (readl(priv->base + SENINF_TOP_MUX_CTRL) & (~(0xf << (mux_id * 4)))) |
> +		((seninf & 0xf) << (mux_id * 4));
> +	writel(val, priv->base + SENINF_TOP_MUX_CTRL);
> +
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_MUX_EN, 1);
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL_EXT, SENINF_SRC_SEL_EXT, SENINF_TEST_MODEL);
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_SRC_SEL, 1);
> +
> +	pix_sel_ext = 0;
> +	pix_sel = 1;
> +
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL_EXT,
> +			      SENINF_PIX_SEL_EXT, pix_sel_ext);
> +
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_PIX_SEL, pix_sel);
> +
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_PUSH_EN, 0x1f);
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FLUSH_EN, 0x1b);
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FULL_WR_EN, 2);
> +
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_HSYNC_POL, hs_pol);
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_VSYNC_POL, vs_pol);
> +	mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_HSYNC_MASK, 1);
> +
> +	mtk_seninf_mux_write(mux, SENINF_MUX_INTEN,
> +			     SENINF_IRQ_CLR_SEL | SENINF_ALL_ERR_IRQ_EN);
> +
> +	mtk_seninf_mux_write(mux, SENINF_MUX_CTRL,
> +			     mtk_seninf_mux_read(mux, SENINF_MUX_CTRL) |
> +			     SENINF_MUX_CTRL_SENINF_IRQ_SW_RST |
> +			     SENINF_MUX_CTRL_SENINF_MUX_SW_RST);
> +	udelay(1);
> +	mtk_seninf_mux_write(mux, SENINF_MUX_CTRL,
> +			     mtk_seninf_mux_read(mux, SENINF_MUX_CTRL) &
> +			     ~(SENINF_MUX_CTRL_SENINF_IRQ_SW_RST |
> +			       SENINF_MUX_CTRL_SENINF_MUX_SW_RST));
> +
> +	//check this
> +	writel(0x76540010, priv->base + SENINF_TOP_CAM_MUX_CTRL);
> +	/*
> +	 * We currently support only seninf version 3.0
> +	 * where camsv0 and camsv1 are hardwired respectively to
> +	 * test pattern is valid only for seninf_1 (id 0) i.e :
> +	 *  - SENINF_TOP_CAM_MUX_CTRL[11:8] = 0
> +	 *  - SENINF_TOP_CAM_MUX_CTRL[15:12] = 0
> +	 * so we hardcode it here
> +	 */
> +	mtk_seninf_update(priv, SENINF_TOP_CAM_MUX_CTRL, SENINF_CAM2_MUX_SRC_SEL, 0);
> +	mtk_seninf_update(priv, SENINF_TOP_CAM_MUX_CTRL, SENINF_CAM3_MUX_SRC_SEL, 0);
> +}
> +
> +static int mtk_seninf_start(struct mtk_seninf *priv,
> +			     struct v4l2_subdev_state *state,
> +			     struct mtk_seninf_input *input,
> +			     struct mtk_seninf_mux *mux)
> +{
> +	int ret;
> +
> +	phy_power_on(input->phy);
> +
> +	mtk_seninf_input_setup_csi2_rx(input);
> +	ret = mtk_seninf_input_setup_csi2(priv, input, state);
> +	if (ret)
> +		return ret;
> +
> +	mtk_seninf_mux_setup(mux, input, state);
> +	mtk_seninf_top_mux_setup(priv, input->seninf_id, mux);
> +	return 0;
> +}
> +
> +static void mtk_seninf_stop(struct mtk_seninf *priv,
> +			    struct mtk_seninf_input *input)
> +{
> +	unsigned int val;
> +
> +	/* Disable CSI2(2.5G) first */
> +	val = readl(input->base + SENINF_CSI2_CTL);
> +	val &= ~(SENINF_CSI2_CTL_CLOCK_LANE_EN |
> +		 SENINF_CSI2_CTL_DATA_LANE3_EN |
> +		 SENINF_CSI2_CTL_DATA_LANE2_EN |
> +		 SENINF_CSI2_CTL_DATA_LANE1_EN |
> +		 SENINF_CSI2_CTL_DATA_LANE0_EN);
> +	writel(val, input->base + SENINF_CSI2_CTL);
> +
> +	if (!priv->is_testmode)
> +		phy_power_off(input->phy);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * V4L2 Controls
> + */
> +
> +static int seninf_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mtk_seninf *priv = container_of(ctrl->handler,
> +					       struct mtk_seninf, ctrl_handler);
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		priv->is_testmode = !!ctrl->val;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops seninf_ctrl_ops = {
> +	.s_ctrl = seninf_set_ctrl,
> +};
> +
> +static const char *const seninf_test_pattern_menu[] = {
> +	"No test pattern",
> +	"Static horizontal color bars",
> +};
> +
> +static int seninf_initialize_controls(struct mtk_seninf *priv)
> +{
> +	struct v4l2_ctrl_handler *handler;
> +	int ret;
> +
> +	handler = &priv->ctrl_handler;
> +	ret = v4l2_ctrl_handler_init(handler, 2);
> +	if (ret)
> +		return ret;
> +
> +	v4l2_ctrl_new_std_menu_items(handler, &seninf_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(seninf_test_pattern_menu) - 1,
> +				     0, 0, seninf_test_pattern_menu);
> +
> +	priv->is_testmode = false;
> +
> +	if (handler->error) {
> +		ret = handler->error;
> +		dev_err(priv->dev,
> +			"Failed to init controls(%d)\n", ret);
> +		v4l2_ctrl_handler_free(handler);
> +		return ret;
> +	}
> +
> +	priv->subdev.ctrl_handler = handler;
> +
> +	return 0;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * V4L2 Subdev Operations
> + */
> +static int seninf_s_stream(struct v4l2_subdev *sd, unsigned int source_pad,
> +			   int on)
> +{
> +	struct mtk_seninf *priv = sd_to_mtk_seninf(sd);
> +	struct v4l2_subdev_state *state;
> +	struct mtk_seninf_input *input;
> +	struct mtk_seninf_mux *mux;
> +	struct v4l2_subdev *source;
> +	u32 sink_pad;
> +	int ret;
> +
> +	/* Stream control can only operate on source pads. */
> +	if (source_pad < priv->conf->nb_inputs ||
> +	    source_pad >= priv->conf->nb_inputs + priv->conf->nb_outputs)
> +		return -EINVAL;
> +
> +	/*
> +	 * Locate the SENINF input and MUX for the source pad.
> +	 *
> +	 * Hardcode a 1:1 mapping of MUX instances to SENINF
> +	 * outputs to match the TOP_CAM_MUX configuration in
> +	 * mtk_seninf_top_mux_setup().
> +	 */
> +	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);

I'm surprised this works. This function is called from
seninf_enable_streams() and seninf_disable_streams(), which are given
the locked active state already. Trying to lock it again should
deadlock. In any case, you have the state already, so there's no need to
get it again.

Split this function in two, and move the enable code to
seninf_enable_streams(), and the disable code to
seninf_disable_streams().

> +	if (!state)
> +		return -EPIPE;
> +
> +	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, source_pad, 0, &sink_pad,
> +						    NULL);
> +	if (ret) {
> +		dev_dbg(priv->dev, "No sink pad routed to source pad %u\n", source_pad);
> +		goto unlock;
> +	}
> +
> +	input = &priv->inputs[sink_pad];
> +	mux = &priv->muxes[source_pad - priv->conf->nb_inputs];
> +
> +	if (!on) {
> +		if (!priv->is_testmode) {
> +			source = input->source_sd;
> +			ret = v4l2_subdev_call(source, video, s_stream, 0);
> +			if (ret)
> +				dev_err(priv->dev,
> +					"failed to stop source %s: %d\n",
> +					source->entity.name, ret);
> +		}
> +
> +		mtk_seninf_stop(priv, input);
> +		pm_runtime_put(priv->dev);
> +		goto unlock;
> +	}
> +
> +	ret = pm_runtime_get_sync(priv->dev);
> +	if (ret < 0) {
> +		dev_err(priv->dev, "Failed to pm_runtime_get_sync: %d\n", ret);
> +		pm_runtime_put_noidle(priv->dev);
> +		goto unlock;
> +	}
> +
> +	/* If test mode is enabled, just enable the test pattern generator. */
> +	if (priv->is_testmode) {
> +		seninf_enable_test_pattern(priv, state);
> +		ret = 0;
> +		goto unlock;
> +	}
> +
> +	/* Start the SENINF first and then the source. */
> +	ret = mtk_seninf_start(priv, state, input, mux);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to start seninf: %d\n", ret);
> +		return ret;
> +	}
> +
> +	source = input->source_sd;
> +	ret = v4l2_subdev_call(source, video, s_stream, 1);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to start source %s: %d\n",
> +			source->entity.name, ret);
> +		mtk_seninf_stop(priv, input);
> +		pm_runtime_put(priv->dev);
> +	}
> +
> +unlock:
> +	v4l2_subdev_unlock_state(state);
> +	return ret;
> +};
> +
> +static int seninf_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
> +{
> +	return seninf_s_stream(sd, pad, 1);
> +}
> +
> +static int seninf_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{
> +	return seninf_s_stream(sd, pad, 0);
> +}
> +
> +static const struct v4l2_mbus_framefmt mtk_seninf_default_fmt = {
> +	.code = SENINF_DEFAULT_BUS_FMT,
> +	.width = SENINF_DEFAULT_WIDTH,
> +	.height = SENINF_DEFAULT_HEIGHT,
> +	.field = V4L2_FIELD_NONE,
> +	.colorspace = V4L2_COLORSPACE_SRGB,
> +	.xfer_func = V4L2_XFER_FUNC_DEFAULT,
> +	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
> +	.quantization = V4L2_QUANTIZATION_DEFAULT,
> +};
> +
> +static int __seninf_set_routing(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *state,
> +				struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	ret = v4l2_subdev_routing_validate(sd, routing, V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> +						&mtk_seninf_default_fmt);
> +}
> +
> +static int seninf_init_state(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *state)
> +{
> +	struct mtk_seninf *priv = sd_to_mtk_seninf(sd);
> +	struct v4l2_subdev_route routes[SENINF_MAX_NUM_OUTPUTS] = { };
> +	struct v4l2_subdev_krouting routing = {
> +		.routes = routes,
> +		.num_routes = priv->conf->nb_outputs,
> +	};
> +	unsigned int i;
> +
> +	/*
> +	 * Initialize one route for supported source pads.
> +	 * It is a single route from the first sink pad to the source pad,
> +	 * while on SENINF 5.0 the routing table will map sink pads to source
> +	 * pads connected to CAMSV 1:1 (skipping the first two source pads
> +	 * connected to the CAM instances).
> +	 */
> +	for (i = 0; i < routing.num_routes; i++) {
> +		struct v4l2_subdev_route *route = &routes[i];
> +
> +		route->sink_pad = i;
> +		route->sink_stream = 0;
> +		route->source_pad = priv->conf->nb_inputs + i;
> +		route->source_stream = 0;
> +		route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
> +	}
> +
> +	return __seninf_set_routing(sd, state, &routing);
> +}
> +
> +static int seninf_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	const struct mtk_seninf_format_info *fmtinfo;
> +	struct mtk_seninf *priv = sd_to_mtk_seninf(sd);
> +
> +	if (code->index >= ARRAY_SIZE(mtk_seninf_formats))
> +		return -EINVAL;
> +
> +	fmtinfo = &mtk_seninf_formats[code->index];
> +	if (fmtinfo->flags & MTK_SENINF_FORMAT_INPUT_ONLY &&
> +	    mtk_seninf_pad_is_source(priv, code->pad))
> +		return -EINVAL;
> +
> +	code->code = fmtinfo->code;
> +
> +	return 0;
> +}
> +
> +static int seninf_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *state,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct mtk_seninf *priv = sd_to_mtk_seninf(sd);
> +	const struct mtk_seninf_format_info *fmtinfo;
> +	struct v4l2_mbus_framefmt *format;
> +
> +	/*
> +	 * TODO (?): We should disallow setting formats on the source pad
> +	 * completely, as the SENINF can't perform any processing. This would
> +	 * however break usage of the test pattern generator, as there would be
> +	 * no way to configure formats at all when no active input is selected.
> +	 */

I think this needs to be solved.

> +
> +	/*
> +	 * Default to the first format if the requested media bus code isn't
> +	 * supported.
> +	 */
> +	fmtinfo = mtk_seninf_format_info(fmt->format.code);
> +	if (!fmtinfo) {
> +		fmtinfo = &mtk_seninf_formats[0];
> +		fmt->format.code = fmtinfo->code;
> +	}
> +
> +	/* Interlaced formats are not supported yet. */
> +	fmt->format.field = V4L2_FIELD_NONE;
> +
> +	/* Store the format. */
> +	format = v4l2_subdev_state_get_format(state, fmt->pad, fmt->stream);
> +	if (!format)
> +		return -EINVAL;
> +
> +	*format = fmt->format;
> +
> +	if (mtk_seninf_pad_is_source(priv, fmt->pad))
> +		return 0;
> +
> +	/* Propagate the format to the corresponding source pad. */
> +	format = v4l2_subdev_state_get_opposite_stream_format(state, fmt->pad,
> +							      fmt->stream);
> +	if (!format)
> +		return -EINVAL;
> +
> +	*format = fmt->format;

If fmtinfo is ont of the INPUT_ONLY formats, the corresponding
DPCM-uncompressed format must be set on the source pad. To facilitate
this, you want need to add a .uncompressed field to the format infoo
structure to store the corresponding uncompressed format.

> +
> +	return 0;
> +}
> +
> +static int seninf_set_routing(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *state,
> +			      enum v4l2_subdev_format_whence which,
> +			      struct v4l2_subdev_krouting *routing)
> +{
> +	return __seninf_set_routing(sd, state, routing);
> +}
> +
> +static const struct v4l2_subdev_core_ops seninf_subdev_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_pad_ops seninf_subdev_pad_ops = {
> +	.enum_mbus_code = seninf_enum_mbus_code,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = seninf_set_fmt,
> +	.link_validate = v4l2_subdev_link_validate_default,
> +	.set_routing = seninf_set_routing,
> +	.enable_streams = seninf_enable_streams,
> +	.disable_streams = seninf_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops seninf_subdev_ops = {
> +	.core = &seninf_subdev_core_ops,
> +	.pad = &seninf_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops seninf_subdev_internal_ops = {
> +	.init_state = seninf_init_state,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Media Entity Operations
> + */
> +
> +static const struct media_entity_operations seninf_media_ops = {
> +	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Async Subdev Notifier
> + */
> +
> +struct mtk_seninf_async_subdev {
> +	struct v4l2_async_connection asc;
> +	struct mtk_seninf_input *input;
> +	unsigned int port;
> +};
> +
> +static int mtk_seninf_fwnode_parse(struct device *dev,
> +				   unsigned int id)
> +
> +{
> +	static const char * const phy_names[] = { "csi0", "csi1", "csi2", "csi0b"};

s/}/ }/

> +	struct mtk_seninf *priv = dev_get_drvdata(dev);
> +	struct fwnode_handle *ep, *fwnode;
> +	struct mtk_seninf_input *input;
> +	struct mtk_seninf_async_subdev *asd;
> +	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
> +	unsigned int port;
> +	int ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), id, 0, 0);
> +	if (!ep)
> +		return 0;
> +
> +	fwnode = fwnode_graph_get_remote_endpoint(ep);
> +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +	if (ret) {
> +		dev_err(dev, "Failed to parse %pOF\n", to_of_node(fwnode));

		dev_err(dev, "Failed to parse %pfw\n", fwnode);

> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	asd = v4l2_async_nf_add_fwnode(&priv->notifier, fwnode,
> +				       struct mtk_seninf_async_subdev);
> +	if (IS_ERR(asd)) {
> +		ret = PTR_ERR(asd);
> +		goto out;
> +	}
> +
> +	port = vep.base.port;
> +	asd->port = port;
> +
> +	if (mtk_seninf_pad_is_source(priv, port)) {
> +		ret = 0;
> +		goto out;
> +	}
> +
> +	input = &priv->inputs[port];
> +
> +	input->pad = port;
> +	input->seninf_id = port_to_seninf_id[port];
> +	input->base = priv->base + 0x1000 * input->seninf_id;
> +	input->seninf = priv;
> +
> +	input->bus = vep.bus.mipi_csi2;
> +
> +	input->phy = devm_phy_get(dev, phy_names[port]);
> +	if (IS_ERR(input->phy)) {
> +		dev_err(dev, "failed to get phy:%ld\n", PTR_ERR(input->phy));

s/phy:/phy: /

> +		ret = PTR_ERR(input->phy);
> +		goto out;
> +	}
> +	input->phy_mode = SENINF_PHY_MODE_4D1C;
> +
> +	asd->input = input;
> +
> +	ret = 0;
> +out:
> +	fwnode_handle_put(ep);
> +	fwnode_handle_put(fwnode);
> +	return ret;
> +}
> +
> +static int mtk_seninf_notifier_bound(struct v4l2_async_notifier *notifier,
> +				     struct v4l2_subdev *sd,
> +				     struct v4l2_async_connection *asc)
> +{
> +	struct mtk_seninf *priv = container_of(notifier, struct mtk_seninf, notifier);
> +	struct mtk_seninf_async_subdev *asd =
> +		container_of(asc, struct mtk_seninf_async_subdev, asc);
> +	struct device_link *link;
> +	int ret;
> +
> +	dev_dbg(priv->dev, "%s bound to SENINF port %u\n", sd->entity.name, asd->port);
> +
> +	if (mtk_seninf_pad_is_sink(priv, asd->port)) {
> +		struct mtk_seninf_input *input = asd->input;
> +
> +		input->source_sd = sd;
> +
> +		link = device_link_add(priv->dev, sd->dev,
> +				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
> +		if (!link) {
> +			dev_err(priv->dev,
> +				"Failed to create device link from source %s\n", sd->name);
> +			return -EINVAL;
> +		}
> +
> +		ret = v4l2_create_fwnode_links_to_pad(sd, &priv->pads[input->pad],
> +						      MEDIA_LNK_FL_IMMUTABLE |
> +						      MEDIA_LNK_FL_ENABLED);
> +	} else {
> +		link = device_link_add(sd->dev, priv->dev,
> +				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
> +		if (!link) {
> +			dev_err(priv->dev,
> +				"Failed to create device link to output %s\n", sd->name);
> +			return -EINVAL;
> +		}
> +
> +		ret = v4l2_create_fwnode_links_to_pad(&priv->subdev,
> +						      &sd->entity.pads[0],
> +						      MEDIA_LNK_FL_IMMUTABLE |
> +						      MEDIA_LNK_FL_ENABLED);
> +	}
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to create links between SENINF port %u and %s (%d)\n",
> +			asd->port, sd->entity.name, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_seninf_notifier_complete(struct v4l2_async_notifier *notifier)
> +{
> +	struct mtk_seninf *priv = container_of(notifier, struct mtk_seninf, notifier);
> +	int ret;
> +
> +	ret = v4l2_device_register_subdev_nodes(&priv->v4l2_dev);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to register subdev nodes: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations mtk_seninf_async_ops = {
> +	.bound = mtk_seninf_notifier_bound,
> +	.complete = mtk_seninf_notifier_complete,
> +};
> +
> +static int mtk_seninf_media_init(struct mtk_seninf *priv)
> +{
> +	struct media_device *media_dev = &priv->media_dev;
> +	const struct mtk_seninf_conf *conf = priv->conf;
> +	unsigned int num_pads = conf->nb_outputs + conf->nb_inputs;
> +	struct media_pad *pads = priv->pads;
> +	struct device *dev = priv->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	media_dev->dev = dev;
> +	strscpy(media_dev->model, conf->model, sizeof(media_dev->model));
> +	media_dev->hw_revision = 0;
> +	media_device_init(media_dev);
> +
> +	for (i = 0; i < conf->nb_inputs; i++)
> +		pads[i].flags = MEDIA_PAD_FL_SINK;
> +	for (i = conf->nb_inputs; i < num_pads; i++)
> +		pads[i].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&priv->subdev.entity, num_pads, pads);
> +	if (ret) {
> +		media_device_cleanup(media_dev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_seninf_v4l2_async_register(struct mtk_seninf *priv)
> +{
> +	const struct mtk_seninf_conf *conf = priv->conf;
> +	struct device *dev = priv->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	v4l2_async_nf_init(&priv->notifier, &priv->v4l2_dev);
> +
> +	for (i = 0; i < conf->nb_inputs + conf->nb_outputs; ++i) {
> +		ret = mtk_seninf_fwnode_parse(dev, i);
> +
> +		if (ret) {
> +			dev_err(dev, "Failed to parse endpoint at port %d, err: %d\n", i, ret);
> +			goto err_clean_notififer;
> +		}
> +	}
> +
> +	priv->notifier.ops = &mtk_seninf_async_ops;
> +	ret = v4l2_async_nf_register(&priv->notifier);
> +	if (ret) {
> +		dev_err(dev, "Failed to register async notifier: %d\n", ret);
> +		goto err_clean_notififer;
> +	}
> +	return 0;
> +
> +err_clean_notififer:
> +	v4l2_async_nf_cleanup(&priv->notifier);
> +
> +	return ret;
> +}
> +
> +static int mtk_seninf_v4l2_register(struct mtk_seninf *priv)
> +{
> +	struct v4l2_subdev *sd = &priv->subdev;
> +	struct device *dev = priv->dev;
> +	int ret;
> +
> +	/* Initialize media device & pads. */
> +	ret = mtk_seninf_media_init(priv);
> +	if (ret)
> +		return ret;
> +
> +	/* Initialize & register v4l2 device. */
> +	priv->v4l2_dev.mdev = &priv->media_dev;
> +
> +	ret = v4l2_device_register(dev, &priv->v4l2_dev);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register V4L2 device: %d\n", ret);
> +		goto err_clean_media;
> +	}
> +
> +	/* Initialize & register subdev. */
> +	v4l2_subdev_init(sd, &seninf_subdev_ops);
> +	sd->internal_ops = &seninf_subdev_internal_ops;
> +	sd->dev = dev;
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->entity.ops = &seninf_media_ops;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS |
> +		     V4L2_SUBDEV_FL_STREAMS;
> +	strscpy(sd->name, dev_name(dev), sizeof(sd->name));
> +	ret = seninf_initialize_controls(priv);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to initialize controls: %d\n", ret);
> +		goto err_unreg_v4l2;
> +	}
> +	v4l2_set_subdevdata(sd, priv);
> +
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		goto err_free_handler;
> +
> +	ret = v4l2_device_register_subdev(&priv->v4l2_dev, sd);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register subdev: %d\n", ret);
> +		goto err_cleanup_subdev;
> +	}
> +
> +	/* Set up async device */
> +	ret = mtk_seninf_v4l2_async_register(priv);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register v4l2 async notifier: %d\n", ret);
> +		goto err_unreg_subdev;
> +	}
> +
> +	/* Register media device */
> +	ret = media_device_register(&priv->media_dev);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to register media device: %d\n", ret);
> +		goto err_unreg_notifier;
> +	}
> +
> +	return 0;
> +
> +err_unreg_notifier:
> +	v4l2_async_nf_unregister(&priv->notifier);
> +err_unreg_subdev:
> +	v4l2_device_unregister_subdev(sd);
> +err_cleanup_subdev:
> +	v4l2_subdev_cleanup(sd);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> +err_unreg_v4l2:
> +	v4l2_device_unregister(&priv->v4l2_dev);
> +err_clean_media:
> +	media_entity_cleanup(&sd->entity);
> +	media_device_cleanup(&priv->media_dev);
> +
> +	return ret;
> +}
> +
> +static int seninf_probe(struct platform_device *pdev)
> +{
> +	/* List of clocks required by seninf. */

I'd drop the comment, it seems quite obvious.

> +	static const char * const clk_names[] = { "camsys", "top_mux" };
> +	struct device *dev = &pdev->dev;
> +	struct mtk_seninf *priv;
> +	unsigned int i;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(struct mtk_seninf), GFP_KERNEL);

sizeof(*priv)

> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->conf = of_device_get_match_data(dev);

	priv->conf = device_get_match_data(dev);

then you can drop

#include <linux/of_graph.h>
#include <linux/of_platform.h>

above and replace them with

#include <linux/property.h>

> +
> +	dev_set_drvdata(dev, priv);
> +	priv->dev = dev;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->num_clks = ARRAY_SIZE(clk_names);
> +	priv->clks = devm_kcalloc(dev, priv->num_clks,
> +				  sizeof(*priv->clks), GFP_KERNEL);
> +	if (!priv->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < priv->num_clks; ++i)
> +		priv->clks[i].id = clk_names[i];
> +
> +	ret = devm_clk_bulk_get(dev, priv->num_clks, priv->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get seninf clock:%d\n", ret);

s/clock:/clock: /

> +
> +	for (i = 0; i < priv->conf->nb_muxes; ++i) {
> +		struct mtk_seninf_mux *mux = &priv->muxes[i];
> +
> +		mux->pad = priv->conf->nb_inputs + i;
> +		mux->mux_id = i;
> +		mux->base = priv->base + 0x1000 * i;
> +		mux->seninf = priv;
> +	}
> +
> +	ret = mtk_seninf_v4l2_register(priv);
> +	if (ret)
> +		return ret;
> +
> +	devm_pm_runtime_enable(dev);

You need to enable runtime PM before calling mtk_seninf_v4l2_register()
as the device can be used as soon as it gets registered.

> +
> +	return ret;
> +}
> +
> +static int seninf_pm_suspend(struct device *dev)
> +{
> +	struct mtk_seninf *priv = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
> +
> +	return 0;
> +}
> +
> +static int seninf_pm_resume(struct device *dev)
> +{
> +	struct mtk_seninf *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clock:%d\n", ret);

s/clock:/clock: /

> +		return ret;
> +	}
> +
> +	mtk_seninf_csi2_setup_phy(priv);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops runtime_pm_ops = {
> +	SET_RUNTIME_PM_OPS(seninf_pm_suspend, seninf_pm_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +};
> +
> +static void seninf_remove(struct platform_device *pdev)

Move .remove() just after .probe(). I would personally put both below
the PM handlers.

> +{
> +	struct mtk_seninf *priv = dev_get_drvdata(&pdev->dev);
> +
> +	media_device_unregister(&priv->media_dev);
> +	media_device_cleanup(&priv->media_dev);
> +	v4l2_async_nf_unregister(&priv->notifier);
> +	v4l2_async_nf_cleanup(&priv->notifier);
> +	v4l2_device_unregister_subdev(&priv->subdev);
> +	v4l2_subdev_cleanup(&priv->subdev);
> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> +	media_entity_cleanup(&priv->subdev.entity);
> +	v4l2_device_unregister(&priv->v4l2_dev);
> +}
> +
> +static const struct mtk_seninf_conf seninf_8365_conf = {
> +	.model = "mtk-camsys-3.0",
> +	.nb_inputs = 4,
> +	.nb_muxes = 6,
> +	.nb_outputs = 4,
> +};
> +
> +static const struct of_device_id mtk_seninf_of_match[] = {
> +	{ .compatible = "mediatek,mt8365-seninf", .data = &seninf_8365_conf },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, mtk_seninf_of_match);
> +
> +static struct platform_driver seninf_pdrv = {
> +	.driver	= {
> +		.name = "mtk-seninf",
> +		.pm = &runtime_pm_ops,
> +		.of_match_table = mtk_seninf_of_match,
> +	},
> +	.probe	= seninf_probe,
> +	.remove_new	= seninf_remove,

You can switch back to .remove() :-)

> +};
> +
> +module_platform_driver(seninf_pdrv);
> +
> +MODULE_DESCRIPTION("MTK sensor interface driver");
> +MODULE_AUTHOR("Louis Kuo <louis.kuo@mediatek.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf_reg.h b/drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf_reg.h
> new file mode 100644
> index 000000000000..06cfd6de2a8f
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf_reg.h
> @@ -0,0 +1,117 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + */
> +
> +#ifndef __SENINF_REG_H__
> +#define __SENINF_REG_H__
> +
> +#include <linux/bits.h>
> +
> +#define SENINF_TOP_CTRL							0x0000
> +#define SENINF_TOP_CTRL_MUX_LP_MODE					BIT(31)
> +#define SENINF_TOP_CTRL_SENINF_PCLK_EN					BIT(10)
> +#define SENINF_TOP_CTRL_SENINF2_PCLK_EN					BIT(11)
> +#define SENINF_TOP_MUX_CTRL						0x0008
> +#define SENINF_TOP_CAM_MUX_CTRL						0x0010
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM2_MUX_SRC_SEL			GENMASK(11, 8)
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM3_MUX_SRC_SEL			GENMASK(15, 12)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0					0x001c
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_DPHY_MODE			BIT(0)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CK_SEL_1				GENMASK(10, 8)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CK_SEL_2				GENMASK(13, 12)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_PHY_SENINF_LANE_MUX_CSI0_EN	BIT(31)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1					0x0020
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_DPHY_MODE			BIT(0)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_CK_SEL_1				GENMASK(10, 8)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_PHY_SENINF_LANE_MUX_CSI1_EN	BIT(31)
> +#define SENINF_CTRL							0x0200
> +#define SENINF_CTRL_SENINF_EN						BIT(0)
> +#define SENINF_CTRL_CSI2_SW_RST						BIT(7)
> +#define SENINF_CTRL_SENINF_SRC_SEL					GENMASK(14, 12)
> +#define SENINF_CTRL_PAD2CAM_DATA_SEL					GENMASK(30, 28)
> +#define SENINF_CTRL_EXT							0x0204
> +#define SENINF_CTRL_EXT_SENINF_TESTMDL_IP_EN				BIT(1)
> +#define SENINF_CTRL_EXT_SENINF_NCSI2_IP_EN				BIT(5)
> +#define SENINF_CTRL_EXT_SENINF_CSI2_IP_EN				BIT(6)
> +#define SENINF_TG1_PH_CNT						0x0600
> +#define SENINF_TG1_SEN_CK						0x0604
> +#define SENINF_TG1_TM_CTL						0x0608
> +#define SENINF_TG1_TM_CTL_TM_EN						BIT(0)
> +#define SENINF_TG1_TM_CTL_TM_FMT					BIT(2)
> +#define SENINF_TG1_TM_CTL_TM_PAT					GENMASK(7, 4)
> +#define SENINF_TG1_TM_CTL_TM_VSYNC					GENMASK(15, 8)
> +#define SENINF_TG1_TM_CTL_TM_DUMMYPXL					GENMASK(23, 16)
> +#define SENINF_TG1_TM_SIZE						0x060c
> +#define SENINF_TG1_TM_SIZE_TM_LINE					GENMASK(29, 16)
> +#define SENINF_TG1_TM_SIZE_TM_PXL					GENMASK(12, 0)
> +#define SENINF_TG1_TM_CLK						0x0610
> +#define TEST_MODEL_CLK_DIVIDED_CNT					8
> +#define SENINF_TG1_TM_STP						0x0614
> +#define TIME_STAMP_DIVIDER						1
> +#define MIPI_RX_CON24_CSI0						0x0824
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN0_MUX				GENMASK(25, 24)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN1_MUX				GENMASK(27, 26)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN2_MUX				GENMASK(29, 28)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN3_MUX				GENMASK(31, 30)
> +#define SENINF_CSI2_CTL							0x0a00
> +#define SENINF_CSI2_CTL_DATA_LANE0_EN					BIT(0)
> +#define SENINF_CSI2_CTL_DATA_LANE1_EN					BIT(1)
> +#define SENINF_CSI2_CTL_DATA_LANE2_EN					BIT(2)
> +#define SENINF_CSI2_CTL_DATA_LANE3_EN					BIT(3)
> +#define SENINF_CSI2_CTL_CLOCK_LANE_EN					BIT(4)
> +#define SENINF_CSI2_CTL_HSRX_DET_EN					BIT(7)
> +#define SENINF_CSI2_CTL_ED_SEL						BIT(16)
> +#define DATA_HEADER_ORDER_DI_WCL_WCH					1
> +#define SENINF_CSI2_CTL_HS_TRAIL_EN					BIT(25)
> +#define SENINF_CSI2_CTL_CLOCK_HS_OPTION					BIT(27)
> +#define SENINF_CSI2_LNRD_TIMING						0x0a08
> +#define SENINF_CSI2_LNRD_TIMING_DATA_SETTLE_PARAMETER			GENMASK(15, 8)
> +#define SENINF_CSI2_DPCM						0x0a0c
> +#define SENINF_CSI2_DPCM_DI_30_DPCM_EN					BIT(7)
> +#define SENINF_CSI2_DPCM_DI_2A_DPCM_EN					BIT(15)
> +#define SENINF_CSI2_INT_EN						0x0a10
> +#define SENINF_CSI2_INT_STATUS						0x0a14
> +#define SENINF_CSI2_INT_EN_EXT						0x0b10
> +#define SENINF_CSI2_INT_STATUS_EXT					0x0a14
> +#define SENINF_CSI2_DGB_SEL						0x0a18
> +#define SENINF_CSI2_DGB_SEL_DEBUG_SEL					GENMASK(7, 0)
> +#define SENINF_CSI2_DGB_SEL_DEBUG_EN					BIT(31)
> +#define SENINF_CSI2_SPARE0						0x0a20
> +#define SENINF_CSI2_LNRC_FSM						0x0a28
> +#define SENINF_CSI2_HS_TRAIL						0x0a40
> +#define SENINF_CSI2_HS_TRAIL_HS_TRAIL_PARAMETER				GENMASK(7, 0)
> +#define SENINF_CSI2_RESYNC_MERGE_CTL					0x0a74
> +#define SENINF_CSI2_RESYNC_MERGE_CTL_CPHY_LANE_RESYNC_CNT		GENMASK(2, 0)
> +#define SENINF_CSI2_RESYNC_MERGE_CTL_BYPASS_LANE_RESYNC			BIT(10)
> +#define SENINF_CSI2_RESYNC_MERGE_CTL_CDPHY_SEL				BIT(11)
> +#define SENINF_CSI2_MODE						0x0ae8
> +#define SENINF_CSI2_MODE_CSR_CSI2_MODE					GENMASK(7, 0)
> +#define SENINF_CSI2_MODE_CSR_CSI2_HEADER_LEN				GENMASK(10, 8)
> +#define SENINF_CSI2_DPHY_SYNC						0x0b20
> +#define SENINF_CSI2_DPHY_SYNC_SYNC_SEQ_MASK_0				GENMASK(15, 0)
> +#define SENINF_CSI2_DPHY_SYNC_SYNC_SEQ_PAT_0				GENMASK(31, 16)
> +#define SENINF_MUX_CTRL							0x0d00
> +#define SENINF_MUX_CTRL_SENINF_MUX_SW_RST				BIT(0)
> +#define SENINF_MUX_CTRL_SENINF_IRQ_SW_RST				BIT(1)
> +#define SENINF_MUX_CTRL_SENINF_HSYNC_MASK				BIT(7)
> +#define SENINF_MUX_CTRL_SENINF_PIX_SEL					BIT(8)
> +#define SENINF_MUX_CTRL_SENINF_VSYNC_POL				BIT(9)
> +#define SENINF_MUX_CTRL_SENINF_HSYNC_POL				BIT(10)
> +#define SENINF_MUX_CTRL_SENINF_SRC_SEL					GENMASK(15, 12)
> +#define SENINF_MUX_CTRL_FIFO_PUSH_EN					GENMASK(21, 16)
> +#define FIFO_PUSH_EN_NORMAL_MODE					0x1f
> +#define FIFO_PUSH_EN_JPEG_2_PIXEL_MODE					0x1e
> +#define SENINF_MUX_CTRL_FIFO_FLUSH_EN					GENMASK(28, 22)
> +#define FIFO_FLUSH_EN_NORMAL_MODE					0x1b
> +#define FIFO_FLUSH_EN_JPEG_2_PIXEL_MODE					0x18
> +#define SENINF_MUX_CTRL_FIFO_FULL_WR_EN					GENMASK(29, 28)
> +#define SENINF_MUX_CTRL_SENINF_MUX_EN					BIT(31)
> +#define SENINF_MUX_INTEN						0x0d04
> +#define SENINF_MUX_SPARE						0x0d2c
> +#define SENINF_FIFO_FULL_SEL						BIT(13)
> +#define SENINF_MUX_CTRL_EXT						0x0d3c
> +#define SENINF_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT				GENMASK(1, 0)
> +#define SENINF_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT				BIT(4)
> +
> +#endif /* __SENINF_REG_H__ */

-- 
Regards,

Laurent Pinchart

