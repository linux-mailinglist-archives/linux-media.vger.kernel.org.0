Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24C1768CC5A
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 02:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjBGBxq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 20:53:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjBGBxp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 20:53:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D953234F5
        for <linux-media@vger.kernel.org>; Mon,  6 Feb 2023 17:53:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0B8B4AF;
        Tue,  7 Feb 2023 02:53:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675734817;
        bh=CAUC1rarni7PFBYnZFY3gRiEGyCtnxSjRi51LSFsqrQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pcimkAchGEmAYTG+aPbUq6IGccfomSBNhMGltjoa03ogv1BZdp5dZtjhWq6P5Mdmy
         dr0VImdb6QwXfdU9ALpD5Oh3zunPCnLLYNuBvoyWuZy1DlhQsVV3t31O5l1aO35pjt
         UU8bBwj2C0/nz50XEAq/Fnx2JkUOvolgsOEfB9Y8=
Date:   Tue, 7 Feb 2023 03:53:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2 13/13] media: i2c: imx290: Add the error code to logs
 in start_streaming
Message-ID: <Y+GvHwqZdWaP0sWc@pendragon.ideasonboard.com>
References: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
 <20230203191811.947697-14-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230203191811.947697-14-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Thank you for the patch.

On Fri, Feb 03, 2023 at 07:18:11PM +0000, Dave Stevenson wrote:
> imx290_start_streaming logs what failed, but not the error
> code from that function. Add it into the log message.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 7167eb1edb9b..f635f1213477 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1007,20 +1007,20 @@ static int imx290_start_streaming(struct imx290 *imx290,
>  	/* Set clock parameters based on mode and xclk */
>  	ret = imx290_set_clock(imx290);
>  	if (ret < 0) {
> -		dev_err(imx290->dev, "Could not set clocks\n");
> +		dev_err(imx290->dev, "Could not set clocks - %d\n", ret);
>  		return ret;
>  	}
>  
>  	/* Set data lane count */
>  	ret = imx290_set_data_lanes(imx290);
>  	if (ret < 0) {
> -		dev_err(imx290->dev, "Could not set data lanes\n");
> +		dev_err(imx290->dev, "Could not set data lanes - %d\n", ret);
>  		return ret;
>  	}
>  
>  	ret = imx290_set_csi_config(imx290);
>  	if (ret < 0) {
> -		dev_err(imx290->dev, "Could not set csi cfg\n");
> +		dev_err(imx290->dev, "Could not set csi cfg - %d\n", ret);
>  		return ret;
>  	}
>  
> @@ -1028,7 +1028,7 @@ static int imx290_start_streaming(struct imx290 *imx290,
>  	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
>  	ret = imx290_setup_format(imx290, format);
>  	if (ret < 0) {
> -		dev_err(imx290->dev, "Could not set frame format\n");
> +		dev_err(imx290->dev, "Could not set frame format - %d\n", ret);
>  		return ret;
>  	}
>  
> @@ -1036,14 +1036,14 @@ static int imx290_start_streaming(struct imx290 *imx290,
>  	ret = imx290_set_register_array(imx290, imx290->current_mode->data,
>  					imx290->current_mode->data_size);
>  	if (ret < 0) {
> -		dev_err(imx290->dev, "Could not set current mode\n");
> +		dev_err(imx290->dev, "Could not set current mode - %d\n", ret);
>  		return ret;
>  	}
>  
>  	/* Apply customized values from user */
>  	ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
>  	if (ret) {
> -		dev_err(imx290->dev, "Could not sync v4l2 controls\n");
> +		dev_err(imx290->dev, "Could not sync v4l2 controls - %d\n", ret);
>  		return ret;
>  	}
>  

-- 
Regards,

Laurent Pinchart
