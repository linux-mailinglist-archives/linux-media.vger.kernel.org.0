Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3691733A8FB
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 01:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhCOADr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Mar 2021 20:03:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55808 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhCOADT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Mar 2021 20:03:19 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 425AA99;
        Mon, 15 Mar 2021 01:03:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615766597;
        bh=b7zijCEZaTb39LySgKb+Ephkc7B/jQXC+RinLskpGtI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=csv7USR2MZFxFx9P8DJapkv+qtyTzioTWCu6m3nztL4xPjFeS6Fs88GgisC2sT9xK
         8WjwtrNLYB36W8OymCGduDTQt2T84DOZT2YxbOhyq4XuxQXLpLNu9/0xfmTN6OF1v2
         cG7DZc9SZxPiywRldcS2jWwDkwyFR4g0+Xv+WgU8=
Date:   Mon, 15 Mar 2021 02:02:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pavel Machek <pavel@denx.de>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] media: i2c: imx219: Move out locking/unlocking of
 vflip and hflip controls from imx219_set_stream
Message-ID: <YE6kIVV71qKlUAan@pendragon.ideasonboard.com>
References: <20210311095205.8095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210311095205.8095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210311095205.8095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Thu, Mar 11, 2021 at 09:52:04AM +0000, Lad Prabhakar wrote:
> Move out locking/unlocking of vflip and hflip controls from
> imx219_set_stream() to the imx219_start_streaming()/
> imx219_stop_streaming() respectively.
> 
> This fixes an issue in resume callback error path where streaming is
> stopped and the controls are left in locked state.
> 
> Fixes: 1283b3b8f82b9 ("media: i2c: Add driver for Sony IMX219 sensor")
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx219.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 6e3382b85a90..82756cbfbaac 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1056,8 +1056,16 @@ static int imx219_start_streaming(struct imx219 *imx219)
>  		return ret;
>  
>  	/* set stream on register */
> -	return imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
> -				IMX219_REG_VALUE_08BIT, IMX219_MODE_STREAMING);
> +	ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
> +			       IMX219_REG_VALUE_08BIT, IMX219_MODE_STREAMING);
> +	if (ret)
> +		return ret;
> +
> +	/* vflip and hflip cannot change during streaming */
> +	__v4l2_ctrl_grab(imx219->vflip, true);
> +	__v4l2_ctrl_grab(imx219->hflip, true);
> +
> +	return 0;
>  }
>  
>  static void imx219_stop_streaming(struct imx219 *imx219)
> @@ -1070,6 +1078,9 @@ static void imx219_stop_streaming(struct imx219 *imx219)
>  			       IMX219_REG_VALUE_08BIT, IMX219_MODE_STANDBY);
>  	if (ret)
>  		dev_err(&client->dev, "%s failed to set stream\n", __func__);
> +
> +	__v4l2_ctrl_grab(imx219->vflip, false);
> +	__v4l2_ctrl_grab(imx219->hflip, false);
>  }
>  
>  static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
> @@ -1105,10 +1116,6 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
>  
>  	imx219->streaming = enable;
>  
> -	/* vflip and hflip cannot change during streaming */
> -	__v4l2_ctrl_grab(imx219->vflip, enable);
> -	__v4l2_ctrl_grab(imx219->hflip, enable);
> -
>  	mutex_unlock(&imx219->mutex);
>  
>  	return ret;

-- 
Regards,

Laurent Pinchart
