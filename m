Return-Path: <linux-media+bounces-879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 947DE7F5BC6
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 10:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DB562818A5
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 09:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E958622338;
	Thu, 23 Nov 2023 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c/petqul"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D5E83
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 01:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700733430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2nNwW5ADIRp68fAijucSjwG9EwI7WOgsRcOBgOrlC0c=;
	b=c/petquledV9JKr7kOZbCNvCg6j8tNdiQJi7RFTK+alrQ0zGACvDvw/lozp1qyBLFqE9MB
	kCbjIx84wyWQJKgoKIebB3VNRUUhnf3dDQkFXf3guS9itQXemA8pflza0qf417WgGMmg/v
	3cKu2ktLRHpd6YfYqlfSQ9pt/0Ht66M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-t17lW5owMQOPeiv3Whh4AQ-1; Thu, 23 Nov 2023 04:57:07 -0500
X-MC-Unique: t17lW5owMQOPeiv3Whh4AQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-542d5dd0c8eso2056510a12.1
        for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 01:57:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700733426; x=1701338226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2nNwW5ADIRp68fAijucSjwG9EwI7WOgsRcOBgOrlC0c=;
        b=PPq0VhiWMFBl1sHRem9JS/+VZZsBbNeKVZ9uxdOVjS3O/wUdTaQhQHG+Sycwza7T0U
         7mraWwz2iVy7gG3xurheiTZOiF/qAfsbOXRF36mEa1kYVNF9mutHGUq3QuGGs+h90eH8
         wOD5acp0+mHSfDkZNycNb57bj9XAvCVY0IPe0/86M3cC6ypNplp3a7Na/6uMvGDiC35V
         TE7VQt/IpRK+LV73XDXyKwOl0x9kJJIp1pRaQnFnCehIJD49ZtvOv9fo9RJm7PRd/WDj
         FvGKmhStAHnGp7NvgqsUbDdwAf23zLIlEAubLvZ+1CjRuzVof1DvMc9GwamtUuAfgRuX
         M5kQ==
X-Gm-Message-State: AOJu0YwaKB7/56xA4s2AlGUe/Lq1k1GmyAf9arNH+K80usX21N9enYpv
	ovLvC6SkSH4iAPGrW8cb5Lcu+hfudp5ibHuksesKiVwJE41MnNipFi41wATZpMgkGIlKIVWbgTU
	Ct1qKjPRldnQIZcy/Oa5pTtQ=
X-Received: by 2002:aa7:d684:0:b0:52b:db44:79e3 with SMTP id d4-20020aa7d684000000b0052bdb4479e3mr1847668edr.4.1700733426390;
        Thu, 23 Nov 2023 01:57:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdssJ0yhA3EXnYSU01QSwWpN6jcGuEQnmqIqnYg/TZBNZSkHGg0P22XLzDEImNjPc78xkVCA==
X-Received: by 2002:aa7:d684:0:b0:52b:db44:79e3 with SMTP id d4-20020aa7d684000000b0052bdb4479e3mr1847652edr.4.1700733426096;
        Thu, 23 Nov 2023 01:57:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o26-20020a056402039a00b005487c48d9ebsm463537edv.57.2023.11.23.01.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 01:57:05 -0800 (PST)
Message-ID: <ffb0a493-0199-429c-849d-b76a2044bfec@redhat.com>
Date: Thu, 23 Nov 2023 10:57:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: ov2740: Add support for external clock
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 linux-media@vger.kernel.org
References: <20231115123817.196252-1-hdegoede@redhat.com>
 <20231115123817.196252-3-hdegoede@redhat.com>
 <229e4b91-8ce4-b82f-1a18-b23de36d5da7@linux.intel.com>
 <61da944f-7a63-4ce5-8387-7dc5267201da@redhat.com>
 <ZVuKIhNt3NnvzB-G@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZVuKIhNt3NnvzB-G@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/20/23 17:32, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Nov 20, 2023 at 11:00:14AM +0100, Hans de Goede wrote:
>> Hi Bingbu,
>>
>> On 11/20/23 05:06, Bingbu Cao wrote:
>>>
>>> Hans,
>>>
>>> On 11/15/23 8:38 PM, Hans de Goede wrote:
>>>> On some ACPI platforms, such as Chromebooks the ACPI methods to
>>>> change the power-state (_PS0 and _PS3) fully take care of powering
>>>> on/off the sensor.
>>>>
>>>> On other ACPI platforms, such as e.g. various ThinkPad models with
>>>> IPU6 + ov2740 sensor, the sensor driver must control the reset GPIO
>>>> and the sensor's clock itself.
>>>>
>>>> Add support for having the driver control an optional clock.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/media/i2c/ov2740.c | 12 ++++++++++++
>>>>  1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
>>>> index e5f9569a229d..0a87d0920eb8 100644
>>>> --- a/drivers/media/i2c/ov2740.c
>>>> +++ b/drivers/media/i2c/ov2740.c
>>>> @@ -3,6 +3,7 @@
>>>>  
>>>>  #include <asm/unaligned.h>
>>>>  #include <linux/acpi.h>
>>>> +#include <linux/clk.h>
>>>>  #include <linux/delay.h>
>>>>  #include <linux/gpio/consumer.h>
>>>>  #include <linux/i2c.h>
>>>> @@ -336,6 +337,7 @@ struct ov2740 {
>>>>  
>>>>  	/* GPIOs, clocks */
>>>>  	struct gpio_desc *reset_gpio;
>>>> +	struct clk *clk;
>>>>  
>>>>  	/* Current mode */
>>>>  	const struct ov2740_mode *cur_mode;
>>>> @@ -1068,6 +1070,7 @@ static int ov2740_suspend(struct device *dev)
>>>>  	struct ov2740 *ov2740 = to_ov2740(sd);
>>>>  
>>>>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
>>>> +	clk_disable_unprepare(ov2740->clk);
>>>>  	return 0;
>>>>  }
>>>>  
>>>> @@ -1075,6 +1078,11 @@ static int ov2740_resume(struct device *dev)
>>>>  {
>>>>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>>>  	struct ov2740 *ov2740 = to_ov2740(sd);
>>>> +	int ret;
>>>> +
>>>> +	ret = clk_prepare_enable(ov2740->clk);
>>>> +	if (ret)
>>>> +		return ret;
>>>>  
>>>>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
>>>>  	msleep(20);
>>>> @@ -1102,6 +1110,10 @@ static int ov2740_probe(struct i2c_client *client)
>>>>  		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
>>>>  				     "failed to get reset GPIO\n");
>>>>  
>>>> +	ov2740->clk = devm_clk_get_optional(dev, "clk");
>>>> +	if (IS_ERR(ov2740->clk))
>>>> +		return dev_err_probe(dev, PTR_ERR(ov2740->clk), "failed to get clock\n");
>>>> +
>>>
>>> I am not very sure that the 80-char rule is still valid for checkpatch.pl.
>>
>> checkpatch.pl defaults to allowing longer lines (<100 chars) now,
>> but you are right that the linux-media maintainers prefer 80.
>>
>> Still there is an exception to not split strings running
>> over the limit and this line ends with a string,
>> so I think that this is fine.
> 
> The rule is not to split strings in order to satisfy alignment rules. IOW
> the line should be wrapped before the string. :-)

Ok, will fix for v2.

Regards,

Hans



