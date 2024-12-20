Return-Path: <linux-media+bounces-23864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C449F9174
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B7B7189301D
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169251B6D16;
	Fri, 20 Dec 2024 11:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N7Mi/DAe"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A1C182B4
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 11:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694554; cv=none; b=n5Im/hGOSSgWt3keLs2DkDvSFeSvGzSaBt2TM4tFWk6L66d9O298hbMf33pQB8qmp9MAHkInjr1Ou2+cFy5FAoLDw+tPW71IbU7hXILLqhRGUHORILU2ID2GBMBo1KdX39EJr/NleNnaHaddAJ3Rf7yMMIh97n7+FxC0FKVpgE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694554; c=relaxed/simple;
	bh=8t7Ncj1zzZbs4csUqPbLF7VTkidBvKiU8aZ600Glwvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aW2YbzhoEEfjau2VLNDmn59kBLSp5Bp/Gg/fPrWaGohkibb4LTOkp/PllXbSxUvkTFcMnVav1APVCkDc8MWZ34zK4vdCw9MeDUfE+Qo5Ei2wjgob4DLncJ8E2/07OZtGHr9DLKHiLxW0fgDqqZrEnTIzsH+Lr7hLB4/fd0YwrFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N7Mi/DAe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734694551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CheazCphILHkA7XeB/NULPICiuVTJdagVKhcaWbsbo=;
	b=N7Mi/DAeXk3kV5Y1TnrB9dVKj1j3OozbQ9o4YUdtOMjhw6vnrlBpmSWTMQS5wzQN9R6TgN
	X+FrNzPTEdWocquzFPOmVoegKbQjlvpQSM4qZwO78eHug3wSua2ENGZCpuHnH7Wq8rDNaS
	1vgd+1wV2/2VvTJhOp0G3iU0DNJ62tc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-XcWHqJjAO_i9uXRXmNpFzw-1; Fri, 20 Dec 2024 06:35:50 -0500
X-MC-Unique: XcWHqJjAO_i9uXRXmNpFzw-1
X-Mimecast-MFC-AGG-ID: XcWHqJjAO_i9uXRXmNpFzw
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aab954d1116so192394566b.3
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 03:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734694549; x=1735299349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4CheazCphILHkA7XeB/NULPICiuVTJdagVKhcaWbsbo=;
        b=vgXZxUOslpjgDDT4PAACBuGqNx7gwpahOrJZDYjpc3ZJjOgYi/lZJ/szZpDB4dbyqj
         YnWFvHr7UvIhPTwVHf1nl98/0k6o9mPw5yFyga8dsC75FwMPnRgD3gCc9Dn0CRoqhm7T
         i13Zq6ZUpWzlax93Ggpk2nGNnFkxwLCgl+i7WnlB7JN+oLtoKA1/IkdFRnWmcv18Llx+
         4vtfrg0+yT2/cebg1vVP4gNaiIPV8h5LuxWedjeY+iKrpwSL1hp1JC3KluFBi2dxBQXv
         jR3jVFc68TGuScNkWc1tnTzg3QMxz6IVIWzyEL8hdzVpxTcxhNzzssyBoG2Pb+zBh3e/
         Iouw==
X-Forwarded-Encrypted: i=1; AJvYcCWHiBn+HmptPeZgIcCVAasonRqI85erzbbBZPM4pdJIDkKisMkbBLcP7dKT6/ECuQ6hAeRrGuCqweK9GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPBBtOO7iaGZ0ri6Fj8zy6baL/CSK/wMI5C8XbVo7xsGcArrW1
	xedJA0ABzaml2Mhf6w4Je2MkUz+NQzXdFHJprvFeD4srvzwCxK+FAkoxf4JdBX1sVrDgyf9I2dd
	GQ+NmS4QQnQ+6Xz+khAO+4t1cKFWNVP1ROH/0N6qDMavDmVrJsdTzrV+tsKMF
X-Gm-Gg: ASbGncuyE/tIOPzF8FSQCyOuU2LvHIDXz8kxsqCQCC3m+SFdYbICPZKqU9x0bY75lYf
	smImqlTHbVbUU9rQKMtRKcH/DKLvAMFMkgtCeKBRc7wscjEUQjP7XO6zzuKg01P0Me8VoiYpFuR
	pPV3x0MhJAEqIoch/YcwqNionpJ1LV3Z154MxX5aNZRt6KdjX2rdFtrZTWpP3QpxejdJLkO/Cy4
	yCGcw0oQ6PsgIMbfWrqPECqSqKIQSDAZo9u7O1ZFXIT7LPzRlTokyjxX7U5IZgwnpIxJovfWpOi
	70BKRv2c437qM/339P/fLwhl3SMxVncHfX6AHPpFuMFNru7G+iHTVdkTGxgrfuSejicixI3GF4c
	KxGM2suQx0R2xkrLsQmcHOU+0hsBFP3c=
X-Received: by 2002:a17:907:7f13:b0:aa6:8f71:1645 with SMTP id a640c23a62f3a-aac3365c829mr179585066b.55.1734694549037;
        Fri, 20 Dec 2024 03:35:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCysXKSXWYVMdYsVI7QM54ejPTrjx4tl5slNqOc90fIYLokJS+bHrMoAdeCxj98qfETj4Sog==
X-Received: by 2002:a17:907:7f13:b0:aa6:8f71:1645 with SMTP id a640c23a62f3a-aac3365c829mr179583566b.55.1734694548610;
        Fri, 20 Dec 2024 03:35:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06f847sm164349266b.202.2024.12.20.03.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 03:35:48 -0800 (PST)
Message-ID: <3affc3c5-8c40-44b9-9350-7f7c4876cda9@redhat.com>
Date: Fri, 20 Dec 2024 12:35:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: ov2740: Add powerdown GPIO support
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
References: <20241128152338.4583-1-hdegoede@redhat.com>
 <20241128152338.4583-4-hdegoede@redhat.com>
 <CAPybu_3dbFxTd3GF+_dfwEnVtmUiZsZ+bsyPqh9+G4m+nHHkxA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAPybu_3dbFxTd3GF+_dfwEnVtmUiZsZ+bsyPqh9+G4m+nHHkxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 28-Nov-24 5:53 PM, Ricardo Ribalda Delgado wrote:
> On Thu, Nov 28, 2024 at 4:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The ov2740 sensor has both reset and power_down inputs according to
>> the datasheet one or the other should always be tied to DOVDD but on
>> some designs both are attached to GPIOs.
>>
>> Add support for controlling both a reset and a powerdown GPIO.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> Same question as before :)

I assume that with this you mean if a call to v4l2_ctrl_handler_free()
is necessary on errors ?

That is not necessary in this case because the getting of the
GPIO is done before ov2740_init_controls().

Regards,

Hans


> 
>> ---
>>  drivers/media/i2c/ov2740.c | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
>> index 998e1977978d..14d0a0588cc2 100644
>> --- a/drivers/media/i2c/ov2740.c
>> +++ b/drivers/media/i2c/ov2740.c
>> @@ -525,6 +525,7 @@ struct ov2740 {
>>
>>         /* GPIOs, clocks */
>>         struct gpio_desc *reset_gpio;
>> +       struct gpio_desc *powerdown_gpio;
>>         struct clk *clk;
>>
>>         /* Current mode */
>> @@ -1306,6 +1307,7 @@ static int ov2740_suspend(struct device *dev)
>>         struct ov2740 *ov2740 = to_ov2740(sd);
>>
>>         gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
>> +       gpiod_set_value_cansleep(ov2740->powerdown_gpio, 1);
>>         clk_disable_unprepare(ov2740->clk);
>>         return 0;
>>  }
>> @@ -1320,6 +1322,7 @@ static int ov2740_resume(struct device *dev)
>>         if (ret)
>>                 return ret;
>>
>> +       gpiod_set_value_cansleep(ov2740->powerdown_gpio, 0);
>>         gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
>>         msleep(20);
>>
>> @@ -1348,9 +1351,17 @@ static int ov2740_probe(struct i2c_client *client)
>>         if (IS_ERR(ov2740->reset_gpio)) {
>>                 return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
>>                                      "failed to get reset GPIO\n");
>> -       } else if (ov2740->reset_gpio) {
>> +       }
>> +
>> +       ov2740->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
>> +       if (IS_ERR(ov2740->powerdown_gpio)) {
>> +               return dev_err_probe(dev, PTR_ERR(ov2740->powerdown_gpio),
>> +                                    "failed to get powerdown GPIO\n");
>> +       }
>> +
>> +       if (ov2740->reset_gpio || ov2740->powerdown_gpio) {
>>                 /*
>> -                * Ensure reset is asserted for at least 20 ms before
>> +                * Ensure reset/powerdown is asserted for at least 20 ms before
>>                  * ov2740_resume() deasserts it.
>>                  */
>>                 msleep(20);
>> --
>> 2.47.0
>>
>>
> 
> 


