Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E10996133D6
	for <lists+linux-media@lfdr.de>; Mon, 31 Oct 2022 11:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbiJaKlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Oct 2022 06:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiJaKlY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Oct 2022 06:41:24 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3FCDFD8
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 03:41:22 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id BFB03FF804;
        Mon, 31 Oct 2022 10:41:18 +0000 (UTC)
Date:   Mon, 31 Oct 2022 11:41:16 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi
Subject: Re: [PATCH v2 11/16] media: i2c: ov9282: Add HFLIP and VFLIP support
Message-ID: <20221031104116.ntg647ppz7ijew6n@uno.localdomain>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
 <20221028160902.2696973-12-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221028160902.2696973-12-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 28, 2022 at 05:08:57PM +0100, Dave Stevenson wrote:
> Adds support for V4L2_CID_HFLIP and V4L2_CID_VFLIP to allow
> flipping the image.
>
> The driver previously enabled H & V flips in the register table,
> therefore the controls default to the same settings to avoid
> changing the behaviour.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 52 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index e964461ff1d3..cfb6e72d8931 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -45,6 +45,10 @@
>  /* Group hold register */
>  #define OV9282_REG_HOLD		0x3308
>
> +#define OV9282_REG_TIMING_FORMAT_1	0x3820
> +#define OV9282_REG_TIMING_FORMAT_2	0x3821
> +#define OV9282_FLIP_BIT			BIT(2)
> +
>  #define OV9282_REG_MIPI_CTRL00	0x4800
>  #define OV9282_GATED_CLOCK	BIT(5)
>
> @@ -438,6 +442,40 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>  	return ret;
>  }
>
> +static int ov9282_set_ctrl_hflip(struct ov9282 *ov9282, int value)
> +{
> +	u32 current_val;
> +	int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
> +				  &current_val);
> +	if (ret)
> +		return ret;
> +
> +	if (value)
> +		current_val |= OV9282_FLIP_BIT;
> +	else
> +		current_val &= ~OV9282_FLIP_BIT;
> +
> +	return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
> +				current_val);
> +}
> +
> +static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
> +{
> +	u32 current_val;
> +	int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
> +				  &current_val);
> +	if (ret)
> +		return ret;
> +
> +	if (value)
> +		current_val |= OV9282_FLIP_BIT;
> +	else
> +		current_val &= ~OV9282_FLIP_BIT;
> +
> +	return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
> +				current_val);
> +}
> +
>  /**
>   * ov9282_set_ctrl() - Set subdevice control
>   * @ctrl: pointer to v4l2_ctrl structure
> @@ -494,6 +532,12 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
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
> @@ -963,7 +1007,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	u32 lpfr;
>  	int ret;
>
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
>  	if (ret)
>  		return ret;
>
> @@ -997,6 +1041,12 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  						mode->vblank_max,
>  						1, mode->vblank);
>
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_VFLIP,
> +			  0, 1, 1, 1);
> +
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_HFLIP,
> +			  0, 1, 1, 1);
> +

I guess, based on the reply on the previous version, that flip by
default is correct in this case

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

>  	/* Read only controls */
>  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_PIXEL_RATE,
>  			  OV9282_PIXEL_RATE, OV9282_PIXEL_RATE, 1,
> --
> 2.34.1
>
