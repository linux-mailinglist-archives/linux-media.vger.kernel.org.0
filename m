Return-Path: <linux-media+bounces-27285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09525A4ACFF
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 18:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0015118975D1
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 17:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3061D1E51FF;
	Sat,  1 Mar 2025 17:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J5p8tnV+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0E91E2007
	for <linux-media@vger.kernel.org>; Sat,  1 Mar 2025 17:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740848804; cv=none; b=EhlKChWi2qHDzdbd+x0yOaMv9RdNpuoNsJ+dQ60/N1Z4vt3M79BKAsCLrWWPPfMBu7XfqrtgLPqPnJh98DPi5Bpebt/4adcyXAaGZiQquIbV07GqF112H9MFW3Rw2lqiy06jXOyay4cW4FQbp356JffxxxNX9l+bsg6TnFQMShU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740848804; c=relaxed/simple;
	bh=yEJqssxxWPt3BhH1DpczmwHzdcyry7xEFRN9FvG/Hqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Htd3X8J9Tzj0BIuTHJUZXboEs5uPpyWRDi+xtbe88GOS3Psxcfb14Ah0lVytAcKVy2I53CFb+OccQIdJX5UMdGghqUMjw5H2Rwb5HgdyhwdymO/LVK2jZ+7HwSxyTRQg7rssQrH0LcHj/CPYQU9EPIUXu9a/4jW4WmSTNR7vqfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J5p8tnV+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4398738217aso27816575e9.3
        for <linux-media@vger.kernel.org>; Sat, 01 Mar 2025 09:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740848800; x=1741453600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7sZq0GlCHdKPCTCLa9xpcOGkYHgKuGiPF0nKVOQg7sk=;
        b=J5p8tnV++nm3VopIf8FQGEJsdE21HCRu5CgD2AwKl00aNbSkyq2Z+v4pUMdB+/j/yS
         Cf/D+eNvRioo/bHRDG8rJJYzFprAgukfxpXLX+Lfs7xEYMYfTWS4X8ENdEld3tzJgaIM
         EOE+nvwlYX3u1RFb4b5IpTqGnIZ+DCstgiPTioU+5xfwRO7pafr27810VxBuMzDuEU1c
         uwTAN3aureSFFEqxWAYpDR3GCtUum2K+5EErFspacxzG4qjM7kZaPy6swFm21QrHI3Cq
         J2U02HkoQ8oM0mSU7Q/I9PebD2XjkfZH57ziVW4frpqZGAffS+sze5G2Xwy6MI0kO+8A
         dPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740848800; x=1741453600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7sZq0GlCHdKPCTCLa9xpcOGkYHgKuGiPF0nKVOQg7sk=;
        b=bdl9coVP1XgzglN3ec+ybXVoTycAm612DRYhV5H+MfWqpW/98Gvc6ddm1qOcCSvU3C
         ZeEajne428p9ZJAMN9skdvGHQJKhQl0NXqRT3FGeJ9R7blqU5uBtiUoersPTh5rrd7dX
         S+Jp2te6I1Qsvtrj97OgcZK0txDkX3Ku88XtqmaAOhn/z9IegXpCFEAcajKHOQyXziYQ
         lLobMq7KsoFlN8w7a+HbETu27hX8mKOEWXyi+p1XjPLH5Ij4dy4sHMnPOsZuZp6dZbx7
         Jcdbv7jvhpUwD6/ivHE9sy1Hi/nOJSkKCMmPT2+jx/7eBdV1HAbXezP/6FzYjm6u2Sgl
         FAsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQyeR/b+A235CG4V/ifC4ETSU9WO5RUdX++NXKKXfFahKKPR38xWE56zpiG9Z648/JgeGwQ3SPafeBCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC9ydkre6Cz/c7dPbIvQKe4vejjEgqJBygRSfS3oGdiM24+XZl
	VPcOc0RogH4Unnuc3U0i8XXG3eapuw2Nr5ilIWw/+i84fLpXKPLJdtg/+CR2gPA=
X-Gm-Gg: ASbGncvH8XBLUuxvYlG0CR9KrD0QUgaQ8ONHRHOWGV781MnS1lmglSuWsyJ/wArgD3P
	HndNPYsC0Mx0sxfOuNKwH1wLKH0Fwc/XB5BWOrWz0PgQ1Q7BlGUStRuaaiKm1/VOfIo5QzWjdug
	2eIjCiJt+63qXDWZbzhSnwFBRJnD2NA1SmpF70xke8Pf7atPfJJoinTjkN3QTQwJb/zzSo3B6w2
	bV3eozpaJqGNyuT2BlQcTMpIFHKn/H8oMwUWmQzmhR1JhhPTUT6PNHozExqeho0z0hTjPEYnHBF
	+lTCaLbH768IE91t+9m5HV7Nbf6uq3Q6f9ifo198RYrSD3V1pmMSKhWSudovNqJiXzjq61xDITu
	kkA00AzdYrg==
X-Google-Smtp-Source: AGHT+IGpw76qFZCPerfVmFw6W8vk2gaHoW2LEKKH9oJmLLGCVHNdQMAQjsmrhnNhlWMCRdWIIA5hTg==
X-Received: by 2002:a05:600c:4f89:b0:439:331b:e34f with SMTP id 5b1f17b1804b1-43ba66f9d02mr74548685e9.17.1740848799973;
        Sat, 01 Mar 2025 09:06:39 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab39b8dccsm95138435e9.1.2025.03.01.09.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Mar 2025 09:06:38 -0800 (PST)
Message-ID: <35c27d17-040c-4d83-993f-5112eb5ef7a2@linaro.org>
Date: Sat, 1 Mar 2025 17:06:37 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: ov08x40: Fix value of reset GPIO when
 requesting it
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250301114830.22668-1-hdegoede@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250301114830.22668-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2025 11:48, Hans de Goede wrote:
> We should put/leave the sensor in reset when requesting the GPIO, after
> requesting it there are 2 possible scenarios and having the GPIO driven
> low is no good in either scenario:
> 
> 1. The sensor was in ACPI D0 before probe() runs, in this case
>     ov08x40_power_on() + ov08x40_identify_module() will run immediately
>     after requesting the GPIO and ov08x40_power_on() starts with driving
>     the GPIO high. So if the GPIO was already high it will very shortly
>     be driven low, more of a spike to low then actually properly be driven
>     low. Which may leave the sensor in a confused state.
> 
>     If we request the GPIO to be high at request time then power_on() will
>     driver it high again (no-op) and then sleep for 1-2 ms, so no spike.
> 
> 2. The sensor was in ACPI D3 / off before probe(), in this case probe()
>     leaves the sensor alone. But when the sensor is off its reset line
>     should be driven high not low.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/media/i2c/ov08x40.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index c2a399e3bb41..a4790e68f523 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -2167,7 +2167,7 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
>   		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
>   
>   	ov08x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> -						    GPIOD_OUT_LOW);
> +						    GPIOD_OUT_HIGH);
>   	if (IS_ERR(ov08x->reset_gpio)) {
>   		ret = dev_err_probe(dev, PTR_ERR(ov08x->reset_gpio),
>   				    "getting reset GPIO\n");

Makes sense to me.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

