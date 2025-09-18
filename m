Return-Path: <linux-media+bounces-42425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9B6B54D7C
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 14:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A260317FD00
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 12:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84EA30E842;
	Fri, 12 Sep 2025 12:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJ8pNls+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030AE302CC6
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 12:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757679325; cv=none; b=aDl2tE97T4FUuJYWVG4r1wgr4Ueak1Lj0hC4so6YM+CcT9JdkJAHh3JbpHIv4hYdJTn/67Fl3EO7v7YbnGF9LEZpTgrX3u05joCiK39OttW6564XSn1nNv6OvcV5QT4hA9TsOwzzzIerIK0lGdLhuRwhlh7gDRLB3ydF40BJKT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757679325; c=relaxed/simple;
	bh=yF9DKsHIeQzeXF2qDOAngS+GXw4GjovwnFQjWtJUh/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W416C63+HvytaipcuiuhC9Wx8D/longarQ89dmJPQrOXMe1vcsvtDsO8x1+c0/7QaYAaEmnxFypWi3y6bYqC0Egh684Rg3Th57d55Cc1fWPVq7dx87iHmISVkG+HQ2c+xwSxM74X1tiYIE01l/JkKqWiLXvtFdgPi1DHcTYdFlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJ8pNls+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45dfb6cadf3so16593305e9.2
        for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 05:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757679321; x=1758284121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/srPpowhb2Rd3xZftod1YxdED+npJM3nXqMeune3iHw=;
        b=XJ8pNls+BZM+XAMVtl/DYpZoxXjTVHXhEr+mUez3Fn4SEpNV1K10YOobnZ1je/JGsx
         yTuvf4rjtkT62QOvTzHyWe1ku8F9AV29BWfqQrZYVSvPVAkxkxaBJ15j8a7udfAQLBu9
         krzDWrgxPk58dAX4VwRZrq3H6X5JJ0appkzeShStLJC1L+YoVBym+JYoSexlfcSAC1YP
         dWX0VUZy0R6q1JEgQE3cD5S6zr4AreTS/FhLsEHHtAJImUtVFr6LPIpuJsYpCak21AQt
         yKH+fhwKCeSP3DWZTIMGo8KAM1sCd2XbGGVRTvRY2ZdLAM7IjuHbNn+gIZ7RXjnet9Ad
         d4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679321; x=1758284121;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/srPpowhb2Rd3xZftod1YxdED+npJM3nXqMeune3iHw=;
        b=L1RCNn8t7GeJ7Niob+7jBlnlsc1ZM9gpgNKxgE+R/R+a5p58F5j3XAf2+CSLTy06PT
         7rfuCww+g0auifkURglunCMNIwsWBVEPpfCatBM4go2MbSKvoz7FWf7l6upT+/gz19Dy
         pEY1r1mFCqrOX2H+poO1IjgzlWsnBYEjA3tP/eDqJgBIB7SZiRmdJog4Tp85pXAMSsZ3
         HkD9ddT0eLWetSsTEiu627hdeto+2S2BYUne7FlGqU9/0rC69ybrDBmZj/0GpLkUPbx2
         vs146gkkzC3QydLV82oZlFNw0evOGo6L8NUjMWiBrgX4kpkP1Ba5sU9GvU2x52xwGxEw
         2YGA==
X-Forwarded-Encrypted: i=1; AJvYcCVwF1ccliuTobPjf8Z1iUSaJpqXBmEnZC7dAyR5H5kyh6WLpKeV5HnX+HOYeMKTU1yo2adUUS+nHu4fsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ0JeMNV2zb2RXfNUDKaR5G2AvknutsotA6t7oZPJOSi2wNpQ7
	x97QsLtWo03vt8TX1jPNKM1PRFswcPZs/ANwaKOy0sOGq5xWhZHx6o2R
X-Gm-Gg: ASbGncuVyOGYvNgTU2JPs62oYmQ2xyFtUn767oWIub1L0Q/Uy2HUjJ29vHNrwmQGf/L
	SojY+hXiULAeWoTHZW7Ewnoc5nf/ekyTqBzFTSlBUmvChWnv0fZvaof9XT9OotmGE7dSbkF+8uU
	TMB6g3KYqHRjuH8hZWcrQYhESoqpIEMoZpqIB+GyfoKZRNqB0tjdyVJekCWhhiGtV+/ZZ3fP3vP
	XPHViip+HpPxirPR0ib7qRUTg8ovS5ILxaZSwoRNnv6HAI9EygRk1y/DIah321D8KxfplzPYnEU
	iFcDs4jcqLSzPLpObgCwlsGDeGvTpGTapIGUphMIN4BsL8VEVKQ8KhyN2Hoq2sjRR0JZAYAMasP
	OhxtGQj46MVBeGJQWvnqSdCVdeY1HVRQZ4FHjLtOe5g==
X-Google-Smtp-Source: AGHT+IGIxBQJvu26XPDraDpHngv5M2mh4tNdsWBgU5C0XbLsDwBWpNfV2Gw3xU49DrV3xmpQUcJgTg==
X-Received: by 2002:a05:600c:34d4:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-45f211d008dmr41374065e9.16.1757679321068;
        Fri, 12 Sep 2025 05:15:21 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e015313aesm36545605e9.1.2025.09.12.05.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 05:15:19 -0700 (PDT)
Message-ID: <1e17b875-7eb1-440d-a349-30cbc3e4358c@gmail.com>
Date: Fri, 12 Sep 2025 14:15:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/38] arm64: dts: mediatek: mt6331: Fix pmic, regulators,
 rtc, keys node names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, sean.wang@kernel.org, linus.walleij@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 atenart@kernel.org, jitao.shi@mediatek.com, ck.hu@mediatek.com,
 houlong.wei@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com,
 andy.teng@mediatek.com, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/2025 10:38, AngeloGioacchino Del Regno wrote:
> The node names for "pmic", "regulators", "rtc", and "keys" are
> dictated by the PMIC MFD binding: change those to adhere to it.
> 
> Fixes: aef783f3e0ca ("arm64: dts: mediatek: Add MT6331 PMIC devicetree")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt6331.dtsi | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6331.dtsi b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> index d89858c73ab1..243afbffa21f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> @@ -6,12 +6,12 @@
>   #include <dt-bindings/input/input.h>
>   
>   &pwrap {
> -	pmic: mt6331 {
> +	pmic: pmic {
>   		compatible = "mediatek,mt6331";
>   		interrupt-controller;
>   		#interrupt-cells = <2>;
>   
> -		mt6331regulator: mt6331regulator {
> +		mt6331regulator: regulators {
>   			compatible = "mediatek,mt6331-regulator";
>   
>   			mt6331_vdvfs11_reg: buck-vdvfs11 {
> @@ -258,7 +258,7 @@ mt6331_vrtc_reg: ldo-vrtc {
>   			};
>   
>   			mt6331_vdig18_reg: ldo-vdig18 {
> -				regulator-name = "dvdd18_dig";
> +				regulator-name = "vdig18";
>   				regulator-min-microvolt = <1800000>;
>   				regulator-max-microvolt = <1800000>;
>   				regulator-ramp-delay = <0>;
> @@ -266,11 +266,11 @@ mt6331_vdig18_reg: ldo-vdig18 {
>   			};
>   		};
>   
> -		mt6331rtc: mt6331rtc {
> +		mt6331rtc: rtc {
>   			compatible = "mediatek,mt6331-rtc";
>   		};
>   
> -		mt6331keys: mt6331keys {
> +		mt6331keys: keys {
>   			compatible = "mediatek,mt6331-keys";
>   			power {
>   				linux,keycodes = <KEY_POWER>;


