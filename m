Return-Path: <linux-media+bounces-28983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B90E6A75464
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 06:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73F2D18995D9
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 05:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2E818CC1D;
	Sat, 29 Mar 2025 05:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gla560DJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FB31632D9;
	Sat, 29 Mar 2025 05:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743227200; cv=none; b=doiw4nsgEeGbouvYn37EFbowSwx2LaA2hmELvWE1FGKWewejf0wb+IdTB90PtO0Din0HBM6jnV78uZ1Ppr8Z+rxzXnb+KTB5/DByDPNzbZkoAbaCqTvt1le1oOXs+UTYp6cfxMlzPT/HWpUwEMra7A77cfQFR6ggxhkr3kLvI9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743227200; c=relaxed/simple;
	bh=bIU0pSOCE3HExIAhjfEhDcaCzlmpUpFHgJ66hIsSFN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S5tapIiBo7PAuACz9+z37Y7j5A6vQWp22Mm86Q97wf4RAmUVHY1RUf/Cuc4ZKr01ne2+zAJ5s0uwIvrXTQz2X8/scuRoIGcFFvrQzd9vlh5tDNkkL1brBFjF6vZqz9DItZKlcCl4za6G4Oyhch9mcFP6jK87zHwAM9HD560llKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gla560DJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8EDC4CEE2;
	Sat, 29 Mar 2025 05:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743227199;
	bh=bIU0pSOCE3HExIAhjfEhDcaCzlmpUpFHgJ66hIsSFN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gla560DJMjJEehGKJolLh7QucPgqK4jQhHaRnBrSnQ8VhC1Mt27sKDi9goKEmus+b
	 XPjnAjNms07FkTLzHgNc+w6ME9Fcp6uJ33lQ4wnjJeWKyA+d6u3/zuTP3EXc1yVOw9
	 FaekH4EOaQ0Dtq6U1x6nyA44SOvro0UlpvsFKCIS8IcQ9SOgX/zIRI9u1zIt99X4DO
	 3j6Mb4Ig6dFJYHo6xRjJ/zpxqq0Uhli1eBalHk9ekzJSw5b/1Pv0OJD8Rqc8yICyqh
	 XiMmgrDnYHPyg7O/uOOIQJK2fOU7fQNyaqG4dbGiZbDwn5uXrUx+Igfyy6bN3elDuA
	 jhFtqwSTIRMfA==
Message-ID: <7556a0a8-47f3-4cf7-ae4d-9ea444d98c6b@kernel.org>
Date: Sat, 29 Mar 2025 06:46:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: Add driver for ST VD55G1 camera sensor
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250328-b4-vd55g1-v1-0-8d16b4a79f29@foss.st.com>
 <20250328-b4-vd55g1-v1-2-8d16b4a79f29@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250328-b4-vd55g1-v1-2-8d16b4a79f29@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2025 14:40, Benjamin Mugnier wrote:
> +
> +static void vd55g1_subdev_cleanup(struct vd55g1 *sensor)
> +{
> +	v4l2_async_unregister_subdev(&sensor->sd);
> +	v4l2_subdev_cleanup(&sensor->sd);
> +	media_entity_cleanup(&sensor->sd.entity);
> +	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
> +}
> +
> +static int vd55g1_err_probe(struct device *dev, int ret, char *msg)

Drop, it's really useless. Don't create own abstraction layers for other
systems.

> +{
> +	return dev_err_probe(dev, ret, msg);
> +}
> +
> +static int vd55g1_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct vd55g1 *sensor;
> +	int ret;
> +
> +	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
> +	if (!sensor)
> +		return -ENOMEM;
> +
> +	v4l2_i2c_subdev_init(&sensor->sd, client, &vd55g1_subdev_ops);
> +	sensor->i2c_client = client;
> +
> +	ret = vd55g1_parse_dt(sensor);
> +	if (ret)
> +		return vd55g1_err_probe(dev, ret,
> +					"Failed to parse Device Tree.");
> +
> +	/* Get (and check) resources : power regs, ext clock, reset gpio */
> +	ret = vd55g1_get_regulators(sensor);
> +	if (ret)
> +		return vd55g1_err_probe(dev, ret, "Failed to get regulators.");
> +
> +	sensor->xclk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(sensor->xclk)) {

Drop {}

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> +		return vd55g1_err_probe(dev, PTR_ERR(sensor->xclk),

No. Syntax is return dev_err_probe, not some custom wrappers over single
function.

> +					"Failed to get xclk.");
> +	}
> +	sensor->xclk_freq = clk_get_rate(sensor->xclk);
> +	ret = vd55g1_prepare_clock_tree(sensor);
> +	if (ret)
> +		return ret;
> +
> +	sensor->reset_gpio =
> +		devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);

Odd wrapping. This should be one line with optionally wrapped last argument.

> +	if (IS_ERR(sensor->reset_gpio))
> +		return vd55g1_err_probe(dev, PTR_ERR(sensor->reset_gpio),
> +					"Failed to get reset gpio.");
> +
> +	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(sensor->regmap))
> +		return vd55g1_err_probe(dev, PTR_ERR(sensor->regmap),
> +					"Failed to init regmap.");
> +
> +	/* Detect if sensor is present and if its revision is supported */
> +	ret = vd55g1_power_on(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = vd55g1_subdev_init(sensor);
> +	if (ret) {
> +		dev_err(dev, "V4l2 init failed : %d", ret);
> +		goto err_power_off;
> +	}
> +
> +	ret = v4l2_async_register_subdev(&sensor->sd);
> +	if (ret) {
> +		dev_err(dev, "async subdev register failed %d", ret);
> +		goto err_subdev;
> +	}
> +
> +	/* Enable pm_runtime and power off the sensor */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 4000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +
> +	dev_dbg(dev, "vd55g1 probe successfully");

Drop. Kernel already provides you such debugging/tracing.

Best regards,
Krzysztof

