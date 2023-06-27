Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09BFD73FD68
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 16:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjF0OJT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 10:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjF0OJT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 10:09:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CAE9295B;
        Tue, 27 Jun 2023 07:09:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (unknown [193.85.242.128])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D032410A;
        Tue, 27 Jun 2023 16:08:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687874915;
        bh=2tLjFqR85/HNN1FGdzp8MdToBL0lJRcR06dzOH5Xg14=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CUbmfKBytBrklO5QRbwgDzTGo1xgRnEcHoU9PO+aHfLUcUy8eWRYElrTaQkyh4nMf
         4QwIaAhYpI0W1vCK0v/PG8Oi41zc1wKSUZNr3Jwr4Ih6VE794RuGST2VXeqlSvGrnI
         HvZ+Nw0LNVfKDXyDQfceZqP+wXxVNHAeiR57AdSM=
Date:   Tue, 27 Jun 2023 17:09:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     guoniu.zhou@oss.nxp.com
Cc:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        xavier.roumegue@oss.nxp.com, kernel@pengutronix.de,
        jacopo.mondi@ideasonboard.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v3 2/3] media: nxp: imx8-isi: move i.MX8 gasket
 configuration to an ops structure
Message-ID: <20230627140913.GB14185@pendragon.ideasonboard.com>
References: <20230627062017.1135114-1-guoniu.zhou@oss.nxp.com>
 <20230627062017.1135114-3-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230627062017.1135114-3-guoniu.zhou@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guoniu,

Thank you for the patch.

On Tue, Jun 27, 2023 at 02:20:16PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Move i.MX8MN and i.MX8MP gasket configuration to an ops structure.

Commit messages should explain the reason behind the change, not just
what the change does. The *why* is considered even more important than
the *what*, as it's (usually) possible to understand what a patch does
by reading it, while the reason is much more difficult to get from just
looking at the code.

In this case, the commit message could be

"The i.MX93 includes an ISI instance compatible with the imx8-isi
driver, but with a different gasket. To prepare for this, make the
gasket configuration modular by moving the code to an ops structure."

> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/Makefile  |  2 +-
>  .../platform/nxp/imx8-isi/imx8-isi-core.c     | 12 ++++--
>  .../platform/nxp/imx8-isi/imx8-isi-core.h     | 30 ++++++++++++-
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 42 +++++++------------
>  .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 32 ++++++++++++++
>  5 files changed, 85 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/Makefile b/drivers/media/platform/nxp/imx8-isi/Makefile
> index 9bff9297686d..4376e8e0c962 100644
> --- a/drivers/media/platform/nxp/imx8-isi/Makefile
> +++ b/drivers/media/platform/nxp/imx8-isi/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
>  imx8-isi-y := imx8-isi-core.o imx8-isi-crossbar.o imx8-isi-hw.o \
> -	imx8-isi-pipe.o imx8-isi-video.o
> +	imx8-isi-pipe.o imx8-isi-video.o imx8-isi-gasket.o

Please use alphabetical order.

>  imx8-isi-$(CONFIG_DEBUG_FS) += imx8-isi-debug.o
>  imx8-isi-$(CONFIG_VIDEO_IMX8_ISI_M2M) += imx8-isi-m2m.o
>  
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 253e77189b69..d645b2f6fa5a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -279,6 +279,12 @@ static const struct clk_bulk_data mxc_imx8mn_clks[] = {
>  	{ .id = "apb" },
>  };
>  
> +/* Gasket operations for i.MX8MN and i.MX8MP */
> +static const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
> +	.enable = mxc_imx8_gasket_enable,
> +	.disable = mxc_imx8_gasket_disable,
> +};
> +

This can be moved to imx8-isi-gasket.c. You will need to add an

extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;

to imx8-isi-core.h, and remove the declarations of the
mxc_imx8_gasket_enable() and mxc_imx8_gasket_disable() disable from the
header (and make those functions static).

>  static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  	.model			= MXC_ISI_IMX8MN,
>  	.num_ports		= 1,
> @@ -289,7 +295,7 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  	.clks			= mxc_imx8mn_clks,
>  	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
>  	.buf_active_reverse	= false,
> -	.has_gasket		= true,
> +	.gasket_ops		= &mxc_imx8_gasket_ops,
>  	.has_36bit_dma		= false,
>  };
>  
> @@ -303,7 +309,7 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.clks			= mxc_imx8mn_clks,
>  	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
>  	.buf_active_reverse	= true,
> -	.has_gasket		= true,
> +	.gasket_ops		= &mxc_imx8_gasket_ops,
>  	.has_36bit_dma		= true,
>  };
>  
> @@ -443,7 +449,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  		return PTR_ERR(isi->regs);
>  	}
>  
> -	if (isi->pdata->has_gasket) {
> +	if (isi->pdata->gasket_ops) {
>  		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
>  							      "fsl,blk-ctrl");
>  		if (IS_ERR(isi->gasket)) {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index e469788a9e6c..4f920d650153 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -12,12 +12,14 @@
>  
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/regmap.h>

This isn't needed here.

>  #include <linux/spinlock.h>
>  #include <linux/types.h>
>  #include <linux/videodev2.h>
>  
>  #include <media/media-device.h>
>  #include <media/media-entity.h>
> +#include <media/mipi-csi2.h>

Not needed either.

>  #include <media/v4l2-async.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-dev.h>
> @@ -59,6 +61,18 @@ struct v4l2_m2m_dev;
>  #define MXC_ISI_M2M			"mxc-isi-m2m"
>  #define MXC_MAX_PLANES			3
>  
> +/* GASKET (i.MX8MN and i.MX8MP only) */
> +#define GASKET_BASE(n)				(0x0060 + (n) * 0x30)
> +
> +#define GASKET_CTRL				0x0000
> +#define GASKET_CTRL_DATA_TYPE(dt)		((dt) << 8)
> +#define GASKET_CTRL_DATA_TYPE_MASK		(0x3f << 8)
> +#define GASKET_CTRL_DUAL_COMP_ENABLE		BIT(1)
> +#define GASKET_CTRL_ENABLE			BIT(0)
> +
> +#define GASKET_HSIZE				0x0004
> +#define GASKET_VSIZE				0x0008
> +

Those macros can be moved to imx8-isi-gasket.c.

>  struct mxc_isi_dev;
>  struct mxc_isi_m2m_ctx;
>  
> @@ -147,6 +161,14 @@ struct mxc_isi_set_thd {
>  	struct mxc_isi_panic_thd panic_set_thd_v;
>  };
>  
> +struct mxc_gasket_ops {
> +	int (*enable)(struct mxc_isi_dev *isi,
> +		      const struct v4l2_mbus_frame_desc *fd,
> +		      const struct v4l2_mbus_framefmt *fmt,
> +		      const unsigned int port);
> +	void (*disable)(struct mxc_isi_dev *isi, const unsigned int port);
> +};
> +
>  enum model {
>  	MXC_ISI_IMX8MN,
>  	MXC_ISI_IMX8MP,
> @@ -159,10 +181,10 @@ struct mxc_isi_plat_data {
>  	unsigned int reg_offset;
>  	const struct mxc_isi_ier_reg  *ier_reg;
>  	const struct mxc_isi_set_thd *set_thd;
> +	const struct mxc_gasket_ops *gasket_ops;
>  	const struct clk_bulk_data *clks;
>  	unsigned int num_clks;
>  	bool buf_active_reverse;
> -	bool has_gasket;
>  	bool has_36bit_dma;
>  };
>  
> @@ -379,6 +401,12 @@ void mxc_isi_channel_set_outbuf(struct mxc_isi_pipe *pipe,
>  u32 mxc_isi_channel_irq_status(struct mxc_isi_pipe *pipe, bool clear);
>  void mxc_isi_channel_irq_clear(struct mxc_isi_pipe *pipe);
>  
> +int mxc_imx8_gasket_enable(struct mxc_isi_dev *isi,
> +			   const struct v4l2_mbus_frame_desc *fd,
> +			   const struct v4l2_mbus_framefmt *fmt,
> +			   const unsigned int port);
> +void mxc_imx8_gasket_disable(struct mxc_isi_dev *isi, const unsigned int port);
> +
>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>  void mxc_isi_debug_init(struct mxc_isi_dev *isi);
>  void mxc_isi_debug_cleanup(struct mxc_isi_dev *isi);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index f7447b2f4d77..d803fda3fdaf 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -25,32 +25,18 @@ static inline struct mxc_isi_crossbar *to_isi_crossbar(struct v4l2_subdev *sd)
>  	return container_of(sd, struct mxc_isi_crossbar, sd);
>  }
>  
> -/* -----------------------------------------------------------------------------
> - * Media block control (i.MX8MN and i.MX8MP only)
> - */
> -#define GASKET_BASE(n)				(0x0060 + (n) * 0x30)
> -
> -#define GASKET_CTRL				0x0000
> -#define GASKET_CTRL_DATA_TYPE(dt)		((dt) << 8)
> -#define GASKET_CTRL_DATA_TYPE_MASK		(0x3f << 8)
> -#define GASKET_CTRL_DUAL_COMP_ENABLE		BIT(1)
> -#define GASKET_CTRL_ENABLE			BIT(0)
> -
> -#define GASKET_HSIZE				0x0004
> -#define GASKET_VSIZE				0x0008
> -
>  static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
>  					  struct v4l2_subdev_state *state,
>  					  struct v4l2_subdev *remote_sd,
>  					  u32 remote_pad, unsigned int port)
>  {
>  	struct mxc_isi_dev *isi = xbar->isi;
> +	const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;
>  	const struct v4l2_mbus_framefmt *fmt;
>  	struct v4l2_mbus_frame_desc fd;
> -	u32 val;
>  	int ret;
>  
> -	if (!isi->pdata->has_gasket)
> +	if (!gasket_ops)
>  		return 0;
>  
>  	/*
> @@ -77,16 +63,14 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
>  	if (!fmt)
>  		return -EINVAL;
>  
> -	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_HSIZE, fmt->width);
> -	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_VSIZE, fmt->height);
> -
> -	val = GASKET_CTRL_DATA_TYPE(fd.entry[0].bus.csi2.dt)
> -	    | GASKET_CTRL_ENABLE;
> -
> -	if (fd.entry[0].bus.csi2.dt == MIPI_CSI2_DT_YUV422_8B)
> -		val |= GASKET_CTRL_DUAL_COMP_ENABLE;
> -
> -	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
> +	if (gasket_ops->enable) {

I would drop this check. Both gasket ops are mandatory, we don't need to
support situations where only enable or disable are provided.

> +		ret = gasket_ops->enable(isi, &fd, fmt, port);
> +		if (ret) {
> +			dev_err(isi->dev,
> +				"failed to enable gasket%d\n", port);
> +			return ret;
> +		}
> +	}
>  
>  	return 0;
>  }
> @@ -95,11 +79,13 @@ static void mxc_isi_crossbar_gasket_disable(struct mxc_isi_crossbar *xbar,
>  					    unsigned int port)
>  {
>  	struct mxc_isi_dev *isi = xbar->isi;
> +	const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;
>  
> -	if (!isi->pdata->has_gasket)
> +	if (!gasket_ops)
>  		return;
>  
> -	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0);
> +	if (gasket_ops->disable)

Same here, you can drop this check.

> +		gasket_ops->disable(isi, port);
>  }
>  
>  /* -----------------------------------------------------------------------------
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> new file mode 100644
> index 000000000000..39f8d0e8b15d
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019-2023 NXP
> + */
> +

You'll need

#include <linux/regmap.h>
#include <media/mipi-csi2.h>

> +#include "imx8-isi-core.h"
> +
> +/* Configure and enable gasket for i.MX8MN and i.MX8P */
> +int mxc_imx8_gasket_enable(struct mxc_isi_dev *isi,
> +			   const struct v4l2_mbus_frame_desc *fd,
> +			   const struct v4l2_mbus_framefmt *fmt,
> +			   const unsigned int port)
> +{
> +	u32 val;
> +
> +	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_HSIZE, fmt->width);
> +	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_VSIZE, fmt->height);
> +
> +	val = GASKET_CTRL_DATA_TYPE(fd->entry[0].bus.csi2.dt);
> +	if (fd->entry[0].bus.csi2.dt == MIPI_CSI2_DT_YUV422_8B)
> +		val |= GASKET_CTRL_DUAL_COMP_ENABLE;
> +
> +	val |= GASKET_CTRL_ENABLE;
> +	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
> +	return 0;
> +}
> +
> +/* Disable gasket for i.MX8MN and i.MX8P */
> +void mxc_imx8_gasket_disable(struct mxc_isi_dev *isi, const unsigned int port)
> +{
> +	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0);
> +}

-- 
Regards,

Laurent Pinchart
