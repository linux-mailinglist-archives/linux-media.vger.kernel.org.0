Return-Path: <linux-media+bounces-39954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF6EB27B0E
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 10:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C6D71BC1F33
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 08:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA5F259CBF;
	Fri, 15 Aug 2025 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="foXLnOzp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288EC259C87
	for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755246609; cv=none; b=LKOwEKcgGu32qBBYS8qlmsLN7DFnn0l+S4XeLIMcyfhyfUvYHJgECXUBvq8Mv1BZBRs6OJYFul4WxdT1j7xSjvmCjpk//XzB4Io4yUYgkfwqfi20yTyaKpPpPHEB2nhqacS+UMCe6knwX2wRZ04d2d8VYN+1/w21AN2rlQH714A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755246609; c=relaxed/simple;
	bh=xK2/sQuboR8RxHlU5a6vsg5CxWE9FmGx9avjyrBFlPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5Z4tqauUUL89tpbeRHKdP+9G442VAgImXN6u0wNVuQL1syXGGkk1g+mG8AYApNPgKQQO6UnG1lGPpNkaYfoxwE0JAE1/t46V2fqFtTV427CI8IeJaUGNYvljR9ZfG6psBklxdBnMOmTEmcHOZft+CwtnrXwASWJg2wqNtRk9ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=foXLnOzp; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9dc5c6521so980626f8f.1
        for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 01:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755246605; x=1755851405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JajMyuBKXy9ESCn/BlvUni/IIWDRCCaEiDEiH+zh/Bk=;
        b=foXLnOzp5tk9bQ/OXCjRaaamM0k8ViSbD6hx9aGAV+quZ0I3RsQz2Mcsgactk9BC8d
         YBsEmWvTd+bh8MaGNkFZbxQxenT3Xs9NE9UXmXcQj0pNsQb3Xq9WEQpwSdncDWz8Dqn5
         Um8faARY2IMJENiUjcpBBvKaGXcuJYiPpOzxoGDeRkwQqeb8xkWWJYYK//7oy+slB3cl
         fHMkaR6Yy0HMeL5CY2P8o+I4sNnpNuvRHw4D1z/mzAAL7f2Wo2Xhka9J4Idfx6x64iD0
         UUSeS9pkr5j2R3fNXv5t2tpSHr21f82FcIUNxcHDc6x6o1EX2UF3iTJ9xQO7VfdOpUDI
         QPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755246605; x=1755851405;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JajMyuBKXy9ESCn/BlvUni/IIWDRCCaEiDEiH+zh/Bk=;
        b=bBVCqjx4eTwTXIcI3kcw8ZDzT6XVwcp/Ker3mxVNJy2ednYaVbg2QTM0oOzPsMVOQF
         dnLd42vprl5F25VS4vz2RAIFkuEzvrFuk1kXDIe5msa8rMqQoCmnXa/LO59ygfNf7gsX
         v6IfuNlPqKdF8gRP9zbETypJiyB4uuilSNF3m2EgyKHeEn4mgrOgRFb2k/WxjR34MDHp
         Kt2+WqEI/2VYBwoRok+sti37uH3+H2htIe/LqhGHyir+kdYItip3ibYgsL5LPPu6yY/z
         Wrqj1ZHqWfBfxffOANoeAKbE4w49lgDqzGJ9tdcZbitVvK2nBqURLcX+E5uzGVCV3G/9
         9FVw==
X-Forwarded-Encrypted: i=1; AJvYcCU3MivKuHnO84uUl0hi6nv9TARIbGF6ieoFfyQOhI8DCEUDxJaoamrQmV07zLjlzcE/nPSsE3wuUB6AkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFx4TuX8Cb6s5JbwkTikCtwwPDOmnwYNwsfBj20bg/AXXpZT/i
	g9Me9vOgq2QjjZk6ImUMyT0UzU3uU14JoXISz+RlL7mdcqEbL6sakWaODFLmYUY8MCI=
X-Gm-Gg: ASbGnctfwjN0Axuv0KbVed7G3IA074FnClR5akq8jAOeBa7V2aaKT2OCIppF6wQ80t+
	AwWv8LVu4vgPHfpKkkwpjdi3L1jeHd463HPJxDxyIbjxxW//ahuac4oN8NaLuYHYn5klL7uNDE7
	pCFjZdA1LYGjURBZZLjucc4WAY0+yh4yoYHhKk/goiF40cG68FzrN6PdLLb5LtMgROM+X94Ydwz
	NXgG7scAniHdSYUeHPJjZqx/B/cOdf6jRowtHmt8sHS0+3hWF+UtAsKsTPg47T8utJ37KxDIJK/
	WpO69SsQbjXuI1NSEi6NUBLYdODK47rg9ZQ44pWMw9yGBs0Tf1sDZalOWjtCdHN+156au8xxV1X
	SLLT4lqWSosfzgu5cA7eNdOEcvx4MiFoYUdwiMWe1to3OLZxSPZ5nHIwu7wJuPBc=
X-Google-Smtp-Source: AGHT+IH6BHDtxDki2/fJTwfcRFDg2YRitQJxCzC/GAWvq48MmAeyra1tafJyjDtDGVdg3mMlF+gFGw==
X-Received: by 2002:a05:6000:26d0:b0:3b7:89c2:463c with SMTP id ffacd0b85a97d-3bb68734babmr758441f8f.29.1755246605489;
        Fri, 15 Aug 2025 01:30:05 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb653f657fsm1098135f8f.29.2025.08.15.01.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 01:30:04 -0700 (PDT)
Message-ID: <3caf5615-a813-42a0-b77a-695f250ea01d@linaro.org>
Date: Fri, 15 Aug 2025 09:30:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, vladimir.zapolskiy@linaro.org,
 todor.too@gmail.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
 <20250815-rb8_camera-v2-3-6806242913ed@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250815-rb8_camera-v2-3-6806242913ed@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/08/2025 08:07, Wenmeng Liu wrote:
> Enable IMX577 via CCI1 on Lemans EVK.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile               |   4 +
>   arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso | 105 ++++++++++++++++++++++++
>   2 files changed, 109 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 94a84770b0802a9dc0c56ce6c59eea20967a5d89..7efd113143013c6e9d211597a4c2defd44497c83 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -30,6 +30,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
> +
> +lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..4600d5441cce4507734b2fdcdbffc1ad7c67c32d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/*
> + * Camera Sensor overlay on top of leman evk core kit.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	vreg_cam1_1p8: vreg_cam1_1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam1_1p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&pmm8654au_0_gpios 8 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&camcc {
> +	status = "okay";
> +};
> +
> +&camss {
> +	vdda-pll-supply = <&vreg_l1c>;
> +	vdda-phy-supply = <&vreg_l4a>;
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
> +				clock-lanes = <7>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	pinctrl-0 = <&cci1_0_default>;
> +	pinctrl-1 = <&cci1_0_sleep>;
> +
> +	status = "okay";
> +};
> +
> +&cci1_i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam1_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		dovdd-supply = <&vreg_s4a>;
> +		avdd-supply = <&vreg_cam1_1p8>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				clock-lanes = <7>;
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&tlmm {
> +	cam1_default: cam1-default-state {
> +		mclk-pins {
> +			pins = "gpio73";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		rst-pins {
> +			pins = "gpio133";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +};
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

