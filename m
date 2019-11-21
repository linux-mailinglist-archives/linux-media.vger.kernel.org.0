Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52ACB104DBF
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2019 09:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfKUIUj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Nov 2019 03:20:39 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34978 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfKUIUj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Nov 2019 03:20:39 -0500
Received: from pendragon.ideasonboard.com (unknown [124.219.31.93])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D97FDA2B;
        Thu, 21 Nov 2019 09:20:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574324437;
        bh=XnJrDFeVfKlgwTIhqIeZ8iYDIShZX+0oCiZ/fO7XWyg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hZvmjFh4wZPXuwc7EHErOnkUUgp4gbRqOZ5uDKFjRmeHPWFyN7KtqCLOTbz+MSPE/
         ukCFDpALlhwZ2a6BgKZl2FlLBwhjIg52DbQaF4pOT+Mi6eEsPNpHddaPAnlZckTeQ+
         20kV0mxqc78t8JDZtN2mFpxjkQhk+LT8lI+fzNt8=
Date:   Thu, 21 Nov 2019 10:20:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Eugen.Hristev@microchip.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        sakari.ailus@iki.fi
Subject: Re: [PATCH] media: i2c: mt9v032: fix enum mbus codes and frame sizes
Message-ID: <20191121082027.GJ4958@pendragon.ideasonboard.com>
References: <1574322901-7097-1-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1574322901-7097-1-git-send-email-eugen.hristev@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

Thank you for the patch.

On Thu, Nov 21, 2019 at 07:55:24AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> This driver supports both the mt9v032 (color) and the mt9v022 (mono) sensors.
> Depending on which sensor is used, the format from the sensor is different.
> The format.code inside the dev struct holds this information.
> The enum mbus and enum frame sizes need to take into account both type of
> sensors, not just the color one.
> To solve this, use the format.code in these functions instead of the
> hardcoded bayer color format (which is only used for mt9v032).
> 
> Suggested-by: Wenyou Yang <wenyou.yang@microchip.com>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/mt9v032.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
> index 4b9b98c..5bd3ae82 100644
> --- a/drivers/media/i2c/mt9v032.c
> +++ b/drivers/media/i2c/mt9v032.c
> @@ -428,10 +428,12 @@ static int mt9v032_enum_mbus_code(struct v4l2_subdev *subdev,
>  				  struct v4l2_subdev_pad_config *cfg,
>  				  struct v4l2_subdev_mbus_code_enum *code)
>  {
> +	struct mt9v032 *mt9v032 = to_mt9v032(subdev);
> +
>  	if (code->index > 0)
>  		return -EINVAL;
>  
> -	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	code->code = mt9v032->format.code;
>  	return 0;
>  }
>  
> @@ -439,7 +441,11 @@ static int mt9v032_enum_frame_size(struct v4l2_subdev *subdev,
>  				   struct v4l2_subdev_pad_config *cfg,
>  				   struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	if (fse->index >= 3 || fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
> +	struct mt9v032 *mt9v032 = to_mt9v032(subdev);
> +
> +	if (fse->index >= 3)
> +		return -EINVAL;
> +	if (mt9v032->format.code != fse->code)
>  		return -EINVAL;
>  
>  	fse->min_width = MT9V032_WINDOW_WIDTH_DEF / (1 << fse->index);

-- 
Regards,

Laurent Pinchart
