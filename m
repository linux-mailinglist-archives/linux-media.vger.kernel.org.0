Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD3A73DB1A
	for <lists+linux-media@lfdr.de>; Mon, 26 Jun 2023 11:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjFZJTR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jun 2023 05:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjFZJSv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jun 2023 05:18:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3CE710D7;
        Mon, 26 Jun 2023 02:16:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (unknown [193.85.242.110])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6061A38;
        Mon, 26 Jun 2023 11:14:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687770892;
        bh=nDCVRb7Dc7bjjjSC3mC7wThtsrkvZ+kI1I3VHmpKVao=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ky6O4wfeutk2U6U/tJH3BkJMF8FhYRaeSjcUb3CFqSwTuBOSRbkzLGvpsIVABOQ8K
         XRBDoNHtDogl6QYblMfbFKRp4iKjCBwOoazXhuvKshSMgjWXobq7xQDXf37MorHVBS
         FSEL5wcI0tAQZ0ET/rcdXIh+jdgLezMfejbLr6TQ=
Date:   Mon, 26 Jun 2023 12:15:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     guoniu.zhou@oss.nxp.com
Cc:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        xavier.roumegue@oss.nxp.com, kernel@pengutronix.de,
        jacopo.mondi@ideasonboard.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2 2/2] media: nxp: imx-isi: add ISI support for i.MX93
Message-ID: <20230626091530.GA8867@pendragon.ideasonboard.com>
References: <20230626032735.49500-1-guoniu.zhou@oss.nxp.com>
 <20230626032735.49500-3-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230626032735.49500-3-guoniu.zhou@oss.nxp.com>
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

On Mon, Jun 26, 2023 at 11:27:35AM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Abstract gasket operation and driver should implement them for SoC
> which support gasket.
> 
> i.MX93 use a different gasket which has different register definition
> compared with i.MX8. Hence implement the gasket callbacks in order to
> add ISI support for i.MX93.

This patch does multiple things, and should as such be split in multiple
patches:

- One patch to move gasket configuration to an ops structure
- One patch to add i.MX93 support

For the first patch, I'd recommend moving the gasket operations to a new
imx8-isi-gasket.c file.

> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
>  .../platform/nxp/imx8-isi/imx8-isi-core.c     | 110 ++++++++++++++++++
>  .../platform/nxp/imx8-isi/imx8-isi-core.h     |  33 ++++++
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  51 ++++----
>  3 files changed, 169 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 253e77189b69..d37145fb7f14 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -14,6 +14,7 @@
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
> +#include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
> @@ -279,6 +280,54 @@ static const struct clk_bulk_data mxc_imx8mn_clks[] = {
>  	{ .id = "apb" },
>  };
>  
> +static int mxc_imx8_gasket_config(struct mxc_isi_dev *isi,
> +				  const struct v4l2_mbus_frame_desc *fd,
> +				  const struct v4l2_mbus_framefmt *fmt,
> +				  const unsigned int port)
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
> +	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
> +
> +	dev_dbg(isi->dev, "w/h=(%d, %d), data type=0x%x\n",
> +			  fmt->width, fmt->height,
> +			  fd->entry[0].bus.csi2.dt);

I think this debug message can be dropped.

> +
> +	return 0;
> +}
> +
> +static int mxc_imx8_gasket_enable(struct mxc_isi_dev *isi,
> +				  const unsigned int port)
> +{
> +	u32 val;
> +
> +	regmap_read(isi->gasket, GASKET_BASE(port), &val);
> +	val |= GASKET_CTRL_ENABLE;
> +
> +	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);

regmap has regmap_set_bits().

> +
> +	return 0;
> +}
> +
> +static void mxc_imx8_gasket_disable(struct mxc_isi_dev *isi,
> +				    const unsigned int port)
> +{
> +	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0);
> +}
> +
> +static const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
> +	.config = mxc_imx8_gasket_config,
> +	.enable = mxc_imx8_gasket_enable,
> +	.disable = mxc_imx8_gasket_disable,
> +};
> +
>  static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  	.model			= MXC_ISI_IMX8MN,
>  	.num_ports		= 1,
> @@ -290,6 +339,7 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
>  	.buf_active_reverse	= false,
>  	.has_gasket		= true,
> +	.gasket_ops		= &mxc_imx8_gasket_ops,
>  	.has_36bit_dma		= false,
>  };
>  
> @@ -304,6 +354,65 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
>  	.buf_active_reverse	= true,
>  	.has_gasket		= true,
> +	.gasket_ops		= &mxc_imx8_gasket_ops,
> +	.has_36bit_dma		= true,
> +};
> +
> +static int mxc_imx93_gasket_config(struct mxc_isi_dev *isi,
> +				   const struct v4l2_mbus_frame_desc *fd,
> +				   const struct v4l2_mbus_framefmt *fmt,
> +				   const unsigned int port)
> +{
> +	u32 val;
> +
> +	val = DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
> +	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
> +
> +	dev_dbg(isi->dev, "data type=0x%x\n", fd->entry[0].bus.csi2.dt);

Same here.

> +
> +	return 0;
> +}
> +
> +static int mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
> +				   const unsigned int port)
> +{
> +	u32 val;
> +
> +	regmap_read(isi->gasket, DISP_MIX_CAMERA_MUX, &val);
> +	val |= DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
> +	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
> +
> +	return 0;
> +}
> +
> +static void mxc_imx93_gasket_disable(struct mxc_isi_dev *isi,
> +				     unsigned int port)
> +{
> +	u32 val;
> +
> +	regmap_read(isi->gasket, DISP_MIX_CAMERA_MUX, &val);
> +	val &= ~DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
> +	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);

Can you simplify this to

	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, 0);

?

> +}
> +
> +static const struct mxc_gasket_ops mxc_imx93_gasket_ops = {
> +	.config = mxc_imx93_gasket_config,
> +	.enable = mxc_imx93_gasket_enable,
> +	.disable = mxc_imx93_gasket_disable,
> +};
> +
> +static const struct mxc_isi_plat_data mxc_imx93_data = {
> +	.model			= MXC_ISI_IMX93,
> +	.num_ports		= 1,
> +	.num_channels		= 1,
> +	.reg_offset		= 0,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.clks			= mxc_imx8mn_clks,
> +	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> +	.buf_active_reverse	= true,
> +	.has_gasket		= true,
> +	.gasket_ops		= &mxc_imx93_gasket_ops,
>  	.has_36bit_dma		= true,

The i.MX93 reference manual doesn't list the extended address registers.
Is that an error in the documentation, or should .has_36bit_dma be false
?

>  };
>  
> @@ -518,6 +627,7 @@ static int mxc_isi_remove(struct platform_device *pdev)
>  static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
>  	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> +	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index e469788a9e6c..c425edb6fbea 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -18,6 +18,7 @@
>  
>  #include <media/media-device.h>
>  #include <media/media-entity.h>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-async.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-dev.h>
> @@ -59,6 +60,27 @@ struct v4l2_m2m_dev;
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
> +/* dispmix_GPR register (i.MX93 only) */
> +#define DISP_MIX_CAMERA_MUX                     0x30
> +#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
> +#define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
> +
> +#define DISP_MIX_CSI_REG                        0x48
> +#define DISP_MIX_CSI_REG_CFGFREQRANGE(x)        ((x)  & 0x3f)
> +#define DISP_MIX_CSI_REG_HSFREQRANGE(x)         (((x) & 0x7f) << 8)

This isn't used.

> +
>  struct mxc_isi_dev;
>  struct mxc_isi_m2m_ctx;
>  
> @@ -147,9 +169,19 @@ struct mxc_isi_set_thd {
>  	struct mxc_isi_panic_thd panic_set_thd_v;
>  };
>  
> +struct mxc_gasket_ops {
> +	int (*enable)(struct mxc_isi_dev *isi, const unsigned int port);
> +	int (*config)(struct mxc_isi_dev *isi,
> +		      const struct v4l2_mbus_frame_desc *fd,
> +		      const struct v4l2_mbus_framefmt *fmt,
> +		      const unsigned int port);
> +	void (*disable)(struct mxc_isi_dev *isi, const unsigned int port);
> +};
> +
>  enum model {
>  	MXC_ISI_IMX8MN,
>  	MXC_ISI_IMX8MP,
> +	MXC_ISI_IMX93,
>  };
>  
>  struct mxc_isi_plat_data {
> @@ -160,6 +192,7 @@ struct mxc_isi_plat_data {
>  	const struct mxc_isi_ier_reg  *ier_reg;
>  	const struct mxc_isi_set_thd *set_thd;
>  	const struct clk_bulk_data *clks;
> +	const struct mxc_gasket_ops *gasket_ops;
>  	unsigned int num_clks;
>  	bool buf_active_reverse;
>  	bool has_gasket;

The has_gasket field can be dropped, you can now check if gasket_ops it
NULL instead.

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index f7447b2f4d77..855b31e3dade 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -25,20 +25,6 @@ static inline struct mxc_isi_crossbar *to_isi_crossbar(struct v4l2_subdev *sd)
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
> @@ -46,13 +32,16 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
>  {
>  	struct mxc_isi_dev *isi = xbar->isi;
>  	const struct v4l2_mbus_framefmt *fmt;
> +	const struct mxc_gasket_ops *gasket_ops = NULL;
>  	struct v4l2_mbus_frame_desc fd;
> -	u32 val;
>  	int ret;
>  
>  	if (!isi->pdata->has_gasket)
>  		return 0;
>  
> +	if (isi->pdata->gasket_ops)
> +		gasket_ops = isi->pdata->gasket_ops;
> +
>  	/*
>  	 * Configure and enable the gasket with the frame size and CSI-2 data
>  	 * type. For YUV422 8-bit, enable dual component mode unconditionally,
> @@ -77,16 +66,23 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
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
> +	if (gasket_ops && gasket_ops->config) {
> +		ret = gasket_ops->config(isi, &fd, fmt, port);
> +		if (ret) {
> +			dev_err(isi->dev,
> +				"failed to configure gasket%d\n", port);
> +			return ret;
> +		}
> +	}
>  
> -	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
> +	if (gasket_ops && gasket_ops->enable) {
> +		ret = gasket_ops->enable(isi, port);
> +		if (ret) {
> +			dev_err(isi->dev,
> +				"failed to enable gasket%d\n", port);
> +			return ret;
> +		}
> +	}

As you always call config and enable one after the other, is there a
reason to have two operations, instead of just one enable operation as
done today ?

>  
>  	return 0;
>  }
> @@ -95,11 +91,16 @@ static void mxc_isi_crossbar_gasket_disable(struct mxc_isi_crossbar *xbar,
>  					    unsigned int port)
>  {
>  	struct mxc_isi_dev *isi = xbar->isi;
> +	const struct mxc_gasket_ops *gasket_ops = NULL;
>  
>  	if (!isi->pdata->has_gasket)
>  		return;
>  
> -	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0);
> +	if (isi->pdata->gasket_ops)
> +		gasket_ops = isi->pdata->gasket_ops;

This can be written as

	const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;

when declaraing the variable.

> +
> +	if (gasket_ops && gasket_ops->disable)
> +		gasket_ops->disable(isi, port);
>  }
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart
