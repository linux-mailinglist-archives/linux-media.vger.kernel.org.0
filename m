Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D28507A4F8D
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 18:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjIRQp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 12:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjIRQpi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 12:45:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF7535BB
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 08:59:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 934E91288;
        Mon, 18 Sep 2023 15:25:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695043537;
        bh=iVTF3YYBQxtep2muBWlISvn6dVioDkLLNN99TCS6cyM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W4WqLt9Fp8b73Ff22Zr0LqNJ2eeriQ+JguSvd3WR2lPeVlK9VfJ6srqxAwuWKHWMZ
         sSHNM8GCIcfca/ZTSeJNEnLL++9pkAzGaf+5ZhOwug+WQE1eGTLZSf77zrtUCmJHDf
         sVUYmOlIMdUH4lgYFK+HPywUc7ih6IW115PnU7bk=
Date:   Mon, 18 Sep 2023 16:27:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v2 07/12] media: ov2740: Enable runtime PM before
 registering the async subdev
Message-ID: <20230918132725.GE28874@pendragon.ideasonboard.com>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
 <20230918125138.90002-8-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230918125138.90002-8-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Sep 18, 2023 at 03:51:33PM +0300, Sakari Ailus wrote:
> Enable runtime PM before registering the async subdev as the driver UAPI
> may become accessible immediately after the registration. Runtime PM needs
> to be enabled by that time.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
> +	pm_runtime_enable(&client->dev);
> +	pm_runtime_idle(&client->dev);
> +
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
