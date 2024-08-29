Return-Path: <linux-media+bounces-17175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A56965275
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 23:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5D03281952
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 21:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D351B81DE;
	Thu, 29 Aug 2024 21:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UHq0wD51"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2001818A950
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724968651; cv=none; b=NFzxV+kOPmNs6vLQ4kOcsq6MTCeZwXlUhPDCY9hD5eabMYVKQxZs3orPfDBPaUbThf1ITbArBYjKB1Ld/hO/WcYZa/n2+Op8HgkJt9boIiZJSCckuwqTsxc+9moK3VS8DVLYD1Ixkyo9QYtePox16KzybJ8oIWwpXC9oCzuJjTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724968651; c=relaxed/simple;
	bh=URz6oYBKhRDtktZ7qx/14zHrKcP8zR/tACnq5TIW3VY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FxnUY5luuV4OaVIljEI897RqU2bIt+bqzWMPdiH1TYNGO99SSZLRwXtZbuZXBraeybY13wWcNdKadIpnhfVB7C1oT7g5dzhYCVUD0ZHiHcp6JF6TAFP/oaaO+4exMXMCPVl0co0fyRzWovwg0FMlI8qWNlln4wrU2rtCaewJxYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UHq0wD51; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5334eec7485so176673e87.3
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 14:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724968647; x=1725573447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eq6NcHSjfco1dKCQFiU40L3MonsqvPVzHRQzpYvEMiM=;
        b=UHq0wD51Rk0kwg/c2YGZARj+hH/tWKsft1eyvJkwfoZyIT1EzmTvajLqCROkXn2X9O
         JO2b3iW0SSiLL60seg0mqeh4j6yig82Ox2FMp2Yd4+8FUWY3tVcVMZ1z0ighXOuMalUY
         kE11XpCFDQO2ceSR+tiUR2R4VnwQqmn1Tn8fCEqHr/dQ33IGbD14ZVLv+OUbv1pPBKHX
         Az3fejvtfuHkFoMF/Vj0T0jy6PU8Fvc0VMcDwEXmewnn/a0OltXbJ3I4od2SNMmAYMln
         1o4tEjHn5g4Hls03AqClTwoJvtyx2GW7qiRVRe0Mtf2TnjVBhKpwhuzG3tzd0aAewyic
         UmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724968647; x=1725573447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eq6NcHSjfco1dKCQFiU40L3MonsqvPVzHRQzpYvEMiM=;
        b=K5699Jf+yjWMnlYa6RLKFhqfaY4ACXFM7afwWjY2Tm2BOpOv3T54a3uN3QdsxhvpLj
         vFqxb32WW/heiveuODNn7NUy+rXbq0WPyPHrtp9rcV9eFuWnJ1/rBYEnCgPpfnSuFEBo
         DoallGpbYZ7Kemi8zxT1wv9KkEMhtbZz7fcj6/KJpRPLJj1JJsQZqyUYnGSgIATpIUfY
         uMllb6awv1Felbm+9RrZ1qjyDiEZdg8gfQ9ER8C4OMx05GDlpUmmYqjYFfBi3Ca03r0x
         HBbDNu4AftzuJGRejjEwSKzMFocirR7b7Lb3o4IQ7mNPw/XUNmMZRVR2Z52u130oDjDm
         RInA==
X-Forwarded-Encrypted: i=1; AJvYcCWD4j3mf6GXoQ309Af3gqmUzhUDsqOLBNG2oCKk9fzc/wis0RCI8SittMy/m3ZqIUX6k89dfs9dk517Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9bmDqejlAbTITPwLWGhthfGFhdUe9xUjqmvSFF18+7qlCyaOv
	OjYhzoNo6oZPGc6d+pX393eDaGDEBbHcmKWFFPYo6GoaIIG6QewsFYgnnAseHwA=
X-Google-Smtp-Source: AGHT+IGnnEJAOx9zsEmqtRhppuQPei114YZzkog+DPmxWaKGWmLIRnCsX4SXPEt/nro9hp1BHFDxUQ==
X-Received: by 2002:a05:6512:1589:b0:52f:cad0:2d4a with SMTP id 2adb3069b0e04-5353e5be1b6mr1667119e87.9.1724968646843;
        Thu, 29 Aug 2024 14:57:26 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540841dfbsm264849e87.230.2024.08.29.14.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 14:57:26 -0700 (PDT)
Message-ID: <1cea7cde-dde9-4b83-8e7c-9b77fe64e6db@linaro.org>
Date: Fri, 30 Aug 2024 00:57:16 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] media: i2c: og01a1b: Add management of optional
 sensor supply lines
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org
References: <20240823102731.2240857-1-vladimir.zapolskiy@linaro.org>
 <20240823102731.2240857-7-vladimir.zapolskiy@linaro.org>
 <Zs7bOr3hbrd2gG60@kekkonen.localdomain>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <Zs7bOr3hbrd2gG60@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sakari,

thank you for review.

On 8/28/24 11:09, Sakari Ailus wrote:
> Hi Vladimir,
> 
> Thanks for the update.
> 
> On Fri, Aug 23, 2024 at 01:27:31PM +0300, Vladimir Zapolskiy wrote:
>> Omnivision OG01A1B camera sensor is supplied by three power rails,
>> if supplies are present as device properties, include them into
>> the sensor power up sequence.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   drivers/media/i2c/og01a1b.c | 86 ++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 85 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
>> index 90a68201f43f..0150fdd2f424 100644
>> --- a/drivers/media/i2c/og01a1b.c
>> +++ b/drivers/media/i2c/og01a1b.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/i2c.h>
>>   #include <linux/module.h>
>>   #include <linux/pm_runtime.h>
>> +#include <linux/regulator/consumer.h>
>>   #include <media/v4l2-ctrls.h>
>>   #include <media/v4l2-device.h>
>>   #include <media/v4l2-fwnode.h>
>> @@ -422,6 +423,9 @@ static const struct og01a1b_mode supported_modes[] = {
>>   struct og01a1b {
>>   	struct clk *xvclk;
>>   	struct gpio_desc *reset_gpio;
>> +	struct regulator *avdd;
>> +	struct regulator *dovdd;
>> +	struct regulator *dvdd;
>>   
>>   	struct v4l2_subdev sd;
>>   	struct media_pad pad;
>> @@ -982,11 +986,46 @@ static int og01a1b_power_on(struct device *dev)
>>   {
>>   	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>   	struct og01a1b *og01a1b = to_og01a1b(sd);
>> +	int ret;
>> +
>> +	if (og01a1b->avdd) {
>> +		ret = regulator_enable(og01a1b->avdd);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	if (og01a1b->dovdd) {
>> +		ret = regulator_enable(og01a1b->dovdd);
>> +		if (ret)
>> +			goto avdd_disable;
>> +	}
>> +
>> +	if (og01a1b->dvdd) {
>> +		ret = regulator_enable(og01a1b->dvdd);
>> +		if (ret)
>> +			goto dovdd_disable;
>> +	}
>>   
>>   	gpiod_set_value_cansleep(og01a1b->reset_gpio, 0);
>>   	usleep_range(USEC_PER_MSEC, 2 * USEC_PER_MSEC);
>>   
>> -	return clk_prepare_enable(og01a1b->xvclk);
>> +	ret = clk_prepare_enable(og01a1b->xvclk);
>> +	if (ret)
>> +		goto dvdd_disable;
> 
> Virtually all sensors require some delay between lifting the reset (which
> typically comes after enabling the regulators and the clock) and the first
> I²C access. This one appears to require 8192 XCLK cycles.

According to the spec in case of a non-free running clock the delay mentioned
by you is needed after enabling the clock, and in turn the clock is enabled
after a release on a reset/shutdown GPIO line.

The only supported by the driver clock frequency OG01A1B_MCLK is 19.2 MHz,
so the expected delay after start of the clock is less than 1/10 of a delay
after releasing the shutdown line and before entering the software standby
state.

I believe it would make sense to rearrange the power up sequence in this way:
- enable clock,
- if there is a reset GPIO, then release it and wait for 5ms (1ms is too short),
- otherwise if there is no reset GPIO, then wait for 8192 XCLK cycles (0.5ms).

--
Best wishes,
Vladimir

