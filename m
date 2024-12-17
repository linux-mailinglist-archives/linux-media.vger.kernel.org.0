Return-Path: <linux-media+bounces-23602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3669F4E04
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 15:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B1DA1885909
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 14:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF421F63C8;
	Tue, 17 Dec 2024 14:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JK1BeZq3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74781F5402
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734446417; cv=none; b=RttQ/RHJYSCe9mu9MIMW5zGnPpnZx62J+CjH/GU76HiIRPPHRQ9FzxzfYmW7OBBFjRGcdi5fOY63DQviUIDQgIu921lSyUoAOj27e0//HMslYZv9myzs23U+WNqQJEka8rFpGSDaEJib9wEGanphdEfEevTaUg+xdTsaftIZP/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734446417; c=relaxed/simple;
	bh=A1XIGvxeV2VFnVHx/hseqMs44z6j0pkz+jZmIS1lBRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kzxPHYycCYtUjA6xPxnXESnuzk+tRCgC+GsP7tdg3l7ntIjRaofF9vV0kvlm4aNW0ePrKhMkFwg8DkHhMpmwym88l5zMmBssy9V2xUqbvWEuld/OoX1di3SPftPgUy7U5yovliUb94c6dO+z0DPKmOXCaF73kaSrd2ExG1RGNbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JK1BeZq3; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e384d00f4so898844e87.1
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 06:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734446414; x=1735051214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9YMcdH8avPXNZfQXLzQwJPKuLvhjYfkBvWblo32XnJE=;
        b=JK1BeZq38goqQ2ScIjraNlI3hNTCaATKIyCplz7emQJ3p8YJaYfhCZMGEr0AHlYKKe
         9UP3CSGccZSVJXhEphPIWxV+xYzVqZnYAyNjlr+AsC18h0AoTvZBspzhTVoTNFqSABA0
         rag/TYLvsubt79BMkzg3WsNp6n2r7D/BNSTISVuFzk0V+jB4vpx6/OMY/AbJCeqFPlhy
         pSHfFkaXCojy7JGcfeXY/eNnq3ttUTIQDM13vw/NdLeIJg98jjzdMq0ExHNxh/PZ0YCi
         6BNpsykFYrYXZp+u4dvDNT+On9H1tX+nMiv6fM8KtSz0wLOFX8X7+bQatnkH2ophjjIc
         MnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734446414; x=1735051214;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YMcdH8avPXNZfQXLzQwJPKuLvhjYfkBvWblo32XnJE=;
        b=eYEJfEP3jwRP1lzuqDFUGftuefKHdv+pBqsX4/wTjFP8WiyKkRPWunBf2h0OEIw2T4
         0aF2HG01rS8ITGe820uCL3+zU8f8d/b3NZwo/BZ16TjfEIFuzpYWZvBih+qVFmXVzx0t
         d46AzKH+x4ZjgUbfM29N9Pjon4IGNJurJE3aEvKhw1IrYjugyofpGBwPDNGdVCS0WZYT
         XIiswTVw89MLdY96aTdTzeVRDIClKh/MUnvE2w5Es+Om+6bk/5lGFXRcms/wLtQgg9PM
         vbGT/DqUoFpsm6W/tIfbtV2EQ/fGPGilWLfuUa9XHov9dL1kPsSl1ns4Ubbx6PoekOez
         aTZw==
X-Forwarded-Encrypted: i=1; AJvYcCWNyliclUN/r6DQfIWOdw3azFYDyo2qxyA5Xzc7dLG/lNao6M7sm0GT5LSUKIQreGifjdGzOY0Gacl9Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaEBXb8ZF4p4mGubwG+XdszhK5KNPu8GagL1ka3Lc++pBx0QLC
	EqmfIMsaSwvAGY74YqNRcf7yfmIg5LxwpOEkbHs9nZcvKR4OCH0xU8DGdiDc7Ds=
X-Gm-Gg: ASbGncv3aIuBAHj+OgOxfjdc/3ns2nZc8apm15k6SEzUTsb8USC9q7ZS7PkA34OLF5F
	DNYvq9CTKmE5p/MU9PQnRJTpsjGr5KVBPVdD34lBs/VGVqIHKVhFXRdZZzws5BcOuS8XPNWjDBg
	8UDkkAARTniaKlTjMNvhrZma4+k7Y6EYXdfi0f+gRq37XEek893j/JLYYFsm5oiLn5gQlfB/hrg
	sBHIZTTdUXlXWeFN+QSHW0PtBYv4PSUpbX28JOIQpk+DgGjgsXj26r9qTduVBiTN0K8ct2ChloY
	jES+NqWtrR5C1iNrV0Wzp7AyUQdzVz3MRYo=
X-Google-Smtp-Source: AGHT+IHOWR0Y5fR+2uxPBxCjytt0LUgJIVwtzY4VhNEtFXNjP9j8AdE4VL7hkzuX+HhMism2gVrkcA==
X-Received: by 2002:a05:6512:68c:b0:53e:3756:80b4 with SMTP id 2adb3069b0e04-54099b6d711mr1779475e87.12.1734446413951;
        Tue, 17 Dec 2024 06:40:13 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120baa73csm1180366e87.101.2024.12.17.06.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 06:40:13 -0800 (PST)
Message-ID: <22479c27-9265-4994-8974-9739ecbae5ee@linaro.org>
Date: Tue, 17 Dec 2024 16:40:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Content-Language: ru-RU
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-5-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241217140656.965235-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/24 16:06, Vikram Sharma wrote:
> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |   4 +
>   .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 109 ++++++++++++++++++
>   2 files changed, 113 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4686f2a8ddd8..a7e88fcabded 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -115,6 +115,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> +
> +qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> new file mode 100644
> index 000000000000..7782c4aee576
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/*
> + * Camera Sensor overlay on top of rb3gen2 core kit.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/qcom,camcc-sc7280.h>

Please sort the header files alphabetically.

> +
> +/dts-v1/;
> +/plugin/;
> +

Please put these two lines right after the comments header.

> +&camss {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* The port index denotes CSIPHY id i.e. csiphy3 */
> +		port@3 {
> +			reg = <3>;
> +
> +			csiphy3_ep: endpoint {
> +				clock-lanes = <7>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default", "suspend";
> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-1 = <&cam2_suspend>;
> +
> +		clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		dovdd-supply  = <&vreg_l18b_1p8>;

Please remove double space before '='.

> +		avdd-supply = <&vph_pwr>;
> +		dvdd-supply = <&vph_pwr>;
> +
> +		port {
> +			imx577_ep: endpoint {
> +				clock-lanes = <7>;

It is an invalid property/value of the sensor, please remove it.

> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;

data-lanes = <1 2 3 4>;

> +				remote-endpoint = <&csiphy3_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&tlmm {
> +	cam2_default: cam2-default-state {
> +		mclk-pins {
> +			pins = "gpio67";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		rst-pins {
> +			pins = "gpio78";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
> +	cam2_suspend: cam2-suspend-state {
> +		mclk-pins {
> +			pins = "gpio67";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +
> +		rst-pins {
> +			pins = "gpio78";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +			output-low;
> +		};

I have doubts that it's proper to embed a reset gpio into driver's
pinctrl suspend/resume power management.

Konrad, can you please confirm that it's really accepted?

I'd rather ask to remove this reset pin control.

> +	};
> +};

--
Best wishes,
Vladimir

