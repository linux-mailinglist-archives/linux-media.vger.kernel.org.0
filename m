Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA7F763513B
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 08:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235633AbiKWHox (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 02:44:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234911AbiKWHov (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 02:44:51 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A44F72C5
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 23:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669189489; x=1700725489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NW+fKVXCeubcur0Ux8PLknlaq8+NrATdUSAJu0ncIfE=;
  b=GKGiKpm48eU9fnCsEy2wDJqItPAw5oeTWR8XMrlAdlidM7dkmS+FAScq
   xjTzNzFaMtzWaTYvjqTvgmnR5q5v2hCHCyYxKcdS7KnmhE9Jvb1p9FRCj
   TQx3o9PD3kfyihViuW4FrsHW9m5A1Hq3fCSDsfxbz9wOUC4xF8kifkEdr
   SFIiZs/fIOOupDzYdnuNsn0DeNjiRhySuwaLGjfHMlspezKsdkdHI0wXt
   FTyQ2MmkFHO4/aUOCAx8r0k+ZY/LzsBNVvun9ak308GWIvnEp7I/garJo
   zV0f78B9PAHVlc0Ql/GYCngAZ3+u5tDWPxk1zP/rm5LpW3KeDwVqobice
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27525414"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2022 08:44:47 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 23 Nov 2022 08:44:48 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 23 Nov 2022 08:44:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669189487; x=1700725487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NW+fKVXCeubcur0Ux8PLknlaq8+NrATdUSAJu0ncIfE=;
  b=o43wjmCnaflRvWlgfFG2HwMv3XMDKSi+j/QAoUcjM42pnRPpBEhx7Lz9
   2mZcdyW6RLHha1/F9eI1oQ5O3NQBgSVPEVw1AjNEgv0uCzOCOvGWwxkxa
   PClTDIO1uSQSIirWyEX+1YNcMYjvA++QbXpTAUQPaPCieRtovpEEk2KC/
   FV+1r4X69KplVcmSr721XezOiDW1r/KxIQ/ppYzse+dgY2iy1VhWF84A0
   7TQl0PFXhHINX9tiQCxvhNi3+6XJwORREeb/c7DC6Ze2auJotnnnpNFnz
   sPeDaaMjTax8UvsJ7ibIXFZjx5/fzn9iKDUyX9ESy02pkkIJTmrUdyGhw
   g==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27525413"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Nov 2022 08:44:47 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BD189280056;
        Wed, 23 Nov 2022 08:44:47 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 02/15] media: i2c: imx290: Factor out subdev init and cleanup to functions
Date:   Wed, 23 Nov 2022 08:44:45 +0100
Message-ID: <5627879.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221122223250.21233-3-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

thanks for working on this.

Am Dienstag, 22. November 2022, 23:32:37 CET schrieb Laurent Pinchart:
> The probe() function is large. Make it more readable by factoring the
> subdev initialization code out. While at it, rename the error labels as
> the "free_" prefix isn't accurate.
> 
> No functional change intended.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 109 +++++++++++++++++++++----------------
>  1 file changed, 62 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index aae4f51941a1..4dbf218e7a63 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1015,6 +1015,46 @@ static const struct media_entity_operations
> imx290_subdev_entity_ops = { .link_validate = v4l2_subdev_link_validate,
>  };
> 
> +static int imx290_subdev_init(struct imx290 *imx290)
> +{
> +	struct i2c_client *client = to_i2c_client(imx290->dev);
> +	int ret;
> +
> +	/*
> +	 * Initialize the frame format. In particular, imx290->current_mode
> +	 * and imx290->bpp are set to defaults: imx290_calc_pixel_rate() 
call
> +	 * below relies on these fields.
> +	 */
> +	imx290_entity_init_cfg(&imx290->sd, NULL);
> +
> +	ret = imx290_ctrl_init(imx290);
> +	if (ret < 0) {
> +		dev_err(imx290->dev, "Control initialization error %d\n", 
ret);
> +		return ret;
> +	}
> +
> +	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
> +	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	imx290->sd.dev = imx290->dev;
> +	imx290->sd.entity.ops = &imx290_subdev_entity_ops;
> +	imx290->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	imx290->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&imx290->sd.entity, 1, &imx290->pad);
> +	if (ret < 0) {
> +		dev_err(imx290->dev, "Could not register media entity\n");
> +		return ret;

AFAICS in this error path v4l2_ctrl_handler_free is not called later on, 
because imx290_subdev_cleanup is skipped due to goto err_mutex.

Regards,
Alexander

> +	}
> +
> +	return 0;
> +}
> +
> +static void imx290_subdev_cleanup(struct imx290 *imx290)
> +{
> +	media_entity_cleanup(&imx290->sd.entity);
> +	v4l2_ctrl_handler_free(&imx290->ctrls);
> +}
> +
>  /*
> ---------------------------------------------------------------------------
> - * Power management
>   */
> @@ -1148,10 +1188,10 @@ static int imx290_probe(struct i2c_client *client)
>  	fwnode_handle_put(endpoint);
>  	if (ret == -ENXIO) {
>  		dev_err(dev, "Unsupported bus type, should be CSI2\n");
> -		goto free_err;
> +		goto err_endpoint;
>  	} else if (ret) {
>  		dev_err(dev, "Parsing endpoint node failed\n");
> -		goto free_err;
> +		goto err_endpoint;
>  	}
> 
>  	/* Get number of data lanes */
> @@ -1159,7 +1199,7 @@ static int imx290_probe(struct i2c_client *client)
>  	if (imx290->nlanes != 2 && imx290->nlanes != 4) {
>  		dev_err(dev, "Invalid data lanes: %d\n", imx290->nlanes);
>  		ret = -EINVAL;
> -		goto free_err;
> +		goto err_endpoint;
>  	}
> 
>  	dev_dbg(dev, "Using %u data lanes\n", imx290->nlanes);
> @@ -1167,7 +1207,7 @@ static int imx290_probe(struct i2c_client *client)
>  	if (!ep.nr_of_link_frequencies) {
>  		dev_err(dev, "link-frequency property not found in DT\n");
>  		ret = -EINVAL;
> -		goto free_err;
> +		goto err_endpoint;
>  	}
> 
>  	/* Check that link frequences for all the modes are in device tree 
*/
> @@ -1175,7 +1215,7 @@ static int imx290_probe(struct i2c_client *client)
>  	if (fq) {
>  		dev_err(dev, "Link frequency of %lld is not supported\n", 
fq);
>  		ret = -EINVAL;
> -		goto free_err;
> +		goto err_endpoint;
>  	}
> 
>  	/* get system clock (xclk) */
> @@ -1183,14 +1223,14 @@ static int imx290_probe(struct i2c_client *client)
>  	if (IS_ERR(imx290->xclk)) {
>  		dev_err(dev, "Could not get xclk");
>  		ret = PTR_ERR(imx290->xclk);
> -		goto free_err;
> +		goto err_endpoint;
>  	}
> 
>  	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
>  				       &xclk_freq);
>  	if (ret) {
>  		dev_err(dev, "Could not get xclk frequency\n");
> -		goto free_err;
> +		goto err_endpoint;
>  	}
> 
>  	/* external clock must be 37.125 MHz */
> @@ -1198,19 +1238,19 @@ static int imx290_probe(struct i2c_client *client)
>  		dev_err(dev, "External clock frequency %u is not 
supported\n",
>  			xclk_freq);
>  		ret = -EINVAL;
> -		goto free_err;
> +		goto err_endpoint;
>  	}
> 
>  	ret = clk_set_rate(imx290->xclk, xclk_freq);
>  	if (ret) {
>  		dev_err(dev, "Could not set xclk frequency\n");
> -		goto free_err;
> +		goto err_endpoint;
>  	}
> 
>  	ret = imx290_get_regulators(dev, imx290);
>  	if (ret < 0) {
>  		dev_err(dev, "Cannot get regulators\n");
> -		goto free_err;
> +		goto err_endpoint;
>  	}
> 
>  	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset",
> @@ -1218,55 +1258,33 @@ static int imx290_probe(struct i2c_client *client)
>  	if (IS_ERR(imx290->rst_gpio)) {
>  		dev_err(dev, "Cannot get reset gpio\n");
>  		ret = PTR_ERR(imx290->rst_gpio);
> -		goto free_err;
> +		goto err_endpoint;
>  	}
> 
>  	mutex_init(&imx290->lock);
> 
> -	/*
> -	 * Initialize the frame format. In particular, imx290->current_mode
> -	 * and imx290->bpp are set to defaults: imx290_calc_pixel_rate() 
call
> -	 * below relies on these fields.
> -	 */
> -	imx290_entity_init_cfg(&imx290->sd, NULL);
> -
> -	ret = imx290_ctrl_init(imx290);
> -	if (ret < 0) {
> -		dev_err(dev, "Control initialization error %d\n", ret);
> -		goto free_mutex;
> -	}
> -
> -	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
> -	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> -	imx290->sd.dev = &client->dev;
> -	imx290->sd.entity.ops = &imx290_subdev_entity_ops;
> -	imx290->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> -
> -	imx290->pad.flags = MEDIA_PAD_FL_SOURCE;
> -	ret = media_entity_pads_init(&imx290->sd.entity, 1, &imx290->pad);
> -	if (ret < 0) {
> -		dev_err(dev, "Could not register media entity\n");
> -		goto free_ctrl;
> -	}
> +	ret = imx290_subdev_init(imx290);
> +	if (ret)
> +		goto err_mutex;
> 
>  	ret = v4l2_async_register_subdev(&imx290->sd);
>  	if (ret < 0) {
>  		dev_err(dev, "Could not register v4l2 device\n");
> -		goto free_entity;
> +		goto err_subdev;
>  	}
> 
>  	/* Power on the device to match runtime PM state below */
>  	ret = imx290_power_on(dev);
>  	if (ret < 0) {
>  		dev_err(dev, "Could not power on the device\n");
> -		goto free_entity;
> +		goto err_subdev;
>  	}
> 
>  	ret = imx290_read(imx290, IMX290_CHIP_ID, &chip_id);
>  	if (ret) {
>  		dev_err(dev, "Could not read chip ID: %d\n", ret);
>  		imx290_power_off(dev);
> -		goto free_entity;
> +		goto err_subdev;
>  	}
> 
>  	dev_info(dev, "chip ID 0x%04x\n", chip_id);
> @@ -1279,13 +1297,11 @@ static int imx290_probe(struct i2c_client *client)
> 
>  	return 0;
> 
> -free_entity:
> -	media_entity_cleanup(&imx290->sd.entity);
> -free_ctrl:
> -	v4l2_ctrl_handler_free(&imx290->ctrls);
> -free_mutex:
> +err_subdev:
> +	imx290_subdev_cleanup(imx290);
> +err_mutex:
>  	mutex_destroy(&imx290->lock);
> -free_err:
> +err_endpoint:
>  	v4l2_fwnode_endpoint_free(&ep);
> 
>  	return ret;
> @@ -1297,8 +1313,7 @@ static void imx290_remove(struct i2c_client *client)
>  	struct imx290 *imx290 = to_imx290(sd);
> 
>  	v4l2_async_unregister_subdev(sd);
> -	media_entity_cleanup(&sd->entity);
> -	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +	imx290_subdev_cleanup(imx290);
> 
>  	mutex_destroy(&imx290->lock);




