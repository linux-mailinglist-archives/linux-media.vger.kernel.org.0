Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18E5F5F63F2
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 11:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbiJFJ6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 05:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbiJFJ6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 05:58:08 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E94C88DD9
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 02:58:02 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 4059A100010;
        Thu,  6 Oct 2022 09:57:58 +0000 (UTC)
Date:   Thu, 6 Oct 2022 11:57:57 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 15/16] media: i2c: ov9282: Add support for 8bit readout
Message-ID: <20221006095757.mxh6kkzv7pa7mjsg@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-16-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-16-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Wed, Oct 05, 2022 at 04:28:08PM +0100, Dave Stevenson wrote:
> The sensor supports 8 or 10 bit readout modes, but the
> driver only supported 10 bit.
>
> Add 8 bit readout.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 110 ++++++++++++++++++++++++++++++-------
>  1 file changed, 89 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index ec1599488f21..bc429455421e 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -22,6 +22,10 @@
>  #define OV9282_MODE_STANDBY	0x00
>  #define OV9282_MODE_STREAMING	0x01
>
> +#define OV9282_REG_PLL_CTRL_0D	0x030d
> +#define OV9282_PLL_CTRL_0D_RAW8		0x60
> +#define OV9282_PLL_CTRL_0D_RAW10	0x50
> +
>  #define OV9282_REG_TIMING_HTS	0x380c
>  #define OV9282_TIMING_HTS_MAX	0x7fff
>
> @@ -49,6 +53,10 @@
>  /* Group hold register */
>  #define OV9282_REG_HOLD		0x3308
>
> +#define OV9282_REG_ANA_CORE_2	0x3662
> +#define OV9282_ANA_CORE2_RAW8	0x07
> +#define OV9282_ANA_CORE2_RAW10	0x05
> +
>  #define OV9282_REG_TIMING_FORMAT_1	0x3820
>  #define OV9282_REG_TIMING_FORMAT_2	0x3821
>  #define OV9282_FLIP_BIT			BIT(2)
> @@ -64,8 +72,10 @@
>  #define OV9282_NUM_DATA_LANES	2
>
>  /* Pixel rate */
> -#define OV9282_PIXEL_RATE	(OV9282_LINK_FREQ * 2 * \
> -				 OV9282_NUM_DATA_LANES / 10)
> +#define OV9282_PIXEL_RATE_10BIT		(OV9282_LINK_FREQ * 2 * \
> +					 OV9282_NUM_DATA_LANES / 10)
> +#define OV9282_PIXEL_RATE_8BIT		(OV9282_LINK_FREQ * 2 * \
> +					 OV9282_NUM_DATA_LANES / 8)

Here you go... This can also be dyanmically calculated, but with only
2 modes and a single link_freq I guess this is fine for now

>
>  /*
>   * OV9282 native and active pixel array size.
> @@ -149,6 +159,7 @@ struct ov9282_mode {
>   * @again_ctrl: Pointer to analog gain control
>   * @vblank: Vertical blanking in lines
>   * @cur_mode: Pointer to current selected sensor mode
> + * @code: Mbus code currently selected
>   * @mutex: Mutex for serializing sensor controls
>   * @streaming: Flag indicating streaming state
>   */
> @@ -169,8 +180,10 @@ struct ov9282 {
>  		struct v4l2_ctrl *exp_ctrl;
>  		struct v4l2_ctrl *again_ctrl;
>  	};
> +	struct v4l2_ctrl *pixel_rate;
>  	u32 vblank;
>  	const struct ov9282_mode *cur_mode;
> +	u32 code;
>  	struct mutex mutex;
>  	bool streaming;
>  };
> @@ -182,7 +195,6 @@ static const s64 link_freq[] = {
>  /* Common registers */
>  static const struct ov9282_reg common_regs[] = {
>  	{0x0302, 0x32},
> -	{0x030d, 0x50},
>  	{0x030e, 0x02},
>  	{0x3001, 0x00},
>  	{0x3004, 0x00},
> @@ -514,23 +526,41 @@ static int ov9282_write_regs(struct ov9282 *ov9282,
>   * ov9282_update_controls() - Update control ranges based on streaming mode
>   * @ov9282: pointer to ov9282 device
>   * @mode: pointer to ov9282_mode sensor mode
> + * @fmt: pointer to the requested mode
>   *
>   * Return: 0 if successful, error code otherwise.
>   */
>  static int ov9282_update_controls(struct ov9282 *ov9282,
> -				  const struct ov9282_mode *mode)
> +				  const struct ov9282_mode *mode,
> +				  const struct v4l2_subdev_format *fmt)
>  {
>  	u32 hblank_min;
> +	s64 pixel_rate;
>  	int ret;
>
>  	ret = __v4l2_ctrl_s_ctrl(ov9282->link_freq_ctrl, mode->link_freq_idx);
>  	if (ret)
>  		return ret;
>
> -	hblank_min = mode->hblank_min[ov9282->noncontinuous_clock ? 0 : 1];
> -	ret =  __v4l2_ctrl_modify_range(ov9282->hblank_ctrl, hblank_min,
> -					OV9282_TIMING_HTS_MAX - mode->width, 1,
> -					hblank_min);
> +	pixel_rate = (fmt->format.code == MEDIA_BUS_FMT_Y10_1X10) ?
> +		OV9282_PIXEL_RATE_10BIT : OV9282_PIXEL_RATE_8BIT;
> +	ret = __v4l2_ctrl_modify_range(ov9282->pixel_rate, pixel_rate,
> +				       pixel_rate, 1, pixel_rate);
> +	if (ret)
> +		return ret;
> +
> +	if (ov9282->cur_mode != mode) {

Why has this become conditional in this patch, and why only for hblank ?

> +		hblank_min = mode->hblank_min[ov9282->noncontinuous_clock ? 0 : 1];
> +		ret =  __v4l2_ctrl_modify_range(ov9282->hblank_ctrl, hblank_min,
> +						OV9282_TIMING_HTS_MAX - mode->width, 1,
> +						hblank_min);
> +		if (ret)
> +			return ret;
> +
> +		ret =  __v4l2_ctrl_s_ctrl(ov9282->hblank_ctrl, hblank_min);
> +		if (ret)
> +			return ret;
> +	}
>
>  	return __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
>  					mode->vblank_max, 1, mode->vblank);
> @@ -693,10 +723,16 @@ static int ov9282_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	if (code->index > 0)
> +	switch (code->index) {
> +	default:
>  		return -EINVAL;

Can default: come after the valid cases ?

> -
> -	code->code = MEDIA_BUS_FMT_Y10_1X10;
> +	case 0:
> +		code->code = MEDIA_BUS_FMT_Y10_1X10;
> +		break;
> +	case 1:
> +		code->code = MEDIA_BUS_FMT_Y8_1X8;
> +		break;
> +	}
>
>  	return 0;
>  }
> @@ -716,7 +752,8 @@ static int ov9282_enum_frame_size(struct v4l2_subdev *sd,
>  	if (fsize->index >= OV9282_NUM_MODES)
>  		return -EINVAL;
>
> -	if (fsize->code != MEDIA_BUS_FMT_Y10_1X10)
> +	if (fsize->code != MEDIA_BUS_FMT_Y10_1X10 &&
> +	    fsize->code != MEDIA_BUS_FMT_Y8_1X8)
>  		return -EINVAL;
>
>  	fsize->min_width = supported_modes[fsize->index].width;
> @@ -732,15 +769,17 @@ static int ov9282_enum_frame_size(struct v4l2_subdev *sd,
>   *                            from selected sensor mode
>   * @ov9282: pointer to ov9282 device
>   * @mode: pointer to ov9282_mode sensor mode
> + * @code: mbus code to be stored
>   * @fmt: V4L2 sub-device format need to be filled
>   */
>  static void ov9282_fill_pad_format(struct ov9282 *ov9282,
>  				   const struct ov9282_mode *mode,
> +				   u32 code,
>  				   struct v4l2_subdev_format *fmt)
>  {
>  	fmt->format.width = mode->width;
>  	fmt->format.height = mode->height;
> -	fmt->format.code = MEDIA_BUS_FMT_Y10_1X10;
> +	fmt->format.code = code;
>  	fmt->format.field = V4L2_FIELD_NONE;
>  	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
>  	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> @@ -770,7 +809,8 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
>  		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
>  		fmt->format = *framefmt;
>  	} else {
> -		ov9282_fill_pad_format(ov9282, ov9282->cur_mode, fmt);
> +		ov9282_fill_pad_format(ov9282, ov9282->cur_mode, ov9282->code,
> +				       fmt);
>  	}
>
>  	mutex_unlock(&ov9282->mutex);
> @@ -792,6 +832,7 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>  {
>  	struct ov9282 *ov9282 = to_ov9282(sd);
>  	const struct ov9282_mode *mode;
> +	u32 code;
>  	int ret = 0;
>
>  	mutex_lock(&ov9282->mutex);
> @@ -801,7 +842,12 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>  				      width, height,
>  				      fmt->format.width,
>  				      fmt->format.height);
> -	ov9282_fill_pad_format(ov9282, mode, fmt);
> +	if (fmt->format.code == MEDIA_BUS_FMT_Y8_1X8)
> +		code = MEDIA_BUS_FMT_Y8_1X8;
> +	else
> +		code = MEDIA_BUS_FMT_Y10_1X10;
> +
> +	ov9282_fill_pad_format(ov9282, mode, code, fmt);
>
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		struct v4l2_mbus_framefmt *framefmt;
> @@ -809,9 +855,11 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>  		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
>  		*framefmt = fmt->format;
>  	} else {
> -		ret = ov9282_update_controls(ov9282, mode);
> -		if (!ret)
> +		ret = ov9282_update_controls(ov9282, mode, fmt);
> +		if (!ret) {
>  			ov9282->cur_mode = mode;
> +			ov9282->code = code;
> +		}
>  	}
>
>  	mutex_unlock(&ov9282->mutex);
> @@ -833,7 +881,7 @@ static int ov9282_init_pad_cfg(struct v4l2_subdev *sd,
>  	struct v4l2_subdev_format fmt = { 0 };
>
>  	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> -	ov9282_fill_pad_format(ov9282, &supported_modes[0], &fmt);
> +	ov9282_fill_pad_format(ov9282, &supported_modes[0], ov9282->code, &fmt);
>
>  	return ov9282_set_pad_format(sd, sd_state, &fmt);
>  }
> @@ -898,7 +946,17 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
>   */
>  static int ov9282_start_streaming(struct ov9282 *ov9282)
>  {
> +	const struct ov9282_reg bitdepth_regs[2][2] = {
> +		{
> +			{OV9282_REG_PLL_CTRL_0D, OV9282_PLL_CTRL_0D_RAW10},
> +			{OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW10},
> +		}, {
> +			{OV9282_REG_PLL_CTRL_0D, OV9282_PLL_CTRL_0D_RAW8},
> +			{OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW8},
> +		}
> +	};
>  	const struct ov9282_reg_list *reg_list;
> +	int bitdepth_index;
>  	int ret;
>
>  	/* Write common registers */
> @@ -917,6 +975,13 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>  		return ret;
>  	}
>
> +	bitdepth_index = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ? 0 : 1;
> +	ret = ov9282_write_regs(ov9282, bitdepth_regs[bitdepth_index], 2);
> +	if (ret) {
> +		dev_err(ov9282->dev, "fail to write bitdepth regs");
> +		return ret;
> +	}
> +
>  	/* Write sensor mode registers */
>  	reg_list = &ov9282->cur_mode->reg_list;
>  	ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
> @@ -1258,9 +1323,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  			  0, 1, 1, 1);
>
>  	/* Read only controls */
> -	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_PIXEL_RATE,
> -			  OV9282_PIXEL_RATE, OV9282_PIXEL_RATE, 1,
> -			  OV9282_PIXEL_RATE);
> +	ov9282->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
> +					       V4L2_CID_PIXEL_RATE,
> +					       OV9282_PIXEL_RATE_10BIT,
> +					       OV9282_PIXEL_RATE_10BIT, 1,
> +					       OV9282_PIXEL_RATE_10BIT);
>
>  	ov9282->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
>  							&ov9282_ctrl_ops,
> @@ -1342,6 +1409,7 @@ static int ov9282_probe(struct i2c_client *client)
>
>  	/* Set default mode to first mode */
>  	ov9282->cur_mode = &supported_modes[0];
> +	ov9282->code = MEDIA_BUS_FMT_Y10_1X10;
>  	ov9282->vblank = ov9282->cur_mode->vblank;
>
>  	ret = ov9282_init_controls(ov9282);
> --
> 2.34.1
>
