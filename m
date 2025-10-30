Return-Path: <linux-media+bounces-46021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8BAC21108
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 16:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B1E14EEDEF
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 15:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D942773F0;
	Thu, 30 Oct 2025 15:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jamo+2XF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D02B2638BC;
	Thu, 30 Oct 2025 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761839453; cv=none; b=YvhIJ1sL1qZ7Wcqxu7Ax1Prd2LNcwBpu+qtyM5/vmACRBNYpZNgteMcj3Igp1/ZLf6l7tjZpsgY896gtKw6ZxFGjEF59tTh5OIp0Wzl9PWV7vt1k9mf0+tKHxBHnVDa5L1wfomvSIbX0/YZU+4oya3MlImvg3RoWAXhoWrKSZ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761839453; c=relaxed/simple;
	bh=FtQzmHoTFEM48OA/9W8Mg+5qb4J64qOrSPthinoiWzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IoyxCsmP7qLLy5YqyZJnEL/OoFmvB5dAlZXv6V/w2zrQIFXtgim8lTSo5kO9l7+WHaQ0xgh4Dim8kmLFscw3x/qi0sO6PEUP+jWIumPss7opwiTuhrbtblgBo1ZIeXLkeS4m2/u/FNgwz8ayjIWDKzdxRn4LCfkubzWvVwlvELc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jamo+2XF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4501A22B;
	Thu, 30 Oct 2025 16:48:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761839329;
	bh=FtQzmHoTFEM48OA/9W8Mg+5qb4J64qOrSPthinoiWzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jamo+2XFzyyMZiJOYxniY9zQsioadVaet5g8+qwb0sVFJV8wTUepCMBcF92zpPurM
	 uaTn9wM9kp8kBUACWaiRou0Atgvrq733TjkDdeA8E/aNierdW//8yLW5DzSEyDFAGQ
	 xWbxMMlLT+/5fzkhYLm4vhacyC/6ocesg2RP/RHc=
Date: Thu, 30 Oct 2025 16:50:36 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Hans de Goede <hansg@kernel.org>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Dongcheng Yan <dongcheng.yan@intel.com>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] media: i2c: add Sony IMX111 CMOS camera sensor
 driver
Message-ID: <nf5ad7wru2mmyvy7yskt3qkshsxjmnlwkxr7p32tf2ttslhgzj@7hz2rcksdcux>
References: <20251030115757.33695-1-clamor95@gmail.com>
 <20251030115757.33695-3-clamor95@gmail.com>
 <PN3P287MB182950EC8691183FBFC4EC098BFBA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <CAPVz0n0Vqi0xg8c=PS3vyFr9YzRC0PtFXyxw9G5yHohS4FKVbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0Vqi0xg8c=PS3vyFr9YzRC0PtFXyxw9G5yHohS4FKVbQ@mail.gmail.com>

Hello,
  sorry for entering the conversation

On Thu, Oct 30, 2025 at 05:13:31PM +0200, Svyatoslav Ryhel wrote:
> чт, 30 жовт. 2025 р. о 16:55 Tarang Raval <tarang.raval@siliconsignals.io> пише:
> >
> > Hi Svyatoslav,
> >
> > > Add a v4l2 sub-device driver for the Sony IMX111 image sensor. This is a
> > > camera sensor using the i2c bus for control and the csi-2 bus for data.
> > >
> > > The following features are supported:
> > > - manual exposure, digital and analog gain control support
> > > - pixel rate/link freq control support
> > > - supported resolution up to 3280x2464 for single shot capture
> > > - supported resolution up to 1920x1080 @ 30fps for video
> > > - supported bayer order output SGBRG10 and SGBRG8
> > >
> > > Camera module seems to be partially compatible with Nokia SMIA but it
> > > lacks a few registers required for clock calculations and has different
> > > vendor-specific per-mode configurations which makes it incompatible with
> > > existing CCS driver.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >
> > ---
> >
> > > +static int imx111_set_ctrl(struct v4l2_ctrl *ctrl)
> > > +{
> > > +   struct imx111 *sensor = ctrl_to_imx111(ctrl);
> > > +   struct device *dev = regmap_get_device(sensor->regmap);
> > > +   s64 max;
> > > +   int ret = 0;
> > > +
> > > +   /* Propagate change of current control to all related controls */
> > > +   switch (ctrl->id) {
> >
> > Do we need the switch statement, since only one case is present?
> > You can use an 'if' instead.
> >
>
> imx219 and imx319 which are recommended references use switch, and it
> seems that media maintainters are particularly picky to code style, I
> have copied it from there.
>

Personally, whenever doing reviews, receiving a reply that ignores the
merit of the comment and simply refers to the existing code base as an
excuse for not caring, it's what put me off the most.

Please respect the time reviewers have invested in looking at your
code by at least considering their comment instead of dismissing them.
In this specific case you could have easily said "I like it more this
way and it's consistent with what other drivers do". The same cannot
be said for other comments that you have decided to ignore.


> > > +   case V4L2_CID_VBLANK:
> > > +         /* Update max exposure while meeting expected vblanking */
> > > +         max = sensor->cur_mode->height + ctrl->val - 5;
> >
> > You can define a macro for the value 5 to improve readability.
> > Also, make this change in the init_control function.
> >
>
> imx219 does not specifies this as a define
>

It doesn't but it should, like 90% of other drivers in mainline do


> > > +         __v4l2_ctrl_modify_range(sensor->exposure,
> > > +                            sensor->exposure->minimum,
> > > +                            max, sensor->exposure->step, max);
> >
> > This may fail; consider adding an error check.
> >
>
> imx219 does not return error here too
>

so ?

> > > +         break;
> > > +   }
> > > +
> > > +   /*
> > > +    * Applying V4L2 control value only happens
> > > +    * when power is up for streaming
> > > +    */
> > > +   if (!pm_runtime_get_if_in_use(dev))
> > > +         return 0;
> > > +
> > > +   switch (ctrl->id) {
> > > +   case V4L2_CID_ANALOGUE_GAIN:
> > > +         cci_write(sensor->regmap, IMX111_REG_ANALOG_GAIN, ctrl->val, &ret);
> > > +         break;
> > > +   case V4L2_CID_DIGITAL_GAIN:
> > > +         ret = imx111_update_digital_gain(sensor, ctrl->val);
> > > +         break;
> > > +   case V4L2_CID_EXPOSURE:
> > > +         cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_WRITE_ON,
> > > +                     IMX111_GROUP_WRITE_ON, &ret);
> > > +         cci_write(sensor->regmap, IMX111_INTEGRATION_TIME, ctrl->val, &ret);
> > > +         cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_WRITE_ON,
> > > +                     0, &ret);
> > > +         break;
> > > +   case V4L2_CID_HBLANK:
> > > +         cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_WRITE_ON,
> > > +                     IMX111_GROUP_WRITE_ON, &ret);
> > > +         dev_err(dev, "writing 0x%x to HTL\n", sensor->cur_mode->width + ctrl->val);
> > > +         cci_write(sensor->regmap, IMX111_HORIZONTAL_TOTAL_LENGTH,
> > > +                 sensor->cur_mode->width + ctrl->val, &ret);
> > > +         cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_WRITE_ON,
> > > +                     0, &ret);
> > > +         break;
> > > +   case V4L2_CID_VBLANK:
> > > +         cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_WRITE_ON,
> > > +                     IMX111_GROUP_WRITE_ON, &ret);
> > > +         dev_err(dev, "writing 0x%x to VTL\n", sensor->cur_mode->height + ctrl->val);
> > > +         cci_write(sensor->regmap, IMX111_VERTICAL_TOTAL_LENGTH,
> > > +                 sensor->cur_mode->height + ctrl->val, &ret);
> > > +         cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_WRITE_ON,
> > > +                     0, &ret);
> > > +         break;
> > > +   case V4L2_CID_HFLIP:
> > > +   case V4L2_CID_VFLIP:
> > > +         cci_write(sensor->regmap, IMX111_IMAGE_ORIENTATION,
> > > +                 sensor->hflip->val | sensor->vflip->val << 1, &ret);
> > > +         break;
> > > +   case V4L2_CID_TEST_PATTERN:
> > > +         cci_write(sensor->regmap, IMX111_TEST_PATTERN, ctrl->val, &ret);
> > > +         break;
> > > +   case V4L2_CID_TEST_PATTERN_RED:
> > > +         cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_WRITE_ON,
> > > +                     IMX111_GROUP_WRITE_ON, &ret);
> > > +         cci_write(sensor->regmap, IMX111_SOLID_COLOR_RED, ctrl->val, &ret);
> > > +         cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_WRITE_ON,
> > > +                     0, &ret);
> > > +         break;
> > > +   case V4L2_CID_TEST_PATTERN_GREENR:
> > > +         cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_WRITE_ON,
> > > +                     IMX111_GROUP_WRITE_ON, &ret);
> > > +         cci_write(sensor->regmap, IMX111_SOLID_COLOR_GR, ctrl->val, &ret);
> > > +         cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_WRITE_ON,
> > > +                     0, &ret);
> > > +         break;
> > > +   case V4L2_CID_TEST_PATTERN_BLUE:
> > > +         cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_WRITE_ON,
> > > +                     IMX111_GROUP_WRITE_ON, &ret);
> > > +         cci_write(sensor->regmap, IMX111_SOLID_COLOR_BLUE, ctrl->val, &ret);
> > > +         cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_WRITE_ON,
> > > +                     0, &ret);
> > > +         break;
> > > +   case V4L2_CID_TEST_PATTERN_GREENB:
> > > +         cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_WRITE_ON,
> > > +                     IMX111_GROUP_WRITE_ON, &ret);
> > > +         cci_write(sensor->regmap, IMX111_SOLID_COLOR_GB, ctrl->val, &ret);
> > > +         cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_WRITE_ON,
> > > +                     0, &ret);
> > > +         break;
> > > +   default:
> > > +         ret = -EINVAL;
> > > +   }
> > > +
> > > +   pm_runtime_put(dev);
> > > +
> > > +   return ret;
> > > +}
> >
> > ---
> >
> > > +static int imx111_init_controls(struct imx111 *sensor)
> > > +{
> > > +   const struct v4l2_ctrl_ops *ops = &imx111_ctrl_ops;
> > > +   struct device *dev = regmap_get_device(sensor->regmap);
> > > +   const struct imx111_mode *mode = sensor->cur_mode;
> > > +   struct v4l2_fwnode_device_properties props;
> > > +   struct v4l2_subdev *sd = &sensor->sd;
> >
> > No need for a new variable; there is only one user in the function.
> >
>
> This make code reading cleaner, no?
>
> > > +   struct v4l2_ctrl_handler *hdl = &sensor->hdl;
> > > +   s64 pixel_rate_min, pixel_rate_max;
> > > +   int i, ret;
> > > +
> > > +   ret = v4l2_fwnode_device_parse(dev, &props);
> > > +   if (ret < 0)
> > > +         return ret;
> > > +
> > > +   ret = v4l2_ctrl_handler_init(hdl, 13);
> >
> > Now there are 15 controls.
> >
> > No need for explicit error checking; you can omit the error check if you'd like.
> >
> > > +   if (ret)
> > > +         return ret;
> > > +
> > > +   pixel_rate_min = div_u64(sensor->pixel_clk_raw, 2 * IMX111_DATA_DEPTH_RAW10);
> > > +   pixel_rate_max = div_u64(sensor->pixel_clk_raw, 2 * IMX111_DATA_DEPTH_RAW8);
> > > +   sensor->pixel_rate = v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL_RATE,
> > > +                                  pixel_rate_min, pixel_rate_max,
> > > +                                  1, div_u64(sensor->pixel_clk_raw,
> > > +                                  2 * sensor->data_depth));
> > > +
> > > +   sensor->link_freq = v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_LINK_FREQ,
> > > +                                    0, 0, &sensor->default_link_freq);
> > > +   if (sensor->link_freq)
> > > +         sensor->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > > +   v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
> > > +                 IMX111_ANA_GAIN_MIN, IMX111_ANA_GAIN_MAX,
> > > +                 IMX111_ANA_GAIN_STEP, IMX111_ANA_GAIN_DEFAULT);
> > > +
> > > +   v4l2_ctrl_new_std(hdl, ops, V4L2_CID_DIGITAL_GAIN,
> > > +                 IMX111_DGTL_GAIN_MIN, IMX111_DGTL_GAIN_MAX,
> > > +                 IMX111_DGTL_GAIN_STEP, IMX111_DGTL_GAIN_DEFAULT);
> > > +
> > > +   sensor->hflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
> > > +   if (sensor->hflip)
> > > +         sensor->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > > +
> > > +   sensor->vflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
> > > +   if (sensor->vflip)
> > > +         sensor->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > > +
> > > +   sensor->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK, IMX111_VBLANK_MIN,
> > > +                              IMX111_VTL_MAX - mode->height, 1,
> > > +                              mode->vtl_def - mode->height);
> > > +   sensor->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, IMX111_HBLANK_MIN,
> > > +                              IMX111_HTL_MAX - mode->width, 1,
> > > +                              mode->htl_def - mode->width);
> > > +
> > > +   /*
> > > +    * The maximum coarse integration time is the frame length in lines
> > > +    * minus five.
> > > +    */
> > > +   sensor->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
> > > +                                IMX111_INTEGRATION_TIME_MIN,
> > > +                                IMX111_PIXEL_ARRAY_HEIGHT - 5,
> > > +                                IMX111_INTEGRATION_TIME_STEP,
> > > +                                IMX111_PIXEL_ARRAY_HEIGHT - 5);
> > > +
> > > +   v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
> > > +
> > > +   v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_TEST_PATTERN,
> > > +                          ARRAY_SIZE(test_pattern_menu) - 1, 0, 0,
> > > +                          test_pattern_menu);
> > > +   for (i = 0; i < 4; i++) {
> > > +         /*
> > > +          * The assumption is that
> > > +          * V4L2_CID_TEST_PATTERN_GREENR == V4L2_CID_TEST_PATTERN_RED + 1
> > > +          * V4L2_CID_TEST_PATTERN_BLUE   == V4L2_CID_TEST_PATTERN_RED + 2
> > > +          * V4L2_CID_TEST_PATTERN_GREENB == V4L2_CID_TEST_PATTERN_RED + 3
> > > +          */
> > > +         v4l2_ctrl_new_std(hdl, ops, V4L2_CID_TEST_PATTERN_RED + i,
> > > +                       IMX111_TESTP_COLOUR_MIN, IMX111_TESTP_COLOUR_MAX,
> > > +                       IMX111_TESTP_COLOUR_STEP, IMX111_TESTP_COLOUR_MAX);
> > > +         /* The "Solid color" pattern is white by default */
> > > +   }
> > > +
> > > +   if (hdl->error)
> > > +         return hdl->error;
> > > +
> > > +   sd->ctrl_handler = hdl;
> > > +
> > > +   return 0;
> > > +};
> >
> > ---
> >
> > > +static int imx111_initialize(struct imx111 *sensor)
> > > +{
> > > +   struct device *dev = regmap_get_device(sensor->regmap);
> > > +   int ret;
> >
> > ret = 0;
> >
>
> cci_write does not state that ret must be initiated.

Could you at least take the time to read the code ?

int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
{
	bool little_endian;
	unsigned int len;
	u8 buf[8];
	int ret;

	if (err && *err)
		return *err;

And by the way, the documentation says:

/**
 * cci_write() - Write a value to a single CCI register
 *
 * @map: Register map to write to
 * @reg: Register address to write, use CCI_REG#() macros to encode reg width
 * @val: Value to be written
 * @err: Optional pointer to store errors, if a previous error is set
 *       then the write will be skipped
 *
 * Return: %0 on success or a negative error code on failure.
 */
int cci_write(struct regmap *map, u32 reg, u64 val, int *err);


>
> > > +
> > > +   /* Configure the PLL. */
> > > +   cci_write(sensor->regmap, IMX111_PRE_PLL_CLK_DIVIDER_PLL1,
> > > +           sensor->pll->pre_div, &ret);

I'm very surprised this doesn't sometimes fail as ret is not
initialized

> > > +   cci_write(sensor->regmap, IMX111_PLL_MULTIPLIER_PLL1, sensor->pll->mult, &ret);
> > > +   cci_write(sensor->regmap, IMX111_POST_DIVIDER, IMX111_POST_DIVIDER_DIV1, &ret);
> > > +   cci_write(sensor->regmap, IMX111_PLL_SETTLING_TIME,
> > > +           to_settle_delay(sensor->pll->extclk_rate), &ret);
> > > +
> > > +   ret = cci_multi_reg_write(sensor->regmap, imx111_global_init,
> > > +                       ARRAY_SIZE(imx111_global_init), NULL);
> >
> > You are overwriting the previous errors.
> >
> > please use ret |=

or you can pass ret to cci_multi_reg_write() as well

Maybe that's why you don't see errors causes by uninitialized ret ?

> >
> > > +   if (ret < 0) {
> > > +         dev_err(dev, "Failed to initialize the sensor\n");
> > > +         return ret;
> > > +   }
> > > +
> > > +   return 0;
> > > +}
> >
> > ---
> >
> > > +static int imx111_set_format(struct v4l2_subdev *sd,
> > > +                    struct v4l2_subdev_state *state,
> > > +                    struct v4l2_subdev_format *format)
> > > +{
> > > +   struct imx111 *sensor = sd_to_imx111(sd);
> > > +   struct v4l2_mbus_framefmt *mbus_fmt = &format->format;
> > > +   struct v4l2_mbus_framefmt *fmt;
> > > +   const struct imx111_mode *mode;
> > > +
> > > +   mode = v4l2_find_nearest_size(imx111_modes, ARRAY_SIZE(imx111_modes),
> > > +                           width, height,
> > > +                           mbus_fmt->width, mbus_fmt->height);
> > > +
> > > +   fmt = v4l2_subdev_state_get_format(state, format->pad);
> > > +
> > > +   fmt->code = imx111_get_format_code(sensor, mbus_fmt->code, false);
> > > +   fmt->width = mode->width;
> > > +   fmt->height = mode->height;
> > > +   fmt->colorspace = V4L2_COLORSPACE_RAW;
> > > +
> > > +   *mbus_fmt = *fmt;
> > > +
> > > +   if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > +         sensor->cur_mode = mode;
> > > +         sensor->data_depth = imx111_get_format_bpp(fmt);
> > > +         __v4l2_ctrl_s_ctrl_int64(sensor->pixel_rate,
> > > +                            div_u64(sensor->pixel_clk_raw, 2 * sensor->data_depth));
> > > +
> > > +         __v4l2_ctrl_modify_range(sensor->vblank, IMX111_VBLANK_MIN,
> > > +                            IMX111_VTL_MAX - mode->height, 1,
> > > +                            mode->vtl_def - mode->height);
> > > +         __v4l2_ctrl_s_ctrl(sensor->vblank, mode->vtl_def - mode->height);
> > > +
> > > +         __v4l2_ctrl_modify_range(sensor->hblank, IMX111_HBLANK_MIN,
> > > +                            IMX111_HTL_MAX - mode->width, 1,
> > > +                            mode->htl_def - mode->width);
> > > +         __v4l2_ctrl_s_ctrl(sensor->hblank, mode->htl_def - mode->width);
> >
> > All the above V4L2 operations need to check for errors.
> >
>
> yet again imx219 and imx319 do not check any of those
>

And we recently got an error on imx219 controls update that went
unnoticed because of this and I'm now fixing 40+ drivers because this
has been copied over and over. Want to make them 41 ?

> > > +   }
> > > +
> > > +   return 0;
> > > +}
> >
> > ---
> >
> > > +static int imx111_identify_module(struct imx111 *sensor)
> > > +{
> > > +   struct device *dev = regmap_get_device(sensor->regmap);
> > > +   u64 value, revision, manufacturer;
> > > +   int ret;
> > > +
> > > +   ret = cci_read(sensor->regmap, IMX111_PRODUCT_ID, &value, NULL);
> > > +   if (ret)
> > > +         return ret;
> > > +
> > > +   if (value != IMX111_CHIP_ID) {
> > > +         dev_err(dev, "chip id mismatch: %x!=%04llx", IMX111_CHIP_ID, value);
> > > +         return -ENXIO;
> > > +   }
> > > +
> > > +   cci_read(sensor->regmap, IMX111_REVISION, &revision, NULL);
> > > +   cci_read(sensor->regmap, IMX111_MANUFACTURER_ID, &manufacturer, NULL);
> >
> > Instead of NULL, pass ret for the error code, and return ret at the end.
> >
> > > +
> > > +   dev_dbg(dev, "module IMX%03llx rev. %llu manufacturer %llu\n",
> > > +         value, revision, manufacturer);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int imx111_clk_init(struct imx111 *sensor)
> > > +{
> > > +   struct device *dev = regmap_get_device(sensor->regmap);
> > > +   u32 ndata_lanes = sensor->bus_cfg.bus.mipi_csi2.num_data_lanes;
> > > +   u64 extclk_rate, system_clk;
> > > +   unsigned int i;
> > > +
> > > +   extclk_rate = clk_get_rate(sensor->extclk);
> > > +   if (!extclk_rate)
> > > +         return dev_err_probe(dev, -EINVAL, "EXTCLK rate unknown\n");
> > > +
> > > +   for (i = 0; i < ARRAY_SIZE(imx111_pll); i++) {
> > > +         if (clk_get_rate(sensor->extclk) == imx111_pll[i].extclk_rate) {
> > > +               sensor->pll = &imx111_pll[i];
> > > +               break;
> > > +         }
> > > +   }
> > > +   if (!sensor->pll)
> > > +         return dev_err_probe(dev, -EINVAL, "Unsupported EXTCLK rate %llu\n", extclk_rate);
> >
> > Max line length should be 80 columns. This applies everywhere the line
> > length exceeds 80 characters.

In response to your reply in a separate email:

https://www.kernel.org/doc/html/latest/driver-api/media/maintainer-entry-profile.html#coding-style-addendum
Media development uses checkpatch.pl on strict mode to verify the code style, e.g.:
$ ./scripts/checkpatch.pl --strict --max-line-length=80

I don't like being that strict too. Feel free to send a patch, you'll
have my ack

> >
> > > +
> > > +   system_clk = div_u64(extclk_rate, sensor->pll->pre_div) * sensor->pll->mult;
> > > +
> > > +   /*
> > > +    * Pixel clock or Logic clock is used for internal image processing is
> > > +    * generated by dividing into 1/10 or 1/8 frequency according to the
> > > +    * word length of the CSI2 interface. This clock is designating the pixel
> > > +    * rate and used as the base of integration time, frame rate etc.
> > > +    */
> > > +   sensor->pixel_clk_raw = system_clk * ndata_lanes;
> > > +
> > > +   /*
> > > +    * The CSI-2 bus is clocked for 16-bit per pixel, transmitted in DDR over n lanes
> > > +    * for RAW10 default format.
> > > +    */
> > > +   sensor->default_link_freq = div_u64(sensor->pixel_clk_raw * 8,
> > > +                               2 * IMX111_DATA_DEPTH_RAW10);
> > > +
> > > +   if (sensor->bus_cfg.nr_of_link_frequencies != 1 ||
> > > +       sensor->bus_cfg.link_frequencies[0] != sensor->default_link_freq)
> > > +         return dev_err_probe(dev, -EINVAL,
> > > +                          "Unsupported DT link-frequencies, expected %llu\n",
> > > +                          sensor->default_link_freq);
> > > +
> > > +   return 0;
> > > +}
> >
> > ---
> >
> > > +static const struct of_device_id imx111_of_match[] = {
> > > +   { .compatible = "sony,imx111" },
> > > +   { /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, imx111_of_match);
> > > +
> > > +static struct i2c_driver imx111_i2c_driver = {
> > > +   .driver = {
> > > +         .name = "imx111",
> > > +         .of_match_table = imx111_of_match,
> > > +         .pm = &imx111_pm_ops,
> > > +   },
> > > +   .probe = imx111_probe,
> > > +   .remove = imx111_remove,
> > > +};
> > > +module_i2c_driver(imx111_i2c_driver);
> > > +
> > > +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > > +MODULE_DESCRIPTION("Sony IMX111 CMOS Image Sensor driver");
> > > +MODULE_LICENSE("GPL");
> >
> > Best Regards,
> > Tarang

