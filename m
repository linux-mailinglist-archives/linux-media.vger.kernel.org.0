Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6691C66B8CE
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 09:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbjAPIJf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 03:09:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbjAPIJV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 03:09:21 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E92412069
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 00:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673856552; x=1705392552;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3YIt9b4dKPs+W2l5HHRqjREJ84ge1sW1QI5/8cmPMZI=;
  b=cK499eXq58wg5KiryyXkZyCvbAE5QCZQVr1/PTVp6nhh4HnEf+TOsxVm
   Dwb+MKajbqvaDZai+UR/7Lcq2asnS2HLEKE3WNQIKpXzm/LWmmUOKWnxf
   aFyilWtPwi1dHLWD0dpJIhkZuiK3+hs/td8t9Dk+JhT+FJ5iha30UB089
   eRxOhmE+FHQ9UUw9muMHYS3NU59nk6mng1TcCc8mlFM9RueZMnT4zsn/j
   vZiq5t5u9EYSYOWZoUW1DQkd+3KAsU9Jt5BmOcnnjS5BF6gHClet2mLAp
   3zp/qz+KmMhZm5QCzojucZGZFzb5aVbDC2auvUs2dXkUCPv+7YF9bZyfs
   w==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28439077"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jan 2023 09:09:07 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 16 Jan 2023 09:09:08 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 16 Jan 2023 09:09:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673856547; x=1705392547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3YIt9b4dKPs+W2l5HHRqjREJ84ge1sW1QI5/8cmPMZI=;
  b=VwpdTa2+pPduftKKFL+LMFuXTHkTWHu1r9DqBzqk5dPnA1MKdKcOh6Cv
   XKFAoS9F6Gxa25rBjeREljdV8xInq6IJ/vecZEWEBatpdsU6+Gu0YxnUB
   lN9XO9xds104PahZfD9tuKRivFLy99iYEC25KUDqq6jLm66qhnsYe1ATP
   O2fcGVm+T12BNN4mQPevmVZ4e23f8WXqtF/VrAN5XRm/06Eyo07dI9mff
   h4V8wFOJoxLmJlhVNazuWZATJREd2Gh+6QlS6Tjp3fM9LH2scWx1uJiW8
   VxXx5+IVXa6aJ+EaLNpYpTYuIJiv7AucqkcolVTma32WqWpVQF2NKszmW
   A==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28439038"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jan 2023 09:09:01 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7A6F6280056;
        Mon, 16 Jan 2023 09:09:01 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 02/17] media: i2c: imx290: Factor out subdev init and cleanup to functions
Date:   Mon, 16 Jan 2023 09:09:02 +0100
Message-ID: <4774526.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230114171802.13878-2-laurent.pinchart@ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com> <20230114171802.13878-1-laurent.pinchart@ideasonboard.com> <20230114171802.13878-2-laurent.pinchart@ideasonboard.com>
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

thanks for the update.

Am Samstag, 14. Januar 2023, 18:17:47 CET schrieb Laurent Pinchart:
> The probe() function is large. Make it more readable by factoring the
> subdev initialization code out. While at it, rename the error labels as
> the "free_" prefix isn't accurate.
> 
> No functional change intended.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Free control handler in imx290_subdev_init() error path

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/media/i2c/imx290.c | 108 +++++++++++++++++++++----------------
>  1 file changed, 62 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index ca2fa57c28fe..5529bd39238f 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1015,6 +1015,47 @@ static const struct media_entity_operations
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
> +		v4l2_ctrl_handler_free(&imx290->ctrls);
> +		return ret;
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
> @@ -1147,10 +1188,10 @@ static int imx290_probe(struct i2c_client *client)
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
> @@ -1158,7 +1199,7 @@ static int imx290_probe(struct i2c_client *client)
>  	if (imx290->nlanes != 2 && imx290->nlanes != 4) {
>  		dev_err(dev, "Invalid data lanes: %d\n", imx290->nlanes);
>  		ret = -EINVAL;
> -		goto free_err;
> +		goto err_endpoint;
>  	}
> 
>  	dev_dbg(dev, "Using %u data lanes\n", imx290->nlanes);
> @@ -1166,7 +1207,7 @@ static int imx290_probe(struct i2c_client *client)
>  	if (!ep.nr_of_link_frequencies) {
>  		dev_err(dev, "link-frequency property not found in DT\n");
>  		ret = -EINVAL;
> -		goto free_err;
> +		goto err_endpoint;
>  	}
> 
>  	/* Check that link frequences for all the modes are in device tree 
*/
> @@ -1174,7 +1215,7 @@ static int imx290_probe(struct i2c_client *client)
>  	if (fq) {
>  		dev_err(dev, "Link frequency of %lld is not supported\n", 
fq);
>  		ret = -EINVAL;
> -		goto free_err;
> +		goto err_endpoint;
>  	}
> 
>  	/* get system clock (xclk) */
> @@ -1182,14 +1223,14 @@ static int imx290_probe(struct i2c_client *client)
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
> @@ -1197,19 +1238,19 @@ static int imx290_probe(struct i2c_client *client)
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
> @@ -1217,48 +1258,26 @@ static int imx290_probe(struct i2c_client *client)
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
>  	pm_runtime_set_active(dev);
> @@ -1269,13 +1288,11 @@ static int imx290_probe(struct i2c_client *client)
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
> @@ -1287,8 +1304,7 @@ static void imx290_remove(struct i2c_client *client)
>  	struct imx290 *imx290 = to_imx290(sd);
> 
>  	v4l2_async_unregister_subdev(sd);
> -	media_entity_cleanup(&sd->entity);
> -	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +	imx290_subdev_cleanup(imx290);
> 
>  	mutex_destroy(&imx290->lock);




