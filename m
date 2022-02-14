Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 351254B5B15
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 21:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiBNU1J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 15:27:09 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:48174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiBNU1I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 15:27:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE3113F88A
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 12:26:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 314CFFEF;
        Mon, 14 Feb 2022 20:20:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644866447;
        bh=sRzz8zpmSYgZtGxXFX1JA34VsILqA+nvLAW+MgHC/ZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SxlbHR/l5uXmaq94rv9CzaiQh4vgeTcFvcueuhGfExTZm4h8vYEVZvInQJKHlTFV7
         0qvjKGgBUZHQt4wcnTiHcaLgTl4+OpIJYQZtY0s4ebBANCHaucvhjsKAGMDCM2qAtQ
         nEz11Wt2ddIP1JWF15iKm3Ky0Sn1xhX+3NH2m/u0=
Date:   Mon, 14 Feb 2022 21:20:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        alexander.stein@ew.tq-group.com, dorota.czaplejewicz@puri.sm,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] staging: media: imx: Define per-SoC info
Message-ID: <YgqriZJsq9faa6gQ@pendragon.ideasonboard.com>
References: <20220214184318.409208-1-jacopo@jmondi.org>
 <20220214184318.409208-5-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220214184318.409208-5-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Feb 14, 2022 at 07:43:14PM +0100, Jacopo Mondi wrote:
> Define the imx-media-info structure which contains CSI configuration
> parameter that depend on the SoC version the peripheral is integrated
> in.
> 
> Replace the existing 'model' field with the newly defined structure.
> 
> Only define the SoC id and the supported pixel sampling modes for the
> moment.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/staging/media/imx/imx-media.h      | 44 ++++++++++++++++++++++
>  drivers/staging/media/imx/imx7-media-csi.c | 44 ++++++++++++++--------
>  2 files changed, 73 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> index f263fc3adbb9..1b0b660413cb 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -18,6 +18,16 @@
>  #define IMX_MEDIA_DEF_PIX_WIDTH		640
>  #define IMX_MEDIA_DEF_PIX_HEIGHT	480
>  
> +/*
> + * Enumeration of the SoC models the peripheral is integrated in.
> + */
> +enum soc_id {
> +	IMX6UL,
> +	IMX7,
> +	IMX8MM,
> +	IMX8MQ,

Those names are too generic.

> +};
> +
>  /*
>   * Enumeration of the IPU internal sub-devices
>   */
> @@ -141,10 +151,44 @@ struct imx_media_pad_vdev {
>  	struct list_head list;
>  };
>  
> +/*
> + * enum sample_mode_id - Define the CSI Rx queue sample size
> + *
> + * The pixel sampling mode defines the possible sampling methods from the
> + * CSI Rx queue to the next processing block of the capture pipeline.
> + *
> + * The supported methods depends on the SoC model and on synthesis time
> + * configurations.
> + *
> + * @MODE_SINGLE: Single pixel mode sampling
> + * @MODE_DUAL: Double pixel mode sampling
> + * @MODE_QUAD: Quad pixel mode sampling
> + */
> +enum sample_mode_id {
> +	MODE_SINGLE = BIT(0),
> +	MODE_DUAL = BIT(1),
> +	MODE_QUAD = BIT(2),

Here too.

> +};

Let's limit this to the imx7-media-csi driver, it's unrelated to the
i.MX6 IPUv3 and should not be part of common helpers. It doesn't seem
like any subsequent patch in this series use the sample mode or the
soc_id in common helpers, so it should hopefully not be a bit issue.

I would also like to see a comment somewhere (in this patch or one of
the subsequent ones) that explains in more details how the CSIS and CSI
bridge are connected, and how various bits affect data signal routing
between the two. I can help if necessary.

> +/*
> + * Information and configurations dependent on the SoC the peripheral is
> + * integrated in.
> + *
> + * @soc_id: The SoC identifier. See &enum soc_id.
> + * @sample_modes: Mask of supported pixel modes. See &enum sample_mode_id.
> + */
> +struct imx_media_info {
> +	enum soc_id soc_id;
> +	u8 sample_modes;
> +};
> +
>  struct imx_media_dev {
>  	struct media_device md;
>  	struct v4l2_device  v4l2_dev;
>  
> +	/* Per-model information. */
> +	const struct imx_media_info *info;
> +
>  	/* the pipeline object */
>  	struct media_pipeline pipe;
>  
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 59100e409709..112096774961 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -159,12 +159,6 @@
>  #define CSI_CSICR18			0x48
>  #define CSI_CSICR19			0x4c
>  
> -enum imx_csi_model {
> -	IMX7_CSI_IMX7 = 0,
> -	IMX7_CSI_IMX8MQ,
> -	IMX7_CSI_IMX8MM,
> -};

I think you can keep this instead of soc_id.

> -
>  struct imx7_csi {
>  	struct device *dev;
>  	struct v4l2_subdev sd;
> @@ -200,8 +194,6 @@ struct imx7_csi {
>  	bool is_csi2;
>  
>  	struct completion last_eof_completion;
> -
> -	enum imx_csi_model model;
>  };
>  
>  static struct imx7_csi *
> @@ -562,6 +554,8 @@ static void imx7_csi_baseaddr_switch_on_second_frame(struct imx7_csi *csi)
>  
>  static void imx7_csi_enable(struct imx7_csi *csi)
>  {
> +	struct imx_media_dev *imxmd = csi->imxmd;
> +
>  	/* Clear the Rx FIFO and reflash the DMA controller. */
>  	imx7_csi_rx_fifo_clear(csi);
>  	imx7_csi_dma_reflash(csi);
> @@ -576,7 +570,7 @@ static void imx7_csi_enable(struct imx7_csi *csi)
>  	imx7_csi_dmareq_rff_enable(csi);
>  	imx7_csi_hw_enable(csi);
>  
> -	if (csi->model == IMX7_CSI_IMX8MQ)
> +	if (imxmd->info->soc_id == IMX8MQ)
>  		imx7_csi_baseaddr_switch_on_second_frame(csi);
>  }
>  
> @@ -1181,8 +1175,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
>  	if (IS_ERR(csi->regbase))
>  		return PTR_ERR(csi->regbase);
>  
> -	csi->model = (enum imx_csi_model)(uintptr_t)of_device_get_match_data(&pdev->dev);
> -
>  	spin_lock_init(&csi->irqlock);
>  	mutex_init(&csi->lock);
>  
> @@ -1202,6 +1194,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
>  	}
>  	platform_set_drvdata(pdev, &csi->sd);
>  
> +	imxmd->info = of_device_get_match_data(dev);
> +
>  	ret = imx_media_of_add_csi(imxmd, node);
>  	if (ret < 0 && ret != -ENODEV && ret != -EEXIST)
>  		goto cleanup;
> @@ -1276,11 +1270,31 @@ static int imx7_csi_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct imx_media_info imx8mq_info = {
> +	.soc_id = IMX8MQ,
> +	.sample_modes = MODE_SINGLE,
> +};
> +
> +static const struct imx_media_info imx8mm_info = {
> +	.soc_id = IMX8MM,
> +	.sample_modes = MODE_SINGLE | MODE_DUAL,
> +};
> +
> +static const struct imx_media_info imx7_info = {
> +	.soc_id = IMX7,
> +	.sample_modes = MODE_SINGLE,
> +};
> +
> +static const struct imx_media_info imx6ul_info = {
> +	.soc_id = IMX6UL,
> +	.sample_modes = MODE_SINGLE,
> +};
> +
>  static const struct of_device_id imx7_csi_of_match[] = {
> -	{ .compatible = "fsl,imx8mq-csi", .data = (void *)IMX7_CSI_IMX8MQ },
> -	{ .compatible = "fsl,imx8mm-csi", .data = (void *)IMX7_CSI_IMX8MM },
> -	{ .compatible = "fsl,imx7-csi", .data = (void *)IMX7_CSI_IMX7 },
> -	{ .compatible = "fsl,imx6ul-csi", .data = (void *)IMX7_CSI_IMX7 },
> +	{ .compatible = "fsl,imx8mq-csi", .data = &imx8mq_info },
> +	{ .compatible = "fsl,imx8mm-csi", .data = &imx8mm_info },
> +	{ .compatible = "fsl,imx7-csi", .data = &imx7_info },
> +	{ .compatible = "fsl,imx6ul-csi", .data = &imx6ul_info },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, imx7_csi_of_match);

-- 
Regards,

Laurent Pinchart
