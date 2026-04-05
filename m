Return-Path: <linux-media+bounces-58063-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zuGIHDBB0mlMUwcAu9opvQ
	(envelope-from <linux-media+bounces-58063-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 13:02:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD3B39E182
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 13:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A762300370E
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 11:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26CA33F394;
	Sun,  5 Apr 2026 11:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXYC91tx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C934C92
	for <linux-media@vger.kernel.org>; Sun,  5 Apr 2026 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775386918; cv=none; b=bJVXj84PciGe0Eg/VEJ/QaSwVv04eAUgSMhkS7rIGNKqR+3dvwY4O0fyeieyX8ecpUr3F9tEOE+92HqQhnS/Sxyxb0U+Koo6kJXhj8bwh7mC+m6WFaiFQm+u9Y9KyLRbVQOWv5TyokoP7lhGdff15+27m0L+2ltFnXDUbHUW/y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775386918; c=relaxed/simple;
	bh=BivNUStgyBzYMCyKgXfgssHRtLk70CLiixKfbXs/VZc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=N5/7liUhd10ASuLlGFhBYs1bvNe/7f7VUQ6DFtommO9ICE7jGsPxcug2+/DR7kmliymJZRmpzw33qQhy6KR27X5ecNGPqXfDRVIhCLHEJ2Lr38nO97zOJe2DjOoguAucq9ttNX4FUTKCCmAZ6MnBMnbfDNCJokMPQZXa/Uvvwew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXYC91tx; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35d99031e4eso1791617a91.1
        for <linux-media@vger.kernel.org>; Sun, 05 Apr 2026 04:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775386916; x=1775991716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QdTQQSEPDCxoEzvpvZOkvPU6XtJofAFfzJz2pjMZ6tE=;
        b=nXYC91txVB+9MWXRE4L5L6e1Cv2QlYSoLjYhKHGZ1PAwzXUdr72h5ULWmna9NPmD2G
         62Gn4WTizElrDs0vOcu6TAjJxzNIcaHGMdKLbx+9wnVNqbnG5Qd5wGL1+6TBwpZVJpzV
         VmAkRXyMuEG11j5hFizFmLktUZqQ94RKlBXUyMeZVFb2VfVVXWvLWCCLfObqPOXUOZ9b
         fnjUcM7WxZoT4gv17FGdPyCu1XpwTxpbkM3mg//lDtBrbf1c0cGwajopIwD9yKiPs5hg
         1jYlr7VUqZ9SyYcYk5fSIvEAV0lLAj4bp/q9JX3GBmZcc2llRYGjuy/vYn9FPnT5NBbp
         Zw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775386916; x=1775991716;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdTQQSEPDCxoEzvpvZOkvPU6XtJofAFfzJz2pjMZ6tE=;
        b=acefC1rgccHQeRjl4H9apLz+nRtu5/z+SKy0Qa1KpLnct6j7Vt5YHFm2RuN1pfv3Mn
         KQVw4zylWsk7NlYvTA+eeJf0pYuGMeX+uwX2gQ8E9+XlgkkcJOALplRH2Qjf4wpZOX+U
         064EMWboJoJ4PJfV6VeZE/tlXsH6MUKPM2LE2Zle+iIT9zOkTvY7E3mqn7MCIUucuJun
         saWWL3fERp482U/epBzV6ZkYozqXMDTKzWtKIpUtj2T4qHL+XTiSq4UT051bRI9wlGCh
         HChURlpode3uih/uZErE8WXBUxfwRO5cL8VJGQbNGm3dtZfoKUsld8DeE49mQBCWKQTv
         Dbtg==
X-Forwarded-Encrypted: i=1; AJvYcCU8ftEwaHowvy9kl8Sx/Tf6Een6ceToZ6ykHxuWMFbkmgkobjTYX1mteI+88nhwPkNPftvML4pQZv1aPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVxChx9rMujXwot7yYSQcVuWQoftpfnTjzE394u556y9dKGYky
	xQO24PfHU8ePHe1qPokahpufD+z4gYpehfFQMEdFettHF6/l+ZkePm5sraUJ2A==
X-Gm-Gg: AeBDieshH4eHQ9oG3nL3RvsF60YEc9BS0ukmPcQjh2n+p8z5SWJ4ioC2dp8vxBH9gEd
	Il65DWUgNs/9cytE4KVKSsYXB4fVOMA6P7fiBV3DWUyKYmUFRNPVGM3Sa0/6XRGJ7dgfupTyqwS
	ZWe7/wFps5Nwb+b2DCMR9B323SsiHIDrzVQIWdpzF3p1T/6CaNrAWf8Dy5F5cVJfMp+scJyZ+EY
	HsZoWoXdtGpyF5jai3nNKM8p5eS9jhaCHjfOVvFgQWH8hD1m/T0EkUn0Zu6HQa9aLKv7SmGtiNv
	RKaZyMtQtg73iOj1ifwhzBujxJV7mwBxJ/8gloKKiq/kILmctLxH6RhQQbZI3qHuhsacuY+mg+x
	wwQV26qv4oRUf2kYetGL9xu4fV57UNA+QcRxYQjWsQC3LobMtWIvgKVVcuoO6rmhqXYPz+vxBil
	3bcrHcn5K1sGup6b95u6IPdnXvK8vgn8TvVm4i+/TROBlf0A==
X-Received: by 2002:a17:90b:4ac7:b0:35d:a2aa:3b05 with SMTP id 98e67ed59e1d1-35de678f96fmr8690647a91.5.1775386916216;
        Sun, 05 Apr 2026 04:01:56 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:7915:e198:7f98:a783:bdbd:79e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe959358sm14912106a91.13.2026.04.05.04.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 04:01:55 -0700 (PDT)
Date: Sun, 05 Apr 2026 16:31:43 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: Hans de Goede <hansg@kernel.org>, sakari.ailus@linux.intel.com,
 mchehab@kernel.org
CC: hverkuil+cisco@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/3=5D_media=3A_i2c=3A_gc0310=3A_?=
 =?US-ASCII?Q?use_cached_client_and_device_pointers?=
User-Agent: Thunderbird for Android
In-Reply-To: <ca8e682c-f1aa-4272-8ae7-cff01a7d0327@kernel.org>
References: <20260401181657.654055-1-sanjayembedded@gmail.com> <20260401181657.654055-3-sanjayembedded@gmail.com> <ca8e682c-f1aa-4272-8ae7-cff01a7d0327@kernel.org>
Message-ID: <40B63744-FD2D-49B6-AEC8-A72C9BEDF8FA@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.95 / 15.00];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-58063-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5AD3B39E182
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2 April 2026 12:38:07=E2=80=AFam IST, Hans de Goede <hansg@kernel=2Eorg=
> wrote:
>Hi,
>
>On 1-Apr-26 20:16, Sanjay Chitroda wrote:
>> From: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>>=20
>> The driver was repeatedly retrieving the i2c_client using
>> v4l2_get_subdevdata() only to access the underlying struct device=2E
>>=20
>> Replace this with the cached sensor->client and sensor->dev pointers,
>> which are already available in the sensor structure=2E
>>=20
>> This simplifies the code, avoids redundant subdev lookups, and makes
>> the driver more consistent with common V4L2 sensor driver patterns=2E
>> No functional change intended=2E
>
>
>So now you've grown struct gc0310_device by 16 bytes and
>gained nothing much=2E And again this sound very much AI
>generated=2E  Which is not necessarily a bad thing if the changes
>are actually useful, but this seems like it is just code-churn
>without any benefits=2E
>
>Regards,
>
>Hans
>

Thanks again for the review - I agree that, taken on its own, the change d=
oes not justify the added struct size and unnecessary churn for this driver=
=2E

For context, the motivation came from looking at recent sensor cleanups, f=
or example Laurent's series: https://lore=2Ekernel=2Eorg/all/20250812214620=
=2E30425-1-laurent=2Epinchart@ideasonboard=2Ecom/

where several sensor drivers were moved toward accessing the underlying de=
vice more directly instead of repeatedly going through subdev helpers=2E I =
attempted to explore a similar direction here=2E

That said, you're absolutely right that in the case of gc0310 this does no=
t provide a concrete benefit, and the existing v412_get_subdevdata() usage =
is already clear and optimal=2E

I'll drop this patch instead of revising it=2E

Regards, Sanjay

>
>
>>=20
>> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>> ---
>>  drivers/media/i2c/gc0310=2Ec | 72 ++++++++++++++++++++----------------=
--
>>  1 file changed, 37 insertions(+), 35 deletions(-)
>>=20
>> diff --git a/drivers/media/i2c/gc0310=2Ec b/drivers/media/i2c/gc0310=2E=
c
>> index 72a82ad4118a=2E=2Ee538479fee2e 100644
>> --- a/drivers/media/i2c/gc0310=2Ec
>> +++ b/drivers/media/i2c/gc0310=2Ec
>> @@ -84,6 +84,9 @@
>>  #define to_gc0310_sensor(x) container_of(x, struct gc0310_device, sd)
>> =20
>>  struct gc0310_device {
>> +	struct device *dev;
>> +	struct i2c_client *client;
>> +
>>  	struct v4l2_subdev sd;
>>  	struct media_pad pad;
>> =20
>> @@ -409,28 +412,27 @@ static int gc0310_power_on(struct device *dev)
>> =20
>>  static int gc0310_detect(struct gc0310_device *sensor)
>>  {
>> -	struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->sd);
>>  	u64 val;
>>  	int ret;
>> =20
>> -	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
>> +	if (!i2c_check_functionality(sensor->client->adapter, I2C_FUNC_I2C))
>>  		return -ENODEV;
>> =20
>>  	ret =3D cci_read(sensor->regmap, GC0310_SC_CMMN_CHIP_ID_REG, &val, NU=
LL);
>>  	if (ret < 0) {
>> -		dev_err(&client->dev, "read sensor_id failed: %d\n", ret);
>> +		dev_err(sensor->dev, "read sensor_id failed: %d\n", ret);
>>  		return -ENODEV;
>>  	}
>> =20
>> -	dev_dbg(&client->dev, "sensor ID =3D 0x%llx\n", val);
>> +	dev_dbg(sensor->dev, "sensor ID =3D 0x%llx\n", val);
>> =20
>>  	if (val !=3D GC0310_ID) {
>> -		dev_err(&client->dev, "sensor ID error, read id =3D 0x%llx, target i=
d =3D 0x%x\n",
>> +		dev_err(sensor->dev, "sensor ID error, read id =3D 0x%llx, target id=
 =3D 0x%x\n",
>>  			val, GC0310_ID);
>>  		return -ENODEV;
>>  	}
>> =20
>> -	dev_dbg(&client->dev, "detect gc0310 success\n");
>> +	dev_dbg(sensor->dev, "detect gc0310 success\n");
>> =20
>>  	return 0;
>>  }
>> @@ -440,10 +442,9 @@ static int gc0310_enable_streams(struct v4l2_subde=
v *sd,
>>  				 u32 pad, u64 streams_mask)
>>  {
>>  	struct gc0310_device *sensor =3D to_gc0310_sensor(sd);
>> -	struct i2c_client *client =3D v4l2_get_subdevdata(sd);
>>  	int ret;
>> =20
>> -	ret =3D pm_runtime_resume_and_get(&client->dev);
>> +	ret =3D pm_runtime_resume_and_get(sensor->dev);
>>  	if (ret)
>>  		return ret;
>> =20
>> @@ -474,7 +475,7 @@ static int gc0310_enable_streams(struct v4l2_subdev=
 *sd,
>> =20
>>  error_power_down:
>>  	if (ret)
>> -		pm_runtime_put(&client->dev);
>> +		pm_runtime_put(sensor->dev);
>> =20
>>  	return ret;
>>  }
>> @@ -484,7 +485,6 @@ static int gc0310_disable_streams(struct v4l2_subde=
v *sd,
>>  				  u32 pad, u64 streams_mask)
>>  {
>>  	struct gc0310_device *sensor =3D to_gc0310_sensor(sd);
>> -	struct i2c_client *client =3D v4l2_get_subdevdata(sd);
>>  	int ret =3D 0;
>> =20
>>  	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
>> @@ -494,7 +494,7 @@ static int gc0310_disable_streams(struct v4l2_subde=
v *sd,
>>  	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
>>  		  GC0310_REGISTER_PAGE_0, &ret);
>> =20
>> -	pm_runtime_put(&client->dev);
>> +	pm_runtime_put(sensor->dev);
>>  	return ret;
>>  }
>> =20
>> @@ -559,7 +559,6 @@ static const struct v4l2_subdev_internal_ops gc0310=
_internal_ops =3D {
>> =20
>>  static int gc0310_init_controls(struct gc0310_device *sensor)
>>  {
>> -	struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->sd);
>>  	struct v4l2_ctrl_handler *hdl =3D &sensor->ctrls=2Ehandler;
>>  	struct v4l2_fwnode_device_properties props;
>>  	int exp_max, ret;
>> @@ -597,7 +596,7 @@ static int gc0310_init_controls(struct gc0310_devic=
e *sensor)
>>  				  GC0310_H_BLANK_DEFAULT, 1,
>>  				  GC0310_H_BLANK_DEFAULT);
>> =20
>> -	ret =3D v4l2_fwnode_device_parse(&client->dev, &props);
>> +	ret =3D v4l2_fwnode_device_parse(sensor->dev, &props);
>>  	if (ret)
>>  		return ret;
>> =20
>> @@ -621,10 +620,10 @@ static void gc0310_remove(struct i2c_client *clie=
nt)
>>  	v4l2_subdev_cleanup(sd);
>>  	media_entity_cleanup(&sensor->sd=2Eentity);
>>  	v4l2_ctrl_handler_free(&sensor->ctrls=2Ehandler);
>> -	pm_runtime_disable(&client->dev);
>> -	if (!pm_runtime_status_suspended(&client->dev)) {
>> -		gc0310_power_off(&client->dev);
>> -		pm_runtime_set_suspended(&client->dev);
>> +	pm_runtime_disable(sensor->dev);
>> +	if (!pm_runtime_status_suspended(sensor->dev)) {
>> +		gc0310_power_off(sensor->dev);
>> +		pm_runtime_set_suspended(sensor->dev);
>>  	}
>>  }
>> =20
>> @@ -695,15 +694,18 @@ static int gc0310_probe(struct i2c_client *client=
)
>>  	if (!sensor)
>>  		return -ENOMEM;
>> =20
>> -	sensor->reset =3D devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIG=
H);
>> +	sensor->client =3D client;
>> +	sensor->dev =3D &client->dev;
>> +
>> +	sensor->reset =3D devm_gpiod_get(sensor->dev, "reset", GPIOD_OUT_HIGH=
);
>>  	if (IS_ERR(sensor->reset)) {
>> -		return dev_err_probe(&client->dev, PTR_ERR(sensor->reset),
>> +		return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset),
>>  				     "getting reset GPIO\n");
>>  	}
>> =20
>> -	sensor->powerdown =3D devm_gpiod_get(&client->dev, "powerdown", GPIOD=
_OUT_HIGH);
>> +	sensor->powerdown =3D devm_gpiod_get(sensor->dev, "powerdown", GPIOD_=
OUT_HIGH);
>>  	if (IS_ERR(sensor->powerdown)) {
>> -		return dev_err_probe(&client->dev, PTR_ERR(sensor->powerdown),
>> +		return dev_err_probe(sensor->dev, PTR_ERR(sensor->powerdown),
>>  				     "getting powerdown GPIO\n");
>>  	}
>> =20
>> @@ -713,11 +715,11 @@ static int gc0310_probe(struct i2c_client *client=
)
>>  	if (IS_ERR(sensor->regmap))
>>  		return PTR_ERR(sensor->regmap);
>> =20
>> -	gc0310_power_on(&client->dev);
>> +	gc0310_power_on(sensor->dev);
>> =20
>> -	pm_runtime_set_active(&client->dev);
>> -	pm_runtime_get_noresume(&client->dev);
>> -	pm_runtime_enable(&client->dev);
>> +	pm_runtime_set_active(sensor->dev);
>> +	pm_runtime_get_noresume(sensor->dev);
>> +	pm_runtime_enable(sensor->dev);
>> =20
>>  	ret =3D gc0310_detect(sensor);
>>  	if (ret)
>> @@ -734,34 +736,34 @@ static int gc0310_probe(struct i2c_client *client=
)
>> =20
>>  	ret =3D media_entity_pads_init(&sensor->sd=2Eentity, 1, &sensor->pad)=
;
>>  	if (ret) {
>> -		dev_err_probe(&client->dev, ret, "failed to init entity pads\n");
>> +		dev_err_probe(sensor->dev, ret, "failed to init entity pads\n");
>>  		goto error_handler_free;
>>  	}
>> =20
>>  	sensor->sd=2Estate_lock =3D sensor->ctrls=2Ehandler=2Elock;
>>  	ret =3D v4l2_subdev_init_finalize(&sensor->sd);
>>  	if (ret) {
>> -		dev_err_probe(&client->dev, ret, "subdev init error\n");
>> +		dev_err_probe(sensor->dev, ret, "subdev init error\n");
>>  		goto error_media_entity;
>>  	}
>> =20
>>  	ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);
>>  	if (ret) {
>> -		dev_err_probe(&client->dev, ret,
>> +		dev_err_probe(sensor->dev, ret,
>>  			      "failed to register gc0310 sub-device\n");
>>  		goto error_subdev_cleanup;
>>  	}
>> =20
>> -	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
>> -	pm_runtime_use_autosuspend(&client->dev);
>> -	pm_runtime_put_autosuspend(&client->dev);
>> +	pm_runtime_set_autosuspend_delay(sensor->dev, 1000);
>> +	pm_runtime_use_autosuspend(sensor->dev);
>> +	pm_runtime_put_autosuspend(sensor->dev);
>> =20
>>  	return 0;
>> =20
>>  error_subdev_cleanup:
>>  	v4l2_subdev_cleanup(&sensor->sd);
>> -	pm_runtime_disable(&client->dev);
>> -	pm_runtime_set_suspended(&client->dev);
>> +	pm_runtime_disable(sensor->dev);
>> +	pm_runtime_set_suspended(sensor->dev);
>> =20
>>  error_media_entity:
>>  	media_entity_cleanup(&sensor->sd=2Eentity);
>> @@ -770,8 +772,8 @@ static int gc0310_probe(struct i2c_client *client)
>>  	v4l2_ctrl_handler_free(&sensor->ctrls=2Ehandler);
>> =20
>>  error_power_off:
>> -	pm_runtime_put_noidle(&client->dev);
>> -	gc0310_power_off(&client->dev);
>> +	pm_runtime_put_noidle(sensor->dev);
>> +	gc0310_power_off(sensor->dev);
>> =20
>>  	return ret;
>>  }
>

