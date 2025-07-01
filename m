Return-Path: <linux-media+bounces-36416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E68AEF863
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 14:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 331791C03C2A
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 12:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC87278774;
	Tue,  1 Jul 2025 12:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AA5kOqEB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3246727817D
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 12:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372631; cv=none; b=BloHraUewynSAIHsjT4wkQlj79OcCvL/WTMZlhm8CcTQYcflw4v3GI5PTpJDwCOVS/i+KqlhK/j2/7e26OwuIKwmu6dguhKsx0y3c0wClw3UNUsYSTXI7OplzXHD/9/Igg5h2EsWrSsPFWz5Q5+vX2ARkuPJ6ZDjxqNL9Bw/DfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372631; c=relaxed/simple;
	bh=NJ124Dp79Lr/97fmwOSr//WxXPtWTp675G0RTga2t9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kAAhfTBqD/i8chQY6Toa0hmWANr2EdgfAwvpImpAyyNALj38/UzuOXgXsfipUTPPeWpCc57S4u380M8U9zjHZW6zUJ5oGgIU/asiN50Q/Qk+1d01XBrxLQGTaG/sqyMcowLkbCq2qyeJb/XLGrLH4lWeAsMD/PY5jfft4MxpgO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AA5kOqEB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45363645a8eso38612645e9.1
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 05:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751372626; x=1751977426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fP9MBwzFb18vSW3lc2L/Hc8pl9m7MaNHnOhRmIvCcfk=;
        b=AA5kOqEB4lYVNPXUaCRx7pSNm4iM/jvh0yJqKr/ps3Jp6NVhiFI/oc7uXgr+0rqlZU
         tiMwgFtitmG1DJMI07e57jqDRAMjczIRLDfk7AN8ZTDqUUxCs4OTGqdg9vrsaKQXuOdl
         llr/cFAZdvTuWrC4LmSio1SwgkzijmOggMr0KCzUG3tAg4ZBqykTt9Y9tWGvHrL/dYxM
         Nx1BEzvyhqHL6IfpUJFdNTxFsIQXpjCc4G3OiDUbkkpEVRR5n9y/ely6LCyW4yh1L2rd
         yPLpjwbwmCKsYz1II1TbkHtz85vDR0n5MgF8kZNFv7C73YYF1vEBO7U3fbV2GKhtPxvC
         KLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751372626; x=1751977426;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fP9MBwzFb18vSW3lc2L/Hc8pl9m7MaNHnOhRmIvCcfk=;
        b=fmTg+Am+T+6om1vBm5ZT7r3DVPZJwyF5hRmQ84A4eb7ZYYKjX6GRm4lMNhxa8NOCdN
         7eYuJptJqPt6zp1IrOfZ9mksLQP9l3Kh8GeL4HkBK0/QzaKenZa8FqcwYkZt9HbZ4G4G
         c8PCDsey9BiOFCgF6QL/KOqX1v8gdymj3+EnbDWahllH7vLCugX4tA9xg69nXo4KiTGe
         aizwqptgGW/juDB23Sq1w93qv8K8CqTdMaRDcnsRoW8KxEyrwSfd8gHBx0msiqXsZAhz
         kPyqg7YfyKFOX34OmOO4pK+GH5/QWmmqvEKH8Bfx89JMVG6sop7fSitrQmr2uzWAWa5o
         PIWA==
X-Forwarded-Encrypted: i=1; AJvYcCXNEtaBVBL8utjntD2JV0Vsg8wvVj8UCUrLDZl+Ih4CbfTrH0r2LoFGiAJDuNXvH9STZiSMdS88z9ejSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjcCO3PgyjviRsIykL1f1fbxPg1eJqqMnKqlSYtwK99aQ7aXeN
	mQftgzmsJ0/tIvmqLtFIPsEV3tq2j9492q6T0eq7dJGml4gme//w8URdLzfsjPu3lkA=
X-Gm-Gg: ASbGncsUMpaBNRp89tyBM5IPQutpAZ1CcaBwT1zsSaayrON/sm6LcSwfzoX0CzmFXrS
	j99Pefo5A6W3IDYcc/ZEdsP/CL62QJTWx3oSbPlypc8vc9Uu7GCxRY7u6xOEXKwk7ncWFO6dv74
	iCpAM1QyW/0bNQgqtdreA2BQ5kD2K+zsreaeFsH9nej3qEGfiXG6IOQUUiHXQYOKWNiXM3RNMW/
	SjuPAxFPe24Mnq+2cDEkKVHX3LCbrRYW4sMMqzBlDWCRuUaO1QlOAXJQdpRkHdQ7mXsJVCQ05x8
	FwGbtWR2LLdfylLrMUKyrzjonKZEuxQEPWNqG/weEeHfF60wjc6OUC/5ABsW81c9r4j56nDGAmm
	RxTHQJrjYyYv+98zdh5dupSb7gqqPO+eokGGI8Q==
X-Google-Smtp-Source: AGHT+IF2T/ew6ItA1dECwcwzpkVi16Ul9/UBVeAKXTtxDNk7WlS01HZkQ9dvJOSWDY34euUgABO/8A==
X-Received: by 2002:a05:600c:358d:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-4538ee5d5f8mr200886185e9.16.1751372626384;
        Tue, 01 Jul 2025 05:23:46 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm194901555e9.5.2025.07.01.05.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:23:45 -0700 (PDT)
Message-ID: <488281f6-5e5d-4864-8220-63e2a0b2d7f2@linaro.org>
Date: Tue, 1 Jul 2025 13:23:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250630225944.320755-7-mailingradian@gmail.com>
 <3qGugliBdtpdHGZzR9xh_974TfJigMYERGVAfqmpCqe1R7O0CLU8FzXVcIESzTIc-SKzpk42ZAx5-38eDX00Eg==@protonmail.internalid>
 <20250630225944.320755-11-mailingradian@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250630225944.320755-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/06/2025 23:59, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a. It is connected to
> CSIPHY1 and CCI I2C1, and uses MCLK2. Add support for it.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../boot/dts/qcom/sdm670-google-sargo.dts     | 112 ++++++++++++++++++
>   1 file changed, 112 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> index d01422844fbf..0af6a440ecbc 100644
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
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_front_ldo_pin>;
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
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_vio_pin>;
> +	};
>   };
> 
>   &apps_rsc {
> @@ -392,6 +420,58 @@ vreg_bob: bob {
>   	};
>   };
> 
> +&camss {
> +	vdda-phy-supply = <&vreg_l1a_1p225>;

You've got your 1p2 but looks like you are missing your 0p8 supply

> +	status = "okay";
> +};
> +
> +&camss_endpoint1 {
> +	clock-lanes = <7>;
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&cam_front_endpoint>;
> +	status = "okay";
> +};

This looks not like how the other dts are upstream. Does this work and 
pass the dt checker ?

Right now upstream wants something like this

&camss {
         vdda-phy-supply = <&vreg_l5a_0p88>;
         vdda-pll-supply = <&vreg_l9a_1p2>;
         status = "okay";

         ports {
                 /* The port index denotes CSIPHY id i.e. csiphy2 */
                 port@2 {
                         csiphy2_ep: endpoint {
                                 clock-lanes = <7>;
                                 data-lanes = <0 1 2 3>;
                                 remote-endpoint = <&imx577_ep>;
                         };
                 };
         };
};

Can the upstream driver actually consume the dt as you specified above ?

> +
> +&cci {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&cci1_default &cam_mclk_default>;
> +	pinctrl-1 = <&cci1_sleep>;
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
> +		clock-names = "mclk";
> +
> +		clock-frequency = <19200000>;
> +
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		reset-gpios = <&tlmm 9 GPIO_ACTIVE_HIGH>;
> +
> +		vana-supply = <&cam_front_ldo>;
> +		vdig-supply = <&cam_front_ldo>;
> +		vio-supply = <&cam_vio_ldo>;

These are the downstream names, taking imx512/477 as a reference point

                 dovdd-supply = <&vreg_l7f_1p8>;
                 avdd-supply = <&vdc_5v>;
                 dvdd-supply = <&vdc_5v>;

I'd guess the data sheet probably has better names like that.

---
bod

