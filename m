Return-Path: <linux-media+bounces-49098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86569CCD77F
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 21:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CD9C301E6DC
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 20:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE252C3268;
	Thu, 18 Dec 2025 20:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qc372uuT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB5581ACA;
	Thu, 18 Dec 2025 20:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766088326; cv=none; b=LzeD4V6+bKQru00jlhH4DZZMMEmmSqI/U9zSQ9Erx+is8U8OfBFjhNtJOhQ4pkc8euJzthA5ahr9+H8whrtDWaxEhzpgOzjE/77XmYIp39vRZgxAZx3zRxc6H4xXrmCnSwSUGRPaAnqkqPZGsWZTxpTcBVequl5SdhvSQ4472m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766088326; c=relaxed/simple;
	bh=qOmoSsMcnU+05ZsbSJqzF/ObB42pZyhLPpPwYZBwSYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBBAeyJPrsV2PqtwEfkeT7NwchtrlLMeb/8PFDEzGOrumbS0TyNwv14ptkcDFzuCEUW7oyHqXF38Tf9X6Qvm2FK7jt4xVNFBvqrGT+FU7cQNKcn/Sm8hlPMqEsItjkCZKbF6mntB/aiMb4c2EfX4DskIzEJYYMBcHA6qF77GMiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qc372uuT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5B4C16AAE;
	Thu, 18 Dec 2025 20:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766088325;
	bh=qOmoSsMcnU+05ZsbSJqzF/ObB42pZyhLPpPwYZBwSYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qc372uuTC+u61AUF4nkxEjBIq9G+iwfzUotlVnrS9xpA1HPojaU+Ic+v5hIZgEkyE
	 YTBZYXvW1xMGZPmzQmhQPG/7ICaqfGZ5H5yV1iQuj53Iaz0Ty6gMWfEBmoVV8uMaEo
	 eYCJmuLK+G8e1iYAUpx2p9rMdONYbZ7b4mAaM5VVjGJqax7MqY+KCc0jOSgoK664UE
	 8UUUuXdHDjgrryKWb7AQzJ/tPZxqwDO+hCNAgatNgxe0qSx1HofXBYSQSCLc+YiV7F
	 SS6pXFREDco1v6lbY3v27kNMf/v22tKkgVNfCmeVmnzNygHZxqsIxNTIRGOWrvJK74
	 Wca5ZIkDDXROQ==
Message-ID: <2846f26f-57cc-4fa1-b316-63f94991cd62@kernel.org>
Date: Thu, 18 Dec 2025 21:05:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: Add ov2732 image sensor driver
To: Walter Werner Schneider <contact@schnwalter.eu>,
 linux-media@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251218-ov2732-driver-v2-0-fb763644d62c@schnwalter.eu>
 <20251218-ov2732-driver-v2-2-fb763644d62c@schnwalter.eu>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251218-ov2732-driver-v2-2-fb763644d62c@schnwalter.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/12/2025 19:15, Walter Werner Schneider wrote:
> +static int ov2732_probe(struct i2c_client *client)
> +{
> +	struct ov2732 *ov2732;
> +	int ret;
> +
> +	ov2732 = devm_kzalloc(&client->dev, sizeof(*ov2732), GFP_KERNEL);
> +	if (!ov2732)
> +		return -ENOMEM;
> +
> +	ov2732->dev = &client->dev;
> +
> +	ret = ov2632_probe_dt(ov2732);
> +	if (ret)
> +		return dev_err_probe(ov2732->dev, ret,
> +				     "failed to probe device tree\n");
> +
> +	ov2732->xvclk = devm_v4l2_sensor_clk_get(ov2732->dev, "xvclk");
> +	if (IS_ERR(ov2732->xvclk))
> +		return dev_err_probe(ov2732->dev, PTR_ERR(ov2732->xvclk),
> +				     "failed to get xvclk\n");
> +
> +	ov2732->xvclk_freq = clk_get_rate(ov2732->xvclk);
> +	if (ov2732->xvclk_freq != OV2732_XVCLK_FREQ)
> +		return dev_err_probe(ov2732->dev, -EINVAL,
> +				     "xvclk frequency not supported: %dHz\n",
> +				      ov2732->xvclk_freq);
> +
> +	ov2732->pwdn_gpio = devm_gpiod_get_optional(ov2732->dev, "pwdn",
> +						    GPIOD_OUT_HIGH);
> +	gpiod_set_value_cansleep(ov2732->pwdn_gpio, 1);

No need to set the same value twice. It's already 1.

> +
> +	ov2732->reset_gpio = devm_gpiod_get_optional(ov2732->dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +	gpiod_set_value_cansleep(ov2732->reset_gpio, 1);

Same here

> +
> +	ov2732->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(ov2732->regmap))
> +		return dev_err_probe(ov2732->dev, PTR_ERR(ov2732->regmap),
> +				     "failed to init CCI\n");
> +
> +	ret = ov2732_get_regulators(ov2732);
> +	if (ret)
> +		return dev_err_probe(ov2732->dev, ret,
> +				     "failed to get regulators\n");
> +
> +	v4l2_i2c_subdev_init(&ov2732->sd, client, &ov2732_subdev_ops);
> +
> +	/* Device must be powered on for ov2732_identify_chip(). */
> +	ret = ov2732_power_on(ov2732->dev);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_active(ov2732->dev);
> +	pm_runtime_enable(ov2732->dev);
> +
> +	/* Wait 1ms to avoid intermittent communication errors at startup. */
> +	fsleep(USEC_PER_MSEC);
> +
> +	ret = ov2732_identify_chip(ov2732);
> +	if (ret)
> +		goto err_power_off;
> +
> +	ret = ov2732_init_controls(ov2732);
> +	if (ret)
> +		goto err_power_off;
> +
> +	/* Initialize subdev */
> +	ov2732->sd.internal_ops = &ov2732_internal_ops;
> +	ov2732->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov2732->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	/* Initialize source pad */
> +	ov2732->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&ov2732->sd.entity, 1, &ov2732->pad);
> +	if (ret) {
> +		dev_err_probe(ov2732->dev, ret, "failed to init entity pads\n");
> +		goto error_handler_free;
> +	}
> +
> +	ov2732->sd.state_lock = ov2732->ctrl_handler.lock;
> +	ret = v4l2_subdev_init_finalize(&ov2732->sd);
> +	if (ret < 0) {
> +		dev_err_probe(ov2732->dev, ret, "subdev init error\n");
> +		goto err_media_entity;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor(&ov2732->sd);
> +	if (ret < 0) {
> +		dev_err_probe(ov2732->dev, ret,
> +			      "failed to register sensor sub-device\n");

So you print errors twice? Once here and second time at the end. Why?
> +		goto err_subdev_cleanup;
> +	}
> +
> +	pm_runtime_set_autosuspend_delay(ov2732->dev, 1000);
> +	pm_runtime_use_autosuspend(ov2732->dev);
> +	pm_runtime_idle(ov2732->dev);
> +
> +	return 0;
> +
> +err_subdev_cleanup:
> +	v4l2_subdev_cleanup(&ov2732->sd);
> +
> +err_media_entity:
> +	media_entity_cleanup(&ov2732->sd.entity);
> +
> +error_handler_free:
> +	v4l2_ctrl_handler_free(&ov2732->ctrl_handler);
> +
> +err_power_off:
> +	pm_runtime_disable(ov2732->dev);
> +	pm_runtime_put_noidle(ov2732->dev);
> +	ov2732_power_off(ov2732->dev);
> +
> +	return dev_err_probe(ov2732->dev, ret, "probing failed\n");

This is useless message. Print informative messages for specific errors
or do not print at all.

> +}
> +

...

> +
> +static const struct of_device_id ov2732_of_match[] = {
> +	{ .compatible = "ovti,ov2732", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ov2732_of_match);
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(ov2732_pm_ops, ov2732_power_off,
> +				 ov2732_power_on, NULL);
> +
> +static struct i2c_driver ov2732_i2c_driver = {
> +	.driver = {
> +		.name = "ov2732",
> +		.of_match_table = of_match_ptr(ov2732_of_match),

Drop of_match_ptr, you have here warning.

> +		.pm = pm_sleep_ptr(&ov2732_pm_ops),
> +	},
> +	.probe = ov2732_probe,
> +	.remove = ov2732_remove,
> +};
Best regards,
Krzysztof

