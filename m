Return-Path: <linux-media+bounces-39402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD4DB20153
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1ABA163791
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D572DA77A;
	Mon, 11 Aug 2025 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bW7q1Kgk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F56204863;
	Mon, 11 Aug 2025 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754899540; cv=none; b=Vyloxy064la1t0KdFZBrS5qDLjVIQ1kRQejoX8AasPpWMP9Trb6v0bJE2TyRkoi3acCCBSvmyB+RkYidNrq1ewfJzN746POK2PZuSNGd0w3gbmKHG0mymlFoJqaf4ftRcXcozsGj45ZPOMfEiEixJQRcr7HL7WUdVeI1x/K81hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754899540; c=relaxed/simple;
	bh=cbZyQBIfUekS7jZQkNApqR75Ty+vuqQsw7xr77QaQv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNmEstwaRSev7CqzmNM+RJ61uJJeNnSRAPxYGB0V+RqjlsTW0KXQ7jIyGn8AgciMdxry0vS/Xn1dg16uMh78fJUBt/Z/RnROJKArVSsIv/HN/Q7q8e9x6HM9xHm6G1Cd+5d7EWQt7Fjph25o0N5Z/hNSn+9zyqQ3/14bsGAKHOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bW7q1Kgk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E36C4CEED;
	Mon, 11 Aug 2025 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754899539;
	bh=cbZyQBIfUekS7jZQkNApqR75Ty+vuqQsw7xr77QaQv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bW7q1KgkpSinnNpmxsdmbpqveoNfAr0zE10jbKNoLvN39uMIu8XSIffzjXyi18lgW
	 0b6DLAOtRCMx4iQcax1G3fCXIYYb80K0JyBX82v32IixY6vQ8Pr6NVM7Y9bLAl52rn
	 ueHFSyy5YSNn4fM030apzJ4XCr2O6unbLPWKy0SjfNRtwpVRY+ehybTGVKUbZ38Xd/
	 cBYrho5YAOsHsL92VREu9Q0yFZrLNamtMYDFiTWm2xbC1ms9MeAZQBbAk3Dzl5xjb/
	 rdSuzDDpzhPgZ7Q3cCV7+46ZPmEYXejAg4hFRXRDrch6jxp3qSX7k27iUrJ/UnISGf
	 Vzfiw8iXq2ToA==
Date: Mon, 11 Aug 2025 10:05:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Will Whang <will@willwhang.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/4] media: i2c: imx585: Add Sony IMX585 image-sensor
 driver
Message-ID: <20250811-cryptic-papaya-bullfrog-adb7f4@kuoka>
References: <20250810220921.14307-1-will@willwhang.com>
 <20250810220921.14307-4-will@willwhang.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250810220921.14307-4-will@willwhang.com>

On Sun, Aug 10, 2025 at 11:09:20PM +0100, Will Whang wrote:
> +
> +/* Update analogue gain limits based on mode/HDR/HCG */
> +static void imx585_update_gain_limits(struct imx585 *imx585)
> +{
> +	const bool hcg_on = imx585->hcg;
> +	const bool clear_hdr = imx585->clear_hdr;
> +	const u32 min = hcg_on ? IMX585_ANA_GAIN_MIN_HCG : IMX585_ANA_GAIN_MIN_NORMAL;
> +	const u32 max = clear_hdr ? IMX585_ANA_GAIN_MAX_HDR : IMX585_ANA_GAIN_MAX_NORMAL;
> +	u32 cur = imx585->gain->val;
> +
> +	__v4l2_ctrl_modify_range(imx585->gain, min, max, IMX585_ANA_GAIN_STEP,
> +				 clamp(cur, min, max));
> +
> +	if (cur < min || cur > max)
> +		__v4l2_ctrl_s_ctrl(imx585->gain, clamp(cur, min, max));
> +}
> +
> +/* Recompute per-mode timing limits (HMAX/VMAX) from link/lanes/HDR */
> +static void imx585_update_hmax(struct imx585 *imx585)
> +{
> +	const u32 base_4lane = HMAX_table_4lane_4K[imx585->link_freq_idx];
> +	const u32 lane_scale = (imx585->lane_count == 2) ? 2 : 1;
> +	const u32 factor     = base_4lane * lane_scale;
> +	const u32 hdr_scale  = imx585->clear_hdr ? 2 : 1;
> +	unsigned int i;
> +
> +	dev_info(imx585->clientdev, "Update minimum HMAX: base=%u lane_scale=%u hdr_scale=%u\n",
> +		 base_4lane, lane_scale, hdr_scale);

Drop, driver should be silent on success. Could be dev_dbg.


> +
> +	for (i = 0; i < ARRAY_SIZE(supported_modes); ++i) {
> +		u32 h = factor / supported_modes[i].hmax_div;
> +		u32 v = IMX585_VMAX_DEFAULT * hdr_scale;
> +
> +		supported_modes[i].min_hmax = h;
> +		supported_modes[i].min_vmax = v;
> +
> +		dev_info(imx585->clientdev, " mode %ux%u -> VMAX=%u HMAX=%u\n",
> +			 supported_modes[i].width, supported_modes[i].height, v, h);

How many obvious/standard debugs do you need?

> +	}
> +}
> +
> +static void imx585_set_framing_limits(struct imx585 *imx585,
> +				      const struct imx585_mode *mode)
> +{
> +	u64 pixel_rate;
> +	u64 max_hblank;
> +
> +	imx585_update_hmax(imx585);
> +
> +	imx585->vmax = mode->min_vmax;
> +	imx585->hmax = mode->min_hmax;
> +
> +	/* Pixel rate proxy: width * clock / min_hmax */
> +	pixel_rate = (u64)mode->width * IMX585_PIXEL_RATE;
> +	do_div(pixel_rate, mode->min_hmax);
> +	__v4l2_ctrl_modify_range(imx585->pixel_rate, pixel_rate, pixel_rate, 1,
> +				 pixel_rate);
> +
> +	max_hblank = (u64)IMX585_HMAX_MAX * pixel_rate;
> +	do_div(max_hblank, IMX585_PIXEL_RATE);
> +	max_hblank -= mode->width;
> +
> +	__v4l2_ctrl_modify_range(imx585->hblank, 0, max_hblank, 1, 0);
> +	__v4l2_ctrl_s_ctrl(imx585->hblank, 0);
> +
> +	__v4l2_ctrl_modify_range(imx585->vblank,
> +				 mode->min_vmax - mode->height,
> +				 IMX585_VMAX_MAX - mode->height,
> +				 1, mode->min_vmax - mode->height);
> +	__v4l2_ctrl_s_ctrl(imx585->vblank, mode->min_vmax - mode->height);
> +
> +	__v4l2_ctrl_modify_range(imx585->exposure, IMX585_EXPOSURE_MIN,
> +				 imx585->vmax - IMX585_SHR_MIN_HDR, 1,
> +				 IMX585_EXPOSURE_DEFAULT);
> +
> +	dev_info(imx585->clientdev, "Framing: VMAX=%u HMAX=%u pixel_rate=%llu\n",
> +		 imx585->vmax, imx585->hmax, pixel_rate);

Here as well...

> +}
> +
> +/* --------------------------------------------------------------------------
> + * Controls
> + * --------------------------------------------------------------------------
> + */
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
> +	switch (ctrl->id) {
> +	case V4L2_CID_WIDE_DYNAMIC_RANGE:
> +		if (imx585->clear_hdr != ctrl->val) {
> +			u32 code;
> +
> +			imx585->clear_hdr = ctrl->val;
> +
> +			v4l2_ctrl_activate(imx585->datasel_th_ctrl,  imx585->clear_hdr);
> +			v4l2_ctrl_activate(imx585->datasel_bk_ctrl,  imx585->clear_hdr);
> +			v4l2_ctrl_activate(imx585->gdc_th_ctrl,      imx585->clear_hdr);
> +			v4l2_ctrl_activate(imx585->gdc_exp_ctrl_h,   imx585->clear_hdr);
> +			v4l2_ctrl_activate(imx585->gdc_exp_ctrl_l,   imx585->clear_hdr);
> +			v4l2_ctrl_activate(imx585->hdr_gain_ctrl,    imx585->clear_hdr);
> +			v4l2_ctrl_activate(imx585->hcg_ctrl,        !imx585->clear_hdr);
> +
> +			/* Disable HCG in ClearHDR mode */
> +			imx585->hcg = imx585->clear_hdr ? 0 : imx585->hcg;
> +			__v4l2_ctrl_s_ctrl(imx585->hcg_ctrl, imx585->hcg);
> +			imx585_update_gain_limits(imx585);
> +			dev_info(imx585->clientdev, "HDR=%u, HCG=%u\n", ctrl->val, imx585->hcg);

Drop

> +
> +			code = imx585->mono ? MEDIA_BUS_FMT_Y12_1X12
> +					    : MEDIA_BUS_FMT_SRGGB12_1X12;
> +			get_mode_table(imx585, code, &mode_list, &num_modes);
> +			mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
> +						      fmt->width, fmt->height);
> +			imx585_set_framing_limits(imx585, mode);
> +		}
> +		break;
> +	case V4L2_CID_IMX585_HCG_GAIN:
> +		if (!imx585->clear_hdr) {
> +			imx585->hcg = ctrl->val;
> +			imx585_update_gain_limits(imx585);
> +			dev_info(imx585->clientdev, "HCG=%u\n", ctrl->val);

Your driver is way too noisy.

Above comment - drop all dev_info - applies EVERYWHERE, especially to
standard controls. Printing info message, just because someone set some v4l2
control is too noisy and does not warrant dev_dbg, imo.

> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +

> +
> +static int imx585_check_module_exists(struct imx585 *imx585)
> +{
> +	int ret;
> +	u64 val;
> +
> +	/* No chip-id register; read a known register as a presence test */
> +	ret = cci_read(imx585->regmap, IMX585_REG_BLKLEVEL, &val, NULL);
> +	if (ret) {
> +		dev_err(imx585->clientdev, "register read failed (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	dev_info(imx585->clientdev, "Sensor detected\n");

Drop. It is obvious (already known) due to lack of error message.

> +	return 0;
> +}
> +
> +static int imx585_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct imx585 *imx585;
> +	const char *sync_mode;
> +	int ret, i;
> +
> +	imx585 = devm_kzalloc(dev, sizeof(*imx585), GFP_KERNEL);
> +	if (!imx585)
> +		return -ENOMEM;
> +
> +	v4l2_i2c_subdev_init(&imx585->sd, client, &imx585_subdev_ops);
> +	imx585->clientdev = dev;
> +
> +	imx585->mono = of_device_is_compatible(dev->of_node, "sony,imx585-mono");
> +	dev_info(dev, "mono=%d\n", imx585->mono);

Heh? So you debug driver matching and probing?


> +
> +	imx585->sync_mode = SYNC_INT_LEADER;
> +	if (!device_property_read_string(dev, "sony,sync-mode", &sync_mode)) {
> +		if (!strcmp(sync_mode, "internal-follower"))
> +			imx585->sync_mode = SYNC_INT_FOLLOWER;
> +		else if (!strcmp(sync_mode, "external"))
> +			imx585->sync_mode = SYNC_EXTERNAL;
> +	}
> +	dev_info(dev, "sync-mode: %s\n", sync_mode_menu[imx585->sync_mode]);

No, drop. This is STATIC coming from DT. It will be always like that,
what is the point of debugging DT?

> +
> +	ret = imx585_check_hwcfg(dev, imx585);
> +	if (ret)
> +		return ret;
> +
> +	imx585->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(imx585->regmap))
> +		return dev_err_probe(dev, PTR_ERR(imx585->regmap), "CCI init failed\n");
> +
> +	imx585->xclk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(imx585->xclk))
> +		return dev_err_probe(dev, PTR_ERR(imx585->xclk), "xclk missing\n");
> +
> +	imx585->xclk_freq = clk_get_rate(imx585->xclk);
> +	for (i = 0; i < ARRAY_SIZE(imx585_inck_table); ++i) {
> +		if (imx585_inck_table[i].xclk_hz == imx585->xclk_freq) {
> +			imx585->inck_sel_val = imx585_inck_table[i].inck_sel;
> +			break;
> +		}
> +	}
> +	if (i == ARRAY_SIZE(imx585_inck_table))
> +		return dev_err_probe(dev, -EINVAL, "unsupported XCLK %u Hz\n", imx585->xclk_freq);
> +
> +	dev_info(dev, "XCLK %u Hz -> INCK_SEL 0x%02x\n",
> +		 imx585->xclk_freq, imx585->inck_sel_val);

No, drop

> +
> +	ret = imx585_get_regulators(imx585);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "regulators\n");
> +
> +	imx585->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +
> +	/* Power on to probe the device */
> +	ret = imx585_power_on(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = imx585_check_module_exists(imx585);
> +	if (ret)
> +		goto err_power_off;
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	ret = imx585_init_controls(imx585);
> +	if (ret)
> +		goto err_pm;
> +
> +	imx585->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	imx585->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	imx585->sd.internal_ops = &imx585_internal_ops;
> +
> +	imx585->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&imx585->sd.entity, 1, &imx585->pad);
> +	if (ret) {
> +		dev_err(dev, "entity pads init failed: %d\n", ret);
> +		goto err_ctrls;
> +	}
> +
> +	imx585->sd.state_lock = imx585->ctrl_handler.lock;
> +	ret = v4l2_subdev_init_finalize(&imx585->sd);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "subdev init\n");
> +		goto err_entity;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor(&imx585->sd);
> +	if (ret) {
> +		dev_err(dev, "sensor subdev register failed: %d\n", ret);
> +		goto err_entity;
> +	}
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +	return 0;
> +
> +err_entity:
> +	media_entity_cleanup(&imx585->sd.entity);
> +err_ctrls:
> +	imx585_free_controls(imx585);
> +err_pm:
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +err_power_off:
> +	imx585_power_off(dev);
> +	return ret;
> +}
> +
> +static void imx585_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx585 *imx585 = to_imx585(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	imx585_free_controls(imx585);
> +
> +	pm_runtime_disable(imx585->clientdev);
> +	if (!pm_runtime_status_suspended(imx585->clientdev))
> +		imx585_power_off(imx585->clientdev);
> +	pm_runtime_set_suspended(imx585->clientdev);
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx585_pm_ops, imx585_power_off,
> +				 imx585_power_on, NULL);
> +
> +static const struct of_device_id imx585_of_match[] = {
> +	{ .compatible = "sony,imx585" },
> +	{ .compatible = "sony,imx585-mono" }, /* monochrome variant */
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx585_of_match);
> +
> +static struct i2c_driver imx585_i2c_driver = {
> +	.driver = {
> +		.name  = "imx585",
> +		.pm    = pm_ptr(&imx585_pm_ops),
> +		.of_match_table = imx585_of_match,
> +	},
> +	.probe  = imx585_probe,
> +	.remove = imx585_remove,
> +};
> +module_i2c_driver(imx585_i2c_driver);
> +
> +MODULE_AUTHOR("Will Whang <will@willwhang.com>");
> +MODULE_AUTHOR("Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>");
> +MODULE_DESCRIPTION("Sony IMX585 sensor driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.39.5
> 

