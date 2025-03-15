Return-Path: <linux-media+bounces-28307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63213A6328A
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 22:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38240172289
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 21:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6CE19DF77;
	Sat, 15 Mar 2025 21:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hh3xml0h"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C284197A8B
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 21:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742072752; cv=none; b=eCRS5Y8qAIBCC15Qpq9byA4u8qEFvvux/e12zAKdUjLAZvRXhGbgWBRe4hiYKnS7D7l8+TOAL2Q8LHiJP1CWXZhrFVaw4eQweGLTdPIG87Oh4gIOo17gJzNuvj9YcBtXTZcxSunxema9JeM8+8KDqvgx0RLBmojZ5ATgCNMbUoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742072752; c=relaxed/simple;
	bh=w4IBDLg5KyXVyiFZkv1D8hWIFBKSTYXmUA/ltlQ8Hho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2Ha1SGFG84cK/9WaeqWq1Hf7L5TKRJcYEsjF4WiQGktNk55U/ERiOmTqc8XAmdUGpvX2fqposbI7ER3MnkqQNmFzJFDQK1G0lyS4mOrQGRut1XXn0qJC4uowoRbki3RNPa6Cubc78pdr8kVpZkQH3b26Mr42eYWcLd7GCtaBH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hh3xml0h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742072749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m3Vq4d9qdSbuEYjr62rcnD1axEcDzOHXoohruGK40eM=;
	b=Hh3xml0h1CdsnlhQa1xBxvZ8++ZLpOZ+hxnaI2R6pnOmc0v9+cUNl8bcvrpE9wVmPQuYwS
	s89e8/P7Sq79Q/hb183tM1TZTSZFPFhIKErm54+AtD5xl1w4yaluo9gmFbQ4V173SBmp3B
	d7mr8IrUADQBEJWdHJDgom/5yGhI3K0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-yjff694nMnyj6hY_O_Bd3Q-1; Sat, 15 Mar 2025 17:05:47 -0400
X-MC-Unique: yjff694nMnyj6hY_O_Bd3Q-1
X-Mimecast-MFC-AGG-ID: yjff694nMnyj6hY_O_Bd3Q_1742072746
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-abf7171eaf2so396821966b.1
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 14:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742072746; x=1742677546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m3Vq4d9qdSbuEYjr62rcnD1axEcDzOHXoohruGK40eM=;
        b=Ms3sbrVcm+oZXQti4QExDieumq8/GYB+0SOV4Vtjs7JLwCONtF5+hS3bHW9ecA4XPM
         VqSn253dwusnKLFJcgYbhfAAB/M4fGj8ovMmujbL7RczbuNo7OXYa7phmjZWBQN7bVHm
         y7OPL5hTJ/RWZZ/7N6ocDmKuujsSDGXPxVh7lqyTrWOk6ToAZMJ6AwK0rhS43waocHSQ
         YnODE8r29vk663BKNkygL735tpERVYrcaVITCPIUaU1TB/MoElSfstq5mesDJSUwSqkP
         vECAvlF4aB6pHKwc0vQ1uylctoOqi0MzgExo7NADiqKTWT/0WF/SIAen+ZiOREFONgqQ
         y+pw==
X-Forwarded-Encrypted: i=1; AJvYcCXwa1oPXW5KKJkdHUTGBo1CUyktTAio9J4u5/PQSXNUWGHvGKk7nmBzt+6/TtO0k3gYgd/7dadrSg/Vfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9hXl4V9e/13hBUXh6rK8AxZCgKnFCguaw5ktFJvAwHNXdnqyR
	/n0ml+1pr1dHbFIyG3cnlTPxBUcSA9YxhxaQ9rulbr3ByafBuP7j7sbZE0H8hxqrUT9eRWx2U8I
	IbD9LvJW04eAUFG8VSdmzJZRAlVmsv7UzJvjXGfUljq3y1pIiRg80zFgsdBz1
X-Gm-Gg: ASbGncsokwC7kIldouxdEtWm0QNoMkEz5pbn3zcg1P20yZxhRaE2gfJ5A6MTyuf1ddq
	9XMqC4f/mnNNVyc/idGI0DluVQpayWFA3a9stEMSpX3XPmHEm/4hx0n5Lf1J44h+7Y+IZrPG6P6
	ekJIwtU1lEAZvhv5Jp94WYnqvDSiMbrXw66yIrk3WaNLrJZHFt94sDFHopZ4Ri9Ro+zda5w6jw6
	muqz7bY0rxjOwJPr1L1ucbayxdeKMj4eK1k9qAeDnS/7wbBsLhQ/CeqqJeMjKn8IlJjG0z1Mepy
	IdXShV3zAkPlWevY0e/MJDvXwYkMzJRXf6u92ARhkjNqrUhIH+vX2EdKrbiYT3zL8kaItC/AtfC
	MYlG2Jf4QYiusXsJ7ESvug0iDgT8T1ldTDiVq9ye8PY4dNck+EMcbGKWFpjyxDXT9BQ==
X-Received: by 2002:a17:907:7296:b0:ac2:92df:fab3 with SMTP id a640c23a62f3a-ac330181aaamr879318866b.16.1742072746359;
        Sat, 15 Mar 2025 14:05:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwqgyY8AHsoEwCBfgceQD3zm93VpbjtbBF+WNBFLee5eNrZQCcS5h7PpyItv5sRb+kUrYIAA==
X-Received: by 2002:a17:907:7296:b0:ac2:92df:fab3 with SMTP id a640c23a62f3a-ac330181aaamr879317166b.16.1742072745943;
        Sat, 15 Mar 2025 14:05:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeb7bsm416201166b.24.2025.03.15.14.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 14:05:45 -0700 (PDT)
Message-ID: <54b4b5e6-06fe-46f8-8484-3c86aaa46cad@redhat.com>
Date: Sat, 15 Mar 2025 22:05:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: i2c: ov02c10: Implement power-on reset
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: sakari.ailus@linux.intel.com, heimir.sverrisson@gmail.com,
 linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
 ingvar@redpill-linpro.com, hao.yao@intel.com, mchehab@kernel.org
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250315134009.157132-1-bryan.odonoghue@linaro.org>
 <20250315134009.157132-4-bryan.odonoghue@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250315134009.157132-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 15-Mar-25 2:40 PM, Bryan O'Donoghue wrote:
> Implement recommended power-on reset.
> 
> ov02c10 documentation states that the hardware reset is active low and that
> the reset pulse should be greater than 2 milliseconds.
> 
> The power-on timing tables shows that t5 the time between XSHUTDOWN
> deassert to system ready is a minimum 5 millseconds.
> 
> Implement the recommended power-on reset minimums.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/i2c/ov02c10.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 595998e60b22..d3dc614a3c01 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -696,8 +696,10 @@ static int ov02c10_power_on(struct device *dev)
>  	}
>  
>  	if (ov02c10->reset) {
> +		gpiod_set_value_cansleep(ov02c10->reset, 1);

We ask for the gpio to be high when requesting it and
we also make it high in ov02c10_power_off() so it should always
be high on entry of this function.

> +		usleep_range(2000, 2200);

To make sure the GPIO is high for a long enough time after
requesting it I've added the following to ov02c10_get_pm_resources():

        ov02c10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
        if (IS_ERR(ov02c10->reset))
                return dev_err_probe(dev, PTR_ERR(ov02c10->reset),
                                     "failed to get reset gpio\n");
        if (ov02c10->reset)
                fsleep(1000);

Admittedly I got the amount of time sleeping here wrong.
(Sakari, this also answers/explains one of your review questions).

But my code above only takes care of driving reset high long
enough between requesting the GPIO and power_on(). I guess we
could get a power_on() power_off() in quick succession which
might violate the 2ms rule.

So I think for v10 I'll go with the above solution to sleep
2 ms in power_on() before de-asserting reset.

Bryan, any comments on that ?

>  		gpiod_set_value_cansleep(ov02c10->reset, 0);
> -		usleep_range(1500, 1800);
> +		usleep_range(5000, 5100);

Ack for this change Sakari also pointed out I guessed
the reset time too low. IIRC I took this from the ov08x40 driver,
but I guess not all ov0xxxxx sensors have the same reset time.

>  	}
>  
>  	return 0;

Regards,

Hans


p.s.

I've gotten a report from Heimir that the new version does not
work for him. He's hitting a problem after applying:

"[PATCH v8 11/14] media: ov02c10: Switch to {enable,disable}_streams"
https://lore.kernel.org/linux-media/20250313184314.91410-12-hdegoede@redhat.com/

so Bryan this may also not work for some of your testers.


