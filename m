Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53EB95F6378
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 11:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbiJFJS5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 05:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbiJFJSz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 05:18:55 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7624098350
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 02:18:54 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 422A81C0003;
        Thu,  6 Oct 2022 09:18:52 +0000 (UTC)
Date:   Thu, 6 Oct 2022 11:18:50 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 05/16] media: i2c: ov9281: Support more than 1 mode.
Message-ID: <20221006091850.22lvxgibemj4m4ru@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-6-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-6-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Wed, Oct 05, 2022 at 04:27:58PM +0100, Dave Stevenson wrote:
> The driver currently has multiple assumptions that there is
> only one supported mode.
>
> Convert supported_mode to an array, and fix up all references
> to correctly look at that array.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 44 ++++++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 798ff8ba50bd..f7823d584522 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -262,20 +262,24 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
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
> +	{
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
> +#define OV9282_NUM_MODES ARRAY_SIZE(supported_modes)
> +
>  /**
>   * to_ov9282() - ov9282 V4L2 sub-device to ov9282 device.
>   * @subdev: pointer to ov9282 V4L2 sub-device
> @@ -536,15 +540,15 @@ static int ov9282_enum_frame_size(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_frame_size_enum *fsize)
>  {
> -	if (fsize->index > 0)
> +	if (fsize->index >= OV9282_NUM_MODES)
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
> @@ -619,7 +623,11 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>
>  	mutex_lock(&ov9282->mutex);
>
> -	mode = &supported_mode;
> +	mode = v4l2_find_nearest_size(supported_modes,
> +				      OV9282_NUM_MODES,
> +				      width, height,
> +				      fmt->format.width,
> +				      fmt->format.height);
>  	ov9282_fill_pad_format(ov9282, mode, fmt);
>
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> @@ -652,7 +660,7 @@ static int ov9282_init_pad_cfg(struct v4l2_subdev *sd,
>  	struct v4l2_subdev_format fmt = { 0 };
>
>  	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> -	ov9282_fill_pad_format(ov9282, &supported_mode, &fmt);
> +	ov9282_fill_pad_format(ov9282, &supported_modes[0], &fmt);

When new modes gets added, it might be worth defining
#define OV9286_DEFAULT_MODE     0

To make sure the active and the try formats are initialized with the
same value

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

>
>  	return ov9282_set_pad_format(sd, sd_state, &fmt);
>  }
> @@ -1081,8 +1089,8 @@ static int ov9282_probe(struct i2c_client *client)
>  		goto error_power_off;
>  	}
>
> -	/* Set default mode to max resolution */
> -	ov9282->cur_mode = &supported_mode;
> +	/* Set default mode to first mode */
> +	ov9282->cur_mode = &supported_modes[0];
>  	ov9282->vblank = ov9282->cur_mode->vblank;
>
>  	ret = ov9282_init_controls(ov9282);
> --
> 2.34.1
>
