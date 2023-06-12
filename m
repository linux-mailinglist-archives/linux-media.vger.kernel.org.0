Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C45472B86B
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 09:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233318AbjFLHIU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 03:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbjFLHIS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 03:08:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF3C1726
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 00:03:17 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E06A6E4;
        Mon, 12 Jun 2023 08:52:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686552774;
        bh=70QYCploELZ8BFwOkz5f0oJHAI435WyVw3M41bh4mA0=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=Fr4M+hm14tu/dYDg7/WQVv8vX6ljOmgiKmZ5HHdkSTnt033MLZSQVlVcyRGX7uFgZ
         crX8DkDsSjQfwau5oo33HmFvqjFU3aS08V/OXbVf+d6PG1GeEj+MBIW4SwO/qR+IL7
         c1TKi/fYrf/d5YO5P6GYkxDqT2vfplU1x8uDJTOU=
Message-ID: <8575dadf-7db6-5c97-7fbb-1822c1fab0ee@ideasonboard.com>
Date:   Mon, 12 Jun 2023 07:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-2-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 01/28] media: ov2680: Remove auto-gain and auto-exposure
 controls
In-Reply-To: <20230607164712.63579-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Morning Hans - thanks for the set

On 07/06/2023 17:46, Hans de Goede wrote:
> Quoting the OV2680 datasheet:
>
> "3.2 exposure and gain control
>
> In the OV2680, the exposure time and gain are set manually from an external
> controller. The OV2680 supports manual gain and exposure control only for
> normal applications, no auto mode."
>
> And indeed testing with the atomisp_ov2680 fork of ov2680.c has shown that
> auto-exposure and auto-gain do not work.
>
> Note that the code setting the auto-exposure flag was broken, callers
> of ov2680_exposure_set() were directly passing !!ctrls->auto_exp->val as
> "bool auto_exp" value, but ctrls->auto_exp is a menu control with:
>
> enum  v4l2_exposure_auto_type {
>          V4L2_EXPOSURE_AUTO = 0,
>          V4L2_EXPOSURE_MANUAL = 1,
> 	...
>
> So instead of passing !!ctrls->auto_exp->val they should have been passing
> ctrls->auto_exp->val == V4L2_EXPOSURE_AUTO, iow the passed value was
> inverted of what it should have been.
>
> Also remove ov2680_g_volatile_ctrl() since without auto support the gain
> and exposure controls are not volatile.
>
> This also fixes the control values not being properly applied in
> ov2680_mode_set(). The 800x600 mode register-list also sets gain,
> exposure and vflip overriding the last set ctrl values.
>
> ov2680_mode_set() does call ov2680_gain_set() and ov2680_exposure_set()
> but did this before writing the mode register-list, so these values
> would still be overridden by the mode register-list.
>
> Add a v4l2_ctrl_handler_setup() call after writing the mode register-list
> to restore all ctrl values. Also remove the ctrls->gain->is_new check from
> ov2680_gain_set() so that the gain always gets restored properly.
>
> Last since ov2680_mode_set() now calls v4l2_ctrl_handler_setup(), remove
> the v4l2_ctrl_handler_setup() call after ov2680_mode_restore() since
> ov2680_mode_restore() calls ov2680_mode_set().
>
> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/media/i2c/ov2680.c | 162 ++++---------------------------------
>   1 file changed, 17 insertions(+), 145 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 54153bf66bdd..02204e185e2f 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -85,15 +85,8 @@ struct ov2680_mode_info {
>   
>   struct ov2680_ctrls {
>   	struct v4l2_ctrl_handler handler;
> -	struct {
> -		struct v4l2_ctrl *auto_exp;
> -		struct v4l2_ctrl *exposure;
> -	};
> -	struct {
> -		struct v4l2_ctrl *auto_gain;
> -		struct v4l2_ctrl *gain;
> -	};
> -
> +	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *gain;
>   	struct v4l2_ctrl *hflip;
>   	struct v4l2_ctrl *vflip;
>   	struct v4l2_ctrl *test_pattern;
> @@ -143,6 +136,7 @@ static const struct reg_value ov2680_setting_30fps_QUXGA_800_600[] = {
>   	{0x380e, 0x02}, {0x380f, 0x84}, {0x3811, 0x04}, {0x3813, 0x04},
>   	{0x3814, 0x31}, {0x3815, 0x31}, {0x3820, 0xc0}, {0x4008, 0x00},
>   	{0x4009, 0x03}, {0x4837, 0x1e}, {0x3501, 0x4e}, {0x3502, 0xe0},
> +	{0x3503, 0x03},


I'm confused why this was added to this mode but not the other two; according to the datasheet it's 
setting the AGC/AEC into manual but I can't see why it's only needed here?

>   };
>   
>   static const struct reg_value ov2680_setting_30fps_720P_1280_720[] = {
> @@ -405,69 +399,14 @@ static int ov2680_test_pattern_set(struct ov2680_dev *sensor, int value)
>   	return 0;
>   }
>   
> -static int ov2680_gain_set(struct ov2680_dev *sensor, bool auto_gain)
> +static int ov2680_gain_set(struct ov2680_dev *sensor, u32 gain)
>   {
> -	struct ov2680_ctrls *ctrls = &sensor->ctrls;
> -	u32 gain;
> -	int ret;
> -
> -	ret = ov2680_mod_reg(sensor, OV2680_REG_R_MANUAL, BIT(1),
> -			     auto_gain ? 0 : BIT(1));
> -	if (ret < 0)
> -		return ret;
> -
> -	if (auto_gain || !ctrls->gain->is_new)
> -		return 0;
> -
> -	gain = ctrls->gain->val;
> -
> -	ret = ov2680_write_reg16(sensor, OV2680_REG_GAIN_PK, gain);
> -
> -	return 0;
> +	return ov2680_write_reg16(sensor, OV2680_REG_GAIN_PK, gain);
>   }
>   
> -static int ov2680_gain_get(struct ov2680_dev *sensor)
> +static int ov2680_exposure_set(struct ov2680_dev *sensor, u32 exp)
>   {
> -	u32 gain;
> -	int ret;
> -
> -	ret = ov2680_read_reg16(sensor, OV2680_REG_GAIN_PK, &gain);
> -	if (ret)
> -		return ret;
> -
> -	return gain;
> -}
> -
> -static int ov2680_exposure_set(struct ov2680_dev *sensor, bool auto_exp)
> -{
> -	struct ov2680_ctrls *ctrls = &sensor->ctrls;
> -	u32 exp;
> -	int ret;
> -
> -	ret = ov2680_mod_reg(sensor, OV2680_REG_R_MANUAL, BIT(0),
> -			     auto_exp ? 0 : BIT(0));
> -	if (ret < 0)
> -		return ret;
> -
> -	if (auto_exp || !ctrls->exposure->is_new)
> -		return 0;
> -
> -	exp = (u32)ctrls->exposure->val;
> -	exp <<= 4;
> -
> -	return ov2680_write_reg24(sensor, OV2680_REG_EXPOSURE_PK_HIGH, exp);
> -}
> -
> -static int ov2680_exposure_get(struct ov2680_dev *sensor)
> -{
> -	int ret;
> -	u32 exp;
> -
> -	ret = ov2680_read_reg24(sensor, OV2680_REG_EXPOSURE_PK_HIGH, &exp);
> -	if (ret)
> -		return ret;
> -
> -	return exp >> 4;
> +	return ov2680_write_reg24(sensor, OV2680_REG_EXPOSURE_PK_HIGH, exp << 4);
>   }
>   
>   static int ov2680_stream_enable(struct ov2680_dev *sensor)
> @@ -482,32 +421,16 @@ static int ov2680_stream_disable(struct ov2680_dev *sensor)
>   
>   static int ov2680_mode_set(struct ov2680_dev *sensor)
>   {
> -	struct ov2680_ctrls *ctrls = &sensor->ctrls;
>   	int ret;
>   
> -	ret = ov2680_gain_set(sensor, false);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = ov2680_exposure_set(sensor, false);
> -	if (ret < 0)
> -		return ret;
> -
>   	ret = ov2680_load_regs(sensor, sensor->current_mode);
>   	if (ret < 0)
>   		return ret;
>   
> -	if (ctrls->auto_gain->val) {
> -		ret = ov2680_gain_set(sensor, true);
> -		if (ret < 0)
> -			return ret;
> -	}
> -
> -	if (ctrls->auto_exp->val == V4L2_EXPOSURE_AUTO) {
> -		ret = ov2680_exposure_set(sensor, true);
> -		if (ret < 0)
> -			return ret;
> -	}
> +	/* Restore value of all ctrls */
> +	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> +	if (ret < 0)
> +		return ret;
>   
>   	sensor->mode_pending_changes = false;
>   
> @@ -590,15 +513,10 @@ static int ov2680_s_power(struct v4l2_subdev *sd, int on)
>   	else
>   		ret = ov2680_power_off(sensor);
>   
> -	mutex_unlock(&sensor->lock);
> -
> -	if (on && ret == 0) {
> -		ret = v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> -		if (ret < 0)
> -			return ret;
> -
> +	if (on && ret == 0)
>   		ret = ov2680_mode_restore(sensor);
> -	}
> +
> +	mutex_unlock(&sensor->lock);
>   
>   	return ret;
>   }
> @@ -794,52 +712,19 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
>   	return 0;
>   }
>   
> -static int ov2680_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> -{
> -	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> -	struct ov2680_dev *sensor = to_ov2680_dev(sd);
> -	struct ov2680_ctrls *ctrls = &sensor->ctrls;
> -	int val;
> -
> -	if (!sensor->is_enabled)
> -		return 0;
> -
> -	switch (ctrl->id) {
> -	case V4L2_CID_GAIN:
> -		val = ov2680_gain_get(sensor);
> -		if (val < 0)
> -			return val;
> -		ctrls->gain->val = val;
> -		break;
> -	case V4L2_CID_EXPOSURE:
> -		val = ov2680_exposure_get(sensor);
> -		if (val < 0)
> -			return val;
> -		ctrls->exposure->val = val;
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
>   static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>   	struct ov2680_dev *sensor = to_ov2680_dev(sd);
> -	struct ov2680_ctrls *ctrls = &sensor->ctrls;
>   
>   	if (!sensor->is_enabled)
>   		return 0;
>   
>   	switch (ctrl->id) {
> -	case V4L2_CID_AUTOGAIN:
> -		return ov2680_gain_set(sensor, !!ctrl->val);
>   	case V4L2_CID_GAIN:
> -		return ov2680_gain_set(sensor, !!ctrls->auto_gain->val);
> -	case V4L2_CID_EXPOSURE_AUTO:
> -		return ov2680_exposure_set(sensor, !!ctrl->val);
> +		return ov2680_gain_set(sensor, ctrl->val);
>   	case V4L2_CID_EXPOSURE:
> -		return ov2680_exposure_set(sensor, !!ctrls->auto_exp->val);
> +		return ov2680_exposure_set(sensor, ctrl->val);
>   	case V4L2_CID_VFLIP:
>   		if (sensor->is_streaming)
>   			return -EBUSY;
> @@ -864,7 +749,6 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>   }
>   
>   static const struct v4l2_ctrl_ops ov2680_ctrl_ops = {
> -	.g_volatile_ctrl = ov2680_g_volatile_ctrl,
>   	.s_ctrl = ov2680_s_ctrl,
>   };
>   
> @@ -936,7 +820,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>   	if (ret < 0)
>   		return ret;
>   
> -	v4l2_ctrl_handler_init(hdl, 7);
> +	v4l2_ctrl_handler_init(hdl, 5);
>   
>   	hdl->lock = &sensor->lock;
>   
> @@ -948,16 +832,9 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>   					ARRAY_SIZE(test_pattern_menu) - 1,
>   					0, 0, test_pattern_menu);
>   
> -	ctrls->auto_exp = v4l2_ctrl_new_std_menu(hdl, ops,
> -						 V4L2_CID_EXPOSURE_AUTO,
> -						 V4L2_EXPOSURE_MANUAL, 0,
> -						 V4L2_EXPOSURE_AUTO);
> -
>   	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
>   					    0, 32767, 1, 0);
>   
> -	ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_AUTOGAIN,
> -					     0, 1, 1, 1);
>   	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 2047, 1, 0);
>   
>   	if (hdl->error) {
> @@ -965,14 +842,9 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>   		goto cleanup_entity;
>   	}
>   
> -	ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
> -	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
>   	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>   	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>   
> -	v4l2_ctrl_auto_cluster(2, &ctrls->auto_gain, 0, true);
> -	v4l2_ctrl_auto_cluster(2, &ctrls->auto_exp, 1, true);
> -
>   	sensor->sd.ctrl_handler = hdl;
>   
>   	ret = v4l2_async_register_subdev(&sensor->sd);
