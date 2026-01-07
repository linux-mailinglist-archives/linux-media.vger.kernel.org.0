Return-Path: <linux-media+bounces-50097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BA5CFC0A5
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 06:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8481C302CF5D
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 05:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147E925A2CF;
	Wed,  7 Jan 2026 05:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcyRdJkw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBB313C9C4
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 05:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767762333; cv=none; b=bFfpNmYmT+is+x0uEfCYO2UHXo3oaoQUfBOX7E3VFHrR4ujqZOaEGtwjqdj1PNccW4kB/uriyudFq3lWTAPxeB/G2W5AFD/+h4rhZv2d0abF5tO/UvxgdhXSdo23jQ6zL8uT3U7oIxR5cmpCswr2q3Hwwv7TzW1ulBmv3xr7KjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767762333; c=relaxed/simple;
	bh=pd2/fcqUhJclWH32KEWbh64pvXRMyiVQrFA49oFqlMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KoGFDa3eJh5cUNyXtTk0/3go7HYD+O1gFDeout65UGlzA55n7jY0aIyJD0uWK6ZLVrXX0zCEMVd4JiBN6GhMvBQsSGZecHqGhdmVM4fOTH8eoodpVGXa+jEYCzJtU+jgHcfK58WrEryLiwdLFxFjd4nzHUGNFPURRK5X6yr7r0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pcyRdJkw; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-382fc524cf3so1430501fa.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 21:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767762329; x=1768367129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KElYrA/rOSwZEsZrUs10djaGaBsLTXTb05RNZ4yG4gk=;
        b=pcyRdJkwi5Q4ddoYEs9LdcYzz28eRTj2mcBqi3D76R7yTmtFvT0qc/97qly/NK3Ouq
         eRMFQkxoOomaytTcVqriiwGjgPWsOythSo5JpPWqYZKotB1Z+TglA6GKKuABfgvTaPO1
         r0fo0o9QzHCA46E8xDY7cy/2wWU0IyKEro6T2bkt7s6bZNL0Ztal+bXVv8yckJFltD24
         ZBOEe8Hx6ZDqwe1ipB3YEpOkzVfqoFhHU6E36msAhuqHHuVR1FvNbtWRTaOg3v+TPdgE
         nGDvlTRC6ssQAeYHeyitsV35sUQo66X0+eD4lEUTs9W4dcjrqCZ4RdJKeFd2TlYHnK79
         /F4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767762329; x=1768367129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KElYrA/rOSwZEsZrUs10djaGaBsLTXTb05RNZ4yG4gk=;
        b=AAe4ZZDSSA8wZIYS7dtZOPO7Xh6CZo+omwrt9ffhHwmoGZqf3UQZCcwY/7y5lzaXj+
         vEZT236TXOyJXohswWU/o8TB3B1+OB8usqfq376gg+eCYVx0aIdAtJ1V0+Dz1Q7bCslL
         ihN4XPctB6T4SZHsjKn8qjGaCQ5rrFFjh5mW3895WUwDQv+HAZHHeZNjiLKALbB96tdU
         702zfQ0i7ZEBuPIA4H+RKZbLr74CCrXHMQloW23sh31/uN1r3fOaeKKSfCnfZnlhoRvV
         gmE470eGqw8MO83o+Pp/Lff3DADlZSM4o3LcioN06GqARSTJcwsofdsZUEbDkdH+xhms
         nLPg==
X-Forwarded-Encrypted: i=1; AJvYcCXt3I0MLATg7Nc5uo6vtRSWFwCFzDwev7l1Tdc9MD7rcjsZXMPNAYquC7oNJCNTrS77bL7GP+sCUrIdOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUKIB1Lf0LCxBThFcE5ChWryCxl2NApeYw72d0WYYm3ttKunrp
	0Nw0Th7cUzvcCmiuH/JOme3SvESiQ/XnmGxpa3hdGuZNEHNJBZDWD9EqcpWJDjRyAp0=
X-Gm-Gg: AY/fxX4iumZKuFCuvD4XU6IcLUHIdwUFaRoPSavQR7kYgACMva/FVq8kicDxUfVsDHi
	u/GTIXZjz6UoHlUkZ2wqdPv0N5wxuPGUljyJfSJhREiwBsGVtyk7a8lmVtaAaTU4n1N6dB3iC7r
	h7ptSQIsmOdf2/+9afLTQhN5O/28ycxqOwuJ03mmLSdOkBqrLjUGRA1THXUvk0D90jcCXqceVxs
	yjraH8XK0L10T5kAvK0af68bNXO8Ht0hCrWHp+mqlrC0TNREaWsCswuKIe3jds3UEJ3i/Vo/TdF
	1yKkGMewzut1r9NSDztTKIdANOO2dHo3tFeViV2ub1BEMGIPh7sYhvj0R7jSjf2CV7LedRtlJgy
	DU+3ubTSVxhkR4/H64wwuZBnUwC1zpOLCDBbK38uGUAFxwXnBaJNZBRtGHspRXXhSXExM6QbPob
	bdqIzi6UbwPpDK44mHJMKsetNozxDJbRXjr5XNeju26RBcrOfEXcBIPsKTZOwalIqPQQ==
X-Google-Smtp-Source: AGHT+IEiZZ20zSl7p6JXD26XIIhK+kk4PNHiCUsnUoutwqu0xYqDlZyc/SSOIPlJXZxKrfSpdnUXNQ==
X-Received: by 2002:a05:6512:3e03:b0:597:d7a1:aa9c with SMTP id 2adb3069b0e04-59b6f043c1bmr252030e87.3.1767762328756;
        Tue, 06 Jan 2026 21:05:28 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6addaab0sm693410e87.28.2026.01.06.21.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 21:05:28 -0800 (PST)
Message-ID: <bbf0dcd9-d0f2-49a6-a2f2-6ec9376f2f59@linaro.org>
Date: Wed, 7 Jan 2026 07:05:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Robert Mader <robert.mader@collabora.com>, Bryan O'Donoghue
 <bod@kernel.org>, David Heidelberg <david@ixit.cz>,
 phone-devel@vger.kernel.org
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-6-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260107043044.92485-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/26 06:30, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../boot/dts/qcom/sdm670-google-sargo.dts     | 104 ++++++++++++++++++
>   1 file changed, 104 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> index ed55646ca419..ec447fe3959a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> @@ -172,6 +172,34 @@ vreg_s2b_1p05: vreg-s2b-regulator {
>   		regulator-min-microvolt = <1050000>;
>   		regulator-max-microvolt = <1050000>;
>   	};
> +
> +	cam_front_ldo: cam-front-ldo-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_front_ldo";
> +		regulator-min-microvolt = <1352000>;
> +		regulator-max-microvolt = <1352000>;
> +		regulator-enable-ramp-delay = <135>;
> +
> +		gpios = <&pm660l_gpios 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam_front_ldo_pin>;
> +		pinctrl-names = "default";
> +	};
> +
> +	cam_vio_ldo: cam-vio-ldo-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_vio_ldo";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-enable-ramp-delay = <233>;
> +
> +		gpios = <&pm660_gpios 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam_vio_pin>;
> +		pinctrl-names = "default";
> +	};
>   };
>   
>   &apps_rsc {
> @@ -392,6 +420,61 @@ vreg_bob: bob {
>   	};
>   };
>   
> +&camss {
> +	vdda-phy-supply = <&vreg_l1a_1p225>;
> +	vdda-pll-supply = <&vreg_s6a_0p87>;
> +
> +	status = "okay";
> +};
> +
> +&camss_port1 {
> +	camss_endpoint1: endpoint {
> +		clock-lanes = <7>;

Please remove the copied bogus 'clock-lanes' property, here it has no impact
and here it's value is just some random number.

> +		data-lanes = <0 1 2 3>;
> +		remote-endpoint = <&cam_front_endpoint>;
> +	};
> +};
> +
> +&cci {
> +	pinctrl-0 = <&cci1_default>;
> +	pinctrl-1 = <&cci1_sleep>;
> +	pinctrl-names = "default", "sleep";
> +
> +	status = "okay";
> +};
> +
> +&cci_i2c1 {
> +	camera@1a {
> +		compatible = "sony,imx355";
> +		reg = <0x1a>;
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&cam_front_ldo>;
> +		dvdd-supply = <&cam_front_ldo>;
> +		dovdd-supply = <&cam_vio_ldo>;
> +
> +		pinctrl-0 = <&cam_front_default &cam_mclk2_default>;
> +		pinctrl-names = "default";
> +
> +		rotation = <270>;
> +		orientation = <0>;
> +
> +		port {
> +			cam_front_endpoint: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				link-frequencies = /bits/ 64 <360000000>;
> +				remote-endpoint = <&camss_endpoint1>;
> +			};
> +		};
> +	};
> +};
> +
>   &gcc {
>   	protected-clocks = <GCC_QSPI_CORE_CLK>,
>   			   <GCC_QSPI_CORE_CLK_SRC>,
> @@ -490,6 +573,14 @@ &pm660_charger {
>   	status = "okay";
>   };
>   
> +&pm660_gpios {
> +	cam_vio_pin: cam-vio-state {
> +		pins = "gpio13";
> +		function = "normal";
> +		power-source = <0>;
> +	};
> +};
> +
>   &pm660_rradc {
>   	status = "okay";
>   };
> @@ -508,6 +599,12 @@ led-0 {
>   };
>   
>   &pm660l_gpios {
> +	cam_front_ldo_pin: cam-front-state {
> +		pins = "gpio4";
> +		function = "normal";
> +		power-source = <0>;
> +	};
> +
>   	vol_up_pin: vol-up-state {
>   		pins = "gpio7";
>   		function = "normal";
> @@ -547,6 +644,13 @@ &sdhc_1 {
>   &tlmm {
>   	gpio-reserved-ranges = <0 4>, <81 4>;
>   
> +	cam_front_default: cam-front-default-state {
> +		pins = "gpio9";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};

Likely this one could be omitted, the proper and expected GPIO configuration
should be done by the GPIO framework itself.

> +
>   	panel_default: panel-default-state {
>   		te-pins {
>   			pins = "gpio10";

-- 
Best wishes,
Vladimir

