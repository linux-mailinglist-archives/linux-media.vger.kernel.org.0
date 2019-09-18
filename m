Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B296AB5ECC
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 10:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729295AbfIRIMU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 04:12:20 -0400
Received: from retiisi.org.uk ([95.216.213.190]:40692 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725834AbfIRIMU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 04:12:20 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 61CEB634C87;
        Wed, 18 Sep 2019 11:11:31 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iAV3k-0001X3-6p; Wed, 18 Sep 2019 11:11:32 +0300
Date:   Wed, 18 Sep 2019 11:11:32 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Louis Kuo <louis.kuo@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, keiichiw@chromium.org, matthias.bgg@gmail.com,
        mchehab@kernel.org, yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        frederic.chen@mediatek.com, Jerry-ch.Chen@mediatek.com,
        jungo.lin@mediatek.com, Rynn.Wu@mediatek.com,
        linux-media@vger.kernel.org, srv_heupstream@mediatek.com,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH V4 1/4] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
Message-ID: <20190918081132.GC5525@valkosipuli.retiisi.org.uk>
References: <20190915065004.20257-1-louis.kuo@mediatek.com>
 <20190915065004.20257-2-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190915065004.20257-2-louis.kuo@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Luis,

On Sun, Sep 15, 2019 at 02:50:01PM +0800, Louis Kuo wrote:
> This patch adds Mediat:ek's sensor interface driver. Sensor interface
> driver
> is a MIPI-CSI2 host driver, namely, a HW camera interface controller.
> It support a widely adopted, simple, high-speed protocol primarily
> intended
> for point-to-point image and video transmission between cameras and host
> devices.
> 
> The mtk-isp directory will contain drivers for multiple IP blocks found in
> Mediatek ISP system. It will include ISP Pass 1 driver, sensor interface
> driver, DIP driver and face detection driver.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/mtk-isp/Makefile       |    3 +
>  .../media/platform/mtk-isp/isp_50/Makefile    |    5 +
>  .../platform/mtk-isp/isp_50/seninf/Makefile   |    6 +
>  .../mtk-isp/isp_50/seninf/mtk_seninf.c        | 1011 +++++++++++++++++
>  .../mtk-isp/isp_50/seninf/mtk_seninf_def.h    |   59 +
>  .../mtk-isp/isp_50/seninf/mtk_seninf_reg.h    |  853 ++++++++++++++
>  7 files changed, 1939 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h
> 
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 7cbbd925124c..b0f4543f2f86 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -73,6 +73,8 @@ obj-$(CONFIG_VIDEO_ROCKCHIP_RGA)	+= rockchip/rga/
>  
>  obj-y	+= omap/
>  
> +obj-y	+= mtk-isp/
> +
>  obj-$(CONFIG_VIDEO_AM437X_VPFE)		+= am437x/
>  
>  obj-$(CONFIG_VIDEO_XILINX)		+= xilinx/
> diff --git a/drivers/media/platform/mtk-isp/Makefile b/drivers/media/platform/mtk-isp/Makefile
> new file mode 100644
> index 000000000000..c17fb3fc3340
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-y += isp_50/
> diff --git a/drivers/media/platform/mtk-isp/isp_50/Makefile b/drivers/media/platform/mtk-isp/isp_50/Makefile
> new file mode 100644
> index 000000000000..8b4a792328e5
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +ifeq ($(CONFIG_MTK_SENINF),y)
> +obj-y += seninf/
> +endif
> diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/Makefile b/drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
> new file mode 100644
> index 000000000000..bf193feb0ce9
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +MODULE		= mtk_seninf
> +LIB_FILES	= mtk_seninf
> +
> +obj-$(CONFIG_MTK_SENINF) += mtk_seninf.o
> diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
> new file mode 100644
> index 000000000000..3253510cf7fd
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
> @@ -0,0 +1,1011 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/module.h>
> +#include <linux/delay.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_irq.h>
> +#ifdef CONFIG_COMPAT
> +#include <linux/compat.h>
> +#endif
> +#include <linux/videodev2.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-async.h>
> +#include "mtk_seninf_reg.h"
> +#include "mtk_seninf_def.h"
> +
> +static inline int is_4d1c(unsigned int port)
> +{
> +	return (port < CFG_CSI_PORT_0A);

No need for parentheses; same below.

> +}
> +
> +static inline int is_cdphy_combo(unsigned int port)
> +{
> +	return (port == CFG_CSI_PORT_0A ||
> +		port == CFG_CSI_PORT_0B ||
> +		port == CFG_CSI_PORT_0);
> +}
> +
> +struct sensor_cfg {
> +	unsigned char clock_lane;
> +	unsigned short num_data_lanes;
> +};
> +
> +struct mtk_seninf {
> +	struct v4l2_subdev subdev;
> +	struct v4l2_async_notifier notifier;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_subdev_format fmt[NUM_PADS];
> +	struct device *dev;
> +	struct media_pad pads[NUM_PADS];
> +	struct sensor_cfg sensor[NUM_SENSORS];
> +	unsigned int num_clks;
> +	struct clk_bulk_data *clks;
> +	void __iomem *base_reg;
> +	void __iomem *rx_reg;
> +	unsigned char *csi2_rx[CFG_CSI_PORT_MAX_NUM];
> +	unsigned int port;
> +	unsigned int mux_sel;
> +};
> +
> +static unsigned int mtk_seninf_get_dpcm(struct mtk_seninf *priv)
> +{
> +	int dpcm;

unsigned int

> +
> +	switch (priv->fmt[priv->port].format.code) {
> +	case MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8:
> +		dpcm = 0x2a;
> +		break;
> +	default:
> +		dpcm = 0;
> +		break;
> +	}
> +
> +	return dpcm;
> +}
> +
> +static unsigned int mtk_seninf_map_fmt(struct mtk_seninf *priv)
> +{
> +	int fmtidx = 0;
> +
> +	switch (priv->fmt[priv->port].format.code) {
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		fmtidx = 0;
> +		break;
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +		fmtidx = 1;
> +		break;
> +	case MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8:
> +		fmtidx = 0;
> +		break;
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +		fmtidx = 2;
> +		break;
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_VYUY8_1X16:
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +	case MEDIA_BUS_FMT_YVYU8_1X16:
> +		fmtidx = 3;
> +		break;
> +	case MEDIA_BUS_FMT_JPEG_1X8:
> +	case MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8:
> +		fmtidx = 7;

There seem to be an enum for the formats. Is this the same
different? The users appear to be comparing the values returned by this
function to e.g. JPEG_FMT that is part of the enum.

> +		break;
> +	}
> +
> +	return fmtidx;
> +}
> +
> +static u32 mtk_seninf_csi_port_to_seninf(u32 port)
> +{
> +	static const u32 port_to_seninf[] = {
> +		[CFG_CSI_PORT_0] = SENINF_1,
> +		[CFG_CSI_PORT_1] = SENINF_3,
> +		[CFG_CSI_PORT_2] = SENINF_5,
> +		[CFG_CSI_PORT_0A] = SENINF_1,
> +		[CFG_CSI_PORT_0B] = SENINF_2,
> +	};
> +	if (WARN_ON(port >= ARRAY_SIZE(port_to_seninf)))
> +		return -EINVAL;
> +
> +	return port_to_seninf[port];
> +}
> +
> +static void mtk_seninf_set_mux(struct mtk_seninf *priv,
> +			       int seninf)
> +{
> +	unsigned int mux = priv->mux_sel;
> +	void *pseninf_top = priv->base_reg;
> +	void *pseninf = priv->base_reg + 0x1000 * mux;
> +	unsigned int val;
> +	unsigned int pix_sel_ext;
> +	unsigned int pix_sel;
> +	unsigned int hs_pol = 0;
> +	unsigned int vs_pol = 0;
> +	unsigned int pixel_mode = ONE_PIXEL_MODE;
> +	unsigned int input_data_type;
> +
> +	/* Enable mux */
> +	writel(0x7fffffff & readl(pseninf + SENINF1_MUX_CTRL) |
> +		0x80000000, pseninf + SENINF1_MUX_CTRL);
> +
> +	input_data_type = mtk_seninf_map_fmt(priv);
> +	/* Set mux ctrl */
> +	writel(0xffff0fff & readl(pseninf + SENINF1_MUX_CTRL) |
> +		0x8000, pseninf + SENINF1_MUX_CTRL);
> +
> +	writel(0xfffffffc & readl(pseninf + SENINF1_MUX_CTRL_EXT) |
> +		0x1, pseninf + SENINF1_MUX_CTRL_EXT);

Could you add more descriptive #defines for these magic numbers, please?

Same for the values below.

> +
> +	switch (pixel_mode) {
> +	case 1: /* 2 Pixel */
> +		pix_sel_ext = 0;
> +		pix_sel = 1 << 8;
> +		break;
> +	case 2: /* 4 Pixel */
> +		pix_sel_ext = 1 << 4;
> +		pix_sel = 0;
> +		break;
> +	default: /* 1 Pixel */
> +		pix_sel_ext = 0;
> +		pix_sel = 0;
> +		break;
> +	}
> +
> +	writel(0xffffffef & readl(pseninf + SENINF1_MUX_CTRL_EXT) |
> +		pix_sel_ext, pseninf + SENINF1_MUX_CTRL_EXT);
> +	writel(0xfffffeff & readl(pseninf + SENINF1_MUX_CTRL) |
> +		pix_sel, pseninf + SENINF1_MUX_CTRL);
> +
> +	val = 0;
> +	if (input_data_type != JPEG_FMT)
> +		val = 0x20000000;
> +
> +	writel(0xcfffffff & readl(pseninf + SENINF1_MUX_CTRL) |
> +		val, pseninf + SENINF1_MUX_CTRL);
> +
> +	if (input_data_type != JPEG_FMT)
> +		writel(0xf000ffff & readl(pseninf + SENINF1_MUX_CTRL) |
> +			0x6df0000, pseninf + SENINF1_MUX_CTRL);
> +	else
> +		writel(0xf000ffff & readl(pseninf + SENINF1_MUX_CTRL) |
> +			0x61e0000, pseninf + SENINF1_MUX_CTRL);
> +
> +	writel((0xfffff9ff) & readl(pseninf + SENINF1_MUX_CTRL)	|
> +		(hs_pol << 10) | (vs_pol << 9), pseninf + SENINF1_MUX_CTRL);
> +
> +	val = (readl(pseninf + SENINF1_MUX_CTRL) | 0x3) & 0xFFFFFFFC;
> +	writel(val, pseninf + SENINF1_MUX_CTRL);
> +
> +	/* Set top mux */
> +	val = (readl(pseninf_top + SENINF_TOP_MUX_CTRL) &
> +		(~(0xF << (mux * 4))))	| ((seninf & 0xF) << (mux * 4));
> +	writel(val, pseninf + SENINF_TOP_MUX_CTRL);
> +}
> +
> +static void mtk_seninf_set_dphy(struct mtk_seninf *priv, unsigned int seninf)
> +{
> +	void *pmipi_rx_base = priv->csi2_rx[CFG_CSI_PORT_0];
> +	unsigned int port = priv->port;
> +	void *pmipi_rx = priv->csi2_rx[port];
> +	void *pmipi_rx_conf = priv->base_reg + 0x1000 * seninf;
> +
> +	/* Set analog phy mode to DPHY */
> +	if (is_cdphy_combo(port))
> +		writel(0xfffffffe & readl(pmipi_rx + MIPI_RX_ANA00_CSI0A)
> +			, pmipi_rx + MIPI_RX_ANA00_CSI0A);
> +
> +	/* 4D1C: MIPIRX_ANALOG_A_BASE = 0x00001A40 */
> +	if (is_4d1c(port))
> +		writel((0xffffe49f & readl(pmipi_rx + MIPI_RX_ANA00_CSI0A)) |
> +			0x1a40, pmipi_rx + MIPI_RX_ANA00_CSI0A);

Ditto.

> +	else /* MIPIRX_ANALOG_BASE = 0x100 */
> +		writel((0xffffe49f & readl(pmipi_rx + MIPI_RX_ANA00_CSI0A)) |
> +			0x100, pmipi_rx + MIPI_RX_ANA00_CSI0A);
> +
> +	if (is_cdphy_combo(port))
> +		writel(0xfffffffe & readl(pmipi_rx + MIPI_RX_ANA00_CSI0B)
> +			, pmipi_rx + MIPI_RX_ANA00_CSI0B);
> +
> +	/* Only 4d1c need set CSIB: MIPIRX_ANALOG_B_BASE = 0x00001240 */
> +	if (is_4d1c(port))
> +		writel(0xffffe49f & readl(pmipi_rx + MIPI_RX_ANA00_CSI0B) |
> +			0x1240, pmipi_rx + MIPI_RX_ANA00_CSI0B);
> +	else /* MIPIRX_ANALOG_BASE = 0x100 */
> +		writel(0xffffe49f & readl(pmipi_rx + MIPI_RX_ANA00_CSI0B) |
> +			0x100, pmipi_rx + MIPI_RX_ANA00_CSI0B);
> +
> +	/* Byte clock invert */
> +	writel(0xfffffff8 & readl(pmipi_rx + MIPI_RX_ANAA8_CSI0A) |
> +		0x7, pmipi_rx + MIPI_RX_ANAA8_CSI0A);
> +	if (is_4d1c(port))
> +		writel(0xfffffff8 & readl(pmipi_rx + MIPI_RX_ANAA8_CSI0B) |
> +			0x7, pmipi_rx + MIPI_RX_ANAA8_CSI0B);
> +
> +	/* Start ANA EQ tuning */
> +	if (is_cdphy_combo(port)) {
> +		writel(0xffffff0f & readl(pmipi_rx + MIPI_RX_ANA18_CSI0A) |
> +			0x50, pmipi_rx + MIPI_RX_ANA18_CSI0A);
> +		writel(0xff0fffff & readl(pmipi_rx + MIPI_RX_ANA1C_CSI0A) |
> +			0x500000, pmipi_rx + MIPI_RX_ANA1C_CSI0A);
> +		writel(0xff0fffff & readl(pmipi_rx + MIPI_RX_ANA20_CSI0A) |
> +			0x500000, pmipi_rx + MIPI_RX_ANA20_CSI0A);
> +		if (is_4d1c(port)) { /* 4d1c */
> +			writel(0xffffff0f &
> +				readl(pmipi_rx + MIPI_RX_ANA18_CSI0B) |
> +				0x50, pmipi_rx + MIPI_RX_ANA18_CSI0B);
> +			writel(0xff0fffff &
> +				readl(pmipi_rx + MIPI_RX_ANA1C_CSI0B) |
> +				0x500000, pmipi_rx + MIPI_RX_ANA1C_CSI0B);
> +			writel(0xff0fffff &
> +				readl(pmipi_rx + MIPI_RX_ANA20_CSI0B) |
> +				0x500000, pmipi_rx + MIPI_RX_ANA20_CSI0B);
> +		}
> +	} else {
> +		writel(0xff0fff0f & readl(pmipi_rx + MIPI_RX_ANA18_CSI1A) |
> +			0x500050, pmipi_rx + MIPI_RX_ANA18_CSI1A);
> +		writel(0xffffff0f & readl(pmipi_rx + MIPI_RX_ANA1C_CSI1A) |
> +			0x50, pmipi_rx + MIPI_RX_ANA1C_CSI1A);
> +
> +		if (is_4d1c(port)) { /* 4d1c */
> +			writel(0xff0fff0f &
> +				readl(pmipi_rx + MIPI_RX_ANA18_CSI1B) |
> +				0x500050, pmipi_rx + MIPI_RX_ANA18_CSI1B);
> +			writel(0xffffff0f &
> +				readl(pmipi_rx + MIPI_RX_ANA1C_CSI1B) |
> +				0x50, pmipi_rx + MIPI_RX_ANA1C_CSI1B);
> +		}
> +	}
> +
> +	/* End ANA EQ tuning */
> +	writel(0x90, pmipi_rx_base + MIPI_RX_ANA40_CSI0A);
> +	writel(0xffffff & readl(pmipi_rx + MIPI_RX_ANA24_CSI0A) |
> +		0x40000000, pmipi_rx + MIPI_RX_ANA24_CSI0A);
> +	if (is_4d1c(port))
> +		writel(0xffffff & readl(pmipi_rx + MIPI_RX_ANA24_CSI0B) |
> +			0x40000000, pmipi_rx + MIPI_RX_ANA24_CSI0B);
> +	writel(0xfffcffff & readl(pmipi_rx + MIPI_RX_WRAPPER80_CSI0A)
> +		, pmipi_rx + MIPI_RX_WRAPPER80_CSI0A);
> +	if (is_4d1c(port))
> +		writel(0xfffcffff & readl(pmipi_rx + MIPI_RX_WRAPPER80_CSI0B)
> +			, pmipi_rx + MIPI_RX_WRAPPER80_CSI0B);
> +	/* ANA power on */
> +	writel(0xfffffff7 & readl(pmipi_rx + MIPI_RX_ANA00_CSI0A) |
> +		0x8, pmipi_rx + MIPI_RX_ANA00_CSI0A);
> +	if (is_4d1c(port))
> +		writel(0xfffffff7 & readl(pmipi_rx + MIPI_RX_ANA00_CSI0B) |
> +			0x8, pmipi_rx + MIPI_RX_ANA00_CSI0B);
> +
> +	usleep_range(20, 40);
> +	writel(0xfffffff7 & readl(pmipi_rx + MIPI_RX_ANA00_CSI0A) |
> +		0x8, pmipi_rx + MIPI_RX_ANA00_CSI0A);
> +	if (is_4d1c(port))
> +		writel(0xfffffffb & readl(pmipi_rx + MIPI_RX_ANA00_CSI0B) |
> +			0x4, pmipi_rx + MIPI_RX_ANA00_CSI0B);
> +
> +	udelay(1);
> +	/* 4d1c: MIPIRX_CONFIG_CSI_BASE = 0xC9000000; */
> +	if (is_4d1c(port)) {
> +		writel(0xffffff &
> +			readl(pmipi_rx_conf + MIPI_RX_CON24_CSI0) |
> +			0xc9000000, pmipi_rx_conf + MIPI_RX_CON24_CSI0);
> +	} else { /* 2d1c: MIPIRX_CONFIG_CSI_BASE = 0xE4000000; */
> +		writel(0xffffff &
> +			readl(pmipi_rx_conf + MIPI_RX_CON24_CSI0) |
> +			0xe4000000, pmipi_rx_conf + MIPI_RX_CON24_CSI0);
> +	}
> +}
> +
> +static void mtk_seninf_set_csi_mipi(struct mtk_seninf *priv,
> +				    unsigned int seninf)
> +{
> +	void *seninf_base = priv->base_reg;
> +	void *pseninf = priv->base_reg + 0x1000 * seninf;
> +	unsigned int dpcm = mtk_seninf_get_dpcm(priv);
> +	unsigned int data_lane_num = priv->sensor[priv->port].num_data_lanes;
> +	unsigned int cal_sel;
> +	unsigned int data_header_order = 1;
> +	unsigned int pad_sel = PAD_10BIT;
> +	unsigned int val = 0;
> +
> +	dev_dbg(priv->dev, "IS_4D1C %d port %d\n",
> +		is_4d1c(priv->port), priv->port);
> +
> +	switch (priv->port) {
> +	case CFG_CSI_PORT_1:
> +		cal_sel = 1;
> +		writel(0x7ffff8fe & readl(seninf_base +

Here, too.

> +			SENINF_TOP_PHY_SENINF_CTL_CSI1)	| 0x80000200
> +			, seninf_base + SENINF_TOP_PHY_SENINF_CTL_CSI1);
> +		break;
> +	case CFG_CSI_PORT_2:
> +		cal_sel = 2;
> +		writel(0x7ffff8fe & readl(seninf_base +
> +			SENINF_TOP_PHY_SENINF_CTL_CSI2)	| 0x80000200
> +			, seninf_base + SENINF_TOP_PHY_SENINF_CTL_CSI2);
> +		break;
> +	case CFG_CSI_PORT_0:
> +		cal_sel = 0;
> +		writel(0x7ffff8fe & readl(seninf_base +
> +			SENINF_TOP_PHY_SENINF_CTL_CSI0)	| 0x80000200
> +			, seninf_base + SENINF_TOP_PHY_SENINF_CTL_CSI0);
> +		break;
> +	case CFG_CSI_PORT_0A:
> +	case CFG_CSI_PORT_0B:
> +		cal_sel = 0;
> +		writel(0x7fffc8fe & readl(seninf_base +
> +			SENINF_TOP_PHY_SENINF_CTL_CSI0)	| 0x80001100
> +			, seninf_base + SENINF_TOP_PHY_SENINF_CTL_CSI0);
> +		break;
> +	}
> +
> +	/* First Enable Sensor interface and select pad (0x1a04_0200) */
> +	writel(readl(pseninf + SENINF1_CTRL) | 0x1
> +		, pseninf + SENINF1_CTRL);
> +	writel(0x8fffffff & readl(pseninf + SENINF1_CTRL) |
> +		(pad_sel << 28), pseninf + SENINF1_CTRL);
> +	writel(0xffff0fff & readl(pseninf + SENINF1_CTRL)
> +		, pseninf + SENINF1_CTRL);
> +	writel(0xffffff9f & readl(pseninf + SENINF1_CTRL_EXT) |
> +		0x40, pseninf + SENINF1_CTRL_EXT);
> +
> +	mtk_seninf_set_dphy(priv, seninf);
> +
> +	/* DPCM Enable */
> +	val = 1 << ((dpcm == 0x2a) ? 15 : ((dpcm & 0xF) + 7));
> +	writel(val, pseninf + SENINF1_CSI2_DPCM);
> +
> +	/* Settle delay */
> +	writel(0xffff00ff & readl(pseninf + SENINF1_CSI2_LNRD_TIMING) |
> +		(SENINF_SETTLE_DELAY << 8), pseninf + SENINF1_CSI2_LNRD_TIMING);
> +	/* CSI2 control */
> +	val = readl(pseninf + SENINF1_CSI2_CTL) | (data_header_order << 16) |
> +		0x10 | ((1 << data_lane_num) - 1);
> +	writel(val, pseninf + SENINF1_CSI2_CTL);
> +	writel(0xfffff3f8 & readl(pseninf + SENINF1_CSI2_RESYNC_MERGE_CTL) |
> +		0x3, pseninf + SENINF1_CSI2_RESYNC_MERGE_CTL);
> +	writel(0xfffff800 & readl(pseninf + SENINF1_CSI2_MODE)
> +		, pseninf + SENINF1_CSI2_MODE);
> +	writel(0x1dff00, pseninf + SENINF1_CSI2_DPHY_SYNC);
> +	writel(0xfffffffe & readl(pseninf + SENINF1_CSI2_SPARE0)
> +		, pseninf + SENINF1_CSI2_SPARE0);
> +	writel(0xf5ffff7f & readl(pseninf + SENINF1_CSI2_CTL) |
> +		0x2000000, pseninf + SENINF1_CSI2_CTL);
> +	writel(0xffffff00 & readl(pseninf + SENINF1_CSI2_HS_TRAIL) |
> +		SENINF_HS_TRAIL_PARAMETER, pseninf + SENINF1_CSI2_HS_TRAIL);
> +
> +	/* Set debug port to output packet number */
> +	writel(0x8000001A, pseninf + SENINF1_CSI2_DGB_SEL);
> +	/* Enable CSI2 IRQ mask */
> +	/* Turn on all interrupt */
> +	writel(0xffffffff, pseninf + SENINF1_CSI2_INT_EN);
> +	/* Write clear CSI2 IRQ */
> +	writel(0xffffffff, pseninf + SENINF1_CSI2_INT_STATUS);
> +	/* Enable CSI2 Extend IRQ mask */
> +	/* Turn on all interrupt */
> +	writel(0x0000001f, pseninf + SENINF1_CSI2_INT_EN_EXT);
> +	writel(0xffffff7f & readl(pseninf + SENINF1_CTRL) |
> +		0x80, pseninf + SENINF1_CTRL);
> +
> +	udelay(1);
> +	writel(0xffffff7f & readl(pseninf + SENINF1_CTRL)
> +		, pseninf + SENINF1_CTRL);
> +}
> +
> +static int mtk_seninf_power_on(struct mtk_seninf *priv)
> +{
> +	void *pseninf = priv->base_reg;
> +	struct device *dev = priv->dev;
> +	int seninf;
> +	int ret;
> +
> +	seninf = mtk_seninf_csi_port_to_seninf(priv->port);
> +	if (seninf < 0) {
> +		dev_err(dev, "seninf port mapping fail\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = pm_runtime_get_sync(priv->dev);
> +	if (ret < 0) {
> +		dev_err(priv->dev, "Failed to pm_runtime_get_sync: %d\n", ret);
> +		pm_runtime_put(priv->dev);

pm_runtime_put_noidle(priv->dev);

> +		return ret;
> +	}
> +
> +	/* Configure timestamp */
> +	writel(readl(pseninf + SENINF1_CTRL) | 0x1
> +		, pseninf + SENINF1_CTRL);
> +	writel(0xffffffbfU & readl(pseninf + SENINF1_CTRL_EXT) |
> +		0x40, pseninf + SENINF1_CTRL_EXT);
> +	writel(SENINF_TIMESTAMP_STEP, pseninf + SENINF_TG1_TM_STP);
> +
> +	mtk_seninf_set_csi_mipi(priv, (unsigned int)seninf);
> +
> +	mtk_seninf_set_mux(priv, (unsigned int)seninf);
> +
> +	writel(0x0, pseninf + SENINF_TOP_CAM_MUX_CTRL);
> +
> +	return 0;
> +}
> +
> +static void mtk_seninf_power_off(struct mtk_seninf *priv)
> +{
> +	void *pmipi_rx = priv->csi2_rx[priv->port];
> +	unsigned int seninf = mtk_seninf_csi_port_to_seninf(priv->port);
> +	void *pseninf = priv->base_reg + 0x1000 * seninf;
> +
> +	/* Disable CSI2(2.5G) first */
> +	writel(readl(pseninf + SENINF1_CSI2_CTL) & 0xFFFFFFE0
> +		, pseninf + SENINF1_CSI2_CTL);

Misplaced comma and there are more below. Please run checkpatch.pl on the
set.

> +	/* Disable mipi BG */
> +	switch (priv->port) {
> +	case CFG_CSI_PORT_0A:
> +		writel(0xfffffff3 & readl(pmipi_rx + MIPI_RX_ANA00_CSI0A)
> +			, pmipi_rx + MIPI_RX_ANA00_CSI0A);
> +		break;
> +	case CFG_CSI_PORT_0B:
> +		writel(0xfffffff3 & readl(pmipi_rx + MIPI_RX_ANA00_CSI0B)
> +			, pmipi_rx + MIPI_RX_ANA00_CSI0B);
> +		break;
> +	default:
> +		writel(0xfffffff3 & readl(pmipi_rx + MIPI_RX_ANA00_CSI0A)
> +			, pmipi_rx + MIPI_RX_ANA00_CSI0A);
> +		writel(0xfffffff3 & readl(pmipi_rx + MIPI_RX_ANA00_CSI0B)
> +			, pmipi_rx + MIPI_RX_ANA00_CSI0B);
> +		break;
> +	}
> +
> +	pm_runtime_put(priv->dev);
> +}
> +
> +static const struct v4l2_mbus_framefmt mtk_seninf_default_fmt = {
> +	.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +	.width = DEFAULT_WIDTH,
> +	.height = DEFAULT_HEIGHT,
> +	.field = V4L2_FIELD_NONE,
> +	.colorspace = V4L2_COLORSPACE_SRGB,
> +	.xfer_func = V4L2_XFER_FUNC_DEFAULT,
> +	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
> +	.quantization = V4L2_QUANTIZATION_DEFAULT,
> +};
> +
> +static void init_fmt(struct mtk_seninf *priv)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < NUM_PADS; i++)
> +		priv->fmt[i].format = mtk_seninf_default_fmt;
> +}
> +
> +static int seninf_init_cfg(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_pad_config *cfg)
> +{
> +	struct v4l2_mbus_framefmt *mf;
> +	unsigned int i;
> +
> +	for (i = 0; i < sd->entity.num_pads; i++) {
> +		mf = v4l2_subdev_get_try_format(sd, cfg, i);
> +		*mf = mtk_seninf_default_fmt;
> +	}
> +
> +	return 0;
> +}
> +
> +static int seninf_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct mtk_seninf *priv = container_of(sd, struct mtk_seninf, subdev);
> +
> +	if (fmt->format.code == ~0U || fmt->format.code == 0)
> +		fmt->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> +	} else {
> +		priv->fmt[fmt->pad].pad = fmt->pad;
> +		priv->fmt[fmt->pad].format.code = fmt->format.code;
> +		priv->fmt[fmt->pad].format.width = fmt->format.width;
> +		priv->fmt[fmt->pad].format.height = fmt->format.height;
> +	}
> +
> +	return 0;
> +}
> +
> +static int seninf_get_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct mtk_seninf *priv = container_of(sd, struct mtk_seninf, subdev);

Could you add an inline function to do this? Call it e.g. sd_to_mtk_seninf.

> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> +	} else {
> +		fmt->format.code = priv->fmt[fmt->pad].format.code;
> +		fmt->format.width = priv->fmt[fmt->pad].format.width;
> +		fmt->format.height = priv->fmt[fmt->pad].format.height;
> +		fmt->format.field = priv->fmt[fmt->pad].format.field;
> +		fmt->format.colorspace = priv->fmt[fmt->pad].format.colorspace;
> +		fmt->format.xfer_func = priv->fmt[fmt->pad].format.xfer_func;
> +		fmt->format.ycbcr_enc = priv->fmt[fmt->pad].format.ycbcr_enc;
> +		fmt->format.quantization =
> +			priv->fmt[fmt->pad].format.quantization;

Could you do a direct assignment?

> +	}
> +
> +	return 0;
> +}
> +
> +static int seninf_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_pad_config *cfg,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct mtk_seninf *priv = container_of(sd, struct mtk_seninf, subdev);
> +
> +	if (code->index >= NUM_PADS)
> +		return -EINVAL;

This check is wrong. code->index is the index to the enumeration, i.e. the
number of supported mbus code.

> +	code->code = priv->fmt[code->index].format.code;
> +
> +	return 0;
> +}
> +
> +static int seninf_s_stream(struct v4l2_subdev *sd, int on)
> +{
> +	struct mtk_seninf *priv = container_of(sd, struct mtk_seninf, subdev);
> +	int ret = 0;
> +
> +	if (on)
> +		ret = mtk_seninf_power_on(priv);

You can return here without assigning ret.

> +	else
> +		mtk_seninf_power_off(priv);

No need for else.

> +
> +	return ret;

And then return here.

> +};
> +
> +static const struct v4l2_subdev_pad_ops seninf_subdev_pad_ops = {
> +	.init_cfg = seninf_init_cfg,
> +	.set_fmt = seninf_set_fmt,
> +	.get_fmt = seninf_get_fmt,
> +	.enum_mbus_code = seninf_enum_mbus_code,

You're missing link_validate op here. Can you use
v4l2_subdev_link_validate_default?

> +};
> +
> +static const struct v4l2_subdev_video_ops seninf_subdev_video_ops = {
> +	.s_stream = seninf_s_stream,
> +};
> +
> +static struct v4l2_subdev_core_ops seninf_subdev_core_ops = {
> +	.subscribe_event    = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event	= v4l2_event_subdev_unsubscribe,
> +};
> +
> +static struct v4l2_subdev_ops seninf_subdev_ops = {
> +	.core	= &seninf_subdev_core_ops,
> +	.video	= &seninf_subdev_video_ops,
> +	.pad	= &seninf_subdev_pad_ops,
> +};
> +
> +static int seninf_link_setup(struct media_entity *entity,
> +			     const struct media_pad *local,
> +			     const struct media_pad *remote, u32 flags)
> +{
> +	struct v4l2_subdev *sd;
> +	struct mtk_seninf *priv;
> +	struct device *dev;
> +
> +	sd = media_entity_to_v4l2_subdev(entity);
> +	priv = v4l2_get_subdevdata(sd);
> +	dev = priv->dev;
> +	dev_dbg(dev, "mtk_seninf: remote %d-%d, local %d-%d\n"
> +		, remote->entity->graph_obj.id, remote->index
> +		, local->entity->graph_obj.id, local->index);

Don't begin a line with a comma, please.

IMO such debug messages would better be placed on the framework side.

> +	dev_dbg(dev, "local->flags %d flags %d\n", local->flags, flags);
> +
> +	if ((local->flags & MEDIA_PAD_FL_SOURCE) &&
> +	    (flags & MEDIA_LNK_FL_ENABLED)) {
> +		dev_dbg(dev, "set cam mux %d\n", local->index);
> +		priv->mux_sel = local->index - CAM_MUX_IDX_MIN;
> +	}
> +
> +	if ((local->flags & MEDIA_PAD_FL_SINK) &&
> +	    (flags & MEDIA_LNK_FL_ENABLED)) {
> +		dev_dbg(dev, "set sensor port\n", local->index);
> +		/* Select port */
> +		priv->port = local->index;
> +		if (priv->port >= NUM_SENSORS) {
> +			dev_err(dev, "port index is over number of ports\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct media_entity_operations seninf_media_ops = {
> +	.link_setup = seninf_link_setup,
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +struct sensor_async_subdev {
> +	struct v4l2_async_subdev asd;
> +	u32 port;
> +	u32 lanes;
> +};
> +
> +static int mtk_seninf_notifier_bound
> +			(struct v4l2_async_notifier *notifier,

Opening parenthesis to the same line as the function name.

> +			 struct v4l2_subdev *sd,
> +			 struct v4l2_async_subdev *asd)
> +{
> +	struct mtk_seninf *priv =
> +		container_of(notifier, struct mtk_seninf, notifier);
> +	struct sensor_async_subdev *s_asd =
> +		container_of(asd, struct sensor_async_subdev, asd);
> +	int ret;
> +
> +	dev_dbg(priv->dev, "%s bounded with port:%d lanes: %d\n",

"bound"

> +		sd->entity.name, s_asd->port, s_asd->lanes);
> +
> +	priv->sensor[s_asd->port].num_data_lanes = s_asd->lanes;
> +
> +	ret = media_create_pad_link(&sd->entity, 0, &priv->subdev.entity,
> +				    s_asd->port, 0);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to create link for %s\n",
> +			sd->entity.name);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations mtk_seninf_async_ops = {
> +	.bound = mtk_seninf_notifier_bound,
> +};
> +
> +static int mtk_seninf_fwnode_parse(struct device *dev,
> +				   struct v4l2_fwnode_endpoint *vep,
> +				   struct v4l2_async_subdev *asd)
> +{
> +	struct sensor_async_subdev *s_asd =
> +			container_of(asd, struct sensor_async_subdev, asd);
> +
> +	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
> +		dev_err(dev, "Only CSI2 bus type is currently supported\n");
> +		return -EINVAL;
> +	}
> +
> +	s_asd->port = vep->base.port;
> +	s_asd->lanes = vep->bus.mipi_csi2.num_data_lanes;
> +
> +	return 0;
> +}
> +
> +static int seninf_enable_test_pattern(struct mtk_seninf *priv, u32 pattern)
> +{
> +	void *pseninf = priv->base_reg;
> +	struct device *dev = priv->dev;
> +	unsigned int val;
> +
> +	switch (pattern) {
> +	case TEST_GEN_PATTERN:
> +		writel(0xC00, pseninf + SENINF_TOP_CTRL);
> +		writel(0x1001, pseninf + SENINF1_CTRL);
> +		writel(0x96DF1080, pseninf + SENINF1_MUX_CTRL);
> +	    writel(0x8000007F, pseninf + SENINF1_MUX_INTEN);

Alignment.

Please add #defines to document the bits of these registers. Same below.

> +		writel(0x0, pseninf + SENINF1_MUX_SPARE);
> +		writel(0xE2000, pseninf + SENINF1_MUX_CTRL_EXT);
> +		writel(0x0, pseninf + SENINF1_MUX_CTRL_EXT);
> +		writel(0x404C1, pseninf + SENINF_TG1_TM_CTL);
> +		val = (priv->fmt[priv->port].format.height + 0x100) << 16
> +			| priv->fmt[priv->port].format.width + 0x100;
> +		writel(val, pseninf + SENINF_TG1_TM_SIZE);
> +		writel(0x0, pseninf + SENINF_TG1_TM_CLK);
> +		writel(0x1, pseninf + SENINF_TG1_TM_STP);
> +		writel(readl(pseninf + SENINF1_CTRL_EXT) | 0x02
> +			, pseninf + SENINF1_CTRL_EXT);
> +		break;
> +	case TEST_DUMP_DEBUG_INFO:

You could use the LOG_STATUS IOCTL instead. If you can instead do this at a
particular point of time (start of streaming, for instance), even better.

> +		/* Sensor Interface Control */
> +		dev_dbg(dev,
> +			"SENINF_CSI2_CTL SENINF1:0x%x, 2:0x%x, 3:0x%x, 5:0x%x\n"
> +			, readl(pseninf + SENINF1_CSI2_CTL)
> +			, readl(pseninf + SENINF2_CSI2_CTL)
> +			, readl(pseninf + SENINF3_CSI2_CTL)
> +			, readl(pseninf + SENINF5_CSI2_CTL));
> +		/* Read width/height */
> +		/* Read interrupt status */
> +		dev_dbg(dev, "SENINF1_IRQ:0x%x, 2:0x%x, 3:0x%x, 5:0x%x\n"
> +			, readl(pseninf + SENINF1_CSI2_INT_STATUS)
> +			, readl(pseninf + SENINF2_CSI2_INT_STATUS)
> +			, readl(pseninf + SENINF3_CSI2_INT_STATUS)
> +			, readl(pseninf + SENINF5_CSI2_INT_STATUS));
> +		/* Mux1 */
> +		dev_dbg(dev, "SENINF1_MUX_CTRL:0x%x, INTSTA:0x%x, DEBUG_2(0x%x)\n",
> +			readl(pseninf + SENINF1_MUX_CTRL),
> +			readl(pseninf + SENINF1_MUX_INTSTA),
> +			readl(pseninf + SENINF1_MUX_DEBUG_2));
> +		if (readl(pseninf + SENINF1_MUX_INTSTA) & 0x1) {
> +			writel(0xffffffff, pseninf + SENINF1_MUX_INTSTA);
> +			usleep_range(1000, 1000 * 2);
> +			dev_warn(dev, "overrun CTRL:%x INTSTA:%x DEBUG_2:%x\n"
> +				, readl(pseninf + SENINF1_MUX_CTRL)
> +				, readl(pseninf + SENINF1_MUX_INTSTA)
> +				, readl(pseninf + SENINF1_MUX_DEBUG_2));
> +		}
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int seninf_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mtk_seninf *priv = container_of(ctrl->handler,
> +					     struct mtk_seninf, ctrl_handler);
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		return seninf_enable_test_pattern(priv, ctrl->val);

Please move the remaining content from seninf_enable_test_pattern here.

> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops seninf_ctrl_ops = {
> +	.s_ctrl = seninf_set_ctrl,
> +};
> +
> +static const char * const seninf_test_pattern_menu[] = {
> +	"Horizontal bars",
> +	"Monitor status",
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
> +	v4l2_ctrl_new_std_menu_items(handler, &seninf_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(seninf_test_pattern_menu) - 1,
> +				     0, 0, seninf_test_pattern_menu);
> +
> +	if (handler->error) {
> +		ret = handler->error;
> +		dev_err(priv->dev,
> +			"Failed to init controls(%d)\n", ret);
> +		goto err_free_handler;
> +	}
> +
> +	priv->subdev.ctrl_handler = handler;
> +	return 0;
> +
> +err_free_handler:
> +	v4l2_ctrl_handler_free(handler);
> +
> +	return ret;
> +}
> +
> +static int mtk_seninf_media_register(struct mtk_seninf *priv)
> +{
> +	struct v4l2_subdev *sd = &priv->subdev;
> +	struct media_pad *pads = priv->pads;
> +	struct device *dev = priv->dev;
> +	int i;
> +	int ret;
> +
> +	v4l2_subdev_init(sd, &seninf_subdev_ops);
> +
> +	init_fmt(priv);
> +	ret = seninf_initialize_controls(priv);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize controls\n");
> +		return ret;
> +	}
> +
> +	sd->flags |= (V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS);
> +
> +	priv->subdev.dev = dev;
> +	snprintf(sd->name, V4L2_SUBDEV_NAME_SIZE, "%s",
> +		 dev_name(dev));
> +	v4l2_set_subdevdata(sd, priv);
> +
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->entity.ops = &seninf_media_ops;
> +
> +	for (i = 0; i < NUM_SENSORS; i++)
> +		pads[i].flags = MEDIA_PAD_FL_SINK;
> +
> +	for (i = CAM_MUX_IDX_MIN; i < NUM_PADS; i++)
> +		pads[i].flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&sd->entity, NUM_PADS, pads);
> +	if (ret < 0)
> +		goto err_free_handler;
> +
> +	v4l2_async_notifier_init(&priv->notifier);
> +	for (i = 0; i < NUM_SENSORS; ++i) {
> +		ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port
> +			(dev, &priv->notifier, sizeof(struct sensor_async_subdev)
> +			, i, mtk_seninf_fwnode_parse);

Please see e.g. the omap3isp or ipu3-cio2 driver for an example on the
preferred way to parse information from firmware.

> +		if (ret < 0)
> +			goto err_clean_entity;
> +	}
> +
> +	priv->subdev.subdev_notifier = &priv->notifier;
> +	priv->notifier.ops = &mtk_seninf_async_ops;
> +	ret = v4l2_async_subdev_notifier_register(sd, &priv->notifier);
> +	if (ret < 0) {
> +		dev_err(dev, "v4l2 async notifier register failed\n");
> +		goto err_clean_notififer;
> +	}
> +
> +	ret = v4l2_async_register_subdev(sd);
> +	if (ret < 0) {
> +		dev_err(dev, "v4l2 async register subdev failed\n");
> +		goto err_clean_notififer;
> +	}
> +	return 0;
> +
> +err_clean_notififer:
> +	v4l2_async_notifier_cleanup(&priv->notifier);
> +err_clean_entity:
> +	media_entity_cleanup(&sd->entity);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> +
> +	return ret;
> +}
> +
> +static int seninf_probe(struct platform_device *pdev)
> +{
> +	/* List of clocks required by seninf */
> +	static const char * const clk_names[] = {
> +		"CLK_CAM_SENINF", "CLK_TOP_MUX_SENINF"
> +	};
> +	struct resource *res;
> +	struct mtk_seninf *priv;
> +	struct device *dev = &pdev->dev;
> +	int i, ret;
> +
> +	dev_err(dev, "seninf probe +\n");

Please remove.

> +
> +	priv = devm_kzalloc(dev, sizeof(struct mtk_seninf), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	memset(priv, 0, sizeof(struct mtk_seninf));

The memory was already set to zero by devm_kzalloc().

> +
> +	dev_set_drvdata(dev, priv);
> +	priv->dev = dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->base_reg = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->base_reg))
> +		return PTR_ERR(priv->base_reg);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	priv->rx_reg = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->rx_reg))
> +		return PTR_ERR(priv->rx_reg);
> +
> +	priv->csi2_rx[CFG_CSI_PORT_0]  = priv->rx_reg;
> +	priv->csi2_rx[CFG_CSI_PORT_0A] = priv->rx_reg;

The same base address but a different port?

> +	priv->csi2_rx[CFG_CSI_PORT_0B] = priv->rx_reg + 0x1000;

Please add #defines for these offsets.

> +	priv->csi2_rx[CFG_CSI_PORT_1]  = priv->rx_reg + 0x2000;
> +	priv->csi2_rx[CFG_CSI_PORT_2]  = priv->rx_reg + 0x4000;
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
> +	if (ret) {
> +		dev_err(dev, "failed to get seninf clock:%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mtk_seninf_media_register(priv);
> +
> +	pm_runtime_enable(dev);

You probably don't want to do this if the previous operation failed.

> +	dev_info(dev, "seninf probe -\n");

Please remove.

> +
> +	return ret;
> +}
> +
> +static int seninf_pm_suspend(struct device *dev)
> +{
> +	struct mtk_seninf *priv = dev_get_drvdata(dev);
> +
> +	dev_dbg(dev, "seninf runtime suspend\n");
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
> +	dev_dbg(dev, "seninf runtime resume\n");
> +	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clock:%d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops runtime_pm_ops = {
> +	SET_RUNTIME_PM_OPS(seninf_pm_suspend, seninf_pm_resume, NULL)
> +};
> +
> +static int seninf_remove(struct platform_device *pdev)
> +{
> +	struct mtk_seninf *priv = dev_get_drvdata(&pdev->dev);
> +	struct v4l2_subdev *subdev = &priv->subdev;
> +
> +	media_entity_cleanup(&subdev->entity);
> +	v4l2_async_unregister_subdev(subdev);
> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> +
> +	pm_runtime_disable(priv->dev);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id mtk_seninf_of_match[] = {
> +	{.compatible = "mediatek,mt8183-seninf"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_seninf_of_match);
> +#endif
> +
> +static struct platform_driver seninf_pdrv = {
> +	.driver	= {
> +		.name	= "seninf",
> +		.pm  = &runtime_pm_ops,
> +		.of_match_table = of_match_ptr(mtk_seninf_of_match),
> +	},
> +	.probe	= seninf_probe,
> +	.remove	= seninf_remove,
> +};
> +
> +module_platform_driver(seninf_pdrv);
> +
> +MODULE_DESCRIPTION("MTK seninf driver");
> +MODULE_AUTHOR("Louis Kuo <louis.kuo@mediatek.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("MTK:mtk_seninf");
> diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
> new file mode 100644
> index 000000000000..f2c0ea7c9800
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __SENINF_DRV_DEF_H__
> +#define __SENINF_DRV_DEF_H__
> +
> +#define SENINF_TIMESTAMP_STEP		0x67
> +#define SENINF_SETTLE_DELAY		0x15
> +#define SENINF_HS_TRAIL_PARAMETER	0x8
> +
> +#define NUM_PADS			12
> +#define NUM_SENSORS			4
> +#define CAM_MUX_IDX_MIN		NUM_SENSORS
> +#define DEFAULT_WIDTH			1600
> +#define DEFAULT_HEIGHT			1200
> +
> +#define PAD_10BIT			0
> +
> +enum {
> +	TEST_GEN_PATTERN = 0x0,
> +	TEST_DUMP_DEBUG_INFO,
> +};
> +
> +enum {
> +	CFG_CSI_PORT_0 = 0x0,	/* 4D1C */
> +	CFG_CSI_PORT_1,		/* 4D1C */
> +	CFG_CSI_PORT_2,		/* 4D1C */
> +	CFG_CSI_PORT_0A,	/* 2D1C */
> +	CFG_CSI_PORT_0B,	/* 2D1C */
> +	CFG_CSI_PORT_MAX_NUM,
> +	CFG_CSI_PORT_NONE	/*for non-MIPI sensor */
> +};
> +
> +enum {
> +	ONE_PIXEL_MODE  = 0x0,
> +	TWO_PIXEL_MODE  = 0x1,
> +	FOUR_PIXEL_MODE = 0x2,
> +};
> +
> +enum {
> +	SENINF_1 = 0x0,
> +	SENINF_2 = 0x1,
> +	SENINF_3 = 0x2,
> +	SENINF_4 = 0x3,
> +	SENINF_5 = 0x4,
> +	SENINF_NUM,
> +};
> +
> +enum {
> +	RAW_8BIT_FMT        = 0x0,
> +	RAW_10BIT_FMT       = 0x1,
> +	RAW_12BIT_FMT       = 0x2,
> +	YUV422_FMT          = 0x3,
> +	RAW_14BIT_FMT       = 0x4,
> +	RGB565_MIPI_FMT     = 0x5,
> +	RGB888_MIPI_FMT     = 0x6,
> +	JPEG_FMT            = 0x7
> +};
> +
> +#endif /*__SENINF_DRV_DEF_H__ */
> diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h
> new file mode 100644
> index 000000000000..5f7e10916f35
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h
> @@ -0,0 +1,853 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _SENINF_REG_H_
> +#define _SENINF_REG_H_
> +
> +/* 0x11c80000..0x11c850ac */
> +#define MIPI_RX_ANA00_CSI0A           0x0000
> +#define MIPI_RX_ANA04_CSI0A           0x0004
> +#define MIPI_RX_ANA08_CSI0A           0x0008
> +#define MIPI_RX_ANA0C_CSI0A           0x000C
> +#define MIPI_RX_ANA10_CSI0A           0x0010
> +#define MIPI_RX_ANA14_CSI0A           0x0014
> +#define MIPI_RX_ANA18_CSI0A           0x0018
> +#define MIPI_RX_ANA1C_CSI0A           0x001C
> +#define MIPI_RX_ANA20_CSI0A           0x0020
> +#define MIPI_RX_ANA24_CSI0A           0x0024
> +#define MIPI_RX_ANA28_CSI0A           0x0028
> +#define MIPI_RX_ANA2C_CSI0A           0x002C
> +#define MIPI_RX_ANA34_CSI0A           0x0034
> +#define MIPI_RX_ANA38_CSI0A           0x0038
> +#define MIPI_RX_ANA40_CSI0A           0x0040
> +#define MIPI_RX_ANA48_CSI0A           0x0048
> +#define MIPI_RX_WRAPPER80_CSI0A       0x0080
> +#define MIPI_RX_WRAPPER84_CSI0A       0x0084
> +#define MIPI_RX_WRAPPER88_CSI0A       0x0088
> +#define MIPI_RX_WRAPPER8C_CSI0A       0x008C
> +#define MIPI_RX_WRAPPER90_CSI0A       0x0090
> +#define MIPI_RX_WRAPPER94_CSI0A       0x0094
> +#define MIPI_RX_WRAPPER98_CSI0A       0x0098
> +#define MIPI_RX_WRAPPER9C_CSI0A       0x009C
> +#define MIPI_RX_ANAA4_CSI0A           0x00A4
> +#define MIPI_RX_ANAA8_CSI0A           0x00A8
> +#define MIPI_RX_ANA00_CSI0B           0x1000
> +#define MIPI_RX_ANA04_CSI0B           0x1004
> +#define MIPI_RX_ANA08_CSI0B           0x1008
> +#define MIPI_RX_ANA0C_CSI0B           0x100C
> +#define MIPI_RX_ANA10_CSI0B           0x1010
> +#define MIPI_RX_ANA14_CSI0B           0x1014
> +#define MIPI_RX_ANA18_CSI0B           0x1018
> +#define MIPI_RX_ANA1C_CSI0B           0x101C
> +#define MIPI_RX_ANA20_CSI0B           0x1020
> +#define MIPI_RX_ANA24_CSI0B           0x1024
> +#define MIPI_RX_ANA28_CSI0B           0x1028
> +#define MIPI_RX_ANA2C_CSI0B           0x102C
> +#define MIPI_RX_ANA34_CSI0B           0x1034
> +#define MIPI_RX_ANA38_CSI0B           0x1038
> +#define MIPI_RX_ANA48_CSI0B           0x1048
> +#define MIPI_RX_WRAPPER80_CSI0B       0x1080
> +#define MIPI_RX_WRAPPER84_CSI0B       0x1084
> +#define MIPI_RX_WRAPPER88_CSI0B       0x1088
> +#define MIPI_RX_WRAPPER8C_CSI0B       0x108C
> +#define MIPI_RX_WRAPPER90_CSI0B       0x1090
> +#define MIPI_RX_WRAPPER94_CSI0B       0x1094
> +#define MIPI_RX_WRAPPER98_CSI0B       0x1098
> +#define MIPI_RX_WRAPPER9C_CSI0B       0x109C
> +#define MIPI_RX_ANAA4_CSI0B           0x10A4
> +#define MIPI_RX_ANAA8_CSI0B           0x10A8
> +#define MIPI_RX_ANA00_CSI1A           0x2000
> +#define MIPI_RX_ANA04_CSI1A           0x2004
> +#define MIPI_RX_ANA08_CSI1A           0x2008
> +#define MIPI_RX_ANA0C_CSI1A           0x200C
> +#define MIPI_RX_ANA10_CSI1A           0x2010
> +#define MIPI_RX_ANA18_CSI1A           0x2018
> +#define MIPI_RX_ANA1C_CSI1A           0x201C
> +#define MIPI_RX_ANA24_CSI1A           0x2024
> +#define MIPI_RX_ANA48_CSI1A           0x2048
> +#define MIPI_RX_WRAPPER80_CSI1A       0x2080
> +#define MIPI_RX_WRAPPER84_CSI1A       0x2084
> +#define MIPI_RX_WRAPPER88_CSI1A       0x2088
> +#define MIPI_RX_WRAPPER8C_CSI1A       0x208C
> +#define MIPI_RX_WRAPPER90_CSI1A       0x2090
> +#define MIPI_RX_WRAPPER94_CSI1A       0x2094
> +#define MIPI_RX_WRAPPER98_CSI1A       0x2098
> +#define MIPI_RX_WRAPPER9C_CSI1A       0x209C
> +#define MIPI_RX_ANAA4_CSI1A           0x20A4
> +#define MIPI_RX_ANAA8_CSI1A           0x20A8
> +#define MIPI_RX_ANA00_CSI1B           0x3000
> +#define MIPI_RX_ANA04_CSI1B           0x3004
> +#define MIPI_RX_ANA08_CSI1B           0x3008
> +#define MIPI_RX_ANA0C_CSI1B           0x300C
> +#define MIPI_RX_ANA10_CSI1B           0x3010
> +#define MIPI_RX_ANA18_CSI1B           0x3018
> +#define MIPI_RX_ANA1C_CSI1B           0x301C
> +#define MIPI_RX_ANA24_CSI1B           0x3024
> +#define MIPI_RX_ANA48_CSI1B           0x3048
> +#define MIPI_RX_WRAPPER80_CSI1B       0x3080
> +#define MIPI_RX_WRAPPER84_CSI1B       0x3084
> +#define MIPI_RX_WRAPPER88_CSI1B       0x3088
> +#define MIPI_RX_WRAPPER8C_CSI1B       0x308C
> +#define MIPI_RX_WRAPPER90_CSI1B       0x3090
> +#define MIPI_RX_WRAPPER94_CSI1B       0x3094
> +#define MIPI_RX_WRAPPER98_CSI1B       0x3098
> +#define MIPI_RX_WRAPPER9C_CSI1B       0x309C
> +#define MIPI_RX_ANAA4_CSI1B           0x30A4
> +#define MIPI_RX_ANAA8_CSI1B           0x30A8
> +#define MIPI_RX_ANA00_CSI2A           0x4000
> +#define MIPI_RX_ANA04_CSI2A           0x4004
> +#define MIPI_RX_ANA08_CSI2A           0x4008
> +#define MIPI_RX_ANA0C_CSI2A           0x400C
> +#define MIPI_RX_ANA10_CSI2A           0x4010
> +#define MIPI_RX_ANA18_CSI2A           0x4018
> +#define MIPI_RX_ANA1C_CSI2A           0x401C
> +#define MIPI_RX_ANA24_CSI2A           0x4024
> +#define MIPI_RX_ANA48_CSI2A           0x4048
> +#define MIPI_RX_WRAPPER80_CSI2A       0x4080
> +#define MIPI_RX_WRAPPER84_CSI2A       0x4084
> +#define MIPI_RX_WRAPPER88_CSI2A       0x4088
> +#define MIPI_RX_WRAPPER8C_CSI2A       0x408C
> +#define MIPI_RX_WRAPPER90_CSI2A       0x4090
> +#define MIPI_RX_WRAPPER94_CSI2A       0x4094
> +#define MIPI_RX_WRAPPER98_CSI2A       0x4098
> +#define MIPI_RX_WRAPPER9C_CSI2A       0x409C
> +#define MIPI_RX_ANAA4_CSI2A           0x40A4
> +#define MIPI_RX_ANAA8_CSI2A           0x40A8
> +#define MIPI_RX_ANA00_CSI2B           0x5000
> +#define MIPI_RX_ANA04_CSI2B           0x5004
> +#define MIPI_RX_ANA08_CSI2B           0x5008
> +#define MIPI_RX_ANA0C_CSI2B           0x500C
> +#define MIPI_RX_ANA10_CSI2B           0x5010
> +#define MIPI_RX_ANA18_CSI2B           0x5018
> +#define MIPI_RX_ANA1C_CSI2B           0x501C
> +#define MIPI_RX_ANA24_CSI2B           0x5024
> +#define MIPI_RX_ANA48_CSI2B           0x5048
> +#define MIPI_RX_WRAPPER80_CSI2B       0x5080
> +#define MIPI_RX_WRAPPER84_CSI2B       0x5084
> +#define MIPI_RX_WRAPPER88_CSI2B       0x5088
> +#define MIPI_RX_WRAPPER8C_CSI2B       0x508C
> +#define MIPI_RX_WRAPPER90_CSI2B       0x5090
> +#define MIPI_RX_WRAPPER94_CSI2B       0x5094
> +#define MIPI_RX_WRAPPER98_CSI2B       0x5098
> +#define MIPI_RX_WRAPPER9C_CSI2B       0x509C
> +#define MIPI_RX_ANAA4_CSI2B           0x50A4
> +#define MIPI_RX_ANAA8_CSI2B           0x50A8
> +
> +/* 0x1a040000..0x1a047d40 */
> +#define SENINF_TOP_CTRL                        0x0000
> +#define SENINF_TOP_CMODEL_PAR                  0x0004
> +#define SENINF_TOP_MUX_CTRL                    0x0008
> +#define SENINF_TOP_CAM_MUX_CTRL                0x0010
> +#define SENINF_TOP_N3D_A_CTL                   0x0014
> +#define SENINF_TOP_N3D_B_CTL                   0x0018
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0         0x001C
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1         0x0020
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2         0x0024
> +#define SENINF_N3D_A_CTL                       0x0100
> +#define SENINF_N3D_A_POS                       0x0104
> +#define SENINF_N3D_A_TRIG                      0x0108
> +#define SENINF_N3D_A_INT                       0x010C
> +#define SENINF_N3D_A_CNT0                      0x0110
> +#define SENINF_N3D_A_CNT1                      0x0114
> +#define SENINF_N3D_A_DBG                       0x0118
> +#define SENINF_N3D_A_DIFF_THR                  0x011C
> +#define SENINF_N3D_A_DIFF_CNT                  0x0120
> +#define SENINF_N3D_A_DBG_1                     0x0124
> +#define SENINF_N3D_A_VALID_TG_CNT              0x0128
> +#define SENINF_N3D_A_SYNC_A_PERIOD             0x012C
> +#define SENINF_N3D_A_SYNC_B_PERIOD             0x0130
> +#define SENINF_N3D_A_SYNC_A_PULSE_LEN          0x0134
> +#define SENINF_N3D_A_SYNC_B_PULSE_LEN          0x0138
> +#define SENINF_N3D_A_SUB_CNT                   0x013C
> +#define SENINF_N3D_A_VSYNC_CNT                 0x0140
> +#define SENINF1_CTRL                           0x0200
> +#define SENINF1_CTRL_EXT                       0x0204
> +#define SENINF1_ASYNC_CTRL                     0x0208
> +#define SENINF_TG1_PH_CNT                      0x0600
> +#define SENINF_TG1_SEN_CK                      0x0604
> +#define SENINF_TG1_TM_CTL                      0x0608
> +#define SENINF_TG1_TM_SIZE                     0x060C
> +#define SENINF_TG1_TM_CLK                      0x0610
> +#define SENINF_TG1_TM_STP                      0x0614
> +#define MIPI_RX_CON24_CSI0                     0x0824
> +#define MIPI_RX_CON28_CSI0                     0x0828
> +#define MIPI_RX_CON34_CSI0                     0x0834
> +#define MIPI_RX_CON38_CSI0                     0x0838
> +#define MIPI_RX_CON3C_CSI0                     0x083C
> +#define MIPI_RX_CON7C_CSI0                     0x087C
> +#define MIPI_RX_CON80_CSI0                     0x0880
> +#define MIPI_RX_CON84_CSI0                     0x0884
> +#define MIPI_RX_CON88_CSI0                     0x0888
> +#define MIPI_RX_CON8C_CSI0                     0x088C
> +#define MIPI_RX_CON90_CSI0                     0x0890
> +#define MIPI_RX_CON94_CSI0                     0x0894
> +#define MIPI_RX_CON98_CSI0                     0x0898
> +#define MIPI_RX_CONA0_CSI0                     0x08A0
> +#define MIPI_RX_CONB0_CSI0                     0x08B0
> +#define MIPI_RX_CONB4_CSI0                     0x08B4
> +#define MIPI_RX_CONB8_CSI0                     0x08B8
> +#define MIPI_RX_CONBC_CSI0                     0x08BC
> +#define MIPI_RX_CONC0_CSI0                     0x08C0
> +#define MIPI_RX_CONC4_CSI0                     0x08C4
> +#define MIPI_RX_CONC8_CSI0                     0x08C8
> +#define MIPI_RX_CONCC_CSI0                     0x08CC
> +#define MIPI_RX_COND0_CSI0                     0x08D0
> +#define SENINF1_CSI2_CTL                       0x0A00
> +#define SENINF1_CSI2_LNRC_TIMING               0x0A04
> +#define SENINF1_CSI2_LNRD_TIMING               0x0A08
> +#define SENINF1_CSI2_DPCM                      0x0A0C
> +#define SENINF1_CSI2_INT_EN                    0x0A10
> +#define SENINF1_CSI2_INT_STATUS                0x0A14
> +#define SENINF1_CSI2_DGB_SEL                   0x0A18
> +#define SENINF1_CSI2_DBG_PORT                  0x0A1C
> +#define SENINF1_CSI2_SPARE0                    0x0A20
> +#define SENINF1_CSI2_SPARE1                    0x0A24
> +#define SENINF1_CSI2_LNRC_FSM                  0x0A28
> +#define SENINF1_CSI2_LNRD_FSM                  0x0A2C
> +#define SENINF1_CSI2_FRAME_LINE_NUM            0x0A30
> +#define SENINF1_CSI2_GENERIC_SHORT             0x0A34
> +#define SENINF1_CSI2_HSRX_DBG                  0x0A38
> +#define SENINF1_CSI2_DI                        0x0A3C
> +#define SENINF1_CSI2_HS_TRAIL                  0x0A40
> +#define SENINF1_CSI2_DI_CTRL                   0x0A44
> +#define SENINF1_CSI2_DETECT_CON1               0x0A4C
> +#define SENINF1_CSI2_DETECT_CON2               0x0A50
> +#define SENINF1_CSI2_DETECT_CON3               0x0A54
> +#define SENINF1_CSI2_RLR0_CON0                 0x0A58
> +#define SENINF1_CSI2_RLR1_CON0                 0x0A5C
> +#define SENINF1_CSI2_RLR2_CON0                 0x0A60
> +#define SENINF1_CSI2_RLR_CON0                  0x0A64
> +#define SENINF1_CSI2_MUX_CON                   0x0A68
> +#define SENINF1_CSI2_DETECT_DBG0               0x0A6C
> +#define SENINF1_CSI2_DETECT_DBG1               0x0A70
> +#define SENINF1_CSI2_RESYNC_MERGE_CTL          0x0A74
> +#define SENINF1_CSI2_CTRL_TRIO_MUX             0x0A78
> +#define SENINF1_CSI2_CTRL_TRIO_CON             0x0A7C
> +#define SENINF1_FIX_ADDR_CPHY0_DBG             0x0A80
> +#define SENINF1_FIX_ADDR_CPHY1_DBG             0x0A84
> +#define SENINF1_FIX_ADDR_CPHY2_DBG             0x0A88
> +#define SENINF1_FIX_ADDR_DBG                   0x0A8C
> +#define SENINF1_WIRE_STATE_DECODE_CPHY0_DBG0   0x0A90
> +#define SENINF1_WIRE_STATE_DECODE_CPHY0_DBG1   0x0A94
> +#define SENINF1_WIRE_STATE_DECODE_CPHY1_DBG0   0x0A98
> +#define SENINF1_WIRE_STATE_DECODE_CPHY1_DBG1   0x0A9C
> +#define SENINF1_WIRE_STATE_DECODE_CPHY2_DBG0   0x0AA0
> +#define SENINF1_WIRE_STATE_DECODE_CPHY2_DBG1   0x0AA4
> +#define SENINF1_SYNC_RESYNC_CTL                0x0AA8
> +#define SENINF1_POST_DETECT_CTL                0x0AAC
> +#define SENINF1_WIRE_STATE_DECODE_CONFIG       0x0AB0
> +#define SENINF1_CSI2_CPHY_LNRD_FSM             0x0AB4
> +#define SENINF1_FIX_ADDR_CPHY0_DBG0            0x0AB8
> +#define SENINF1_FIX_ADDR_CPHY0_DBG1            0x0ABC
> +#define SENINF1_FIX_ADDR_CPHY0_DBG2            0x0AC0
> +#define SENINF1_FIX_ADDR_CPHY1_DBG0            0x0AC4
> +#define SENINF1_FIX_ADDR_CPHY1_DBG1            0x0AC8
> +#define SENINF1_FIX_ADDR_CPHY1_DBG2            0x0ACC
> +#define SENINF1_FIX_ADDR_CPHY2_DBG0            0x0AD0
> +#define SENINF1_FIX_ADDR_CPHY2_DBG1            0x0AD4
> +#define SENINF1_FIX_ADDR_CPHY2_DBG2            0x0AD8
> +#define SENINF1_FIX_ADDR_DBG0                  0x0ADC
> +#define SENINF1_FIX_ADDR_DBG1                  0x0AE0
> +#define SENINF1_FIX_ADDR_DBG2                  0x0AE4
> +#define SENINF1_CSI2_MODE                      0x0AE8
> +#define SENINF1_CSI2_DI_EXT                    0x0AF0
> +#define SENINF1_CSI2_DI_CTRL_EXT               0x0AF4
> +#define SENINF1_CSI2_CPHY_LOOPBACK             0x0AF8
> +#define SENINF1_CSI2_PROGSEQ_0                 0x0B00
> +#define SENINF1_CSI2_PROGSEQ_1                 0x0B04
> +#define SENINF1_CSI2_INT_EN_EXT                0x0B10
> +#define SENINF1_CSI2_INT_STATUS_EXT            0x0B14
> +#define SENINF1_CSI2_CPHY_FIX_POINT_RST        0x0B18
> +#define SENINF1_CSI2_RLR3_CON0                 0x0B1C
> +#define SENINF1_CSI2_DPHY_SYNC                 0x0B20
> +#define SENINF1_CSI2_DESKEW_SYNC               0x0B24
> +#define SENINF1_CSI2_DETECT_DBG2               0x0B28
> +#define SENINF1_FIX_ADDR_CPHY3_DBG0            0x0B30
> +#define SENINF1_FIX_ADDR_CPHY3_DBG1            0x0B34
> +#define SENINF1_FIX_ADDR_CPHY3_DBG2            0x0B38
> +#define SENINF1_CSI2_DI_EXT_2                  0x0B3C
> +#define SENINF1_CSI2_DI_CTRL_EXT_2             0x0B40
> +#define SENINF1_WIRE_STATE_DECODE_CPHY3_DBG0   0x0B44
> +#define SENINF1_WIRE_STATE_DECODE_CPHY3_DBG1   0x0B48
> +#define SENINF1_MUX_CTRL                       0x0D00
> +#define SENINF1_MUX_INTEN                      0x0D04
> +#define SENINF1_MUX_INTSTA                     0x0D08
> +#define SENINF1_MUX_SIZE                       0x0D0C
> +#define SENINF1_MUX_DEBUG_1                    0x0D10
> +#define SENINF1_MUX_DEBUG_2                    0x0D14
> +#define SENINF1_MUX_DEBUG_3                    0x0D18
> +#define SENINF1_MUX_DEBUG_4                    0x0D1C
> +#define SENINF1_MUX_DEBUG_5                    0x0D20
> +#define SENINF1_MUX_DEBUG_6                    0x0D24
> +#define SENINF1_MUX_DEBUG_7                    0x0D28
> +#define SENINF1_MUX_SPARE                      0x0D2C
> +#define SENINF1_MUX_DATA                       0x0D30
> +#define SENINF1_MUX_DATA_CNT                   0x0D34
> +#define SENINF1_MUX_CROP                       0x0D38
> +#define SENINF1_MUX_CTRL_EXT                   0x0D3C
> +#define SENINF_N3D_B_CTL                       0x1100
> +#define SENINF_N3D_B_POS                       0x1104
> +#define SENINF_N3D_B_TRIG                      0x1108
> +#define SENINF_N3D_B_INT                       0x110C
> +#define SENINF_N3D_B_CNT0                      0x1110
> +#define SENINF_N3D_B_CNT1                      0x1114
> +#define SENINF_N3D_B_DBG                       0x1118
> +#define SENINF_N3D_B_DIFF_THR                  0x111C
> +#define SENINF_N3D_B_DIFF_CNT                  0x1120
> +#define SENINF_N3D_B_DBG_1                     0x1124
> +#define SENINF_N3D_B_VALID_TG_CNT              0x1128
> +#define SENINF_N3D_B_SYNC_A_PERIOD             0x112C
> +#define SENINF_N3D_B_SYNC_B_PERIOD             0x1130
> +#define SENINF_N3D_B_SYNC_A_PULSE_LEN          0x1134
> +#define SENINF_N3D_B_SYNC_B_PULSE_LEN          0x1138
> +#define SENINF_N3D_B_SUB_CNT                   0x113C
> +#define SENINF_N3D_B_VSYNC_CNT                 0x1140
> +#define SENINF2_CTRL                           0x1200
> +#define SENINF2_CTRL_EXT                       0x1204
> +#define SENINF2_ASYNC_CTRL                     0x1208
> +#define SENINF_TG2_PH_CNT                      0x1600
> +#define SENINF_TG2_SEN_CK                      0x1604
> +#define SENINF_TG2_TM_CTL                      0x1608
> +#define SENINF_TG2_TM_SIZE                     0x160C
> +#define SENINF_TG2_TM_CLK                      0x1610
> +#define SENINF_TG2_TM_STP                      0x1614
> +#define MIPI_RX_CON24_CSI1                     0x1824
> +#define MIPI_RX_CON28_CSI1                     0x1828
> +#define MIPI_RX_CON34_CSI1                     0x1834
> +#define MIPI_RX_CON38_CSI1                     0x1838
> +#define MIPI_RX_CON3C_CSI1                     0x183C
> +#define MIPI_RX_CON7C_CSI1                     0x187C
> +#define MIPI_RX_CON80_CSI1                     0x1880
> +#define MIPI_RX_CON84_CSI1                     0x1884
> +#define MIPI_RX_CON88_CSI1                     0x1888
> +#define MIPI_RX_CON8C_CSI1                     0x188C
> +#define MIPI_RX_CON90_CSI1                     0x1890
> +#define MIPI_RX_CON94_CSI1                     0x1894
> +#define MIPI_RX_CON98_CSI1                     0x1898
> +#define MIPI_RX_CONA0_CSI1                     0x18A0
> +#define MIPI_RX_CONB0_CSI1                     0x18B0
> +#define MIPI_RX_CONB4_CSI1                     0x18B4
> +#define MIPI_RX_CONB8_CSI1                     0x18B8
> +#define MIPI_RX_CONBC_CSI1                     0x18BC
> +#define MIPI_RX_CONC0_CSI1                     0x18C0
> +#define MIPI_RX_CONC4_CSI1                     0x18C4
> +#define MIPI_RX_CONC8_CSI1                     0x18C8
> +#define MIPI_RX_CONCC_CSI1                     0x18CC
> +#define MIPI_RX_COND0_CSI1                     0x18D0
> +#define SENINF2_CSI2_CTL                       0x1A00
> +#define SENINF2_CSI2_LNRC_TIMING               0x1A04
> +#define SENINF2_CSI2_LNRD_TIMING               0x1A08
> +#define SENINF2_CSI2_DPCM                      0x1A0C
> +#define SENINF2_CSI2_INT_EN                    0x1A10
> +#define SENINF2_CSI2_INT_STATUS                0x1A14
> +#define SENINF2_CSI2_DGB_SEL                   0x1A18
> +#define SENINF2_CSI2_DBG_PORT                  0x1A1C
> +#define SENINF2_CSI2_SPARE0                    0x1A20
> +#define SENINF2_CSI2_SPARE1                    0x1A24
> +#define SENINF2_CSI2_LNRC_FSM                  0x1A28
> +#define SENINF2_CSI2_LNRD_FSM                  0x1A2C
> +#define SENINF2_CSI2_FRAME_LINE_NUM            0x1A30
> +#define SENINF2_CSI2_GENERIC_SHORT             0x1A34
> +#define SENINF2_CSI2_HSRX_DBG                  0x1A38
> +#define SENINF2_CSI2_DI                        0x1A3C
> +#define SENINF2_CSI2_HS_TRAIL                  0x1A40
> +#define SENINF2_CSI2_DI_CTRL                   0x1A44
> +#define SENINF2_CSI2_DETECT_CON1               0x1A4C
> +#define SENINF2_CSI2_DETECT_CON2               0x1A50
> +#define SENINF2_CSI2_DETECT_CON3               0x1A54
> +#define SENINF2_CSI2_RLR0_CON0                 0x1A58
> +#define SENINF2_CSI2_RLR1_CON0                 0x1A5C
> +#define SENINF2_CSI2_RLR2_CON0                 0x1A60
> +#define SENINF2_CSI2_RLR_CON0                  0x1A64
> +#define SENINF2_CSI2_MUX_CON                   0x1A68
> +#define SENINF2_CSI2_DETECT_DBG0               0x1A6C
> +#define SENINF2_CSI2_DETECT_DBG1               0x1A70
> +#define SENINF2_CSI2_RESYNC_MERGE_CTL          0x1A74
> +#define SENINF2_CSI2_CTRL_TRIO_MUX             0x1A78
> +#define SENINF2_CSI2_CTRL_TRIO_CON             0x1A7C
> +#define SENINF2_FIX_ADDR_CPHY0_DBG             0x1A80
> +#define SENINF2_FIX_ADDR_CPHY1_DBG             0x1A84
> +#define SENINF2_FIX_ADDR_CPHY2_DBG             0x1A88
> +#define SENINF2_FIX_ADDR_DBG                   0x1A8C
> +#define SENINF2_WIRE_STATE_DECODE_CPHY0_DBG0   0x1A90
> +#define SENINF2_WIRE_STATE_DECODE_CPHY0_DBG1   0x1A94
> +#define SENINF2_WIRE_STATE_DECODE_CPHY1_DBG0   0x1A98
> +#define SENINF2_WIRE_STATE_DECODE_CPHY1_DBG1   0x1A9C
> +#define SENINF2_WIRE_STATE_DECODE_CPHY2_DBG0   0x1AA0
> +#define SENINF2_WIRE_STATE_DECODE_CPHY2_DBG1   0x1AA4
> +#define SENINF2_SYNC_RESYNC_CTL                0x1AA8
> +#define SENINF2_POST_DETECT_CTL                0x1AAC
> +#define SENINF2_WIRE_STATE_DECODE_CONFIG       0x1AB0
> +#define SENINF2_CSI2_CPHY_LNRD_FSM             0x1AB4
> +#define SENINF2_FIX_ADDR_CPHY0_DBG0            0x1AB8
> +#define SENINF2_FIX_ADDR_CPHY0_DBG1            0x1ABC
> +#define SENINF2_FIX_ADDR_CPHY0_DBG2            0x1AC0
> +#define SENINF2_FIX_ADDR_CPHY1_DBG0            0x1AC4
> +#define SENINF2_FIX_ADDR_CPHY1_DBG1            0x1AC8
> +#define SENINF2_FIX_ADDR_CPHY1_DBG2            0x1ACC
> +#define SENINF2_FIX_ADDR_CPHY2_DBG0            0x1AD0
> +#define SENINF2_FIX_ADDR_CPHY2_DBG1            0x1AD4
> +#define SENINF2_FIX_ADDR_CPHY2_DBG2            0x1AD8
> +#define SENINF2_FIX_ADDR_DBG0                  0x1ADC
> +#define SENINF2_FIX_ADDR_DBG1                  0x1AE0
> +#define SENINF2_FIX_ADDR_DBG2                  0x1AE4
> +#define SENINF2_CSI2_MODE                      0x1AE8
> +#define SENINF2_CSI2_DI_EXT                    0x1AF0
> +#define SENINF2_CSI2_DI_CTRL_EXT               0x1AF4
> +#define SENINF2_CSI2_CPHY_LOOPBACK             0x1AF8
> +#define SENINF2_CSI2_PROGSEQ_0                 0x1B00
> +#define SENINF2_CSI2_PROGSEQ_1                 0x1B04
> +#define SENINF2_CSI2_INT_EN_EXT                0x1B10
> +#define SENINF2_CSI2_INT_STATUS_EXT            0x1B14
> +#define SENINF2_CSI2_CPHY_FIX_POINT_RST        0x1B18
> +#define SENINF2_CSI2_RLR3_CON0                 0x1B1C
> +#define SENINF2_CSI2_DPHY_SYNC                 0x1B20
> +#define SENINF2_CSI2_DESKEW_SYNC               0x1B24
> +#define SENINF2_CSI2_DETECT_DBG2               0x1B28
> +#define SENINF2_FIX_ADDR_CPHY3_DBG0            0x1B30
> +#define SENINF2_FIX_ADDR_CPHY3_DBG1            0x1B34
> +#define SENINF2_FIX_ADDR_CPHY3_DBG2            0x1B38
> +#define SENINF2_CSI2_DI_EXT_2                  0x1B3C
> +#define SENINF2_CSI2_DI_CTRL_EXT_2             0x1B40
> +#define SENINF2_WIRE_STATE_DECODE_CPHY3_DBG0   0x1B44
> +#define SENINF2_WIRE_STATE_DECODE_CPHY3_DBG1   0x1B48
> +#define SENINF2_MUX_CTRL                       0x1D00
> +#define SENINF2_MUX_INTEN                      0x1D04
> +#define SENINF2_MUX_INTSTA                     0x1D08
> +#define SENINF2_MUX_SIZE                       0x1D0C
> +#define SENINF2_MUX_DEBUG_1                    0x1D10
> +#define SENINF2_MUX_DEBUG_2                    0x1D14
> +#define SENINF2_MUX_DEBUG_3                    0x1D18
> +#define SENINF2_MUX_DEBUG_4                    0x1D1C
> +#define SENINF2_MUX_DEBUG_5                    0x1D20
> +#define SENINF2_MUX_DEBUG_6                    0x1D24
> +#define SENINF2_MUX_DEBUG_7                    0x1D28
> +#define SENINF2_MUX_SPARE                      0x1D2C
> +#define SENINF2_MUX_DATA                       0x1D30
> +#define SENINF2_MUX_DATA_CNT                   0x1D34
> +#define SENINF2_MUX_CROP                       0x1D38
> +#define SENINF2_MUX_CTRL_EXT                   0x1D3C
> +#define SENINF3_CTRL                           0x2200
> +#define SENINF3_CTRL_EXT                       0x2204
> +#define SENINF3_ASYNC_CTRL                     0x2208
> +#define SENINF_TG3_PH_CNT                      0x2600
> +#define SENINF_TG3_SEN_CK                      0x2604
> +#define SENINF_TG3_TM_CTL                      0x2608
> +#define SENINF_TG3_TM_SIZE                     0x260C
> +#define SENINF_TG3_TM_CLK                      0x2610
> +#define SENINF_TG3_TM_STP                      0x2614
> +#define MIPI_RX_CON24_CSI2                     0x2824
> +#define MIPI_RX_CON28_CSI2                     0x2828
> +#define MIPI_RX_CON34_CSI2                     0x2834
> +#define MIPI_RX_CON38_CSI2                     0x2838
> +#define MIPI_RX_CON3C_CSI2                     0x283C
> +#define MIPI_RX_CON7C_CSI2                     0x287C
> +#define MIPI_RX_CON80_CSI2                     0x2880
> +#define MIPI_RX_CON84_CSI2                     0x2884
> +#define MIPI_RX_CON88_CSI2                     0x2888
> +#define MIPI_RX_CON8C_CSI2                     0x288C
> +#define MIPI_RX_CON90_CSI2                     0x2890
> +#define MIPI_RX_CON94_CSI2                     0x2894
> +#define MIPI_RX_CON98_CSI2                     0x2898
> +#define MIPI_RX_CONA0_CSI2                     0x28A0
> +#define MIPI_RX_CONB0_CSI2                     0x28B0
> +#define MIPI_RX_CONB4_CSI2                     0x28B4
> +#define MIPI_RX_CONB8_CSI2                     0x28B8
> +#define MIPI_RX_CONBC_CSI2                     0x28BC
> +#define MIPI_RX_CONC0_CSI2                     0x28C0
> +#define MIPI_RX_CONC4_CSI2                     0x28C4
> +#define MIPI_RX_CONC8_CSI2                     0x28C8
> +#define MIPI_RX_CONCC_CSI2                     0x28CC
> +#define MIPI_RX_COND0_CSI2                     0x28D0
> +#define SENINF3_CSI2_CTL                       0x2A00
> +#define SENINF3_CSI2_LNRC_TIMING               0x2A04
> +#define SENINF3_CSI2_LNRD_TIMING               0x2A08
> +#define SENINF3_CSI2_DPCM                      0x2A0C
> +#define SENINF3_CSI2_INT_EN                    0x2A10
> +#define SENINF3_CSI2_INT_STATUS                0x2A14
> +#define SENINF3_CSI2_DGB_SEL                   0x2A18
> +#define SENINF3_CSI2_DBG_PORT                  0x2A1C
> +#define SENINF3_CSI2_SPARE0                    0x2A20
> +#define SENINF3_CSI2_SPARE1                    0x2A24
> +#define SENINF3_CSI2_LNRC_FSM                  0x2A28
> +#define SENINF3_CSI2_LNRD_FSM                  0x2A2C
> +#define SENINF3_CSI2_FRAME_LINE_NUM            0x2A30
> +#define SENINF3_CSI2_GENERIC_SHORT             0x2A34
> +#define SENINF3_CSI2_HSRX_DBG                  0x2A38
> +#define SENINF3_CSI2_DI                        0x2A3C
> +#define SENINF3_CSI2_HS_TRAIL                  0x2A40
> +#define SENINF3_CSI2_DI_CTRL                   0x2A44
> +#define SENINF3_CSI2_DETECT_CON1               0x2A4C
> +#define SENINF3_CSI2_DETECT_CON2               0x2A50
> +#define SENINF3_CSI2_DETECT_CON3               0x2A54
> +#define SENINF3_CSI2_RLR0_CON0                 0x2A58
> +#define SENINF3_CSI2_RLR1_CON0                 0x2A5C
> +#define SENINF3_CSI2_RLR2_CON0                 0x2A60
> +#define SENINF3_CSI2_RLR_CON0                  0x2A64
> +#define SENINF3_CSI2_MUX_CON                   0x2A68
> +#define SENINF3_CSI2_DETECT_DBG0               0x2A6C
> +#define SENINF3_CSI2_DETECT_DBG1               0x2A70
> +#define SENINF3_CSI2_RESYNC_MERGE_CTL          0x2A74
> +#define SENINF3_CSI2_CTRL_TRIO_MUX             0x2A78
> +#define SENINF3_CSI2_CTRL_TRIO_CON             0x2A7C
> +#define SENINF3_FIX_ADDR_CPHY0_DBG             0x2A80
> +#define SENINF3_FIX_ADDR_CPHY1_DBG             0x2A84
> +#define SENINF3_FIX_ADDR_CPHY2_DBG             0x2A88
> +#define SENINF3_FIX_ADDR_DBG                   0x2A8C
> +#define SENINF3_WIRE_STATE_DECODE_CPHY0_DBG0   0x2A90
> +#define SENINF3_WIRE_STATE_DECODE_CPHY0_DBG1   0x2A94
> +#define SENINF3_WIRE_STATE_DECODE_CPHY1_DBG0   0x2A98
> +#define SENINF3_WIRE_STATE_DECODE_CPHY1_DBG1   0x2A9C
> +#define SENINF3_WIRE_STATE_DECODE_CPHY2_DBG0   0x2AA0
> +#define SENINF3_WIRE_STATE_DECODE_CPHY2_DBG1   0x2AA4
> +#define SENINF3_SYNC_RESYNC_CTL                0x2AA8
> +#define SENINF3_POST_DETECT_CTL                0x2AAC
> +#define SENINF3_WIRE_STATE_DECODE_CONFIG       0x2AB0
> +#define SENINF3_CSI2_CPHY_LNRD_FSM             0x2AB4
> +#define SENINF3_FIX_ADDR_CPHY0_DBG0            0x2AB8
> +#define SENINF3_FIX_ADDR_CPHY0_DBG1            0x2ABC
> +#define SENINF3_FIX_ADDR_CPHY0_DBG2            0x2AC0
> +#define SENINF3_FIX_ADDR_CPHY1_DBG0            0x2AC4
> +#define SENINF3_FIX_ADDR_CPHY1_DBG1            0x2AC8
> +#define SENINF3_FIX_ADDR_CPHY1_DBG2            0x2ACC
> +#define SENINF3_FIX_ADDR_CPHY2_DBG0            0x2AD0
> +#define SENINF3_FIX_ADDR_CPHY2_DBG1            0x2AD4
> +#define SENINF3_FIX_ADDR_CPHY2_DBG2            0x2AD8
> +#define SENINF3_FIX_ADDR_DBG0                  0x2ADC
> +#define SENINF3_FIX_ADDR_DBG1                  0x2AE0
> +#define SENINF3_FIX_ADDR_DBG2                  0x2AE4
> +#define SENINF3_CSI2_MODE                      0x2AE8
> +#define SENINF3_CSI2_DI_EXT                    0x2AF0
> +#define SENINF3_CSI2_DI_CTRL_EXT               0x2AF4
> +#define SENINF3_CSI2_CPHY_LOOPBACK             0x2AF8
> +#define SENINF3_CSI2_PROGSEQ_0                 0x2B00
> +#define SENINF3_CSI2_PROGSEQ_1                 0x2B04
> +#define SENINF3_CSI2_INT_EN_EXT                0x2B10
> +#define SENINF3_CSI2_INT_STATUS_EXT            0x2B14
> +#define SENINF3_CSI2_CPHY_FIX_POINT_RST        0x2B18
> +#define SENINF3_CSI2_RLR3_CON0                 0x2B1C
> +#define SENINF3_CSI2_DPHY_SYNC                 0x2B20
> +#define SENINF3_CSI2_DESKEW_SYNC               0x2B24
> +#define SENINF3_CSI2_DETECT_DBG2               0x2B28
> +#define SENINF3_FIX_ADDR_CPHY3_DBG0            0x2B30
> +#define SENINF3_FIX_ADDR_CPHY3_DBG1            0x2B34
> +#define SENINF3_FIX_ADDR_CPHY3_DBG2            0x2B38
> +#define SENINF3_CSI2_DI_EXT_2                  0x2B3C
> +#define SENINF3_CSI2_DI_CTRL_EXT_2             0x2B40
> +#define SENINF3_WIRE_STATE_DECODE_CPHY3_DBG0   0x2B44
> +#define SENINF3_WIRE_STATE_DECODE_CPHY3_DBG1   0x2B48
> +#define SENINF3_MUX_CTRL                       0x2D00
> +#define SENINF3_MUX_INTEN                      0x2D04
> +#define SENINF3_MUX_INTSTA                     0x2D08
> +#define SENINF3_MUX_SIZE                       0x2D0C
> +#define SENINF3_MUX_DEBUG_1                    0x2D10
> +#define SENINF3_MUX_DEBUG_2                    0x2D14
> +#define SENINF3_MUX_DEBUG_3                    0x2D18
> +#define SENINF3_MUX_DEBUG_4                    0x2D1C
> +#define SENINF3_MUX_DEBUG_5                    0x2D20
> +#define SENINF3_MUX_DEBUG_6                    0x2D24
> +#define SENINF3_MUX_DEBUG_7                    0x2D28
> +#define SENINF3_MUX_SPARE                      0x2D2C
> +#define SENINF3_MUX_DATA                       0x2D30
> +#define SENINF3_MUX_DATA_CNT                   0x2D34
> +#define SENINF3_MUX_CROP                       0x2D38
> +#define SENINF3_MUX_CTRL_EXT                   0x2D3C
> +#define SENINF4_CTRL                           0x3200
> +#define SENINF4_CTRL_EXT                       0x3204
> +#define SENINF4_ASYNC_CTRL                     0x3208
> +#define SENINF_TG4_PH_CNT                      0x3600
> +#define SENINF_TG4_SEN_CK                      0x3604
> +#define SENINF_TG4_TM_CTL                      0x3608
> +#define SENINF_TG4_TM_SIZE                     0x360C
> +#define SENINF_TG4_TM_CLK                      0x3610
> +#define SENINF_TG4_TM_STP                      0x3614
> +#define MIPI_RX_CON24_CSI3                     0x3824
> +#define MIPI_RX_CON28_CSI3                     0x3828
> +#define MIPI_RX_CON34_CSI3                     0x3834
> +#define MIPI_RX_CON38_CSI3                     0x3838
> +#define MIPI_RX_CON3C_CSI3                     0x383C
> +#define MIPI_RX_CON7C_CSI3                     0x387C
> +#define MIPI_RX_CON80_CSI3                     0x3880
> +#define MIPI_RX_CON84_CSI3                     0x3884
> +#define MIPI_RX_CON88_CSI3                     0x3888
> +#define MIPI_RX_CON8C_CSI3                     0x388C
> +#define MIPI_RX_CON90_CSI3                     0x3890
> +#define MIPI_RX_CON94_CSI3                     0x3894
> +#define MIPI_RX_CON98_CSI3                     0x3898
> +#define MIPI_RX_CONA0_CSI3                     0x38A0
> +#define MIPI_RX_CONB0_CSI3                     0x38B0
> +#define MIPI_RX_CONB4_CSI3                     0x38B4
> +#define MIPI_RX_CONB8_CSI3                     0x38B8
> +#define MIPI_RX_CONBC_CSI3                     0x38BC
> +#define MIPI_RX_CONC0_CSI3                     0x38C0
> +#define MIPI_RX_CONC4_CSI3                     0x38C4
> +#define MIPI_RX_CONC8_CSI3                     0x38C8
> +#define MIPI_RX_CONCC_CSI3                     0x38CC
> +#define MIPI_RX_COND0_CSI3                     0x38D0
> +#define SENINF4_CSI2_CTL                       0x3A00
> +#define SENINF4_CSI2_LNRC_TIMING               0x3A04
> +#define SENINF4_CSI2_LNRD_TIMING               0x3A08
> +#define SENINF4_CSI2_DPCM                      0x3A0C
> +#define SENINF4_CSI2_INT_EN                    0x3A10
> +#define SENINF4_CSI2_INT_STATUS                0x3A14
> +#define SENINF4_CSI2_DGB_SEL                   0x3A18
> +#define SENINF4_CSI2_DBG_PORT                  0x3A1C
> +#define SENINF4_CSI2_SPARE0                    0x3A20
> +#define SENINF4_CSI2_SPARE1                    0x3A24
> +#define SENINF4_CSI2_LNRC_FSM                  0x3A28
> +#define SENINF4_CSI2_LNRD_FSM                  0x3A2C
> +#define SENINF4_CSI2_FRAME_LINE_NUM            0x3A30
> +#define SENINF4_CSI2_GENERIC_SHORT             0x3A34
> +#define SENINF4_CSI2_HSRX_DBG                  0x3A38
> +#define SENINF4_CSI2_DI                        0x3A3C
> +#define SENINF4_CSI2_HS_TRAIL                  0x3A40
> +#define SENINF4_CSI2_DI_CTRL                   0x3A44
> +#define SENINF4_CSI2_DETECT_CON1               0x3A4C
> +#define SENINF4_CSI2_DETECT_CON2               0x3A50
> +#define SENINF4_CSI2_DETECT_CON3               0x3A54
> +#define SENINF4_CSI2_RLR0_CON0                 0x3A58
> +#define SENINF4_CSI2_RLR1_CON0                 0x3A5C
> +#define SENINF4_CSI2_RLR2_CON0                 0x3A60
> +#define SENINF4_CSI2_RLR_CON0                  0x3A64
> +#define SENINF4_CSI2_MUX_CON                   0x3A68
> +#define SENINF4_CSI2_DETECT_DBG0               0x3A6C
> +#define SENINF4_CSI2_DETECT_DBG1               0x3A70
> +#define SENINF4_CSI2_RESYNC_MERGE_CTL          0x3A74
> +#define SENINF4_CSI2_CTRL_TRIO_MUX             0x3A78
> +#define SENINF4_CSI2_CTRL_TRIO_CON             0x3A7C
> +#define SENINF4_FIX_ADDR_CPHY0_DBG             0x3A80
> +#define SENINF4_FIX_ADDR_CPHY1_DBG             0x3A84
> +#define SENINF4_FIX_ADDR_CPHY2_DBG             0x3A88
> +#define SENINF4_FIX_ADDR_DBG                   0x3A8C
> +#define SENINF4_WIRE_STATE_DECODE_CPHY0_DBG0   0x3A90
> +#define SENINF4_WIRE_STATE_DECODE_CPHY0_DBG1   0x3A94
> +#define SENINF4_WIRE_STATE_DECODE_CPHY1_DBG0   0x3A98
> +#define SENINF4_WIRE_STATE_DECODE_CPHY1_DBG1   0x3A9C
> +#define SENINF4_WIRE_STATE_DECODE_CPHY2_DBG0   0x3AA0
> +#define SENINF4_WIRE_STATE_DECODE_CPHY2_DBG1   0x3AA4
> +#define SENINF4_SYNC_RESYNC_CTL                0x3AA8
> +#define SENINF4_POST_DETECT_CTL                0x3AAC
> +#define SENINF4_WIRE_STATE_DECODE_CONFIG       0x3AB0
> +#define SENINF4_CSI2_CPHY_LNRD_FSM             0x3AB4
> +#define SENINF4_FIX_ADDR_CPHY0_DBG0            0x3AB8
> +#define SENINF4_FIX_ADDR_CPHY0_DBG1            0x3ABC
> +#define SENINF4_FIX_ADDR_CPHY0_DBG2            0x3AC0
> +#define SENINF4_FIX_ADDR_CPHY1_DBG0            0x3AC4
> +#define SENINF4_FIX_ADDR_CPHY1_DBG1            0x3AC8
> +#define SENINF4_FIX_ADDR_CPHY1_DBG2            0x3ACC
> +#define SENINF4_FIX_ADDR_CPHY2_DBG0            0x3AD0
> +#define SENINF4_FIX_ADDR_CPHY2_DBG1            0x3AD4
> +#define SENINF4_FIX_ADDR_CPHY2_DBG2            0x3AD8
> +#define SENINF4_FIX_ADDR_DBG0                  0x3ADC
> +#define SENINF4_FIX_ADDR_DBG1                  0x3AE0
> +#define SENINF4_FIX_ADDR_DBG2                  0x3AE4
> +#define SENINF4_CSI2_MODE                      0x3AE8
> +#define SENINF4_CSI2_DI_EXT                    0x3AF0
> +#define SENINF4_CSI2_DI_CTRL_EXT               0x3AF4
> +#define SENINF4_CSI2_CPHY_LOOPBACK             0x3AF8
> +#define SENINF4_CSI2_PROGSEQ_0                 0x3B00
> +#define SENINF4_CSI2_PROGSEQ_1                 0x3B04
> +#define SENINF4_CSI2_INT_EN_EXT                0x3B10
> +#define SENINF4_CSI2_INT_STATUS_EXT            0x3B14
> +#define SENINF4_CSI2_CPHY_FIX_POINT_RST        0x3B18
> +#define SENINF4_CSI2_RLR3_CON0                 0x3B1C
> +#define SENINF4_CSI2_DPHY_SYNC                 0x3B20
> +#define SENINF4_CSI2_DESKEW_SYNC               0x3B24
> +#define SENINF4_CSI2_DETECT_DBG2               0x3B28
> +#define SENINF4_FIX_ADDR_CPHY3_DBG0            0x3B30
> +#define SENINF4_FIX_ADDR_CPHY3_DBG1            0x3B34
> +#define SENINF4_FIX_ADDR_CPHY3_DBG2            0x3B38
> +#define SENINF4_CSI2_DI_EXT_2                  0x3B3C
> +#define SENINF4_CSI2_DI_CTRL_EXT_2             0x3B40
> +#define SENINF4_WIRE_STATE_DECODE_CPHY3_DBG0   0x3B44
> +#define SENINF4_WIRE_STATE_DECODE_CPHY3_DBG1   0x3B48
> +#define SENINF4_MUX_CTRL                       0x3D00
> +#define SENINF4_MUX_INTEN                      0x3D04
> +#define SENINF4_MUX_INTSTA                     0x3D08
> +#define SENINF4_MUX_SIZE                       0x3D0C
> +#define SENINF4_MUX_DEBUG_1                    0x3D10
> +#define SENINF4_MUX_DEBUG_2                    0x3D14
> +#define SENINF4_MUX_DEBUG_3                    0x3D18
> +#define SENINF4_MUX_DEBUG_4                    0x3D1C
> +#define SENINF4_MUX_DEBUG_5                    0x3D20
> +#define SENINF4_MUX_DEBUG_6                    0x3D24
> +#define SENINF4_MUX_DEBUG_7                    0x3D28
> +#define SENINF4_MUX_SPARE                      0x3D2C
> +#define SENINF4_MUX_DATA                       0x3D30
> +#define SENINF4_MUX_DATA_CNT                   0x3D34
> +#define SENINF4_MUX_CROP                       0x3D38
> +#define SENINF4_MUX_CTRL_EXT                   0x3D3C
> +#define SENINF5_CTRL                           0x4200
> +#define SENINF5_CTRL_EXT                       0x4204
> +#define SENINF5_ASYNC_CTRL                     0x4208
> +#define SENINF_TG5_PH_CNT                      0x4600
> +#define SENINF_TG5_SEN_CK                      0x4604
> +#define SENINF_TG5_TM_CTL                      0x4608
> +#define SENINF_TG5_TM_SIZE                     0x460C
> +#define SENINF_TG5_TM_CLK                      0x4610
> +#define SENINF_TG5_TM_STP                      0x4614
> +#define MIPI_RX_CON24_CSI4                     0x4824
> +#define MIPI_RX_CON28_CSI4                     0x4828
> +#define MIPI_RX_CON34_CSI4                     0x4834
> +#define MIPI_RX_CON38_CSI4                     0x4838
> +#define MIPI_RX_CON3C_CSI4                     0x483C
> +#define MIPI_RX_CON7C_CSI4                     0x487C
> +#define MIPI_RX_CON80_CSI4                     0x4880
> +#define MIPI_RX_CON84_CSI4                     0x4884
> +#define MIPI_RX_CON88_CSI4                     0x4888
> +#define MIPI_RX_CON8C_CSI4                     0x488C
> +#define MIPI_RX_CON90_CSI4                     0x4890
> +#define MIPI_RX_CON94_CSI4                     0x4894
> +#define MIPI_RX_CON98_CSI4                     0x4898
> +#define MIPI_RX_CONA0_CSI4                     0x48A0
> +#define MIPI_RX_CONB0_CSI4                     0x48B0
> +#define MIPI_RX_CONB4_CSI4                     0x48B4
> +#define MIPI_RX_CONB8_CSI4                     0x48B8
> +#define MIPI_RX_CONBC_CSI4                     0x48BC
> +#define MIPI_RX_CONC0_CSI4                     0x48C0
> +#define MIPI_RX_CONC4_CSI4                     0x48C4
> +#define MIPI_RX_CONC8_CSI4                     0x48C8
> +#define MIPI_RX_CONCC_CSI4                     0x48CC
> +#define MIPI_RX_COND0_CSI4                     0x48D0
> +#define SENINF5_CSI2_CTL                       0x4A00
> +#define SENINF5_CSI2_LNRC_TIMING               0x4A04
> +#define SENINF5_CSI2_LNRD_TIMING               0x4A08
> +#define SENINF5_CSI2_DPCM                      0x4A0C
> +#define SENINF5_CSI2_INT_EN                    0x4A10
> +#define SENINF5_CSI2_INT_STATUS                0x4A14
> +#define SENINF5_CSI2_DGB_SEL                   0x4A18
> +#define SENINF5_CSI2_DBG_PORT                  0x4A1C
> +#define SENINF5_CSI2_SPARE0                    0x4A20
> +#define SENINF5_CSI2_SPARE1                    0x4A24
> +#define SENINF5_CSI2_LNRC_FSM                  0x4A28
> +#define SENINF5_CSI2_LNRD_FSM                  0x4A2C
> +#define SENINF5_CSI2_FRAME_LINE_NUM            0x4A30
> +#define SENINF5_CSI2_GENERIC_SHORT             0x4A34
> +#define SENINF5_CSI2_HSRX_DBG                  0x4A38
> +#define SENINF5_CSI2_DI                        0x4A3C
> +#define SENINF5_CSI2_HS_TRAIL                  0x4A40
> +#define SENINF5_CSI2_DI_CTRL                   0x4A44
> +#define SENINF5_CSI2_DETECT_CON1               0x4A4C
> +#define SENINF5_CSI2_DETECT_CON2               0x4A50
> +#define SENINF5_CSI2_DETECT_CON3               0x4A54
> +#define SENINF5_CSI2_RLR0_CON0                 0x4A58
> +#define SENINF5_CSI2_RLR1_CON0                 0x4A5C
> +#define SENINF5_CSI2_RLR2_CON0                 0x4A60
> +#define SENINF5_CSI2_RLR_CON0                  0x4A64
> +#define SENINF5_CSI2_MUX_CON                   0x4A68
> +#define SENINF5_CSI2_DETECT_DBG0               0x4A6C
> +#define SENINF5_CSI2_DETECT_DBG1               0x4A70
> +#define SENINF5_CSI2_RESYNC_MERGE_CTL          0x4A74
> +#define SENINF5_CSI2_CTRL_TRIO_MUX             0x4A78
> +#define SENINF5_CSI2_CTRL_TRIO_CON             0x4A7C
> +#define SENINF5_FIX_ADDR_CPHY0_DBG             0x4A80
> +#define SENINF5_FIX_ADDR_CPHY1_DBG             0x4A84
> +#define SENINF5_FIX_ADDR_CPHY2_DBG             0x4A88
> +#define SENINF5_FIX_ADDR_DBG                   0x4A8C
> +#define SENINF5_WIRE_STATE_DECODE_CPHY0_DBG0   0x4A90
> +#define SENINF5_WIRE_STATE_DECODE_CPHY0_DBG1   0x4A94
> +#define SENINF5_WIRE_STATE_DECODE_CPHY1_DBG0   0x4A98
> +#define SENINF5_WIRE_STATE_DECODE_CPHY1_DBG1   0x4A9C
> +#define SENINF5_WIRE_STATE_DECODE_CPHY2_DBG0   0x4AA0
> +#define SENINF5_WIRE_STATE_DECODE_CPHY2_DBG1   0x4AA4
> +#define SENINF5_SYNC_RESYNC_CTL                0x4AA8
> +#define SENINF5_POST_DETECT_CTL                0x4AAC
> +#define SENINF5_WIRE_STATE_DECODE_CONFIG       0x4AB0
> +#define SENINF5_CSI2_CPHY_LNRD_FSM             0x4AB4
> +#define SENINF5_FIX_ADDR_CPHY0_DBG0            0x4AB8
> +#define SENINF5_FIX_ADDR_CPHY0_DBG1            0x4ABC
> +#define SENINF5_FIX_ADDR_CPHY0_DBG2            0x4AC0
> +#define SENINF5_FIX_ADDR_CPHY1_DBG0            0x4AC4
> +#define SENINF5_FIX_ADDR_CPHY1_DBG1            0x4AC8
> +#define SENINF5_FIX_ADDR_CPHY1_DBG2            0x4ACC
> +#define SENINF5_FIX_ADDR_CPHY2_DBG0            0x4AD0
> +#define SENINF5_FIX_ADDR_CPHY2_DBG1            0x4AD4
> +#define SENINF5_FIX_ADDR_CPHY2_DBG2            0x4AD8
> +#define SENINF5_FIX_ADDR_DBG0                  0x4ADC
> +#define SENINF5_FIX_ADDR_DBG1                  0x4AE0
> +#define SENINF5_FIX_ADDR_DBG2                  0x4AE4
> +#define SENINF5_CSI2_MODE                      0x4AE8
> +#define SENINF5_CSI2_DI_EXT                    0x4AF0
> +#define SENINF5_CSI2_DI_CTRL_EXT               0x4AF4
> +#define SENINF5_CSI2_CPHY_LOOPBACK             0x4AF8
> +#define SENINF5_CSI2_PROGSEQ_0                 0x4B00
> +#define SENINF5_CSI2_PROGSEQ_1                 0x4B04
> +#define SENINF5_CSI2_INT_EN_EXT                0x4B10
> +#define SENINF5_CSI2_INT_STATUS_EXT            0x4B14
> +#define SENINF5_CSI2_CPHY_FIX_POINT_RST        0x4B18
> +#define SENINF5_CSI2_RLR3_CON0                 0x4B1C
> +#define SENINF5_CSI2_DPHY_SYNC                 0x4B20
> +#define SENINF5_CSI2_DESKEW_SYNC               0x4B24
> +#define SENINF5_CSI2_DETECT_DBG2               0x4B28
> +#define SENINF5_FIX_ADDR_CPHY3_DBG0            0x4B30
> +#define SENINF5_FIX_ADDR_CPHY3_DBG1            0x4B34
> +#define SENINF5_FIX_ADDR_CPHY3_DBG2            0x4B38
> +#define SENINF5_CSI2_DI_EXT_2                  0x4B3C
> +#define SENINF5_CSI2_DI_CTRL_EXT_2             0x4B40
> +#define SENINF5_WIRE_STATE_DECODE_CPHY3_DBG0   0x4B44
> +#define SENINF5_WIRE_STATE_DECODE_CPHY3_DBG1   0x4B48
> +#define SENINF5_MUX_CTRL                       0x4D00
> +#define SENINF5_MUX_INTEN                      0x4D04
> +#define SENINF5_MUX_INTSTA                     0x4D08
> +#define SENINF5_MUX_SIZE                       0x4D0C
> +#define SENINF5_MUX_DEBUG_1                    0x4D10
> +#define SENINF5_MUX_DEBUG_2                    0x4D14
> +#define SENINF5_MUX_DEBUG_3                    0x4D18
> +#define SENINF5_MUX_DEBUG_4                    0x4D1C
> +#define SENINF5_MUX_DEBUG_5                    0x4D20
> +#define SENINF5_MUX_DEBUG_6                    0x4D24
> +#define SENINF5_MUX_DEBUG_7                    0x4D28
> +#define SENINF5_MUX_SPARE                      0x4D2C
> +#define SENINF5_MUX_DATA                       0x4D30
> +#define SENINF5_MUX_DATA_CNT                   0x4D34
> +#define SENINF5_MUX_CROP                       0x4D38
> +#define SENINF5_MUX_CTRL_EXT                   0x4D3C
> +#define SENINF6_MUX_CTRL                       0x5D00
> +#define SENINF6_MUX_INTEN                      0x5D04
> +#define SENINF6_MUX_INTSTA                     0x5D08
> +#define SENINF6_MUX_SIZE                       0x5D0C
> +#define SENINF6_MUX_DEBUG_1                    0x5D10
> +#define SENINF6_MUX_DEBUG_2                    0x5D14
> +#define SENINF6_MUX_DEBUG_3                    0x5D18
> +#define SENINF6_MUX_DEBUG_4                    0x5D1C
> +#define SENINF6_MUX_DEBUG_5                    0x5D20
> +#define SENINF6_MUX_DEBUG_6                    0x5D24
> +#define SENINF6_MUX_DEBUG_7                    0x5D28
> +#define SENINF6_MUX_SPARE                      0x5D2C
> +#define SENINF6_MUX_DATA                       0x5D30
> +#define SENINF6_MUX_DATA_CNT                   0x5D34
> +#define SENINF6_MUX_CROP                       0x5D38
> +#define SENINF6_MUX_CTRL_EXT                   0x5D3C
> +#define SENINF7_MUX_CTRL                       0x6D00
> +#define SENINF7_MUX_INTEN                      0x6D04
> +#define SENINF7_MUX_INTSTA                     0x6D08
> +#define SENINF7_MUX_SIZE                       0x6D0C
> +#define SENINF7_MUX_DEBUG_1                    0x6D10
> +#define SENINF7_MUX_DEBUG_2                    0x6D14
> +#define SENINF7_MUX_DEBUG_3                    0x6D18
> +#define SENINF7_MUX_DEBUG_4                    0x6D1C
> +#define SENINF7_MUX_DEBUG_5                    0x6D20
> +#define SENINF7_MUX_DEBUG_6                    0x6D24
> +#define SENINF7_MUX_DEBUG_7                    0x6D28
> +#define SENINF7_MUX_SPARE                      0x6D2C
> +#define SENINF7_MUX_DATA                       0x6D30
> +#define SENINF7_MUX_DATA_CNT                   0x6D34
> +#define SENINF7_MUX_CROP                       0x6D38
> +#define SENINF7_MUX_CTRL_EXT                   0x6D3C
> +#define SENINF8_MUX_CTRL                       0x7D00
> +#define SENINF8_MUX_INTEN                      0x7D04
> +#define SENINF8_MUX_INTSTA                     0x7D08
> +#define SENINF8_MUX_SIZE                       0x7D0C
> +#define SENINF8_MUX_DEBUG_1                    0x7D10
> +#define SENINF8_MUX_DEBUG_2                    0x7D14
> +#define SENINF8_MUX_DEBUG_3                    0x7D18
> +#define SENINF8_MUX_DEBUG_4                    0x7D1C
> +#define SENINF8_MUX_DEBUG_5                    0x7D20
> +#define SENINF8_MUX_DEBUG_6                    0x7D24
> +#define SENINF8_MUX_DEBUG_7                    0x7D28
> +#define SENINF8_MUX_SPARE                      0x7D2C
> +#define SENINF8_MUX_DATA                       0x7D30
> +#define SENINF8_MUX_DATA_CNT                   0x7D34
> +#define SENINF8_MUX_CROP                       0x7D38
> +#define SENINF8_MUX_CTRL_EXT                   0x7D3C
> +
> +#endif /* _SENINF_REG_H_ */
> -- 
> 2.18.0
> 

-- 
Kind regards,

Sakari Ailus
