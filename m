Return-Path: <linux-media+bounces-21167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CBC9C1FCD
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 15:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B955B23623
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 14:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41C41F5839;
	Fri,  8 Nov 2024 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TCBZUrCf"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FD31F4713
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731077881; cv=none; b=tCKUFeqVz+nDyc0sFfdfZv0uEiQFhkhfA0aal+CiXp9ab8ATQhcAxLK7nTbXOiOlFpzP5ytzuEeAZVXdLaWd0KJCK9Giw0oqyHAfv20zq7zQWzFNzCkJkLBL6RdgfXGxdVxhqkZhGrXpA/qiAczwh+LiecLr8ji0IubwVCM7+ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731077881; c=relaxed/simple;
	bh=dgsccprguIeSmF5hmwv+xiy3hnds5QZ1BPKAJQngRwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEbExsRE5fdfQiQPDmwxDo8hEo3+bj1fl3PfbrvPMYabCY3/qI3g6IyVLJgvC7g2VanLJWn/3BkSxrSY0L27LwuAdxTgY9OMx8tFf4p+pF5ytk0EmmzTpx60tJryWE8FeH4/6fs5LUKzfyuaFzLP4mbVMAwnV71EjK641ADGMZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TCBZUrCf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731077878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eES8xxr1yI/38pTpRKNgpuyAW4X2vEoW+igVHSYhfkc=;
	b=TCBZUrCfsh7WlHOi15SbAGFgMOHC8wHqFAMpnYS3TeoeZE0mkK6GQXv0vb9HjjoPx6E6sm
	TAj9NFPamFfGUsyyJJzcJPsYe28ivn9S8Bn00doUDwOXHfIR6Vw3/t3x+UF1DM/d/rbDk8
	oyRXo1b0Wg9tjxZNuqwMgi3lUVj2OV0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-_7KtNNvqPZq8yf_MoTwSQg-1; Fri, 08 Nov 2024 09:57:56 -0500
X-MC-Unique: _7KtNNvqPZq8yf_MoTwSQg-1
X-Mimecast-MFC-AGG-ID: _7KtNNvqPZq8yf_MoTwSQg
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c94ccfb210so1733927a12.1
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 06:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077875; x=1731682675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eES8xxr1yI/38pTpRKNgpuyAW4X2vEoW+igVHSYhfkc=;
        b=Ua6kgSh0I7P+vZljhx8e0HSz4q4kJw/HUzkEHkVJFq6QZ75JzecuHJuT7dCyVSgrSg
         NnyQXx/8j3/gV12mLF6rueeTT5KJU72J5fxU1iod2KlaeWmAp69V6d1i/rvo8iIqRIeu
         JLN5F5hbZFWGm0aKW72YNN43paqbMMcsF9OQYfeQz5jxK+b47NycIzbiHn33E4p2rglI
         9o5D5TfpA4cbqFCgeeF0q3EJmiOtWnriYdgMaUxPWATIIL+GN8K0iSxqpnIfKTzPS1YT
         cuqMtxap0Dh8qLMoon+w39gL3AxlDzUwD5euibOzjcZp03iXEYsENzZKu5xTkcbL0LpH
         J13A==
X-Forwarded-Encrypted: i=1; AJvYcCVpZZf/iEMxrvPo8U1OsbHPk7VgvBqMJlM6HkXhXPFeI1ga1KpFONt5I2fsb5UD/zrKDXqLxTg9KGhnww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQnxPzmVmO+tQqUigfpXSaqVTjVklgrOwbC3kNkg0/RxHsjflc
	AIaLkHIhplMyI/OdeeqXL8v4Cy4Ek5/okNJQJCSJSY/7tMVQ9syZkS3YGbkdUX5Llv+SLp3FKqd
	LCorWKt0j0pCWHtpcpKv4/fV3EcSiLVFqqSAc/kEa8u6GWs6lIMcN8h6dvfxl
X-Received: by 2002:a17:907:9411:b0:a99:f466:a87a with SMTP id a640c23a62f3a-a9eefebd146mr297452666b.3.1731077875696;
        Fri, 08 Nov 2024 06:57:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvBXQhtDwH/CFids4IrbUXtGYo9kv3TMx3xBV08edr1Zk34ClzQTNqBs25yREVsRQhm496Xw==
X-Received: by 2002:a17:907:9411:b0:a99:f466:a87a with SMTP id a640c23a62f3a-a9eefebd146mr297450566b.3.1731077875280;
        Fri, 08 Nov 2024 06:57:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a176cbsm246637766b.23.2024.11.08.06.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 06:57:54 -0800 (PST)
Message-ID: <51e77fdd-7d37-4748-a416-2f204a707f95@redhat.com>
Date: Fri, 8 Nov 2024 15:57:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] media: ov7251: Remap "reset" to "enable" for
 OV7251
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20241108145024.1490536-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241108145024.1490536-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8-Nov-24 3:50 PM, Andy Shevchenko wrote:
> The driver of OmniVision OV7251 expects "enable" pin instead of "reset".
> Remap "reset" to "enable" and update polarity.
> 
> In particular, the Linux kernel can't load the camera sensor
> driver on Microsoft Surface Book without this change:
> 
>  ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
>  ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
>  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
>  ov7251 i2c-INT347E:00: cannot get enable gpio
>  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -2
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/media/i2c/ov7251.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
> index 30f61e04ecaf..7b35add1e0ed 100644
> --- a/drivers/media/i2c/ov7251.c
> +++ b/drivers/media/i2c/ov7251.c
> @@ -1696,7 +1696,21 @@ static int ov7251_probe(struct i2c_client *client)
>  		return PTR_ERR(ov7251->analog_regulator);
>  	}
>  
> +	/*
> +	 * The device-tree bindings call this pin "enable", but the
> +	 * datasheet describes the pin as "reset (active low with internal
> +	 * pull down resistor)". The ACPI tables describing this sensor
> +	 * on, e.g., the Microsoft Surface Book use the ACPI equivalent of
> +	 * "reset" as pin name, which ACPI glue code then maps to "reset".
> +	 * Check for a "reset" pin if there is no "enable" pin.
> +	 */
>  	ov7251->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov7251->enable_gpio) &&
> +	    PTR_ERR(ov7251->enable_gpio) != -EPROBE_DEFER) {
> +		ov7251->enable_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +		if (!IS_ERR(ov7251->enable_gpio))
> +			gpiod_toggle_active_low(ov7251->enable_gpio);
> +	}
>  	if (IS_ERR(ov7251->enable_gpio)) {
>  		dev_err(dev, "cannot get enable gpio\n");
>  		return PTR_ERR(ov7251->enable_gpio);


