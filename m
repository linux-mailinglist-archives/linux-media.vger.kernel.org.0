Return-Path: <linux-media+bounces-50087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5662DCFBFA9
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 05:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCDE830E0695
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 04:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850ED54652;
	Wed,  7 Jan 2026 04:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cn6yA1Fp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD3522A4EE
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 04:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760141; cv=none; b=Yi+kkRScLoBW2sARFfJ04IahOIpIrglL//xdJvOkizXGrNgRl4pz7VbYHtGrCf/ByzkXAmngMiARaS+kJ5cU7ncdTKyPFPrhu5a7OTIhd3ChbUGiO523YhHIe/nX6xuRKkDT+dZwHqVJeoD6rwX9WjJmAjcx9JpzP7e9VVquFDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760141; c=relaxed/simple;
	bh=haiB8Tt+8pZM04gZvK2wNWt/dPyIDOm+drx3AQALCHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ascuPf39ZeRWv7fLtTQLd7mODfx+qFQnLECGW74B56rAvq2GchUhihZLR8Cvp+L6EUqSEVvuUmkvdHctVQ5Oj9t3Q78L4ZUcspLGBWQrxCJ0djixsffKcY3iR4fu9fSFO78fom7WB8bzWVfDgCa4chzhOnKpBz3wxdPAk8Z0xfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cn6yA1Fp; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-598ed017e4cso144975e87.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 20:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767760136; x=1768364936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvcoTCO8VwPdehmxlS2rnFhrCL/5WSs/bRyMtF/vO1w=;
        b=cn6yA1FpWam7e5OM4uK9jnnosDnNZJ8FZokv+Cyfp1+skVKgMpy+8j2XTj0A3h+OrW
         /X5pYeQcC4uIwCgN1kSVBkc2OTjLqsX73g3MYGe7OOH0Q8+iqlfJgSIl24vYmuOB8kVM
         VoyNxHC0pHAec2kZe1TMwS4XjRjyXGw25dIGqPJfpaSRzaaVrHPgCrRU+Qe9YGg/im9f
         CkmVgz1MkMh2L/H/fcMZQazdZrdGaB8U/0EWZTNl6Gkvm6dG4w0d565B1L3/GBQzmi5G
         DJEj+D3mPljwqJE/pR3NCJywS7/9AG+qE0N6NcVET75MscbHBGbJY+ir8JelrmC2LbVn
         YBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760136; x=1768364936;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jvcoTCO8VwPdehmxlS2rnFhrCL/5WSs/bRyMtF/vO1w=;
        b=RYwt7wLgK51TNrnhLjbP0UT0VtdAiqoR21rEmAnfomPDAKrUFx2NaDKyU+zisYBjUu
         xRLNL9DTDBkBeT/8QDCj3Z8gB5GzvhS2ucRRMnxptXiunR+gRZA5mY1okmJTcG7hRjIq
         gc/Y9YiW3IkI1fk7zhJxgX1K80BLWceVW3PRb5iBlILsXuRkrFTSXPBZtCVN7AT/09ms
         1WTtFeO8UKxZy3hkjLE3QEUxi1zzX+z/ct72iWIVvikTqSYfoKVMVXKHCO0iox14amFh
         q/4yQNwUkxCXU4jiRsOBGE61xaid+e5aqhcyAYppLziXqs4IDmkrke8mT+h4tJJ5WbaN
         6yPw==
X-Forwarded-Encrypted: i=1; AJvYcCVjH8nslOuFBdfZLoGeUjvY2FkyW/Rmf6629MSVw3yWvWgVN7hHG1uEk7QnfLIo82AjVijodwHR8X0tIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFYmmWvdooS081X5maQCKHGcqt3r8JJMu+iO7vgfBb8pgXWVZo
	n76q40qDwXSSYZJuMPG8aSPHtXZrkwdUuPvBKruRwqAeGIzfqTN7z47NKG6c6Ej/nWc=
X-Gm-Gg: AY/fxX5UoolLRC5Jb0QKjq61qafSrm82C0LSvHyHDKpZ9sY51BaDUgR32RyaLjTWY6t
	xG6csc087M3iUUrdTPHzRkYoymr4xlbCYfbsqCAurfSdGOwGeBWAwE+g2E7B/3AjcFC/H5ZDZIZ
	8nZ+P5xXXby6vktpe6DQpUX2ea9+Brio/Zv6tAhVrwf0T1a3t0wg7Hkia7G5LzHmh5OlgsD9kl0
	EC9MLsjoe7e6O9JlK1574wMnW55SOv0DqsgWmOWPfy3nijJLh8e7CmSHUftH6mPAJQA6DbXIk1T
	RuDKfUW9U+JyVxN1NO3Wjeewg2wfsGRuK5tFAyJvWjPN65F46lwFzxOEi11TLzffnOxEamSNiXs
	TlP4cs6aK3djNQJgfd428mFz65bf5/WzAv1RUjdEJQH1ptUpF+BATqxYT3CibV8tY9nKlT8jzvv
	NT1E/F7yHbj9RDwy85w8BT+3JTT3lj2ENY2otqcgneg4arw9YVuwpBbjPeTyOgvTO6WA==
X-Google-Smtp-Source: AGHT+IF9hWgMq5ozizyKkYLFKj41duoqsihD4rtshBdk9J75mRrvbI9bzZFNP1DazvK48vDl2rVU5g==
X-Received: by 2002:a05:6512:3b25:b0:59b:7291:9cd8 with SMTP id 2adb3069b0e04-59b72919e55mr25847e87.7.1767760136292;
        Tue, 06 Jan 2026 20:28:56 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6f3caba8sm271002e87.8.2026.01.06.20.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 20:28:55 -0800 (PST)
Message-ID: <b0b629d5-33de-41c1-90d5-b64cc29e5511@linaro.org>
Date: Wed, 7 Jan 2026 06:28:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add camera MCLK pinctrl
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/26 11:39, Wenmeng Liu wrote:
> Define pinctrl definitions to enable camera master clocks on Talos.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 461a39968d928260828993ff3549aa15fd1870df..880fa10a2db993a82d31faf868195944128237c9 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -1549,6 +1549,34 @@ tlmm: pinctrl@3100000 {
>   			#interrupt-cells = <2>;
>   			wakeup-parent = <&pdc>;
>   
> +			cam0_default: cam0-default-state {
> +				pins = "gpio28";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam1_default: cam1-default-state {
> +				pins = "gpio29";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam2_default: cam2-default-state {
> +				pins = "gpio30";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam3_default: cam3-default-state {
> +				pins = "gpio31";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			cci_default: cci0-default-state {
>   				cci_i2c0_default: cci-i2c0-default-pins {
>   					/* SDA, SCL */
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

