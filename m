Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC5247A18
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 08:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfFQGeX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 02:34:23 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:43612 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725554AbfFQGeX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 02:34:23 -0400
X-UUID: eb0dd3fd2c364be9b39467b26bb9c2e2-20190617
X-UUID: eb0dd3fd2c364be9b39467b26bb9c2e2-20190617
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1974086279; Mon, 17 Jun 2019 14:34:12 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Jun 2019 14:34:10 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 17 Jun 2019 14:34:10 +0800
Message-ID: <1560753250.22135.14.camel@mtksdaap41>
Subject: Re: [RFC PATCH V3 1/4] media: platform: mtk-isp: Add Mediatek
 sensor interface driver
From:   CK Hu <ck.hu@mediatek.com>
To:     Louis Kuo <louis.kuo@mediatek.com>
CC:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>, <devicetree@vger.kernel.org>,
        <Sean.Cheng@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <srv_heupstream@mediatek.com>, <holmes.chiou@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <sj.huang@mediatek.com>, <yuzhao@chromium.org>,
        <linux-mediatek@lists.infradead.org>, <zwisler@chromium.org>,
        <christie.yu@mediatek.com>, <frederic.chen@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>
Date:   Mon, 17 Jun 2019 14:34:10 +0800
In-Reply-To: <1559815233-24796-2-git-send-email-louis.kuo@mediatek.com>
References: <1559815233-24796-1-git-send-email-louis.kuo@mediatek.com>
         <1559815233-24796-2-git-send-email-louis.kuo@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi, Louis:

On Thu, 2019-06-06 at 18:00 +0800, Louis Kuo wrote:
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

Lower case for variable name.

> +	{CFG_CSI_PORT_0,  SENINF_1},
> +	{CFG_CSI_PORT_1,  SENINF_3},
> +	{CFG_CSI_PORT_2,  SENINF_5},
> +	{CFG_CSI_PORT_0A, SENINF_1},
> +	{CFG_CSI_PORT_0B, SENINF_2},
> +};
> +
> +struct _seninf {
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
> +
> +static void set_mux_ctrl
> +	(struct _seninf *priv, unsigned int mux,

Merge to one line.

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
> +	write_master(pseninf, SENINF1_MUX_CTRL_EXT,
> +		     (temp << 0), 0x00000003);
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
> +}
> +
> +static void enable_mux(struct _seninf *priv, unsigned int mux)
> +{
> +	void *pseninf = priv->base_reg + 0x1000 * mux;
> +
> +	write_master(pseninf, SENINF1_MUX_CTRL, (1 << 31), 0x80000000);
> +}
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
> +
> +	/* Only 4d1c need set CSIB: MIPIRX_ANALOG_B_BASE = 0x00001242 */
> +	if (is_4d1c(csi_info->port))
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			     (1 << 6) | (1 << 9) | (1 << 12), 0x00001B60);
> +	else /* MIPIRX_ANALOG_BASE = 0x102 */
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			     (1 << 8) | (1 << 9), 0x00001B40);
> +
> +	/* Byte clock invert */
> +	write_master(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> +		     (1 << 0) | (1 << 1) | (1 << 2), 0x00000007);
> +	if (is_4d1c(csi_info->port))
> +		write_master(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
> +			     (1 << 0) | (1 << 1) | (1 << 2),
> +			     0x00000007);
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
> +	pr_debug("pcsi_mipi->CSI2_IP %d, MIPI_RX_CON24_CSI0 0x%x\n",
> +		 csi_info->port,
> +		 seninf_read_reg(pmipi_rx_conf, MIPI_RX_CON24_CSI0));
> +	usleep_range(20, 40);
> +	/* D-PHY SW Delay Line calibration */
> +}
> +
> +static void set_cphy
> +	(struct _seninf *priv,
> +	struct seninf_csi_mipi *pcsi_mipi)
> +{ /* Cphy setting for CSI0 */
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

Use write_master()?

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
> +			break;
> +		}
> +		usleep_range(20, 40);
> +	}

Use readl_poll_timeout_atomic()?

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

In this patch,

#define MIPI_SENSOR_TYPE MIPI_OPHY_NCSI2

So I think you need not to consider CSI2_2_5G_CPHY case in this patch. You should move the CSI2_2_5G_CPHY related code to another patch.

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
> +	}
> +
> +	/* First Enable Sensor interface and select pad (0x1a04_0200) */
> +	write_master(pseninf, SENINF1_CTRL,
> +		     mipi_enable << 0, 0x00000001);
> +	write_master(pseninf, SENINF1_CTRL,
> +		     pad_sel << 28, 0x70000000);
> +
> +	if (csi_type == CSI2_1_5G || csi_type == CSI2_2_5G) {

csi_type would never be CSI2_1_5G in this patch.

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

If you does nothing in irq handler, why do you turn on interrupt?

> +	/* Write clear CSI2 IRQ */
> +	seninf_write_reg(pseninf, SENINF1_CSI2_INT_STATUS, 0xFFFFFFFF);
> +	/* Enable CSI2 Extend IRQ mask */
> +	/* Turn on all interrupt */
> +	seninf_write_reg(pseninf, SENINF1_CSI2_INT_EN_EXT, 0x0000001f);

Ditto.

> +
> +	write_master(pseninf, SENINF1_CTRL, (1 << 7), 0x00000080);
> +	udelay(1);
> +	write_master(pseninf, SENINF1_CTRL, 0, 0x00000080);
> +}
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

unsigned int.

> +	(struct _seninf *priv,

Merge to one line.

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
> +	}
> +	return fmtidx;
> +}
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
> +static int seninf_init_cfg
> +				(struct v4l2_subdev *sd,

Merge to one line.

> +				 struct v4l2_subdev_pad_config *cfg)
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

[snip]

> +
> +static int mtk_seninf_fwnode_parse(struct device *dev,
> +				   struct v4l2_fwnode_endpoint *vep,
> +				   struct v4l2_async_subdev *asd)
> +{
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
> +		dev_err(priv->dev, "Failed to pm_runtime_get_sync: %d\n", ret);
> +		return ret;
> +	}
> +
> +	clk_prepare_enable(priv->cam_clk);
> +	clk_prepare_enable(priv->top_mux_clk);
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

If you does nothing in irq handler, you should remove this handler.

> +

[snip]

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
> +	memset(priv, 0, sizeof(struct _seninf));
> +	priv->dev = &pdev->dev;
> +	sd = &priv->subdev;
> +	pads = priv->pads;
> +	/* Get IRQ ID and request IRQ */
> +	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> +
> +	if (!irq) {
> +		pr_debug("No IRQ found!!\n");
> +		return 0;
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
> +	if (ret) {
> +		dev_err(dev, "request_irq fail\n");
> +		return ret;
> +	}
> +	pr_debug("Seninf devnode:%s, irq=%d\n",
> +		 pdev->dev.of_node->name, irq);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "base_reg");
> +	priv->base_reg = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->base_reg))
> +		return PTR_ERR(priv->base_reg);
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rx_reg");
> +	priv->rx_reg = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->rx_reg))
> +		return PTR_ERR(priv->rx_reg);
> +
> +	priv->csi2_rx[CFG_CSI_PORT_0]  = priv->rx_reg;
> +	priv->csi2_rx[CFG_CSI_PORT_0A] = priv->rx_reg;
> +	priv->csi2_rx[CFG_CSI_PORT_0B] = priv->rx_reg + 0x1000;
> +	priv->csi2_rx[CFG_CSI_PORT_1]  = priv->rx_reg + 0x2000;
> +	priv->csi2_rx[CFG_CSI_PORT_2]  = priv->rx_reg + 0x4000;
> +
> +	priv->cam_clk = devm_clk_get(dev, "CLK_CAM_SENINF");
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
> +	sd->internal_ops = &seninf_internal_ops;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> +#endif
> +	priv->subdev.dev = &pdev->dev;
> +	snprintf(sd->name, V4L2_SUBDEV_NAME_SIZE, "%s.mipi-csi",
> +		 dev_name(&pdev->dev));
> +	v4l2_set_subdevdata(sd, priv);
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->entity.ops = &seninf_media_ops;
> +	for (i = 0; i < 4; i++)
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

If mtk_seninf_fwnode_parse() does nothing, you could just pass NULL for the callback function.

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
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
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
> +
> +static const struct dev_pm_ops runtime_pm_ops = {
> +	SET_RUNTIME_PM_OPS(seninf_pm_suspend,
> +			   seninf_pm_resume,
> +			   NULL)
> +};

If you does nothing in suspend and resume function, I think you should
remove these two callback function.

Regards,
CK

> +
> +static int seninf_remove(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *subdev = platform_get_drvdata(pdev);
> +	struct _seninf *priv = container_of(subdev, struct _seninf, subdev);
> +	struct v4l2_subdev *sd = &priv->subdev;
> +
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	media_entity_cleanup(&sd->entity);
> +#endif
> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> +	v4l2_async_unregister_subdev(&priv->subdev);
> +	pm_runtime_disable(priv->dev);
> +	return 0;
> +}
> +




