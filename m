Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5B8861336B
	for <lists+linux-media@lfdr.de>; Mon, 31 Oct 2022 11:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbiJaKSG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Oct 2022 06:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiJaKSE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Oct 2022 06:18:04 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A4BD131
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 03:18:02 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 0396B40006;
        Mon, 31 Oct 2022 10:17:58 +0000 (UTC)
Date:   Mon, 31 Oct 2022 11:17:57 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi
Subject: Re: [PATCH v2 05/16] media: i2c: ov9281: Support more than 1 mode.
Message-ID: <20221031101757.vzscokp7fywgjrg2@uno.localdomain>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
 <20221028160902.2696973-6-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221028160902.2696973-6-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Fri, Oct 28, 2022 at 05:08:51PM +0100, Dave Stevenson wrote:
> The driver currently has multiple assumptions that there is
> only one supported mode.
>
> Convert supported_mode to an array, and fix up all references
> to correctly look at that array.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 46 +++++++++++++++++++++++---------------
>  1 file changed, 28 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 123aa20951b7..1524189cf3e5 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -217,6 +217,10 @@ struct ov9282_reg_list common_regs_list = {
>  	.regs = common_regs,
>  };
>
> +#define MODE_1280_720		0
> +
> +#define DEFAULT_MODE		MODE_1280_720
> +

I don't mind this considering there will be multiple modes

>  /* Sensor mode registers */
>  static const struct ov9282_reg mode_1280x720_regs[] = {
>  	{0x3778, 0x00},
> @@ -252,17 +256,19 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
>  };
>
>  /* Supported sensor mode configurations */
> -static const struct ov9282_mode supported_mode = {
> -	.width = 1280,
> -	.height = 720,
> -	.hblank = 250,
> -	.vblank = 1022,
> -	.vblank_min = 151,
> -	.vblank_max = 51540,
> -	.link_freq_idx = 0,
> -	.reg_list = {
> -		.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
> -		.regs = mode_1280x720_regs,
> +static const struct ov9282_mode supported_modes[] = {
> +	[MODE_1280_720] = {
> +		.width = 1280,
> +		.height = 720,
> +		.hblank = 250,
> +		.vblank = 1022,
> +		.vblank_min = 151,
> +		.vblank_max = 51540,
> +		.link_freq_idx = 0,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
> +			.regs = mode_1280x720_regs,
> +		},
>  	},
>  };
>
> @@ -526,15 +532,15 @@ static int ov9282_enum_frame_size(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_frame_size_enum *fsize)
>  {
> -	if (fsize->index > 0)
> +	if (fsize->index >= ARRAY_SIZE(supported_modes))
>  		return -EINVAL;
>
>  	if (fsize->code != MEDIA_BUS_FMT_Y10_1X10)
>  		return -EINVAL;
>
> -	fsize->min_width = supported_mode.width;
> +	fsize->min_width = supported_modes[fsize->index].width;
>  	fsize->max_width = fsize->min_width;
> -	fsize->min_height = supported_mode.height;
> +	fsize->min_height = supported_modes[fsize->index].height;
>  	fsize->max_height = fsize->min_height;
>
>  	return 0;
> @@ -609,7 +615,11 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>
>  	mutex_lock(&ov9282->mutex);
>
> -	mode = &supported_mode;
> +	mode = v4l2_find_nearest_size(supported_modes,
> +				      ARRAY_SIZE(supported_modes),
> +				      width, height,
> +				      fmt->format.width,
> +				      fmt->format.height);
>  	ov9282_fill_pad_format(ov9282, mode, fmt);
>
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> @@ -642,7 +652,7 @@ static int ov9282_init_pad_cfg(struct v4l2_subdev *sd,
>  	struct v4l2_subdev_format fmt = { 0 };
>
>  	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> -	ov9282_fill_pad_format(ov9282, &supported_mode, &fmt);
> +	ov9282_fill_pad_format(ov9282, &supported_modes[DEFAULT_MODE], &fmt);
>
>  	return ov9282_set_pad_format(sd, sd_state, &fmt);
>  }
> @@ -1043,8 +1053,8 @@ static int ov9282_probe(struct i2c_client *client)
>  		goto error_power_off;
>  	}
>
> -	/* Set default mode to max resolution */
> -	ov9282->cur_mode = &supported_mode;
> +	/* Set default mode to first mode */
> +	ov9282->cur_mode = &supported_modes[DEFAULT_MODE];

Looks good
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>


>  	ov9282->vblank = ov9282->cur_mode->vblank;
>
>  	ret = ov9282_init_controls(ov9282);
> --
> 2.34.1
>
