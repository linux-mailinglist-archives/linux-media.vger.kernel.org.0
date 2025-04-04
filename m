Return-Path: <linux-media+bounces-29417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC446A7C148
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 18:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 624601799C8
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 16:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB64C207A32;
	Fri,  4 Apr 2025 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dLLqTbxc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-81.smtpout.orange.fr [80.12.242.81])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970B41FE44D;
	Fri,  4 Apr 2025 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743782980; cv=none; b=u8p1pvM0YcERYpuZqO2ilAl8I1gtW024J6+vaYzgIHtm3CMtVqEaWrrX0JDqbOU37SCe94S1vkR1u4IGsX3jGVS+E3V72bD75VD210c8/KTBOZiuhWrlWha1KK3I/O/tdiJfdNl5bqw2aB3kwUUXsxrT/NS8lYVKjiEl/iTPxYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743782980; c=relaxed/simple;
	bh=eyNWkamsIncNPiOt+xFesAmuq5FxdHvBFGZeakFV6So=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=CuzyKrV/Ldpa5y20qmnC+uArKVdZsdlRjpjlJyGld6ZErwy6+EvbExAOUlwKycIPtqZ7+a3z2PU/xbA4hsFzwje+4kN0XQzixzs+bGHjU1A/L3tDJvRm14Vf1sJyDgRMtqoGRcT6w5OPPyfQvLsZ/OQY7RJsPbVVuZ4j5LvVnYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=dLLqTbxc; arc=none smtp.client-ip=80.12.242.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 0jbkuwMu44ggN0jbnuYpd4; Fri, 04 Apr 2025 18:09:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743782973;
	bh=R2NkmJsMvfh4t8otA7eSeQVdLEM/vde8d4/VGclQcLs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=dLLqTbxcwUVOGYTEzDVHbOmMMlbDiBoKpgYdPy1su929m121GKESlgFo8/8HmB1sH
	 VLY2KILrj0l6bkhabMpmBApSul2DA8QOzi3PX3wRxw10T+GxySyJx9m2s+bsdfbaRu
	 ZnYG62goaMdy/KB7NtumNB+htSbw1PKt3dRsdWn+8yVgB1ZYFys+GZcAMQA5A9s6Up
	 C1V/wIaWG8VskIABVdPtGUj9cTGbwJS/MWLVCZrkzGa6py3LWKP9AJIrXy6Y62CQZZ
	 P8evZVD0VpypPWsjH4prncS7IBbkJ9sPgov60i6sB1+fvyYsIRyWohDUGlbLJu8jys
	 MSBlM+tMOl3GA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 04 Apr 2025 18:09:33 +0200
X-ME-IP: 90.11.132.44
Message-ID: <33abd6fc-9ab3-497e-b421-0816a32b8141@wanadoo.fr>
Date: Fri, 4 Apr 2025 18:09:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] media: i2c: Add driver for ST VD55G1 camera sensor
References: <20250404-b4-vd55g1-v5-0-98f2f02eec59@foss.st.com>
 <20250404-b4-vd55g1-v5-2-98f2f02eec59@foss.st.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, robh@kernel.org, sakari.ailus@linux.intel.com,
 sylvain.petinot@foss.st.com
In-Reply-To: <20250404-b4-vd55g1-v5-2-98f2f02eec59@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/04/2025 à 16:50, Benjamin Mugnier a écrit :
> The VD55G1 is a monochrome global shutter camera with a 804x704 maximum
> resolution with RAW8 and RAW10 bytes per pixel.
> The driver supports :
> - Auto exposure from the sensor, or manual exposure mode
> - HDR subtraction mode, allowing edge detection and background removal
> - Auto exposure cold start, using configuration values from last stream
> to start the next one
> - LED GPIOs for illumination
> - Most standard camera sensor features (hblank, vblank, test patterns,
> again, dgain, hflip, vflip, auto exposure bias, etc.)
> Add driver source code to MAINTAINERS file.

Hi, a few nitpicks below, should they make sense.

...

> +static int vd55g1_prepare_clock_tree(struct vd55g1 *sensor)
> +{
> +	struct i2c_client *client = sensor->i2c_client;
> +	/* Double data rate */
> +	u32 mipi_freq = sensor->link_freq * 2;
> +	u32 sys_clk, mipi_div, pixel_div;
> +	int ret = 0;
> +
> +	if (sensor->xclk_freq < 6 * HZ_PER_MHZ ||
> +	    sensor->xclk_freq > 27 * HZ_PER_MHZ) {
> +		dev_err(&client->dev,
> +			"Only 6Mhz-27Mhz clock range supported. Provided %lu MHz\n",
> +			sensor->xclk_freq / HZ_PER_MHZ);
> +		return -EINVAL;
> +	}
> +
> +	if (mipi_freq < 250 * HZ_PER_MHZ ||
> +	    mipi_freq > 1200 * HZ_PER_MHZ) {
> +		dev_err(&client->dev,
> +			"Only 250Mhz-1200Mhz link frequency range supported. Provided %lu MHz\n",
> +			mipi_freq / HZ_PER_MHZ);
> +		return -EINVAL;
> +	}
> +
> +	if (mipi_freq <= 300 * HZ_PER_MHZ)
> +		mipi_div = 4;
> +	else if (mipi_freq <= 600 * HZ_PER_MHZ)
> +		mipi_div = 2;
> +	else
> +		mipi_div = 1;
> +
> +	sys_clk = mipi_freq * mipi_div;
> +
> +	if (sys_clk <= 780 * HZ_PER_MHZ)
> +		pixel_div = 5;
> +	else if (sys_clk <= 900 * HZ_PER_MHZ)
> +		pixel_div = 6;
> +	else
> +		pixel_div = 8;
> +
> +	sensor->pixel_clock = sys_clk / pixel_div;
> +	/* Frequency to data rate is 1:1 ratio for MIPI */
> +	sensor->data_rate_in_mbps = mipi_freq;
> +
> +	return ret;

Could be return 0, and ret could be removed.

> +}

...

> +static int vd55g1_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
> +{
> +	struct vd55g1 *sensor = to_vd55g1(sd);
> +	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
> +	int ret = 0;

Un-needed init, it is set just the line after.

> +
> +	ret = pm_runtime_resume_and_get(&client->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	vd55g1_write(sensor, VD55G1_REG_EXT_CLOCK, sensor->xclk_freq, &ret);
> +
> +	/* configure output */
> +	vd55g1_write(sensor, VD55G1_REG_MIPI_DATA_RATE,
> +		     sensor->data_rate_in_mbps, &ret);
> +	vd55g1_write(sensor, VD55G1_REG_OIF_CTRL, sensor->oif_ctrl, &ret);
> +	vd55g1_write(sensor, VD55G1_REG_ISL_ENABLE, 0, &ret);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	ret = vd55g1_set_framefmt(sensor);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	/* Setup default GPIO values; could be overridden by V4L2 ctrl setup */
> +	ret = vd55g1_update_gpios(sensor, GENMASK(VD55G1_NB_GPIOS - 1, 0));
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	ret = vd55g1_apply_cold_start(sensor);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	/* Apply settings from V4L2 ctrls */
> +	ret = __v4l2_ctrl_handler_setup(&sensor->ctrl_handler);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	/* Also apply settings from read-only V4L2 ctrls */
> +	ret = vd55g1_ro_ctrls_setup(sensor);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	/* Start streaming */
> +	vd55g1_write(sensor, VD55G1_REG_STBY, VD55G1_STBY_START_STREAM, &ret);
> +	vd55g1_poll_reg(sensor, VD55G1_REG_STBY, 0, &ret);
> +	vd55g1_wait_state(sensor, VD55G1_SYSTEM_FSM_STREAMING, &ret);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	vd55g1_lock_ctrls(sensor, true);
> +
> +	return ret;

return 0?

> +
> +err_rpm_put:
> +	pm_runtime_put(&client->dev);
> +	return ret;
> +}


...

> +static int vd55g1_check_csi_conf(struct vd55g1 *sensor,
> +				 struct fwnode_handle *endpoint)
> +{
> +	struct i2c_client *client = sensor->i2c_client;
> +	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
> +	u8 n_lanes;
> +	int ret = 0;

Un-needed init, it is set just the line after.

> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
> +	if (ret)
> +		return -EINVAL;
> +
> +	/* Check lanes number */
> +	n_lanes = ep.bus.mipi_csi2.num_data_lanes;
> +	if (n_lanes != 1) {
> +		dev_err(&client->dev, "Sensor only supports 1 lane, found %d\n",
> +			n_lanes);
> +		ret = -EINVAL;
> +		goto done;
> +	}
> +
> +	/* Clock lane must be first */
> +	if (ep.bus.mipi_csi2.clock_lane != 0) {
> +		dev_err(&client->dev, "Clock lane must be mapped to lane 0\n");
> +		ret = -EINVAL;
> +		goto done;
> +	}
> +
> +	/* Handle polarities in sensor configuration */
> +	sensor->oif_ctrl = (ep.bus.mipi_csi2.lane_polarities[0] << 3) |
> +			   (ep.bus.mipi_csi2.lane_polarities[1] << 6);
> +
> +	/* Check the link frequency set in device tree */
> +	if (!ep.nr_of_link_frequencies) {
> +		dev_err(&client->dev, "link-frequency property not found in DT\n");
> +		ret = -EINVAL;
> +		goto done;
> +	}
> +	if (ep.nr_of_link_frequencies != 1) {
> +		dev_err(&client->dev, "Multiple link frequencies not supported\n");
> +		ret = -EINVAL;
> +		goto done;
> +	}
> +	sensor->link_freq = ep.link_frequencies[0];
> +
> +done:
> +	v4l2_fwnode_endpoint_free(&ep);
> +
> +	return ret;
> +}
...

> +static int vd55g1_parse_dt(struct vd55g1 *sensor)
> +{
> +	struct i2c_client *client = sensor->i2c_client;
> +	struct device *dev = &client->dev;
> +	struct fwnode_handle *endpoint;
> +	int ret;
> +
> +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> +	if (!endpoint) {
> +		dev_err(dev, "Endpoint node not found\n");

The usage of trailing \n with dev_err() and dev_err_probe() is not 
consistant in this driver.

I would go for \n everywhere, but some people argue that it is no more 
necessary.

> +		return -EINVAL;
> +	}
> +
> +	ret = vd55g1_check_csi_conf(sensor, endpoint);
> +	fwnode_handle_put(endpoint);
> +	if (ret)
> +		return ret;
> +
> +	return vd55g1_parse_dt_gpios(sensor);
> +}
> +
> +static int vd55g1_subdev_init(struct vd55g1 *sensor)
> +{
> +	struct i2c_client *client = sensor->i2c_client;
> +	int ret;
> +
> +	/* Init sub device */
> +	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sensor->sd.internal_ops = &vd55g1_internal_ops;
> +
> +	/* Init source pad */
> +	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to init media entity : %d", ret);

Unneeded space before : (to be consitant with code below)

> +		return ret;
> +	}
> +
> +	sensor->sd.state_lock = sensor->ctrl_handler.lock;
> +	ret = v4l2_subdev_init_finalize(&sensor->sd);
> +	if (ret) {
> +		dev_err(&client->dev, "Subdev init error: %d", ret);
> +		goto err_ctrls;
> +	}
> +
> +	/*
> +	 * Initiliaze controls after v4l2_subdev_init_finalize() to make sure

Initialize?

> +	 * default values are set.
> +	 */
> +	ret = vd55g1_init_ctrls(sensor);
> +	if (ret) {
> +		dev_err(&client->dev, "Controls initialization failed %d", ret);
> +		goto err_media;
> +	}
> +
> +	return ret;

return 0?

> +
> +err_ctrls:
> +	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
> +
> +err_media:
> +	media_entity_cleanup(&sensor->sd.entity);
> +	return ret;
> +}

...

CJ


