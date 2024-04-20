Return-Path: <linux-media+bounces-9802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D6C8ABABB
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 11:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4D351C20AAF
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 09:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E149F171B6;
	Sat, 20 Apr 2024 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Dk4Ybzqx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ADB14F68
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713604601; cv=none; b=U4+05DBK8P12PEf9B4iszlpmTJq8OpHIkAJTf6wPdqPnNqFtrCRmXo67qgvmnJTSSPKIJkZ3VDliwP8xlk+N6UQ11PRkV1UMJ0MBgeTcSTPPfd7wvlHs0cimtwKpv0STK4YuoT27hYvpTcqsgLakgyh9TtX74Z0Spypqh2cpSCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713604601; c=relaxed/simple;
	bh=TE7ib5VqS8Amslz6Zj1j6N08Vd5AnJ6mnlM2nNSflKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVoa019dCwa5Ru+7q+ph/CB2+jLgtzteMwIAKMjYQ/3+xQNMvFQVK4rf2dysuBQqeTJpmmsOiAAiU7w/QLBe0DKyV/3+9alvcE+tajwN9EM3cOgH0VKeinjzB2bUE2gDr3iPxwL6UaOT0caXhhyun64+nNbzDaNw++FwTQTGqzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Dk4Ybzqx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F12A755;
	Sat, 20 Apr 2024 11:15:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713604548;
	bh=TE7ib5VqS8Amslz6Zj1j6N08Vd5AnJ6mnlM2nNSflKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dk4YbzqxH6TRt3BEzVxODXUmTgnEfmw7Q9ROFWRnkHArMp/iQJfCzj5YvQecuyj5y
	 d6zGyt9fmhwncqdiwPaKXz0IdMqBC24kkr66Ey1f+URDNYVBYMm5sMpZTlgmE+KvuL
	 YBZ51lHqzAeEIPx0glPQj49CNWLixKtFw9W+Nf5k=
Date: Sat, 20 Apr 2024 12:16:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 32/46] media: ccs: Rely on sub-device state locking
Message-ID: <20240420091628.GU6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-33-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-33-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:33:05PM +0300, Sakari Ailus wrote:
> Rely on sub-device state locking to serialise access to driver's data
> structures. The driver-provided mutex is used as the state lock for all
> driver sub-devices.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 192 +++++++++++++------------------
>  drivers/media/i2c/ccs/ccs.h      |   1 -
>  2 files changed, 81 insertions(+), 112 deletions(-)

The diffstat doesn't do justice to this patch, it's a really nice
simplification.

> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 299b5ac6538c..f82f3ec37c7c 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -541,12 +541,13 @@ static int ccs_pll_update(struct ccs_sensor *sensor)
>   *
>   */
>  
> -static void __ccs_update_exposure_limits(struct ccs_sensor *sensor)
> +static void __ccs_update_exposure_limits(struct ccs_sensor *sensor,
> +					 struct v4l2_rect *pa_src)

const

>  {
>  	struct v4l2_ctrl *ctrl = sensor->exposure;
>  	int max;
>  
> -	max = sensor->pa_src.height + sensor->vblank->val -
> +	max = pa_src->height + sensor->vblank->val -
>  		CCS_LIM(sensor, COARSE_INTEGRATION_TIME_MAX_MARGIN);
>  
>  	__v4l2_ctrl_modify_range(ctrl, ctrl->minimum, max, ctrl->step, max);
> @@ -649,12 +650,20 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
>  		container_of(ctrl->handler, struct ccs_subdev, ctrl_handler)
>  			->sensor;
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_rect *pa_src;

const

>  	int pm_status;
>  	u32 orient = 0;
>  	unsigned int i;
>  	int exposure;
>  	int rval;
>  
> +	if (ctrl->id == V4L2_CID_VBLANK || ctrl->id == V4L2_CID_HBLANK) {
> +		state = v4l2_subdev_get_locked_active_state(&sensor->pixel_array->sd);
> +		pa_src = v4l2_subdev_state_get_crop(state, CCS_PA_PAD_SRC,
> +						    CCS_STREAM_PIXEL);
> +	}
> +
>  	switch (ctrl->id) {
>  	case V4L2_CID_HFLIP:
>  	case V4L2_CID_VFLIP:
> @@ -673,7 +682,7 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_VBLANK:
>  		exposure = sensor->exposure->val;
>  
> -		__ccs_update_exposure_limits(sensor);
> +		__ccs_update_exposure_limits(sensor, pa_src);
>  
>  		if (exposure > sensor->exposure->maximum) {
>  			sensor->exposure->val =	sensor->exposure->maximum;
> @@ -765,12 +774,12 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case V4L2_CID_VBLANK:
>  		rval = ccs_write(sensor, FRAME_LENGTH_LINES,
> -				 sensor->pa_src.height + ctrl->val);
> +				 pa_src->height + ctrl->val);
>  
>  		break;
>  	case V4L2_CID_HBLANK:
>  		rval = ccs_write(sensor, LINE_LENGTH_PCK,
> -				 sensor->pa_src.width + ctrl->val);
> +				 pa_src->width + ctrl->val);
>  
>  		break;
>  	case V4L2_CID_TEST_PATTERN:
> @@ -1225,7 +1234,8 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
>  	return 0;
>  }
>  
> -static void ccs_update_blanking(struct ccs_sensor *sensor)
> +static void ccs_update_blanking(struct ccs_sensor *sensor,
> +				struct v4l2_rect *pa_src)

const

>  {
>  	struct v4l2_ctrl *vblank = sensor->vblank;
>  	struct v4l2_ctrl *hblank = sensor->hblank;
> @@ -1248,21 +1258,26 @@ static void ccs_update_blanking(struct ccs_sensor *sensor)
>  
>  	min = max_t(int,
>  		    CCS_LIM(sensor, MIN_FRAME_BLANKING_LINES),
> -		    min_fll - sensor->pa_src.height);
> -	max = max_fll -	sensor->pa_src.height;
> +		    min_fll - pa_src->height);
> +	max = max_fll -	pa_src->height;
>  
>  	__v4l2_ctrl_modify_range(vblank, min, max, vblank->step, min);
>  
> -	min = max_t(int, min_llp - sensor->pa_src.width, min_lbp);
> -	max = max_llp - sensor->pa_src.width;
> +	min = max_t(int, min_llp - pa_src->width, min_lbp);
> +	max = max_llp - pa_src->width;
>  
>  	__v4l2_ctrl_modify_range(hblank, min, max, hblank->step, min);
>  
> -	__ccs_update_exposure_limits(sensor);
> +	__ccs_update_exposure_limits(sensor, pa_src);
>  }
>  
>  static int ccs_pll_blanking_update(struct ccs_sensor *sensor)
>  {
> +	struct v4l2_subdev_state *state =
> +		v4l2_subdev_get_locked_active_state(&sensor->pixel_array->sd);
> +	struct v4l2_rect *pa_src =
> +		v4l2_subdev_state_get_crop(state, CCS_PA_PAD_SRC,
> +					   CCS_STREAM_PIXEL);

You can guess what I will say :-)

>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
>  	int rval;
>  
> @@ -1271,15 +1286,15 @@ static int ccs_pll_blanking_update(struct ccs_sensor *sensor)
>  		return rval;
>  
>  	/* Output from pixel array, including blanking */
> -	ccs_update_blanking(sensor);
> +	ccs_update_blanking(sensor, pa_src);
>  
>  	dev_dbg(&client->dev, "vblank\t\t%d\n", sensor->vblank->val);
>  	dev_dbg(&client->dev, "hblank\t\t%d\n", sensor->hblank->val);
>  
>  	dev_dbg(&client->dev, "real timeperframe\t100/%d\n",
>  		sensor->pll.pixel_rate_pixel_array /
> -		((sensor->pa_src.width + sensor->hblank->val) *
> -		 (sensor->pa_src.height + sensor->vblank->val) / 100));
> +		((pa_src->width + sensor->hblank->val) *
> +		 (pa_src->height + sensor->vblank->val) / 100));
>  
>  	return 0;
>  }
> @@ -1788,6 +1803,16 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
>  			      u64 streams_mask)
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> +	struct v4l2_subdev_state *pa_state =
> +		v4l2_subdev_get_locked_active_state(&sensor->pixel_array->sd);
> +	struct v4l2_subdev_state *src_state =
> +		v4l2_subdev_get_locked_active_state(&sensor->src->sd);
> +	struct v4l2_rect *pa_src =
> +		v4l2_subdev_state_get_crop(pa_state, CCS_PA_PAD_SRC,
> +					   CCS_STREAM_PIXEL);
> +	struct v4l2_rect *src_src =
> +		v4l2_subdev_state_get_crop(src_state, CCS_PAD_SRC,
> +					   CCS_STREAM_PIXEL);

Same for pa_src and src_src.

>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
>  	unsigned int binning_mode;
>  	int rval;
> @@ -1835,22 +1860,20 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
>  		goto err_pm_put;
>  
>  	/* Analog crop start coordinates */
> -	rval = ccs_write(sensor, X_ADDR_START, sensor->pa_src.left);
> +	rval = ccs_write(sensor, X_ADDR_START, pa_src->left);
>  	if (rval < 0)
>  		goto err_pm_put;
>  
> -	rval = ccs_write(sensor, Y_ADDR_START, sensor->pa_src.top);
> +	rval = ccs_write(sensor, Y_ADDR_START, pa_src->top);
>  	if (rval < 0)
>  		goto err_pm_put;
>  
>  	/* Analog crop end coordinates */
> -	rval = ccs_write(sensor, X_ADDR_END,
> -			 sensor->pa_src.left + sensor->pa_src.width - 1);
> +	rval = ccs_write(sensor, X_ADDR_END, pa_src->left + pa_src->width - 1);
>  	if (rval < 0)
>  		goto err_pm_put;
>  
> -	rval = ccs_write(sensor, Y_ADDR_END,
> -			 sensor->pa_src.top + sensor->pa_src.height - 1);
> +	rval = ccs_write(sensor, Y_ADDR_END, pa_src->top + pa_src->height - 1);
>  	if (rval < 0)
>  		goto err_pm_put;
>  
> @@ -1862,23 +1885,30 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
>  	/* Digital crop */
>  	if (CCS_LIM(sensor, DIGITAL_CROP_CAPABILITY)
>  	    == CCS_DIGITAL_CROP_CAPABILITY_INPUT_CROP) {
> +		struct v4l2_subdev_state *scaler_state =
> +			v4l2_subdev_get_locked_active_state(&sensor->scaler->sd);
> +		struct v4l2_rect *scaler_sink =
> +			v4l2_subdev_state_get_crop(scaler_state,
> +						   sensor->scaler->sink_pad,
> +						   CCS_STREAM_PIXEL);

Here too.

> +
>  		rval = ccs_write(sensor, DIGITAL_CROP_X_OFFSET,
> -				 sensor->scaler_sink.left);
> +				 scaler_sink->left);
>  		if (rval < 0)
>  			goto err_pm_put;
>  
>  		rval = ccs_write(sensor, DIGITAL_CROP_Y_OFFSET,
> -				 sensor->scaler_sink.top);
> +				 scaler_sink->top);
>  		if (rval < 0)
>  			goto err_pm_put;
>  
>  		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_WIDTH,
> -				 sensor->scaler_sink.width);
> +				 scaler_sink->width);
>  		if (rval < 0)
>  			goto err_pm_put;
>  
>  		rval = ccs_write(sensor, DIGITAL_CROP_IMAGE_HEIGHT,
> -				 sensor->scaler_sink.height);
> +				 scaler_sink->height);
>  		if (rval < 0)
>  			goto err_pm_put;
>  	}
> @@ -1896,10 +1926,10 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
>  	}
>  
>  	/* Output size from sensor */
> -	rval = ccs_write(sensor, X_OUTPUT_SIZE, sensor->src_src.width);
> +	rval = ccs_write(sensor, X_OUTPUT_SIZE, src_src->width);
>  	if (rval < 0)
>  		goto err_pm_put;
> -	rval = ccs_write(sensor, Y_OUTPUT_SIZE, sensor->src_src.height);
> +	rval = ccs_write(sensor, Y_OUTPUT_SIZE, src_src->height);
>  	if (rval < 0)
>  		goto err_pm_put;
>  
> @@ -2088,9 +2118,6 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	unsigned int i;
>  	int idx = -1;
> -	int rval = -EINVAL;
> -
> -	mutex_lock(&sensor->mutex);
>  
>  	dev_err(&client->dev, "subdev %s, pad %u, index %u\n",
>  		subdev->name, code->pad, code->index);
> @@ -2098,12 +2125,11 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
>  	if (subdev == &sensor->src->sd) {
>  		if (code->pad == CCS_PAD_META) {
>  			if (code->index)
> -				goto out;
> +				return -EINVAL;
>  
>  			code->code = MEDIA_BUS_FMT_CCS_EMBEDDED;
>  
> -			rval = 0;
> -			goto out;
> +			return 0;
>  		}
>  		if (code->stream == CCS_STREAM_META) {
>  			struct v4l2_mbus_framefmt *pix_fmt =
> @@ -2150,21 +2176,21 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
>  			}
>  
>  			if (WARN_ON(i > ARRAY_SIZE(codes)) || code->index >= i)
> -				goto out;
> +				return -EINVAL;
>  
>  			code->code = codes[code->index];
> -			rval = 0;
> -			goto out;
> +
> +			return 0;
>  		}
>  	}
>  
>  	if (subdev != &sensor->src->sd || code->pad != CCS_PAD_SRC) {
>  		if (code->index)
> -			goto out;
> +			return -EINVAL;
>  
>  		code->code = sensor->internal_csi_format->code;
> -		rval = 0;
> -		goto out;
> +
> +		return 0;
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
> @@ -2175,18 +2201,14 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
>  			code->code = ccs_csi_data_formats[i].code;
>  			dev_err(&client->dev, "found index %u, i %u, code %x\n",
>  				code->index, i, code->code);
> -			rval = 0;
> -			break;
> +			return 0;
>  		}
>  	}
>  
> -out:
> -	mutex_unlock(&sensor->mutex);
> -
> -	return rval;
> +	return -EINVAL;
>  }
>  
> -static u32 __ccs_get_mbus_code(struct v4l2_subdev *subdev, unsigned int pad)
> +static u32 ccs_get_mbus_code(struct v4l2_subdev *subdev, unsigned int pad)
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  
> @@ -2196,33 +2218,19 @@ static u32 __ccs_get_mbus_code(struct v4l2_subdev *subdev, unsigned int pad)
>  		return sensor->internal_csi_format->code;
>  }
>  
> -static int __ccs_get_format(struct v4l2_subdev *subdev,
> -			    struct v4l2_subdev_state *sd_state,
> -			    struct v4l2_subdev_format *fmt)
> +static int ccs_get_format(struct v4l2_subdev *subdev,
> +			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_format *fmt)
>  {
>  	fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad,
>  						    fmt->stream);
>  
>  	if (fmt->pad != CCS_PAD_META && fmt->stream != CCS_STREAM_META)
> -		fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
> +		fmt->format.code = ccs_get_mbus_code(subdev, fmt->pad);
>  
>  	return 0;
>  }

Any chance to switch to v4l2_subdev_get_fmt() ?

>  
> -static int ccs_get_format(struct v4l2_subdev *subdev,
> -			  struct v4l2_subdev_state *sd_state,
> -			  struct v4l2_subdev_format *fmt)
> -{
> -	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> -	int rval;
> -
> -	mutex_lock(&sensor->mutex);
> -	rval = __ccs_get_format(subdev, sd_state, fmt);
> -	mutex_unlock(&sensor->mutex);
> -
> -	return rval;
> -}
> -
>  /* Changes require propagation only on sink pad. */
>  static void ccs_propagate(struct v4l2_subdev *subdev,
>  			  struct v4l2_subdev_state *sd_state, int which,
> @@ -2246,7 +2254,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
>  				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
>  				sensor->scaling_mode =
>  					CCS_SCALING_MODE_NO_SCALING;
> -				sensor->scaler_sink = *comp;
>  			} else if (ssd == sensor->binner) {
>  				sensor->binning_horizontal = 1;
>  				sensor->binning_vertical = 1;
> @@ -2261,8 +2268,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
>  						   CCS_STREAM_PIXEL);
>  		fmt->width = comp->width;
>  		fmt->height = comp->height;
> -		if (which == V4L2_SUBDEV_FORMAT_ACTIVE && ssd == sensor->src)
> -			sensor->src_src = *crop;
>  		break;
>  	default:
>  		WARN_ON_ONCE(1);
> @@ -2281,7 +2286,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
>  	unsigned int i;
>  	int rval;
>  
> -	rval = __ccs_get_format(subdev, sd_state, fmt);
> +	rval = ccs_get_format(subdev, sd_state, fmt);
>  	if (rval)
>  		return rval;
>  
> @@ -2410,13 +2415,9 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
>  	if (subdev == &sensor->src->sd && fmt->pad == CCS_PAD_META)
>  		return ccs_get_format(subdev, sd_state, fmt);
>  
> -	mutex_lock(&sensor->mutex);
> -
>  	if (subdev == &sensor->src->sd && fmt->stream == CCS_STREAM_META) {
>  		ccs_set_format_meta(subdev, sd_state, &fmt->format);
>  
> -		mutex_unlock(&sensor->mutex);
> -
>  		return 0;
>  	}
>  
> @@ -2427,13 +2428,12 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
>  		if (sensor->embedded_start != sensor->embedded_end)
>  			ccs_set_format_meta(subdev, sd_state, NULL);
>  
> -		mutex_unlock(&sensor->mutex);
> -
>  		return rval;
>  	}
>  
>  	/* Sink pad. Width and height are changeable here. */
> -	fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
> +	fmt->format.code = ccs_get_mbus_code(subdev, fmt->pad);
> +
>  	fmt->format.width &= ~1;
>  	fmt->format.height &= ~1;
>  	fmt->format.field = V4L2_FIELD_NONE;
> @@ -2456,8 +2456,6 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
>  	crop->height = fmt->format.height;
>  	ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
>  
> -	mutex_unlock(&sensor->mutex);
> -
>  	return 0;
>  }
>  
> @@ -2765,9 +2763,6 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
>  
>  	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
>  		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
> -	else if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
> -		 ssd == sensor->pixel_array)
> -		sensor->pa_src = sel->r;
>  
>  	return 0;
>  }
> @@ -2839,8 +2834,6 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
>  	if (ret)
>  		return ret;
>  
> -	mutex_lock(&sensor->mutex);
> -
>  	sel->r.left = max(0, sel->r.left & ~1);
>  	sel->r.top = max(0, sel->r.top & ~1);
>  	sel->r.width = CCS_ALIGN_DIM(sel->r.width, sel->flags);
> @@ -2862,7 +2855,6 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
>  		ret = -EINVAL;
>  	}
>  
> -	mutex_unlock(&sensor->mutex);
>  	return ret;
>  }
>  
> @@ -3238,6 +3230,7 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
>  
>  	ssd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	ssd->sd.entity.function = function;
> +	ssd->sd.state_lock = &sensor->mutex;
>  	ssd->sensor = sensor;
>  
>  	ssd->npads = num_pads;
> @@ -3277,8 +3270,8 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
>  	return 0;
>  }
>  
> -static int __ccs_init_state(struct v4l2_subdev *sd,
> -			    struct v4l2_subdev_state *sd_state)
> +static int ccs_init_state(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *sd_state)
>  {
>  	struct ccs_subdev *ssd = to_ccs_subdev(sd);
>  	struct ccs_sensor *sensor = ssd->sensor;
> @@ -3297,12 +3290,8 @@ static int __ccs_init_state(struct v4l2_subdev *sd,
>  	fmt->code = sensor->internal_csi_format->code;
>  	fmt->field = V4L2_FIELD_NONE;
>  
> -	if (ssd == sensor->pixel_array) {
> -		if (is_active)
> -			sensor->pa_src = *crop;
> -
> +	if (ssd == sensor->pixel_array)
>  		return 0;
> -	}
>  
>  	fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
>  					   CCS_STREAM_PIXEL);
> @@ -3315,20 +3304,6 @@ static int __ccs_init_state(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -static int ccs_init_state(struct v4l2_subdev *sd,
> -			  struct v4l2_subdev_state *sd_state)
> -{
> -	struct ccs_subdev *ssd = to_ccs_subdev(sd);
> -	struct ccs_sensor *sensor = ssd->sensor;
> -	int rval;
> -
> -	mutex_lock(&sensor->mutex);
> -	rval = __ccs_init_state(sd, sd_state);
> -	mutex_unlock(&sensor->mutex);
> -
> -	return rval;
> -}
> -
>  static int ccs_src_init_state(struct v4l2_subdev *sd,
>  			      struct v4l2_subdev_state *sd_state)
>  {
> @@ -3353,25 +3328,20 @@ static int ccs_src_init_state(struct v4l2_subdev *sd,
>  	struct ccs_sensor *sensor = ssd->sensor;
>  	int rval;
>  
> -	mutex_lock(&sensor->mutex);
> -
>  	if (sensor->embedded_start != sensor->embedded_end)
>  		routing.num_routes++;
>  
>  	rval = v4l2_subdev_set_routing(sd, sd_state, &routing);
>  	if (rval)
> -		goto out;
> +		return 0;
>  
> -	rval = __ccs_init_state(sd, sd_state);
> +	rval = ccs_init_state(sd, sd_state);
>  	if (rval)
> -		goto out;
> +		return 0;
>  
>  	if (sensor->embedded_start != sensor->embedded_end)
>  		ccs_set_format_meta(sd, sd_state, NULL);
>  
> -out:
> -	mutex_unlock(&sensor->mutex);
> -
>  	return rval;
>  }
>  
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index 477b2fb99aa0..dcca3f88ea67 100644
> --- a/drivers/media/i2c/ccs/ccs.h
> +++ b/drivers/media/i2c/ccs/ccs.h
> @@ -230,7 +230,6 @@ struct ccs_sensor {
>  	u32 mbus_frame_fmts;
>  	const struct ccs_csi_data_format *csi_format;
>  	const struct ccs_csi_data_format *internal_csi_format;
> -	struct v4l2_rect pa_src, scaler_sink, src_src;
>  	u32 default_mbus_frame_fmts;
>  	int default_pixel_order;
>  	struct ccs_data_container sdata, mdata;

-- 
Regards,

Laurent Pinchart

