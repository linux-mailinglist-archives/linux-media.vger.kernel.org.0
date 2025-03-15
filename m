Return-Path: <linux-media+bounces-28306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F975A63283
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 21:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4845C16FDB9
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 20:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E20719DF7A;
	Sat, 15 Mar 2025 20:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KTLK557W"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A6E19882F
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 20:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742071520; cv=none; b=Hchc5YpY4roph3z2uxi8tM0zBmiJqSzsOa2wGZpuri10/6Y1r1JTRTFoNvU5GJrFKAZDJHwO9pmUW+zmbtBs4+ihsfzp7DjxgzbhEeF2yHlwJYjvAFxsAqD4F1+wo3syk9smAxxPeNTPgeU/JABnIYQpZUM0zSNer1UWrCzGYAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742071520; c=relaxed/simple;
	bh=R+xJkl59S2QB3ONEgyfKHP+00dnTI+X3Q6+8+T31PkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lj8ONNweT5b92UdBAxjjxjDpJtCE+cDt/KLZu9Kb6vyktTgumTkUl/Tar8bDrjxvt6m2pO4aWzZsNx9+RqL8hzI+8AOAYz3M9hCxj55qe0AOqSqy8GE7+ZSux61yL2R/hfgqUcn6N0Fk/F/NyeUz4rgGnAvmDcrBPF1bD9UfDpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KTLK557W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742071518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AxS/E4T6XHdrJqVlEz7EOdYTkctr4KsRqkOm3hSRCMw=;
	b=KTLK557WWGTzXJQqCQPwLiqqthX6E3onIjO8n1TWzvqvUSHOTST8CBQzImS/khJjdDWGan
	lf/9D6GOYGqNzrujPdfg32KqoiI8zHcYi90IgvVI7TAJO/7EzxubHceQZs2J8g2kMCaXe6
	EyqOg9PyKsIIqS10a9+RYnxQnczc8Ww=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-LJYQAkGINzu32M4pIr4mpQ-1; Sat, 15 Mar 2025 16:45:16 -0400
X-MC-Unique: LJYQAkGINzu32M4pIr4mpQ-1
X-Mimecast-MFC-AGG-ID: LJYQAkGINzu32M4pIr4mpQ_1742071515
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ab7f6f6cd96so320276966b.2
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 13:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742071515; x=1742676315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AxS/E4T6XHdrJqVlEz7EOdYTkctr4KsRqkOm3hSRCMw=;
        b=UgSTYdj5cPT6bYbn/j1UdPWmsdjzWlxbWRoDw4IuzNGM3gew8neT9bp8z68dg9GcJ+
         xptLCHBkK/tU7bFSaHGU/R9qVdfaGoBqxgXRcpi9Dx3mx0rdILPDbxNu23qlXQHlf+Tv
         PYoNmt0TqwOP7lNOZNKgEpO/yhLmYZ8v1F/Nbx7yHbjF71xzec43oV7yqV27EB2W8bqD
         vpEHD3gVWn8F1bD6hDKvw21n+im91+WGU+ev2XEdt8+9xVq9oEN6qosADNw19gNPYxAi
         dOpzr+BogwmVUXXabjsZgeSbp31d6k8Fi9I8ZRMDMCpWbfaSziuikboSGMKOPxr43cLU
         DRdA==
X-Forwarded-Encrypted: i=1; AJvYcCU9gmqUEziXhxZvuKTVzTTY0qgDnLbC1PT7mqrTiQF1CoZFu50lfb2MQ2B20AwM30wpJs21xEYHoQjZlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj8Dw0wUc9d49OcYPNpMQ4HMqHjQTEtdC+66M7jFlTTE420Oh+
	NaDNFrw78HP4JV4zexfwSUD+0SP+mcHOqXtukMhcm6g0KgQQ/EraePGZ+Ua7+Gq2Cw5tTl/x2Ga
	z1nIXKzgxCPhevKmRH+cKUUHAyjETGnjA918Kh7QoOD14YvhaL4N/2kdbrZi5
X-Gm-Gg: ASbGncsulw2cTE02ajmgj5zgDXZEhpPa6LdqjCTaZEu/N/e0CoASOjvEavryPF7GHC6
	mQWzvEHWKG1CLgzwa1GnIEsbZdFDARxJ87l5mWovtJP7yJ9d0go/uXD21O9lgjC6vU7MJG60OM3
	sMURHlDjjFkM7cdXuj3El2gW5rUicIbt24LpPRlXWf/NaSBE1UISpzY1HWVf9ElhnDO1UiMCbJY
	nr1TW1UCBLLuc8ikaanRGFVErulxIe+GW9x0Z2nLzn//70OARGpCI+8iY40cP2+8rMzQgYu34X9
	SrdfTpEMjpRG0/ipv6qXGe4UyWL8B8mSvSyKuYI2vL11CPp3daKciiALjTSQHVohtw6zZzNJH0U
	OjttIerRWi3t5VlmikGu0Pn+hlK6iQF0xa5+tC0CUarcc7IVWuYMVksc/YC9gNnswFg==
X-Received: by 2002:a17:907:2ce2:b0:ac2:2ba5:5471 with SMTP id a640c23a62f3a-ac3301e8f13mr676663566b.24.1742071515288;
        Sat, 15 Mar 2025 13:45:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH82j9KJ3nmjBc47kLxC2L+xEHsPShShljnz64xRhdXTUU89g+e8leebZr32Ez0WdWXjy6Ewg==
X-Received: by 2002:a17:907:2ce2:b0:ac2:2ba5:5471 with SMTP id a640c23a62f3a-ac3301e8f13mr676662066b.24.1742071514915;
        Sat, 15 Mar 2025 13:45:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147e8786sm410104966b.45.2025.03.15.13.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 13:45:14 -0700 (PDT)
Message-ID: <7b9fd58a-e545-4aa4-bf08-e7b05ee277c1@redhat.com>
Date: Sat, 15 Mar 2025 21:45:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: i2c: ov02c10: Make reset gpio logic optional
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: sakari.ailus@linux.intel.com, heimir.sverrisson@gmail.com,
 linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
 ingvar@redpill-linpro.com, hao.yao@intel.com, mchehab@kernel.org
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250315134009.157132-1-bryan.odonoghue@linaro.org>
 <20250315134009.157132-3-bryan.odonoghue@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250315134009.157132-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 15-Mar-25 2:40 PM, Bryan O'Donoghue wrote:
> The reset gpio is optional. Only trigger the reset logic if the reset gpio
> pin is valid.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/i2c/ov02c10.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index f6542cdf7472..595998e60b22 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -664,7 +664,8 @@ static int ov02c10_power_off(struct device *dev)
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>  
> -	gpiod_set_value_cansleep(ov02c10->reset, 1);
> +	if (ov02c10->reset)
> +		gpiod_set_value_cansleep(ov02c10->reset, 1);

This is not necessary, gpoid functions generally speaking
will happily take the NULL returned by gpiod_get_optional()
when the GPIO is not there without logging or returning
any errors. Note calling them with a PTR_ERR is not ok,
but we don't do that.



>  	regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
>  			       ov02c10->supplies);
> @@ -694,8 +695,10 @@ static int ov02c10_power_on(struct device *dev)
>  		return ret;
>  	}
>  
> -	gpiod_set_value_cansleep(ov02c10->reset, 0);
> -	usleep_range(1500, 1800);
> +	if (ov02c10->reset) {
> +		gpiod_set_value_cansleep(ov02c10->reset, 0);
> +		usleep_range(1500, 1800);
> +	}

Same here for the gpiod_set_value_cansleep() call, as for
the sleep() I think we want to sleep even without a reset
since we have also just enabled the clk + powerrails...

Regards,

Hans



