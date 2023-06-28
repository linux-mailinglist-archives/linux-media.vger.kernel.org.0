Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38E05741AA8
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 23:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbjF1VWW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 17:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbjF1VVc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 17:21:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC352974;
        Wed, 28 Jun 2023 14:16:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-160-58-109.reb.o2.cz [85.160.58.109])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 479BF9CA;
        Wed, 28 Jun 2023 23:15:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687986924;
        bh=77nJ0fGw+uL5vfsiYs5CiYEvuL9mewmxbmaSs+0tbKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eh1DRSBDCKWKpcqzu6IQuuQM92tlJ6fc0oz7R68yvzkOcZGv+abHnUo6mcHuW0VUJ
         mR4ivbDAZF65SYewP6KinLW0XZ9GPAH5w9aZG198tQoXHdOaPUksnub6NCwirbeWer
         6/wjYZz3l+BHtic47p5Do/ZDu1GAFgaFml32yejk=
Date:   Thu, 29 Jun 2023 00:16:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     guoniu.zhou@oss.nxp.com
Cc:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        xavier.roumegue@oss.nxp.com, kernel@pengutronix.de,
        jacopo.mondi@ideasonboard.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v4 3/3] media: nxp: imx8-isi: add ISI support for i.MX93
Message-ID: <20230628211604.GB27706@pendragon.ideasonboard.com>
References: <20230628064251.1774296-1-guoniu.zhou@oss.nxp.com>
 <20230628064251.1774296-4-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230628064251.1774296-4-guoniu.zhou@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 28, 2023 at 02:42:51PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> i.MX93 use a different gasket which has different register definition
> compared with i.MX8. Hence implement the gasket callbacks in order to
> add ISI support for i.MX93.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/nxp/imx8-isi/imx8-isi-core.c     | 15 ++++++++++
>  .../platform/nxp/imx8-isi/imx8-isi-core.h     |  2 ++
>  .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 28 +++++++++++++++++++
>  3 files changed, 45 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index f2774325dd61..13a0225de634 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -304,6 +304,20 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.has_36bit_dma		= true,
>  };
>  
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
> +	.gasket_ops		= &mxc_imx93_gasket_ops,
> +	.has_36bit_dma		= false,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Power management
>   */
> @@ -515,6 +529,7 @@ static int mxc_isi_remove(struct platform_device *pdev)
>  static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
>  	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> +	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 87182ebb99f0..ddd3d8ce4000 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -150,6 +150,7 @@ struct mxc_gasket_ops {
>  enum model {
>  	MXC_ISI_IMX8MN,
>  	MXC_ISI_IMX8MP,
> +	MXC_ISI_IMX93,
>  };
>  
>  struct mxc_isi_plat_data {
> @@ -287,6 +288,7 @@ struct mxc_isi_dev {
>  };
>  
>  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
> +extern const struct mxc_gasket_ops mxc_imx93_gasket_ops;
>  
>  int mxc_isi_crossbar_init(struct mxc_isi_dev *isi);
>  void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> index f3758af59db1..96f36a6d8a3c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> @@ -19,6 +19,11 @@
>  #define GASKET_HSIZE				0x0004
>  #define GASKET_VSIZE				0x0008
>  
> +/* dispmix_GPR register (i.MX93 only) */
> +#define DISP_MIX_CAMERA_MUX                     0x30
> +#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
> +#define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
> +
>  /* Configure and enable gasket for i.MX8MN and i.MX8P */
>  static void mxc_imx8_gasket_enable(struct mxc_isi_dev *isi,
>  				   const struct v4l2_mbus_frame_desc *fd,
> @@ -50,3 +55,26 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
>  	.enable = mxc_imx8_gasket_enable,
>  	.disable = mxc_imx8_gasket_disable,
>  };

Following the comment on 2/3, let's add

/* -----------------------------------------------------------------------------
 * i.MX93 gasket
 */

, move the three DISP_MIX_CAMERA_MUX* macros here, and drop the comments
before the enable and disable functions.

> +
> +/* Configure and enable gasket for i.MX93 */
> +static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
> +				    const struct v4l2_mbus_frame_desc *fd,
> +				    const struct v4l2_mbus_framefmt *fmt,
> +				    const unsigned int port)
> +{
> +	u32 val;
> +
> +	val = DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
> +	val |= DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
> +	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
> +}
> +
> +static void mxc_imx93_gasket_disable(struct mxc_isi_dev *isi,
> +				     unsigned int port)
> +{
> +	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, 0);
> +}

Missing blank line.

> +const struct mxc_gasket_ops mxc_imx93_gasket_ops = {
> +	.enable = mxc_imx93_gasket_enable,
> +	.disable = mxc_imx93_gasket_disable,
> +};

-- 
Regards,

Laurent Pinchart
