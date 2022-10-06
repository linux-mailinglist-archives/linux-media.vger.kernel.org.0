Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04EB15F63C7
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 11:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbiJFJns (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 05:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbiJFJnq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 05:43:46 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574F18E0DC
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 02:43:45 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 06D30100010;
        Thu,  6 Oct 2022 09:43:42 +0000 (UTC)
Date:   Thu, 6 Oct 2022 11:43:41 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 13/16] media: i2c: ov9282: Add selection API calls for
 cropping info
Message-ID: <20221006094341.hz3lvo5vqrf3voas@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-14-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-14-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_PDS_OTHER_BAD_TLD autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Wed, Oct 05, 2022 at 04:28:06PM +0100, Dave Stevenson wrote:
> As required by libcamera, add the relevant cropping targets
> to report which portion of the sensor is being read out in
> any mode.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 75 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 8e86aa7e4b2a..d892f53fb1ea 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -67,6 +67,17 @@
>  #define OV9282_PIXEL_RATE	(OV9282_LINK_FREQ * 2 * \
>  				 OV9282_NUM_DATA_LANES / 10)
>
> +/*
> + * OV9282 native and active pixel array size.
> + * 8 dummy rows/columns on each edge of a 1280x800 active array
> + */
> +#define OV9282_NATIVE_WIDTH		1296U
> +#define OV9282_NATIVE_HEIGHT		816U
> +#define OV9282_PIXEL_ARRAY_LEFT		8U
> +#define OV9282_PIXEL_ARRAY_TOP		8U
> +#define OV9282_PIXEL_ARRAY_WIDTH	1280U
> +#define OV9282_PIXEL_ARRAY_HEIGHT	800U
> +
>  #define OV9282_REG_MIN		0x00
>  #define OV9282_REG_MAX		0xfffff
>
> @@ -118,6 +129,7 @@ struct ov9282_mode {
>  	u32 vblank_min;
>  	u32 vblank_max;
>  	u32 link_freq_idx;
> +	struct v4l2_rect crop;
>  	struct ov9282_reg_list reg_list;
>  };
>
> @@ -280,6 +292,16 @@ static const struct ov9282_mode supported_modes[] = {
>  		.vblank_min = 41,
>  		.vblank_max = 51540,
>  		.link_freq_idx = 0,
> +		.crop = {
> +			/*
> +			 * Note that this mode takes the top 720 lines from the
> +			 * 800 of the sensor. It does not take a middle crop.
> +			 */
> +			.left = OV9282_PIXEL_ARRAY_LEFT,
> +			.top = OV9282_PIXEL_ARRAY_TOP,
> +			.width = 1280,
> +			.height = 720
> +		},
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
>  			.regs = mode_1280x720_regs,
> @@ -719,6 +741,58 @@ static int ov9282_init_pad_cfg(struct v4l2_subdev *sd,
>  	return ov9282_set_pad_format(sd, sd_state, &fmt);
>  }
>
> +static const struct v4l2_rect *
> +__ov9282_get_pad_crop(struct ov9282 *ov9282,
> +		      struct v4l2_subdev_state *sd_state,
> +		      unsigned int pad, enum v4l2_subdev_format_whence which)
> +{
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		return v4l2_subdev_get_try_crop(&ov9282->sd, sd_state, pad);
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		return &ov9282->cur_mode->crop;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int ov9282_get_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP: {
> +		struct ov9282 *ov9282 = to_ov9282(sd);
> +
> +		mutex_lock(&ov9282->mutex);

As there's no set_selection, do we need the mutex here ?

> +		sel->r = *__ov9282_get_pad_crop(ov9282, sd_state, sel->pad,
> +						sel->which);
> +		mutex_unlock(&ov9282->mutex);
> +
> +		return 0;
> +	}
> +
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r.top = 0;
> +		sel->r.left = 0;
> +		sel->r.width = OV9282_NATIVE_WIDTH;
> +		sel->r.height = OV9282_NATIVE_HEIGHT;
> +
> +		return 0;
> +
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sel->r.top = OV9282_PIXEL_ARRAY_TOP;
> +		sel->r.left = OV9282_PIXEL_ARRAY_LEFT;
> +		sel->r.width = OV9282_PIXEL_ARRAY_WIDTH;
> +		sel->r.height = OV9282_PIXEL_ARRAY_HEIGHT;
> +
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  /**
>   * ov9282_start_streaming() - Start sensor stream
>   * @ov9282: pointer to ov9282 device
> @@ -963,6 +1037,7 @@ static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
>  	.enum_frame_size = ov9282_enum_frame_size,
>  	.get_fmt = ov9282_get_pad_format,
>  	.set_fmt = ov9282_set_pad_format,
> +	.get_selection = ov9282_get_selection,
>  };
>
>  static const struct v4l2_subdev_ops ov9282_subdev_ops = {
> --
> 2.34.1
>
