Return-Path: <linux-media+bounces-50947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B994FD38E69
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 13:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4436301F25E
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 12:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9D430DEBA;
	Sat, 17 Jan 2026 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k+2fa3ZE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BD430FC04
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 12:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768651628; cv=none; b=k7NSXNzaSnDImOkNL4aZ/PdFqlrDyjP8+kMD2AoJxp7f9f4KlG7VvNA/5/4l8gyO10ygecsY6bWJTbvy8zuVKlaRYmQiSKMLSbCmg7KJzTCKq8TyAz/sueUCHr8DykY0t5voUG/uIotDh0JvV0K76bwUxBVJNivqkC2OTV7Es6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768651628; c=relaxed/simple;
	bh=kFZnTHhF810bQp9nNoOgW5Uyv5Nf05hbdnxEqBknzYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChEemdWHB3pKIEADzXIdZUFmu9tCupGOyRo5aYWyp/uWduXuSmsL9B5WGV3+ISR/Ao67tL3bTuLcvNz6A8NbgGEtBVXFoUDsi9bBu3vt+wdeH289DqBt2q8BuuTluiZf36lvF94q2XkUS9sNphQ6Gd+UeQGPowbAfK43zOnq/SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k+2fa3ZE; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-382fa1044f1so3024361fa.0
        for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 04:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768651624; x=1769256424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7ci2Vvjz2qESH5bzyRXoL8+ViHAPbN5MrVtZdVAlwk=;
        b=k+2fa3ZEael0cGHqNnZ4PLxrvqyK54hKAq/6V78jf1P7u/6SF5fve65aXsGW2+J79P
         NdRihjfBbjk+mq//QrITQqjF86FeqcF0iavZHZhLYtX5k0FGV1s+8OMv1eqAj7PwcCc5
         vOpsMDdmwAj2Cu8jdonqnrmm7yxWZze9FZmbKSs8GqGcck5suwfmTCki64BO6gjvEVYV
         +8JJs1VIR0v05vL/+rJaXqGfAdxXGXKXLvUqfsonOBGq3RTE/b62A8D49+U2LRlrg4Dx
         xYONFBMpFCV2M3ppARl/g884FlAjWwLK1EPsAbJnJPMmQYT+mx9LWzgLpQdGv93SGTmq
         uS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768651624; x=1769256424;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A7ci2Vvjz2qESH5bzyRXoL8+ViHAPbN5MrVtZdVAlwk=;
        b=C3JzJCC4O7bRUlRxrFEvnF0IqeLBdOVEMJa9W1ihb2JX+ZXp+i2oQC4quoseOQ9sIe
         U8yI12BvN4S+A+h2ibrIjhvbqXKlbnSsI/jAUjzSiJYZIwv7VO5bwrfeng2UDFXriKQ6
         cTGLmSzfNJML4YuvSb0q1xv8uO2WM/8TBZtSrEGHzsyMohALzDnOEXLwOzmcU5tClHi8
         4hS54Z6pZVYv2ciCdszR3AWTsCKDcTLCasNH+XMZl/PMqaAlwPpJP9GAsP+TPD1mEE/K
         4MjK/0ihTN61CzxBEhUo1iA8XhLAColiLsyXQbraUm4ZsuRqU4uTDcXcg2w1nePo62wb
         keBA==
X-Forwarded-Encrypted: i=1; AJvYcCXXv9EW6ZzKWvFN16X1KPM1FhoMLsjJ5f7PIsbt/nYq4eQe9oQp7DI8YmVQx+x6pj1PLE/B5teGxhLIeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOmmd1KY7V67ChSLItfCQ72AVRFLisRXXCnTgc7TDbXE4I8tvp
	pln2Vp3Y/XqLW8A5J20emozedDreG3tB9Xo6TnDjx8L2KVlYFB7LgCV4zGQn4nwznF0=
X-Gm-Gg: AY/fxX7YTUXQmg1iE0RxfN0vwWTC7n8TSoZQdm7xXVhQioDPan0P7Fbb7FxjSN34FrE
	6OVvx3vc4yxcopL9IRzY/FgVoraaeLP81MYES04M8WE+kNrYm41c546M9/d4ZoNa2KzUldgF41m
	CRWZ5HiduEBeaK3g5uZG6X0nUoBqfIEotKjNAbxxWdVskn3znpyGIENS2Dx1b6u6QFQW0CEn40d
	PFdsDR80r9a7Ue2rFjxH1Q06w7Pi0fdqt+oWhUAZI12AxtgY226JuxV5BSePo5bCTopUK9ZJgN+
	ShCNuNt/MZv5zKNrxshN88o9onVS7HuggIryi2ZqSHZDMPHcxeS6QyWRbha45pdz4ry80+2FyuV
	HUpWuhpc9rUWjakPz2I3u7+Uoe+d058Cue0dF4o8kjt3uODJOPt4dgXpW8dUiZypETz1NgbdI6G
	pJhJrycbqW65fpZ/MmPcTwmjo+d2st6msDek2hD+BKfj8rStZOvqKV3QuhnnZ+oR9+OQ==
X-Received: by 2002:a05:6512:3515:b0:59a:10c1:8f27 with SMTP id 2adb3069b0e04-59baef10857mr1106330e87.6.1768651624379;
        Sat, 17 Jan 2026 04:07:04 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34dd67sm1577385e87.29.2026.01.17.04.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 04:07:03 -0800 (PST)
Message-ID: <893b39a0-3479-454c-b6a1-33144d075afa@linaro.org>
Date: Sat, 17 Jan 2026 14:07:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-6-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260117040657.27043-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/17/26 06:06, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../boot/dts/qcom/sdm670-google-sargo.dts     | 95 +++++++++++++++++++
>   1 file changed, 95 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> index ed55646ca419..e925cba0381f 100644
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
> @@ -392,6 +420,59 @@ vreg_bob: bob {
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
> +		data-lanes = <0 1 2 3>;
> +		remote-endpoint = <&cam_front_endpoint>;
> +	};
> +};

Looks acceptable.

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
> +		pinctrl-0 = <&cam_mclk2_default>;
> +		pinctrl-names = "default";
> +
> +		rotation = <270>;
> +		orientation = <0>;
> +
> +		port {
> +			cam_front_endpoint: endpoint {
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
> @@ -490,6 +571,14 @@ &pm660_charger {
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
> @@ -508,6 +597,12 @@ led-0 {
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

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

