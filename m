Return-Path: <linux-media+bounces-40006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7973EB28BAE
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 10:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AADE567868
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 08:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E1023372C;
	Sat, 16 Aug 2025 08:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zwtejwem"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FDD221DB5;
	Sat, 16 Aug 2025 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755331427; cv=none; b=UvIW5UwStvL7NTJ9E95i9TY3N5GBCa6qRe2tlAJ+SlFQ91fe416BC4wuWxhqvc2lA0VivyKPCavW5S3IiQaG0an85irxQ8trmq8dA8OIMdhmKYEbR9F1Iz0M0GzoCZckWs+9aM7oM0Hw5IDh+XeeBM5b6y3leCrf1Ykl3CuOKFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755331427; c=relaxed/simple;
	bh=miInR6Rv5Zv6yyQmgHU6tBwAeCa5AnB9YCXdfl0HKPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=usyrIXha7Ys+9QsNYVtkAZAwAICxM89mkx9VHn9JAyu0pf7X6BPFTUAlgsnzNt7JJEo0IMG7CyQu0A9tlu6Jga8Who0CrZBfadRm7iJ2T5mrRZgdjuJzbmzHKOFqoZy2fcMxLmRoBs8qPEfUg/qA6D6LfO0g3/na+5wSYlcaRx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zwtejwem; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FD2C4CEEF;
	Sat, 16 Aug 2025 08:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755331426;
	bh=miInR6Rv5Zv6yyQmgHU6tBwAeCa5AnB9YCXdfl0HKPI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zwtejwemve4Ik1oY/Ss7wKLODb8UtyBDLKtqFbchbUKMPs3iwckL2hWNPI8scvuzi
	 8+Y4X/2KfSS2xRLJZbt+Af3iTp1DMJuGaQ98Gca68Yl+7raDzJWKcPs5pDVgV1YxCZ
	 MEAVVSmsOHL90Em+avBxIU47E9IsbRYCqvxBqvnb+T0S9SopkvsiaLY2VuKyk1Jomc
	 CeflqfC9Phlw/R6nLgc9Fegm0Uf7vj8QflEXthyS6uo4CTQKazpbSgBDyPNsr+ITJk
	 c1Pz5tmXVGaNhrJw8iv7u/m2ngFvL9a0Tuz/WAgJBopneWfL5LDxoKyUjy4L0Ot9NW
	 pAxdwDp2Jeq3g==
Message-ID: <7e27b69b-40df-4ac4-aebf-dbd00044b71b@kernel.org>
Date: Sat, 16 Aug 2025 10:03:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: i2c: imx585: Add Sony IMX585 image-sensor
 driver
To: Will Whang <will@willwhang.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250816055432.131912-1-will@willwhang.com>
 <20250816055432.131912-3-will@willwhang.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250816055432.131912-3-will@willwhang.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/08/2025 07:54, Will Whang wrote:
> +
> +static int imx585_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct imx585 *imx585 = container_of(ctrl->handler, struct imx585, ctrl_handler);
> +	const struct imx585_mode *mode, *mode_list;
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_mbus_framefmt *fmt;
> +	unsigned int num_modes;
> +	int ret = 0;
> +
> +	state = v4l2_subdev_get_locked_active_state(&imx585->sd);
> +	fmt = v4l2_subdev_state_get_format(state, 0);
> +
> +	get_mode_table(imx585, fmt->code, &mode_list, &num_modes);
> +	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
> +				      fmt->width, fmt->height);
> +
> +	/* Apply control only when powered (runtime active). */
> +	if (!pm_runtime_get_if_active(imx585->clientdev))
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE: {
> +		u32 shr = (imx585->vmax - ctrl->val) & ~1U; /* SHR always a multiple of 2 */
> +
> +		dev_dbg(imx585->clientdev, "EXPOSURE=%u -> SHR=%u (VMAX=%u HMAX=%u)\n",
> +			ctrl->val, shr, imx585->vmax, imx585->hmax);
> +
> +		ret = cci_write(imx585->regmap, IMX585_REG_SHR, shr, NULL);
> +		if (ret)
> +			dev_err_ratelimited(imx585->clientdev, "SHR write failed (%d)\n", ret);
> +		break;
> +	}
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		dev_dbg(imx585->clientdev, "ANALOG_GAIN=%u\n", ctrl->val);

Not much improved. Don't debug V4L2 calls.

I already commented on this and you just send simialr code. Drop this
completely.


> +		ret = cci_write(imx585->regmap, IMX585_REG_ANALOG_GAIN, ctrl->val, NULL);
> +		if (ret)
> +			dev_err_ratelimited(imx585->clientdev, "Gain write failed (%d)\n", ret);
> +		break;
> +	case V4L2_CID_VBLANK: {
> +		u32 current_exposure = imx585->exposure->cur.val;
> +
> +		imx585->vmax = (mode->height + ctrl->val) & ~1U;
> +
> +		current_exposure = clamp_t(u32, current_exposure,
> +					   IMX585_EXPOSURE_MIN, imx585->vmax - IMX585_SHR_MIN);
> +		__v4l2_ctrl_modify_range(imx585->exposure,
> +					 IMX585_EXPOSURE_MIN, imx585->vmax - IMX585_SHR_MIN, 1,
> +					 current_exposure);
> +
> +		dev_dbg(imx585->clientdev, "VBLANK=%u -> VMAX=%u\n", ctrl->val, imx585->vmax);
> +
> +		ret = cci_write(imx585->regmap, IMX585_REG_VMAX, imx585->vmax, NULL);
> +		if (ret)
> +			dev_err_ratelimited(imx585->clientdev, "VMAX write failed (%d)\n", ret);
> +		break;
> +	}
> +	case V4L2_CID_HBLANK: {
> +		u64 pixel_rate = (u64)mode->width * IMX585_PIXEL_RATE;
> +		u64 hmax;
> +
> +		do_div(pixel_rate, mode->min_hmax);
> +		hmax = (u64)(mode->width + ctrl->val) * IMX585_PIXEL_RATE;
> +		do_div(hmax, pixel_rate);
> +		imx585->hmax = (u32)hmax;
> +
> +		dev_dbg(imx585->clientdev, "HBLANK=%u -> HMAX=%u\n", ctrl->val, imx585->hmax);
> +
> +		ret = cci_write(imx585->regmap, IMX585_REG_HMAX, imx585->hmax, NULL);
> +		if (ret)
> +			dev_err_ratelimited(imx585->clientdev, "HMAX write failed (%d)\n", ret);
> +		break;
> +	}
> +	case V4L2_CID_HFLIP:
> +		ret = cci_write(imx585->regmap, IMX585_FLIP_WINMODEH, ctrl->val, NULL);
> +		if (ret)
> +			dev_err_ratelimited(imx585->clientdev, "HFLIP write failed (%d)\n", ret);
> +		break;
> +	case V4L2_CID_VFLIP:
> +		ret = cci_write(imx585->regmap, IMX585_FLIP_WINMODEV, ctrl->val, NULL);
> +		if (ret)
> +			dev_err_ratelimited(imx585->clientdev, "VFLIP write failed (%d)\n", ret);
> +		break;
> +	case V4L2_CID_BRIGHTNESS: {
> +		u16 blacklevel = min_t(u32, ctrl->val, 4095);
> +
> +		ret = cci_write(imx585->regmap, IMX585_REG_BLKLEVEL, blacklevel, NULL);
> +		if (ret)
> +			dev_err_ratelimited(imx585->clientdev, "BLKLEVEL write failed (%d)\n", ret);
> +		break;
> +	}
> +	default:
> +		dev_dbg(imx585->clientdev, "Unhandled ctrl %s: id=0x%x, val=0x%x\n",
> +			ctrl->name, ctrl->id, ctrl->val);
> +		break;
> +	}
> +
> +	pm_runtime_put(imx585->clientdev);
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops imx585_ctrl_ops = {
> +	.s_ctrl = imx585_set_ctrl,
> +};
> +
> +static int imx585_init_controls(struct imx585 *imx585)
> +{
> +	struct v4l2_ctrl_handler *hdl = &imx585->ctrl_handler;
> +	struct v4l2_fwnode_device_properties props;
> +	int ret;
> +
> +	ret = v4l2_ctrl_handler_init(hdl, 16);
> +
> +	/* Read-only, updated per mode */
> +	imx585->pixel_rate = v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> +					       V4L2_CID_PIXEL_RATE,
> +					       1, UINT_MAX, 1, 1);
> +
> +	imx585->link_freq =
> +		v4l2_ctrl_new_int_menu(hdl, &imx585_ctrl_ops, V4L2_CID_LINK_FREQ,
> +				       0, 0, &link_freqs[imx585->link_freq_idx]);
> +	if (imx585->link_freq)
> +		imx585->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	imx585->vblank = v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> +					   V4L2_CID_VBLANK, 0, 0xFFFFF, 1, 0);
> +	imx585->hblank = v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> +					   V4L2_CID_HBLANK, 0, 0xFFFF, 1, 0);
> +	imx585->blacklevel = v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> +					       V4L2_CID_BRIGHTNESS, 0, 0xFFFF, 1,
> +					       IMX585_BLKLEVEL_DEFAULT);
> +
> +	imx585->exposure = v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> +					     V4L2_CID_EXPOSURE,
> +					     IMX585_EXPOSURE_MIN, IMX585_EXPOSURE_MAX,
> +					     IMX585_EXPOSURE_STEP, IMX585_EXPOSURE_DEFAULT);
> +
> +	imx585->gain = v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +					 IMX585_ANA_GAIN_MIN, IMX585_ANA_GAIN_MAX,
> +					 IMX585_ANA_GAIN_STEP, IMX585_ANA_GAIN_DEFAULT);
> +
> +	imx585->hflip = v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> +					  V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	imx585->vflip = v4l2_ctrl_new_std(hdl, &imx585_ctrl_ops,
> +					  V4L2_CID_VFLIP, 0, 1, 1, 0);
> +
> +	if (hdl->error) {
> +		ret = hdl->error;
> +		dev_err(imx585->clientdev, "control init failed (%d)\n", ret);
> +		goto err_free;
> +	}
> +
> +	ret = v4l2_fwnode_device_parse(imx585->clientdev, &props);
> +	if (ret)
> +		goto err_free;
> +
> +	ret = v4l2_ctrl_new_fwnode_properties(hdl, &imx585_ctrl_ops, &props);
> +	if (ret)
> +		goto err_free;
> +
> +	imx585->sd.ctrl_handler = hdl;
> +	return 0;
> +
> +err_free:
> +	v4l2_ctrl_handler_free(hdl);
> +	return ret;
> +}
> +
> +static void imx585_free_controls(struct imx585 *imx585)
> +{
> +	v4l2_ctrl_handler_free(imx585->sd.ctrl_handler);
> +}
> +
> +/* --------------------------------------------------------------------------
> + * Pad ops / formats
> + * --------------------------------------------------------------------------
> + */
> +
> +static int imx585_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct imx585 *imx585 = to_imx585(sd);
> +	unsigned int entries;
> +	const u32 *tbl;
> +
> +	if (imx585->mono) {
> +		if (code->index)
> +			return -EINVAL;
> +		code->code = MEDIA_BUS_FMT_Y12_1X12;
> +		return 0;
> +	}
> +
> +	tbl = color_codes;
> +	entries = ARRAY_SIZE(color_codes) / 4;
> +
> +	if (code->index >= entries)
> +		return -EINVAL;
> +
> +	code->code = imx585_get_format_code(imx585, tbl[code->index * 4]);
> +	return 0;
> +}
> +
> +static int imx585_enum_frame_size(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	struct imx585 *imx585 = to_imx585(sd);
> +	const struct imx585_mode *mode_list;
> +	unsigned int num_modes;
> +
> +	get_mode_table(imx585, fse->code, &mode_list, &num_modes);
> +	if (fse->index >= num_modes)
> +		return -EINVAL;
> +	if (fse->code != imx585_get_format_code(imx585, fse->code))
> +		return -EINVAL;
> +
> +	fse->min_width  = mode_list[fse->index].width;
> +	fse->max_width  = fse->min_width;
> +	fse->min_height = mode_list[fse->index].height;
> +	fse->max_height = fse->min_height;
> +
> +	return 0;
> +}
> +
> +static int imx585_set_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_format *fmt)
> +{
> +	struct imx585 *imx585 = to_imx585(sd);
> +	const struct imx585_mode *mode_list, *mode;
> +	unsigned int num_modes;
> +	struct v4l2_mbus_framefmt *format;
> +
> +	get_mode_table(imx585, fmt->format.code, &mode_list, &num_modes);
> +	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
> +				      fmt->format.width, fmt->format.height);
> +
> +	fmt->format.width        = mode->width;
> +	fmt->format.height       = mode->height;
> +	fmt->format.field        = V4L2_FIELD_NONE;
> +	fmt->format.colorspace   = V4L2_COLORSPACE_RAW;
> +	fmt->format.ycbcr_enc    = V4L2_YCBCR_ENC_601;
> +	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	fmt->format.xfer_func    = V4L2_XFER_FUNC_NONE;
> +
> +	format = v4l2_subdev_state_get_format(sd_state, 0);
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +		imx585_set_framing_limits(imx585, mode);
> +
> +	*format = fmt->format;
> +	return 0;
> +}
> +
> +/* --------------------------------------------------------------------------
> + * Stream on/off
> + * --------------------------------------------------------------------------
> + */
> +
> +static int imx585_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
> +{
> +	struct imx585 *imx585 = to_imx585(sd);
> +	const struct imx585_mode *mode_list, *mode;
> +	struct v4l2_subdev_state *st;
> +	struct v4l2_mbus_framefmt *fmt;
> +	unsigned int n_modes;
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(imx585->clientdev);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(imx585->clientdev);
> +		return ret;
> +	}
> +
> +	ret = cci_multi_reg_write(imx585->regmap, common_regs,
> +				  ARRAY_SIZE(common_regs), NULL);
> +	if (ret) {
> +		dev_err(imx585->clientdev, "Failed to write common settings\n");
> +		goto err_rpm_put;
> +	}
> +
> +	ret = cci_write(imx585->regmap, IMX585_INCK_SEL, imx585->inck_sel_val, NULL);
> +	if (!ret)
> +		ret = cci_write(imx585->regmap, IMX585_REG_BLKLEVEL, IMX585_BLKLEVEL_DEFAULT, NULL);
> +	if (!ret)
> +		ret = cci_write(imx585->regmap, IMX585_DATARATE_SEL,
> +				link_freqs_reg_value[imx585->link_freq_idx], NULL);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	ret = cci_write(imx585->regmap, IMX585_LANEMODE,
> +			(imx585->lane_count == 2) ? 0x01 : 0x03, NULL);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	/* Mono bin flag (datasheet: 0x01 mono, 0x00 color) */
> +	ret = cci_write(imx585->regmap, IMX585_BIN_MODE, imx585->mono ? 0x01 : 0x00, NULL);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	/* Sync configuration */
> +	if (imx585->sync_mode == SYNC_INT_FOLLOWER) {
> +		dev_dbg(imx585->clientdev, "Internal sync follower: XVS input\n");
> +		cci_write(imx585->regmap, IMX585_REG_EXTMODE, 0x01, NULL);
> +		cci_write(imx585->regmap, IMX585_REG_XXS_DRV, 0x03, NULL); /* XHS out, XVS in */
> +		cci_write(imx585->regmap, IMX585_REG_XXS_OUTSEL, 0x08, NULL); /* disable XVS OUT */
> +	} else if (imx585->sync_mode == SYNC_INT_LEADER) {
> +		dev_dbg(imx585->clientdev, "Internal sync leader: XVS/XHS output\n");
> +		cci_write(imx585->regmap, IMX585_REG_EXTMODE, 0x00, NULL);
> +		cci_write(imx585->regmap, IMX585_REG_XXS_DRV, 0x00, NULL); /* XHS/XVS out */
> +		cci_write(imx585->regmap, IMX585_REG_XXS_OUTSEL, 0x0A, NULL);
> +	} else {
> +		dev_dbg(imx585->clientdev, "Follower: XVS/XHS input\n");
> +		cci_write(imx585->regmap, IMX585_REG_XXS_DRV, 0x0F, NULL); /* inputs */
> +		cci_write(imx585->regmap, IMX585_REG_XXS_OUTSEL, 0x00, NULL);
> +	}
> +
> +	imx585->common_regs_written = true;
> +
> +	/* Select mode */
> +	st  = v4l2_subdev_get_locked_active_state(&imx585->sd);
> +	fmt = v4l2_subdev_state_get_format(st, 0);
> +
> +	get_mode_table(imx585, fmt->code, &mode_list, &n_modes);
> +	mode = v4l2_find_nearest_size(mode_list, n_modes, width, height,
> +				      fmt->width, fmt->height);
> +
> +	ret = cci_multi_reg_write(imx585->regmap, mode->reg_list.regs,
> +				  mode->reg_list.num_of_regs, NULL);
> +	if (ret) {
> +		dev_err(imx585->clientdev, "Failed to write mode registers\n");
> +		goto err_rpm_put;
> +	}
> +
> +	/* Disable digital clamp */
> +	cci_write(imx585->regmap, IMX585_REG_DIGITAL_CLAMP, 0x00, NULL);
> +
> +	/* Apply user controls after writing the base tables */
> +	ret = __v4l2_ctrl_handler_setup(imx585->sd.ctrl_handler);
> +	if (ret) {
> +		dev_err(imx585->clientdev, "Control handler setup failed\n");
> +		goto err_rpm_put;
> +	}
> +
> +	if (imx585->sync_mode != SYNC_EXTERNAL)
> +		cci_write(imx585->regmap, IMX585_REG_XMSTA, 0x00, NULL);
> +
> +	ret = cci_write(imx585->regmap, IMX585_REG_MODE_SELECT, IMX585_MODE_STREAMING, NULL);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	dev_dbg(imx585->clientdev, "Streaming started\n");
> +	usleep_range(IMX585_STREAM_DELAY_US,
> +		     IMX585_STREAM_DELAY_US + IMX585_STREAM_DELAY_RANGE_US);
> +
> +	/* vflip, hflip cannot change during streaming */
> +	__v4l2_ctrl_grab(imx585->vflip, true);
> +	__v4l2_ctrl_grab(imx585->hflip, true);
> +
> +	return 0;
> +
> +err_rpm_put:
> +	pm_runtime_put_autosuspend(imx585->clientdev);
> +	return ret;
> +}
> +
> +static int imx585_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{
> +	struct imx585 *imx585 = to_imx585(sd);
> +	int ret;
> +
> +	ret = cci_write(imx585->regmap, IMX585_REG_MODE_SELECT, IMX585_MODE_STANDBY, NULL);
> +	if (ret)
> +		dev_err(imx585->clientdev, "Failed to stop streaming\n");
> +
> +	__v4l2_ctrl_grab(imx585->vflip, false);
> +	__v4l2_ctrl_grab(imx585->hflip, false);
> +
> +	pm_runtime_put_autosuspend(imx585->clientdev);
> +
> +	return ret;
> +}
> +
> +/* --------------------------------------------------------------------------
> + * Power / runtime PM
> + * --------------------------------------------------------------------------
> + */
> +
> +static int imx585_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx585 *imx585 = to_imx585(sd);
> +	int ret;
> +
> +	dev_dbg(imx585->clientdev, "power_on\n");
> +
> +	ret = regulator_bulk_enable(IMX585_NUM_SUPPLIES, imx585->supplies);
> +	if (ret) {
> +		dev_err(imx585->clientdev, "Failed to enable regulators\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(imx585->xclk);
> +	if (ret) {
> +		dev_err(imx585->clientdev, "Failed to enable clock\n");
> +		goto reg_off;
> +	}
> +
> +	gpiod_set_value_cansleep(imx585->reset_gpio, 1);
> +	usleep_range(IMX585_XCLR_MIN_DELAY_US,
> +		     IMX585_XCLR_MIN_DELAY_US + IMX585_XCLR_DELAY_RANGE_US);
> +	return 0;
> +
> +reg_off:
> +	regulator_bulk_disable(IMX585_NUM_SUPPLIES, imx585->supplies);
> +	return ret;
> +}
> +
> +static int imx585_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx585 *imx585 = to_imx585(sd);
> +
> +	dev_dbg(imx585->clientdev, "power_off\n");
> +
> +	gpiod_set_value_cansleep(imx585->reset_gpio, 0);

NAK, I wrote you this is broken and you just ignored and sending the same.

You are mixing line level with logical level.

There is no way your code actually works, unless you have broken DTS.
Test your patches correctly (with proper, fixed DTS) and don't send the
same completely ignoring reviewers.

Best regards,
Krzysztof

