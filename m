Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA37A67B2A9
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 13:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235000AbjAYMjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 07:39:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234493AbjAYMjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 07:39:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758131B1
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 04:39:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D35526E0;
        Wed, 25 Jan 2023 13:39:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674650369;
        bh=5zE2775Y8GV6vVQ2EclCX7O8JOHVpS2TjkH3DICMI0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vWCfNbqYCQDSyorG3GkiJTYEFdylGM/YxuNjQrEecYWWNlLHCAu2TVJcAkpr0Vu5w
         6jn/P0RlZOkR/bM1sjOSUKW18BZSZ4VX0TJYEyGo5lXNU+LKmpgY8VDfJOGFgJOhOE
         rUotBpQOvEDI8/2NOVhLr6qNJnPH6SPG8uS4sHK4=
Date:   Wed, 25 Jan 2023 14:39:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Robert Mader <robert.mader@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 3/3] media: imx258: Remove mandatory 180 degrees rotation
Message-ID: <Y9Ei/VDAGTxR3+EF@pendragon.ideasonboard.com>
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
 <20230117100603.51631-4-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117100603.51631-4-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Jan 17, 2023 at 11:06:03AM +0100, Jacopo Mondi wrote:
> The "rotation" fwnode device property is intended to allow specify the

s/specify/specifying/

> sensor's physical mounting rotation, so that it can be exposed through
> the read-only V4L2_CID_CAMERA_SENSOR_ROTATION control and applications
> can decide how to compensate for that.
> 
> The imx258 driver has read-only VFLIP and HFLIP enabled, resulting in
> a 180 degrees image rotation being produced by the sensor. But this
> doesn't imply that the physical mounting rotation should match the
> driver's implementation.
> 
> Now that the driver registers V4L2_CID_CAMERA_SENSOR_ROTATION
> and V4L2_CID_HFLIP/VFLIP correctly, userspace has all the required
> information to handle the rotation correctly, hence it is not necessary
> to require the 'rotation' property to be fixed to 180 degrees in DTS.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx258.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 2e0a4ea76589..85d73b186111 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -1299,14 +1299,6 @@ static int imx258_probe(struct i2c_client *client)
>  		return -EINVAL;
>  	}
>  
> -	/*
> -	 * Check that the device is mounted upside down. The driver only
> -	 * supports a single pixel order right now.
> -	 */
> -	ret = device_property_read_u32(&client->dev, "rotation", &val);
> -	if (ret || val != 180)
> -		return -EINVAL;
> -
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
>  

-- 
Regards,

Laurent Pinchart
