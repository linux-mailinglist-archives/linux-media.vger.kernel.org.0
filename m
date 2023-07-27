Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE926765E58
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 23:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbjG0Vly (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 17:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbjG0Vlw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 17:41:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D62211C;
        Thu, 27 Jul 2023 14:41:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 815622E4;
        Thu, 27 Jul 2023 23:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690494049;
        bh=hO7M58yWunaaw/sSzfGn3ueuFEF+JFjoOtS7Y/xPjS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pGubWVPvd19nL30AGcrK3q+cNDF9nuU5BtFtpwQbEOs+Vucdz1Hq+EOwoIu+XpcXZ
         niBtKUxQbltTRoopK+66xkPvmZ+xUSC85Ly5CfBV3rNQnuPcHIqev4oxw6T9EC0aq+
         GzR/3CvMrRxKmPg0tEpBvKMYneslCTIQsg0PFUgg=
Date:   Fri, 28 Jul 2023 00:41:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     guoniu.zhou@oss.nxp.com
Cc:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        xavier.roumegue@oss.nxp.com, kernel@pengutronix.de,
        jacopo.mondi@ideasonboard.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v5 2/3] media: nxp: imx8-isi: move i.MX8 gasket
 configuration to an ops structure
Message-ID: <20230727214154.GO25174@pendragon.ideasonboard.com>
References: <20230629013621.2388121-1-guoniu.zhou@oss.nxp.com>
 <20230629013621.2388121-3-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230629013621.2388121-3-guoniu.zhou@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guoniu,

Thank you for the patch.

On Thu, Jun 29, 2023 at 09:36:20AM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> The i.MX93 includes an ISI instance compatible with the imx8-isi
> driver, but with a different gasket. To prepare for this, make the
> gasket configuration modular by moving the code to an ops structure.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/Makefile  |  4 +-
>  .../platform/nxp/imx8-isi/imx8-isi-core.c     |  6 +-
>  .../platform/nxp/imx8-isi/imx8-isi-core.h     | 12 +++-
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 36 ++----------
>  .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 55 +++++++++++++++++++
>  5 files changed, 77 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/Makefile b/drivers/media/platform/nxp/imx8-isi/Makefile
> index 9bff9297686d..4713c4e8b64b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/Makefile
> +++ b/drivers/media/platform/nxp/imx8-isi/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -imx8-isi-y := imx8-isi-core.o imx8-isi-crossbar.o imx8-isi-hw.o \
> -	imx8-isi-pipe.o imx8-isi-video.o
> +imx8-isi-y := imx8-isi-core.o imx8-isi-crossbar.o imx8-isi-gasket.o \
> +	imx8-isi-hw.o imx8-isi-pipe.o imx8-isi-video.o
>  imx8-isi-$(CONFIG_DEBUG_FS) += imx8-isi-debug.o
>  imx8-isi-$(CONFIG_VIDEO_IMX8_ISI_M2M) += imx8-isi-m2m.o
>  
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 253e77189b69..5165f8960c2c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -289,7 +289,7 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  	.clks			= mxc_imx8mn_clks,
>  	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
>  	.buf_active_reverse	= false,
> -	.has_gasket		= true,
> +	.gasket_ops		= &mxc_imx8_gasket_ops,
>  	.has_36bit_dma		= false,
>  };
>  
> @@ -303,7 +303,7 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.clks			= mxc_imx8mn_clks,
>  	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
>  	.buf_active_reverse	= true,
> -	.has_gasket		= true,
> +	.gasket_ops		= &mxc_imx8_gasket_ops,
>  	.has_36bit_dma		= true,
>  };
>  
> @@ -443,7 +443,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  		return PTR_ERR(isi->regs);
>  	}
>  
> -	if (isi->pdata->has_gasket) {
> +	if (isi->pdata->gasket_ops) {
>  		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
>  							      "fsl,blk-ctrl");
>  		if (IS_ERR(isi->gasket)) {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index e469788a9e6c..78ca047d93d1 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -147,6 +147,14 @@ struct mxc_isi_set_thd {
>  	struct mxc_isi_panic_thd panic_set_thd_v;
>  };
>  
> +struct mxc_gasket_ops {
> +	void (*enable)(struct mxc_isi_dev *isi,
> +		       const struct v4l2_mbus_frame_desc *fd,
> +		       const struct v4l2_mbus_framefmt *fmt,
> +		       const unsigned int port);
> +	void (*disable)(struct mxc_isi_dev *isi, const unsigned int port);
> +};
> +
>  enum model {
>  	MXC_ISI_IMX8MN,
>  	MXC_ISI_IMX8MP,
> @@ -159,10 +167,10 @@ struct mxc_isi_plat_data {
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
> @@ -286,6 +294,8 @@ struct mxc_isi_dev {
>  	struct dentry			*debugfs_root;
>  };
>  
> +extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
> +
>  int mxc_isi_crossbar_init(struct mxc_isi_dev *isi);
>  void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar);
>  int mxc_isi_crossbar_register(struct mxc_isi_crossbar *xbar);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index f7447b2f4d77..c6a658ef0c62 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -15,7 +15,6 @@
>  #include <linux/types.h>
>  
>  #include <media/media-entity.h>
> -#include <media/mipi-csi2.h>
>  #include <media/v4l2-subdev.h>
>  
>  #include "imx8-isi-core.h"
> @@ -25,32 +24,18 @@ static inline struct mxc_isi_crossbar *to_isi_crossbar(struct v4l2_subdev *sd)
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
> @@ -77,17 +62,7 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
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
> -
> +	gasket_ops->enable(isi, &fd, fmt, port);
>  	return 0;
>  }
>  
> @@ -95,11 +70,12 @@ static void mxc_isi_crossbar_gasket_disable(struct mxc_isi_crossbar *xbar,
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
> +	gasket_ops->disable(isi, port);
>  }
>  
>  /* -----------------------------------------------------------------------------
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> new file mode 100644
> index 000000000000..1d632dc60699
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019-2023 NXP
> + */
> +
> +#include <linux/regmap.h>
> +
> +#include <media/mipi-csi2.h>
> +
> +#include "imx8-isi-core.h"
> +
> +/* -----------------------------------------------------------------------------
> + * i.MX8MN and i.MX8MP gasket
> + **/

There's an extra star here, it should be

  */

> +
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
> +static void mxc_imx8_gasket_enable(struct mxc_isi_dev *isi,
> +				   const struct v4l2_mbus_frame_desc *fd,
> +				   const struct v4l2_mbus_framefmt *fmt,
> +				   const unsigned int port)
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
> +}
> +
> +static void mxc_imx8_gasket_disable(struct mxc_isi_dev *isi,
> +				    const unsigned int port)
> +{
> +	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0);
> +}
> +
> +/* Gasket operations for i.MX8MN and i.MX8MP */

This comment can be dropped too, the section header above is enough.
With these minor issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

There's no need to resubmit the series just for this, I can make those
modifications locally if no other changes are needed.

> +const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
> +	.enable = mxc_imx8_gasket_enable,
> +	.disable = mxc_imx8_gasket_disable,
> +};

-- 
Regards,

Laurent Pinchart
