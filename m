Return-Path: <linux-media+bounces-753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 730747F4084
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 09:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC653B20F50
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 08:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A680524A00;
	Wed, 22 Nov 2023 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clF4W3Ti"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8295B9;
	Wed, 22 Nov 2023 00:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700642810; x=1732178810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zYrfiXotdvS7jOl26orQXxOI5lvDklokwVAFu9SB69M=;
  b=clF4W3TiLjajEQ/lkGYegvbpN6l+cmKfiQkIjdd6e3Z1HXMg+GEsz9J0
   EA43ZhfVjwGoGdpcytZW0yRzgB4PIhsZ6506K26Yj8S3dW7toIc/CxNA0
   ZAh+XdS3tBwTchVpfoQpVvYha4XFesA6aMuClEvzTUj6o8l4vJ1fIxTeJ
   63bgfKj8OtSgZNrIDe+czGHLe33Dx6q05JkBc2lXwqY+qSC3RHQ6YoyVC
   bF2j2pT3vzE+uSrRekbVgNdokHrb4dyVb8uZBxeuRxeUazFgqpZVsfa5M
   yVGEgm7WdXEmfFGkr/bc3TGT4s4ocFQuX/mhYxLHvhKNmxms2Soj5bTY0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="382409469"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="382409469"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 00:46:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="837316045"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="837316045"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 00:46:45 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 31E141202B6;
	Wed, 22 Nov 2023 10:46:42 +0200 (EET)
Date: Wed, 22 Nov 2023 08:46:42 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: martin.hecht@avnet.eu, michael.roeder@avnet.eu, mhecht73@gmail.com,
	linuxfancy@googlegroups.com, laurent.pinchart@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v13 3/3] media: i2c: Add support for alvium camera
Message-ID: <ZV2_8qUCTYz0C2Ny@kekkonen.localdomain>
References: <20231106082102.368937-1-tomm.merciai@gmail.com>
 <20231106082102.368937-4-tomm.merciai@gmail.com>
 <ZUynbIgak0mu7ff_@kekkonen.localdomain>
 <ZVXNX3G9ntWeqBur@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZVXxzVzXfNiJPQqh@kekkonen.localdomain>
 <ZVyPySW32I0WgepA@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZV2wPAmRqCbPMYrf@kekkonen.localdomain>
 <ZV29hSWiQuM/fSZD@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZV29hSWiQuM/fSZD@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>

Hi Tommaso,

On Wed, Nov 22, 2023 at 09:36:21AM +0100, Tommaso Merciai wrote:
> > > > > > > +static int alvium_get_bcrm_vers(struct alvium_dev *alvium)
> > > > > > > +{
> > > > > > > +	struct device *dev = &alvium->i2c_client->dev;
> > > > > > > +	struct alvium_bcrm_vers *v;
> > > > > > > +	u64 val;
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	ret = alvium_read(alvium, REG_BCRM_VERSION_R, &val, NULL);
> > > > > > > +	if (ret)
> > > > > > > +		return ret;
> > > > > > > +
> > > > > > > +	v = (struct alvium_bcrm_vers *) &val;
> > > > > > 
> > > > > > No space before "&" in type cast, please. The same elsewhere.
> > > > > > 
> > > > > > As you cast a single value to a struct, I think the struct field values
> > > > > > will be swapped on BE systems. You'll need to convert each value
> > > > > > separately. Same for struct alvium_fw_vers below.
> > > > > 
> > > > > What about:
> > > > > 
> > > > >  v->minor = le16_to_cpu(v->minor);
> > > > >  v->major = le16_to_cpu(v->major);
> > > > > 
> > > > > here. I posted this solution in some previous v :)
> > > > 
> > > > You shouldn't assign it to a field marked little endian. Instead, use
> > > > le16_to_cpu() when you access the data below.
> > > > 
> > > > If you want to access the struct in the driver without using the conversion
> > > > macros, you should read the data one field at a time (and use u16 instead
> > > > of __le16 type for the fields).
> > > 
> > > It's fine with your suggestion thanks.
> > > I'm moving to use the following to prints those values:
> > > 
> > > 	v = (struct alvium_bcrm_vers *)&val;
> > > 
> > > 	dev_info(dev, "bcrm version: %u.%u\n",
> > > 		 le16_to_cpu(v->minor), le16_to_cpu(v->major));
> > > 
> > > thanks for the hint.
> > 
> > Sorry, I forgot alvium_read(), via cci_read(), already does endianness
> > conversion here, from big endian to CPU endianness. Is there a need to do
> > further conversion here? Noting that le16_to_cpu() does nothing on little
> > endian systems, is it necessary here?
> > 
> > The options here are either changing the struct fields to CPU endianness
> > and reading them individually or accessing the register as a single 32-bit
> > value.
> > 
> > I'd do the former, it's easier to access them that way in the driver.
> > 
> > The same applies to BCRM version below.
> > 
> > struct alvium_bcrm_vers {
> > 	u16 minor;
> > 	u16 major;
> > };
> 
> Understood, thanks.
> 
> Then to resume just compared to v13 I just need to
> revert the alvium_bcrm_vers/alvium_fw_vers struct
> to:
> 
> struct alvium_bcrm_vers {
> 	u16 minor;
> 	u16 major;
> };
> 
> struct alvium_fw_vers {
> 	u8 special;
> 	u8 major;
> 	u16 minor;
> 	u16 patch;
> };

Yes, and accessing the registers one field at a time.

> > > > > > > +static int alvium_init_cfg(struct v4l2_subdev *sd,
> > > > > > > +			   struct v4l2_subdev_state *state)
> > > > > > > +{
> > > > > > > +	struct alvium_dev *alvium = sd_to_alvium(sd);
> > > > > > > +	struct alvium_mode *mode = &alvium->mode;
> > > > > > > +	struct v4l2_subdev_format sd_fmt = {
> > > > > > > +		.which = V4L2_SUBDEV_FORMAT_TRY,
> > > > > > > +		.format = alvium_csi2_default_fmt,
> > > > > > > +	};
> > > > > > > +	struct v4l2_subdev_crop sd_crop = {
> > > > > > > +		.which = V4L2_SUBDEV_FORMAT_TRY,
> > > > > > > +		.rect = {
> > > > > > > +			.left = mode->crop.left,
> > > > > > > +			.top = mode->crop.top,
> > > > > > > +			.width = mode->crop.width,
> > > > > > > +			.height = mode->crop.height,
> > > > > > > +		},
> > > > > > > +	};
> > > > > > > +
> > > > > > > +	*v4l2_subdev_get_pad_crop(sd, state, 0) = sd_crop.rect;
> > > > > > > +	*v4l2_subdev_get_pad_format(sd, state, 0) = sd_fmt.format;
> > > > > > 
> > > > > > Shouldn't the format have same width and height as crop? What about the
> > > > > > mbus code?
> > > 
> > > Can you clarify to me this comment pls :)
> > 
> > The purpose of the init_cfg operation is to initialise the sub-device
> > state, including format and crop rectangle (if applicable). The width and
> > height fields of the format are not initialised above, leaving them zeros.
> 
> Mmmmm.
> Why zeros?
> 
> .format = alvium_csi2_default_fmt
> 
> where:
> 
> static const struct v4l2_mbus_framefmt alvium_csi2_default_fmt = {
> 	.code = MEDIA_BUS_FMT_UYVY8_1X16,
> 	.width = 640,
> 	.height = 480,
> 	.colorspace = V4L2_COLORSPACE_SRGB,
> 	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SRGB),
> 	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
> 	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SRGB),
> 	.field = V4L2_FIELD_NONE,
> };

Ah, I missed this one. I think this part should be fine then.

> > That doesn't seem to be a valid configuration, given that the crop
> > rectangle is initiliased with different values.
> 
> Why different values?
> crop is initialized into subdev_init
> 
> static int alvium_subdev_init(struct alvium_dev *alvium)
> {
> 	struct i2c_client *client = alvium->i2c_client;
> 	struct device *dev = &alvium->i2c_client->dev;
> 	struct v4l2_subdev *sd = &alvium->sd;
> 	int ret;
> 
> 	/* Setup initial frame interval*/
> 	alvium->frame_interval.numerator = 1;
> 	alvium->frame_interval.denominator = ALVIUM_DEFAULT_FR_HZ;
> 	alvium->fr = ALVIUM_DEFAULT_FR_HZ;
> 
> 	/* Setup the initial mode */
> 	alvium->mode.fmt = alvium_csi2_default_fmt;
> 	alvium->mode.width = alvium_csi2_default_fmt.width;
> 	alvium->mode.height = alvium_csi2_default_fmt.height;
> 	alvium->mode.crop.left = alvium->min_offx;
> 	alvium->mode.crop.top = alvium->min_offy;
> 	alvium->mode.crop.width = alvium_csi2_default_fmt.width;
> 	alvium->mode.crop.height = alvium_csi2_default_fmt.height;
> ...
> 
> Then:
> 
> static int alvium_init_cfg(struct v4l2_subdev *sd,
> 			   struct v4l2_subdev_state *state)
> {
> 	struct alvium_dev *alvium = sd_to_alvium(sd);
> 	struct alvium_mode *mode = &alvium->mode;
> 	struct v4l2_subdev_format sd_fmt = {
> 		.which = V4L2_SUBDEV_FORMAT_TRY,
> 		.format = alvium_csi2_default_fmt,
> 	};
> 	struct v4l2_subdev_crop sd_crop = {
> 		.which = V4L2_SUBDEV_FORMAT_TRY,
> 		.rect = {
> 			.left = mode->crop.left,
> 			.top = mode->crop.top,
> 			.width = mode->crop.width,
> 			.height = mode->crop.height,
> 		},
> 	};
> ...
> 
> Seems that crop and format are using the same init values
> or I'm wrong?
> Mmm.. maybe I'm missing something?
> 
> Let me know
> 
> > 
> > > 
> > > > > > 
> > > > > > > +
> > > > > > > +	return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int alvium_set_fmt(struct v4l2_subdev *sd,
> > > > > > > +			  struct v4l2_subdev_state *sd_state,
> > > > > > > +			  struct v4l2_subdev_format *format)
> > > > > > > +{
> > > > > > > +	struct alvium_dev *alvium = sd_to_alvium(sd);
> > > > > > > +	const struct alvium_pixfmt *alvium_csi2_fmt;
> > > > > > > +	struct v4l2_mbus_framefmt *fmt;
> > > > > > > +	struct v4l2_rect *crop;
> > > > > > > +
> > > > > > > +	fmt = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> > > > > > > +	crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> > > > > > > +
> > > > > > > +	fmt->width = clamp(format->format.width, alvium->img_min_width,
> > > > > > > +			   alvium->img_max_width);
> > > > > > > +	fmt->height = clamp(format->format.height, alvium->img_min_height,
> > > > > > > +			    alvium->img_max_height);
> > > > > > > +
> > > > > > > +	/* Adjust left and top to prevent roll over sensor area */
> > > > > > > +	crop->left = clamp((u32)crop->left, (u32)0,
> > > > > > > +			   (alvium->img_max_width - fmt->width));
> > > > > > > +	crop->top = clamp((u32)crop->top, (u32)0,
> > > > > > > +			  (alvium->img_max_height - fmt->height));
> > > > > > > +
> > > > > > > +	/* Set also the crop width and height when set a new fmt */
> > > > > > > +	crop->width = fmt->width;
> > > > > > > +	crop->height = fmt->height;
> > > > > > > +
> > > > > > > +	alvium_csi2_fmt = alvium_code_to_pixfmt(alvium, format->format.code);
> > > > > > > +	fmt->code = alvium_csi2_fmt->code;
> > > > > > > +
> > > > > > > +	*fmt = format->format;
> > > > > > > +
> > > > > > > +	return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int alvium_set_selection(struct v4l2_subdev *sd,
> > > > > > > +				struct v4l2_subdev_state *sd_state,
> > > > > > > +				struct v4l2_subdev_selection *sel)
> > > > > > > +{
> > > > > > > +	struct alvium_dev *alvium = sd_to_alvium(sd);
> > > > > > > +	struct v4l2_mbus_framefmt *fmt;
> > > > > > > +	struct v4l2_rect *crop;
> > > > > > > +
> > > > > > > +	crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> > > > > > > +	fmt = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * Alvium can only shift the origin of the img
> > > > > > > +	 * then we accept only value with the same value of the actual fmt
> > > > > > > +	 */
> > > > > > > +	if (sel->r.width != fmt->width)
> > > > > > > +		sel->r.width = fmt->width;
> > > > > > > +
> > > > > > > +	if (sel->r.height != fmt->height)
> > > > > > > +		sel->r.height = fmt->height;
> > > > > > > +
> > > > > > > +	if (sel->target != V4L2_SEL_TGT_CROP)
> > > > > > > +		return -EINVAL;
> > > > > > 
> > > > > > This should be the first thing to test.
> > > > > 
> > > > > Oks
> > > > > 
> > > > > > 
> > > > > > > +
> > > > > > > +	/* alvium don't accept negative crop left/top */
> > > > > > > +	crop->left = clamp((u32)max(0, sel->r.left), alvium->min_offx,
> > > > > > > +			   alvium->img_max_width - sel->r.width);
> > > > > > > +	crop->top = clamp((u32)max(0, sel->r.top), alvium->min_offy,
> > > > > > > +			  alvium->img_max_height - sel->r.height);
> > > > > > > +
> > > > > > > +	sel->r = *crop;
> > > > > > > +
> > > > > > > +	return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int alvium_get_selection(struct v4l2_subdev *sd,
> > > > > > > +				struct v4l2_subdev_state *sd_state,
> > > > > > > +				struct v4l2_subdev_selection *sel)
> > > > > > > +{
> > > > > > > +	struct alvium_dev *alvium = sd_to_alvium(sd);
> > > > > > > +
> > > > > > > +	switch (sel->target) {
> > > > > > > +	/* Current cropping area */
> > > > > > > +	case V4L2_SEL_TGT_CROP:
> > > > > > > +		sel->r = *v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> > > > > > > +		break;
> > > > > > > +	/* Cropping bounds */
> > > > > > > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > > > > > > +		sel->r.top = 0;
> > > > > > > +		sel->r.left = 0;
> > > > > > > +		sel->r.width = alvium->img_max_width;
> > > > > > > +		sel->r.height = alvium->img_max_height;
> > > > > > > +		break;
> > > > > > > +	/* Default cropping area */
> > > > > > > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > > > > > > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > > > > > > +		sel->r.top = alvium->min_offy;
> > > > > > > +		sel->r.left = alvium->min_offx;
> > > > > > > +		sel->r.width = alvium->img_max_width;
> > > > > > > +		sel->r.height = alvium->img_max_height;
> > > > > > > +		break;
> > > > > > > +	default:
> > > > > > > +		return -EINVAL;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int alvium_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> > > > > > > +{
> > > > > > > +	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> > > > > > > +	struct alvium_dev *alvium = sd_to_alvium(sd);
> > > > > > > +	int val;
> > > > > > > +
> > > > > > > +	switch (ctrl->id) {
> > > > > > > +	case V4L2_CID_GAIN:
> > > > > > > +		val = alvium_get_gain(alvium);
> > > > > > > +		if (val < 0)
> > > > > > > +			return val;
> > > > > > > +		alvium->ctrls.gain->val = val;
> > > > > > > +		break;
> > > > > > > +	case V4L2_CID_EXPOSURE:
> > > > > > > +		val = alvium_get_exposure(alvium);
> > > > > > > +		if (val < 0)
> > > > > > > +			return val;
> > > > > > > +		alvium->ctrls.exposure->val = val;
> > > > > > > +		break;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int alvium_s_ctrl(struct v4l2_ctrl *ctrl)
> > > > > > > +{
> > > > > > > +	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> > > > > > > +	struct alvium_dev *alvium = sd_to_alvium(sd);
> > > > > > > +	struct i2c_client *client = v4l2_get_subdevdata(&alvium->sd);
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * Applying V4L2 control value only happens
> > > > > > > +	 * when power is up for streaming
> > > > > > > +	 */
> > > > > > > +	if (!pm_runtime_get_if_in_use(&client->dev))
> > > > > > > +		return 0;
> > > > > > > +
> > > > > > > +	switch (ctrl->id) {
> > > > > > > +	case V4L2_CID_AUTOGAIN:
> > > > > > > +		ret = alvium_set_ctrl_gain(alvium, ctrl->val);
> > > > > > 
> > > > > > 		ret = alvium_set_autogain(alvium, ctrl->val);
> > > > > > 
> > > > > 
> > > > > Pls check [1]
> > > > > 
> > > > > > Where do you set the manual gain value? What about the manual exposure
> > > > > > value? Both appear to be missing here.
> > > > > > 
> > > > > > How have you tested this?
> > > > > > 
> > > > > > > +		break;
> > > > > > > +	case V4L2_CID_EXPOSURE_AUTO:
> > > > > > > +		ret = alvium_set_ctrl_exposure(alvium, ctrl->val);
> > > > > > 
> > > > > > 		ret = alvium_set_autoexposure(alvium, ctrl->val);
> > > > > > 
> > > > > > You're still missing grabbing the manual controls when the corresponding
> > > > > > automatic control is enabled. I've commented on the same matter previously.
> > > > > 
> > > > > Same comment in [1]
> > > > > 
> > > > > > 
> > > > > > > +		break;
> > > > > > > +	case V4L2_CID_AUTO_WHITE_BALANCE:
> > > > > > > +		ret = alvium_set_ctrl_white_balance(alvium, ctrl->val);
> > > > > > > +		break;
> > > > > > > +	case V4L2_CID_HUE:
> > > > > > > +		ret = alvium_set_ctrl_hue(alvium, ctrl->val);
> > > > > > > +		break;
> > > > > > > +	case V4L2_CID_CONTRAST:
> > > > > > > +		ret = alvium_set_ctrl_contrast(alvium, ctrl->val);
> > > > > > > +		break;
> > > > > > > +	case V4L2_CID_SATURATION:
> > > > > > > +		ret = alvium_set_ctrl_saturation(alvium, ctrl->val);
> > > > > > > +		break;
> > > > > > > +	case V4L2_CID_GAMMA:
> > > > > > > +		ret = alvium_set_ctrl_gamma(alvium, ctrl->val);
> > > > > > > +		break;
> > > > > > > +	case V4L2_CID_SHARPNESS:
> > > > > > > +		ret = alvium_set_ctrl_sharpness(alvium, ctrl->val);
> > > > > > > +		break;
> > > > > > > +	case V4L2_CID_HFLIP:
> > > > > > > +		ret = alvium_set_ctrl_hflip(alvium, ctrl->val);
> > > > > > > +		break;
> > > > > > > +	case V4L2_CID_VFLIP:
> > > > > > > +		ret = alvium_set_ctrl_vflip(alvium, ctrl->val);
> > > > > > > +		break;
> > > > > > > +	default:
> > > > > > > +		ret = -EINVAL;
> > > > > > > +		break;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	pm_runtime_put(&client->dev);
> > > > > > > +
> > > > > > > +	return ret;
> > > > > > > +}
> 
> Here I plan to switch to:
> 
> static int alvium_s_ctrl(struct v4l2_ctrl *ctrl)
> {
> 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> 	struct alvium_dev *alvium = sd_to_alvium(sd);
> 	struct i2c_client *client = v4l2_get_subdevdata(&alvium->sd);
> 	int ret;
> 
> 	/*
> 	 * Applying V4L2 control value only happens
> 	 * when power is up for streaming
> 	 */
> 	if (!pm_runtime_get_if_in_use(&client->dev))
> 		return 0;
> 
> 	switch (ctrl->id) {
> 	case V4L2_CID_GAIN:
> 		ret = alvium_set_ctrl_gain(alvium, ctrl->val);
> 		break;
> 	case V4L2_CID_AUTOGAIN:
> 		ret = alvium_set_ctrl_auto_gain(alvium, ctrl->val);
> 		break;
> 	case V4L2_CID_EXPOSURE:
> 		ret = alvium_set_ctrl_exposure(alvium, ctrl->val);
> 		break;
> 	case V4L2_CID_EXPOSURE_AUTO:
> 		ret = alvium_set_ctrl_auto_exposure(alvium, ctrl->val);
> 		break;
> 	case V4L2_CID_RED_BALANCE:
> 		ret = alvium_set_ctrl_red_balance_ratio(alvium, ctrl->val);
> 		break;
> 	case V4L2_CID_BLUE_BALANCE:
> 		ret = alvium_set_ctrl_blue_balance_ratio(alvium, ctrl->val);
> 		break;
> 	case V4L2_CID_AUTO_WHITE_BALANCE:
> 		ret = alvium_set_ctrl_awb(alvium, ctrl->val);
> 		break;
> 	case V4L2_CID_HUE:
> 		ret = alvium_set_ctrl_hue(alvium, ctrl->val);
> 		break;
> 	case V4L2_CID_CONTRAST:
> 		ret = alvium_set_ctrl_contrast(alvium, ctrl->val);
> 		break;
> 	case V4L2_CID_SATURATION:
> 		ret = alvium_set_ctrl_saturation(alvium, ctrl->val);
> 		break;
> 	case V4L2_CID_GAMMA:
> 		ret = alvium_set_ctrl_gamma(alvium, ctrl->val);
> 		break;
> 	case V4L2_CID_SHARPNESS:
> 		ret = alvium_set_ctrl_sharpness(alvium, ctrl->val);
> 		break;
> 	case V4L2_CID_HFLIP:
> 		ret = alvium_set_ctrl_hflip(alvium, ctrl->val);
> 		break;
> 	case V4L2_CID_VFLIP:
> 		ret = alvium_set_ctrl_vflip(alvium, ctrl->val);
> 		break;
> 	default:
> 		ret = -EINVAL;
> 		break;
> 	}
> 
> 	pm_runtime_put(&client->dev);
> 
> 	return ret;
> }
> 
> Like you suggested.
> I think is more clean/understandable.
> Thanks for your comment.

Ack.

-- 
Regards,

Sakari Ailus

