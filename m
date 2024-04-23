Return-Path: <linux-media+bounces-9945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A190A8AE8FE
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 16:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CAA71F22DEC
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 14:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B8F13B5BD;
	Tue, 23 Apr 2024 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="wXro8bWK"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C116F138499;
	Tue, 23 Apr 2024 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713880888; cv=none; b=P0PGQfTMrmXHesuC6Zquk0ffOrtz/UAD//pxIR382E0keANTKveEEwT6j6mDJrUntQG68ya0feOfyOmRxVJvqCGMGK/2rVb0jFWuLGM4hW98GaF3Yv3oXMPHF8yZ6EUwEnM+Sq9Xgzw0Vhgkdxbjb/VhZUg8Wu1zbMkPKP6IHG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713880888; c=relaxed/simple;
	bh=3Mxp/5KOWYooC0HCVj8fBOTmc24NElr/mh1pdB2FpWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCTKYGPqCDg3+3v+bHe+xKIOnf9cVoIFefj5eSCMmTKaJUg1kpAmnaKn5RJH/BUkAho/jcrrN+yrvkIwU6vcr9IfLmK7oLDsx/h57/Y7wb12yIfuc8GWPfmVv2oPOs3ox3ZNKXyRWYq1PGFZMf6jtkb7DDWoMBMx+ocNliXLSt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=wXro8bWK; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713880878;
	bh=3Mxp/5KOWYooC0HCVj8fBOTmc24NElr/mh1pdB2FpWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wXro8bWKDlJ5DEpDLLzbZ+zQ6f+anB3gVnfw0FQSmCIaUZ2CdqYshlXQvopgd87SS
	 fiq1vq2NhKodOjKozbbJ0Dd3GMigVcDF2MpznOYW/8gApJTOaQ0VmTWoMNEiNMSEuW
	 0Bz+rJfH3kvUaIhy+ruAO68PHd5Sq5zjaLA9CDTntqGH5aFas9aEm+SU8X5/DWjy78
	 4yDXzVHb9j8RTFCQmWNxrpj8aKq0e0hQwPUIknxYgdBZbmsd7Lj5creXcoZNiC6cvV
	 NWGrD8/Gr3Zq8yO3s2sz+zIhD5p+55/L7H0J2Z/UaCpFcA7ud2Ypkz471PO3v8Ykea
	 26Kbxurazl31Q==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EEB8837820F9;
	Tue, 23 Apr 2024 14:01:17 +0000 (UTC)
Message-ID: <a70e3792-b938-4c20-840d-5dfa9bdc4b9c@collabora.com>
Date: Tue, 23 Apr 2024 16:01:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] media: i2c: add MAX96714 driver
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org, mchehab@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20240325131634.165361-1-julien.massot@collabora.com>
 <20240325131634.165361-5-julien.massot@collabora.com>
 <ZhkaR-83uciNFi2b@valkosipuli.retiisi.eu>
Content-Language: en-US
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <ZhkaR-83uciNFi2b@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 4/12/24 13:25, Sakari Ailus wrote:
> Hi Julien,
> 
> On Mon, Mar 25, 2024 at 02:16:34PM +0100, Julien Massot wrote:
>> +static int max96714_apply_patgen_timing(struct max96714_priv *priv,
>> +					struct v4l2_subdev_state *state)
>> +{
>> +	struct v4l2_mbus_framefmt *fmt =
>> +		v4l2_subdev_state_get_format(state, MAX96714_PAD_SOURCE);
>> +	const u32 h_active = fmt->width;
>> +	const u32 h_fp = 88;
>> +	const u32 h_sw = 44;
>> +	const u32 h_bp = 148;
>> +	u32 h_tot;
>> +
> 
> Extra newline.
Will remove
> 
>> +	const u32 v_active = fmt->height;
>> +	const u32 v_fp = 4;
>> +	const u32 v_sw = 5;
>> +	const u32 v_bp = 36;
>> +	u32 v_tot;
>> +	int ret = 0;
>> +
>> +	h_tot = h_active + h_fp + h_sw + h_bp;
>> +	v_tot = v_active + v_fp + v_sw + v_bp;
>> +
>> +	/* 75 Mhz pixel clock */
>> +	cci_update_bits(priv->regmap, MAX96714_IO_CHK0,
>> +			MAX96714_PATTERN_CLK_FREQ, 1, &ret);
>> +
>> +	dev_info(&priv->client->dev, "height: %d width: %d\n", fmt->height,
>> +		 fmt->width);
>> +
>> +	cci_write(priv->regmap, MAX96714_PATGEN_VS_DLY, 0, &ret);
>> +	cci_write(priv->regmap, MAX96714_PATGEN_VS_HIGH, v_sw * h_tot, &ret);
>> +	cci_write(priv->regmap, MAX96714_PATGEN_VS_LOW,
>> +		  (v_active + v_fp + v_bp) * h_tot, &ret);
>> +	cci_write(priv->regmap, MAX96714_PATGEN_HS_HIGH, h_sw, &ret);
>> +	cci_write(priv->regmap, MAX96714_PATGEN_HS_LOW, h_active + h_fp + h_bp,
>> +		  &ret);
>> +	cci_write(priv->regmap, MAX96714_PATGEN_V2D,
>> +		  h_tot * (v_sw + v_bp) + (h_sw + h_bp), &ret);
>> +	cci_write(priv->regmap, MAX96714_PATGEN_HS_CNT, v_tot, &ret);
>> +	cci_write(priv->regmap, MAX96714_PATGEN_DE_HIGH, h_active, &ret);
>> +	cci_write(priv->regmap, MAX96714_PATGEN_DE_LOW, h_fp + h_sw + h_bp,
>> +		  &ret);
>> +	cci_write(priv->regmap, MAX96714_PATGEN_DE_CNT, v_active, &ret);
>> +	/* B G R */
>> +	cci_write(priv->regmap, MAX96714_PATGEN_CHKB_COLOR_A, 0xfecc00, &ret);
>> +	/* B G R */
>> +	cci_write(priv->regmap, MAX96714_PATGEN_CHKB_COLOR_B, 0x006aa7, &ret);
>> +	cci_write(priv->regmap, MAX96714_PATGEN_CHKB_RPT_CNT_A, 0x3c, &ret);
>> +	cci_write(priv->regmap, MAX96714_PATGEN_CHKB_RPT_CNT_B, 0x3c, &ret);
>> +	cci_write(priv->regmap, MAX96714_PATGEN_CHKB_ALT, 0x3c, &ret);
>> +	cci_write(priv->regmap, MAX96714_PATGEN_GRAD_INC, 0x10, &ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int max96714_apply_patgen(struct max96714_priv *priv,
>> +				 struct v4l2_subdev_state *state)
>> +{
>> +	unsigned int val;
>> +	int ret = 0;
>> +
>> +	if (priv->pattern)
>> +		ret = max96714_apply_patgen_timing(priv, state);
>> +
>> +	cci_write(priv->regmap, MAX96714_PATGEN_0, priv->pattern ? 0xfb : 0,
>> +		  &ret);
>> +
>> +	val = FIELD_PREP(MAX96714_PATGEN_MODE, priv->pattern);
>> +	cci_update_bits(priv->regmap, MAX96714_PATGEN_1, MAX96714_PATGEN_MODE,
>> +			val, &ret);
>> +	return ret;
>> +}
>> +
>> +static int max96714_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct max96714_priv *priv =
>> +		container_of(ctrl->handler, struct max96714_priv, ctrl_handler);
>> +	int ret;
>> +
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_TEST_PATTERN:
>> +		priv->pattern = ctrl->val;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = cci_update_bits(priv->regmap, MAX96714_MIPI_PHY0,
>> +			      MAX96714_FORCE_CSI_OUT,
>> +			      priv->pattern ? MAX96714_FORCE_CSI_OUT : 0, NULL);
>> +
>> +	/* Pattern generator doesn't work with tunnel mode */
>> +	return cci_update_bits(priv->regmap, MAX96714_MIPI_TX52,
>> +			       MAX96714_TUN_EN,
>> +			       priv->pattern ? 0 : MAX96714_TUN_EN, &ret);
>> +}
>> +
>> +static const char * const max96714_test_pattern[] = {
>> +	"Disabled",
>> +	"Checkerboard",
>> +	"Gradient"
>> +};
>> +
>> +static const struct v4l2_ctrl_ops max96714_ctrl_ops = {
>> +	.s_ctrl = max96714_s_ctrl,
>> +};
>> +
>> +static int max96714_enable_streams(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_state *state,
>> +				   u32 source_pad, u64 streams_mask)
>> +{
>> +	struct max96714_priv *priv = sd_to_max96714(sd);
>> +	u64 sink_streams;
>> +	int ret;
>> +
>> +	if (!priv->enabled_source_streams)
>> +		max96714_enable_tx_port(priv);
>> +
>> +	ret = max96714_apply_patgen(priv, state);
>> +	if (ret)
>> +		goto err;
>> +
>> +	if (!priv->pattern) {
>> +		if (!priv->rxport.source.sd) {
>> +			ret = -ENODEV;
>> +			goto err;
>> +		}
>> +
>> +		sink_streams =
>> +			v4l2_subdev_state_xlate_streams(state,
>> +							MAX96714_PAD_SOURCE,
>> +							MAX96714_PAD_SINK,
>> +							&streams_mask);
>> +
>> +		ret = v4l2_subdev_enable_streams(priv->rxport.source.sd,
>> +						 priv->rxport.source.pad,
>> +						 sink_streams);
>> +		if (ret)
>> +			goto err;
>> +	}
>> +
>> +	priv->enabled_source_streams |= streams_mask;
>> +
>> +	return 0;
>> +
>> +err:
>> +	if (!priv->enabled_source_streams)
>> +		max96714_disable_tx_port(priv);
>> +
>> +	return ret;
>> +}
>> +
>> +static int max96714_disable_streams(struct v4l2_subdev *sd,
>> +				    struct v4l2_subdev_state *state,
>> +				    u32 source_pad, u64 streams_mask)
>> +{
>> +	struct max96714_priv *priv = sd_to_max96714(sd);
>> +	u64 sink_streams;
>> +	int ret;
>> +
>> +	if (!priv->pattern && priv->rxport.source.sd) {
> 
> When will priv->rxport.source.sd be NULL here?

Indeed it should not, the priv->rxport.source.sd can only be null if:
- There is no serializer
- The stream has been started with pattern generator and the pattern 
generator
has been disabled while streaming.

In V7 I will drop this check and add another one to prevent disabling 
the pattern
generator while streaming.

> 
> ret can be declared here.
ok
> 
>> +		sink_streams =
>> +			v4l2_subdev_state_xlate_streams(state,
>> +							MAX96714_PAD_SOURCE,
>> +							MAX96714_PAD_SINK,
>> +							&streams_mask);
>> +
>> +		ret = v4l2_subdev_disable_streams(priv->rxport.source.sd,
>> +						  priv->rxport.source.pad,
>> +						  sink_streams);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	priv->enabled_source_streams &= ~streams_mask;
>> +
>> +	if (!priv->enabled_source_streams)
>> +		max96714_disable_tx_port(priv);
>> +
>> +	return 0;
>> +}
>> +
>> +static int max96714_set_fmt(struct v4l2_subdev *sd,
>> +			    struct v4l2_subdev_state *state,
>> +			    struct v4l2_subdev_format *format)
>> +{
>> +	struct max96714_priv *priv = sd_to_max96714(sd);
>> +	struct v4l2_mbus_framefmt *fmt;
>> +
>> +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
>> +	    priv->enabled_source_streams)
>> +		return -EBUSY;
>> +
>> +	/* No transcoding, source and sink formats must match. */
>> +	if (format->pad == MAX96714_PAD_SOURCE)
>> +		return v4l2_subdev_get_fmt(sd, state, format);
>> +
>> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	*fmt = format->format;
>> +
>> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
>> +							   format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	*fmt = format->format;
>> +
>> +	return 0;
>> +}
>> +
>> +static int _max96714_set_routing(struct v4l2_subdev *sd,
>> +				 struct v4l2_subdev_state *state,
>> +				 enum v4l2_subdev_format_whence which,
>> +				 struct v4l2_subdev_krouting *routing)
>> +{
>> +	static const struct v4l2_mbus_framefmt format = {
>> +		.width = 1280,
>> +		.height = 1080,
>> +		.code = MEDIA_BUS_FMT_Y8_1X8,
>> +		.field = V4L2_FIELD_NONE,
>> +	};
>> +	int ret;
>> +
>> +	/*
>> +	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
>> +	 * frame desc is made dynamically allocated.
>> +	 */
>> +	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
>> +		return -EINVAL;
>> +
>> +	ret = v4l2_subdev_routing_validate(sd, routing,
>> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
>> +}
>> +
>> +static int max96714_set_routing(struct v4l2_subdev *sd,
>> +				struct v4l2_subdev_state *state,
>> +				enum v4l2_subdev_format_whence which,
>> +				struct v4l2_subdev_krouting *routing)
>> +{
>> +	struct max96714_priv *priv = sd_to_max96714(sd);
>> +
>> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->enabled_source_streams)
>> +		return -EBUSY;
>> +
>> +	return _max96714_set_routing(sd, state, which, routing);
>> +}
>> +
>> +static int max96714_init_state(struct v4l2_subdev *sd,
>> +			       struct v4l2_subdev_state *state)
>> +{
>> +	struct v4l2_subdev_route routes[] = {
>> +		{
>> +			.sink_pad = MAX96714_PAD_SINK,
>> +			.sink_stream = 0,
>> +			.source_pad = MAX96714_PAD_SOURCE,
>> +			.source_stream = 0,
>> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
>> +		}
>> +	};
>> +	struct v4l2_subdev_krouting routing = {
>> +		.num_routes = ARRAY_SIZE(routes),
>> +		.routes = routes,
>> +	};
>> +
>> +	return _max96714_set_routing(sd, state, V4L2_SUBDEV_FORMAT_ACTIVE,
>> +				     &routing);
>> +}
>> +
>> +static const struct v4l2_subdev_pad_ops max96714_pad_ops = {
>> +	.enable_streams = max96714_enable_streams,
>> +	.disable_streams = max96714_disable_streams,
>> +
>> +	.set_routing = max96714_set_routing,
>> +	.get_fmt = v4l2_subdev_get_fmt,
>> +	.set_fmt = max96714_set_fmt,
>> +};
>> +
>> +static bool max96714_link_locked(struct max96714_priv *priv)
>> +{
>> +	u64 val = 0;
>> +
>> +	cci_read(priv->regmap, MAX96714_LINK_LOCK, &val, NULL);
>> +
>> +	return val & MAX96714_LINK_LOCK_BIT;
>> +}
>> +
>> +static void max96714_link_status(struct max96714_priv *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +
>> +	dev_info(dev, "Link locked:%d\n", max96714_link_locked(priv));
>> +}
>> +
>> +static bool max96714_pipe_locked(struct max96714_priv *priv)
>> +{
>> +	u64 val;
>> +
>> +	cci_read(priv->regmap, MAX96714_VIDEO_RX8, &val, NULL);
>> +
>> +	return val & MAX96714_VID_LOCK;
>> +}
>> +
>> +static void max96714_pipe_status(struct max96714_priv *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +
>> +	dev_info(dev, "Pipe vidlock:%d\n", max96714_pipe_locked(priv));
>> +}
>> +
>> +static void max96714_csi_status(struct max96714_priv *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	u64 freq = 0;
>> +
>> +	cci_read(priv->regmap, MAX96714_BACKTOP25, &freq, NULL);
>> +	freq = FIELD_GET(CSI_DPLL_FREQ_MASK, freq);
>> +
>> +	dev_info(dev, "CSI controller DPLL freq:%u00MHz CSIPHY enabled:%d\n",
>> +		 (u8)freq, max96714_tx_port_enabled(priv));
>> +}
>> +
>> +static int max96714_log_status(struct v4l2_subdev *sd)
>> +{
>> +	struct max96714_priv *priv = sd_to_max96714(sd);
>> +	struct device *dev = &priv->client->dev;
>> +
>> +	dev_info(dev, "Deserializer: max96714\n");
>> +
>> +	max96714_link_status(priv);
>> +	max96714_pipe_status(priv);
>> +	max96714_csi_status(priv);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_subdev_core_ops max96714_subdev_core_ops = {
>> +	.log_status = max96714_log_status,
>> +};
>> +
>> +static const struct v4l2_subdev_video_ops max96714_video_ops = {
>> +	.s_stream	= v4l2_subdev_s_stream_helper,
>> +};
>> +
>> +static const struct v4l2_subdev_internal_ops max96714_internal_ops = {
>> +	.init_state = max96714_init_state,
>> +};
>> +
>> +static const struct v4l2_subdev_ops max96714_subdev_ops = {
>> +	.video = &max96714_video_ops,
>> +	.core = &max96714_subdev_core_ops,
>> +	.pad = &max96714_pad_ops,
>> +};
>> +
>> +static const struct media_entity_operations max96714_entity_ops = {
>> +	.link_validate = v4l2_subdev_link_validate,
>> +};
>> +
>> +static int max96714_notify_bound(struct v4l2_async_notifier *notifier,
>> +				 struct v4l2_subdev *subdev,
>> +				 struct v4l2_async_connection *asd)
>> +{
>> +	struct max96714_priv *priv = sd_to_max96714(notifier->sd);
>> +	struct device *dev = &priv->client->dev;
>> +	int ret;
>> +
>> +	ret = media_entity_get_fwnode_pad(&subdev->entity,
>> +					  priv->rxport.source.ep_fwnode,
>> +					  MEDIA_PAD_FL_SOURCE);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to find pad for %s\n", subdev->name);
>> +		return ret;
>> +	}
>> +
>> +	priv->rxport.source.sd = subdev;
>> +	priv->rxport.source.pad = ret;
>> +
>> +	ret = media_create_pad_link(&priv->rxport.source.sd->entity,
>> +				    priv->rxport.source.pad, &priv->sd.entity,
>> +				    MAX96714_PAD_SINK,
>> +				    MEDIA_LNK_FL_ENABLED |
>> +				    MEDIA_LNK_FL_IMMUTABLE);
>> +	if (ret) {
>> +		dev_err(dev, "Unable to link %s:%u -> %s:%u\n",
>> +			priv->rxport.source.sd->name, priv->rxport.source.pad,
>> +			priv->sd.name, MAX96714_PAD_SINK);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_async_notifier_operations max96714_notify_ops = {
>> +	.bound = max96714_notify_bound,
>> +};
>> +
>> +static int max96714_v4l2_notifier_register(struct max96714_priv *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	struct max96714_rxport *rxport = &priv->rxport;
>> +	struct v4l2_async_connection *asd;
>> +	int ret;
>> +
>> +	if (!rxport->source.ep_fwnode)
>> +		return 0;
>> +
>> +	v4l2_async_subdev_nf_init(&priv->notifier, &priv->sd);
>> +
>> +	asd = v4l2_async_nf_add_fwnode(&priv->notifier,
>> +				       rxport->source.ep_fwnode,
>> +				       struct v4l2_async_connection);
>> +	if (IS_ERR(asd)) {
>> +		dev_err(dev, "Failed to add subdev: %pe", asd);
>> +		v4l2_async_nf_cleanup(&priv->notifier);
>> +		return PTR_ERR(asd);
>> +	}
>> +
>> +	priv->notifier.ops = &max96714_notify_ops;
>> +
>> +	ret = v4l2_async_nf_register(&priv->notifier);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to register subdev_notifier");
>> +		v4l2_async_nf_cleanup(&priv->notifier);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void max96714_v4l2_notifier_unregister(struct max96714_priv *priv)
>> +{
>> +	v4l2_async_nf_unregister(&priv->notifier);
>> +	v4l2_async_nf_cleanup(&priv->notifier);
> 
> It'd be nicer to call these directly IMO. Maybe we could introduce
> v4l2_async_nf_unregister_cleanup()? Feel free to post a patch. :-)
Ok, I will call these directly, and I will do the same for the MAX96717 
serializer.

I will post a patchset later introducing the 
`v4l2_async_nf_unregister_cleanup`
and converting all the drivers calling these two functions.

> 
>> +}
>> +
>> +static int max96714_create_subdev(struct max96714_priv *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	int ret;
>> +
>> +	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96714_subdev_ops);
>> +	priv->sd.internal_ops = &max96714_internal_ops;
>> +
>> +	v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
>> +	priv->sd.ctrl_handler = &priv->ctrl_handler;
>> +
>> +	v4l2_ctrl_new_int_menu(&priv->ctrl_handler, NULL, V4L2_CID_LINK_FREQ,
>> +			       0, 0, &priv->tx_link_freq);
>> +	if (priv->ctrl_handler.error) {
>> +		ret = priv->ctrl_handler.error;
>> +		goto err_free_ctrl;
>> +	}
> 
> No need to check handler's errors here, the similar check below is enough.
ok
> 
>> +
>> +	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler,
>> +				     &max96714_ctrl_ops,
>> +				     V4L2_CID_TEST_PATTERN,
>> +				     ARRAY_SIZE(max96714_test_pattern) - 1,
>> +				     0, 0, max96714_test_pattern);
>> +	if (priv->ctrl_handler.error) {
>> +		ret = priv->ctrl_handler.error;
>> +		goto err_free_ctrl;
>> +	}
>> +
>> +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>> +	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>> +	priv->sd.entity.ops = &max96714_entity_ops;
>> +
>> +	priv->pads[MAX96714_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>> +	priv->pads[MAX96714_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
>> +
>> +	ret = media_entity_pads_init(&priv->sd.entity,
>> +				     MAX96714_NPORTS,
>> +				     priv->pads);
>> +	if (ret)
>> +		goto err_free_ctrl;
>> +
>> +	priv->sd.state_lock = priv->sd.ctrl_handler->lock;
>> +
>> +	ret = v4l2_subdev_init_finalize(&priv->sd);
>> +	if (ret)
>> +		goto err_entity_cleanup;
>> +
>> +	ret = max96714_v4l2_notifier_register(priv);
>> +	if (ret) {
>> +		dev_err(dev, "v4l2 subdev notifier register failed: %d\n", ret);
>> +		goto err_subdev_cleanup;
>> +	}
>> +
>> +	ret = v4l2_async_register_subdev(&priv->sd);
>> +	if (ret) {
>> +		dev_err(dev, "v4l2_async_register_subdev error: %d\n", ret);
>> +		goto err_unreg_notif;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_unreg_notif:
>> +	max96714_v4l2_notifier_unregister(priv);
>> +err_subdev_cleanup:
>> +	v4l2_subdev_cleanup(&priv->sd);
>> +err_entity_cleanup:
>> +	media_entity_cleanup(&priv->sd.entity);
>> +err_free_ctrl:
>> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
>> +
>> +	return ret;
>> +};
>> +
>> +static void max96714_destroy_subdev(struct max96714_priv *priv)
>> +{
>> +	max96714_v4l2_notifier_unregister(priv);
>> +	v4l2_async_unregister_subdev(&priv->sd);
>> +
>> +	v4l2_subdev_cleanup(&priv->sd);
>> +
>> +	media_entity_cleanup(&priv->sd.entity);
>> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
>> +}
>> +
>> +static int max96714_i2c_mux_select(struct i2c_mux_core *mux, u32 chan)
>> +{
>> +	return 0;
>> +}
>> +
>> +static int max96714_i2c_mux_init(struct max96714_priv *priv)
>> +{
>> +	priv->mux = i2c_mux_alloc(priv->client->adapter, &priv->client->dev,
>> +				  1, 0, I2C_MUX_LOCKED | I2C_MUX_GATE,
>> +				  max96714_i2c_mux_select, NULL);
>> +	if (!priv->mux)
>> +		return -ENOMEM;
>> +
>> +	return i2c_mux_add_adapter(priv->mux, 0, 0, 0);
>> +}
>> +
>> +static int max96714_init_tx_port(struct max96714_priv *priv)
>> +{
>> +	struct v4l2_mbus_config_mipi_csi2 *mipi;
>> +	unsigned long lanes_used = 0;
>> +	unsigned int val, lane;
>> +	int ret;
>> +
>> +	ret = max96714_disable_tx_port(priv);
>> +
>> +	mipi = &priv->mipi_csi2;
>> +	val = div_u64(priv->tx_link_freq * 2, MHZ(100));
>> +
>> +	cci_update_bits(priv->regmap, MAX96714_BACKTOP25,
>> +			CSI_DPLL_FREQ_MASK, val, &ret);
>> +
>> +	val = FIELD_PREP(MAX96714_CSI2_LANE_CNT_MASK, mipi->num_data_lanes - 1);
>> +	cci_update_bits(priv->regmap, MAX96714_MIPI_LANE_CNT,
>> +			MAX96714_CSI2_LANE_CNT_MASK, val, &ret);
>> +
>> +	/* lanes polarity */
>> +	val = 0;
>> +	for (lane = 0; lane < mipi->num_data_lanes + 1; lane++) {
>> +		if (!mipi->lane_polarities[lane])
>> +			continue;
>> +		if (lane == 0)
>> +			/* clock lane */
>> +			val |= BIT(5);
>> +		else if (lane < 3)
>> +			/* Lane D0 and D1 */
>> +			val |= BIT(lane - 1);
>> +		else
>> +			/* D2 and D3 */
>> +			val |= BIT(lane);
>> +	}
>> +
>> +	cci_update_bits(priv->regmap, MAX96714_MIPI_POLARITY,
>> +			MAX96714_MIPI_POLARITY_MASK, val, &ret);
>> +
>> +	/* lanes mapping */
>> +	val = 0;
>> +	for (lane = 0; lane < mipi->num_data_lanes; lane++) {
>> +		val |= (mipi->data_lanes[lane] - 1) << (lane * 2);
>> +		lanes_used |= BIT(mipi->data_lanes[lane] - 1);
>> +	}
>> +
>> +	/* Unused lanes need to be mapped as well to not have
>> +	 * the same lanes mapped twice.
>> +	 */
>> +	for (; lane < 4; lane++) {
>> +		unsigned int idx = find_first_zero_bit(&lanes_used, 4);
>> +
>> +		val |= idx << (lane * 2);
>> +		lanes_used |= BIT(idx);
>> +	}
>> +
>> +	return cci_write(priv->regmap, MAX96714_MIPI_LANE_MAP, val, &ret);
>> +}
>> +
>> +static int max96714_rxport_enable_poc(struct max96714_priv *priv)
>> +{
>> +	struct max96714_rxport *rxport = &priv->rxport;
>> +
>> +	if (!rxport->poc)
>> +		return 0;
>> +
>> +	return regulator_enable(rxport->poc);
>> +}
>> +
>> +static int max96714_rxport_disable_poc(struct max96714_priv *priv)
>> +{
>> +	struct max96714_rxport *rxport = &priv->rxport;
>> +
>> +	if (!rxport->poc)
>> +		return 0;
>> +
>> +	return regulator_disable(rxport->poc);
>> +}
>> +
>> +static int max96714_parse_dt_txport(struct max96714_priv *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	struct v4l2_fwnode_endpoint vep = {
>> +		.bus_type = V4L2_MBUS_CSI2_DPHY
>> +	};
>> +	struct fwnode_handle *ep_fwnode;
>> +	u32 num_data_lanes;
>> +	int ret;
>> +
>> +	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
>> +						    MAX96714_PAD_SOURCE, 0, 0);
>> +	if (!ep_fwnode)
>> +		return -EINVAL;
>> +
>> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep_fwnode, &vep);
>> +	fwnode_handle_put(ep_fwnode);
>> +	if (ret) {
>> +		dev_err(dev, "tx: failed to parse endpoint data\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (vep.nr_of_link_frequencies != 1) {
>> +		ret = -EINVAL;
>> +		goto err_free_vep;
>> +	}
>> +
>> +	priv->tx_link_freq = vep.link_frequencies[0];
>> +	/* Min 50MHz, Max 1250MHz, 50MHz step */
>> +	if (priv->tx_link_freq < MHZ(50) || priv->tx_link_freq > MHZ(1250) ||
>> +	    (u32)priv->tx_link_freq % MHZ(50)) {
>> +		dev_err(dev, "tx: invalid link frequency\n");
>> +		ret = -EINVAL;
>> +		goto err_free_vep;
>> +	}
>> +
>> +	num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
>> +	if (num_data_lanes < 1 || num_data_lanes > 4) {
>> +		dev_err(dev,
>> +			"tx: invalid number of data lanes must be 1 to 4\n");
>> +		ret = -EINVAL;
>> +		goto err_free_vep;
>> +	}
>> +
>> +	memcpy(&priv->mipi_csi2, &vep.bus.mipi_csi2, sizeof(priv->mipi_csi2));
>> +
>> +err_free_vep:
>> +	v4l2_fwnode_endpoint_free(&vep);
>> +
>> +	return ret;
>> +};
>> +
>> +static int max96714_parse_dt_rxport(struct max96714_priv *priv)
>> +{
>> +	static const char *poc_name = "port0-poc";
>> +	struct max96714_rxport *rxport = &priv->rxport;
>> +	struct device *dev = &priv->client->dev;
>> +	struct fwnode_handle *ep_fwnode;
>> +	int ret;
>> +
>> +	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
>> +						    MAX96714_PAD_SINK, 0, 0);
>> +	if (!ep_fwnode)
>> +		return -ENOENT;
>> +
>> +	rxport->source.ep_fwnode = fwnode_graph_get_remote_endpoint(ep_fwnode);
>> +	fwnode_handle_put(ep_fwnode);
>> +
>> +	if (!rxport->source.ep_fwnode) {
>> +		dev_err(dev, "rx: no remote endpoint\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	rxport->poc = devm_regulator_get_optional(dev, poc_name);
>> +	if (IS_ERR(rxport->poc)) {
>> +		ret = PTR_ERR(rxport->poc);
>> +		if (ret == -ENODEV) {
>> +			rxport->poc = NULL;
>> +		} else {
>> +			dev_err(dev, "rx: failed to get POC supply: %d\n", ret);
>> +			goto err_put_source_ep_fwnode;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +err_put_source_ep_fwnode:
>> +	fwnode_handle_put(rxport->source.ep_fwnode);
>> +	return ret;
>> +}
>> +
>> +static int max96714_parse_dt(struct max96714_priv *priv)
>> +{
>> +	int ret;
>> +
>> +	ret = max96714_parse_dt_txport(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = max96714_parse_dt_rxport(priv);
>> +	/* The deserializer can create a test pattern even if the
> 
> /*
>   * Multi-line
>   * comment.
>   */
> 
ok
>> +	 * rx port is not connected to a serializer.
>> +	 */
>> +	if (ret && ret == -ENOENT)
>> +		ret = 0;
>> +
>> +	return ret;
>> +}
>> +
>> +static int max96714_enable_core_hw(struct max96714_priv *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	u64 val;
>> +	int ret;
>> +
>> +	if (priv->pd_gpio) {
>> +		/* wait min 2 ms for reset to complete */
>> +		gpiod_set_value_cansleep(priv->pd_gpio, 1);
>> +		fsleep(2000);
>> +		gpiod_set_value_cansleep(priv->pd_gpio, 0);
>> +		/* wait min 2 ms for power up to finish */
>> +		fsleep(2000);
>> +	}
>> +
>> +	ret = cci_read(priv->regmap, MAX96714_REG13, &val, NULL);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "Cannot read first register, abort\n");
>> +		goto err_pd_gpio;
>> +	}
>> +
>> +	if (val != MAX96714_DEVICE_ID && val != MAX96714F_DEVICE_ID) {
>> +		dev_err(dev, "Unsupported device id expected %x got %x\n",
>> +			MAX96714F_DEVICE_ID, (u8)val);
>> +		ret = -EOPNOTSUPP;
>> +		goto err_pd_gpio;
>> +	}
>> +
>> +	ret = cci_read(priv->regmap, MAX96714_DEV_REV, &val, NULL);
>> +	if (ret)
>> +		goto err_pd_gpio;
>> +
>> +	dev_dbg(dev, "Found %x (rev %lx)\n", MAX96714F_DEVICE_ID,
>> +		(u8)val & MAX96714_DEV_REV_MASK);
>> +
>> +	ret = cci_read(priv->regmap, MAX96714_MIPI_TX52, &val, NULL);
>> +	if (ret)
>> +		goto err_pd_gpio;
>> +
>> +	if (!(val & MAX96714_TUN_EN)) {
>> +		dev_err(dev, "Only supporting tunnel mode");
>> +		ret = -EOPNOTSUPP;
>> +		goto err_pd_gpio;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_pd_gpio:
>> +	gpiod_set_value_cansleep(priv->pd_gpio, 1);
>> +	return ret;
>> +}
>> +
>> +static void max96714_disable_core_hw(struct max96714_priv *priv)
>> +{
>> +	gpiod_set_value_cansleep(priv->pd_gpio, 1);
>> +}
>> +
>> +static int max96714_get_hw_resources(struct max96714_priv *priv)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +
>> +	priv->regmap = devm_cci_regmap_init_i2c(priv->client, 16);
>> +	if (IS_ERR(priv->regmap))
>> +		return PTR_ERR(priv->regmap);
>> +
>> +	priv->pd_gpio =
>> +		devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(priv->pd_gpio))
>> +		return dev_err_probe(dev, PTR_ERR(priv->pd_gpio),
>> +				     "Cannot get powerdown GPIO\n");
>> +	return 0;
>> +}
>> +
>> +static int max96714_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct max96714_priv *priv;
>> +	int ret;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->client = client;
>> +
>> +	ret = max96714_get_hw_resources(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = max96714_enable_core_hw(priv);
> 
> Please switch to runtime PM.

Ok, the v7 will use runtime PM and I will use the powerdown gpio
to poweroff the device. However it implies to move some functions arround
e.g initialize the tx or the pattern generator ..
So it it will be done as separate patches.

Playing with the pm_runtime operation also showed up that the connection
doesn't always resume properly, I will extra patches to fix that.

> 
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = max96714_parse_dt(priv);
>> +	if (ret)
>> +		goto err_disable_core_hw;
>> +
>> +	max96714_init_tx_port(priv);
>> +
>> +	ret = max96714_rxport_enable_poc(priv);
>> +	if (ret)
>> +		goto err_free_ports;
>> +
>> +	ret = max96714_i2c_mux_init(priv);
>> +	if (ret)
>> +		goto err_disable_poc;
>> +
>> +	ret = max96714_create_subdev(priv);
>> +	if (ret)
>> +		goto err_del_mux;
>> +
>> +	return 0;
>> +
>> +err_del_mux:
>> +	i2c_mux_del_adapters(priv->mux);
>> +err_disable_poc:
>> +	max96714_rxport_disable_poc(priv);
>> +err_free_ports:
>> +	fwnode_handle_put(priv->rxport.source.ep_fwnode);
>> +err_disable_core_hw:
>> +	max96714_disable_core_hw(priv);
>> +
>> +	return ret;
>> +}
>> +
>> +static void max96714_remove(struct i2c_client *client)
>> +{
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct max96714_priv *priv = sd_to_max96714(sd);
>> +
>> +	max96714_destroy_subdev(priv);
>> +	i2c_mux_del_adapters(priv->mux);
>> +	max96714_rxport_disable_poc(priv);
>> +	fwnode_handle_put(priv->rxport.source.ep_fwnode);
>> +	max96714_disable_core_hw(priv);
>> +	gpiod_set_value_cansleep(priv->pd_gpio, 1);
>> +}
>> +
>> +static const struct of_device_id max96714_of_ids[] = {
>> +	{ .compatible = "maxim,max96714f" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, max96714_of_ids);
>> +
>> +static struct i2c_driver max96714_i2c_driver = {
>> +	.driver	= {
>> +		.name		= "max96714",
>> +		.of_match_table	= max96714_of_ids,
>> +	},
>> +	.probe		= max96714_probe,
>> +	.remove		= max96714_remove,
>> +};
>> +
>> +module_i2c_driver(max96714_i2c_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Maxim Integrated GMSL2 Deserializers Driver");
>> +MODULE_AUTHOR("Julien Massot <julien.massot@collabora.com>");
> 
Best Regards,
-- 
Julien

