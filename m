Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3632068839A
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 17:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbjBBQCR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 11:02:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232402AbjBBQCC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 11:02:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF2524C8F
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 08:01:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50A1A505;
        Thu,  2 Feb 2023 17:01:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675353688;
        bh=JCGqpKufr9BJn+/42on3WuAzZl+Dq0NHc9OqKXaSY3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OuiX1gIcIQHlJjUzl60cDorAvGQyuapoVB+87rD0TDHMbpt/EFG04Ms/rZPWv3Tr9
         UbeRwXNURcREv5ic2gOHm6GMlq5v0qLSQq1akY/0UjsyEpPSDS81f4E3g9bgo579Mq
         s1EiFv0DZRK0UxMKjIXmYcK7qReYEF7PzGtZAdKg=
Date:   Thu, 2 Feb 2023 18:01:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 08/11] media: i2c: imx290: Convert V4L2_CID_VBLANK to
 read/write
Message-ID: <Y9veVkxBvjyWN9Cb@pendragon.ideasonboard.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-9-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230131192016.3476937-9-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Thank you for the patch.

On Tue, Jan 31, 2023 at 07:20:13PM +0000, Dave Stevenson wrote:
> The driver exposed V4L2_CID_HBLANK as a read only control to allow

s/HBLANK/VBLANK/

> for exposure calculations and determination of the frame rate.
> 
> Convert to a read/write control so that the frame rate can be
> controlled.
> V4L2_CID_VBLANK also sets the limits for the exposure control,
> therefore exposure ranges have to be updated when vblank changes.
> 
> This also updates the default VMAX in 720p mode from 1125 to
> 750 to achieve 60fps and follow the datasheet.

I would have split this to a separate patch.

> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx290.c | 57 ++++++++++++++++++++++++++++++--------
>  1 file changed, 45 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 9006be6e5e7c..3413d83369ba 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -46,6 +46,7 @@
>  #define IMX290_BLKLEVEL					IMX290_REG_16BIT(0x300a)
>  #define IMX290_GAIN					IMX290_REG_8BIT(0x3014)
>  #define IMX290_VMAX					IMX290_REG_24BIT(0x3018)
> +#define IMX290_VMAX_MAX					0x3ffff
>  #define IMX290_HMAX					IMX290_REG_16BIT(0x301c)
>  #define IMX290_HMAX_MAX					0xffff
>  #define IMX290_SHS1					IMX290_REG_24BIT(0x3020)
> @@ -106,8 +107,6 @@
>  #define IMX290_PGCTRL_THRU				BIT(1)
>  #define IMX290_PGCTRL_MODE(n)				((n) << 4)
>  
> -#define IMX290_VMAX_DEFAULT				1125
> -
>  #define IMX290_PIXEL_RATE				148500000
>  /*
>   * The IMX290 pixel array is organized as follows:
> @@ -169,6 +168,7 @@ struct imx290_mode {
>  	u32 width;
>  	u32 height;
>  	u32 hmax_min;
> +	u32 vmax_min;
>  	u8 link_freq_index;
>  
>  	const struct imx290_regval *data;
> @@ -206,6 +206,7 @@ struct imx290 {
>  	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *exposure;
>  };
>  
>  static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
> @@ -219,7 +220,6 @@ static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
>  
>  static const struct imx290_regval imx290_global_init_settings[] = {
>  	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
> -	{ IMX290_VMAX, IMX290_VMAX_DEFAULT },
>  	{ IMX290_EXTCK_FREQ, 0x2520 },
>  	{ IMX290_WINWV_OB, 12 },
>  	{ IMX290_WINPH, 0 },
> @@ -412,6 +412,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
>  		.width = 1920,
>  		.height = 1080,
>  		.hmax_min = 2200,
> +		.vmax_min = 1125,
>  		.link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> @@ -420,6 +421,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
>  		.width = 1280,
>  		.height = 720,
>  		.hmax_min = 3300,
> +		.vmax_min = 750,
>  		.link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> @@ -431,6 +433,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
>  		.width = 1920,
>  		.height = 1080,
>  		.hmax_min = 2200,
> +		.vmax_min = 1125,
>  		.link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> @@ -439,6 +442,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
>  		.width = 1280,
>  		.height = 720,
>  		.hmax_min = 3300,
> +		.vmax_min = 750,
>  		.link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> @@ -645,7 +649,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  					     struct imx290, ctrls);
>  	const struct v4l2_mbus_framefmt *format;
>  	struct v4l2_subdev_state *state;
> -	int ret = 0;
> +	int ret = 0, vmax;
>  
>  	/*
>  	 * Return immediately for controls that don't need to be applied to the
> @@ -654,6 +658,18 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  	if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
>  		return 0;
>  
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		u32 vmax = ctrl->val + imx290->current_mode->height;
> +
> +		/*
> +		 * Changing vblank changes the allowed range for exposure.
> +		 * We don't supply the current exposure as default here as it
> +		 * may lie outside the new range. We will reset it just below.
> +		 */
> +		__v4l2_ctrl_modify_range(imx290->exposure,
> +					 1, vmax - 2, 1, vmax - 2);
> +	}
> +
>  	/* V4L2 controls values will be applied only when power is already up */
>  	if (!pm_runtime_get_if_in_use(imx290->dev))
>  		return 0;
> @@ -666,9 +682,23 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
>  		break;
>  
> +	case V4L2_CID_VBLANK:
> +		ret = imx290_write(imx290, IMX290_VMAX,
> +				   ctrl->val + imx290->current_mode->height,
> +				   NULL);
> +		/*
> +		 * Due to the way that exposure is programmed in this sensor in
> +		 * relation to VMAX, we have to reprogramme it whenever VMAX is
> +		 * changed.
> +		 * Update ctrl so that the V4L2_CID_EXPOSURE case can refer to
> +		 * it.
> +		 */
> +		ctrl = imx290->exposure;

You could skip this and use imx290->exposure below instead. I see pros
and cons, up to you.

> +		fallthrough;
>  	case V4L2_CID_EXPOSURE:
> +		vmax = imx290->vblank->val + imx290->current_mode->height;
>  		ret = imx290_write(imx290, IMX290_SHS1,
> -				   IMX290_VMAX_DEFAULT - ctrl->val - 1, NULL);
> +				   vmax - ctrl->val - 1, NULL);
>  		break;

The relationship between blanking and exposure is painful to handle :-(
Simplifying it is probably my number one wish for a good V4L2 raw sensor
helper. Just a bit of ranting, not a candidate for this series of
course.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	case V4L2_CID_TEST_PATTERN:
> @@ -725,13 +755,15 @@ static void imx290_ctrl_update(struct imx290 *imx290,
>  {
>  	unsigned int hblank_min = mode->hmax_min - mode->width;
>  	unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
> -	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> +	unsigned int vblank_min = mode->vmax_min - mode->height;
> +	unsigned int vblank_max = IMX290_VMAX_MAX - mode->height;
>  
>  	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
>  
>  	__v4l2_ctrl_modify_range(imx290->hblank, hblank_min, hblank_max, 1,
>  				 hblank_min);
> -	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
> +	__v4l2_ctrl_modify_range(imx290->vblank, vblank_min, vblank_max, 1,
> +				 vblank_min);
>  }
>  
>  static int imx290_ctrl_init(struct imx290 *imx290)
> @@ -761,9 +793,12 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>  			  V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
>  
> -	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 1,
> -			  IMX290_VMAX_DEFAULT - 2);
> +	/*
> +	 * Correct range will be determined through imx290_ctrl_update setting
> +	 * V4L2_CID_VBLANK.
> +	 */
> +	imx290->exposure = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> +					     V4L2_CID_EXPOSURE, 1, 1, 1, 1);
>  
>  	/*
>  	 * Set the link frequency, pixel rate, horizontal blanking and vertical
> @@ -795,8 +830,6 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  
>  	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>  					   V4L2_CID_VBLANK, 1, 1, 1, 1);
> -	if (imx290->vblank)
> -		imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
>  	v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
>  					&props);

-- 
Regards,

Laurent Pinchart
