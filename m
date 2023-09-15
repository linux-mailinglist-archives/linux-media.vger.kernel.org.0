Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 575F57A1AED
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 11:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbjIOJnM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 05:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233117AbjIOJnM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 05:43:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CD12134
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 02:42:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C73A42C6;
        Fri, 15 Sep 2023 11:40:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694770852;
        bh=5YFX9Mu6DEKDmK40o7ro4bQEIExfMKgXoYU1ldMtThI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nyMX+NFrabISe1b9puw+fb7PSAfko1ZDA8sl+2xkY0mDCzmdVHRt2AH3Fen0GrfHm
         AQgeSbkjFWg99r+0HKaccBLMWSOpg/qyBZy9HVP7uecqqTrgW5ufUrPllhfuzzZxqt
         zCttrKcxkVA8f3WqLdcU5NKdvM3y50/bKjTNxw+k=
Date:   Fri, 15 Sep 2023 12:42:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 5/7] media: ov2740: Enable runtime PM before registering
 the async subdev
Message-ID: <20230915094239.GF14641@pendragon.ideasonboard.com>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-6-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230915072809.37886-6-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Sep 15, 2023 at 10:28:07AM +0300, Sakari Ailus wrote:
> Enable runtime PM before registering the async sub-device as the ipu
> bridge may try to resume the device immediately after the async sub-device

I wouldn't mention ipu bridge there, as this driver is not specific to a
particular CSI-2 receiver.

> has been registered. If runtime PM is still disabled, this will fail.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov2740.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 41d4f85470fd..319dc00e47b4 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -1172,6 +1172,12 @@ static int ov2740_probe(struct i2c_client *client)
>  		goto probe_error_v4l2_ctrl_handler_free;
>  	}
>  
> +	/* Set the device's state to active if it's in D0 state. */
> +	if (full_power)
> +		pm_runtime_set_active(&client->dev);

I wonder why we need this in drivers. If ACPI has powered the device on
prior to calling probe(), couldn't it also set the PM runtime state
accordingly ?

> +	pm_runtime_enable(&client->dev);
> +	pm_runtime_idle(&client->dev);
> +

With the commit message fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	ret = v4l2_async_register_subdev_sensor(&ov2740->sd);
>  	if (ret < 0) {
>  		dev_err_probe(dev, ret, "failed to register V4L2 subdev\n");
> @@ -1182,16 +1188,12 @@ static int ov2740_probe(struct i2c_client *client)
>  	if (ret)
>  		dev_warn(&client->dev, "register nvmem failed, ret %d\n", ret);
>  
> -	/* Set the device's state to active if it's in D0 state. */
> -	if (full_power)
> -		pm_runtime_set_active(&client->dev);
> -	pm_runtime_enable(&client->dev);
> -	pm_runtime_idle(&client->dev);
> -
>  	return 0;
>  
>  probe_error_media_entity_cleanup:
>  	media_entity_cleanup(&ov2740->sd.entity);
> +	pm_runtime_disable(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
>  
>  probe_error_v4l2_ctrl_handler_free:
>  	v4l2_ctrl_handler_free(ov2740->sd.ctrl_handler);

-- 
Regards,

Laurent Pinchart
