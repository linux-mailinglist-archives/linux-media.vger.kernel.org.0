Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5B4D6B77E
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 09:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbfGQHqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 03:46:07 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40204 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfGQHqH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 03:46:07 -0400
Received: by mail-pf1-f196.google.com with SMTP id p184so10405596pfp.7
        for <linux-media@vger.kernel.org>; Wed, 17 Jul 2019 00:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lApJhXVpSFipMh8MBZDfYVU1u/c38W2Lsd9+9Uq2Gwo=;
        b=V1sxRIImj+8FvRZPftuC7BJosDk9JjU51InabpxrHnfTXQxrWrUDZ5VCGRYyGzsLqD
         OGwk6jrprv9yovXxl7HK7uY8YXWN15ZjYn/JaayijjRFLPD6TZlqCVkTuFm8pyRJv5AM
         GCqM7jGB24tVoLg3KUxpRkm6gZy0XM5BfJg/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lApJhXVpSFipMh8MBZDfYVU1u/c38W2Lsd9+9Uq2Gwo=;
        b=f2Yr/FjOuTmcIz2YV2IxWaGgxiTelx50CukAFUclAzs1SKy+d8bSfiQ2nMe1LjTyN8
         JiLFcKd4o84rR2Fd3+hm0e/dgyz+7MzZ9n/l+Boug5YKAxjDtSTAQA20OivtBvP75RMc
         CgMLhHZcZ+bMk1gnZBhNPKBRKdA2NUvlUJH6UjwSEZ5D9c/ielIZ1dUlIatPIQ2EGbJ7
         I4eZ7oEfjBtcnvsjiNCOqIkQc7ePyW3wwyEEbgkvcDgN8IconLFZscQAycxAlq6wCys8
         EZ0A5YJ8kerUVY7O7QKrWXwrad9pWeWt6qem25VLSPV5DW8q7VwCAsTxxfQJjjj/ZSYj
         cdWg==
X-Gm-Message-State: APjAAAVMJOfgjfhlpmIMdc0Cs+VNJQ7AQBheRsxCDXX9sHB2HKeLNNgr
        aSt1n+Jy8BmSyUwMq/xsjS74iA==
X-Google-Smtp-Source: APXvYqyW/4/JKgP9CuShHAdEacqhr4Ak4OD8taLZVLN0diK+8n9GJvIU0q+hjOF2eRzoWtlOF4GG8g==
X-Received: by 2002:a17:90a:1904:: with SMTP id 4mr43451678pjg.116.1563349564579;
        Wed, 17 Jul 2019 00:46:04 -0700 (PDT)
Received: from chromium.org ([2401:fa00:4:4:6d27:f13:a0fa:d4b6])
        by smtp.gmail.com with ESMTPSA id u16sm23398056pjb.2.2019.07.17.00.45.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 17 Jul 2019 00:46:03 -0700 (PDT)
Date:   Wed, 17 Jul 2019 16:45:57 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Louis Kuo <louis.kuo@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        keiichiw@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org,
        yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        holmes.chiou@mediatek.com, frederic.chen@mediatek.com,
        Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com,
        Rynn.Wu@mediatek.com, linux-media@vger.kernel.org,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH V3 1/4] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
Message-ID: <20190717074557.GA96195@chromium.org>
References: <1559815233-24796-1-git-send-email-louis.kuo@mediatek.com>
 <1559815233-24796-2-git-send-email-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559815233-24796-2-git-send-email-louis.kuo@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Louis,

On Thu, Jun 06, 2019 at 06:00:30PM +0800, Louis Kuo wrote:
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
>  drivers/media/platform/Makefile                    |    2 +
>  drivers/media/platform/mtk-isp/Makefile            |    3 +
>  drivers/media/platform/mtk-isp/isp_50/Makefile     |    5 +
>  .../media/platform/mtk-isp/isp_50/seninf/Makefile  |    6 +
>  .../platform/mtk-isp/isp_50/seninf/mtk_seninf.c    | 1330 ++++++++++++++++++++
>  .../mtk-isp/isp_50/seninf/mtk_seninf_def.h         |  155 +++
>  .../mtk-isp/isp_50/seninf/mtk_seninf_reg.h         |  965 ++++++++++++++
>  7 files changed, 2466 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h
> 

Thanks for the patch! Please see my comments inline.

> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 7cbbd92..b0f4543 100644
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
> index 0000000..c17fb3f
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-y += isp_50/
> diff --git a/drivers/media/platform/mtk-isp/isp_50/Makefile b/drivers/media/platform/mtk-isp/isp_50/Makefile
> new file mode 100644
> index 0000000..8b4a792
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
> index 0000000..bf193fe
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
> index 0000000..e791110
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
> @@ -0,0 +1,1330 @@
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
> +#define SUBDEV_SENSOR_MAIN_NAME		"sensor_main"
> +#define SUBDEV_SENSOR_SUB_NAME		"sensor_sub"
> +#define MTK_CAM_SENINF_PAD_MAIN_SINK		0
> +#define MTK_CAM_SENINF_PAD_SUB_SINK		1
> +#define MIPI_SENSOR_TYPE MIPI_OPHY_NCSI2

Please either add dynamic detection of the sensor type or make the driver
support only OPHY_NCSI2 sensor type, removing the other types from it.

> +
> +static inline void mt_reg_sync_writel(unsigned int v, void *a)
> +{
> +	__raw_writel((v), (void __force __iomem *)((a)));
> +}
> +
> +static inline unsigned int seninf_read_reg
> +	(void *reg_base, unsigned int reg_name)
> +{
> +	return (unsigned int)ioread32(reg_base + reg_name);
> +}
> +
> +static inline void seninf_write_reg
> +	(void *reg_base, unsigned int reg_name,
> +	unsigned int value)
> +{
> +	mt_reg_sync_writel(value, reg_base + reg_name);
> +}
> +
> +static inline void write_master
> +	(void *reg_base, unsigned int reg_name,
> +	unsigned int value, unsigned int mask)
> +{
> +	mt_reg_sync_writel((ioread32(reg_base + reg_name) & ~(mask)) |
> +		value, reg_base + reg_name);
> +}

Could we just use writel() and readl() directly everywhere in the driver, as
is the common practice in the Linux code base?

> +
> +static inline int is_4d1c(unsigned int port)
> +{
> +	return (port < CFG_CSI_PORT_0A);
> +}
> +
> +static inline int is_cdphy_combo(unsigned int port)
> +{
> +	return (port == CFG_CSI_PORT_0A ||
> +		port == CFG_CSI_PORT_0B ||
> +		port == CFG_CSI_PORT_0);
> +}
> +
> +static struct seninf_csi_info SENINF_CSI_INFO[CFG_CSI_PORT_MAX_NUM] = {

Please use lowercase for variable names.

> +	{CFG_CSI_PORT_0,  SENINF_1},
> +	{CFG_CSI_PORT_1,  SENINF_3},
> +	{CFG_CSI_PORT_2,  SENINF_5},
> +	{CFG_CSI_PORT_0A, SENINF_1},
> +	{CFG_CSI_PORT_0B, SENINF_2},
> +};

This seems to be a simple mapping from a continuous range of integers into
different integers. Could we just have a const array accessed directly in a
helper function? I.e.

static u32 seninf_csi_port_to_seninf(u32 port)
{
	static const u32 port_to_seninf[] = {
		[CFG_CSI_PORT_0] = SENINF_1,
		[CFG_CSI_PORT_1] = SENINF_3,
		// ...
	};

	if (WARN_ON(port >= ARRAY_SIZE(port_to_seninf)))
		return -1; // Or some other value we know is incorrect.

	return port_to_seninf[port];
}

> +
> +struct _seninf {

It's uncommon to prefix struct names with _. I'd suggest renaming to
mtk_seninf.

> +	struct v4l2_subdev subdev;
> +	struct v4l2_async_notifier notifier;
> +	struct device *dev;
> +	struct v4l2_fwnode_endpoint ep[NUM_PORTS];
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct media_pad pads[NUM_PADS];
> +	struct clk *cam_clk, *top_mux_clk;
> +	unsigned int port;
> +	struct v4l2_subdev_format fmt;
> +	unsigned int mux_select;
> +	void __iomem *base_reg;
> +	void __iomem *rx_reg;
> +	unsigned char *csi2_rx[CFG_CSI_PORT_MAX_NUM];
> +};
> +
> +static int set_top_mux_ctrl(struct _seninf *priv,
> +			    unsigned int mux_idx,
> +			    unsigned int seninf_src)

Could you prefix the functions in this driver with mtk_seninf_ so they are
easy to find with ctags and similar tools?

> +{
> +	void *pseninf = priv->base_reg;
> +
> +	seninf_write_reg(pseninf, SENINF_TOP_MUX_CTRL,
> +			 ((seninf_read_reg(pseninf, SENINF_TOP_MUX_CTRL) &
> +			 (~(0xF << (mux_idx * 4)))) | ((seninf_src & 0xF)
> +			 << (mux_idx * 4))));
> +
> +	return 0;
> +}

Do we need a whole function for just one register write?

> +
> +static void set_mux_ctrl
> +	(struct _seninf *priv, unsigned int mux,
> +	unsigned int input_data_type)
> +{
> +	void *pseninf = priv->base_reg + 0x1000 * mux;
> +	unsigned int temp;
> +	unsigned int pix_sel_ext;
> +	unsigned int pix_sel;
> +	unsigned int hs_pol = 0;
> +	unsigned int vs_pol = 0;
> +	unsigned int pixel_mode = ONE_PIXEL_MODE;
> +	unsigned int src_type_sel = MIPI_SENSOR;
> +
> +	write_master(pseninf, SENINF1_MUX_CTRL,
> +		     (src_type_sel << 12), 0x0000F000);
> +	temp = (src_type_sel == TEST_MODEL) ? 0 : 1;

nit: This could be simplified to (src_type_sel != TEST_MODEL).

> +	write_master(pseninf, SENINF1_MUX_CTRL_EXT,
> +		     (temp << 0), 0x00000003);

No need to shift if the shift is 0.

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
> +	write_master(pseninf, SENINF1_MUX_CTRL_EXT, pix_sel_ext, 0x00000010);
> +	write_master(pseninf, SENINF1_MUX_CTRL, pix_sel, 0x00000100);
> +
> +	if (input_data_type != JPEG_FMT)
> +		write_master(pseninf, SENINF1_MUX_CTRL,
> +			     (2 << 28), 0x30000000);
> +	else
> +		write_master(pseninf, SENINF1_MUX_CTRL, 0, 0x30000000);

This looks like something that would be normally written as:

val = 0;
if (input_data_type != JPEG_FMT)
	val |= SOME_BITFIELD_VALUE_MACRO;
write_master(..., val, <mask>);

> +
> +	if (src_type_sel == CSI2 || src_type_sel >= MIPI_SENSOR) {
> +		/* Need to use Default for New design */
> +		if (input_data_type != JPEG_FMT)
> +			write_master(pseninf, SENINF1_MUX_CTRL,
> +				     ((0x1B << 22) | (0x1F << 16)),
> +				     0x0FFF0000);
> +		else
> +			write_master(pseninf, SENINF1_MUX_CTRL,
> +				     ((0x18 << 22) | (0x1E << 16)),
> +				     0x0FFF0000);
> +	}
> +
> +	write_master(pseninf, SENINF1_MUX_CTRL,
> +		     ((hs_pol << 10) | (vs_pol << 9)), 0x00000600);
> +
> +	temp = seninf_read_reg(pseninf, SENINF1_MUX_CTRL);
> +	seninf_write_reg(pseninf, SENINF1_MUX_CTRL, temp | 0x3);
> +	seninf_write_reg(pseninf, SENINF1_MUX_CTRL, temp & 0xFFFFFFFC);

Please define macros for the magic numbers.

> +}
> +
> +static void enable_mux(struct _seninf *priv, unsigned int mux)
> +{
> +	void *pseninf = priv->base_reg + 0x1000 * mux;
> +
> +	write_master(pseninf, SENINF1_MUX_CTRL, (1 << 31), 0x80000000);
> +}

Do we need a separate function for this one register write?

> +
> +static struct seninf_csi_info *get_csi_info(struct _seninf *priv,
> +					    unsigned int mipi_port)
> +{
> +	int i;
> +
> +	for (i = 0; i < CFG_CSI_PORT_MAX_NUM; i++) {
> +		if (SENINF_CSI_INFO[i].port == mipi_port)
> +			return &SENINF_CSI_INFO[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static void set_dphy
> +	(struct _seninf *priv,
> +	struct seninf_csi_mipi *pcsi_mipi)
> +{
> +	struct seninf_csi_info *csi_info = pcsi_mipi->csi_info;
> +	void *pmipi_rx_base = priv->csi2_rx[CFG_CSI_PORT_0];
> +	void *pmipi_rx = priv->csi2_rx[csi_info->port];
> +	void *pmipi_rx_conf = priv->base_reg + 0x1000 * csi_info->seninf;
> +
> +	/* Set analog phy mode to DPHY */
> +	if (is_cdphy_combo(csi_info->port))
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A, 0, 0x00000001);

Don't we need to write 1 there otherwise?

> +	/* 4D1C: MIPIRX_ANALOG_A_BASE = 0x00001A42 */
> +	if (is_4d1c(csi_info->port))
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			     (1 << 6) | (1 << 9) | (1 << 11) | (1 << 12),
> +			     0x00001B60);
> +	else /* MIPIRX_ANALOG_BASE = 0x102 */
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			     (1 << 8), 0x00001B60);
> +
> +	if (is_cdphy_combo(csi_info->port))
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B, 0, 0x00000001);

Don't we also need to write 1 there othwerise?

> +
> +	/* Only 4d1c need set CSIB: MIPIRX_ANALOG_B_BASE = 0x00001242 */
> +	if (is_4d1c(csi_info->port))
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			     (1 << 6) | (1 << 9) | (1 << 12), 0x00001B60);
> +	else /* MIPIRX_ANALOG_BASE = 0x102 */
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			     (1 << 8) | (1 << 9), 0x00001B40);

Shouldn't the mask be the same in both cases?

> +
> +	/* Byte clock invert */
> +	write_master(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> +		     (1 << 0) | (1 << 1) | (1 << 2), 0x00000007);
> +	if (is_4d1c(csi_info->port))
> +		write_master(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
> +			     (1 << 0) | (1 << 1) | (1 << 2),
> +			     0x00000007);

Don't we need to write the opposite values in the other case?

> +
> +	/* Start ANA EQ tuning */
> +	if (is_cdphy_combo(csi_info->port)) {
> +		write_master(pmipi_rx, MIPI_RX_ANA18_CSI0A,
> +			     (1 << 4) | (1 << 6), 0x000000F0);
> +		write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
> +			     (1 << 20) | (1 << 22), 0x00F00000);
> +		write_master(pmipi_rx, MIPI_RX_ANA20_CSI0A,
> +			     (1 << 20) | (1 << 22), 0x00F00000);
> +
> +		if (is_4d1c(csi_info->port)) { /* 4d1c */
> +			write_master(pmipi_rx, MIPI_RX_ANA18_CSI0B,
> +				     (1 << 4) | (1 << 6), 0x000000F0);
> +			write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
> +				     (1 << 20) | (1 << 22),
> +				     0x00F00000);
> +			write_master(pmipi_rx, MIPI_RX_ANA20_CSI0B,
> +				     (1 << 20) | (1 << 22),
> +				     0x00F00000);
> +		}
> +	} else {
> +		write_master(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> +			     (1 << 4) | (1 << 6) | (1 << 20) |
> +			     (1 << 22), 0x00F000F0);
> +		write_master(pmipi_rx, MIPI_RX_ANA1C_CSI1A,
> +			     (1 << 4) | (1 << 6), 0x000000F0);
> +
> +		if (is_4d1c(csi_info->port)) { /* 4d1c */
> +			write_master(pmipi_rx,
> +				     MIPI_RX_ANA18_CSI1B, (1 << 4) |
> +				     (1 << 6) | (1 << 20) |
> +				     (1 << 22), 0x00F000F0);
> +			write_master(pmipi_rx,
> +				     MIPI_RX_ANA1C_CSI1B, (1 << 4) |
> +				     (1 << 6), 0x000000F0);
> +		}
> +	}
> +
> +	/* End ANA EQ tuning */
> +	seninf_write_reg(pmipi_rx_base, MIPI_RX_ANA40_CSI0A, 0x90);
> +	write_master(pmipi_rx, MIPI_RX_ANA24_CSI0A,
> +		     (0x40 << 24), 0xFF000000);
> +	if (is_4d1c(csi_info->port))
> +		write_master(pmipi_rx, MIPI_RX_ANA24_CSI0B,
> +			     (0x40 << 24), 0xFF000000);
> +	write_master(pmipi_rx, MIPI_RX_WRAPPER80_CSI0A, 0, 0x00030000);
> +	if (is_4d1c(csi_info->port))
> +		write_master(pmipi_rx, MIPI_RX_WRAPPER80_CSI0B, 0, 0x00030000);
> +	/* ANA power on */
> +	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +		     (1 << 3), 0x00000008);
> +	if (is_4d1c(csi_info->port))
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			     (1 << 3), 0x00000008);
> +	usleep_range(20, 40);
> +	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +		     (1 << 3), 0x00000008);
> +	if (is_4d1c(csi_info->port))
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			     (1 << 2), 0x00000004);
> +	udelay(1);
> +	/* 4d1c: MIPIRX_CONFIG_CSI_BASE = 0xC9000000; */
> +	if (is_4d1c(csi_info->port)) {
> +		write_master(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +			     (1 << 24) | (2 << 26) | (3 << 30), 0xFF000000);
> +	} else { /* 2d1c: MIPIRX_CONFIG_CSI_BASE = 0xE4000000; */
> +		write_master(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +			     (1 << 26) | (2 << 28) | (3 << 30), 0xFF000000);
> +	}

Please define macros for the magic numbers.

> +	pr_debug("pcsi_mipi->CSI2_IP %d, MIPI_RX_CON24_CSI0 0x%x\n",
> +		 csi_info->port,
> +		 seninf_read_reg(pmipi_rx_conf, MIPI_RX_CON24_CSI0));
> +	usleep_range(20, 40);
> +	/* D-PHY SW Delay Line calibration */

What is this comment about? The delay?

> +}
> +
> +static void set_cphy
> +	(struct _seninf *priv,
> +	struct seninf_csi_mipi *pcsi_mipi)
> +{ /* Cphy setting for CSI0 */

Perhaps renaming the function to mtk_seninf_set_csi0_cphy() could eliminate
the need for this comment?

> +	struct seninf_csi_info *csi_info = pcsi_mipi->csi_info;
> +	void *pmipi_rx = priv->csi2_rx[csi_info->port];
> +	int status;
> +	int i;
> +
> +	/* Byte clock invert */
> +	write_master(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> +		     (1 << 0) | (1 << 2), 0x00000005);
> +	write_master(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
> +		     (1 << 0) | (1 << 2), 0x00000005);
> +	/* EQ Power to Enhance Speed */
> +	write_master(pmipi_rx, MIPI_RX_ANA18_CSI0A,
> +		     (1 << 6) | (1 << 22), 0x00C000C0);
> +	write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
> +		     (1 << 6) | (1 << 22), 0x00C000C0);
> +	write_master(pmipi_rx, MIPI_RX_ANA20_CSI0A,
> +		     (1 << 6) | (1 << 22), 0x00C000C0);
> +	write_master(pmipi_rx, MIPI_RX_ANA18_CSI0B,
> +		     (1 << 6) | (1 << 22), 0x00C000C0);
> +	write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
> +		     (1 << 6) | (1 << 22), 0x00C000C0);
> +	write_master(pmipi_rx, MIPI_RX_ANA20_CSI0B,
> +		     (1 << 6) | (1 << 22), 0x00C000C0);
> +
> +	/* CDR register setting */
> +
> +	*((int *)(priv->csi2_rx[csi_info->port] + 0x30)) = 0x06040404;
> +	*((int *)(priv->csi2_rx[csi_info->port] + 0x3c)) = 0x06040404;
> +	*((int *)(priv->csi2_rx[csi_info->port] + 0x34)) = 0x1;
> +	*((int *)(priv->csi2_rx[csi_info->port] + 0x28)) = 0x1;
> +
> +	*((int *)(priv->csi2_rx[csi_info->port] + 0x1030)) =
> +		0x06040404;
> +	*((int *)(priv->csi2_rx[csi_info->port] + 0x103c)) =
> +		0x06040404;
> +	*((int *)(priv->csi2_rx[csi_info->port] + 0x1034)) = 0x1;
> +	*((int *)(priv->csi2_rx[csi_info->port] + 0x1028)) = 0x1;

Please don't access IO memory directly. Always use some accessor,
preferrably writel().

> +
> +	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +		     (1 << 0), 0x00001B61);
> +	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +		     (1 << 0), 0x00001B61);
> +	/* Power on DPHY */
> +	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +		     (1 << 3), 0x00000008);
> +	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +		     (1 << 3), 0x00000008);
> +	usleep_range(20, 40);
> +	/* Enable LPF */
> +	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +		     (1 << 2), 0x00000004);
> +	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +		     (1 << 2), 0x00000004);
> +	udelay(1);
> +	/* Offset calibration */
> +	write_master(pmipi_rx, MIPI_RX_ANA18_CSI0A,
> +		     (1 << 0) | (1 << 16), 0x00010001);
> +	write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
> +		     (1 << 0) | (1 << 16), 0x00010001);
> +	write_master(pmipi_rx, MIPI_RX_ANA20_CSI0A,
> +		     (1 << 0) | (1 << 16), 0x00010001);
> +	write_master(pmipi_rx, MIPI_RX_ANA18_CSI0B,
> +		     (1 << 0) | (1 << 16), 0x00010001);
> +	write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
> +		     (1 << 0) | (1 << 16), 0x00010001);
> +	write_master(pmipi_rx, MIPI_RX_ANA20_CSI0B,
> +		     (1 << 0) | (1 << 16), 0x00010001);
> +	udelay(1);

Please define macros for the magic bits and values.

> +
> +	i = 0;
> +	while (1) {
> +		status = seninf_read_reg(pmipi_rx,
> +					 MIPI_RX_ANA48_CSI0A);
> +		if ((status & 0x3f) == 0x3f)
> +			break;
> +		i++;
> +		if (i > 100) {
> +			pr_debug("CSIA offset calibration timeout\n");

This is an error. Please print with error log level, e.g. dev_err(),
return an error from this function and make sure the caller correctly
handles errors by cleaning up the steps performed before.

> +			break;
> +		}
> +		usleep_range(20, 40);
> +	}

Could this be replaced with a readl_poll_timeout()?

> +
> +	i = 0;
> +	while (1) {
> +		status = seninf_read_reg(pmipi_rx,
> +					 MIPI_RX_ANA48_CSI0B);
> +		if ((status & 0x3f) == 0x3f)
> +			break;
> +		i++;
> +		if (i > 100) {
> +			pr_debug("CSIB offset calibration timeout\n");
> +			break;
> +		}
> +		usleep_range(20, 40);
> +	}

Ditto.

> +}
> +
> +static void set_csi_mipi
> +	(struct _seninf *priv,
> +	struct seninf_csi_mipi *pcsi_mipi)
> +{
> +	struct seninf_csi_info *csi_info = pcsi_mipi->csi_info;
> +	void *seninf_base = priv->base_reg;
> +	void *pseninf = priv->base_reg + 0x1000 * csi_info->seninf;
> +	void *pmipi_rx = priv->csi2_rx[csi_info->port];
> +	unsigned int cal_sel;
> +	unsigned int mipi_enable = 1;
> +	unsigned int data_header_order = 1;
> +	unsigned int pad_sel = PAD_10BIT;
> +	unsigned int csi_type = (MIPI_SENSOR_TYPE == MIPI_CPHY)
> +		? CSI2_2_5G_CPHY : CSI2_2_5G;

Couldn't we just check MIPI_SENSOR_TYPE directly?

> +
> +	pr_debug("IS_4D1C %d csi_type %d port %d\n",
> +		 is_4d1c(csi_info->port), csi_type, csi_info->port);
> +
> +	switch (csi_info->port) {
> +	case CFG_CSI_PORT_1:
> +		cal_sel = 1;
> +		write_master(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI1,
> +			     ((2 << 8) | (mipi_enable << 31)), 0x80000701);
> +		break;
> +	case CFG_CSI_PORT_2:
> +		cal_sel = 2;
> +		write_master(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI2,
> +			     ((2 << 8) | (mipi_enable << 31)), 0x80000701);
> +		break;
> +	case CFG_CSI_PORT_0:
> +		cal_sel = 0;
> +		write_master(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			     ((2 << 8) |
> +			     (mipi_enable << 31)), 0x80000701);
> +		break;
> +	case CFG_CSI_PORT_0A:
> +	case CFG_CSI_PORT_0B:
> +		cal_sel = 0;
> +		write_master(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			     ((1 << 8) | (1 << 12) |
> +			     (mipi_enable << 31)), 0x80003701);
> +		break;
> +	default:
> +		pr_err("unsupported CSI configuration\n");
> +		cal_sel = 0;
> +		write_master(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			     ((2 << 8) |
> +			     (mipi_enable << 31)), 0x80000701);
> +		break;

Could we make this case impossible to happen by the design of the driver?

> +	}
> +
> +	/* First Enable Sensor interface and select pad (0x1a04_0200) */
> +	write_master(pseninf, SENINF1_CTRL,
> +		     mipi_enable << 0, 0x00000001);
> +	write_master(pseninf, SENINF1_CTRL,
> +		     pad_sel << 28, 0x70000000);
> +
> +	if (csi_type == CSI2_1_5G || csi_type == CSI2_2_5G) {
> +		write_master(pseninf, SENINF1_CTRL, 0, 0x0000F000);
> +		write_master(pseninf, SENINF1_CTRL_EXT,
> +			     (mipi_enable << 6), 0x00000060);
> +	}
> +	if (!mipi_enable) {
> +		seninf_write_reg(pseninf, SENINF1_CSI2_CTL,
> +				 seninf_read_reg(pseninf, SENINF1_CSI2_CTL) &
> +				 0xFFFFFFE0);
> +		/* Disable mipi BG */
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A, 0, 0x0000000C);
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B, 0, 0x0000000C);
> +		return;
> +	}

I can see mipi_enable is always 1. Please either make the driver handle
other types of ports fully or remove them completely.

> +
> +	if (csi_type != CSI2_2_5G_CPHY)
> +		set_dphy(priv, pcsi_mipi);
> +	else
> +		set_cphy(priv, pcsi_mipi);
> +
> +	/* DPCM Enable */
> +	seninf_write_reg(pseninf, SENINF1_CSI2_DPCM,
> +			 1 << ((pcsi_mipi->dpcm == 0x2a)
> +			 ? 15 : ((pcsi_mipi->dpcm & 0xF) + 7)));

Could you refactor this to avoid using the "inline if" clause and calculate
the value for the register outside of the seninf_write_reg() function call?

> +
> +	pr_debug("CSI2-%d cnt:%d LaneNum:%d CSI2_EN:%d HeadOrder:%d dpcm:%d\n",
> +		 cal_sel, SENINF_SETTLE_DELAY,
> +		 (int)(pcsi_mipi->data_lane_num + 1), (int)mipi_enable,
> +		 (int)data_header_order, (int)pcsi_mipi->dpcm);
> +
> +	/* Settle delay */
> +	write_master(pseninf, SENINF1_CSI2_LNRD_TIMING,
> +		     (SENINF_SETTLE_DELAY << 8), 0x0000FF00);
> +	/* CSI2 control */
> +	if (csi_type != CSI2_2_5G_CPHY) { /* DPhy */
> +		seninf_write_reg(pseninf, SENINF1_CSI2_CTL,
> +				 (seninf_read_reg(pseninf, SENINF1_CSI2_CTL) |
> +				 (data_header_order << 16) |
> +				 (mipi_enable << 4) |
> +				 (((1 << (pcsi_mipi->data_lane_num + 1)) - 1)
> +				 )));
> +		write_master(pseninf, SENINF1_CSI2_RESYNC_MERGE_CTL,
> +			     (3 << 0), 0x00000C07);
> +		write_master(pseninf, SENINF1_CSI2_MODE, 0, 0x000007FF);
> +		write_master(pseninf, SENINF1_CSI2_DPHY_SYNC,
> +			     (0xff00 << 0) | (0x001d << 16), 0xFFFFFFFF);
> +		seninf_write_reg(pseninf, SENINF1_CSI2_SPARE0,
> +				 seninf_read_reg(pseninf, SENINF1_CSI2_SPARE0)
> +				 & 0xFFFFFFFE);
> +	} else {
> +		/* CPhy */
> +		unsigned int temp;
> +
> +		write_master(pseninf, SENINF1_CSI2_LNRD_TIMING, 0, 0x000000FF);
> +		seninf_write_reg(pseninf, SENINF1_CSI2_CTL,
> +				 (seninf_read_reg(pseninf, SENINF1_CSI2_CTL) |
> +				 data_header_order << 16));
> +		temp = (pcsi_mipi->data_lane_num == SENSOR_MIPI_1_LANE) ? 1 :
> +			(pcsi_mipi->data_lane_num == SENSOR_MIPI_2_LANE) ? 2 :
> +			(pcsi_mipi->data_lane_num == SENSOR_MIPI_3_LANE) ?
> +			4 : 5;
> +		write_master(pseninf, SENINF1_CSI2_MODE,
> +			     (temp << 8), 0x00000700);
> +		temp = pcsi_mipi->data_lane_num >= SENSOR_MIPI_1_LANE;
> +		write_master(pseninf, SENINF1_CSI2_CTRL_TRIO_CON,
> +			     (temp << 0), 0x00000001);
> +		temp = pcsi_mipi->data_lane_num >= SENSOR_MIPI_2_LANE;
> +		write_master(pseninf, SENINF1_CSI2_CTRL_TRIO_CON,
> +			     (temp << 2), 0x00000004);
> +		temp = pcsi_mipi->data_lane_num >= SENSOR_MIPI_3_LANE;
> +		write_master(pseninf, SENINF1_CSI2_CTRL_TRIO_CON,
> +			     (temp << 4), 0x00000010);
> +		temp = pcsi_mipi->data_lane_num >= SENSOR_MIPI_4_LANE;
> +		write_master(pseninf, SENINF1_CSI2_CTRL_TRIO_CON,
> +			     (temp << 6), 0x00000040);
> +		write_master(pseninf, SENINF1_CSI2_MODE,
> +			     (0x2 << 0), 0x000000FF);
> +		write_master(pseninf, SENINF1_CSI2_RESYNC_MERGE_CTL,
> +			     (3 << 0) | (1 << 11), 0x00000C07);
> +		write_master(pseninf, SENINF1_SYNC_RESYNC_CTL,
> +			     (1 << 0), 0x00000007);
> +		write_master(pseninf, SENINF1_POST_DETECT_CTL,
> +			     (1 << 1), 0x00000002);
> +
> +		seninf_write_reg(pseninf, SENINF1_CSI2_SPARE0,
> +				 seninf_read_reg(pseninf, SENINF1_CSI2_SPARE0)
> +				 | 0x1);
> +	}
> +
> +	write_master(pseninf, SENINF1_CSI2_CTL, (1 << 25), 0x0A000080);
> +	write_master(pseninf, SENINF1_CSI2_HS_TRAIL,
> +		     (SENINF_HS_TRAIL_PARAMETER << 0), 0x000000FF);
> +
> +	/* Set debug port to output packet number */
> +	seninf_write_reg(pseninf, SENINF1_CSI2_DGB_SEL, 0x8000001A);
> +	/* Enable CSI2 IRQ mask */
> +	/* Turn on all interrupt */
> +	seninf_write_reg(pseninf, SENINF1_CSI2_INT_EN, 0xFFFFFFFF);
> +	/* Write clear CSI2 IRQ */
> +	seninf_write_reg(pseninf, SENINF1_CSI2_INT_STATUS, 0xFFFFFFFF);
> +	/* Enable CSI2 Extend IRQ mask */
> +	/* Turn on all interrupt */
> +	seninf_write_reg(pseninf, SENINF1_CSI2_INT_EN_EXT, 0x0000001f);
> +
> +	write_master(pseninf, SENINF1_CTRL, (1 << 7), 0x00000080);
> +	udelay(1);
> +	write_master(pseninf, SENINF1_CTRL, 0, 0x00000080);
> +}

Please define macros for all the magic numbers.

> +
> +static void power_off(struct _seninf *priv, void *pcsi)
> +{
> +	struct seninf_csi_mipi *pcsi_mipi = (struct seninf_csi_mipi *)pcsi;
> +	struct seninf_csi_info *csi_info = pcsi_mipi->csi_info;
> +	void *pmipi_rx = priv->csi2_rx[csi_info->port];
> +	void *pseninf = priv->base_reg + 0x1000 * csi_info->seninf;
> +
> +	/* Disable CSI2(2.5G) first */
> +	seninf_write_reg(pseninf, SENINF1_CSI2_CTL,
> +			 seninf_read_reg(pseninf, SENINF1_CSI2_CTL)
> +			 & 0xFFFFFFE0);
> +	/* Disable mipi BG */
> +	switch (csi_info->port) {
> +	case CFG_CSI_PORT_0A:
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			     0, 0x0000000C);
> +		break;
> +	case CFG_CSI_PORT_0B:
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			     0, 0x0000000C);
> +		break;
> +	default:
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			     0, 0x0000000C);
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			     0, 0x0000000C);

Is there any reason not to just write 0 to both registers regardless of the
port? That could simplify the code.

> +		break;
> +	}
> +}
> +
> +static int seninf_subscribe_event(struct v4l2_subdev *sd,
> +				  struct v4l2_fh *fh,
> +				  struct v4l2_event_subscription *sub)
> +{
> +	switch (sub->type) {
> +	case V4L2_EVENT_CTRL:
> +		return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int map_fmt
> +	(struct _seninf *priv,
> +	struct seninf_csi_mipi *pcsi_mipi)
> +{
> +	int fmtidx;
> +
> +	switch (priv->fmt.format.code) {
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		fmtidx = 0;
> +		pcsi_mipi->dpcm = 0;
> +		break;
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +		fmtidx = 1;
> +		pcsi_mipi->dpcm = 0;
> +		break;
> +	case MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8:
> +		fmtidx = 0;
> +		/* dpcm mode 0x2a, */
> +		pcsi_mipi->dpcm = 0x2a;
> +		break;
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +		fmtidx = 2;
> +		pcsi_mipi->dpcm = 0;
> +		break;
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_VYUY8_1X16:
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +	case MEDIA_BUS_FMT_YVYU8_1X16:
> +		fmtidx = 3;
> +		pcsi_mipi->dpcm = 0;
> +		break;
> +	case MEDIA_BUS_FMT_JPEG_1X8:
> +	case MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8:
> +		fmtidx = 7;
> +		pcsi_mipi->dpcm = 0;
> +		break;
> +	default:
> +		fmtidx = 0;
> +		pcsi_mipi->dpcm = 0;
> +		WARN(1, "CSI2: pixel format %08x unsupported!\n",
> +		     priv->fmt.format.code);
> +		break;

We shouldn't need to handle this as we filter out the formats in s_fmt.

> +	}
> +	return fmtidx;
> +}

Do you think we could split this into two functions, one that returns the
format index and one that returns the dpcm. Especially the latter could be
as simple as just handing the 4 special formats with a single if.

> +
> +static void init_fmt(struct _seninf *priv)
> +{
> +	priv->fmt.format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +	priv->fmt.format.width = DEFAULT_WIDTH;
> +	priv->fmt.format.height = DEFAULT_HEIGHT;
> +	priv->fmt.format.field = V4L2_FIELD_NONE;
> +	priv->fmt.format.colorspace = V4L2_COLORSPACE_SRGB;
> +	priv->fmt.format.xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +	priv->fmt.format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	priv->fmt.format.quantization = V4L2_QUANTIZATION_DEFAULT;
> +}
> +
> +static const struct v4l2_mbus_framefmt fmt_default = {

Perhaps mtk_seninf_default_fmt?

> +	.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +	.width = DEFAULT_WIDTH,
> +	.height = DEFAULT_HEIGHT,
> +	.field = V4L2_FIELD_NONE,
> +	.colorspace = V4L2_COLORSPACE_SRGB,
> +	.xfer_func = V4L2_XFER_FUNC_DEFAULT,
> +	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
> +	.quantization = V4L2_QUANTIZATION_DEFAULT,

Isn't this an exact copy of what's initialized in init_fmt()? Please replace
the whole init_fmt() with just priv->fmt.format = fmt_default.

> +};
> +
> +static int seninf_init_cfg
> +				(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_pad_config *cfg)

Something wrong seems to be going on here with line breaks.

> +{
> +	struct v4l2_mbus_framefmt *mf;
> +	unsigned int i;
> +
> +	for (i = 0; i < sd->entity.num_pads; i++) {
> +		mf = v4l2_subdev_get_try_format(sd, cfg, i);
> +		*mf = fmt_default;
> +	}
> +
> +	return 0;
> +}
> +
> +static int seninf_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct _seninf *priv = container_of(sd, struct _seninf, subdev);
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> +	} else {
> +		priv->fmt.format.code = fmt->format.code;
> +		priv->fmt.format.width = fmt->format.width;
> +		priv->fmt.format.height = fmt->format.height;
> +	}
> +
> +	pr_debug("set format 0x%x\n", priv->fmt.format.code);
> +
> +	return 0;
> +}
> +
> +static int seninf_get_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct _seninf *priv = container_of(sd, struct _seninf, subdev);
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> +	} else {
> +		fmt->format.code = priv->fmt.format.code;
> +		fmt->format.width = priv->fmt.format.width;
> +		fmt->format.height = priv->fmt.format.height;
> +		fmt->format.field = priv->fmt.format.field;
> +		fmt->format.colorspace = priv->fmt.format.colorspace;
> +		fmt->format.xfer_func = priv->fmt.format.xfer_func;
> +		fmt->format.ycbcr_enc = priv->fmt.format.ycbcr_enc;
> +		fmt->format.quantization = priv->fmt.format.quantization;
> +	}
> +	pr_debug("get format 0x%x\n", priv->fmt.format.code);
> +	return 0;
> +}

Can the seninf block change the format internally or it just forwards the
data from the sensor in its original format? If the latter, we should just
propagate the format as set on the sensor here.

> +
> +static int seninf_s_stream(struct v4l2_subdev *sd, int on)
> +{
> +	struct _seninf *priv = container_of(sd, struct _seninf, subdev);
> +	struct seninf_csi_mipi csi_mipi;
> +	struct seninf_csi_info *csi_info;
> +	unsigned int mux_select;
> +	unsigned int input_data_type;
> +	unsigned int port;
> +	unsigned int seninf_src;
> +	unsigned char sensor_mipi_lane_num =
> +		priv->ep[priv->port].bus.mipi_csi2.num_data_lanes;

We should just store it in some more convenient place at parsing time.
Perhaps priv->sensors[port] could be a struct that includes all the
necessary information about the sensor that isn't easily accessible by some
other means?

> +	void *pseninf = priv->base_reg;
> +
> +	mux_select = priv->mux_select;

nit: mux_select isn't much shorter than priv->mux_select. Could we just use
the latter directly?

> +	port = priv->port;

nit: port is only used once. Could we just use priv->port directly?

> +	csi_info = get_csi_info(priv, port);
> +	seninf_src = csi_info->seninf;
> +
> +	pr_debug("seninf csi_info->seninf(%d) port(%d)\n",
> +		 csi_info->seninf, csi_info->port);

dev_dbg()

In general please use the dev_() logging functions inside drivers whenever
possible.

> +
> +	/* Configure Mipi */
> +	csi_mipi.data_lane_num = sensor_mipi_lane_num - 1;
> +	csi_mipi.csi_info = csi_info;

csi_mipi has just 3 fields. Could we pass them as arguments to the functions
that care about them?

> +	input_data_type = (unsigned int)map_fmt(priv, &csi_mipi);

Why is this cast needed?

> +
> +	if (on) {
> +		/* Configure timestamp */
> +		write_master(pseninf, SENINF1_CTRL, (1 << 0), 0x00000001);
> +		write_master(pseninf, SENINF1_CTRL_EXT, (1 << 6), 0x00000040);

Please define macros for the magic numbers above.

> +		seninf_write_reg(pseninf, SENINF_TG1_TM_STP,
> +				 SENINF_TIMESTAMP_STEP);
> +
> +		set_csi_mipi(priv, &csi_mipi);
> +
> +		enable_mux(priv, mux_select);
> +		set_mux_ctrl(priv, mux_select, input_data_type);
> +
> +		set_top_mux_ctrl(priv, mux_select, seninf_src);
> +		seninf_write_reg(pseninf, SENINF_TOP_CAM_MUX_CTRL, 0x0);
> +	} else {
> +		power_off(priv, &csi_mipi);
> +	}
> +
> +	return 0;
> +};

Could move the on and !on cases to separate functions and have this one just
down to a simple

	if (on)
		return seninf_stream_on(...);
	else
		return seninf_stream_off(...);

> +
> +static const struct v4l2_subdev_pad_ops seninf_subdev_pad_ops = {
> +	.init_cfg = seninf_init_cfg,

I don't think we need this callback implemented.

> +	.set_fmt = seninf_set_fmt,

Can we really change the format on this device? Doesn't the format have to
match the format of the sensor? If so, we should just hardwire the format of
this device to the sensor format.

> +	.get_fmt = seninf_get_fmt,

We also need .link_validate to point to v4l2_subdev_link_validate_default()
and a simple .enum_mbus_code that returns the current mbus format.

> +};
> +
> +static const struct v4l2_subdev_video_ops seninf_subdev_video_ops = {
> +	.s_stream = seninf_s_stream,
> +};
> +
> +static struct v4l2_subdev_core_ops seninf_subdev_core_ops = {
> +	.subscribe_event	= seninf_subscribe_event,

Could we just use v4l2_ctrl_subdev_subscribe_event() here directly?

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
> +	struct _seninf *priv;
> +
> +	sd = media_entity_to_v4l2_subdev(entity);
> +	priv = v4l2_get_subdevdata(sd);
> +	pr_debug("mtk_seninf: remote %d-%d, local %d-%d\n",
> +		 remote->entity->graph_obj.id, remote->index,
> +		 local->entity->graph_obj.id, local->index);
> +	pr_debug("local->flags %d flags %d\n", local->flags, flags);

dev_dbg()

> +
> +	if ((local->flags & MEDIA_PAD_FL_SOURCE) &&
> +	    (flags & MEDIA_LNK_FL_ENABLED)) {
> +		pr_info("set cam mux %d\n", local->index);

dev_dbg()

> +/* Select cam mux, cam mux from pads 4~11,  pads 0~3 are used for sensor */
> +		priv->mux_select = local->index - 4;

Can we have only 1 output of the seninf enabled?

Could we have a macro for that 4?

> +	}
> +
> +	if ((local->flags & MEDIA_PAD_FL_SINK) &&
> +	    (flags & MEDIA_LNK_FL_ENABLED)) {
> +		pr_info("set port\n", local->index);

dev_dbg()

> +		/* Select port */
> +		priv->port = local->index;

Can we have only 1 input of the seninf enabled? I.e. is it impossible to use
2 sensors at the same time? If so, is it a hardware limitation?

> +		if (priv->port > NUM_PORTS) {

Shouldn't this be >=?

That said, NUM_PORTS is defined to 2, while the comment above says the first
4 pads are used for sensors? What's the right number here?

> +			pr_err("port index is over number of ports\n");
> +			return -EINVAL;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static const struct media_entity_operations seninf_media_ops = {
> +	.link_setup = seninf_link_setup,
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static int mtk_seninf_notifier_bound(struct v4l2_async_notifier *notifier,
> +				     struct v4l2_subdev *sd,
> +				     struct v4l2_async_subdev *asd)
> +{
> +	struct _seninf *priv = container_of(notifier, struct _seninf, notifier);
> +	struct device_node *node;
> +	unsigned int pad, ret;
> +	unsigned int is_sensor;
> +	struct device_node *endpoint;
> +
> +	node = to_of_node(sd->fwnode);
> +	dev_info(priv->dev, "%s bounded\n", sd->entity.name);

s/bounded/bound/

Also, please make this dev_dbg().

> +
> +	is_sensor = 0;
> +	if (!strcmp(node->name, SUBDEV_SENSOR_MAIN_NAME)) {

Node names should not be used for any matching. Please define the port
indexes for main and sub ports (e.g. 0 and 1). See the other drivers as a
reference, for example:

https://elixir.bootlin.com/linux/v5.2/source/drivers/media/pci/intel/ipu3/ipu3-cio2.c#L1395

> +		pad = MTK_CAM_SENINF_PAD_MAIN_SINK;

Related to the above, we could just use the port index as the pad index if
we define the input pads as the first N pads.

> +		is_sensor = 1;
> +	}
> +
> +	if (!strcmp(node->name, SUBDEV_SENSOR_SUB_NAME)) {
> +		pad = MTK_CAM_SENINF_PAD_SUB_SINK;
> +		is_sensor = 1;
> +	}

If we specify the indexes, we can just check for port < NUM_SENSOR_PORTS.

> +
> +	if (is_sensor == 1) {
> +		for_each_endpoint_of_node(node, endpoint) {
> +			ret = v4l2_fwnode_endpoint_parse
> +				(of_fwnode_handle(endpoint),
> +				&priv->ep[pad]);
> +			of_node_put(endpoint);
> +			dev_info(priv->dev, "ep %d, bus.mipi_csi2.num_data_lanes %d\n",
> +				 pad,
> +				 priv->ep[pad].bus.mipi_csi2.num_data_lanes);
> +		}

We shouldn't be parsing anything manually here. It's already parsed for us
when mtk_seninf_fwnode_parse() is called. Please implement it correctly
there.

> +
> +		ret = media_create_pad_link(&sd->entity, 0,
> +					    &priv->subdev.entity, pad, 0);
> +		dev_info
> +			(priv->dev, "%s bounded with pad:%d\n",
> +			sd->entity.name, pad);
> +		if (ret) {
> +			dev_err(priv->dev,
> +				"failed to create link for %s\n",
> +				sd->entity.name);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void mtk_seninf_notifier_unbind(struct v4l2_async_notifier *notifier,
> +				       struct v4l2_subdev *sd,
> +				       struct v4l2_async_subdev *asd)
> +{
> +	struct _seninf *priv = container_of(notifier, struct _seninf, notifier);
> +
> +	dev_info(priv->dev, "%s is unbounded\n", sd->entity.name);

No need to implement if there is nothing to do.

> +}
> +
> +static const struct v4l2_async_notifier_operations mtk_seninf_async_ops = {
> +	.bound = mtk_seninf_notifier_bound,
> +	.unbind = mtk_seninf_notifier_unbind,

Hmm, normally one would call v4l2_device_register_subdev_nodes() from
.complete(). This driver doesn't call it at all. How does it work?

> +};
> +
> +static int mtk_seninf_fwnode_parse(struct device *dev,
> +				   struct v4l2_fwnode_endpoint *vep,
> +				   struct v4l2_async_subdev *asd)
> +{

This should be implemented. Please check the other drivers for reference.
For example:

https://elixir.bootlin.com/linux/v5.2/source/drivers/media/pci/intel/ipu3/ipu3-cio2.c#L1478

> +	return 0;
> +}
> +
> +static int seninf_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct _seninf *priv = container_of(sd, struct _seninf, subdev);
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(priv->dev);
> +	if (ret < 0) {

We need to call pm_runtime_put() if get_sync() fails.

> +		dev_err(priv->dev, "Failed to pm_runtime_get_sync: %d\n", ret);
> +		return ret;
> +	}
> +
> +	clk_prepare_enable(priv->cam_clk);
> +	clk_prepare_enable(priv->top_mux_clk);

clk_prepare_enable() can fail, so we want to handle errors. I'd suggest
using the clk_bulk_ API to simplify this.

We shouldn't do power management on open/release, because the userspace can
just open devices to query the drivers. We don't want any power operations
in that case. Could you move this to stream start and stop.

> +
> +	return ret;
> +}
> +
> +static int seninf_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct _seninf *priv = container_of(sd, struct _seninf, subdev);
> +
> +	clk_disable_unprepare(priv->top_mux_clk);
> +	clk_disable_unprepare(priv->cam_clk);
> +	pm_runtime_put(priv->dev);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> +static const struct v4l2_subdev_internal_ops seninf_internal_ops = {
> +	.open = seninf_open,
> +	.close = seninf_close,
> +};
> +#endif
> +
> +static irqreturn_t seninf_irq(int irq, void *device_id)
> +{
> +	return IRQ_HANDLED;
> +}

Do we need an IRQ handler at all if there is nothing to do inside?

> +
> +static int seninf_enable_test_pattern(struct _seninf *priv, u32 pattern)
> +{
> +	void *pseninf = priv->base_reg;
> +
> +	switch (pattern) {
> +	case TEST_DISABLED:
> +		break;

Don't we need to write the registers with values for no test pattern?

> +	case TEST_GEN_PATTERN:
> +		seninf_write_reg(pseninf, SENINF_TOP_CTRL, 0x00000C00);
> +		seninf_write_reg(pseninf, SENINF1_CTRL, 0x00001001);
> +		seninf_write_reg(pseninf, SENINF1_MUX_CTRL, 0x96DF1080);
> +	    seninf_write_reg(pseninf, SENINF1_MUX_INTEN, 0x8000007F);

Something wrong with indentation here?

> +		seninf_write_reg(pseninf, SENINF1_MUX_SPARE, 0x00000000);
> +		seninf_write_reg(pseninf, SENINF1_MUX_CTRL_EXT, 0x000E2000);
> +		seninf_write_reg(pseninf, SENINF1_MUX_CTRL_EXT, 0x00000000);
> +		seninf_write_reg(pseninf, SENINF_TG1_TM_CTL, 0x000404C1);
> +		seninf_write_reg
> +			(pseninf, SENINF_TG1_TM_SIZE,
> +			(priv->fmt.format.height + 0x100) << 16
> +			| priv->fmt.format.width + 0x100);

The proper way to break lines of function calls is to keep the opening
parenthesis 

> +		seninf_write_reg(pseninf, SENINF_TG1_TM_CLK, 0x00000000);
> +		seninf_write_reg(pseninf, SENINF_TG1_TM_STP, 0x1);
> +		seninf_write_reg
> +			(pseninf, SENINF1_CTRL_EXT, seninf_read_reg(pseninf,
> +			SENINF1_CTRL_EXT) | 0x02);/* TESTMDL EN*/

Please define macros for all the magic numbers above.

> +		break;
> +	case TEST_DUMP_DEBUG_INFO:
> +		/* Sensor Interface Control */
> +		pr_info("SENINF_CSI2_CTL SENINF1:0x%x, 2:0x%x, 3:0x%x, 5:0x%x\n",
> +			seninf_read_reg(pseninf, SENINF1_CSI2_CTL),
> +			seninf_read_reg(pseninf, SENINF2_CSI2_CTL),
> +			seninf_read_reg(pseninf, SENINF3_CSI2_CTL),
> +			seninf_read_reg(pseninf, SENINF5_CSI2_CTL));
> +		/* Read width/height */
> +		/* Read interrupt status */
> +		pr_info("SENINF1_IRQ:0x%x, 2:0x%x, 3:0x%x, 5:0x%x\n",
> +			seninf_read_reg(pseninf, SENINF1_CSI2_INT_STATUS),
> +			seninf_read_reg(pseninf, SENINF2_CSI2_INT_STATUS),
> +			seninf_read_reg(pseninf, SENINF3_CSI2_INT_STATUS),
> +			seninf_read_reg(pseninf, SENINF5_CSI2_INT_STATUS));
> +		/* Mux1 */
> +		pr_info("SENINF1_MUX_CTRL:0x%x, INTSTA:0x%x, DEBUG_2(0x%x)\n",
> +			seninf_read_reg(pseninf, SENINF1_MUX_CTRL),
> +			seninf_read_reg(pseninf, SENINF1_MUX_INTSTA),
> +			seninf_read_reg(pseninf, SENINF1_MUX_DEBUG_2));

dev_dbg()

> +		if (seninf_read_reg(pseninf, SENINF1_MUX_INTSTA) & 0x1) {
> +			seninf_write_reg(pseninf, SENINF1_MUX_INTSTA,
> +					 0xffffffff);
> +			udelay(SENINF_DRV_DEBUG_DELAY);

Is this delay necessary? If so, could usleep_range() be used instead?

> +			pr_info("overrun CTRL:%x INTSTA:%x DEBUG_2:%x\n",
> +				seninf_read_reg(pseninf, SENINF1_MUX_CTRL),
> +				seninf_read_reg(pseninf, SENINF1_MUX_INTSTA),
> +				seninf_read_reg(pseninf, SENINF1_MUX_DEBUG_2));

If this is a failure, we should print with dev_err() or dev_warn() depending
on how severe the failure is. If it's a normal situation, we should use
dev_dbg().

> +		}
> +		break;
> +	default:
> +		dev_warn(priv->dev, "%s Unhandled testcase:%d\n",
> +			 __func__, pattern);
> +		break;

This is also handled by the control framework.

> +	}
> +
> +	return 0;
> +}
> +
> +static int seninf_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct _seninf *priv = container_of(ctrl->handler,
> +					     struct _seninf, ctrl_handler);
> +	int ret;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = seninf_enable_test_pattern(priv, ctrl->val);

Could we just return from here directly?

> +		break;
> +	default:
> +		ret = 0;
> +		dev_warn(priv->dev, "%s Unhandled id:0x%x, val:0x%x\n",
> +			 __func__, ctrl->id, ctrl->val);
> +		break;

There is no need to handle this. The control core will handle invalid
requests for us.

> +	}
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops seninf_ctrl_ops = {
> +	.s_ctrl = seninf_set_ctrl,
> +};
> +
> +static const char * const seninf_test_pattern_menu[] = {
> +	"Disabled",
> +	"generate_test_pattern",
> +	"dump_debug_info",

Could we have some more human-readable names describing the pattern itself?
Like "Horizontal bars" or "Color gradient".

> +};
> +
> +static int seninf_initialize_controls(struct _seninf *priv)
> +{
> +	struct v4l2_ctrl_handler *handler;
> +	struct v4l2_ctrl *test_pattern;
> +	int ret;
> +
> +	handler = &priv->ctrl_handler;
> +	ret = v4l2_ctrl_handler_init(handler, 2);

Why 2?

> +	if (ret)
> +		return ret;
> +	test_pattern =

Why do you need this assignment? The variable is not used anywhere later.

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
> +static int seninf_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct _seninf *priv;
> +	struct v4l2_subdev *sd;
> +	struct device *dev = &pdev->dev;
> +	struct media_pad *pads;
> +	unsigned int irq_info[3];
> +	unsigned int irq;
> +	int i;
> +	int ret;
> +
> +	dev_dbg(dev, "seninf probe +\n");
> +	priv = devm_kzalloc(&pdev->dev, sizeof(struct _seninf), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;

nit: Add a blank line here to improve readability. Generally please add
blank lines between unrelated blocks of code.

> +	memset(priv, 0, sizeof(struct _seninf));

Use sizeof(*priv) instead to make this work regardless of the type.

> +	priv->dev = &pdev->dev;
> +	sd = &priv->subdev;
> +	pads = priv->pads;

nit: Add a blank line here.

> +	/* Get IRQ ID and request IRQ */
> +	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);

Use platform_get_irq() instead, as the platform_device subsystem kindly
parsed the IRQs for us already.

> +

nit: This blank line is not needed as the lines above and below are related.

> +	if (!irq) {
> +		pr_debug("No IRQ found!!\n");
> +		return 0;

0 means success, but I think we failed here, right?

> +	}
> +	/* Get IRQ Flag from device node */
> +	if (of_property_read_u32_array(pdev->dev.of_node,
> +				       "interrupts", irq_info,
> +				       ARRAY_SIZE(irq_info))) {
> +		dev_err(dev, "get irq flags from DTS fail!!\n");
> +		return -ENODEV;
> +	}
> +	ret = request_irq(irq, seninf_irq,
> +			  irq_info[2], "SENINF", NULL);

No need to parse and pass the flags here, the platform device subsystem
already handled them. 0 should be fine.

> +	if (ret) {
> +		dev_err(dev, "request_irq fail\n");
> +		return ret;
> +	}
> +	pr_debug("Seninf devnode:%s, irq=%d\n",
> +		 pdev->dev.of_node->name, irq);

IMHO this debug log is a bit excessive, please remove.

Also, in general, please use dev_dbg().

> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "base_reg");

Please avoid relying on the names, especially since we have only 2 register
sets here and both are mandatory. Please just define the DT bindings with
explicit order and use indexes.

> +	priv->base_reg = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->base_reg))
> +		return PTR_ERR(priv->base_reg);

nit: Add blank line.

> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rx_reg");
> +	priv->rx_reg = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->rx_reg))
> +		return PTR_ERR(priv->rx_reg);
> +
> +	priv->csi2_rx[CFG_CSI_PORT_0]  = priv->rx_reg;
> +	priv->csi2_rx[CFG_CSI_PORT_0A] = priv->rx_reg;

Hmm, is it expected that Port 0 and 0A use the same registers?

> +	priv->csi2_rx[CFG_CSI_PORT_0B] = priv->rx_reg + 0x1000;
> +	priv->csi2_rx[CFG_CSI_PORT_1]  = priv->rx_reg + 0x2000;
> +	priv->csi2_rx[CFG_CSI_PORT_2]  = priv->rx_reg + 0x4000;
> +
> +	priv->cam_clk = devm_clk_get(dev, "CLK_CAM_SENINF");

Please use lowercase and "-" instead of "_" in clock names. There is also no
need to prefix clock names with "clk" and suffix with "seninf". The right
names here would be "cam" and "top-mux".

> +	if (IS_ERR(priv->cam_clk)) {
> +		dev_err(dev, "Failed to get cam_clk\n");
> +		return -EINVAL;
> +	}
> +
> +	priv->top_mux_clk = devm_clk_get(dev, "CLK_TOP_MUX_SENINF");
> +	if (IS_ERR(priv->top_mux_clk)) {
> +		dev_err(dev, "Failed to get top_mux_clk\n");
> +		return -EINVAL;
> +	}

I'd suggest moving out the Media and V4L2 registration code into a separate
function. Starting from this line.

> +
> +	v4l2_subdev_init(sd, &seninf_subdev_ops);
> +
> +	init_fmt(priv);
> +	ret = seninf_initialize_controls(priv);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize controls\n");
> +		return ret;
> +	}
> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API

The driver should be made depend on this in Kconfig and ifdefs removed.

> +	sd->internal_ops = &seninf_internal_ops;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;

Merge the two lines into one.

> +#endif
> +	priv->subdev.dev = &pdev->dev;

Why not just sd->dev?

> +	snprintf(sd->name, V4L2_SUBDEV_NAME_SIZE, "%s.mipi-csi",
> +		 dev_name(&pdev->dev));

The ".mipi-csi" suffix is not needed.

> +	v4l2_set_subdevdata(sd, priv);
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->entity.ops = &seninf_media_ops;

nit: Blank line here.

> +	for (i = 0; i < 4; i++)

Perhaps define a macro for this 4?

> +		pads[i].flags = MEDIA_PAD_FL_SINK;
> +	for (i = 4; i < NUM_PADS; i++)
> +		pads[i].flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&sd->entity, NUM_PADS, pads);
> +	if (ret < 0)
> +		goto err_free_handler;
> +#endif
> +	ret = v4l2_async_notifier_parse_fwnode_endpoints
> +		(dev, &priv->notifier, sizeof(struct v4l2_async_subdev),
> +		 mtk_seninf_fwnode_parse);
> +	if (ret < 0)
> +		goto err_clean_entity;
> +
> +	if (!priv->notifier.num_subdevs) {
> +		ret = -ENODEV;	/* no endpoint */
> +		goto err_clean_entity;
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

The code from the previous comment and until this line deserves a separate function.

> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);

We should only need pm_runtime_enable() here.

> +	dev_info(dev, "seninf probe -\n");
> +	return 0;
> +
> +err_clean_notififer:
> +	v4l2_async_notifier_cleanup(&priv->notifier);
> +err_clean_entity:
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	media_entity_cleanup(&sd->entity);
> +#endif
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> +
> +	return ret;
> +}
> +
> +static int seninf_pm_suspend(struct device *dev)
> +{
> +	pr_debug("seninf_runtime_suspend\n");
> +
> +	return 0;
> +}
> +
> +static int seninf_pm_resume(struct device *dev)
> +{
> +	pr_debug("seninf_runtime_resume\n");
> +
> +	return 0;
> +}

There should be no need to provide empty callbacks if there isn't anything
to do here.

> +
> +static const struct dev_pm_ops runtime_pm_ops = {
> +	SET_RUNTIME_PM_OPS(seninf_pm_suspend,
> +			   seninf_pm_resume,
> +			   NULL)

No need to break the line here.

> +};
> +
> +static int seninf_remove(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *subdev = platform_get_drvdata(pdev);
> +	struct _seninf *priv = container_of(subdev, struct _seninf, subdev);

One would normally set the driver-specific struct as drvdata.

> +	struct v4l2_subdev *sd = &priv->subdev;

Isn't this the same as subdev?

> +
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	media_entity_cleanup(&sd->entity);
> +#endif

This driver doesn't make sense without Media Controller. Let's just make it
depend on it in Kconfig and remove the ifdefs.

> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);

There are still devices exposed that are using this control handler at this
point. This should happen after unregistering those devices.

> +	v4l2_async_unregister_subdev(&priv->subdev);
> +	pm_runtime_disable(priv->dev);
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
> +static int seninf_suspend(struct platform_device *pdev, pm_message_t mesg)
> +{
> +	return 0;
> +}
> +
> +static int seninf_resume(struct platform_device *pdev)
> +{
> +	return 0;
> +}

These 2 should be implemented. Specifically, any hardware state needs to be
preserved across system suspend, so that any streaming that started before
suspend automatically keeps streaming after resuming.

> +
> +static struct platform_driver seninf_pdrv = {
> +	.probe	= seninf_probe,
> +	.remove	= seninf_remove,
> +	.suspend = seninf_suspend,
> +	.resume = seninf_resume,

These suspend/resume fields are deprecated. Please set these in dev_pm_ops,
not here.

> +	.driver	= {
> +		.name	= "seninf",

Maybe mtk-seninf?

> +		.owner  = THIS_MODULE,
> +#ifdef CONFIG_OF
> +		.of_match_table = mtk_seninf_of_match,
> +#endif

No need for this ifdef if you use the of_match_ptr() macro.

> +		.pm  = &runtime_pm_ops,
> +	},
> +};
> +
> +static int __init mtk_seninf_init(void)
> +{
> +	int ret;
> +
> +	pr_debug("seninf Init\n");
> +	ret = platform_driver_register(&seninf_pdrv);
> +	if (ret) {
> +		pr_err("Failed to register platform driver\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit mtk_seninf_exit(void)
> +{
> +	pr_debug("seninf Exit\n");
> +	platform_driver_unregister(&seninf_pdrv);
> +}
> +
> +late_initcall(mtk_seninf_init);

Why late_initcall()? You should be able to just use module_platform_driver()
here. If not, that would be a bug somewhere in this or another related
driver.

> +module_exit(mtk_seninf_exit);
> +
> +MODULE_DESCRIPTION("MTK seninf driver");
> +MODULE_AUTHOR("Louis Kuo <louis.kuo@mediatek.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("MTK:mtk_seninf");
> diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
> new file mode 100644
> index 0000000..8d00b88
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
> @@ -0,0 +1,155 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __SENINF_DRV_DEF_H__
> +#define __SENINF_DRV_DEF_H__
> +
> +#if defined(SENINF_CLK_208M)
> +#define SENINF_TIMESTAMP_STEP		0x67
> +#define SENINF_SETTLE_DELAY		0x15
> +#define SENINF_HS_TRAIL_PARAMETER	0x8
> +#elif defined(SENINF_CLK_312M)
> +#define SENINF_TIMESTAMP_STEP		0x9b
> +#define SENINF_SETTLE_DELAY		0x20
> +#define SENINF_HS_TRAIL_PARAMETER	0xa
> +#else
> +#define SENINF_TIMESTAMP_STEP		0x67
> +#define SENINF_SETTLE_DELAY		0x15
> +#define SENINF_HS_TRAIL_PARAMETER	0x8
> +#endif

Please detect the clock frequency at runtime and use the right value
dynamically.

> +
> +#define SENINF_DRV_DEBUG_DELAY		1000
> +
> +#define SENSOR_CLOCK_POLARITY_HIGH	0
> +#define SENSOR_CLOCK_POLARITY_LOW	1

These two don't seem to be used.

> +#define NUM_PADS			12
> +#define NUM_PORTS			2
> +#define DEFAULT_WIDTH			1600
> +#define DEFAULT_HEIGHT			1200
> +
> +enum {
> +	MIPI_OPHY_NCSI2 = 0,
> +	MIPI_OPHY_CSI2  = 1,
> +	MIPI_CPHY       = 2,
> +};
> +
> +enum {
> +	TEST_DISABLED = 0X0,
> +	TEST_GEN_PATTERN,
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
> +#define SENINF_CAM_MUX_MIN      SENINF_MUX1
> +#define SENINF_CAM_MUX_MAX      SENINF_MUX3
> +#define SENINF_CAMSV_MUX_MIN    SENINF_MUX3
> +#define SENINF_CAMSV_MUX_MAX    SENINF_MUX_NUM
> +
> +#define SENINF_PIXEL_MODE_CAM   TWO_PIXEL_MODE
> +#define SENINF_PIXEL_MODE_CAMSV FOUR_PIXEL_MODE
> +
> +#define SENINF_TIMESTAMP_CLK    1000
> +

The 7 macros above are not used.

> +enum {
> +	SENSOR_MIPI_1_LANE = 0,
> +	SENSOR_MIPI_2_LANE,
> +	SENSOR_MIPI_3_LANE,
> +	SENSOR_MIPI_4_LANE
> +};

Why not just use a normal int here? It's just a value between 1 and 4.

> +
> +enum {
> +	SENINF_MUX1 = 0x0,
> +	SENINF_MUX2 = 0x1,
> +	SENINF_MUX3 = 0x2,
> +	SENINF_MUX4 = 0x3,
> +	SENINF_MUX5 = 0x4,
> +	SENINF_MUX6 = 0x5,
> +	SENINF_MUX_NUM,
> +	SENINF_MUX_ERROR = -1,
> +};

This enum is not used.

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
> +	PAD_10BIT       = 0x0,
> +	PAD_8BIT_7_0    = 0x3,
> +	PAD_8BIT_9_2    = 0x4,
> +};

Is this enum used?

> +
> +enum { /* 0:CSI2(2.5G), 3: parallel, 8:NCSI2(1.5G) */
> +	CSI2            = 0x0, /* 2.5G support */
> +	TEST_MODEL      = 0x1,
> +	CCIR656         = 0x2,
> +	PARALLEL_SENSOR = 0x3,
> +	SERIAL_SENSOR   = 0x4,
> +	HD_TV           = 0x5,
> +	EXT_CSI2_OUT1   = 0x6,
> +	EXT_CSI2_OUT2   = 0x7,
> +	MIPI_SENSOR     = 0x8,/* 1.5G support */
> +	VIRTUAL_CHANNEL_1  = 0x9,
> +	VIRTUAL_CHANNEL_2  = 0xA,
> +	VIRTUAL_CHANNEL_3  = 0xB,
> +	VIRTUAL_CHANNEL_4  = 0xC,
> +	VIRTUAL_CHANNEL_5  = 0xD,
> +	VIRTUAL_CHANNEL_6  = 0xE,
> +};

Is this enum used?

> +
> +enum { /* 0:CSI2(2.5G), 1:NCSI2(1.5G) */
> +	CSI2_1_5G           = 0x0, /* 1.5G support */
> +	CSI2_2_5G           = 0x1, /* 2.5G support*/
> +	CSI2_2_5G_CPHY      = 0x2, /* 2.5G support*/
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
> +enum {
> +	CMD_SENINF_GET_SENINF_ADDR,
> +	CMD_SENINF_DEBUG_TASK,
> +	CMD_SENINF_DEBUG_TASK_CAMSV,
> +	CMD_SENINF_DEBUG_PIXEL_METER,
> +	CMD_SENINF_MAX
> +};

Is this enum used?

> +
> +/* MIPI sensor pad usage */
> +struct seninf_csi_info {
> +	unsigned int port;
> +	unsigned int         seninf;
> +};
> +
> +struct seninf_csi_mipi {
> +	struct seninf_csi_info  *csi_info;
> +	unsigned int     data_lane_num;
> +	unsigned int     dpcm;
> +};

Please use a space between type name and variable name.

> +
> +#endif /*__SENINF_DRV_DEF_H__ */
> diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h
> new file mode 100644
> index 0000000..349dc9c
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h
> @@ -0,0 +1,965 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _SENINF_REG_H_
> +#define _SENINF_REG_H_
> +
> +/* 0x11C80000..0x11C850AC */
> +#define MIPI_RX_ANA00_CSI0A           0x0000
> +#define MIPI_RX_ANA04_CSI0A           0x0004
> +#define MIPI_RX_ANA08_CSI0A           0x0008
> +#define MIPI_RX_ANA0C_CSI0A           0x000C

Please use lowercase for hex numbers.

> +#define MIPI_RX_ANA10_CSI0A           0x0010
> +#define MIPI_RX_ANA14_CSI0A           0x0014
> +#define MIPI_RX_ANA18_CSI0A           0x0018
> +#define MIPI_RX_ANA1C_CSI0A           0x001C
> +#define MIPI_RX_ANA20_CSI0A           0x0020
> +#define MIPI_RX_ANA24_CSI0A           0x0024
> +#define MIPI_RX_ANA28_CSI0A           0x0028
> +#define MIPI_RX_ANA2C_CSI0A           0x002C
> +#define rsv_0030                      0x0030

Please remove reserved addresses.

> +#define MIPI_RX_ANA34_CSI0A           0x0034
> +#define MIPI_RX_ANA38_CSI0A           0x0038
> +#define rsv_003C                      0x003C
> +#define MIPI_RX_ANA40_CSI0A           0x0040
> +#define rsv_0044                      0x0044
> +#define MIPI_RX_ANA48_CSI0A           0x0048
> +#define rsv_004C_13                   0x004C
> +#define MIPI_RX_WRAPPER80_CSI0A       0x0080
> +#define MIPI_RX_WRAPPER84_CSI0A       0x0084
> +#define MIPI_RX_WRAPPER88_CSI0A       0x0088
> +#define MIPI_RX_WRAPPER8C_CSI0A       0x008C
> +#define MIPI_RX_WRAPPER90_CSI0A       0x0090
> +#define MIPI_RX_WRAPPER94_CSI0A       0x0094
> +#define MIPI_RX_WRAPPER98_CSI0A       0x0098
> +#define MIPI_RX_WRAPPER9C_CSI0A       0x009C
> +#define rsv_00A0                      0x00A0
> +#define MIPI_RX_ANAA4_CSI0A           0x00A4
> +#define MIPI_RX_ANAA8_CSI0A           0x00A8
> +#define rsv_00AC_981                  0x00AC
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
> +#define rsv_1030                      0x1030
> +#define MIPI_RX_ANA34_CSI0B           0x1034
> +#define MIPI_RX_ANA38_CSI0B           0x1038
> +#define rsv_103C_3                    0x103C
> +#define MIPI_RX_ANA48_CSI0B           0x1048
> +#define rsv_104C_13                   0x104C
> +#define MIPI_RX_WRAPPER80_CSI0B       0x1080
> +#define MIPI_RX_WRAPPER84_CSI0B       0x1084
> +#define MIPI_RX_WRAPPER88_CSI0B       0x1088
> +#define MIPI_RX_WRAPPER8C_CSI0B       0x108C
> +#define MIPI_RX_WRAPPER90_CSI0B       0x1090
> +#define MIPI_RX_WRAPPER94_CSI0B       0x1094
> +#define MIPI_RX_WRAPPER98_CSI0B       0x1098
> +#define MIPI_RX_WRAPPER9C_CSI0B       0x109C
> +#define rsv_10A0                      0x10A0
> +#define MIPI_RX_ANAA4_CSI0B           0x10A4
> +#define MIPI_RX_ANAA8_CSI0B           0x10A8
> +#define rsv_10AC_981                  0x10AC
> +#define MIPI_RX_ANA00_CSI1A           0x2000
> +#define MIPI_RX_ANA04_CSI1A           0x2004
> +#define MIPI_RX_ANA08_CSI1A           0x2008
> +#define MIPI_RX_ANA0C_CSI1A           0x200C
> +#define MIPI_RX_ANA10_CSI1A           0x2010
> +#define rsv_2014                      0x2014
> +#define MIPI_RX_ANA18_CSI1A           0x2018
> +#define MIPI_RX_ANA1C_CSI1A           0x201C
> +#define rsv_2020                      0x2020
> +#define MIPI_RX_ANA24_CSI1A           0x2024
> +#define rsv_2028_8                    0x2028
> +#define MIPI_RX_ANA48_CSI1A           0x2048
> +#define rsv_204C_13                   0x204C
> +#define MIPI_RX_WRAPPER80_CSI1A       0x2080
> +#define MIPI_RX_WRAPPER84_CSI1A       0x2084
> +#define MIPI_RX_WRAPPER88_CSI1A       0x2088
> +#define MIPI_RX_WRAPPER8C_CSI1A       0x208C
> +#define MIPI_RX_WRAPPER90_CSI1A       0x2090
> +#define MIPI_RX_WRAPPER94_CSI1A       0x2094
> +#define MIPI_RX_WRAPPER98_CSI1A       0x2098
> +#define MIPI_RX_WRAPPER9C_CSI1A       0x209C
> +#define rsv_20A0                      0x20A0
> +#define MIPI_RX_ANAA4_CSI1A           0x20A4
> +#define MIPI_RX_ANAA8_CSI1A           0x20A8
> +#define rsv_20AC_981                  0x20AC
> +#define MIPI_RX_ANA00_CSI1B           0x3000
> +#define MIPI_RX_ANA04_CSI1B           0x3004
> +#define MIPI_RX_ANA08_CSI1B           0x3008
> +#define MIPI_RX_ANA0C_CSI1B           0x300C
> +#define MIPI_RX_ANA10_CSI1B           0x3010
> +#define rsv_3014                      0x3014
> +#define MIPI_RX_ANA18_CSI1B           0x3018
> +#define MIPI_RX_ANA1C_CSI1B           0x301C
> +#define rsv_3020                      0x3020
> +#define MIPI_RX_ANA24_CSI1B           0x3024
> +#define rsv_3028_8                    0x3028
> +#define MIPI_RX_ANA48_CSI1B           0x3048
> +#define rsv_304C_13                   0x304C
> +#define MIPI_RX_WRAPPER80_CSI1B       0x3080
> +#define MIPI_RX_WRAPPER84_CSI1B       0x3084
> +#define MIPI_RX_WRAPPER88_CSI1B       0x3088
> +#define MIPI_RX_WRAPPER8C_CSI1B       0x308C
> +#define MIPI_RX_WRAPPER90_CSI1B       0x3090
> +#define MIPI_RX_WRAPPER94_CSI1B       0x3094
> +#define MIPI_RX_WRAPPER98_CSI1B       0x3098
> +#define MIPI_RX_WRAPPER9C_CSI1B       0x309C
> +#define rsv_30A0                      0x30A0
> +#define MIPI_RX_ANAA4_CSI1B           0x30A4
> +#define MIPI_RX_ANAA8_CSI1B           0x30A8
> +#define rsv_30AC_981                  0x30AC
> +#define MIPI_RX_ANA00_CSI2A           0x4000
> +#define MIPI_RX_ANA04_CSI2A           0x4004
> +#define MIPI_RX_ANA08_CSI2A           0x4008
> +#define MIPI_RX_ANA0C_CSI2A           0x400C
> +#define MIPI_RX_ANA10_CSI2A           0x4010
> +#define rsv_4014                      0x4014
> +#define MIPI_RX_ANA18_CSI2A           0x4018
> +#define MIPI_RX_ANA1C_CSI2A           0x401C
> +#define rsv_4020                      0x4020
> +#define MIPI_RX_ANA24_CSI2A           0x4024
> +#define rsv_4028_8                    0x4028
> +#define MIPI_RX_ANA48_CSI2A           0x4048
> +#define rsv_404C_13                   0x404C
> +#define MIPI_RX_WRAPPER80_CSI2A       0x4080
> +#define MIPI_RX_WRAPPER84_CSI2A       0x4084
> +#define MIPI_RX_WRAPPER88_CSI2A       0x4088
> +#define MIPI_RX_WRAPPER8C_CSI2A       0x408C
> +#define MIPI_RX_WRAPPER90_CSI2A       0x4090
> +#define MIPI_RX_WRAPPER94_CSI2A       0x4094
> +#define MIPI_RX_WRAPPER98_CSI2A       0x4098
> +#define MIPI_RX_WRAPPER9C_CSI2A       0x409C
> +#define rsv_40A0                      0x40A0
> +#define MIPI_RX_ANAA4_CSI2A           0x40A4
> +#define MIPI_RX_ANAA8_CSI2A           0x40A8
> +#define rsv_40AC_981                  0x40AC
> +#define MIPI_RX_ANA00_CSI2B           0x5000
> +#define MIPI_RX_ANA04_CSI2B           0x5004
> +#define MIPI_RX_ANA08_CSI2B           0x5008
> +#define MIPI_RX_ANA0C_CSI2B           0x500C
> +#define MIPI_RX_ANA10_CSI2B           0x5010
> +#define rsv_5014                      0x5014
> +#define MIPI_RX_ANA18_CSI2B           0x5018
> +#define MIPI_RX_ANA1C_CSI2B           0x501C
> +#define rsv_5020                      0x5020
> +#define MIPI_RX_ANA24_CSI2B           0x5024
> +#define rsv_5028_8                    0x5028
> +#define MIPI_RX_ANA48_CSI2B           0x5048
> +#define rsv_504C_13                   0x504C
> +#define MIPI_RX_WRAPPER80_CSI2B       0x5080
> +#define MIPI_RX_WRAPPER84_CSI2B       0x5084
> +#define MIPI_RX_WRAPPER88_CSI2B       0x5088
> +#define MIPI_RX_WRAPPER8C_CSI2B       0x508C
> +#define MIPI_RX_WRAPPER90_CSI2B       0x5090
> +#define MIPI_RX_WRAPPER94_CSI2B       0x5094
> +#define MIPI_RX_WRAPPER98_CSI2B       0x5098
> +#define MIPI_RX_WRAPPER9C_CSI2B       0x509C
> +#define rsv_50A0                      0x50A0
> +#define MIPI_RX_ANAA4_CSI2B           0x50A4
> +#define MIPI_RX_ANAA8_CSI2B           0x50A8
> +#define rsv_50AC_20                   0x50AC
> +
> +/* 0x1A040000..0x1A047D40 */
> +#define SENINF_TOP_CTRL                        0x0000
> +#define SENINF_TOP_CMODEL_PAR                  0x0004

Please align all the values to the same indentation. 

Best regards,
Tomasz

