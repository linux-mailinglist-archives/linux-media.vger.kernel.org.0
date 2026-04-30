Return-Path: <linux-media+bounces-60062-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJf1BKY282lgygEAu9opvQ
	(envelope-from <linux-media+bounces-60062-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 13:01:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9804A131C
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 13:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F57C300E5D0
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 10:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9DA3B47E0;
	Thu, 30 Apr 2026 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bbInM4mY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CA13921D8
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 10:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777546181; cv=none; b=oQzHYEfpAwtBrrr/GwlRUHiGnULrZIxy4HdJgnQT48avBVijFRgwbHBVC96sSxJ+yGaRJswYqVJpquQwkTEh1NQg5e+yC4VORD2hmaugMEj8OqTawlqfmz1PZj2AiN9rcoueh7e3Mb+qwuXapgbSEV/OIdMStgXkzV0U6WqAHFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777546181; c=relaxed/simple;
	bh=9ExJAewyRTdinJlKoHCm99hH0XRD1SnaeObHp3MJn4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnGqqLmY0B+O558z76weGTIJaPc/fTRkqXMRfWJXjyxaolUJey4MsDpzBFADW2cPMsK2ZQcm10NSK1EiPSkAAoEFDAD2zwZ2YE8Wn8kae69YsYZGdz8uZS84vvNLYelwpnR2BqcaeoJPOAJtRATO+qf3k/FdFGK4oCPz795BzU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bbInM4mY; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e7af339ecso636891fa.3
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 03:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777546178; x=1778150978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmyJ53pHqLwHEKIa38JSRjFXiWvFtp6uO7lzOz7NoBI=;
        b=bbInM4mYXpXSlFbqXBUU3X8qqVzl8+dJpt/BFx2kMGgmLEQdMEH0knopdaJuWXg0DI
         G7MADJp7xROGpLhRqw5FaopA5SHjL6C73KNAPaMfdv3+C3Wo9VcD4h0XenV2toM1abT9
         wPyv7qECTGe71Qi8OEjzRMQ0nbAuTLxexwDKsJacelJ6U6JYQDiPH0CrbRzuIOLm37q7
         wPwsFtf3Ur9ej9UAlGbFZk1hhvqzJJ7jjpEY7R2buCt5cHK8DB9/4//4DRxP2jjzV5Hc
         rJYvieZE8pz/nWAkRDehm/oyW7E6cMK8EMnClkr+d8paBrYlpcupOZwLPUQ6trVBkPN0
         Pz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777546178; x=1778150978;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cmyJ53pHqLwHEKIa38JSRjFXiWvFtp6uO7lzOz7NoBI=;
        b=Klwv48vWAEfkyrk+i0C8RHY1+8uTA4VPjAfI8IEDR/SeWUA3N0owksIFzKdp4oUz4Y
         Vv2cZegrlcA74Zus9MkzLBTqml13cjYnooML8xH8t221ZwbFXL+vN1F723lG1BgtwGNf
         cRBeli8mxmEhtmJgVJWS4SAwIkxfzBPQg+VB8/VYiqZJ6Zhv9dE2VWNUR7MJOwiEva+1
         AOLa6rUQg+ljMmFy63/OXMkoAFo9QS0LibdGqWxn4WpBWtD/2iRYAWnJSHxEdSdBIcTY
         8myRKIxSPoZPdIIFiLThuWoOAomtWeFOBhApQkLLAexn7ndiwSNTxcib4nPM9cjy1T9s
         PmIg==
X-Forwarded-Encrypted: i=1; AFNElJ8YRx7L5WVPEf4O55bdoaOuICs09FeYsjXvM9ywWt2MdHJLWKdjnLDcL9qQYGJFCs8NggsUcW3aUH/rwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi7uW7tv6DqrJ/HE8/ao01EdBRiEvqdv6NMutaA/+O/RvyjkNQ
	iakOvXP8bJzH932JOVKRrtwLNkrpRI4SUq0+9YDy5jBQpbLsRTeMp6dXtjCVYv/lJXhmqixghyN
	CXdl4
X-Gm-Gg: AeBDietdudoM8drINag/M2HMEzJBVeGPK6hbYjyFdqal5S73zYIupg7Wa2ugtEzgv9g
	7nwWcB2IAGvZszVO/tKmKm6TRo/tbnIJ+nC9T19y/NWAepP0lsILfszAwhtbeGuz0tK3m8dUWmk
	C18E6dhdw4KEUka91si7fIt8Br1Yx/deL7QD+8OpnMdhIb6OTJBgo7UMSultXatal/mDhXXV5Xi
	N9FQIxY3Vc+K2hhNGCmrt5zPhT/3ROV1zYAHsoIeZQKahG7MEymAB71dxox3QoybYN9KX0ChuDB
	909vcZPWcFUzBRDtWLP4WsBRG97NAOph2mPS7sctMa0OCc+SJ1fWbFRiipHQHBhlDNud3T0tGHH
	ZiSvg34cfT2DoqIM74jZG3BQh6naSl7IxRpEIZDeJkmoXxDO9qOYJGBEG6aovPbrlZ+yZB6Q6CD
	hNrjOabDTEPX/ouC77a97/R+UFCkr0zCaTYHTcMBVQOcGH3OfLvbenpiFVL6AmSL6vI9OOdzd3R
	dJKglq+QSBM04NC
X-Received: by 2002:a05:6512:10d6:b0:5a4:1977:dcfe with SMTP id 2adb3069b0e04-5a8522acbdcmr330857e87.2.1777546177941;
        Thu, 30 Apr 2026 03:49:37 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3934f9c15e5sm4763751fa.11.2026.04.30.03.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:49:37 -0700 (PDT)
Message-ID: <c26246c1-0f90-499f-ba32-34159baa5dfb@linaro.org>
Date: Thu, 30 Apr 2026 13:49:25 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Pengyu Luo <mitltlatltl@gmail.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Kepplinger-Novakovic <martink@posteo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260425105300.745044-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CB9804A131C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60062-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[linaro.org:s=google];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,posteo.de,linux.intel.com,puri.sm];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[15];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_SPAM(0.00)[0.438];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid,2d:email,c6200000:email,0.0.0.50:email,0.0.0.0:email,0.0.0.20:email,0.0.0.3:email]

On 4/25/26 13:52, Pengyu Luo wrote:
> Hi846 is found on my Gaokun3, descripting it.

To the best of my knowledege there is no 'descripting' word.

Say it simpler like

	Describe Hi846 camera sensor found on Gaokun3.

> 
> Note that it seems that only Goakun3(3.0GHz) version is equipped with
> Hi846. Goakun3(2.69GHz) version is equipped with S5K4H7.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>   .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 128 ++++++++++++++++++
>   1 file changed, 128 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> index 9819454abe13..39e559e91289 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> @@ -15,6 +15,7 @@
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/input/gpio-keys.h>
>   #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   #include <dt-bindings/phy/phy.h>
>   
> @@ -27,6 +28,7 @@ / {
>   	compatible = "huawei,gaokun3", "qcom,sc8280xp";
>   
>   	aliases {
> +		i2c2 = &cci2_i2c1;

I don't think that it makes big sense to add this I2C alias, please
consider to remove it.

>   		i2c4 = &i2c4;
>   		i2c15 = &i2c15;
>   		serial1 = &uart2;
> @@ -47,6 +49,21 @@ framebuffer0: framebuffer@c6200000 {
>   		};
>   	};
>   
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		pinctrl-0 = <&cam_indicator_en>;
> +		pinctrl-names = "default";
> +
> +		privacy_led: privacy-led {
> +			function = LED_FUNCTION_INDICATOR;
> +			color = <LED_COLOR_ID_WHITE>;
> +			gpios = <&tlmm 34 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +			panic-indicator;
> +		};
> +	};
> +
>   	wcd938x: audio-codec {
>   		compatible = "qcom,wcd9380-codec";
>   
> @@ -98,6 +115,20 @@ switch-mode {
>   		};
>   	};
>   
> +	vreg_camf_1p2: regulator-camf-1p2 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_camf_1p2";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +
> +		gpio = <&tlmm 44 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&camf_1p2_reg_en>;
> +		pinctrl-names = "default";
> +	};
> +
>   	vreg_misc_3p3: regulator-misc-3p3 {
>   		compatible = "regulator-fixed";
>   
> @@ -462,6 +493,13 @@ vreg_l8c: ldo8 {
>   						   RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> +		vreg_l11c: ldo11 {
> +			regulator-name = "vreg_l11c";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
>   		vreg_l12c: ldo12 {
>   			regulator-name = "vreg_l12c";
>   			regulator-min-microvolt = <1800000>;
> @@ -577,6 +615,66 @@ vreg_l10d: ldo10 {
>   	};
>   };
>   
> +&camss {
> +	vdda-phy-supply = <&vreg_l6b>;
> +	vdda-pll-supply = <&vreg_l3b>;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@3 {
> +			csiphy3_ep: endpoint@0 {
> +				reg = <0>;
> +
> +				clock-lanes = <7>;

Please remove 'clock-lanes' property from above.

> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&hi846_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci2 {
> +	status = "okay";
> +};
> +
> +&cci2_i2c1 {
> +	/* On Goakun3(2.69GHz), S5K4H7@2d, image quality is better than hi846 */
> +	camera_front: camera@20 {

'camera_front' label is unused and should be removed.

> +		compatible = "hynix,hi846";
> +		reg = <0x20>;
> +
> +		pinctrl-0 = <&camf_rgb_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAMCC_MCLK3_CLK>;
> +
> +		assigned-clocks = <&camcc CAMCC_MCLK3_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
> +		vddio-supply = <&vreg_l2c>;
> +		vdda-supply = <&vreg_l11c>;
> +		vddd-supply = <&vreg_camf_1p2>;
> +
> +		leds = <&privacy_led>;
> +		led-names = "privacy";
> +
> +		orientation = <0>;	/* Front facing */
> +		rotation = <0>;

Both properties above can be removed as the default ones.

> +
> +		port {
> +			hi846_ep: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				link-frequencies = /bits/ 64 <80000000 144000000 200000000 288000000>;
> +				remote-endpoint = <&csiphy3_ep>;
> +			};
> +		};
> +	};
> +
> +	/* actuator???@58, Goakun3(2.69GHz) only, eeprom@50 */
> +};
> +
>   &dispcc0 {
>   	status = "okay";
>   };
> @@ -1318,6 +1416,36 @@ hstp-sw-ctrl-pins {
>   		};
>   	};
>   
> +	cam_indicator_en: cam-indicator-en-state {
> +		pins = "gpio34";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	camf_1p2_reg_en: camf-1p2-reg-en-state {
> +		pins = "gpio44";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	camf_rgb_default: camf-rgb-default-state {
> +		mclk-pins {
> +			pins = "gpio17";
> +			function = "cam_mclk";
> +			drive-strength = <6>;
> +			bias-disable;
> +		};

cam_mclk pad function descriptions on all 8 pads supporting this function
shall be added to the platform in a separate commit to sc8280xp.dtsi

> +
> +		sc-rgb-xshut-n-pins {
> +			pins = "gpio15";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
>   	i2c4_default: i2c4-default-state {
>   		pins = "gpio171", "gpio172";
>   		function = "qup4";

-- 
Best wishes,
Vladimir

