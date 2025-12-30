Return-Path: <linux-media+bounces-49713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C683CE9A58
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D22630155BE
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 12:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115532ED159;
	Tue, 30 Dec 2025 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vduaqgsa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7502ED161;
	Tue, 30 Dec 2025 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767097491; cv=none; b=RDsw9LqfLBsl4oWumiZ0HAX77IBe0rWoi0wMEvp+Q6pvbvvRl/QVGuzyLI/b8CBIIaQ1djhHeMmBVmBrKoqEFMZUoww7o7rsLxooY9Xv3zQBD1cXvJC6QLbtsq/HmhedT4MfJ4+ufFUvqGfSvfQQSq93NSwVnqTxtVW4ptDRnfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767097491; c=relaxed/simple;
	bh=6+6xt+LiW38aHxA6iMQZ1KurJ98AJNKevf3nxZTuUTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s05cQC9tjE3HPs/IO+jEOAx5CmFGlnwEfayU2qh1AUm1Tpydz49AWc4ywbHX3d1ENc8gc/7seN9IYf+YHUIfxOiiW71YG8KVwF5nY6Wi1hdbX4OHdoqly7KxR+kg93QRKtKVYZ3f86m/NHpRIpOC0LqiSX/9tui8dWZM6Dg2k2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vduaqgsa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767097490; x=1798633490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6+6xt+LiW38aHxA6iMQZ1KurJ98AJNKevf3nxZTuUTU=;
  b=VduaqgsaCVYXKkOueR6gisWXEHsX8Q5jJmLQp0OUC7+0EawXrLD5Ktmm
   SF7ImJQolZKbRE5zQEYJ+U0rxEwV2S469rZm9ieqS8bMqA+Fp/dfj51fm
   w6fH0tpdalEA+QI+1k7ZF+D+KGelZb1b0r3lPlUrbn8P4d+zqgVR9H5lY
   I/TmFgGZyDQMlYziScecfKXj3sryYUZALwnNGDPEeSK9z2/kHecS2Tl9I
   2x7lcBI2Ng9C0BLWQ0LdugCmEfVyAsXmfxQozRD7YSNZ4DfyIHTK94sKQ
   KJTq3IL52dY91rIdnW9tK/va17X2wFg75fOWUIwAX7tZRy7wc0yUbjabe
   A==;
X-CSE-ConnectionGUID: 5A6+n8MiTIuq/V6XSSzeoA==
X-CSE-MsgGUID: ymFNWqlLTgOppx0jw+VhZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68730433"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="68730433"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:24:47 -0800
X-CSE-ConnectionGUID: xMcXjUpWRgG9vZduR4k1Ug==
X-CSE-MsgGUID: +X2p9811TxejztLvgvSQyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="224701204"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:24:42 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2186F121D81;
	Tue, 30 Dec 2025 14:24:50 +0200 (EET)
Date: Tue, 30 Dec 2025 14:24:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: robh@kernel.org, krzk+dt@kernel.org,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] media: i2c: add os05b10 image sensor driver
Message-ID: <aVPEkhP2587xcF78@kekkonen.localdomain>
References: <20251219084526.22841-1-himanshu.bhavani@siliconsignals.io>
 <20251219084526.22841-3-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219084526.22841-3-himanshu.bhavani@siliconsignals.io>

Hi Himanshu,

Thanks for the set. A few comments below...

On Fri, Dec 19, 2025 at 02:15:19PM +0530, Himanshu Bhavani wrote:
> +static int os05b10_disable_streams(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state,
> +				   u32 pad, u64 streams_mask)
> +{
> +	struct os05b10 *os05b10 = to_os05b10(sd);
> +	int ret;
> +
> +	ret = cci_write(os05b10->cci, OS05B10_REG_CTRL_MODE,
> +			OS05B10_MODE_STANDBY, NULL);
> +	if (ret)
> +		dev_err(os05b10->dev, "%s failed to set stream off\n", __func__);

I'd drop the function name here, it's obvious where this comes from. Same
elsewhere.

> +
> +	pm_runtime_put(os05b10->dev);
> +
> +	return ret;
> +}
> +
> +static int os05b10_init_state(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_framefmt *format;
> +	const struct os05b10_mode *mode;
> +
> +	/* Initialize try_fmt */
> +	format = v4l2_subdev_state_get_format(state, 0);
> +
> +	mode = &supported_modes_10bit[0];
> +	format->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +
> +	/* Update image pad formate */
> +	format->width = mode->width;
> +	format->height = mode->height;
> +	format->field = V4L2_FIELD_NONE;
> +	format->colorspace = V4L2_COLORSPACE_RAW;
> +	format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	format->xfer_func = V4L2_XFER_FUNC_NONE;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops os05b10_video_ops = {
> +	.s_stream = v4l2_subdev_s_stream_helper,
> +};
> +
> +static const struct v4l2_subdev_pad_ops os05b10_pad_ops = {
> +	.enum_mbus_code = os05b10_enum_mbus_code,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = os05b10_set_pad_format,
> +	.get_selection = os05b10_get_selection,
> +	.enum_frame_size = os05b10_enum_frame_size,
> +	.enable_streams = os05b10_enable_streams,
> +	.disable_streams = os05b10_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_internal_ops os05b10_internal_ops = {
> +	.init_state = os05b10_init_state,
> +};
> +
> +static const struct v4l2_subdev_ops os05b10_subdev_ops = {
> +	.video = &os05b10_video_ops,
> +	.pad = &os05b10_pad_ops,
> +};
> +
> +static const struct v4l2_ctrl_ops os05b10_ctrl_ops = {
> +	.s_ctrl = os05b10_set_ctrl,
> +};
> +
> +static int os05b10_identify_module(struct os05b10 *os05b10)
> +{
> +	int ret;
> +	u64 val;
> +
> +	ret = cci_read(os05b10->cci, OS05B10_REG_CHIP_ID, &val, NULL);
> +	if (ret)
> +		return dev_err_probe(os05b10->dev, ret,
> +				     "failed to read chip id %x\n",
> +				     OS05B10_CHIP_ID);
> +
> +	if (val != OS05B10_CHIP_ID)
> +		return dev_err_probe(os05b10->dev, -ENODEV,
> +				     "chip id mismatch: %x!=%llx\n",
> +				     OS05B10_CHIP_ID, val);
> +
> +	return 0;
> +}
> +
> +static int os05b10_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct os05b10 *os05b10 = to_os05b10(sd);
> +	unsigned long delay_us;
> +	int ret;
> +
> +	/* Enable power rails */
> +	ret = regulator_bulk_enable(ARRAY_SIZE(os05b10_supply_name),
> +				    os05b10->supplies);
> +	if (ret) {
> +		dev_err(os05b10->dev, "failed to enable regulators\n");
> +		return ret;
> +	}
> +
> +	/* Enable xclk */
> +	ret = clk_prepare_enable(os05b10->xclk);
> +	if (ret) {
> +		dev_err(os05b10->dev, "failed to enable clock\n");
> +		goto err_regulator_off;
> +	}
> +
> +	gpiod_set_value_cansleep(os05b10->reset_gpio, 0);
> +
> +	/* Delay T1 */
> +	fsleep(5 * USEC_PER_MSEC);
> +
> +	/* Delay T2 (8192 cycles before SCCB/I2C access) */
> +	delay_us = DIV_ROUND_UP(8192, OS05B10_XCLK_FREQ / 1000 / 1000);
> +	usleep_range(delay_us, delay_us * 2);
> +
> +	return 0;
> +
> +err_regulator_off:
> +	regulator_bulk_disable(ARRAY_SIZE(os05b10_supply_name),
> +			       os05b10->supplies);
> +
> +	return ret;
> +}
> +
> +static int os05b10_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct os05b10 *os05b10 = to_os05b10(sd);
> +
> +	gpiod_set_value_cansleep(os05b10->reset_gpio, 1);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(os05b10_supply_name), os05b10->supplies);

Can you run

	$ ./scripts/checkpatch.pl --strict --max-line-length=80

on the set, please?

> +	clk_disable_unprepare(os05b10->xclk);
> +
> +	return 0;
> +}
> +
> +static int os05b10_parse_endpoint(struct os05b10 *os05b10)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	unsigned long link_freq_bitmap;
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	ep = fwnode_graph_get_next_endpoint(dev_fwnode(os05b10->dev), NULL);

Please use fwnode-graph_get_endpoint_by_id() instead.

> +	if (!ep) {
> +		dev_err(os05b10->dev, "Failed to get next endpoint\n");
> +		return -ENXIO;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> +		ret = dev_err_probe(os05b10->dev, -EINVAL,
> +				    "only 4 data lanes are supported\n");
> +		goto error_out;
> +	}
> +
> +	ret = v4l2_link_freq_to_bitmap(os05b10->dev, bus_cfg.link_frequencies,
> +				       bus_cfg.nr_of_link_frequencies,
> +				       link_frequencies,
> +				       ARRAY_SIZE(link_frequencies),
> +				       &link_freq_bitmap);
> +
> +	if (ret)
> +		dev_err(os05b10->dev, "only 600MHz frequency is available\n");
> +
> +error_out:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}

-- 
Kind regards,

Sakari Ailus

