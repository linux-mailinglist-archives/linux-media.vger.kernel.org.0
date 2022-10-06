Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF6335F63A8
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 11:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbiJFJa2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 05:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbiJFJaP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 05:30:15 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90CF12614
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 02:29:56 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 70D2B20005;
        Thu,  6 Oct 2022 09:29:50 +0000 (UTC)
Date:   Thu, 6 Oct 2022 11:29:48 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 10/16] media: i2c: ov9282: Action CID_VBLANK when set.
Message-ID: <20221006092948.aosyb6weieoevlbq@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-11-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-11-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Wed, Oct 05, 2022 at 04:28:03PM +0100, Dave Stevenson wrote:
> Programming the sensor with TIMING_VTS (aka LPFR) was done
> when triggered by a change in exposure or gain, but not
> when V4L2_CID_VBLANK was changed. Dynamic frame rate
> changes could therefore not be achieved.
>
> Separate out programming TIMING_VTS so that it is triggered
> by set_ctrl(V4L2_CID_VBLANK)
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 183283d191b1..5ddef6e2b3ac 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -419,22 +419,15 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>   */
>  static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>  {
> -	u32 lpfr;
>  	int ret;
>
> -	lpfr = ov9282->vblank + ov9282->cur_mode->height;
> -
> -	dev_dbg(ov9282->dev, "Set exp %u, analog gain %u, lpfr %u",
> -		exposure, gain, lpfr);
> +	dev_dbg(ov9282->dev, "Set exp %u, analog gain %u",
> +		exposure, gain);
>
>  	ret = ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 1);
>  	if (ret)
>  		return ret;
>
> -	ret = ov9282_write_reg(ov9282, OV9282_REG_LPFR, 2, lpfr);
> -	if (ret)
> -		goto error_release_group_hold;
> -
>  	ret = ov9282_write_reg(ov9282, OV9282_REG_EXPOSURE, 3, exposure << 4);
>  	if (ret)
>  		goto error_release_group_hold;
> @@ -465,6 +458,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>  		container_of(ctrl->handler, struct ov9282, ctrl_handler);
>  	u32 analog_gain;
>  	u32 exposure;
> +	u32 lpfr;

Only a nit about the fact lpfr is a u32 while you're writing 2 bytes.
I guess it's safe as we likely don't risk any overflow

>  	int ret;
>
>  	switch (ctrl->id) {
> @@ -482,10 +476,14 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>  					       OV9282_EXPOSURE_OFFSET,
>  					       1, OV9282_EXPOSURE_DEFAULT);
>  		break;
> +	}
> +
> +	/* Set controls only if sensor is in power on state */
> +	if (!pm_runtime_get_if_in_use(ov9282->dev))
> +		return 0;
> +
> +	switch (ctrl->id) {
>  	case V4L2_CID_EXPOSURE:
> -		/* Set controls only if sensor is in power on state */
> -		if (!pm_runtime_get_if_in_use(ov9282->dev))
> -			return 0;
>
>  		exposure = ctrl->val;
>  		analog_gain = ov9282->again_ctrl->val;
> @@ -495,14 +493,19 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>
>  		ret = ov9282_update_exp_gain(ov9282, exposure, analog_gain);
>
> -		pm_runtime_put(ov9282->dev);
>
Double empty line
With this fixed:

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j
> +		break;
> +	case V4L2_CID_VBLANK:
> +		lpfr = ov9282->vblank + ov9282->cur_mode->height;
> +		ret = ov9282_write_reg(ov9282, OV9282_REG_LPFR, 2, lpfr);
>  		break;
>  	default:
>  		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
>  		ret = -EINVAL;
>  	}
>
> +	pm_runtime_put(ov9282->dev);
> +
>  	return ret;
>  }
>
> --
> 2.34.1
>
