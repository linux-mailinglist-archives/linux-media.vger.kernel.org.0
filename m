Return-Path: <linux-media+bounces-25119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7F7A1902D
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 11:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 214243A6AAB
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 10:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E842116F8;
	Wed, 22 Jan 2025 10:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jAtmAVJU"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067BD20FABA
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 10:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737543485; cv=none; b=KL3vHCJ3HG7c86UWyDZ4O9ERzQqh+9WgJpcQHQeLsdQP9AnWp8OmHiuy45fixUq9a3B5ymjNf3/32hluCbfoeNWIYX+ruDKsYTHCP5nAzlEb4xJg3gw5XJHRcVvOoUdOHDhm72mkH+J8ky9yBqnJNrk5IiIMvIMCJsotN3dJ1BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737543485; c=relaxed/simple;
	bh=O3BoVXUiSR3tcZqkEZsKNF8A8X+DqSqzS6SmzTB1QWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsM+xbLX6dPE8bJz5q5vpM5K3JiqvTdBivQYKOPQAMzs09XNFDfbnQKNOZFzzUUoR94gTA+Ik9SITdIa6kQn8wiLPxpEDecksCXq/lcFV684kTgui/3IwVgTtwXarG0T+rMDmjKNNH53bmsBWdhpkAB+/8iV/XZPdzWtz7MP0/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jAtmAVJU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737543482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fuj5O0KNPbmhoM+IK0q2tm4kulre2zcQR/geOoW4zrY=;
	b=jAtmAVJUHjnaNuXIKxtGezHGfphrGDmhlw1M82U/7qBu2XlS0x/7GL3rV+yzBMD22R7IqN
	hMR/dTBfpaJNzQZrKNF8camPMGLkclnKkh+KUhG6og84/ixw/D43HABp7cDvrSEfEy5Qir
	UFJVM3y2YFh3qvQ80oRffRnuwZqEHfY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-7uHhWGe-NSqyflUbsj-uFQ-1; Wed, 22 Jan 2025 05:58:01 -0500
X-MC-Unique: 7uHhWGe-NSqyflUbsj-uFQ-1
X-Mimecast-MFC-AGG-ID: 7uHhWGe-NSqyflUbsj-uFQ
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d3ce91c403so9034505a12.3
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 02:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737543480; x=1738148280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fuj5O0KNPbmhoM+IK0q2tm4kulre2zcQR/geOoW4zrY=;
        b=t5ZxcFZj2itbIn5B82Fc+7e9mNWQtK/r8SGoEO+aBUF8NAcVlhVOikfceZxtezvDNF
         Uzbc10eOSBITIirJkNf//Sa0bcG9gCuqF7CUALirMiF7q0W9vPWZa14pXqQ7eOT2EjW1
         Xxd9pLyoBve8CbLa/eP2PmeKVgm7PGPIrMCPRlQF3D5LJF4+h8/EInzU9oDjp8jaOgfS
         rugUve6qscRH0RdkcS4YWGuHeDNLqJfCnNh37EnG/BLPl4jEm/PobJgZWja2UJtRxDbg
         gP3vLl2J8f97VdPb7ee8TvGPWdFJfhP2HcUYFLuZ3EdXh8g104rnYihQkbk7l9iLKVVO
         sIrw==
X-Forwarded-Encrypted: i=1; AJvYcCWzyAYQzSnanReyCO5P8tPPN2Q4QFGGBtiDXj7ZUfQCDwzovV0PzLPR/iQT05i6RLI0bj2NMf1OBrXing==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIKbJ+LY68IAwvTFM95nInncuE6Z3h7LLVtLqocHLLhEqcDdeN
	dDTtQrQhKA2yg1BkOv1M9UvD/zYxIs83xoFXQh9Xl6rpDipBhqSvKeak8mQi9bnUzu7P4L76PC6
	y4AruDgIzolvXgf9XMuBOIK3/iqYBruSZLxG8+v//uaN0YOIGga2fHiHzf2FV
X-Gm-Gg: ASbGncsP3q87G7VCY+9gahsDcZGJOsIy3AiG8lNhvn1fvPJDaGtcLKailkYfUzK5FT0
	kb20IRalLSO/i86Kiy7UO17QXzvvctGRsvXsprdmLPkY6rRhiFwkD+vZb2btPTLfgy+nUhvac72
	dJDqTPutkCPfbSBsAJh8aXZYTIkWLSooXEqh3uME2mfDlxu8z+lgzA1gHX7edqmKJ3fZtrvlY2E
	eoc0vHuQzom8bH3o3Q7MJv7YHE4W0XspLU4hTZsXJUmCP61HxTr4snMDrgTBoKGgrVOL/89myEP
	+4lUZ73OCR3hG7nx5LYdREO2L7R23e9780JkyamCkBEZFzOuYi5ZWK6EZuWLa0f4RfFxdPmlg40
	ug8VLRxGpb9pvCnBbeM6/piVwYUi92v2+brPCIob/5oyl
X-Received: by 2002:a17:907:3f9a:b0:aae:ee49:e000 with SMTP id a640c23a62f3a-ab38b106513mr1815737566b.18.1737543480024;
        Wed, 22 Jan 2025 02:58:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuHDnb728XgTXuwVNm7JTl5l3APqpxP0L1JBcZBGXo/eahg8BQr0iFXyc9XXxWJhIZTzTV8A==
X-Received: by 2002:a17:907:3f9a:b0:aae:ee49:e000 with SMTP id a640c23a62f3a-ab38b106513mr1815735166b.18.1737543479653;
        Wed, 22 Jan 2025 02:57:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c5c470sm884670266b.26.2025.01.22.02.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 02:57:59 -0800 (PST)
Message-ID: <ee1b7609-dc9d-4183-a0ec-0db83ae3bdb2@redhat.com>
Date: Wed, 22 Jan 2025 11:57:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
 linux-media@vger.kernel.org
References: <20250122104344.245128-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250122104344.245128-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 22-Jan-25 11:43 AM, Sakari Ailus wrote:
> The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> documentation) but the int3472 indiscriminately provides this as a "reset"
> GPIO to sensor drivers. Take this into account by assigning it as "enable"
> with active high polarity for INT347E devices, i.e. ov7251. "reset" with
> active low polarity remains the default GPIO name for other devices.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v2:
> 
> - Implement a more generic GPIO mangling capability, as suggested by Hans
>   de Goede.
> 
> - Include linux/array_size.h for ARRAY_SIZE().

Thank you for the new version.

This looks good to me now:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





> 
>  drivers/platform/x86/intel/int3472/discrete.c | 43 +++++++++++++++++--
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index d881b2cfcdfc..181675e57c39 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -2,6 +2,7 @@
>  /* Author: Dan Scally <djrscally@gmail.com> */
>  
>  #include <linux/acpi.h>
> +#include <linux/array_size.h>
>  #include <linux/bitfield.h>
>  #include <linux/device.h>
>  #include <linux/gpio/consumer.h>
> @@ -122,9 +123,44 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
>  	return desc;
>  }
>  
> -static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
> +/**
> + * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
> + * sensor driver (as in DT bindings)
> + * @hid: The ACPI HID of the device without the instance number e.g. i2c-INT347E
> + * @type_from: The GPIO type from ACPI ?SDT
> + * @type_to: The assigned GPIO type, typically same as type_from
> + * @func: The function, e.g. "enable"
> + * @polarity: GPIO_ACTIVE_{HIGH,LOW}
> + */
> +struct int3472_gpio_map {
> +	const char *hid;
> +	u8 type_from;
> +	u8 type_to;
> +	const char *func;
> +	unsigned int polarity;
> +};
> +
> +static const struct int3472_gpio_map int3472_gpio_map[] = {
> +	{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, "enable", GPIO_ACTIVE_HIGH },
> +};
> +
> +static void int3472_get_func_and_polarity(struct acpi_device *adev, u8 *type,
> +					  const char **func, u32 *polarity)
>  {
> -	switch (type) {
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(int3472_gpio_map); i++) {
> +		if (*type != int3472_gpio_map[i].type_from ||
> +		    !acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
> +			continue;
> +
> +		*type = int3472_gpio_map[i].type_to;
> +		*func = int3472_gpio_map[i].func;
> +		*polarity = int3472_gpio_map[i].polarity;
> +		return;
> +	}
> +
> +	switch (*type) {
>  	case INT3472_GPIO_TYPE_RESET:
>  		*func = "reset";
>  		*polarity = GPIO_ACTIVE_LOW;
> @@ -217,7 +253,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  
>  	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
>  
> -	int3472_get_func_and_polarity(type, &func, &polarity);
> +	int3472_get_func_and_polarity(int3472->sensor, &type, &func,
> +				      &polarity);
>  
>  	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
>  	if (pin != agpio->pin_table[0])


