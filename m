Return-Path: <linux-media+bounces-19012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E051498E4A1
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 23:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3E5E2847F1
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 21:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C447D217325;
	Wed,  2 Oct 2024 21:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="mk4aj1Cq"
X-Original-To: linux-media@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-76.smtpout.orange.fr [80.12.242.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62C91D1E60;
	Wed,  2 Oct 2024 21:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727903500; cv=none; b=kBT9TQ2tt/UIY8kgBnC8gv8bCYvjTosFWEiw7LBjtOyBkbaT9del9hLLzvZqvwYdVoMK6vZ73g3afpC3IM4RYCmrFyGlQDIWGHoM+zXS1HoDQ07eMJAiIjNlm4vKG+fTaOv3Raw56T4LiPQTAW6+aOyqW9AfmiZI9rXtw40s+X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727903500; c=relaxed/simple;
	bh=ODrkKLWW+1CH8eytpVUn+kbZrjm4ceGi6o1ypPfRANM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SUU9WIzF6q278p00uxaIw9kn5Gk7O5D5pdjoL38k7q2Yr88enAgXdkM/crl9XTScMvmgKgtsUReJTEVoY8rMRCntDK8dJH88BBtXDZkxwkGlCPLY3lHUDdpp4dcA4DQcFkT71wIJgaXgmlmks8/as4WnBlahcKrzxKfz8paqnCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=mk4aj1Cq; arc=none smtp.client-ip=80.12.242.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id w6UKs3HhhMzKhw6ULsAje6; Wed, 02 Oct 2024 23:02:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1727902945;
	bh=t4ZBx5hKu9sTpVPK0QmTA3pavI/sLog2ygjT/yZILXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=mk4aj1CqMRIej62TrcbQxaxD7yc7VV1xoIZgTIk3SzjkewBYPMfqApUIXStQfFlZu
	 TMjW/wwLZ7yz+5GQ0MLhoZYbq+Ah1JnSzCDTPd00po0SR9/2/wbRA7m6l4K7/XUI7w
	 0S93BgY9a7MXVW0bZ8SFaw/AEBEN0rEgfZgRB0vRI3P6t+V2LfeF4sl2JgCbdmHsaS
	 yHpyV7h+48SMR6dkvAJkcExZ+GcCoZySwmQOyF55UHssPUaGjmGCHUYuQWNfs7mMqS
	 /oPMZe6Zw3PFay8qjwW18MmBfmPg7to1Kr6KrYd8cc1m+7hwk7ts9xLWX3Xk8LNpF2
	 4JoFxUl5KzhFQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 02 Oct 2024 23:02:25 +0200
X-ME-IP: 90.11.132.44
Message-ID: <70231d35-a114-4b26-92c7-d33fec01d2b5@wanadoo.fr>
Date: Wed, 2 Oct 2024 23:02:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: Add t4ka3 camera sensor driver
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241002093037.50875-1-hpa@redhat.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241002093037.50875-1-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 02/10/2024 à 11:30, Kate Hsuan a écrit :
> Add the t4ka3 driver from:
> https://github.com/kitakar5525/surface3-atomisp-cameras.git
> 
> With many cleanups / changes (almost a full rewrite) to make it suitable
> for upstream:
> 
> * Remove the VCM and VCM-OTP support, the mainline kernel models VCMs and
>    calibration data eeproms as separate v4l2-subdev-s.
> 
> * Remove the integration-factor t4ka3_get_intg_factor() support and IOCTL,
>    this provided info to userspace through an atomisp private IOCTL.
> 
> * Turn atomisp specific exposure/gain IOCTL into standard v4l2 controls.
> 
> * Use normal ACPI power-management in combination with runtime-pm support
>    instead of atomisp specific GMIN power-management code.
> 
> * Turn into a standard V4L2 sensor driver using
>    v4l2_async_register_subdev_sensor().
> 
> * Add vblank, hblank, and link-freq controls; drop get_frame_interval().
> 
> * Use CCI register helpers.
> 
> * Calculate values for modes instead of using fixed register-value lists,
>    allowing arbritrary modes.
> 
> * Add get_selection() and set_selection() support
> 
> * Add a CSI2 bus configuration check
> 
> This been tested on a Xiaomi Mipad2 tablet which has a T4KA3 sensor with
> DW9761 VCM as back sensor.
> 
> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---

Hi,

a few comments, should it help.

> +static int t4ka3_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> +	int ret;
> +
> +	mutex_lock(&sensor->lock);
> +
> +	if (sensor->streaming == enable) {
> +		dev_warn(sensor->dev, "Stream already %s\n", enable ? "started" : "stopped");
> +		goto error_unlock;
> +	}
> +
> +	if (enable) {
> +		ret = pm_runtime_get_sync(sensor->sd.dev);
> +		if (ret) {
> +			dev_err(sensor->dev, "power-up err.\n");
> +			goto error_unlock;
> +		}
> +
> +		cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
> +				    ARRAY_SIZE(t4ka3_init_config), &ret);
> +		/* enable group hold */
> +		cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 1, &ret);
> +		cci_multi_reg_write(sensor->regmap, t4ka3_pre_mode_set_regs,
> +				    ARRAY_SIZE(t4ka3_pre_mode_set_regs), &ret);
> +		if (ret)
> +			goto error_powerdown;
> +
> +		ret = t4ka3_set_mode(sensor);
> +		if (ret)
> +			goto error_powerdown;
> +
> +		ret = cci_multi_reg_write(sensor->regmap, t4ka3_post_mode_set_regs,
> +					  ARRAY_SIZE(t4ka3_post_mode_set_regs), NULL);
> +		if (ret)
> +			goto error_powerdown;
> +
> +		/* Restore value of all ctrls */
> +		ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> +		if (ret)
> +			goto error_powerdown;
> +
> +		/* disable group hold */
> +		cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 0, &ret);
> +		cci_write(sensor->regmap, T4KA3_REG_STREAM, 1, &ret);
> +		if (ret)
> +			goto error_powerdown;
> +
> +		sensor->streaming = 1;
> +	} else {
> +		ret = cci_write(sensor->regmap, T4KA3_REG_STREAM, 0, NULL);
> +		if (ret)
> +			goto error_powerdown;
> +
> +		ret = pm_runtime_put(sensor->sd.dev);
> +		if (ret)
> +			goto error_unlock;
> +
> +		sensor->streaming = 0;
> +	}
> +
> +	mutex_unlock(&sensor->lock);
> +	return ret;
> +
> +error_powerdown:
> +	ret = pm_runtime_put(sensor->sd.dev);

I think that the "ret = " should be removed here.

> +error_unlock:
> +	mutex_unlock(&sensor->lock);
> +	return ret;
> +}

...

> +static int t4ka3_probe(struct i2c_client *client)
> +{
> +	struct t4ka3_data *sensor;
> +	int ret;
> +
> +	/* allocate sensor device & init sub device */
> +	sensor = devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL);
> +	if (!sensor)
> +		return -ENOMEM;
> +
> +	sensor->dev = &client->dev;
> +
> +	ret = t4ka3_check_hwcfg(sensor);
> +	if (ret)
> +		return ret;
> +
> +	mutex_init(&sensor->lock);
> +
> +	sensor->link_freq[0] = T4KA3_LINK_FREQ;
> +	sensor->mode.crop = t4ka3_default_crop;
> +	t4ka3_fill_format(sensor, &sensor->mode.fmt, T4KA3_ACTIVE_WIDTH, T4KA3_ACTIVE_HEIGHT);
> +	t4ka3_calc_mode(sensor);
> +
> +	v4l2_i2c_subdev_init(&(sensor->sd), client, &t4ka3_ops);
> +	sensor->sd.internal_ops = &t4ka3_internal_ops;
> +
> +	sensor->powerdown_gpio = devm_gpiod_get(&client->dev, "powerdown",
> +						GPIOD_OUT_HIGH);
> +	if (IS_ERR(sensor->powerdown_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(sensor->powerdown_gpio),
> +				     "getting powerdown GPIO\n");
> +
> +	sensor->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +	if (IS_ERR(sensor->reset_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(sensor->reset_gpio),
> +				     "getting reset GPIO\n");
> +
> +	pm_runtime_set_suspended(&client->dev);
> +	pm_runtime_enable(&client->dev);
> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> +	pm_runtime_use_autosuspend(&client->dev);
> +
> +	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(sensor->regmap))
> +		return PTR_ERR(sensor->regmap);

I thing this should goto err_pm_runtime;

> +
> +	ret = t4ka3_s_config(&sensor->sd);
> +	if (ret)
> +		goto err_pm_runtime;
> +
> +	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	ret = t4ka3_init_controls(sensor);
> +	if (ret)
> +		goto err_controls;
> +
> +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
> +	if (ret)
> +		goto err_controls;
> +
> +	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
> +	if (ret)
> +		goto err_media_entity;
> +
> +	return 0;
> +
> +err_media_entity:
> +	media_entity_cleanup(&sensor->sd.entity);
> +err_controls:
> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> +err_pm_runtime:
> +	pm_runtime_disable(&client->dev);
> +	return ret;
> +}
> +
> +static struct acpi_device_id t4ka3_acpi_match[] = {
> +	{ "XMCC0003" },
> +	{},

No need for ending comma after terminator.

> +};

...

CJ

