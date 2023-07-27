Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 494E0765E61
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 23:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbjG0Vsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 17:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbjG0Vsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 17:48:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1AAC2681;
        Thu, 27 Jul 2023 14:48:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E712B2E4;
        Thu, 27 Jul 2023 23:47:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690494446;
        bh=MIM1aVXhiYNGHr2ZNOgdS2MrWF+J72bYzQyWpKjlGz0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Riyu1AFFUr9KykCSUqxXlmpH5EtDP9qGwVedUqaRAhTEc2mv0vQLG+UQGfbYoVh7K
         eOptOS2tA9PXv9SkLVqQq1fefqXWXsbYvBnv/dpRqYpwk/BXLSsIpoSZJt6f5RN2q+
         sn/7CRI343yWQn+xagCvdl5uZr/v8dBWfTjhepyM=
Date:   Fri, 28 Jul 2023 00:48:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     guoniu.zhou@oss.nxp.com
Cc:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        xavier.roumegue@oss.nxp.com, kernel@pengutronix.de,
        jacopo.mondi@ideasonboard.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v5 3/3] media: nxp: imx8-isi: add ISI support for i.MX93
Message-ID: <20230727214831.GA28824@pendragon.ideasonboard.com>
References: <20230629013621.2388121-1-guoniu.zhou@oss.nxp.com>
 <20230629013621.2388121-4-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230629013621.2388121-4-guoniu.zhou@oss.nxp.com>
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

On Thu, Jun 29, 2023 at 09:36:21AM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> i.MX93 use a different gasket which has different register definition

s/use/uses/
s/definition/definitions/

> compared with i.MX8. Hence implement the gasket callbacks in order to
> add ISI support for i.MX93.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/nxp/imx8-isi/imx8-isi-core.c     | 15 ++++++++++
>  .../platform/nxp/imx8-isi/imx8-isi-core.h     |  2 ++
>  .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 30 +++++++++++++++++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 5165f8960c2c..27bd18b7ee65 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -307,6 +307,20 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
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
> @@ -518,6 +532,7 @@ static int mxc_isi_remove(struct platform_device *pdev)
>  static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
>  	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> +	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 78ca047d93d1..2810ebe9b5f7 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -158,6 +158,7 @@ struct mxc_gasket_ops {
>  enum model {
>  	MXC_ISI_IMX8MN,
>  	MXC_ISI_IMX8MP,
> +	MXC_ISI_IMX93,
>  };
>  
>  struct mxc_isi_plat_data {
> @@ -295,6 +296,7 @@ struct mxc_isi_dev {
>  };
>  
>  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
> +extern const struct mxc_gasket_ops mxc_imx93_gasket_ops;
>  
>  int mxc_isi_crossbar_init(struct mxc_isi_dev *isi);
>  void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> index 1d632dc60699..50ac1d3a2b6f 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> @@ -53,3 +53,33 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
>  	.enable = mxc_imx8_gasket_enable,
>  	.disable = mxc_imx8_gasket_disable,
>  };
> +
> +/* -----------------------------------------------------------------------------
> + * i.MX93 gasket
> + **/

Extra star here too.

> +
> +#define DISP_MIX_CAMERA_MUX                     0x30
> +#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
> +#define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)

Let's add a blank line here.

With those small issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'll make the changes locally and include the series in my next pull
request.

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
> +
> +const struct mxc_gasket_ops mxc_imx93_gasket_ops = {
> +	.enable = mxc_imx93_gasket_enable,
> +	.disable = mxc_imx93_gasket_disable,
> +};

-- 
Regards,

Laurent Pinchart
