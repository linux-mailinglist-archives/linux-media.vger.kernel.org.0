Return-Path: <linux-media+bounces-57900-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI0vNtFtzWnvdQYAu9opvQ
	(envelope-from <linux-media+bounces-57900-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 21:11:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA7837FAEC
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 21:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88372309EB89
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 19:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D35361666;
	Wed,  1 Apr 2026 19:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TyaYVcCx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4042C11DE;
	Wed,  1 Apr 2026 19:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070490; cv=none; b=duNK/BI3op7+OpckRhFENUyYmPQsPl98kLC707Vqgkr/BQW+FbJJ/tV/kgTbQC9oevN1iqEYgI3/QRLO0COACgbw3EMMA2mef8+0fAQLRbMk70MwLtkDh3SLOllaeAVHAcVVkDpS4DkKOGNBX0+ByefLyNfK7OV6wfIqIxnPn1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070490; c=relaxed/simple;
	bh=BIraRqxosIqkfcS+RaRUskSd6+2JDvlBysOT3Dj4ap0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r/HeyimhjtlWhWq/TVOlG17gQ2R9YVnC2ene8LwFfcLnVAsBfX9HBpFVnVYParMRaWgQM9MU21gVP2eFWeVvlrKMOAhlp9Lxgt1AW4qQCwpLiAbdcVtaAklzRd83qd5oqnBxt3y8bGZdIps1k9H4Dm1um5/mzc3ZCaakWVHn/Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TyaYVcCx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3839FC4CEF7;
	Wed,  1 Apr 2026 19:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775070490;
	bh=BIraRqxosIqkfcS+RaRUskSd6+2JDvlBysOT3Dj4ap0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TyaYVcCxKGisVuEwUme4VAhYsqtDuiosK+m3A2uNZ1dq8O6pt/tLCfz9IcLlh7v+d
	 rfyHgqGdJ/0R/eJWGhKbSDMlXTjMXEj62yKtsKG0hNcpAlAJWSYMI17aBdIwBtNqiD
	 g9iwlV5eMjJoRW/VL08QiQYUKRxJRY1ePRfau1J6FCseyoZoj2JZIL9Ez5bjfh8Iq5
	 NzjJBQaOlQt09l4Ypd/rSzuFusM8sm/qDGX7lQP2II9pV/M05KSFXGKz20i0FH9HEv
	 QlnUZ4+AbcD3Q6jjqhC0cOH0hW4UteQHxDyLHZbprFJTLRFEolgs9jNdlR4tmDGyld
	 WAHrwhBCmEDPA==
Message-ID: <ca8e682c-f1aa-4272-8ae7-cff01a7d0327@kernel.org>
Date: Wed, 1 Apr 2026 21:08:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: i2c: gc0310: use cached client and device
 pointers
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>,
 sakari.ailus@linux.intel.com, mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401181657.654055-1-sanjayembedded@gmail.com>
 <20260401181657.654055-3-sanjayembedded@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260401181657.654055-3-sanjayembedded@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57900-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6EA7837FAEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 1-Apr-26 20:16, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> The driver was repeatedly retrieving the i2c_client using
> v4l2_get_subdevdata() only to access the underlying struct device.
> 
> Replace this with the cached sensor->client and sensor->dev pointers,
> which are already available in the sensor structure.
> 
> This simplifies the code, avoids redundant subdev lookups, and makes
> the driver more consistent with common V4L2 sensor driver patterns.
> No functional change intended.


So now you've grown struct gc0310_device by 16 bytes and
gained nothing much. And again this sound very much AI
generated.  Which is not necessarily a bad thing if the changes
are actually useful, but this seems like it is just code-churn
without any benefits.

Regards,

Hans



> 
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
>  drivers/media/i2c/gc0310.c | 72 ++++++++++++++++++++------------------
>  1 file changed, 37 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
> index 72a82ad4118a..e538479fee2e 100644
> --- a/drivers/media/i2c/gc0310.c
> +++ b/drivers/media/i2c/gc0310.c
> @@ -84,6 +84,9 @@
>  #define to_gc0310_sensor(x) container_of(x, struct gc0310_device, sd)
>  
>  struct gc0310_device {
> +	struct device *dev;
> +	struct i2c_client *client;
> +
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
>  
> @@ -409,28 +412,27 @@ static int gc0310_power_on(struct device *dev)
>  
>  static int gc0310_detect(struct gc0310_device *sensor)
>  {
> -	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>  	u64 val;
>  	int ret;
>  
> -	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> +	if (!i2c_check_functionality(sensor->client->adapter, I2C_FUNC_I2C))
>  		return -ENODEV;
>  
>  	ret = cci_read(sensor->regmap, GC0310_SC_CMMN_CHIP_ID_REG, &val, NULL);
>  	if (ret < 0) {
> -		dev_err(&client->dev, "read sensor_id failed: %d\n", ret);
> +		dev_err(sensor->dev, "read sensor_id failed: %d\n", ret);
>  		return -ENODEV;
>  	}
>  
> -	dev_dbg(&client->dev, "sensor ID = 0x%llx\n", val);
> +	dev_dbg(sensor->dev, "sensor ID = 0x%llx\n", val);
>  
>  	if (val != GC0310_ID) {
> -		dev_err(&client->dev, "sensor ID error, read id = 0x%llx, target id = 0x%x\n",
> +		dev_err(sensor->dev, "sensor ID error, read id = 0x%llx, target id = 0x%x\n",
>  			val, GC0310_ID);
>  		return -ENODEV;
>  	}
>  
> -	dev_dbg(&client->dev, "detect gc0310 success\n");
> +	dev_dbg(sensor->dev, "detect gc0310 success\n");
>  
>  	return 0;
>  }
> @@ -440,10 +442,9 @@ static int gc0310_enable_streams(struct v4l2_subdev *sd,
>  				 u32 pad, u64 streams_mask)
>  {
>  	struct gc0310_device *sensor = to_gc0310_sensor(sd);
> -	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	int ret;
>  
> -	ret = pm_runtime_resume_and_get(&client->dev);
> +	ret = pm_runtime_resume_and_get(sensor->dev);
>  	if (ret)
>  		return ret;
>  
> @@ -474,7 +475,7 @@ static int gc0310_enable_streams(struct v4l2_subdev *sd,
>  
>  error_power_down:
>  	if (ret)
> -		pm_runtime_put(&client->dev);
> +		pm_runtime_put(sensor->dev);
>  
>  	return ret;
>  }
> @@ -484,7 +485,6 @@ static int gc0310_disable_streams(struct v4l2_subdev *sd,
>  				  u32 pad, u64 streams_mask)
>  {
>  	struct gc0310_device *sensor = to_gc0310_sensor(sd);
> -	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	int ret = 0;
>  
>  	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
> @@ -494,7 +494,7 @@ static int gc0310_disable_streams(struct v4l2_subdev *sd,
>  	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
>  		  GC0310_REGISTER_PAGE_0, &ret);
>  
> -	pm_runtime_put(&client->dev);
> +	pm_runtime_put(sensor->dev);
>  	return ret;
>  }
>  
> @@ -559,7 +559,6 @@ static const struct v4l2_subdev_internal_ops gc0310_internal_ops = {
>  
>  static int gc0310_init_controls(struct gc0310_device *sensor)
>  {
> -	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>  	struct v4l2_ctrl_handler *hdl = &sensor->ctrls.handler;
>  	struct v4l2_fwnode_device_properties props;
>  	int exp_max, ret;
> @@ -597,7 +596,7 @@ static int gc0310_init_controls(struct gc0310_device *sensor)
>  				  GC0310_H_BLANK_DEFAULT, 1,
>  				  GC0310_H_BLANK_DEFAULT);
>  
> -	ret = v4l2_fwnode_device_parse(&client->dev, &props);
> +	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
>  	if (ret)
>  		return ret;
>  
> @@ -621,10 +620,10 @@ static void gc0310_remove(struct i2c_client *client)
>  	v4l2_subdev_cleanup(sd);
>  	media_entity_cleanup(&sensor->sd.entity);
>  	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> -	pm_runtime_disable(&client->dev);
> -	if (!pm_runtime_status_suspended(&client->dev)) {
> -		gc0310_power_off(&client->dev);
> -		pm_runtime_set_suspended(&client->dev);
> +	pm_runtime_disable(sensor->dev);
> +	if (!pm_runtime_status_suspended(sensor->dev)) {
> +		gc0310_power_off(sensor->dev);
> +		pm_runtime_set_suspended(sensor->dev);
>  	}
>  }
>  
> @@ -695,15 +694,18 @@ static int gc0310_probe(struct i2c_client *client)
>  	if (!sensor)
>  		return -ENOMEM;
>  
> -	sensor->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
> +	sensor->client = client;
> +	sensor->dev = &client->dev;
> +
> +	sensor->reset = devm_gpiod_get(sensor->dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(sensor->reset)) {
> -		return dev_err_probe(&client->dev, PTR_ERR(sensor->reset),
> +		return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset),
>  				     "getting reset GPIO\n");
>  	}
>  
> -	sensor->powerdown = devm_gpiod_get(&client->dev, "powerdown", GPIOD_OUT_HIGH);
> +	sensor->powerdown = devm_gpiod_get(sensor->dev, "powerdown", GPIOD_OUT_HIGH);
>  	if (IS_ERR(sensor->powerdown)) {
> -		return dev_err_probe(&client->dev, PTR_ERR(sensor->powerdown),
> +		return dev_err_probe(sensor->dev, PTR_ERR(sensor->powerdown),
>  				     "getting powerdown GPIO\n");
>  	}
>  
> @@ -713,11 +715,11 @@ static int gc0310_probe(struct i2c_client *client)
>  	if (IS_ERR(sensor->regmap))
>  		return PTR_ERR(sensor->regmap);
>  
> -	gc0310_power_on(&client->dev);
> +	gc0310_power_on(sensor->dev);
>  
> -	pm_runtime_set_active(&client->dev);
> -	pm_runtime_get_noresume(&client->dev);
> -	pm_runtime_enable(&client->dev);
> +	pm_runtime_set_active(sensor->dev);
> +	pm_runtime_get_noresume(sensor->dev);
> +	pm_runtime_enable(sensor->dev);
>  
>  	ret = gc0310_detect(sensor);
>  	if (ret)
> @@ -734,34 +736,34 @@ static int gc0310_probe(struct i2c_client *client)
>  
>  	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
>  	if (ret) {
> -		dev_err_probe(&client->dev, ret, "failed to init entity pads\n");
> +		dev_err_probe(sensor->dev, ret, "failed to init entity pads\n");
>  		goto error_handler_free;
>  	}
>  
>  	sensor->sd.state_lock = sensor->ctrls.handler.lock;
>  	ret = v4l2_subdev_init_finalize(&sensor->sd);
>  	if (ret) {
> -		dev_err_probe(&client->dev, ret, "subdev init error\n");
> +		dev_err_probe(sensor->dev, ret, "subdev init error\n");
>  		goto error_media_entity;
>  	}
>  
>  	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
>  	if (ret) {
> -		dev_err_probe(&client->dev, ret,
> +		dev_err_probe(sensor->dev, ret,
>  			      "failed to register gc0310 sub-device\n");
>  		goto error_subdev_cleanup;
>  	}
>  
> -	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> -	pm_runtime_use_autosuspend(&client->dev);
> -	pm_runtime_put_autosuspend(&client->dev);
> +	pm_runtime_set_autosuspend_delay(sensor->dev, 1000);
> +	pm_runtime_use_autosuspend(sensor->dev);
> +	pm_runtime_put_autosuspend(sensor->dev);
>  
>  	return 0;
>  
>  error_subdev_cleanup:
>  	v4l2_subdev_cleanup(&sensor->sd);
> -	pm_runtime_disable(&client->dev);
> -	pm_runtime_set_suspended(&client->dev);
> +	pm_runtime_disable(sensor->dev);
> +	pm_runtime_set_suspended(sensor->dev);
>  
>  error_media_entity:
>  	media_entity_cleanup(&sensor->sd.entity);
> @@ -770,8 +772,8 @@ static int gc0310_probe(struct i2c_client *client)
>  	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>  
>  error_power_off:
> -	pm_runtime_put_noidle(&client->dev);
> -	gc0310_power_off(&client->dev);
> +	pm_runtime_put_noidle(sensor->dev);
> +	gc0310_power_off(sensor->dev);
>  
>  	return ret;
>  }


