Return-Path: <linux-media+bounces-66394-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N7NSBbOTRmqqYwsAu9opvQ
	(envelope-from <linux-media+bounces-66394-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:37:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3E26FA4B9
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:37:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=k1cXbi23;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66394-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66394-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1876E3029667
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 16:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46748346E60;
	Thu,  2 Jul 2026 16:31:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5615D35F8D2;
	Thu,  2 Jul 2026 16:31:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783009869; cv=none; b=fk4CPYiuDdD7lfYxF/u4gAuxJdJ8/lNr5KLiAe0E0hdku47ea6LjFBTA3lw9BXXWq2IjFB3CkJKCZwlXOqHU89+zSXrWjgrD7oWkCtAJKYQAGQgGWLsBJGr37jz7xBD22jnuz2reANS8DtYXtFX0SPGFN1O1K3QdyQfbV0E1+6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783009869; c=relaxed/simple;
	bh=wLqHajWW4D5V8MZjcHXthOGsL88hjN0jRmTPIpP/cQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sxr7ly77bpDrRP1jxRzpB2VVbc3gj1Tjs5YYUIVzS7WUjyIbGEQxCLPcTQCYlQd11bXJVfVL6hhwKatNPryQwAzzcLzVJ+cIm1tHoRSKr5TdYTxqfTUpEzNvoHEE2X1zVU9RJFcG5q8SQT3rlPW6xYok0tucXszfiW3eAFiUviQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1cXbi23; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5051F00A3A;
	Thu,  2 Jul 2026 16:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783009868;
	bh=lSrN+Wx3FLNVPc6Y2o+2IKzHFYXr2wdNW6krzZiWHGE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=k1cXbi23WiS4HBFv8PvIjLxLGyvVxzVkljd6Z3ANdNFlz83pqsAg6bhHLRWu9lOZx
	 reIbkKrah43h1WdCDrgSdbVGLgM3XQugpWp6RfAjryvhGJ7FKxC2ujPtAMek30yDXN
	 ZWOSBm7Miq8gf9s8gCbnhY5eLb00dPrcKiAh0r3SHAnvrx6VDBsn9BKWHv4oanWGmI
	 KUOSXAgq5Zo9Bc1euSOwCzL9g4hRVlGmxaBsLGiUQuYbpIokhiYLq9R0xlOH1NNE+K
	 jc/rc2/hjGpjUoCkEs7we6XD+Wm9O9egscQv+u/lbWAhinZ0ktlicit7XB2QQUigHI
	 5bfiS05RKJxFw==
Message-ID: <5019684c-ace6-4202-97ca-98016df77d86@kernel.org>
Date: Thu, 2 Jul 2026 17:31:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: i2c: og0ve1b: Introduce per-sensor data
 structure
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
 <ihkKqIy-tPImrDpB18hIeI3IQpv1F5GAZ2S7cNWB9n_LlHh3vVMT7G4bGeCBPJDT9GCPPtyA7s_raKqOiG69ng==@protonmail.internalid>
 <20260702-og0va1b-v2-2-0071442caa2a@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260702-og0va1b-v2-2-0071442caa2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66394-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:wenmeng.liu@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C3E26FA4B9

On 02/07/2026 11:52, Wenmeng Liu wrote:
> In preparation for supporting further OmniVision sensors that share most
> of this driver, move the sensor-specific parameters (chip id, MCLK
> frequency, test pattern register, link frequency menu and the list of
> supported modes) into a new struct og0ve1b_sensor_data, selected through
> i2c_get_match_data() at probe time.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/i2c/og0ve1b.c | 101 +++++++++++++++++++++++++++++---------------
>   1 file changed, 67 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
> index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..acc06b10bf896f734926289099a70fbc2bb628d5 100644
> --- a/drivers/media/i2c/og0ve1b.c
> +++ b/drivers/media/i2c/og0ve1b.c
> @@ -66,10 +66,21 @@ struct og0ve1b_mode {
>   	u32 hts;	/* Horizontal timing size */
>   	u32 vts;	/* Default vertical timing size */
>   	u32 bpp;	/* Bits per pixel */
> +	u32 code;	/* MEDIA_BUS_FMT code */
> 
>   	const struct og0ve1b_reg_list reg_list;	/* Sensor register setting */
>   };
> 
> +struct og0ve1b_sensor_data {
> +	u64 chip_id;
> +	unsigned long mclk_freq;
> +	u32 test_pattern_reg;
> +	const s64 *link_freq_menu;
> +	int num_link_freqs;
> +	const struct og0ve1b_mode *modes;
> +	int num_modes;
> +};
> +
>   static const char * const og0ve1b_test_pattern_menu[] = {
>   	"Disabled",
>   	"Vertical Colour Bars",
> @@ -97,8 +108,7 @@ struct og0ve1b {
>   	struct v4l2_ctrl *exposure;
>   	struct v4l2_ctrl_handler ctrl_handler;
> 
> -	/* Saved register value */
> -	u64 pre_isp;
> +	const struct og0ve1b_sensor_data *sensor;
>   };
> 
>   static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
> @@ -254,6 +264,7 @@ static const struct og0ve1b_mode supported_modes[] = {
>   		.hts = 792,
>   		.vts = 568,
>   		.bpp = 8,
> +		.code = MEDIA_BUS_FMT_Y8_1X8,
>   		.reg_list = {
>   			.regs = og0ve1b_640x480_120fps_mode,
>   			.num_regs = ARRAY_SIZE(og0ve1b_640x480_120fps_mode),
> @@ -261,23 +272,39 @@ static const struct og0ve1b_mode supported_modes[] = {
>   	},
>   };
> 
> +static const struct og0ve1b_sensor_data og0ve1b_data = {
> +	.chip_id	= OG0VE1B_CHIP_ID,
> +	.mclk_freq	= OG0VE1B_MCLK_FREQ_24MHZ,
> +	.test_pattern_reg = OG0VE1B_REG_PRE_ISP,
> +	.link_freq_menu	= og0ve1b_link_freq_menu,
> +	.num_link_freqs	= ARRAY_SIZE(og0ve1b_link_freq_menu),
> +	.modes		= supported_modes,
> +	.num_modes	= ARRAY_SIZE(supported_modes),
> +};
> +
>   static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
>   {
> -	u64 val = og0ve1b->pre_isp;
> +	u32 reg = og0ve1b->sensor->test_pattern_reg;
> +	u64 val;
> +	int ret;
> +
> +	ret = cci_read(og0ve1b->regmap, reg, &val, NULL);
> +	if (ret)
> +		return ret;
> 
>   	if (pattern)
>   		val |= OG0VE1B_TEST_PATTERN_ENABLE;
>   	else
>   		val &= ~OG0VE1B_TEST_PATTERN_ENABLE;
> 
> -	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
> +	return cci_write(og0ve1b->regmap, reg, val, NULL);
>   }
> 
>   static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct og0ve1b *og0ve1b = container_of(ctrl->handler, struct og0ve1b,
>   					       ctrl_handler);
> -	const struct og0ve1b_mode *mode = &supported_modes[0];
> +	const struct og0ve1b_mode *mode = &og0ve1b->sensor->modes[0];
>   	s64 exposure_max;
>   	int ret;
> 
> @@ -333,7 +360,8 @@ static const struct v4l2_ctrl_ops og0ve1b_ctrl_ops = {
>   static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>   {
>   	struct v4l2_ctrl_handler *ctrl_hdlr = &og0ve1b->ctrl_handler;
> -	const struct og0ve1b_mode *mode = &supported_modes[0];
> +	const struct og0ve1b_mode *mode = &og0ve1b->sensor->modes[0];
> +	const struct og0ve1b_sensor_data *sensor = og0ve1b->sensor;
>   	s64 exposure_max, pixel_rate, h_blank, v_blank;
>   	struct v4l2_fwnode_device_properties props;
>   	struct v4l2_ctrl *ctrl;
> @@ -343,12 +371,12 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
> 
>   	ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, &og0ve1b_ctrl_ops,
>   				      V4L2_CID_LINK_FREQ,
> -				      ARRAY_SIZE(og0ve1b_link_freq_menu) - 1,
> -				      0, og0ve1b_link_freq_menu);
> +				      sensor->num_link_freqs - 1,
> +				      0, sensor->link_freq_menu);
>   	if (ctrl)
>   		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> -	pixel_rate = og0ve1b_link_freq_menu[0] / mode->bpp;
> +	pixel_rate = sensor->link_freq_menu[0] / mode->bpp;
>   	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_PIXEL_RATE,
>   			  0, pixel_rate, 1, pixel_rate);
> 
> @@ -407,7 +435,7 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>   static void og0ve1b_update_pad_format(const struct og0ve1b_mode *mode,
>   				      struct v4l2_mbus_framefmt *fmt)
>   {
> -	fmt->code = MEDIA_BUS_FMT_Y8_1X8;
> +	fmt->code = mode->code;
>   	fmt->width = mode->width;
>   	fmt->height = mode->height;
>   	fmt->field = V4L2_FIELD_NONE;
> @@ -421,8 +449,8 @@ static int og0ve1b_enable_streams(struct v4l2_subdev *sd,
>   				  struct v4l2_subdev_state *state, u32 pad,
>   				  u64 streams_mask)
>   {
> -	const struct og0ve1b_reg_list *reg_list = &supported_modes[0].reg_list;
>   	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
> +	const struct og0ve1b_reg_list *reg_list = &og0ve1b->sensor->modes[0].reg_list;
>   	int ret;
> 
>   	ret = pm_runtime_resume_and_get(og0ve1b->dev);
> @@ -484,13 +512,14 @@ static int og0ve1b_set_pad_format(struct v4l2_subdev *sd,
>   				  struct v4l2_subdev_state *state,
>   				  struct v4l2_subdev_format *fmt)
>   {
> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>   	struct v4l2_mbus_framefmt *format;
>   	const struct og0ve1b_mode *mode;
> 
>   	format = v4l2_subdev_state_get_format(state, 0);
> 
> -	mode = v4l2_find_nearest_size(supported_modes,
> -				      ARRAY_SIZE(supported_modes),
> +	mode = v4l2_find_nearest_size(og0ve1b->sensor->modes,
> +				      og0ve1b->sensor->num_modes,
>   				      width, height,
>   				      fmt->format.width,
>   				      fmt->format.height);
> @@ -505,10 +534,12 @@ static int og0ve1b_enum_mbus_code(struct v4l2_subdev *sd,
>   				  struct v4l2_subdev_state *sd_state,
>   				  struct v4l2_subdev_mbus_code_enum *code)
>   {
> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
> +
>   	if (code->index > 0)
>   		return -EINVAL;
> 
> -	code->code = MEDIA_BUS_FMT_Y8_1X8;
> +	code->code = og0ve1b->sensor->modes[0].code;
> 
>   	return 0;
>   }
> @@ -517,15 +548,18 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
>   				   struct v4l2_subdev_state *sd_state,
>   				   struct v4l2_subdev_frame_size_enum *fse)
>   {
> -	if (fse->index >= ARRAY_SIZE(supported_modes))
> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
> +	const struct og0ve1b_sensor_data *sensor = og0ve1b->sensor;
> +
> +	if (fse->index >= sensor->num_modes)
>   		return -EINVAL;
> 
> -	if (fse->code != MEDIA_BUS_FMT_Y8_1X8)
> +	if (fse->code != sensor->modes[fse->index].code)
>   		return -EINVAL;
> 
> -	fse->min_width = supported_modes[fse->index].width;
> +	fse->min_width = sensor->modes[fse->index].width;
>   	fse->max_width = fse->min_width;
> -	fse->min_height = supported_modes[fse->index].height;
> +	fse->min_height = sensor->modes[fse->index].height;
>   	fse->max_height = fse->min_height;
> 
>   	return 0;
> @@ -534,13 +568,14 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
>   static int og0ve1b_init_state(struct v4l2_subdev *sd,
>   			      struct v4l2_subdev_state *state)
>   {
> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>   	struct v4l2_subdev_format fmt = {
>   		.which = V4L2_SUBDEV_FORMAT_TRY,
>   		.pad = 0,
>   		.format = {
> -			.code = MEDIA_BUS_FMT_Y8_1X8,
> -			.width = supported_modes[0].width,
> -			.height = supported_modes[0].height,
> +			.code = og0ve1b->sensor->modes[0].code,
> +			.width = og0ve1b->sensor->modes[0].width,
> +			.height = og0ve1b->sensor->modes[0].height,
>   		},
>   	};
> 
> @@ -586,18 +621,13 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
>   		return ret;
>   	}
> 
> -	if (val != OG0VE1B_CHIP_ID) {
> -		dev_err(og0ve1b->dev, "chip id mismatch: %x!=%llx\n",
> -			OG0VE1B_CHIP_ID, val);
> +	if (val != og0ve1b->sensor->chip_id) {
> +		dev_err(og0ve1b->dev, "chip id mismatch: %llx!=%llx\n",
> +			og0ve1b->sensor->chip_id, val);
>   		return -ENODEV;
>   	}
> 
> -	ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
> -		       &og0ve1b->pre_isp, NULL);
> -	if (ret)
> -		dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
> -
> -	return ret;
> +	return 0;

The one thing that is not immediately clear to me is if we get 
equivalent logic WRT OG0VE1B_REG_PRE_ISP after this change.


>   }
> 
>   static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
> @@ -624,8 +654,8 @@ static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
>   	ret = v4l2_link_freq_to_bitmap(og0ve1b->dev,
>   				       bus_cfg.link_frequencies,
>   				       bus_cfg.nr_of_link_frequencies,
> -				       og0ve1b_link_freq_menu,
> -				       ARRAY_SIZE(og0ve1b_link_freq_menu),
> +				       og0ve1b->sensor->link_freq_menu,
> +				       og0ve1b->sensor->num_link_freqs,
>   				       &freq_bitmap);
> 
>   	v4l2_fwnode_endpoint_free(&bus_cfg);
> @@ -686,6 +716,9 @@ static int og0ve1b_probe(struct i2c_client *client)
>   		return -ENOMEM;
> 
>   	og0ve1b->dev = &client->dev;
> +	og0ve1b->sensor = i2c_get_match_data(client);
> +	if (!og0ve1b->sensor)
> +		return -ENODEV;
> 
>   	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
> 
> @@ -700,7 +733,7 @@ static int og0ve1b_probe(struct i2c_client *client)
>   				     "failed to get XVCLK clock\n");
> 
>   	freq = clk_get_rate(og0ve1b->xvclk);
> -	if (freq && freq != OG0VE1B_MCLK_FREQ_24MHZ)
> +	if (freq && freq != og0ve1b->sensor->mclk_freq)
>   		return dev_err_probe(og0ve1b->dev, -EINVAL,
>   				     "XVCLK clock frequency %lu is not supported\n",
>   				     freq);
> @@ -819,7 +852,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
>   };
> 
>   static const struct of_device_id og0ve1b_of_match[] = {
> -	{ .compatible = "ovti,og0ve1b" },
> +	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, og0ve1b_of_match);
> 
> --
> 2.34.1
> 
> 

Other than that LTGM.

---
bod

