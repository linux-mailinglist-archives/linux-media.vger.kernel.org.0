Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0187A2285E9
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 18:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729437AbgGUQjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 12:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728797AbgGUQjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 12:39:20 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7854AC061794
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 09:39:19 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f2so21811411wrp.7
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 09:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6kNXWZzuZgEqUjNFq9wJEsvk7IKlT/y/Iec9xvYFXVM=;
        b=I4DjZIZz7ylNrtfwxVpOqcVBH4lHIfOEAaR3TcH/4RGK2VfDiWw/Tri/ZqiVgbZA3j
         AhPvzvbA2ZddbiE6MvDikdEedaW6caN96utZQ9SBsjcgKaSALcWHeZIRKqPQy3uSQaaR
         y18g5VJwLrDuP2Stq7KC6+cX6/rrVnvzY+neg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6kNXWZzuZgEqUjNFq9wJEsvk7IKlT/y/Iec9xvYFXVM=;
        b=SHIr5+6o0lq7RUPWRSEioI68wHZgCAwlr2BuIvYSMPsv4GBn2rcEJaAJg53SJkI8E3
         WkumgzTQ0EOQ93pNO8xtGdj8IJ2BDk7dJ/iCHGGXKGJt5OV9/3QbYe2/Pl97Edh0lPbm
         aKlHqFw7lL8v24BnL8AJmblQSmJm6QFwOY4ZMhA2X0uau/UPiSixUmLTOyrS0e/pnh26
         9yF1kej/VA2idSzL18RBg0dRjpqSjVz1cVWHKC7OXhahKTcebeDcfMYsJOBYONRqSX6l
         sEa/h2kv7tY2291bSHiBMHUqXpj9Atbp5c0TKLo2EPCIzsBZghcyDWq6glcMpW5pDTZS
         6BwA==
X-Gm-Message-State: AOAM531ViSAq6s+ADtwt0JXR8lZKwnq4xEL4z9VmB28LE/k+gCxm4Haa
        dluSI8X/0wiP9F52XkHiuODU+g==
X-Google-Smtp-Source: ABdhPJwO01IEl9YwyZ4mUPMpolj3IVn20ZcP8/EWw44sHkMF3YFbRque5pYKarS4TpxAX1Deaz1SnQ==
X-Received: by 2002:adf:a11d:: with SMTP id o29mr9391972wro.421.1595349557477;
        Tue, 21 Jul 2020 09:39:17 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id u17sm38234126wrp.70.2020.07.21.09.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 09:39:16 -0700 (PDT)
Date:   Tue, 21 Jul 2020 16:39:14 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Louis Kuo <louis.kuo@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        keiichiw@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org,
        yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        frederic.chen@mediatek.com, Jerry-ch.Chen@mediatek.com,
        jungo.lin@mediatek.com, linux-media@vger.kernel.org,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
Message-ID: <20200721163914.GA1623183@chromium.org>
References: <20200708104023.3225-1-louis.kuo@mediatek.com>
 <20200708104023.3225-2-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708104023.3225-2-louis.kuo@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Louis,

On Wed, Jul 08, 2020 at 06:40:21PM +0800, Louis Kuo wrote:
> This patch adds Mediatek's sensor interface driver. Sensor interface
> driver is a MIPI-CSI2 host driver, namely, a HW camera interface controller.
> It support a widely adopted, simple, high-speed protocol primarily intended
> for point-to-point image and video transmission between cameras and host
> devices. The mtk-isp directory will contain drivers for multiple IP blocks
> found in Mediatek ISP system. It will include ISP Pass 1 driver, sensor
> interface driver, DIP driver and face detection driver.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/mtk-isp/Kconfig        |   18 +
>  drivers/media/platform/mtk-isp/Makefile       |    3 +
>  .../media/platform/mtk-isp/seninf/Makefile    |    7 +
>  .../platform/mtk-isp/seninf/mtk_seninf.c      |  974 +++++++++++
>  .../platform/mtk-isp/seninf/mtk_seninf_dphy.c |  353 ++++
>  .../platform/mtk-isp/seninf/mtk_seninf_reg.h  | 1491 +++++++++++++++++
>  .../mtk-isp/seninf/mtk_seninf_rx_reg.h        |  515 ++++++
>  8 files changed, 3362 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
>  create mode 100644 drivers/media/platform/mtk-isp/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/seninf/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf.c
>  create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf_dphy.c
>  create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf_reg.h
>  create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf_rx_reg.h
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 62b6cdc8c730..50db8c144e28 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -75,6 +75,7 @@ obj-$(CONFIG_VIDEO_MEDIATEK_MDP)	+= mtk-mdp/
> 
>  obj-$(CONFIG_VIDEO_MEDIATEK_JPEG)	+= mtk-jpeg/
> 
> +obj-$(CONFIG_MTK_SENINF)		+= mtk-isp/
>  obj-$(CONFIG_VIDEO_QCOM_CAMSS)		+= qcom/camss/
> 
>  obj-$(CONFIG_VIDEO_QCOM_VENUS)		+= qcom/venus/
> diff --git a/drivers/media/platform/mtk-isp/Kconfig b/drivers/media/platform/mtk-isp/Kconfig
> new file mode 100644
> index 000000000000..4a9febb7e6e3
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/Kconfig
> @@ -0,0 +1,18 @@
> +config MTK_SENINF
> +	tristate "Mediatek mipi csi2 driver"

nit: MIPI CSI-2 is the official spelling

> +	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> +	depends on MEDIA_CAMERA_SUPPORT
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	select V4L2_FWNODE
> +
> +	default n
> +	help
> +	  This driver provides a mipi-csi2 host driver used as a
> +	  interface to connect camera with Mediatek's
> +	  MT8183 SOCs. It is able to handle multiple cameras
> +	  at the same time.
> +
> +	  Choose y if you want to use Mediatek SoCs to create image
> +	  capture application such as video recording and still image
> +	  capture.

One thing that is not clear from this description is that this driver alone
is not enough to capture anything. A driver for the hardware block that has
a DMA to write the frames is necessary as well, e.g. on MT8183 that would
be P1 (an ISP linked to SenInf, which does Bayer-domain processing and
outputs the processed Bayer frames to system memory) or CamSV (a basic DMA
capable of writing unprocessed raw frames to system memory).

In principle, a driver that cannot be used on its own doesn't serve any
purpose in mainline. (I suppose there could be some case-by-case
exceptions.) Thus, it is unlikely for this driver to be merged without the
P1 or CamSV driver being merged as well. I recall there was also another
SoC which could benefit from this driver, which had a raw capture DMA as
well. If a driver for the raw capture DMA block of that SoC is posted, this
driver could be merged together with it.

[snip]
> diff --git a/drivers/media/platform/mtk-isp/seninf/mtk_seninf.c b/drivers/media/platform/mtk-isp/seninf/mtk_seninf.c
> new file mode 100644
> index 000000000000..c5883dc3c3d6
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/seninf/mtk_seninf.c
> @@ -0,0 +1,974 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/videodev2.h>
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +#include <linux/phy/phy.h>
> +#include "mtk_seninf_reg.h"
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
> +#define TEST_MODEL          0
> +#define NORMAL_MODEL        1
> +#define SENINF_ALL_ERR_IRQ_EN	0x7F
> +#define SENINF_IRQ_CLR_SEL	0x80000000
> +
> +#define MIPI_SENSOR			0x8
> +
> +enum TEST_MODE {
> +	TEST_GEN_PATTERN = 0x0,
> +	TEST_DUMP_DEBUG_INFO,
> +};
> +
> +enum CFG_CSI_PORT {
> +	CFG_CSI_PORT_0 = 0x0,	/* 4D1C */
> +	CFG_CSI_PORT_1,		/* 4D1C */
> +	CFG_CSI_PORT_2,		/* 4D1C */
> +	CFG_CSI_PORT_0A,	/* 2D1C */
> +	CFG_CSI_PORT_0B,	/* 2D1C */
> +	CFG_CSI_PORT_MAX_NUM,
> +	CFG_CSI_PORT_NONE	/*for non-MIPI sensor */
> +};
> +
> +enum PIXEL_MODE {
> +	ONE_PIXEL_MODE  = 0x0,
> +	TWO_PIXEL_MODE  = 0x1,
> +	FOUR_PIXEL_MODE = 0x2,
> +};

Only ONE_PIXEL_MODE is ever used.

> +
> +enum SENINF_ID {
> +	SENINF_1 = 0x0,
> +	SENINF_2 = 0x1,
> +	SENINF_3 = 0x2,
> +	SENINF_4 = 0x3,
> +	SENINF_5 = 0x4,
> +	SENINF_NUM,
> +};

Do we need to define this kind of enums for sequential numbers? For the
driver, it doesn't matter if the seninf is "1" or "5", but rather, which block in
sequence it is, starting from 0, so it could be always numbered like that.

> +
> +enum IMAGE_FMT {
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
> +#define SENINF_BITS(base, reg, field, val) do { \
> +		u32 __iomem *__p = (base) + (reg); \
> +		u32 __v = *__p; \
> +		__v &= ~reg##_##field##_MASK; \
> +		__v |= ((val) << reg##_##field##_SHIFT); \
> +		*__p = __v; \
> +	} while (0)
> +
> +struct mtk_seninf_sensor_cfg {
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
> +	struct mtk_seninf_sensor_cfg sensor[NUM_SENSORS];
> +	struct phy *dphy;
> +	unsigned int num_clks;
> +	struct clk_bulk_data *clks;
> +	void __iomem *base;
> +	void __iomem *rx;

This field is unused.

> +	unsigned int port;
> +	unsigned int mux_sel;
> +};
> +
> +static inline int is_4d1c(unsigned int port)
> +{
> +	return port < CFG_CSI_PORT_0A;
> +}
> +
> +static inline int is_cdphy_combo(unsigned int port)
> +{
> +	return port == CFG_CSI_PORT_0A ||
> +		port == CFG_CSI_PORT_0B ||
> +		port == CFG_CSI_PORT_0;
> +}

This could be described in a structure that describes each port.

> +
> +inline struct mtk_seninf *sd_to_mtk_seninf(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct mtk_seninf, subdev);
> +}
> +
> +static unsigned int mtk_seninf_get_dpcm(struct mtk_seninf *priv)
> +{
> +	unsigned int dpcm;
> +
> +	switch (priv->fmt[priv->port].format.code) {
> +	case MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8:
> +		dpcm = 0x2a;

Please define a macro for this.

> +		break;
> +	default:
> +		dpcm = 0;
> +		break;
> +	}
> +
> +	return dpcm;
> +}

In fact, this function can only return 2 values. Perhaps it's more of a
boolean check for "is format DPCM XX"?

> +
> +static unsigned int mtk_seninf_map_fmt(struct mtk_seninf *priv)

This is ever used only to tell whether the format is JPEG or not. Would it
make more sense to make it return boolean and rename to
mtk_seninf_fmt_is_jpeg()?

> +{
> +	int fmtidx = RAW_10BIT_FMT;
> +
> +	switch (priv->fmt[priv->port].format.code) {
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		fmtidx = RAW_8BIT_FMT;
> +		break;
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +		fmtidx = RAW_10BIT_FMT;
> +		break;
> +	case MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8:
> +		fmtidx = RAW_8BIT_FMT;
> +		break;
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +		fmtidx = RAW_12BIT_FMT;
> +		break;
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_VYUY8_1X16:
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +	case MEDIA_BUS_FMT_YVYU8_1X16:
> +		fmtidx = YUV422_FMT;
> +		break;
> +	case MEDIA_BUS_FMT_JPEG_1X8:
> +	case MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8:
> +		fmtidx = JPEG_FMT;
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
> +			       unsigned int seninf)
> +{
> +	unsigned int mux = priv->mux_sel;
> +	void __iomem *pseninf_top = priv->base;
> +	void __iomem *pseninf = priv->base + 0x1000 * mux;
> +	unsigned int val;
> +	unsigned int pix_sel_ext;
> +	unsigned int pix_sel;
> +	unsigned int hs_pol = 0;
> +	unsigned int vs_pol = 0;
> +	unsigned int pixel_mode = ONE_PIXEL_MODE;
> +	unsigned int input_data_type;
> +
> +	/* Enable mux */
> +	SENINF_BITS(pseninf, SENINF_MUX_CTRL, SENINF_MUX_EN, 1);
> +	SENINF_BITS(pseninf, SENINF_MUX_CTRL, SENINF_SRC_SEL, MIPI_SENSOR);
> +	SENINF_BITS(pseninf, SENINF_MUX_CTRL_EXT, SENINF_SRC_SEL_EXT,
> +		    NORMAL_MODEL);
> +	input_data_type = mtk_seninf_map_fmt(priv);
> +
> +	switch (pixel_mode) {

pixel_mode is always set to ONE_PIXEL_MODE.

> +	case 1: /* 2 Pixel */
> +		pix_sel_ext = 0;
> +		pix_sel = 1;
> +		break;
> +	case 2: /* 4 Pixel */
> +		pix_sel_ext = 1;
> +		pix_sel = 0;
> +		break;
> +	default: /* 1 Pixel */
> +		pix_sel_ext = 0;
> +		pix_sel = 0;
> +		break;
> +	}
> +
> +	SENINF_BITS(pseninf, SENINF_MUX_CTRL_EXT, SENINF_PIX_SEL_EXT,
> +		    pix_sel_ext);
> +	SENINF_BITS(pseninf, SENINF_MUX_CTRL, SENINF_PIX_SEL, pix_sel);
> +
> +	if (input_data_type != JPEG_FMT) {
> +		SENINF_BITS(pseninf, SENINF_MUX_CTRL, FIFO_FULL_WR_EN, 2);
> +		SENINF_BITS(pseninf, SENINF_MUX_CTRL, FIFO_FLUSH_EN, 0x1B);
> +		SENINF_BITS(pseninf, SENINF_MUX_CTRL, FIFO_PUSH_EN, 0x1F);
> +	} else {
> +		SENINF_BITS(pseninf, SENINF_MUX_CTRL, FIFO_FULL_WR_EN, 0);
> +		SENINF_BITS(pseninf, SENINF_MUX_CTRL, FIFO_FLUSH_EN, 0x18);
> +		SENINF_BITS(pseninf, SENINF_MUX_CTRL, FIFO_PUSH_EN, 0x1E);
> +	}
> +
> +	SENINF_BITS(pseninf, SENINF_MUX_CTRL, SENINF_HSYNC_POL, hs_pol);
> +	SENINF_BITS(pseninf, SENINF_MUX_CTRL, SENINF_VSYNC_POL, vs_pol);
> +
> +	val = (readl(pseninf + SENINF_MUX_CTRL) | 0x3) & 0xFFFFFFFC;
> +	writel(val, pseninf + SENINF_MUX_CTRL);
> +
> +	/* Set top mux */
> +	val = (readl(pseninf_top + SENINF_TOP_MUX_CTRL) &
> +		(~(0xF << (mux * 4))))	| ((seninf & 0xF) << (mux * 4));

Please define macros for all the numerals.

> +	writel(val, pseninf_top + SENINF_TOP_MUX_CTRL);
> +}
> +
> +static void mtk_seninf_rx_config(struct mtk_seninf *priv,
> +				 unsigned int seninf)
> +{
> +	unsigned int port = priv->port;
> +	void __iomem *pseninf = priv->base + 0x1000 * seninf;
> +
> +	if (is_4d1c(port)) {
> +		SENINF_BITS(pseninf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN0_MUX, 1);
> +		SENINF_BITS(pseninf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN1_MUX, 2);
> +		SENINF_BITS(pseninf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN2_MUX, 0);
> +		SENINF_BITS(pseninf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN3_MUX, 3);
> +	} else {
> +		SENINF_BITS(pseninf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN0_MUX, 0);
> +		SENINF_BITS(pseninf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN1_MUX, 1);
> +		SENINF_BITS(pseninf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN2_MUX, 2);
> +		SENINF_BITS(pseninf, MIPI_RX_CON24_CSI0,
> +			    CSI0_BIST_LN3_MUX, 3);
> +	}

This could also be parametrized, as I mentioned below.

> +}
> +
> +static void mtk_seninf_set_csi_mipi(struct mtk_seninf *priv,
> +				    unsigned int seninf)
> +{
> +	void __iomem *seninf_base = priv->base;
> +	void __iomem *pseninf = priv->base + 0x1000 * seninf;
> +	unsigned int dpcm = mtk_seninf_get_dpcm(priv);
> +	unsigned int data_lane_num = priv->sensor[priv->port].num_data_lanes;
> +	unsigned int cal_sel;
> +	unsigned int data_header_order = 1;
> +	unsigned int val = 0;
> +
> +	dev_dbg(priv->dev, "IS_4D1C %d port %d\n",
> +		is_4d1c(priv->port), priv->port);
> +
> +	switch (priv->port) {
> +	case CFG_CSI_PORT_1:
> +		cal_sel = 1;
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI1,
> +			    DPHY_MODE, 0);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI1,
> +			    CK_SEL_1, 2);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI1,
> +			    PHY_SENINF_LANE_MUX_CSI1_EN, 1);
> +		break;
> +	case CFG_CSI_PORT_2:
> +		cal_sel = 2;
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI2,
> +			    DPHY_MODE, 0);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI2,
> +			    CK_SEL_1, 2);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI2,
> +			    PHY_SENINF_LANE_MUX_CSI2_EN, 1);
> +		break;
> +	case CFG_CSI_PORT_0:
> +		cal_sel = 0;
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			    DPHY_MODE, 0);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			    CK_SEL_1, 2);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			    PHY_SENINF_LANE_MUX_CSI0_EN, 1);
> +		break;
> +	case CFG_CSI_PORT_0A:
> +	case CFG_CSI_PORT_0B:
> +		cal_sel = 0;
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			    DPHY_MODE, 1);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			    CK_SEL_1, 1);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			    CK_SEL_2, 1);
> +		SENINF_BITS(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			    PHY_SENINF_LANE_MUX_CSI0_EN, 1);
> +		break;
> +	}

Could this be parametrized instead? There could be an array of structs
describing each port and the right values to set for each.

> +
> +	/* First Enable Sensor interface and select pad (0x1a04_0200) */
> +	SENINF_BITS(pseninf, SENINF_CTRL, SENINF_EN, 1);
> +	SENINF_BITS(pseninf, SENINF_CTRL, PAD2CAM_DATA_SEL, PAD_10BIT);
> +	SENINF_BITS(pseninf, SENINF_CTRL, SENINF_SRC_SEL, 0);
> +	SENINF_BITS(pseninf, SENINF_CTRL_EXT, SENINF_CSI2_IP_EN, 1);
> +	SENINF_BITS(pseninf, SENINF_CTRL_EXT, SENINF_NCSI2_IP_EN, 0);
> +
> +	/* DPCM Enable */
> +	val = 1 << ((dpcm == 0x2a) ? 15 : ((dpcm & 0xF) + 7));

I can only see 0x2a and 0x00 being ever returned by mtk_seninf_get_dpcm().

> +	writel(val, pseninf + SENINF_CSI2_DPCM);
> +
> +	/* Settle delay */
> +	SENINF_BITS(pseninf, SENINF_CSI2_LNRD_TIMING,
> +		    DATA_SETTLE_PARAMETER, SENINF_SETTLE_DELAY);
> +	/* CSI2 control */
> +	val = readl(pseninf + SENINF_CSI2_CTL) | (data_header_order << 16) |
> +		0x10 | ((1 << data_lane_num) - 1);
> +	writel(val, pseninf + SENINF_CSI2_CTL);
> +
> +	SENINF_BITS(pseninf, SENINF_CSI2_RESYNC_MERGE_CTL,
> +		    BYPASS_LANE_RESYNC, 0);
> +	SENINF_BITS(pseninf, SENINF_CSI2_RESYNC_MERGE_CTL, CDPHY_SEL, 0);
> +	SENINF_BITS(pseninf, SENINF_CSI2_RESYNC_MERGE_CTL,
> +		    CPHY_LANE_RESYNC_CNT, 3);
> +	SENINF_BITS(pseninf, SENINF_CSI2_MODE, CSR_CSI2_MODE, 0);
> +	SENINF_BITS(pseninf, SENINF_CSI2_MODE, CSR_CSI2_HEADER_LEN, 0);
> +	SENINF_BITS(pseninf, SENINF_CSI2_DPHY_SYNC, SYNC_SEQ_MASK_0, 0xff00);
> +	SENINF_BITS(pseninf, SENINF_CSI2_DPHY_SYNC, SYNC_SEQ_PAT_0, 0x001d);
> +
> +	SENINF_BITS(pseninf, SENINF_CSI2_CTL, CLOCK_HS_OPTION, 0);
> +	SENINF_BITS(pseninf, SENINF_CSI2_CTL, HSRX_DET_EN, 0);
> +	SENINF_BITS(pseninf, SENINF_CSI2_CTL, HS_TRAIL_EN, 1);
> +	SENINF_BITS(pseninf, SENINF_CSI2_HS_TRAIL, HS_TRAIL_PARAMETER,
> +		    SENINF_HS_TRAIL_PARAMETER);
> +
> +	/* Set debug port to output packet number */
> +	SENINF_BITS(pseninf, SENINF_CSI2_DGB_SEL, DEBUG_EN, 1);
> +	SENINF_BITS(pseninf, SENINF_CSI2_DGB_SEL, DEBUG_SEL, 0x1a);
> +	/* Enable CSI2 IRQ mask */
> +	/* Turn on all interrupt */
> +	writel(0xffffffff, pseninf + SENINF_CSI2_INT_EN);
> +	/* Write clear CSI2 IRQ */
> +	writel(0xffffffff, pseninf + SENINF_CSI2_INT_STATUS);
> +	/* Enable CSI2 Extend IRQ mask */
> +	/* Turn on all interrupt */
> +	SENINF_BITS(pseninf, SENINF_CTRL, CSI2_SW_RST, 1);
> +	udelay(1);

nit: Separating a delay with blank lines above and below would improve the
readability of the code.

> +	SENINF_BITS(pseninf, SENINF_CTRL, CSI2_SW_RST, 0);
> +}
> +
> +static int mtk_seninf_power_on(struct mtk_seninf *priv)
> +{
> +	void __iomem *pseninf = priv->base;
> +	struct device *dev = priv->dev;
> +	unsigned int seninf;
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
> +		pm_runtime_put_noidle(priv->dev);
> +		return ret;
> +	}
> +
> +	/* Configure timestamp */
> +	SENINF_BITS(pseninf, SENINF_CTRL, SENINF_EN, 1);
> +	SENINF_BITS(pseninf, SENINF_CTRL_EXT, SENINF_CSI2_IP_EN, 1);
> +	writel(SENINF_TIMESTAMP_STEP, pseninf + SENINF_TG1_TM_STP);
> +
> +	phy_set_mode_ext(priv->dphy, PHY_MODE_MIPI_DPHY, priv->port);
> +	phy_power_on(priv->dphy);
> +
> +	mtk_seninf_rx_config(priv, seninf);
> +
> +	mtk_seninf_set_csi_mipi(priv, seninf);
> +
> +	mtk_seninf_set_mux(priv, seninf);
> +
> +	writel(0x0, pseninf + SENINF_TOP_CAM_MUX_CTRL);
> +
> +	return 0;
> +}
> +
> +static void mtk_seninf_power_off(struct mtk_seninf *priv)
> +{
> +	unsigned int seninf = mtk_seninf_csi_port_to_seninf(priv->port);
> +	void __iomem *pseninf = priv->base + 0x1000 * seninf;

Please define a macro for the number here.

> +
> +	/* Disable CSI2(2.5G) first */
> +	writel(readl(pseninf + SENINF_CSI2_CTL) & 0xFFFFFFE0,

Ditto.

> +	       pseninf + SENINF_CSI2_CTL);
> +
> +	phy_power_off(priv->dphy);
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
> +	struct mtk_seninf *priv = sd_to_mtk_seninf(sd);
> +	struct v4l2_mbus_framefmt *mf;
> +
> +	if (fmt->format.code == ~0U || fmt->format.code == 0)
> +		fmt->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;

What is this for?

> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> +	} else {
> +		priv->fmt[fmt->pad].pad = fmt->pad;
> +		mf = &priv->fmt[fmt->pad].format;
> +	}
> +	*mf = fmt->format;
> +
> +	return 0;
> +}
> +
> +static int seninf_get_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct mtk_seninf *priv = sd_to_mtk_seninf(sd);
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> +	else
> +		fmt->format = priv->fmt[fmt->pad].format;
> +
> +	return 0;
> +}
> +
> +static int seninf_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_pad_config *cfg,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct mtk_seninf *priv = sd_to_mtk_seninf(sd);
> +
> +	if (code->index >= NUM_PADS)

Should this be code->pad?

But actually, this operation has to return the list of all supported mbus
codes for given pad, not the currently set one.

> +		return -EINVAL;
> +
> +	code->code = priv->fmt[code->index].format.code;

Ditto.

> +
> +	return 0;
> +}
> +
> +static int seninf_s_stream(struct v4l2_subdev *sd, int on)
> +{
> +	struct mtk_seninf *priv = sd_to_mtk_seninf(sd);
> +
> +	if (on)
> +		return mtk_seninf_power_on(priv);
> +	mtk_seninf_power_off(priv);
> +
> +	return 0;
> +};
> +
> +static const struct v4l2_subdev_pad_ops seninf_subdev_pad_ops = {
> +	.link_validate = v4l2_subdev_link_validate_default,
> +	.init_cfg = seninf_init_cfg,
> +	.set_fmt = seninf_set_fmt,
> +	.get_fmt = seninf_get_fmt,
> +	.enum_mbus_code = seninf_enum_mbus_code,
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
> +
> +	if (!(flags & MEDIA_LNK_FL_ENABLED))
> +		return 0;
> +
> +	if (local->flags & MEDIA_PAD_FL_SOURCE) {
> +		priv->mux_sel = local->index - CAM_MUX_IDX_MIN;
> +	} else {
> +		/* Select port */
> +		priv->port = local->index;
> +		if (priv->port >= NUM_SENSORS) {
> +			dev_err(dev, "port index is over number of ports\n");
> +			return -EINVAL;
> +		}
> +	}

What happens if there are more than 1 source or sink pads with enabled
links?

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
> +static int mtk_seninf_notifier_bound(
> +			struct v4l2_async_notifier *notifier,
> +			struct v4l2_subdev *sd,
> +			struct v4l2_async_subdev *asd)
> +{
> +	struct mtk_seninf *priv =
> +		container_of(notifier, struct mtk_seninf, notifier);
> +	struct sensor_async_subdev *s_asd =
> +		container_of(asd, struct sensor_async_subdev, asd);
> +	int ret;
> +
> +	dev_dbg(priv->dev, "%s bound with port:%d lanes: %d\n",
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
> +static int seninf_dump_debug_info(struct mtk_seninf *priv)
> +{
> +	void __iomem *pseninf = priv->base;
> +	struct device *dev = priv->dev;
> +
> +	/* Sensor Interface Control */
> +	dev_dbg(dev,
> +		"SENINF_CSI2_CTL SENINF1:0x%x\n",
> +		readl(pseninf + SENINF_CSI2_CTL));
> +	/* Read width/height */
> +	/* Read interrupt status */
> +	dev_dbg(dev, "SENINF_IRQ:0x%x\n",
> +		readl(pseninf + SENINF_CSI2_INT_STATUS));
> +	/* Mux1 */
> +	dev_dbg(dev, "SENINF_MUX_CTRL:0x%x, INTSTA:0x%x, DEBUG_2(0x%x)\n",
> +		readl(pseninf + SENINF_MUX_CTRL),
> +		readl(pseninf + SENINF_MUX_INTSTA),
> +		readl(pseninf + SENINF_MUX_DEBUG_2));
> +	if (readl(pseninf + SENINF_MUX_INTSTA) & 0x1) {
> +		writel(0xffffffff, pseninf + SENINF_MUX_INTSTA);
> +		usleep_range(1000, 1000 * 2);
> +		dev_warn(dev, "overrun CTRL:%x INTSTA:%x DEBUG_2:%x\n",
> +			 readl(pseninf + SENINF_MUX_CTRL),
> +			 readl(pseninf + SENINF_MUX_INTSTA),
> +			 readl(pseninf + SENINF_MUX_DEBUG_2));
> +	}
> +
> +	return 0;
> +}

Hmm, this isn't really something that can be requested by a V4L2 control.
If you think this kind of debugging feature is really useful, it could be
implemented by the way of a debugfs file, but I'd probably just remove it.

> +
> +static int seninf_enable_test_pattern(struct mtk_seninf *priv)
> +{
> +	void __iomem *pseninf = priv->base;
> +	unsigned int val;
> +
> +	SENINF_BITS(pseninf, SENINF_TOP_CTRL, SENINF_PCLK_EN, 1);
> +	SENINF_BITS(pseninf, SENINF_TOP_CTRL, SENINF2_PCLK_EN, 1);
> +	SENINF_BITS(pseninf, SENINF_CTRL, SENINF_EN, 1);
> +	SENINF_BITS(pseninf, SENINF_CTRL, SENINF_SRC_SEL, 1);
> +	SENINF_BITS(pseninf, SENINF_MUX_CTRL, SENINF_HSYNC_MASK, 1);
> +	SENINF_BITS(pseninf, SENINF_MUX_CTRL, SENINF_SRC_SEL, 1);
> +	SENINF_BITS(pseninf, SENINF_MUX_CTRL, FIFO_PUSH_EN, 0x1f);
> +	SENINF_BITS(pseninf, SENINF_MUX_CTRL, FIFO_FLUSH_EN, 0x1b);
> +	SENINF_BITS(pseninf, SENINF_MUX_CTRL, FIFO_FULL_WR_EN, 1);
> +	SENINF_BITS(pseninf, SENINF_MUX_CTRL, SENINF_MUX_EN, 1);

As I pointed out for the PHY driver, this kind of register
read-modify-write macros suffers from a number of problems. As you see on
this example, you end up reading and writing the SENINF_MUX_CTRL register 6
times, while all the fields could be updated in one go if done explicitly.

> +	writel(SENINF_IRQ_CLR_SEL | SENINF_ALL_ERR_IRQ_EN,
> +	       pseninf + SENINF_MUX_INTEN);
> +	writel(0x0, pseninf + SENINF_MUX_SPARE);
> +	writel(0xE2000, pseninf + SENINF_MUX_CTRL_EXT);
> +	writel(0x0, pseninf + SENINF_MUX_CTRL_EXT);
> +	SENINF_BITS(pseninf, SENINF_TG1_TM_CTL, TM_EN, 1);
> +	SENINF_BITS(pseninf, SENINF_TG1_TM_CTL, TM_PAT, 0xC);
> +	SENINF_BITS(pseninf, SENINF_TG1_TM_CTL, TM_VSYNC, 4);
> +	SENINF_BITS(pseninf, SENINF_TG1_TM_CTL, TM_DUMMYPXL, 4);
> +	val = (priv->fmt[priv->port].format.height + 0x100) << 16 |
> +		  (priv->fmt[priv->port].format.width + 0x100);
> +	writel(val, pseninf + SENINF_TG1_TM_SIZE);
> +	writel(0x0, pseninf + SENINF_TG1_TM_CLK);
> +	writel(0x1, pseninf + SENINF_TG1_TM_STP);
> +	writel(readl(pseninf + SENINF_CTRL_EXT) | 0x02,
> +	       pseninf + SENINF_CTRL_EXT);
> +
> +	return 0;

This function always returns 0, so it can be made void.

> +}
> +
> +static int seninf_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mtk_seninf *priv = container_of(ctrl->handler,
> +					     struct mtk_seninf, ctrl_handler);
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		if (ctrl->val == TEST_GEN_PATTERN)
> +			return seninf_enable_test_pattern(priv);
> +		else if (ctrl->val == TEST_DUMP_DEBUG_INFO)
> +			return seninf_dump_debug_info(priv);
> +		else
> +			return -EINVAL;

The framework already validates the range for you.

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

Shouldn't this also include an entry for "Disabled"?

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

There seems to be only 1 control below.

> +	if (ret)
> +		return ret;
> +
> +	v4l2_ctrl_new_std_menu_items(handler, &seninf_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(seninf_test_pattern_menu) - 1,
> +				     0, 0, seninf_test_pattern_menu);
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
> +static int mtk_seninf_media_register(struct mtk_seninf *priv)
> +{
> +	struct v4l2_subdev *sd = &priv->subdev;
> +	struct media_pad *pads = priv->pads;
> +	struct device *dev = priv->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	v4l2_subdev_init(sd, &seninf_subdev_ops);
> +
> +	init_fmt(priv);
> +	ret = seninf_initialize_controls(priv);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize controls\n");
> +		return -EINVAL;
> +	}
> +
> +	sd->flags |= (V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS);

Is there a need for the OR operation?

Also, the parentheses are not necessary.

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
> +
> +	for (i = 0; i < NUM_SENSORS; ++i) {
> +		struct v4l2_fwnode_endpoint vep = {
> +			.bus_type = V4L2_MBUS_CSI2_DPHY
> +		};
> +		struct fwnode_handle *ep;
> +		struct sensor_async_subdev *s_asd = NULL;
> +
> +		ep = fwnode_graph_get_endpoint_by_id(
> +				dev_fwnode(priv->dev), i, 0,
> +				FWNODE_GRAPH_ENDPOINT_NEXT);
> +		if (!ep)
> +			continue;
> +
> +		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +		if (ret)
> +			goto err_parse;
> +
> +		s_asd = kzalloc(sizeof(*s_asd), GFP_KERNEL);
> +		if (!s_asd) {
> +			ret = -ENOMEM;
> +			goto err_parse;
> +		}
> +		s_asd->port = vep.base.port;
> +		s_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
> +		ret = v4l2_async_notifier_add_fwnode_remote_subdev(
> +				&priv->notifier, ep, &s_asd->asd);
> +		if (ret)
> +			goto err_parse;
> +
> +		fwnode_handle_put(ep);
> +		continue;
> +err_parse:
> +		fwnode_handle_put(ep);
> +		kfree(s_asd);

For improving readability and avoiding goto labels inside a loop, I'd
suggest moving the contents of the loop into a separate function and simply
calling the function in a loop.

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

Don't we also need to call v4l2_async_notifier_unregister() at this point
and so one more label?

> +	}
> +	return 0;
> +
> +err_clean_notififer:
> +	v4l2_async_notifier_cleanup(&priv->notifier);
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
> +		"cam_seninf", "top_mux_seninf"
> +	};
> +	struct resource *res;
> +	struct mtk_seninf *priv;
> +	struct device *dev = &pdev->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(struct mtk_seninf), GFP_KERNEL);

sizeof(*priv)

It prevents using wrong type as the argument.

> +	if (!priv)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, priv);
> +	priv->dev = dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->dphy = devm_phy_get(dev, "seninf");
> +	if (IS_ERR(priv->dphy)) {
> +		dev_err(dev, "failed to get phy:%d\n", PTR_ERR(priv->dphy));
> +		return PTR_ERR(priv->dphy);
> +	}
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
> +	if (!ret) /* register success */
> +		pm_runtime_enable(dev);

The default kernel convention is to return on failure. Would it be possible
to stick to it if there is no specific reason not to?

> +
> +	return ret;
> +}
> +
> +static int seninf_pm_suspend(struct device *dev)

Should this function be called _runtime_suspend() instead?

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

_runtime_resume()?

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

This structure is used for all PM ops, not only runtime. How about renaming
the variable to "mtk_seninf_pm_ops"?

> +	SET_RUNTIME_PM_OPS(seninf_pm_suspend, seninf_pm_resume, NULL)

I wonder if we don't need system PM ops here as well. What happens if the
system is suspended while the camera is streaming?

> +};
> +
> +static int seninf_remove(struct platform_device *pdev)

Could we prefix the symbols with mtk_? E.g. mtk_seninf_remove(). This would
make it easier to avoid collisions during name lookups, e.g. in indexing
tools like elixir or debuggers like gdb.

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

Maybe "mtk-seninf"?

> +		.pm  = &runtime_pm_ops,
> +		.of_match_table = of_match_ptr(mtk_seninf_of_match),
> +	},
> +	.probe	= seninf_probe,
> +	.remove	= seninf_remove,
> +};
> +
> +module_platform_driver(seninf_pdrv);
> +
> +MODULE_DESCRIPTION("MTK sensor interface driver");
> +MODULE_AUTHOR("Louis Kuo <louis.kuo@mediatek.com>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/media/platform/mtk-isp/seninf/mtk_seninf_dphy.c b/drivers/media/platform/mtk-isp/seninf/mtk_seninf_dphy.c
> new file mode 100644
> index 000000000000..8bc910af9c20
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/seninf/mtk_seninf_dphy.c
> @@ -0,0 +1,353 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/phy/phy.h>
> +#include "mtk_seninf_rx_reg.h"
> +
> +#define CSI_PORT_0A_ADDR_OFST	0
> +#define CSI_PORT_0B_ADDR_OFST	0x1000
> +#define CSI_PORT_1_ADDR_OFST	0x2000
> +#define CSI_PORT_2_ADDR_OFST	0x4000
> +/* Mix DPHY/CPHY */
> +#define CSI0A_OFST              0
> +#define CSI0B_OFST              0x1000
> +/* DPHY only */
> +#define CSI1A_OFST              0
> +#define CSI1B_OFST              0x1000
> +
> +enum CFG_CSI_PORT {

The name of the enum is not referenced anyway, so it could be dropped.

> +	CFG_CSI_PORT_0 = 0x0,	/* 4D1C */
> +	CFG_CSI_PORT_1,		/* 4D1C */
> +	CFG_CSI_PORT_2,		/* 4D1C */
> +	CFG_CSI_PORT_0A,	/* 2D1C */
> +	CFG_CSI_PORT_0B,	/* 2D1C */

nit; It would make the driver a bit more readable if the name was a bit
more consistent with other names. Maybe MTK_MIPI_PHY_PORT_*?

> +	CFG_CSI_PORT_MAX_NUM,

This value is not used anywhere.

> +	CFG_CSI_PORT_NONE	/*for non-MIPI sensor */

Ditto.

> +};
> +
> +#define MIPI_BITS(base, reg, field, val) do { \
> +		u32 __iomem *__p = (base) + (reg); \
> +		u32 __v = *__p; \

This is incorrect. Registers must be accessed using appropriate accessor
functions, e.g. readl()/writel() for 32-bit registers. Otherwise,
appropriate operation ordering and other subtle synchronization aspects
can't be guaranteed.

> +		__v &= ~reg##_##field##_MASK; \
> +		__v |= ((val) << reg##_##field##_SHIFT); \
> +		*__p = __v; \

Ditto.

> +	} while (0)

This kind of macros make the driver difficult to read. For example, if you
look at the caller, it would have something like "RG_CSI0A_BG_CORE_EN"
passed as an argument to this macro. It's not an exact name of any macro
and indexing tools, like elixir, wouldn't be able to look it.

Another problem with this kind of macros is that often one needs to change
more than 1 bitfield in the same register. It results in multiple calls to
this macro, which would end up reading and writing the same register
multiple times and wasting CPU and bus cycles.

I'd instead suggest just directly using readl(), bit operations and
writel() in the code.

> +
> +struct mtk_mipi_dphy {
> +	struct device *dev;
> +	void __iomem *rx;
> +	unsigned char __iomem *csi2_rx[CFG_CSI_PORT_MAX_NUM];

What does "rx" mean here? Shouldn't it be something like "base" and
"port_base"?

Given that the first port starts at offset 0, do we still need the first
field?

Also, the type should be void and one should just use appropriate
accessors, e.g. writeb for 8-bit writes.

> +	unsigned int port;
> +};
> +
> +static inline int is_4d1c(unsigned int port)
> +{
> +	return port < CFG_CSI_PORT_0A;
> +}
> +
> +static inline int is_cdphy_combo(unsigned int port)
> +{
> +	return port == CFG_CSI_PORT_0A ||
> +		port == CFG_CSI_PORT_0B ||
> +		port == CFG_CSI_PORT_0;
> +}

Wouldn't it be more scalable to create a per-port structure, which would
have boolean fields to define various properties of the port? That could
look like:

struct mtk_mipi_phy_port_info ports[] = {
	[MTK_MIPI_PHY_PORT_0] = {
		.is_4dlc = true,
		.is_cdphy_combo = true,
	},
	[MTK_MIPI_PHY_PORT_1] = {
		.is_4dlc = true,
		.is_cdphy_combo = false,
	},
	/* ... */
};

> +
> +static void mtk_dphy_enable(struct mtk_mipi_dphy *priv)
> +{
> +	void __iomem *pmipi_rx_base = priv->csi2_rx[CFG_CSI_PORT_0];
> +	unsigned int port = priv->port;
> +	void __iomem *pmipi_rx = priv->csi2_rx[port];
> +
> +	/* Set analog phy mode to DPHY */
> +	if (is_cdphy_combo(port))
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A, RG_CSI0A_CPHY_EN, 0);
> +
> +	if (is_4d1c(port)) {
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L0_CKMODE_EN, 0);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L0_CKSEL, 1);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L1_CKMODE_EN, 0);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L1_CKSEL, 1);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L2_CKMODE_EN, 1);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L2_CKSEL, 1);

nit: Would it make more sense to instead split the implementation into 2
functions, one for 4d1c PHYs and another for non-4d1c ports?

> +	} else {
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L0_CKMODE_EN, 0);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L0_CKSEL, 0);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L1_CKMODE_EN, 1);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L1_CKSEL, 0);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L2_CKMODE_EN, 0);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L2_CKSEL, 0);
> +	}
> +	if (is_cdphy_combo(port))
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_CPHY_EN, 0);
> +
> +	if (is_4d1c(port)) {
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L0_CKMODE_EN, 0);
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L0_CKSEL, 1);
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L1_CKMODE_EN, 0);
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L1_CKSEL, 1);
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L2_CKMODE_EN, 0);
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L2_CKSEL, 1);
> +	} else {
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L0_CKSEL, 0);
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L1_CKMODE_EN, 1);
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L1_CKSEL, 0);
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L2_CKMODE_EN, 0);
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_DPHY_L2_CKSEL, 0);
> +	}
> +	/* Byte clock invert */
> +	MIPI_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> +		  RG_CSI0A_CDPHY_L0_T0_BYTECK_INVERT, 1);
> +	MIPI_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> +		  RG_CSI0A_DPHY_L1_BYTECK_INVERT, 1);
> +	MIPI_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> +		  RG_CSI0A_CDPHY_L2_T1_BYTECK_INVERT, 1);
> +
> +	if (is_4d1c(port)) {
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANAA8_CSI0A,
> +			  RG_CSI0A_CDPHY_L0_T0_BYTECK_INVERT, 1);
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANAA8_CSI0A,
> +			  RG_CSI0A_DPHY_L1_BYTECK_INVERT, 1);
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANAA8_CSI0A,
> +			  RG_CSI0A_CDPHY_L2_T1_BYTECK_INVERT, 1);
> +	}
> +
> +	/* Start ANA EQ tuning */
> +	if (is_cdphy_combo(port)) {
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0A,
> +			  RG_CSI0A_L0_T0AB_EQ_IS, 1);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0A,
> +			  RG_CSI0A_L0_T0AB_EQ_BW, 1);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
> +			  RG_CSI0A_L1_T1AB_EQ_IS, 1);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
> +			  RG_CSI0A_L1_T1AB_EQ_BW, 1);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0A,
> +			  RG_CSI0A_L2_T1BC_EQ_IS, 1);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0A,
> +			  RG_CSI0A_L2_T1BC_EQ_BW, 1);
> +
> +		if (is_4d1c(port)) {
> +			MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA18_CSI0A,
> +				  RG_CSI0A_L0_T0AB_EQ_IS, 1);
> +			MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA18_CSI0A,
> +				  RG_CSI0A_L0_T0AB_EQ_BW, 1);
> +			MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA1C_CSI0A,
> +				  RG_CSI0A_L1_T1AB_EQ_IS, 1);
> +			MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA1C_CSI0A,
> +				  RG_CSI0A_L1_T1AB_EQ_BW, 1);
> +			MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA20_CSI0A,
> +				  RG_CSI0A_L2_T1BC_EQ_IS, 1);
> +			MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA20_CSI0A,
> +				  RG_CSI0A_L2_T1BC_EQ_BW, 1);
> +		}
> +	} else {
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> +			  RG_CSI1A_L0_EQ_IS, 1);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> +			  RG_CSI1A_L0_EQ_BW, 1);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> +			  RG_CSI1A_L1_EQ_IS, 1);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> +			  RG_CSI1A_L1_EQ_BW, 1);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1A,
> +			  RG_CSI1A_L2_EQ_IS, 1);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1A,
> +			  RG_CSI1A_L2_EQ_BW, 1);
> +
> +		if (is_4d1c(port)) {
> +			MIPI_BITS(pmipi_rx + CSI1B_OFST, MIPI_RX_ANA18_CSI1A,
> +				  RG_CSI1A_L0_EQ_IS, 1);
> +			MIPI_BITS(pmipi_rx + CSI1B_OFST, MIPI_RX_ANA18_CSI1A,
> +				  RG_CSI1A_L0_EQ_BW, 1);
> +			MIPI_BITS(pmipi_rx + CSI1B_OFST, MIPI_RX_ANA18_CSI1A,
> +				  RG_CSI1A_L1_EQ_IS, 1);
> +			MIPI_BITS(pmipi_rx + CSI1B_OFST, MIPI_RX_ANA18_CSI1A,
> +				  RG_CSI1A_L1_EQ_BW, 1);
> +			MIPI_BITS(pmipi_rx + CSI1B_OFST, MIPI_RX_ANA1C_CSI1A,
> +				  RG_CSI1A_L2_EQ_IS, 1);
> +			MIPI_BITS(pmipi_rx + CSI1B_OFST, MIPI_RX_ANA1C_CSI1A,
> +				  RG_CSI1A_L2_EQ_BW, 1);
> +		}
> +	}
> +
> +	/* End ANA EQ tuning */
> +	writel(0x90, pmipi_rx_base + MIPI_RX_ANA40_CSI0A);
> +	MIPI_BITS(pmipi_rx, MIPI_RX_ANA24_CSI0A,
> +		  RG_CSI0A_RESERVE, 0x40);
> +	if (is_4d1c(port))
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA24_CSI0A,
> +			  RG_CSI0A_RESERVE, 0x40);

Where do the magic numbers come from? Should they be defined in some way?

> +	MIPI_BITS(pmipi_rx, MIPI_RX_WRAPPER80_CSI0A,
> +		  CSR_CSI_RST_MODE, 0);
> +	if (is_4d1c(port))
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_WRAPPER80_CSI0A,
> +			  CSR_CSI_RST_MODE, 0);
> +	/* ANA power on */
> +	MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +		  RG_CSI0A_BG_CORE_EN, 1);
> +	if (is_4d1c(port))
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_BG_CORE_EN, 1);

nit: A blank line here would make the code more readable.

> +	usleep_range(20, 40);

Ditto.

Also, it would be good to have a comment that explain what delay is
expected by the hardware specification.

> +	MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +		  RG_CSI0A_BG_LPF_EN, 1);
> +	if (is_4d1c(port))
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_BG_LPF_EN, 1);
> +}
> +
> +static void mtk_dphy_disable(struct mtk_mipi_dphy *priv)
> +{
> +	void __iomem *pmipi_rx = priv->csi2_rx[priv->port];

nit: How about calling the variable "base", which is the usual name for
the base address of a register space?

> +
> +	/* Disable mipi BG */
> +	switch (priv->port) {
> +	case CFG_CSI_PORT_0A:
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_BG_CORE_EN, 0);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_BG_LPF_EN, 0);
> +		break;
> +	case CFG_CSI_PORT_0B:
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_BG_CORE_EN, 0);
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_BG_LPF_EN, 0);
> +		break;
> +	default:
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_BG_CORE_EN, 0);
> +		MIPI_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_BG_LPF_EN, 0);
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_BG_CORE_EN, 0);
> +		MIPI_BITS(pmipi_rx + CSI0B_OFST, MIPI_RX_ANA00_CSI0A,
> +			  RG_CSI0A_BG_LPF_EN, 0);
> +		break;
> +	}
> +}
> +
> +static int mtk_mipi_phy_power_on(struct phy *phy)
> +{
> +	struct mtk_mipi_dphy *priv = phy_get_drvdata(phy);
> +
> +	mtk_dphy_enable(priv);
> +
> +	return 0;
> +}
> +
> +static int mtk_mipi_phy_power_off(struct phy *phy)
> +{
> +	struct mtk_mipi_dphy *priv = phy_get_drvdata(phy);
> +
> +	mtk_dphy_disable(priv);
> +
> +	return 0;
> +}

Do we need these two one line functions above?

> +
> +static int mtk_phy_set_mode(struct phy *phy,
> +			    enum phy_mode mode, int submode)
> +{
> +	struct mtk_mipi_dphy *priv = phy_get_drvdata(phy);
> +
> +	priv->port = submode;

This isn't how ports should be exposed in this API. There should be one phy
object exposed for each port and ports should be linked to appropriate
consumers in DT, according to the PHY DT bindings.

> +	dev_dbg(priv->dev, "port %d\n", priv->port);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops mtk_dphy_ops = {
> +	.power_on	= mtk_mipi_phy_power_on,
> +	.power_off	= mtk_mipi_phy_power_off,
> +	.set_mode	= mtk_phy_set_mode,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static int mipi_dphy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct mtk_mipi_dphy *priv;
> +	struct phy_provider *phy_provider;
> +	struct phy *phy;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, priv);
> +	priv->dev = dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->rx = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->rx))
> +		return PTR_ERR(priv->rx);
> +
> +	priv->csi2_rx[CFG_CSI_PORT_0]  = priv->rx;
> +	priv->csi2_rx[CFG_CSI_PORT_0A] = priv->rx + CSI_PORT_0A_ADDR_OFST;
> +	priv->csi2_rx[CFG_CSI_PORT_0B] = priv->rx + CSI_PORT_0B_ADDR_OFST;
> +	priv->csi2_rx[CFG_CSI_PORT_1]  = priv->rx + CSI_PORT_1_ADDR_OFST;
> +	priv->csi2_rx[CFG_CSI_PORT_2]  = priv->rx + CSI_PORT_2_ADDR_OFST;
> +
> +	phy = devm_phy_create(dev, NULL, &mtk_dphy_ops);
> +	if (IS_ERR(phy)) {
> +		dev_err(dev, "failed to create phy\n");
> +		return PTR_ERR(phy);
> +	}
> +	phy_set_drvdata(phy, priv);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id mtk_mipi_dphy_of_match[] = {
> +	{.compatible = "mediatek,mt8183-mipi_dphy"},

"_" is not recommended in DT compatible strings. Please use "-" instead.

> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_mipi_dphy_of_match);
> +#endif
> +
> +static struct platform_driver mipi_dphy_pdrv = {
> +	.probe	= mipi_dphy_probe,
> +	.driver	= {
> +		.name	= "mipi_dphy",
> +		.of_match_table = of_match_ptr(mtk_mipi_dphy_of_match),
> +	},
> +};
> +
> +module_platform_driver(mipi_dphy_pdrv);
> +
> +MODULE_DESCRIPTION("MTK mipi dphy driver");
> +MODULE_AUTHOR("Louis Kuo <louis.kuo@mediatek.com>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/media/platform/mtk-isp/seninf/mtk_seninf_reg.h b/drivers/media/platform/mtk-isp/seninf/mtk_seninf_reg.h
> new file mode 100644
> index 000000000000..1d1147b16b96
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/seninf/mtk_seninf_reg.h
> @@ -0,0 +1,1491 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __SENINF_REG_H__
> +#define __SENINF_REG_H__
> +
> +#define BIT(nr) (1UL << (nr))
> +
> +#define SENINF_TOP_CTRL                                        0x0000
> +#define SENINF_TOP_CTRL_SENINF_PCLK_SEL_SHIFT 8

This macro doesn't seem to be used anywhere in the patch. Please remove
unused definitions.

> +#define SENINF_TOP_CTRL_SENINF_PCLK_SEL_MASK  BIT(8)

There is no need to define SHIFT and MASK for single bit fields. Please
just keep one macro defined using BIT() without any _SHIFT or _MASK suffix
in the name.

Also, the names in this file are too long to be usable in a reasonable way
in the driver. I'd suggest applying the following transformations to
simplify them:
 - Keep only one "SENINF", at the beginning of the name.
 - Drop the register name from the bitfield macros wherever not ambiguous.
 - Use parametrized macros for series of similar bitfields.

For example:

#define SENINF_TOP_CTRL					0x0000
#define		SENINF_PCLK_SEL(n)		BIT(8 + (n))
#define		SENINF_PCLK_EN(n)		BIT(10 + (n))

> +#define SENINF_TOP_CTRL_SENINF2_PCLK_SEL_SHIFT 9
> +#define SENINF_TOP_CTRL_SENINF2_PCLK_SEL_MASK  BIT(9)
> +#define SENINF_TOP_CTRL_SENINF_PCLK_EN_SHIFT  10
> +#define SENINF_TOP_CTRL_SENINF_PCLK_EN_MASK   BIT(10)
> +#define SENINF_TOP_CTRL_SENINF2_PCLK_EN_SHIFT  11
> +#define SENINF_TOP_CTRL_SENINF2_PCLK_EN_MASK   BIT(11)
> +#define SENINF_TOP_CTRL_SENINF_TOP_N3D_SW_RST_SHIFT 16
> +#define SENINF_TOP_CTRL_SENINF_TOP_N3D_SW_RST_MASK BIT(16)
> +#define SENINF_TOP_CTRL_SENINF_TOP_DBG_SEL_SHIFT 28
> +#define SENINF_TOP_CTRL_SENINF_TOP_DBG_SEL_MASK (0x7 << 28)
[snip]
> +#define SENINF_TOP_CAM_MUX_CTRL                                0x0010
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM0_MUX_SRC_SEL_SHIFT 0
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM0_MUX_SRC_SEL_MASK (0xf << 0)
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM1_MUX_SRC_SEL_SHIFT 4
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM1_MUX_SRC_SEL_MASK (0xf << 4)
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM2_MUX_SRC_SEL_SHIFT 8
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM2_MUX_SRC_SEL_MASK (0xf << 8)
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM3_MUX_SRC_SEL_SHIFT 12
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM3_MUX_SRC_SEL_MASK (0xf << 12)
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM4_MUX_SRC_SEL_SHIFT 16
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM4_MUX_SRC_SEL_MASK (0xf << 16)
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM5_MUX_SRC_SEL_SHIFT 20
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM5_MUX_SRC_SEL_MASK (0xf << 20)
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM6_MUX_SRC_SEL_SHIFT 24
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM6_MUX_SRC_SEL_MASK (0xf << 24)
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM7_MUX_SRC_SEL_SHIFT 28
> +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM7_MUX_SRC_SEL_MASK (0xf << 28)

Related to my comment above, this could be further consolidated into:

#define SENINF_TOP_CAM_MUX_CTRL			0x0010
#define		SENINF_TOP_CAM_MUX_SEL_SHIFT(n) (4 * (n))
#define		SENINF_TOP_CAM_MUX_SEL_MASK(n)	(0xf << (4 * (n)))

> +#define SENINF_TOP_N3D_A_CTL                                   0x0014
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S1_SEN_PCLK_SRC_SEL_A_SHIFT 0
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S1_SEN_PCLK_SRC_SEL_A_MASK (0x7 << 0)
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S1_SEN_VSYNC_SRC_SEL_A_SHIFT 4
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S1_SEN_VSYNC_SRC_SEL_A_MASK (0x7 << 4)
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S2_SEN_PCLK_SRC_SEL_A_SHIFT 8
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S2_SEN_PCLK_SRC_SEL_A_MASK (0x7 << 8)
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S2_SEN_VSYNC_SRC_SEL_A_SHIFT 12
> +#define SENINF_TOP_N3D_A_CTL_SENINF_N3D_S2_SEN_VSYNC_SRC_SEL_A_MASK (0x7 << 12)
> +#define SENINF_TOP_N3D_B_CTL                                   0x0018
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S1_SEN_PCLK_SRC_SEL_B_SHIFT 0
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S1_SEN_PCLK_SRC_SEL_B_MASK (0x7 << 0)
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S1_SEN_VSYNC_SRC_SEL_B_SHIFT 4
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S1_SEN_VSYNC_SRC_SEL_B_MASK (0x7 << 4)
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S2_SEN_PCLK_SRC_SEL_B_SHIFT 8
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S2_SEN_PCLK_SRC_SEL_B_MASK (0x7 << 8)
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S2_SEN_VSYNC_SRC_SEL_B_SHIFT 12
> +#define SENINF_TOP_N3D_B_CTL_SENINF_N3D_S2_SEN_VSYNC_SRC_SEL_B_MASK (0x7 << 12)

The two registers share the same layout.

> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0                         0x001C

nit: Kernel coding style mentions lowercase for hex numerals.

> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_DPHY_MODE_SHIFT 0
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_DPHY_MODE_MASK BIT(0)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CPHY_MODE_SHIFT 4
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CPHY_MODE_MASK (0x3 << 4)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CK_SEL_1_SHIFT 8
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CK_SEL_1_MASK (0x7 << 8)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CK_SEL_2_SHIFT 12
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CK_SEL_2_MASK (0x3 << 12)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_PHY_SENINF_LANE_MUX_CSI0_EN_SHIFT 31
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_PHY_SENINF_LANE_MUX_CSI0_EN_MASK \
> +BIT(31)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1                         0x0020
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_DPHY_MODE_SHIFT 0
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_DPHY_MODE_MASK BIT(0)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_CPHY_MODE_SHIFT 4
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_CPHY_MODE_MASK (0x3 << 4)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_CK_SEL_1_SHIFT 8
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_CK_SEL_1_MASK (0x7 << 8)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_CK_SEL_2_SHIFT 12
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_CK_SEL_2_MASK (0x3 << 12)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_PHY_SENINF_LANE_MUX_CSI1_EN_SHIFT 31
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_PHY_SENINF_LANE_MUX_CSI1_EN_MASK \
> +BIT(31)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2                         0x0024
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_DPHY_MODE_SHIFT 0
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_DPHY_MODE_MASK BIT(0)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_CPHY_MODE_SHIFT 4
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_CPHY_MODE_MASK (0x3 << 4)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_CK_SEL_1_SHIFT 8
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_CK_SEL_1_MASK (0x7 << 8)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_CK_SEL_2_SHIFT 12
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_CK_SEL_2_MASK (0x3 << 12)
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_PHY_SENINF_LANE_MUX_CSI2_EN_SHIFT 31
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2_PHY_SENINF_LANE_MUX_CSI2_EN_MASK \
> +BIT(31)

The 3 registers above have exactly the same layouts. We could define them
as below:

#define SENINF_TOP_PHY_SENINF_CTL_CSI(n)	(0x001c + 0x4*(n))
#define		SENINF_TOP_PHY_DPHY_MODE	BIT(0)
#define		SENINF_TOP_PHY_CPHY_MODE_SHIFT	4
#define		SENINF_TOP_PHY_CPHY_MODE_MASK	(0x3 << 4)
#define		SENINF_TOP_PHY_CK_SEL_SHIFT(n)	(8 + 4*((n) - 1))
#define		SENINF_TOP_PHY_CK_SEL_MASK(n)	\
			((((n) - 1) ? 0x3 : 0x7) << 4*((n) - 1))
#define		SENINF_TOP_PHY_LANE_MUX_EN	BIT(31)

> +#define SENINF_N3D_A_CTL                                       0x0100
> +#define SENINF_N3D_A_CTL_MODE_SHIFT            0
> +#define SENINF_N3D_A_CTL_MODE_MASK             (0x3 << 0)
> +#define SENINF_N3D_A_CTL_I2C1_EN_SHIFT         2
> +#define SENINF_N3D_A_CTL_I2C1_EN_MASK          BIT(2)
> +#define SENINF_N3D_A_CTL_I2C2_EN_SHIFT         3
> +#define SENINF_N3D_A_CTL_I2C2_EN_MASK          BIT(3)
> +#define SENINF_N3D_A_CTL_I2C1_INT_EN_SHIFT     4
> +#define SENINF_N3D_A_CTL_I2C1_INT_EN_MASK      BIT(4)
> +#define SENINF_N3D_A_CTL_I2C2_INT_EN_SHIFT     5
> +#define SENINF_N3D_A_CTL_I2C2_INT_EN_MASK      BIT(5)
> +#define SENINF_N3D_A_CTL_N3D_EN_SHIFT          6
> +#define SENINF_N3D_A_CTL_N3D_EN_MASK           BIT(6)
> +#define SENINF_N3D_A_CTL_W1CLR_SHIFT           7
> +#define SENINF_N3D_A_CTL_W1CLR_MASK            BIT(7)
> +#define SENINF_N3D_A_CTL_DIFF_EN_SHIFT         8
> +#define SENINF_N3D_A_CTL_DIFF_EN_MASK          BIT(8)
> +#define SENINF_N3D_A_CTL_DDBG_SEL_SHIFT        9
> +#define SENINF_N3D_A_CTL_DDBG_SEL_MASK         (0x7 << 9)
[snip]
> +#define SENINF_TG1_TM_CLK_TM_CLK_CNT_SHIFT     0
> +#define SENINF_TG1_TM_CLK_TM_CLK_CNT_MASK      (0xf << 0)
> +#define SENINF_TG1_TM_CLK_TM_CLRBAR_OFT_SHIFT  16
> +#define SENINF_TG1_TM_CLK_TM_CLRBAR_OFT_MASK   (0x3ff << 16)
> +#define SENINF_TG1_TM_CLK_TM_CLRBAR_IDX_SHIFT  28
> +#define SENINF_TG1_TM_CLK_TM_CLRBAR_IDX_MASK   (0x7 << 28)
> +#define SENINF_TG1_TM_STP                                      0x0614
> +#define SENINF_TG1_TM_STP_TG1_TM_STP_SHIFT     0
> +#define SENINF_TG1_TM_STP_TG1_TM_STP_MASK      (0xffffffff << 0)
> +#define MIPI_RX_CON24_CSI0                                     0x0824
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_NUM_SHIFT 0

I suspect there is no need to repeat "CSI0" twice in the names of the
definitions.

> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_NUM_MASK  (0x3 << 0)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_EN_SHIFT  2
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_EN_MASK   BIT(2)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_FIX_PAT_SHIFT 5
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_FIX_PAT_MASK BIT(5)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_CLK_SEL_SHIFT 6
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_CLK_SEL_MASK BIT(6)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_CLK4X_SEL_SHIFT 7
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_CLK4X_SEL_MASK BIT(7)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_TERM_DELAY_SHIFT 8
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_TERM_DELAY_MASK (0xff << 8)
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_SETTLE_DELAY_SHIFT 16
> +#define MIPI_RX_CON24_CSI0_CSI0_BIST_SETTLE_DELAY_MASK (0xff << 16)
[snip]
> +#define SENINF_FIX_ADDR_CPHY0_DBG                             0x0A80
> +#define SENINF_FIX_ADDR_CPHY0_DBG_ERROR_COUNT_CPHY0_SHIFT 16
> +#define SENINF_FIX_ADDR_CPHY0_DBG_ERROR_COUNT_CPHY0_MASK (0xff << 16)
> +#define SENINF_FIX_ADDR_CPHY0_DBG_WORD_COUNT_OVER_FLOAT_CPHY0_SHIFT 24
> +#define SENINF_FIX_ADDR_CPHY0_DBG_WORD_COUNT_OVER_FLOAT_CPHY0_MASK BIT(24)
> +#define SENINF_FIX_ADDR_CPHY1_DBG                             0x0A84
> +#define SENINF_FIX_ADDR_CPHY1_DBG_ERROR_COUNT_CPHY1_SHIFT 16
> +#define SENINF_FIX_ADDR_CPHY1_DBG_ERROR_COUNT_CPHY1_MASK (0xff << 16)
> +#define SENINF_FIX_ADDR_CPHY1_DBG_WORD_COUNT_OVER_FLOAT_CPHY1_SHIFT 24
> +#define SENINF_FIX_ADDR_CPHY1_DBG_WORD_COUNT_OVER_FLOAT_CPHY1_MASK BIT(24)
> +#define SENINF_FIX_ADDR_CPHY2_DBG                             0x0A88
> +#define SENINF_FIX_ADDR_CPHY2_DBG_ERROR_COUNT_CPHY2_SHIFT 16
> +#define SENINF_FIX_ADDR_CPHY2_DBG_ERROR_COUNT_CPHY2_MASK (0xff << 16)
> +#define SENINF_FIX_ADDR_CPHY2_DBG_WORD_COUNT_OVER_FLOAT_CPHY2_SHIFT 24
> +#define SENINF_FIX_ADDR_CPHY2_DBG_WORD_COUNT_OVER_FLOAT_CPHY2_MASK BIT(24)

Again, the 3 copies of definitions for the 3 registers above could be
folded into one.

> +#define SENINF_FIX_ADDR_DBG                                   0x0A8C
> +#define SENINF_FIX_ADDR_DBG_ERROR_COUNT_SHIFT 16
> +#define SENINF_FIX_ADDR_DBG_ERROR_COUNT_MASK  (0xff << 16)
> +#define SENINF_FIX_ADDR_DBG_WORD_COUNT_OVER_FLOAT_SHIFT 24
> +#define SENINF_FIX_ADDR_DBG_WORD_COUNT_OVER_FLOAT_MASK BIT(24)
[snip]
> +#define SENINF_N3D_B_SUB_CNT                                   0x113C
> +#define SENINF_N3D_B_SUB_CNT_VS1_SUB_CNT_SHIFT 0
> +#define SENINF_N3D_B_SUB_CNT_VS1_SUB_CNT_MASK  (0x3f << 0)
> +#define SENINF_N3D_B_SUB_CNT_VS1_SUB_CNT_EN_SHIFT 6
> +#define SENINF_N3D_B_SUB_CNT_VS1_SUB_CNT_EN_MASK BIT(6)
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_A_RESET_SEL_SHIFT 7
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_A_RESET_SEL_MASK BIT(7)
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_B_RESET_SEL_SHIFT 8
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_B_RESET_SEL_MASK BIT(8)
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_A_RESET_SEL_EN_SHIFT 9
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_A_RESET_SEL_EN_MASK BIT(9)
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_B_RESET_SEL_EN_SHIFT 10
> +#define SENINF_N3D_B_SUB_CNT_SYNC_PIN_B_RESET_SEL_EN_MASK BIT(10)
> +#define SENINF_N3D_B_SUB_CNT_VS2_SUB_CNT_SHIFT 16
> +#define SENINF_N3D_B_SUB_CNT_VS2_SUB_CNT_MASK  (0x3f << 16)
> +#define SENINF_N3D_B_SUB_CNT_VS2_SUB_CNT_EN_SHIFT 22
> +#define SENINF_N3D_B_SUB_CNT_VS2_SUB_CNT_EN_MASK BIT(22)
> +#define SENINF_N3D_B_VSYNC_CNT                                 0x1140
> +#define SENINF_N3D_B_VSYNC_CNT_N3D_VSYNC_1_CNT_SHIFT 0
> +#define SENINF_N3D_B_VSYNC_CNT_N3D_VSYNC_1_CNT_MASK (0xffff << 0)

If I'm looking correctly, all the SENINF_N3D_B_* registers have the same
layout as similar SENINF_N3D_A_* registers, so they could reuse the macros
as well.

> +
> +#endif
> diff --git a/drivers/media/platform/mtk-isp/seninf/mtk_seninf_rx_reg.h b/drivers/media/platform/mtk-isp/seninf/mtk_seninf_rx_reg.h
> new file mode 100644
> index 000000000000..eb6f239e686d
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/seninf/mtk_seninf_rx_reg.h
> @@ -0,0 +1,515 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __SENINF_RX_REG_H__
> +#define __SENINF_RX_REG_H__
> +
> +#define MIPI_RX_ANA00_CSI0A                                    0x0000
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_CPHY_EN_SHIFT 0
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_CPHY_EN_MASK BIT(0)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_EQ_PROTECT_EN_SHIFT 1
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_EQ_PROTECT_EN_MASK BIT(1)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_BG_LPF_EN_SHIFT 2
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_BG_LPF_EN_MASK BIT(2)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_BG_CORE_EN_SHIFT 3
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_BG_CORE_EN_MASK BIT(3)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L0_CKMODE_EN_SHIFT 5
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L0_CKMODE_EN_MASK BIT(5)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L0_CKSEL_SHIFT 6
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L0_CKSEL_MASK BIT(6)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L1_CKMODE_EN_SHIFT 8
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L1_CKMODE_EN_MASK BIT(8)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L1_CKSEL_SHIFT 9
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L1_CKSEL_MASK BIT(9)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L2_CKMODE_EN_SHIFT 11
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L2_CKMODE_EN_MASK BIT(11)
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L2_CKSEL_SHIFT 12
> +#define MIPI_RX_ANA00_CSI0A_RG_CSI0A_DPHY_L2_CKSEL_MASK BIT(12)
[snip]
> +#define MIPI_RX_ANA00_CSI1A                                    0x2000
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_EQ_PROTECT_EN_SHIFT 1
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_EQ_PROTECT_EN_MASK BIT(1)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_BG_LPF_EN_SHIFT 2
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_BG_LPF_EN_MASK BIT(2)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_BG_CORE_EN_SHIFT 3
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_BG_CORE_EN_MASK BIT(3)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L0_CKMODE_EN_SHIFT 5
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L0_CKMODE_EN_MASK BIT(5)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L0_CKSEL_SHIFT 6
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L0_CKSEL_MASK BIT(6)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L1_CKMODE_EN_SHIFT 8
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L1_CKMODE_EN_MASK BIT(8)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L1_CKSEL_SHIFT 9
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L1_CKSEL_MASK BIT(9)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L2_CKMODE_EN_SHIFT 11
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L2_CKMODE_EN_MASK BIT(11)
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L2_CKSEL_SHIFT 12
> +#define MIPI_RX_ANA00_CSI1A_RG_CSI1A_DPHY_L2_CKSEL_MASK BIT(12)

Most of the *_CSI1A_* registers are the same as *_CSI0A_*. There are only a
few additions or changes in one or the other. The definitions could be
consolidated to avoid duplication. Macros which are specific to given PHY
could have the CSI0A or CSI1A particle in their names, while the generic ones
wouldn't have.

Best regards,
Tomasz
