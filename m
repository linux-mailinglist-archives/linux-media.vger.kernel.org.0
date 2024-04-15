Return-Path: <linux-media+bounces-9343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF968A4DC0
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 13:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B76EB1C21A99
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F305FB9D;
	Mon, 15 Apr 2024 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFQW4mJs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5555D471
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713180743; cv=none; b=FY4IV5FwqAGqWvCNjbMW9I01dUEK3U9YVMXzX8o4Mgk8AAy69cqa90gjvyqD4Ts3Xl5NFEnLGKFxESc6WTMTiSeIhbGKmd5iAdRAFbWUqgicFgkwpZVsea0V8lX6bER6Ii4ljskws+6Ae4crVoerI8UWH1dsX3W4X6UmIMXWMoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713180743; c=relaxed/simple;
	bh=IhVVyIe6wdqkHUsfNP2zU6pe4CySIQN0RzzRxNvEcyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvczdRoOV5XnIvTMSzI1Oy1Yi28U52MX5tYeRn+49ufAG+515sZuiO4GEbiB2uP+cd3+RA+ShZKF0Wgfi+l1CRemf8AEIbcvLlF8Stj3lFalCUVYaOvfjq01wYIuILziWiS1kjsPusNdmvIAR6yyC+RgaChRL8jorzoHwcfyILc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFQW4mJs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713180742; x=1744716742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IhVVyIe6wdqkHUsfNP2zU6pe4CySIQN0RzzRxNvEcyk=;
  b=AFQW4mJspJ+fkvsjYtkWVCI+JATmEi6/XH0jmTtqWxxDzU8YxVq/44SH
   0wgvMiVaf+fpeu3W0Gx/RxZyzOxI3SxWt/mKVkUvv0rGrtamr/W1RmHcN
   TZ8UbUaaRKHnnv64dumFQNfVp/YO2DftALGCHsn15yvcHyC3bdqdNphcC
   7j05NiDaHKmVt7kNF01VB3+60UQVqkXEfZZQLQXbWNuYPMuBNkTa3Q0ov
   jKevqY07O74lY6NHu8QEbxz0k8OOXr/VD5rcpRHO7FQ/owV8ViUxJ61WS
   IVD2nwlGJNP0ACRpk0q9nTzmdofLHxlTB6m5XprwVBZyLwZ1goGKcdq94
   w==;
X-CSE-ConnectionGUID: JO7h5Y3vQESywRElwln4tA==
X-CSE-MsgGUID: iSq6Tlq+SEuVyWJh5BDeNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="9114432"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="9114432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 04:32:22 -0700
X-CSE-ConnectionGUID: U0oSFti2TcyD8zgU153zUg==
X-CSE-MsgGUID: H+z7kiRsTTu/4gURcxIdXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="21992713"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 04:32:20 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6E2AF11F8AF;
	Mon, 15 Apr 2024 14:32:17 +0300 (EEST)
Date: Mon, 15 Apr 2024 11:32:17 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH resend 3/5] media: ov2680: Add vblank control
Message-ID: <Zh0QQfIU4yDOPNrJ@kekkonen.localdomain>
References: <20240415093704.208175-1-hdegoede@redhat.com>
 <20240415093704.208175-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415093704.208175-4-hdegoede@redhat.com>

Hi Hans,

Thanks for re-posting this.

On Mon, Apr 15, 2024 at 11:37:02AM +0200, Hans de Goede wrote:
> Add vblank control to allow changing the framerate /
> higher exposure values.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2680.c | 47 ++++++++++++++++++++++++++++++++------
>  1 file changed, 40 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 6c3d7862b2aa..d44e1934b25a 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -75,6 +75,8 @@
>  #define OV2680_ACTIVE_START_TOP			8
>  #define OV2680_MIN_CROP_WIDTH			2
>  #define OV2680_MIN_CROP_HEIGHT			2
> +#define OV2680_MIN_VBLANK			4
> +#define OV2680_MAX_VBLANK			0xffff
>  
>  /* Fixed pre-div of 1/2 */
>  #define OV2680_PLL_PREDIV0			2
> @@ -84,7 +86,7 @@
>  
>  /* 66MHz pixel clock: 66MHz / 1704 * 1294 = 30fps */
>  #define OV2680_PIXELS_PER_LINE			1704
> -#define OV2680_LINES_PER_FRAME			1294
> +#define OV2680_LINES_PER_FRAME_30FPS		1294
>  
>  /* Max exposure time is VTS - 8 */
>  #define OV2680_INTEGRATION_TIME_MARGIN		8
> @@ -127,6 +129,7 @@ struct ov2680_ctrls {
>  	struct v4l2_ctrl *test_pattern;
>  	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *vblank;
>  };
>  
>  struct ov2680_mode {
> @@ -394,8 +397,7 @@ static int ov2680_set_mode(struct ov2680_dev *sensor)
>  		  sensor->mode.v_output_size, &ret);
>  	cci_write(sensor->regmap, OV2680_REG_TIMING_HTS,
>  		  OV2680_PIXELS_PER_LINE, &ret);
> -	cci_write(sensor->regmap, OV2680_REG_TIMING_VTS,
> -		  OV2680_LINES_PER_FRAME, &ret);
> +	/* VTS gets set by the vblank ctrl */
>  	cci_write(sensor->regmap, OV2680_REG_ISP_X_WIN, 0, &ret);
>  	cci_write(sensor->regmap, OV2680_REG_ISP_Y_WIN, 0, &ret);
>  	cci_write(sensor->regmap, OV2680_REG_X_INC, inc, &ret);
> @@ -469,6 +471,15 @@ static int ov2680_exposure_set(struct ov2680_dev *sensor, u32 exp)
>  			 NULL);
>  }
>  
> +static void ov2680_exposure_update_range(struct ov2680_dev *sensor)
> +{
> +	int exp_max = sensor->mode.fmt.height + sensor->ctrls.vblank->val -
> +		      OV2680_INTEGRATION_TIME_MARGIN;
> +
> +	__v4l2_ctrl_modify_range(sensor->ctrls.exposure, 0, exp_max,
> +				 1, exp_max);

__v4l2_ctrl_modify_range() may fail.

> +}
> +
>  static int ov2680_stream_enable(struct ov2680_dev *sensor)
>  {
>  	int ret;
> @@ -635,7 +646,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  	struct v4l2_mbus_framefmt *try_fmt;
>  	const struct v4l2_rect *crop;
>  	unsigned int width, height;
> -	int ret = 0;
> +	int def, max, ret = 0;
>  
>  	crop = __ov2680_get_pad_crop(sensor, sd_state, format->pad,
>  				     format->which);
> @@ -664,6 +675,15 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  	sensor->mode.fmt = format->format;
>  	ov2680_calc_mode(sensor);
>  
> +	/* vblank range is height dependent adjust and reset to default */
> +	max = OV2680_MAX_VBLANK - height;
> +	def = OV2680_LINES_PER_FRAME_30FPS - height;
> +	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV2680_MIN_VBLANK, max,
> +				 1, def);
> +	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, def);

And so may __v4l2_ctrl_s_ctrl().

> +	/* exposure range depends on vts which may have changed */
> +	ov2680_exposure_update_range(sensor);
> +
>  unlock:
>  	mutex_unlock(&sensor->lock);
>  
> @@ -833,6 +853,10 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>  	struct ov2680_dev *sensor = to_ov2680_dev(sd);
>  	int ret;
>  
> +	/* Update exposure range on vblank changes */
> +	if (ctrl->id == V4L2_CID_VBLANK)
> +		ov2680_exposure_update_range(sensor);
> +
>  	/* Only apply changes to the controls if the device is powered up */
>  	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
>  		ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
> @@ -855,6 +879,10 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_TEST_PATTERN:
>  		ret = ov2680_test_pattern_set(sensor, ctrl->val);
>  		break;
> +	case V4L2_CID_VBLANK:
> +		ret = cci_write(sensor->regmap, OV2680_REG_TIMING_VTS,
> +				sensor->mode.fmt.height + ctrl->val, NULL);
> +		break;
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -913,8 +941,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>  	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
>  	struct ov2680_ctrls *ctrls = &sensor->ctrls;
>  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> -	int exp_max = OV2680_LINES_PER_FRAME - OV2680_INTEGRATION_TIME_MARGIN;
> -	int ret = 0;
> +	int def, max, ret = 0;
>  
>  	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);
>  	sensor->sd.internal_ops = &ov2680_internal_ops;
> @@ -939,8 +966,9 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>  					ARRAY_SIZE(test_pattern_menu) - 1,
>  					0, 0, test_pattern_menu);
>  
> +	max = OV2680_LINES_PER_FRAME_30FPS - OV2680_INTEGRATION_TIME_MARGIN;
>  	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
> -					    0, exp_max, 1, exp_max);
> +					    0, max, 1, max);
>  
>  	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
>  					0, 1023, 1, 250);
> @@ -951,6 +979,11 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>  					      0, sensor->pixel_rate,
>  					      1, sensor->pixel_rate);
>  
> +	max = OV2680_MAX_VBLANK - OV2680_DEFAULT_HEIGHT;
> +	def = OV2680_LINES_PER_FRAME_30FPS - OV2680_DEFAULT_HEIGHT;
> +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
> +					  OV2680_MIN_VBLANK, max, 1, def);
> +
>  	if (hdl->error) {
>  		ret = hdl->error;
>  		goto cleanup_entity;

-- 
Kind regards,

Sakari Ailus

