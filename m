Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C15917A494E
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 14:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241776AbjIRMKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 08:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241985AbjIRMKh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 08:10:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00765B5
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 05:09:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA2661257;
        Mon, 18 Sep 2023 14:08:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695038900;
        bh=IltnZATzxXQ/ueIRSOCaqLmbxIoY3W7fMl4Eph1Mito=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UdLAJb5VPkRPzg0c4Ga7eH+JcmZoDDV0I6/k/n6Au7RryLEEkUj8NCy8BILzY/9zT
         XbnviAOLa0FTjgKJFGMnynnA0V28S1y80RPPfeJUbvVM5WXHoU1TDlYJLkTlm7jlRS
         aKIo/upmFhVeTDUfqowW/AKUKOZR1V1MoTOB+53I=
Date:   Mon, 18 Sep 2023 15:10:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH] media: i2c: imx415: Replace streaming flag with runtime
 PM check
Message-ID: <20230918121007.GA9789@pendragon.ideasonboard.com>
References: <20230914174600.850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230914174600.850-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 14, 2023 at 08:46:00PM +0300, Laurent Pinchart wrote:
> The streaming flag in the driver private structure is used for the sole
> purpose of gating register writes when setting a V4L2 control. This is
> better handled by checking if the sensor is powered up using the runtime
> PM API. Do so and drop the streaming flag.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx415.c | 32 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 3f00172df3cc..346f623c1331 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -353,8 +353,6 @@ struct imx415 {
>  
>  	const struct imx415_clk_params *clk_params;
>  
> -	bool streaming;
> -
>  	struct v4l2_subdev subdev;
>  	struct media_pad pad;
>  
> @@ -542,8 +540,9 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
>  	struct v4l2_subdev_state *state;
>  	unsigned int vmax;
>  	unsigned int flip;
> +	int ret;
>  
> -	if (!sensor->streaming)
> +	if (!pm_runtime_get_if_in_use(sensor->dev))
>  		return 0;
>  
>  	state = v4l2_subdev_get_locked_active_state(&sensor->subdev);
> @@ -554,24 +553,33 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
>  		/* clamp the exposure value to VMAX. */
>  		vmax = format->height + sensor->vblank->cur.val;
>  		ctrl->val = min_t(int, ctrl->val, vmax);
> -		return imx415_write(sensor, IMX415_SHR0, vmax - ctrl->val);
> +		ret = imx415_write(sensor, IMX415_SHR0, vmax - ctrl->val);
> +		break;
>  
>  	case V4L2_CID_ANALOGUE_GAIN:
>  		/* analogue gain in 0.3 dB step size */
>  		return imx415_write(sensor, IMX415_GAIN_PCG_0, ctrl->val);

This should be

		ret = imx415_write(sensor, IMX415_GAIN_PCG_0, ctrl->val);

Sakari, would you like a v2, or would you prefer fixing this locally ?

> +		break;
>  
>  	case V4L2_CID_HFLIP:
>  	case V4L2_CID_VFLIP:
>  		flip = (sensor->hflip->val << IMX415_HREVERSE_SHIFT) |
>  		       (sensor->vflip->val << IMX415_VREVERSE_SHIFT);
> -		return imx415_write(sensor, IMX415_REVERSE, flip);
> +		ret = imx415_write(sensor, IMX415_REVERSE, flip);
> +		break;
>  
>  	case V4L2_CID_TEST_PATTERN:
> -		return imx415_set_testpattern(sensor, ctrl->val);
> +		ret = imx415_set_testpattern(sensor, ctrl->val);
> +		break;
>  
>  	default:
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		break;
>  	}
> +
> +	pm_runtime_put(sensor->dev);
> +
> +	return ret;
>  }
>  
>  static const struct v4l2_ctrl_ops imx415_ctrl_ops = {
> @@ -766,8 +774,6 @@ static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
>  		pm_runtime_mark_last_busy(sensor->dev);
>  		pm_runtime_put_autosuspend(sensor->dev);
>  
> -		sensor->streaming = false;
> -
>  		goto unlock;
>  	}
>  
> @@ -779,13 +785,6 @@ static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (ret)
>  		goto err_pm;
>  
> -	/*
> -	 * Set streaming to true to ensure __v4l2_ctrl_handler_setup() will set
> -	 * the controls. The flag is reset to false further down if an error
> -	 * occurs.
> -	 */
> -	sensor->streaming = true;
> -
>  	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls);
>  	if (ret < 0)
>  		goto err_pm;
> @@ -807,7 +806,6 @@ static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
>  	 * likely has no other chance to recover.
>  	 */
>  	pm_runtime_put_sync(sensor->dev);
> -	sensor->streaming = false;
>  
>  	goto unlock;
>  }
> 
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d

-- 
Regards,

Laurent Pinchart
