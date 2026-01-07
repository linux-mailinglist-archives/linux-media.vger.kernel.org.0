Return-Path: <linux-media+bounces-50175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98039D00418
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 22:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05FAB302A385
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 21:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0253164C8;
	Wed,  7 Jan 2026 21:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cbhRrnHI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ECA2C15A3
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 21:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767822817; cv=none; b=okKCBF2pEcKGcogNqewEs6beRNFY/Tm9xECE/dF5xnBCPJuoGJ8AaVM/syM0+S+OfToHcxbkGe3cVm/tnXHZtFukX0g9diRp7rRcXhvjJHBs2OvtWA0aM14MTLiVGJenmajpEXScNNViu4AwFxr+lKLOEpihwmPrBW+6MHf6rQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767822817; c=relaxed/simple;
	bh=UHwqB3gjL3ptwXoinVWuZA+mO2tTt6i7X4c8KTM3w5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X+kFljO8tImL1ltfMITEH10dJ8OdfyC78WXfhXaRgaR7RYh3UBRGJ8gIZE2Nbp7q8Staxek7RPqRFJZZucsivcyAb4nbd1FVziJFtuBFqAY+1awMaz6GJ8WWEIVPwJHMT2hgrW9dDK7o0Hfk6Pmb77KI8gBR4kG3jn1ywxQl6FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cbhRrnHI; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5942708701dso244156e87.3
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 13:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767822813; x=1768427613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwYyN47XdExhmtpr22dRuy2KKRRsROowGgiRYq00HHY=;
        b=cbhRrnHIwSxba8s0l+xIuvvGw1khORdElAWEc/iAYgbxmrtdVJ+/nl7MRtrVd4IgOX
         QW171/Z65LOS1TUPgrNDNZrCbrdzUkB4I9QLNf3jKgNQT7WbitpncEEMKSH0bsH5ZkxN
         uidK2ckuvLif3cjDxAcfF4me7fW/i9I1giLE9oY08+DI+KsCxNFzAeGxju9csKHUu0Ia
         jzcm47lBRP/VGQshHncMq8T0K+yi7Y+owMZCZD3NNwA4qYW1nH/1N2IxArVZe6J8Lplz
         Rocr4FByVMgCkcNlAPg93tmb92saOKZuz4Ah+RmQpYvm/a1yAqjwTDsMxAGqYDf8Xblh
         QR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767822813; x=1768427613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KwYyN47XdExhmtpr22dRuy2KKRRsROowGgiRYq00HHY=;
        b=PoW8ySWMsC9nU9Uqy1v9BRXd9borXqw1ImDinHeUdUGuyEK2zWyOlhbWVwb3v4eFjY
         eoISNtPUHcjnM+QWBm03WiLG/E0KfWSZzGp4WPWB2YbIlVzgPctGVMY3IJx2xwJRxy2d
         b/+lzuH/ClvoDOtSFPhCundJ89V4xfeTiqVqPXg4HZJQ9eiTKh1SAI/wjinb0VrNj78b
         +JYj/KL3BrAj3lbBVV+pn2G6Ttp3en2xxxAziT33SeV6kueqsJrFx4vYDY6WBPLp6l0G
         DJSBTDmBEK2J59RvFbGIX3hie1GTF1dVL4Jod0GjwURXiY0hb0uBSoz55mkXhLvGdS4c
         3/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVFyGOeW4dZFnWxDbX6RMexYWoZzkhT8Rs1vByTasxSKoLLEXY9mTdtKsWPoa+5/OaYLK3Pd1CWLBJXQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycxy7ln/bB/zZPoltuuMn4yWuYo7L+ff8ZqlECvc2F6HUPDQcE
	rfHXxHjjzUpNLbgS6iBQjO4r3vkZDepel1Xqb00OeD98VpSUO0d0H6SK8Ymf8j8PtiA=
X-Gm-Gg: AY/fxX42JcukNtdBkXCFMUgJlXvCKjVoVjz6urehtpBvTbU77dX44NI/ml+IOCrapCz
	tJU7r2mkTZ0p4nZAtE2hQDRHPyQvUQGYxxwkA89QSGrHkyPUwD9ofY6GWiZX3WF3q+6M9a65BhP
	Poo3wdS6BU7aBjqLqigyi+7mjxP2MLwCR8LWJN/g4xL8Z8wouClfS2YyJoJEkHWgdxcwiIL4u2X
	Ol0EBoLyHw8mZLnEy6P6EZfjXz0LZ/i45sY5/NwYLZ5mukGsXgagx3S8Ta3rz+LK+FFPvsSxbOl
	uIoALhKKtdom3kpkrK1lY3yXzoLeGTv0xXU/ojnpzq0E9XatJqgqxhrH/LTfGH3Sx64K6UxYEOq
	WM75RYbeQD+yARfGcMqMiWbWpOb3inGqtHA6TKbla7MDUs+6WSDmKZQcJqayZJvNuiBGOOGxvSu
	C4xDLwm4ojcsVVRHIQgF+E8tt3gb2/uxyRAPlK0pjSMNfDe8awVxWsWiNXiN28v2GwOvQjv9kFS
	sBW
X-Google-Smtp-Source: AGHT+IEnE7TRgr0qgv5X/Q7XVeME7jEJg54IM1ntnuvOBQBuc3vf8rcsAvJ6z2UwtAWIpQusEkXc/Q==
X-Received: by 2002:a05:6512:3d1c:b0:59b:1d24:7db7 with SMTP id 2adb3069b0e04-59b6ebd30d8mr766233e87.0.1767822813450;
        Wed, 07 Jan 2026 13:53:33 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6985csm1566062e87.78.2026.01.07.13.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 13:53:31 -0800 (PST)
Message-ID: <de0d0f9d-be70-490d-9cc0-53f017c69985@linaro.org>
Date: Wed, 7 Jan 2026 23:53:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] media: ipu-bridge: Add DMI quirk for Dell XPS
 laptops with upside down sensors
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org,
 stable@vger.kernel.org
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
 <20251210112436.167212-5-johannes.goede@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251210112436.167212-5-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/25 13:24, Hans de Goede wrote:
> The Dell XPS 13 9350 and XPS 16 9640 both have an upside-down mounted
> OV02C10 sensor. This rotation of 180° is reported in neither the SSDB nor
> the _PLD for the sensor (both report a rotation of 0°).
> 
> Add a DMI quirk mechanism for upside-down sensors and add 2 initial entries
> to the DMI quirk list for these 2 laptops.
> 
> Note the OV02C10 driver was originally developed on a XPS 16 9640 which
> resulted in inverted vflip + hflip settings making it look like the sensor
> was upright on the XPS 16 9640 and upside down elsewhere this has been
> fixed in commit 69fe27173396 ("media: ov02c10: Fix default vertical flip").
> This makes this commit a regression fix since now the video is upside down
> on these Dell XPS models where it was not before.
> 
> Fixes: d5ebe3f7d13d ("media: ov02c10: Fix default vertical flip")
> Cc: stable@vger.kernel.org
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix fixes tag to use the correct commit hash
> - Drop || COMPILE_TEST from Kconfig to fix compile errors when ACPI is disabled
> ---
>   drivers/media/pci/intel/Kconfig      |  2 +-
>   drivers/media/pci/intel/ipu-bridge.c | 29 ++++++++++++++++++++++++++++
>   2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/Kconfig b/drivers/media/pci/intel/Kconfig
> index d9fcddce028b..3f14ca110d06 100644
> --- a/drivers/media/pci/intel/Kconfig
> +++ b/drivers/media/pci/intel/Kconfig
> @@ -6,7 +6,7 @@ source "drivers/media/pci/intel/ivsc/Kconfig"
>   
>   config IPU_BRIDGE
>   	tristate "Intel IPU Bridge"
> -	depends on ACPI || COMPILE_TEST
> +	depends on ACPI

Why this change is done? Apparently there should be a new dependency on DMI.

-- 
Best wishes,
Vladimir

