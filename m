Return-Path: <linux-media+bounces-50847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E3FD2E8CE
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 10:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A389830263CC
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 09:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B45931D759;
	Fri, 16 Jan 2026 09:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pi8JlhvX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1C331BCAE
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554733; cv=none; b=YJn8Hldgay2Q4fQgE8e3/s30Gwmfjf55vNiu77xqFpxXopQUb6jpOul0bt/ii6ujGMhRaowzPP3Uf/7ThKFwsxRLHalkGwPQrnqbrlLlGi37kNJVdpYf44MzeekNIsFcdiNHS0XsLYDNUKT1I3M9tVRe4uKIkHp97wuzcm9m0Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554733; c=relaxed/simple;
	bh=/HeROcY+wue/RnfDCzGh5TkygmGivHiZHG7v8KNDXNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDGAFwm5CGL3XFaemDih5zGPTZQIQPy7ATLUxJQ7MXiT2FbRUYTEZQmGNmK5svfxhTqZadmOy53W0t3a9B/PS1G5W1cMKZ3Gz25tMuIil4yXugXmF+6Y2Rk4AdGhFI4XYIlz8KaqSItCia2P03ihLwbUY+LiJrCqb04JP2Ob3HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pi8JlhvX; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-382fb1e257bso2512941fa.3
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 01:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768554729; x=1769159529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqAbJs5DEIYF5QCBGJfgcurtZvGAMM7ELYVo8ENiu9M=;
        b=pi8JlhvXn++3rJEQ8Wv+3wopz/ouDG0V6LlCBdNEckYz7gLn9hS4zOS8yFN4JVTuj6
         eUgVu2KVJlxZnSzR1uD6lqWeK/wEaVuWDmndR/TxKCBm3gBH8soWuXOFCsxpVKgYkChl
         C87Vmhym4AvFaMuTl4VvwU5NZdS2rqiEFvMLu9QLy/Hd7lSLu+k+DifphE13QGO4pXMT
         hT2wgq7+snBL3wFBYhoYhLF5Gd9x3v+/aSKD7VtkDI+uCMG/Ovi36zSTCmvrEQZFslzN
         nOIqU6sxfdpeFhC/OFi15iANK6tfQir0yJkV8T8oevHvKGLwTZOASigK+1rtO1j/o5pn
         skww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768554729; x=1769159529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pqAbJs5DEIYF5QCBGJfgcurtZvGAMM7ELYVo8ENiu9M=;
        b=Ve9AXsslY9sDxaluHBHyi0a+50822TME2HdZc0LZLomRercwmn0s+r9oUl2uW1WkQV
         ojQCucaFzLEQL43qttDp7B0mCJlc7RkebFQ0M2PXjBd4xAZlO9XH6BAcMAVwTl/rECxJ
         NQ6LLt2ZteqhnMJJ3IxQ67NdkDeM5kYqciX8ZZMOEjTjuvSO+12OHhnrWqec69bfvNsS
         n5FURhYHU7tAy4Q85EhBvaNnwtZYR4AJs7gHej68674a1rmWQYt3bQzGB3IOUSVac+rF
         mKk/sWMDM6zfsN4YbwuVhAwILMFuyqhBF04NBmG4RQ1PFzk2oivToCQYh4hVkRZ7OHG+
         Piew==
X-Forwarded-Encrypted: i=1; AJvYcCWDx3NPmcLF03v01FUFAGk/wter6m5AKwuXdqEZ9EmLLzHSRjncG6U3On99lvJOnOayr8m3h3NC92/f/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEoNec9294wSrIQFhqDngOggL14OAJmKfNwv/DXgFqL3o2cECb
	DHymPMPlwgyxwjfhow9LdrhDzI57+Re+5hz1xWBwZ2BC3AuMOIsvtsBf5NzBbbdYiJ8=
X-Gm-Gg: AY/fxX4lb8xf+5lcdWSXfM73wij5FMp6ouNbZFtWLlcQ/WKIi4pAiJnLNKgCQdSBXV0
	jRIhlR1opE5cy1m6HkYflvBVIkfVDM5VjsOPGR0iq3VRKp+VOQKb2LSuCDqXBxMikR4TgpV1PwS
	/lLDnGmOWkqJGKqSJsBAzHOSK3cvXAWoTTuz7t5Cx4w9gNdNWakUHGBQEM/oL2Kt4bFLxnBGMOJ
	EYAGoX0QU7BjoSnB5cZLFU/TYB1mq5bxIeZQrYZsG0nn3Vix9oO1i3OZDu7hkytIJ4GRKmjbNxM
	K3rg0TZBbIAVmw/eEovA7t2qpyXp2Ibg7on949K6Egy0soYTjfAbUFkuStu4wn9AuMmC+qzAFKX
	uak5SQQulyCfXrxtKsK+9EbX+l3EHtxSha5Oc7g1W1qmlSkAANtrowLAqooP7WBI292+bou3kAf
	xPIzJ9RnMAszTefmtsHyYkJTSjnAVYXyhae4C9eaPqBZBSe61Dis6ttzMsfgj/Q+IYGw==
X-Received: by 2002:a05:651c:991:b0:380:a1c:7039 with SMTP id 38308e7fff4ca-38383fe5fbemr4683611fa.0.1768554729185;
        Fri, 16 Jan 2026 01:12:09 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d8e0e5sm5608701fa.17.2026.01.16.01.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:12:08 -0800 (PST)
Message-ID: <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
Date: Fri, 16 Jan 2026 11:12:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/15/26 12:12, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default, this DTSO has enabled the Arducam 12.3MP
> IMX577 Mini Camera Module on the CSI-1 interface.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>   .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 00652614e73582fa9bd5fbeff4836b9496721d2d..be9aeff2cd1555bc436e1b8eb78d8e1c9b84f9c4 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -339,8 +339,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +dtbo-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo

Please remind me, what does dtbo-y Makefile target serve for?

> +talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
>   talos-evk-lvds-auo,g133han01-dtbs	:= \
>   	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
>   x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdd-csiphy-1p2-supply = <&vreg_l11a>;
> +	vdd-csiphy-1p8-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci {
> +	status = "okay";
> +};
> +
> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_s4a>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

