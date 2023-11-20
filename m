Return-Path: <linux-media+bounces-599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 071747F0F9E
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 11:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1C1B281D36
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 10:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E203125D1;
	Mon, 20 Nov 2023 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NQ8BHGRG"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE9B9E
	for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 02:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700474421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bACPf6UNJWXXkTKJlIDjyj3lyaxEqFw5PLd8QQGVRHc=;
	b=NQ8BHGRGKSiyh74PEjzxKJERpDaszg9fi14W1DcW7HT8Tl9e6KkbH/XxAHhUJckI18rhhq
	Tx64dtZ7ZuuJFfesKrMRtHl0SFdG/xTM0LoDunf8rErn8yXGOpW0PtozAEgBeNmMmtxv3Q
	7uRzidTIvByBPZkXDk0UCO047kj/S+0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-6yaPQ_U2PiuiWxviaJhSDQ-1; Mon, 20 Nov 2023 05:00:17 -0500
X-MC-Unique: 6yaPQ_U2PiuiWxviaJhSDQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9fffc9250eeso22312866b.1
        for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 02:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700474416; x=1701079216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bACPf6UNJWXXkTKJlIDjyj3lyaxEqFw5PLd8QQGVRHc=;
        b=oJU0iN0nkiyPOannKDfW1kbWb4udeEAIHww7NUwW6BlEUe3pI4eZTeu1H+z0jN8r2I
         lwm9a72hOI7Z6uCmueWtNeXhM8PIlsqgBhag4gQoEE5IGUX3HQgN91fVcjl2SO8PhhNo
         ROswsvm0A6vo1tFL56zgjr13X0hI1AiOdAobyOiGRpCoGXULpW24901wIFMhfDoLNMuA
         0Jqq0ylPnLYjgI6wEoqwxA1LPS/LiJLBTPyFyeb3U3+p8fcEJDWvoE0kCg11ees7Sl+q
         dpdV3r5gmzTFrojwpFFn8CBIk7gw7wZB2bmmeqwMImWd3HtzKHaDzL+jItP8Pr7/kWLb
         hjmg==
X-Gm-Message-State: AOJu0YyBlLyBf9qPbafpJH5syXK8RCjVg//ychr2Fb5daWfVPpvoYTCr
	cv2HnQNkLibZLURLsThkyIG53S2BVGyhT27zWyWbIVD/B6yTphGtGT3CUuvqnE3Zk5pE3Awh4vH
	jAAkmiUv7r9QfqkvLl+pNRHI=
X-Received: by 2002:a17:907:91cd:b0:9fe:6583:ce90 with SMTP id h13-20020a17090791cd00b009fe6583ce90mr1574050ejz.63.1700474416042;
        Mon, 20 Nov 2023 02:00:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiflDZsVBoMtSfK6+HZsk+I52sVhQ05sbB3kfthGs9ePsUJBB+cUQzacuin2VacPz0/MBAMg==
X-Received: by 2002:a17:907:91cd:b0:9fe:6583:ce90 with SMTP id h13-20020a17090791cd00b009fe6583ce90mr1574031ejz.63.1700474415775;
        Mon, 20 Nov 2023 02:00:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dx25-20020a170906a85900b009f826f1238esm3565520ejb.100.2023.11.20.02.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 02:00:14 -0800 (PST)
Message-ID: <61da944f-7a63-4ce5-8387-7dc5267201da@redhat.com>
Date: Mon, 20 Nov 2023 11:00:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: ov2740: Add support for external clock
Content-Language: en-US, nl
To: Bingbu Cao <bingbu.cao@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 linux-media@vger.kernel.org
References: <20231115123817.196252-1-hdegoede@redhat.com>
 <20231115123817.196252-3-hdegoede@redhat.com>
 <229e4b91-8ce4-b82f-1a18-b23de36d5da7@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <229e4b91-8ce4-b82f-1a18-b23de36d5da7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bingbu,

On 11/20/23 05:06, Bingbu Cao wrote:
> 
> Hans,
> 
> On 11/15/23 8:38 PM, Hans de Goede wrote:
>> On some ACPI platforms, such as Chromebooks the ACPI methods to
>> change the power-state (_PS0 and _PS3) fully take care of powering
>> on/off the sensor.
>>
>> On other ACPI platforms, such as e.g. various ThinkPad models with
>> IPU6 + ov2740 sensor, the sensor driver must control the reset GPIO
>> and the sensor's clock itself.
>>
>> Add support for having the driver control an optional clock.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/ov2740.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
>> index e5f9569a229d..0a87d0920eb8 100644
>> --- a/drivers/media/i2c/ov2740.c
>> +++ b/drivers/media/i2c/ov2740.c
>> @@ -3,6 +3,7 @@
>>  
>>  #include <asm/unaligned.h>
>>  #include <linux/acpi.h>
>> +#include <linux/clk.h>
>>  #include <linux/delay.h>
>>  #include <linux/gpio/consumer.h>
>>  #include <linux/i2c.h>
>> @@ -336,6 +337,7 @@ struct ov2740 {
>>  
>>  	/* GPIOs, clocks */
>>  	struct gpio_desc *reset_gpio;
>> +	struct clk *clk;
>>  
>>  	/* Current mode */
>>  	const struct ov2740_mode *cur_mode;
>> @@ -1068,6 +1070,7 @@ static int ov2740_suspend(struct device *dev)
>>  	struct ov2740 *ov2740 = to_ov2740(sd);
>>  
>>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
>> +	clk_disable_unprepare(ov2740->clk);
>>  	return 0;
>>  }
>>  
>> @@ -1075,6 +1078,11 @@ static int ov2740_resume(struct device *dev)
>>  {
>>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>  	struct ov2740 *ov2740 = to_ov2740(sd);
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(ov2740->clk);
>> +	if (ret)
>> +		return ret;
>>  
>>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
>>  	msleep(20);
>> @@ -1102,6 +1110,10 @@ static int ov2740_probe(struct i2c_client *client)
>>  		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
>>  				     "failed to get reset GPIO\n");
>>  
>> +	ov2740->clk = devm_clk_get_optional(dev, "clk");
>> +	if (IS_ERR(ov2740->clk))
>> +		return dev_err_probe(dev, PTR_ERR(ov2740->clk), "failed to get clock\n");
>> +
> 
> I am not very sure that the 80-char rule is still valid for checkpatch.pl.

checkpatch.pl defaults to allowing longer lines (<100 chars) now,
but you are right that the linux-media maintainers prefer 80.

Still there is an exception to not split strings running
over the limit and this line ends with a string,
so I think that this is fine.

Regards,

Hans



