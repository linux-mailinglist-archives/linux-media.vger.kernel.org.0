Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 732AF74B4B4
	for <lists+linux-media@lfdr.de>; Fri,  7 Jul 2023 17:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232377AbjGGPye (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jul 2023 11:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232418AbjGGPy2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jul 2023 11:54:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21EEC11B
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 08:54:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-100-11-nat.elisa-mobile.fi [85.76.100.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 493E656D;
        Fri,  7 Jul 2023 17:53:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688745219;
        bh=7vOB8fQGbNzXP01CnpnOOB3aWweQcZPOmcYTwb8hK9A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rXlU+CWmvJhVJGsivl30uiu0njublgBsiDDmwFcqQa0ReiE76rPZwGiCjwxY/+bvn
         yKmSKlVDLIji1CAm60mrzKjV3JQGUdzurkw6USkD4GP3D+v+g1Tfqk5Xilif/tx6m8
         cdUvsEX4iVjmKNwWcxR504sf29VbBy7eqI8Acz0k=
Date:   Fri, 7 Jul 2023 18:54:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: Re: [PATCH 5/5] media: i2c: imx219: Simplify code handling in s_fmt
Message-ID: <20230707155422.GI15801@pendragon.ideasonboard.com>
References: <20230704103611.149631-1-jacopo.mondi@ideasonboard.com>
 <20230704104057.149837-1-jacopo.mondi@ideasonboard.com>
 <20230704104057.149837-6-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230704104057.149837-6-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Jul 04, 2023 at 12:40:57PM +0200, Jacopo Mondi wrote:
> The imx219_set_pad_format() function adjusts the media bus code provided
> through the v4l2_subdev_format parameter to a media bus code known
> to be supported by the sensor.
> 
> The same exact operation is performed by the imx219_get_format_code()
> function which called by imx219_update_pad_format(), which is in the
> imx219_set_pad_format() call path.
> 
> Remove the duplicated operation and simplify imx219_set_pad_format().
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index c1246bd23b0d..37630e173040 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -754,19 +754,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	int exposure_max, exposure_def, hblank;
>  	unsigned int i;

This variable should be dropped too.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
> -	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
> -		if (imx219_mbus_formats[i] == fmt->format.code)
> -			break;
> -	if (i >= ARRAY_SIZE(imx219_mbus_formats))
> -		i = 0;
> -
>  	mode = v4l2_find_nearest_size(supported_modes,
>  				      ARRAY_SIZE(supported_modes),
>  				      width, height,
>  				      fmt->format.width, fmt->format.height);
>  
> -	imx219_update_pad_format(imx219, mode, &fmt->format,
> -				 imx219_mbus_formats[i]);
> +	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
>  
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		imx219->mode = mode;

-- 
Regards,

Laurent Pinchart
