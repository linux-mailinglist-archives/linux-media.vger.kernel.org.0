Return-Path: <linux-media+bounces-4635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7D4848535
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 11:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 974191C215D9
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 10:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082715D8E1;
	Sat,  3 Feb 2024 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eVPtg6ho"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4F441C9D
	for <linux-media@vger.kernel.org>; Sat,  3 Feb 2024 10:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706957311; cv=none; b=ZmxQl1GU0VXpKDfUo+TyotXDRWZISdUoBYUr8K8CNz0t9q5rUt36mph8box19rkKF5yB/N7RxhiOony6AB7+y/SwW5RHwt9tHdsTkL0tw/f3SUgJXYEh/NdBcszVescGOuVEoUP49P2ktgrU+XN3IhfjQ1ep0L0E6En3qRZcSYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706957311; c=relaxed/simple;
	bh=OYITt6OAwqkISaS5CaElt17yRAEQB8NXrf8P15g2AjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdkFewVkgeTOj+HSZQw3MStAJG002h3+2BJ8GbBI0UeG9EhEZW43T+IFlWPANSFGy7+wU3jGnF6daRdoTa5zvUE2k2Ey3LaGFxlW+eKPwMdzweRY+plzHXZovgmlcXDeFCO90/RnkENsDL0aCXvQdBkODVBN+Y5VLqh5yQRPXiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eVPtg6ho; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706957306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Cs37blSYSjxjCCR7oaRtSH74q2YESwqJ5ei2SlO+t8=;
	b=eVPtg6hoKOh5Q2AurX+1XB7khy/cehgeJSRbmoSeyqXwP4tEeJ2lrQ2xt4wEKQZsqa7JLi
	m8cY9/P0nyXpqddfjou/pAA2FyiW7eIsPp1kasaixcFvNSC55ZaBpZqEJDK0dtrBXK4+So
	SUJ6ynzR5VqkXz0BttcVcUuTnfIZK7w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-VABp21L1Ng68V_v8dQVxqw-1; Sat, 03 Feb 2024 05:48:25 -0500
X-MC-Unique: VABp21L1Ng68V_v8dQVxqw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a2cb0d70d6cso178755766b.2
        for <linux-media@vger.kernel.org>; Sat, 03 Feb 2024 02:48:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706957304; x=1707562104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Cs37blSYSjxjCCR7oaRtSH74q2YESwqJ5ei2SlO+t8=;
        b=UzM7ODAafxuj7StDoLJKapyXr/C2pv0vxr83gRH3sxN7nWmFichKY3fhTJSK99xKm9
         5mVrKdJNKsaCa7CbC8awe1HkOWJt1peOkrkzRAAhQVpiwkQ8LbZT7cgkzViUdxNPGF8g
         CSJRN6CQBMzpbQOdpJLdBrYN+OufyUfxVH1SfvK9J0G5vswOUuS/iioKSv+oXSLp0Wyi
         UkIzBb8hyweQPW1ihgFg6zrD0ZwG6FZdF3xMFRJhJLOKA+7kws75DL1pcY4sfYGHHjj7
         NM/6oMxVi/KkaNV6h4TWz668uuxnvS4hbggdDCZWvevbSvXZyLMVYWGXB1mwVhzESjA8
         kpbg==
X-Gm-Message-State: AOJu0Yx3lVAsQ1woDu1I+Sx5XT8RjvbkXm0X7Woni64QymOaqDPXZSul
	52abUq+Q5irjMiQZpdhw1L1uew691JkLLg7ZQnDqdqNegCCmWETC+lDDxiWEzyXcYhCcJsXoNid
	03gytT7IarV4NNq/otyzT9AK5RLpt0FoXOtL/mVwvUojjsIELqUZ4Xx3Ja6Y1
X-Received: by 2002:a17:906:f1cf:b0:a34:ba76:9818 with SMTP id gx15-20020a170906f1cf00b00a34ba769818mr3148696ejb.50.1706957304105;
        Sat, 03 Feb 2024 02:48:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqf6NK4uv80YxLKsPweq26HjXTSa073+Gpk+bMaNDspUP/OcPtUuRwxg8Z5vQIaKyQtdaELw==
X-Received: by 2002:a17:906:f1cf:b0:a34:ba76:9818 with SMTP id gx15-20020a170906f1cf00b00a34ba769818mr3148687ejb.50.1706957303784;
        Sat, 03 Feb 2024 02:48:23 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUli9OiawgWtTrqErSL9gGrqv4zTliAHn7OqWY9FVklAcZwtBA+c6fxIjV4CHdTkFrLf4phiIs1Vuid+NAqdsmSNFJEio1KOn/I8slV6M7CnmSGNsUy4Wh/0vYCtsUWR52p4zdjlYmm9CuwIY/C9o7qAmqRU+OOswZncFeb+PJIMHA=
Received: from ?IPV6:2001:67c:1810:f055:5ece:a1cd:bd1c:a8db? ([2001:67c:1810:f055:5ece:a1cd:bd1c:a8db])
        by smtp.gmail.com with ESMTPSA id p4-20020a17090628c400b00a360239f006sm1859075ejd.37.2024.02.03.02.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 02:48:22 -0800 (PST)
Message-ID: <891b9a9e-3cfd-4f06-9272-0a5835cb0b84@redhat.com>
Date: Sat, 3 Feb 2024 11:48:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: hi556: Add support for avdd regulator
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 linux-media@vger.kernel.org
References: <20240201215841.153499-1-hdegoede@redhat.com>
 <20240201215841.153499-5-hdegoede@redhat.com>
 <6mi7ua4rtzbi7quvlgiokzeduz7i2bpbbouq3pgunsgwmpr7wj@ocjmpkjpdu7n>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6mi7ua4rtzbi7quvlgiokzeduz7i2bpbbouq3pgunsgwmpr7wj@ocjmpkjpdu7n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/3/24 11:15, Jacopo Mondi wrote:
> Hi Hans
> 
> On Thu, Feb 01, 2024 at 10:58:41PM +0100, Hans de Goede wrote:
>> On some ACPI platforms, such as Chromebooks the ACPI methods to
>> change the power-state (_PS0 and _PS3) fully take care of powering
>> on/off the sensor.
>>
>> On other ACPI platforms, such as e.g. various HP models with IPU6 +
>> hi556 sensor, the sensor driver must control the avdd regulator itself.
>>
>> Add support for having the driver control the sensor's avdd regulator.
>> Note this relies on the regulator-core providing a dummy regulator
>> (which it does by default) on platforms where Linux is not aware of
>> the avdd regulator.
>>
> 
> Please excuse the question from an ACPI illiterate, but does it mean
> that, in example:
> 1) Chromebooks: you get a dummy
> 2) HP: you get an actual regulator reference

Yes that is correct.

Regards,

Hans




> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/hi556.c | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
>> index fb6ba6984e38..90eff282a6e2 100644
>> --- a/drivers/media/i2c/hi556.c
>> +++ b/drivers/media/i2c/hi556.c
>> @@ -9,6 +9,7 @@
>>  #include <linux/i2c.h>
>>  #include <linux/module.h>
>>  #include <linux/pm_runtime.h>
>> +#include <linux/regulator/consumer.h>
>>  #include <media/v4l2-ctrls.h>
>>  #include <media/v4l2-device.h>
>>  #include <media/v4l2-fwnode.h>
>> @@ -638,6 +639,7 @@ struct hi556 {
>>  	/* GPIOs, clocks, etc. */
>>  	struct gpio_desc *reset_gpio;
>>  	struct clk *clk;
>> +	struct regulator *avdd;
>>
>>  	/* Current mode */
>>  	const struct hi556_mode *cur_mode;
>> @@ -1287,8 +1289,17 @@ static int hi556_suspend(struct device *dev)
>>  {
>>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>  	struct hi556 *hi556 = to_hi556(sd);
>> +	int ret;
>>
>>  	gpiod_set_value_cansleep(hi556->reset_gpio, 1);
>> +
>> +	ret = regulator_disable(hi556->avdd);
>> +	if (ret) {
>> +		dev_err(dev, "failed to disable avdd: %d\n", ret);
>> +		gpiod_set_value_cansleep(hi556->reset_gpio, 0);
> 
> I understand in error paths you're supposed to reverse the previously
> done operations, but, as this is a reset, isn't it better to keep the
> reset enabled since we're suspending anyway ?
> 
>> +		return ret;
>> +	}
>> +
>>  	clk_disable_unprepare(hi556->clk);
>>  	return 0;
>>  }
>> @@ -1303,6 +1314,13 @@ static int hi556_resume(struct device *dev)
>>  	if (ret)
>>  		return ret;
>>
>> +	ret = regulator_enable(hi556->avdd);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable avdd: %d\n", ret);
>> +		clk_disable_unprepare(hi556->clk);
>> +		return ret;
>> +	}
>> +
>>  	gpiod_set_value_cansleep(hi556->reset_gpio, 0);
>>  	usleep_range(5000, 5500);
>>  	return 0;
>> @@ -1338,6 +1356,12 @@ static int hi556_probe(struct i2c_client *client)
>>  		return dev_err_probe(&client->dev, PTR_ERR(hi556->clk),
>>  				     "failed to get clock\n");
>>
>> +	/* The regulator core will provide a "dummy" regulator if necessary */
>> +	hi556->avdd = devm_regulator_get(&client->dev, "avdd");
>> +	if (IS_ERR(hi556->avdd))
>> +		return dev_err_probe(&client->dev, PTR_ERR(hi556->avdd),
>> +				     "failed to get avdd regulator\n");
>> +
>>  	full_power = acpi_dev_state_d0(&client->dev);
>>  	if (full_power) {
>>  		/* Ensure non ACPI managed resources are enabled */
>> --
>> 2.43.0
>>
>>
> 


