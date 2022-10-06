Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 752CB5F63BF
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 11:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbiJFJit (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 05:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbiJFJif (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 05:38:35 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4718993785
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 02:38:32 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id C4A56FF811;
        Thu,  6 Oct 2022 09:38:29 +0000 (UTC)
Date:   Thu, 6 Oct 2022 11:38:28 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 11/16] media: i2c: ov9282: Add HFLIP and VFLIP support
Message-ID: <20221006093828.ib6s5jw2blapmywi@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-12-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-12-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Wed, Oct 05, 2022 at 04:28:04PM +0100, Dave Stevenson wrote:
> Adds support for V4L2_CID_HFLIP and V4L2_CID_VFLIP to allow
> flipping the image.
>
> The driver previously enabled H & V flips in the register table,
> therefore the controls default to the same settings to avoid
> changing the behaviour.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 52 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 49 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 5ddef6e2b3ac..12cbe401fd78 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -46,6 +46,10 @@
>  /* Group hold register */
>  #define OV9282_REG_HOLD		0x3308
>
> +#define OV9282_REG_TIMING_FORMAT_1	0x3820
> +#define OV9282_REG_TIMING_FORMAT_2	0x3821
> +#define OV9282_FLIP_BIT			BIT(2)
> +

Can we remove them from the list of common registers or do those
registers contains other settings which might get lost ?

>  #define OV9282_REG_MIPI_CTRL00	0x4800
>  #define OV9282_GATED_CLOCK	BIT(5)
>
> @@ -440,6 +444,38 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>  	return ret;
>  }
>
> +static int ov9282_set_ctrl_hflip(struct ov9282 *ov9282, int value)
> +{
> +	u32 current_val;
> +	int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
> +				  &current_val);
> +	if (!ret) {
> +		if (value)
> +			current_val |= OV9282_FLIP_BIT;
> +		else
> +			current_val &= ~OV9282_FLIP_BIT;
> +		return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
> +					current_val);
> +	}
> +	return ret;

Or simply

        int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
                        &current_val);
        if (ret)
                return ret;

        if (value)
                current_val |= OV9282_FLIP_BIT;
        else
                current_val &= ~OV9282_FLIP_BIT;

        return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
                                current_val);


> +}
> +
> +static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
> +{
> +	u32 current_val;
> +	int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
> +				  &current_val);
> +	if (!ret) {
> +		if (value)
> +			current_val |= OV9282_FLIP_BIT;
> +		else
> +			current_val &= ~OV9282_FLIP_BIT;
> +		return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
> +					current_val);
> +	}
> +	return ret;
> +}
> +
>  /**
>   * ov9282_set_ctrl() - Set subdevice control
>   * @ctrl: pointer to v4l2_ctrl structure
> @@ -484,7 +520,6 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>
>  	switch (ctrl->id) {
>  	case V4L2_CID_EXPOSURE:
> -

Unrelated and possibly part of the previous patch ?

>  		exposure = ctrl->val;
>  		analog_gain = ov9282->again_ctrl->val;
>
> @@ -493,12 +528,17 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>
>  		ret = ov9282_update_exp_gain(ov9282, exposure, analog_gain);
>
> -

same here

>  		break;
>  	case V4L2_CID_VBLANK:
>  		lpfr = ov9282->vblank + ov9282->cur_mode->height;
>  		ret = ov9282_write_reg(ov9282, OV9282_REG_LPFR, 2, lpfr);
>  		break;
> +	case V4L2_CID_HFLIP:
> +		ret = ov9282_set_ctrl_hflip(ov9282, ctrl->val);
> +		break;
> +	case V4L2_CID_VFLIP:
> +		ret = ov9282_set_ctrl_vflip(ov9282, ctrl->val);
> +		break;
>  	default:
>  		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
>  		ret = -EINVAL;
> @@ -996,7 +1036,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	u32 lpfr;
>  	int ret;
>
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
>  	if (ret)
>  		return ret;
>
> @@ -1030,6 +1070,12 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  						mode->vblank_max,
>  						1, mode->vblank);
>
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_VFLIP,
> +			  0, 1, 1, 1);
> +
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_HFLIP,
> +			  0, 1, 1, 1);

By default 0x3820 and 0x3821 are initialized to 0x3c and 0x84 which
have BIT(2) set, so the image is "flipped" by default to compensate
the sensor mounting orientation. For users though the image appears
"not flipped", and if they have to set the control to 0 to flip it it
would feel a bit weird. Should the logic be inverted ? ie setting the
FLIP controls value to 1 results in BIT(2) being cleared ?

> +
>  	/* Read only controls */
>  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_PIXEL_RATE,
>  			  OV9282_PIXEL_RATE, OV9282_PIXEL_RATE, 1,
> --
> 2.34.1
>
