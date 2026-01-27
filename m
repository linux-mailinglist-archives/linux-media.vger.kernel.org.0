Return-Path: <linux-media+bounces-51625-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDFsFQaZeGkWrQEAu9opvQ
	(envelope-from <linux-media+bounces-51625-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:52:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C859331A
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 866B53030100
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 10:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66849344D83;
	Tue, 27 Jan 2026 10:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ADQNyMAi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179E53446CB
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510828; cv=none; b=Ca/QUohmzgx9WvzVbKus3W0gQDI6sTCbyKeUFJHlPu2VvUQ950FIKbdxb/lTOeSje+EZBV0ASCvBFW7BthYAZ8ixvfsTlInbiap3ZhofCDple/UZUewEuKd4SZjV2vh/oUZKGaOx8/hsmHZpOQLYnKjIqBRuxswc7us6Tv5WI/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510828; c=relaxed/simple;
	bh=3jVIysMavNlQaxUbaALgp3fhgpKYtr/JEYcJv8TiAso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcjt9RD7FhXl6tJWogD/dcfwkL6JeyMyzvN7JTO8/b3XsBql1i2vnV+GrJpc0ZGzuLxko2DhS3UEAfit2mzWG+p4ZXdZy8rtrrcvQ7BLII7xVjnTN6vgu50RQxb9u7l15Tkg/I/yVIXXNDw2q7mcGxvzVk1g59VjO0PUjn8aBJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ADQNyMAi; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so3090027f8f.1
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 02:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769510825; x=1770115625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/MX0Uzp+K02e3Z85XRSxNOGh0OmSKQ62wN9kFEdTMo=;
        b=ADQNyMAiAVQ7VNxuRE5NFp8fHFP2Nvfly3ew37uKqZwiLd+aIiWhC2VXcTjMjdma3U
         EFDn154CCecdb94OIpAcNlKxGt/UayUggTpdy7iMYDOPtyloKEMRP2+uJZ1xRH+S5Vo5
         IEqz7/Eca5fOJ1wswm2Js8RPh674ttcWDTJt5QX3C7R4oBTX+HexhZpukO/iGAfGhAFM
         mSbNZNRbOfy38vUKjXH75j0Csd/+Svw3lQkKhB6CBWJwRsq2TS5DGpFq1DlENZyMft9A
         faKUZYzisQhsEa5ypzVDdJWv8ZH7aO3yPKhhpqF417NTAK0gDbziHG17jvsFsL+mwsuE
         ymGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510825; x=1770115625;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/MX0Uzp+K02e3Z85XRSxNOGh0OmSKQ62wN9kFEdTMo=;
        b=AIEzpN7Viy8fITg+WgILGzdkPKoCxz91QnyZ00qU3pfhnNibFeAaGm39HZgGJ8fgLQ
         rSEpMoghIM0j5kgXAW1oUg731aLSWogB+mIbq8VST4rlZI7dKrZH6B86eHYcP3jCVZw8
         L9L5h0FJKCXM/r6cKx9roRGnlXbGz711ljiy1k3DLeuZAFDCn+PuJx4WCfYL9N3LB9Fi
         L9j6qefMCyZ+Ezl5awOmsdCi3KKp/3JGY/WtZ7P8hiPb2jriDof/9YXvIZjxOuNprR9c
         mha9DdNe0vXgA5fLXNMQ5wQyPAcfqAfqwEQQh2Q7Z28bH/XOnAZNmOIPHexPGsVuJIDK
         WanA==
X-Forwarded-Encrypted: i=1; AJvYcCX/XluqDXfdr7UOWcnbjeLAiPJ0YNcvLf4sMxeo6Y1g6yHx0R9EX+r632KOEiSRjgSvePzTvxFqFMceEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBfuSMKlf28ofq2A6mXNOOPftB/HRmGXTrPjEnhBBiGp2GX7Bp
	S9VIYoIGH7kEj+IjDS5rcfcSGSUapn58HFUUSUWxl07g6eMPN2q3VR4COvQ7CERZUxw=
X-Gm-Gg: AZuq6aJdjafpx98S+ia3L6170FpbqW1UR1boXcyIP4A4k2lG2dsSAHjCwgsVc4yjYKm
	cTD82lRqX2XO/00zsNd8fnoImkTDHXybVkW68LiyYmyZC37JZ5oEzUYytoGczoP9tlnKm9QQ75B
	kKOxeCRM+AL6n7NdM8eEOTxhWE/k7Qu1b0fYTMwjCVQPN2giHUa6PdaO/9JN/uY9ICrY68SofJ1
	YVa7xu3LnaJbCIeWYBYvjGYpEHjRZcFokdGtAPL10ukZTiAbrELM3dLROLCiOFpRAIzm/V9LcwI
	dvWSHRn/E/gkYebH6UQf/vCAcDw7ixvyGSvYim5x913gkYIUenfU40XXEmbzbd5kT00LpI/EjLJ
	M35ATKR9XztTRDX50j7Ni+IoDsmKtkglWlgpOq6AAui5hpj2UAV4xKv6/ILe9VEMG2kgHGmkKnO
	IeF88TsTZLx5wt2c+WppvgpfJrYy/p52wynxopiuerLqx8codgr+G71VHolVIIyHA=
X-Received: by 2002:a05:6000:1089:b0:435:91b8:e029 with SMTP id ffacd0b85a97d-435dd1bd8b0mr1370455f8f.37.1769510825296;
        Tue, 27 Jan 2026 02:47:05 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7c8efsm37797054f8f.42.2026.01.27.02.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 02:47:04 -0800 (PST)
Message-ID: <1576d328-0fca-40c6-8116-cc4e9bb045ca@linaro.org>
Date: Tue, 27 Jan 2026 10:47:03 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: i2c: ov02c10: Correct power-on sequence and
 timing
To: Hans de Goede <hansg@kernel.org>, Saikiran <bjsaikiran@gmail.com>,
 linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 bod@kernel.org, vladimir.zapolskiy@linaro.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, stable@vger.kernel.org
References: <20260126173444.10228-1-bjsaikiran@gmail.com>
 <20260126173444.10228-3-bjsaikiran@gmail.com>
 <a1108367-30dd-49fb-8a36-bab9a242bd51@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <a1108367-30dd-49fb-8a36-bab9a242bd51@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51625-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 93C859331A
X-Rspamd-Action: no action

On 27/01/2026 10:40, Hans de Goede wrote:
> Hi,
> 
> On 26-Jan-26 18:34, Saikiran wrote:
>> 1. Assert XSHUTDOWN (reset) for 10ms (T1 >= 5ms) before enabling power.
>> 2. Enable regulators and wait 20ms for ramp-up stabilization.
>> 3. Enable clock and wait 10ms for stabilization.
>> 4. De-assert XSHUTDOWN.
>> 5. Wait 20ms (T2 >= 20ms) for sensor boot before I2C access.
>> 6. Perform software reset (0x0103) to ensure clean state.
>>
>> This eliminates potential race conditions and stability issues during cold boot initialization.
>>
>> Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
>> Fixes: 44f8901 ("media: i2c: add OmniVision OV02C10 sensor driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
>> ---
>>   drivers/media/i2c/ov02c10.c | 57 ++++++++++++++++++++++++++++++-------
>>   1 file changed, 46 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
>> index fa7cc48b769a..ba8bbb4f433a 100644
>> --- a/drivers/media/i2c/ov02c10.c
>> +++ b/drivers/media/i2c/ov02c10.c
>> @@ -22,6 +22,8 @@
>>   #define OV02C10_CHIP_ID			0x5602
>>   
>>   #define OV02C10_REG_STREAM_CONTROL	CCI_REG8(0x0100)
>> +#define OV02C10_REG_SOFTWARE_RESET	CCI_REG8(0x0103)
>> +#define OV02C10_SOFTWARE_RESET_TRIGGER	0x01
>>   
>>   #define OV02C10_REG_HTS			CCI_REG16(0x380c)
>>   
>> @@ -616,6 +618,13 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
>>   	if (ret)
>>   		goto out;
>>   
>> +	/*
>> +	 * Delay before streaming:
>> +	 * Give the sensor time to process all the register writes and internal
>> +	 * calibration before we assert the STREAM_ON bit.
>> +	 */
>> +	usleep_range(2000, 2500);
>> +
> 
> Why? I've never seen any sensor driver do this and AFAICT this
> is also not mentioned as a requirement in the datasheet.
> 
>>   	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 1, NULL);
>>   out:
>>   	if (ret)
>> @@ -660,13 +669,13 @@ static int ov02c10_power_off(struct device *dev)
>>   	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>   	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>>   
>> -	gpiod_set_value_cansleep(ov02c10->reset, 1);
>> +	if (ov02c10->reset)
>> +		gpiod_set_value_cansleep(ov02c10->reset, 1);
> 
> No need to add this if (), gpiod_set_value() will happily
> take a NULL gpio_desc * and ignore it.
> 
>> +	clk_disable_unprepare(ov02c10->img_clk);
>>   	regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
>>   			       ov02c10->supplies);
>>   
>> -	clk_disable_unprepare(ov02c10->img_clk);
>> -
> 
> Why? All datasheets say that the clock may be enabled either
> before or after the regulators there is no need for this change.
> 
> 
>>   	return 0;
>>   }
>>   
>> @@ -676,27 +685,53 @@ static int ov02c10_power_on(struct device *dev)
>>   	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>>   	int ret;
>>   
>> -	ret = clk_prepare_enable(ov02c10->img_clk);
>> -	if (ret < 0) {
>> -		dev_err(dev, "failed to enable imaging clock: %d", ret);
>> -		return ret;
>> +	if (ov02c10->reset) {
>> +		gpiod_set_value_cansleep(ov02c10->reset, 1);
>> +		usleep_range(10000, 11000);
>>   	}
> 
> Ack for asserting the reset for 10 ms here, that is the only part
> of this patch which seems to actually be useful.
> 
>>   
>>   	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
>>   				    ov02c10->supplies);
>>   	if (ret < 0) {
>>   		dev_err(dev, "failed to enable regulators: %d", ret);
>> -		clk_disable_unprepare(ov02c10->img_clk);
>>   		return ret;
>>   	}
>>   
>> +	/* Allow PMIC to ramp and stabilize */
>> +	usleep_range(20000, 22000);
> 
> 
> If the regulators need a delay before stabilizing that should
> be done by the regulator driver, not here.
> 
>> +
>> +	ret = clk_prepare_enable(ov02c10->img_clk);
>> +	if (ret < 0) {
>> +		dev_err(dev, "failed to enable imaging clock: %d", ret);
>> +		regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
>> +				       ov02c10->supplies);
>> +		return ret;
>> +	}
> 
> Again no need to change the clk vs regulator enable order.
> 
>> +
>> +	/* Let the clock stabilise */
>> +	usleep_range(10000, 11000);
> 
> Same as with regulators if this is necessary it should be
> handled by the clk driver.
> 
>> +
>> +	/* Release hardware reset */
>>   	if (ov02c10->reset) {
>> -		/* Assert reset for at least 2ms on back to back off-on */
>> -		usleep_range(2000, 2200);
> 
> Ack for dropping this usleep() since this is now done before
> enabling the regulators.
> 
>>   		gpiod_set_value_cansleep(ov02c10->reset, 0);
>> -		usleep_range(5000, 5100);
>> +		/*
>> +		 * Wait for sensor microcontroller to stabilize after reset release.
>> +		 * 20ms prevents black frames during rapid power cycling.
>> +		 */
>> +		usleep_range(20000, 22000);
>> +	}
> 
> Why? this is not what the datasheet says.
> 
>> +
>> +	/* Perform software reset to ensure clean state */
>> +	ret = cci_write(ov02c10->regmap, OV02C10_REG_SOFTWARE_RESET,
>> +			OV02C10_SOFTWARE_RESET_TRIGGER, NULL);
>> +	if (ret) {
>> +		dev_err(dev, "failed to send software reset: %d", ret);
>> +		return ret;
>>   	}
>>   
>> +	/* Wait for software reset to complete */
>> +	usleep_range(5000, 5500);
>> +
> 
> Please drop this whole sw-reset thing. We've just hw-reset the sensor
> so there is no need. Also this should be done in a separate commit
> if it were to be done at all.
> 
> Regards,
> 
> Hans
> 
> 

To be clear, I was asking for an _experiment_ not a patch ...

---
bod

