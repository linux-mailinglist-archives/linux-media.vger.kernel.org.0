Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C51733A8FF
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 01:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhCOAEy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Mar 2021 20:04:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55854 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhCOAEd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Mar 2021 20:04:33 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D559B908;
        Mon, 15 Mar 2021 01:04:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615766672;
        bh=zszDiqP6yC0I/5GQ2+4eppTy/tDQpXG5n9aXotdLhxQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PetKLJCpTn20fwCc5iDvmF33jjA/avbUnXeB9eBtzRJK1ArmBFO0fgsPtU/7Tj1x5
         fVUYgDkuIh/lx8GFpQNW6GdOYtVCToZwpMgA41UbA64j5zpNB7RPhYib1WnJ7aShj8
         Xfwn/pKr+qIc+PHRuU3NNCXDjpe130Efuh5HluiI=
Date:   Mon, 15 Mar 2021 02:03:56 +0200
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
Subject: Re: [PATCH v2 2/2] media: i2c: imx219: Balance runtime PM use-count
Message-ID: <YE6kbFmIrk2nyQv8@pendragon.ideasonboard.com>
References: <20210311095205.8095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210311095205.8095-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210311095205.8095-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Thu, Mar 11, 2021 at 09:52:05AM +0000, Lad Prabhakar wrote:
> Move incrementing/decrementing runtime PM count to
> imx219_start_streaming()/imx219_stop_streaming() functions respectively.
> 
> This fixes an issue of unbalanced runtime PM count in resume callback
> error path where streaming is stopped and runtime PM count is left
> unbalanced.
> 
> Fixes: 1283b3b8f82b9 ("media: i2c: Add driver for Sony IMX219 sensor")
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx219.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 82756cbfbaac..49ba39418360 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1035,37 +1035,47 @@ static int imx219_start_streaming(struct imx219 *imx219)
>  	const struct imx219_reg_list *reg_list;
>  	int ret;
>  
> +	ret = pm_runtime_get_sync(&client->dev);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(&client->dev);
> +		return ret;
> +	}
> +
>  	/* Apply default values of current mode */
>  	reg_list = &imx219->mode->reg_list;
>  	ret = imx219_write_regs(imx219, reg_list->regs, reg_list->num_of_regs);
>  	if (ret) {
>  		dev_err(&client->dev, "%s failed to set mode\n", __func__);
> -		return ret;
> +		goto err_rpm_put;
>  	}
>  
>  	ret = imx219_set_framefmt(imx219);
>  	if (ret) {
>  		dev_err(&client->dev, "%s failed to set frame format: %d\n",
>  			__func__, ret);
> -		return ret;
> +		goto err_rpm_put;
>  	}
>  
>  	/* Apply customized values from user */
>  	ret =  __v4l2_ctrl_handler_setup(imx219->sd.ctrl_handler);
>  	if (ret)
> -		return ret;
> +		goto err_rpm_put;
>  
>  	/* set stream on register */
>  	ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
>  			       IMX219_REG_VALUE_08BIT, IMX219_MODE_STREAMING);
>  	if (ret)
> -		return ret;
> +		goto err_rpm_put;
>  
>  	/* vflip and hflip cannot change during streaming */
>  	__v4l2_ctrl_grab(imx219->vflip, true);
>  	__v4l2_ctrl_grab(imx219->hflip, true);
>  
>  	return 0;
> +
> +err_rpm_put:
> +	pm_runtime_put(&client->dev);
> +	return ret;
>  }
>  
>  static void imx219_stop_streaming(struct imx219 *imx219)
> @@ -1081,12 +1091,13 @@ static void imx219_stop_streaming(struct imx219 *imx219)
>  
>  	__v4l2_ctrl_grab(imx219->vflip, false);
>  	__v4l2_ctrl_grab(imx219->hflip, false);
> +
> +	pm_runtime_put(&client->dev);
>  }
>  
>  static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct imx219 *imx219 = to_imx219(sd);
> -	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	int ret = 0;
>  
>  	mutex_lock(&imx219->mutex);
> @@ -1096,22 +1107,15 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
>  	}
>  
>  	if (enable) {
> -		ret = pm_runtime_get_sync(&client->dev);
> -		if (ret < 0) {
> -			pm_runtime_put_noidle(&client->dev);
> -			goto err_unlock;
> -		}
> -
>  		/*
>  		 * Apply default & customized values
>  		 * and then start streaming.
>  		 */
>  		ret = imx219_start_streaming(imx219);
>  		if (ret)
> -			goto err_rpm_put;
> +			goto err_unlock;
>  	} else {
>  		imx219_stop_streaming(imx219);
> -		pm_runtime_put(&client->dev);
>  	}
>  
>  	imx219->streaming = enable;
> @@ -1120,8 +1124,6 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
>  
>  	return ret;
>  
> -err_rpm_put:
> -	pm_runtime_put(&client->dev);
>  err_unlock:
>  	mutex_unlock(&imx219->mutex);
>  

-- 
Regards,

Laurent Pinchart
