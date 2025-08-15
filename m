Return-Path: <linux-media+bounces-39990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C41AB28003
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 14:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4241A7B0FC7
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 12:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462141A238C;
	Fri, 15 Aug 2025 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f1rZ0V57"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E232749E5
	for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755261228; cv=none; b=eSUfhOwmykRScXlrM00jlcuXT+yUFO/rv1dGyqEm8SJW/+9suxxSscmZPTIc2Yne/VegbJ1Q9Mv4W1ZdyeXnijlqbeO+xQgpvKQI6JZLsSmOvZBuhxds8y0gvubhCDt4Fbzu3AlMhavhOdGEn0AeqZObE1hZQwzCYcIWHLoSgLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755261228; c=relaxed/simple;
	bh=46GZGOaqakgBkUIdadnRnKYQ/NO/VAndrSXtVLNFpSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NT8FyW8QO+GkfZJsIV6t5ey/P0lsQMdoArmO/EsxWl0E202BwurZXfpuWViz1eiVXdxrPiiO+reMqykq/X8d8JMMkK37uID99ZZIeaMH/Wwdl2pov0jZPvn1Rqag03HP2CZsBWleXTuuefZP9qJBTKFwYv1HKZTz5VNHlz12G5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f1rZ0V57; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9d41bfa35so1617489f8f.0
        for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755261225; x=1755866025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c4A6yVHZqPsXST9r3W7CAib+iVrxdX7RAjsL0wZeyH4=;
        b=f1rZ0V57+TIOzRl+L7hjdQgjiwEnFqQYSREIf2eS3ejsvm54OR+Dp4sx7RLdILUvtf
         TYFsbovILVOsw9Ckn7jgUq6vPM9ZImFuBPgTjlUe4Rt6BMCfMltKAUALa85YyR7bGQq3
         noT2Zgd0o4XDlHQ5iI2j2kOEnwGJB/QAHSKtqj683Dk/AxZ5Q2d4FjU4galn3Qp5Emwy
         kRdAXblil4WRQXkFm+PULZ+8TDKj4GjK8PvWaRBjkNoHIwWSlIRoZH0m51AbkSjH3KjS
         q+PL5i9pjlBcg+gZhmCErvJLjM9KHZz5dBlbYrWnV77gunFIDzYQZsccBZYmipjyeobw
         9+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755261225; x=1755866025;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4A6yVHZqPsXST9r3W7CAib+iVrxdX7RAjsL0wZeyH4=;
        b=V/9sb8SogKXuDRiEINuYDlGsO/gGtZ5RCmYVofQR00FbXRVkTHSi27C3UOxlGTBb8P
         a/ZRjP0dbdc7GQxuZB9/MNY6GFAgpa2uowFJWmb9uOk4yQI03UCKBhUauyInNTbxHY8q
         VgnTp3yIwQXJ3jN5UDOo5Cc0VEc+9JYMdU0d3NJhhc+eV7Xb6RcC5nONySW0O0wQUl9N
         wUL00JOfNc2qwSFCMVTpLbXuGG/iSDDh31rU70EUVhZsf6mVen5tCJ6VjRgVTsifBrVS
         vf7EruJ6BBPYIEL6ySeLaE28ClZUErBS59ECWfU5eFhqMO1tRZAifw0GsntIDoVEDxid
         5IKA==
X-Forwarded-Encrypted: i=1; AJvYcCVGUmUH5W3c/F56SE2Ay89orqFsHc2WlBaAzP3djVnnfsFct7QAc+yQaiSidRwuw1KQxG+838zhBCDPTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx900cjTUqSxbtrZz80ZaPXL1MOqqn1YKtcuSm2UmuEocN/UuOo
	mKEc6Fk7KFvDIYurHiAjHNqmqkTVD1M7E933yPnXPcgfpRxLuDaLSgJEfeJ17Ux9i8o=
X-Gm-Gg: ASbGncuZcjsyRsRmd5Evbg5AguvJoHj+NxGRISvOLzAKi+48LBWoS/8EVmjdFq4zxUD
	bnPrnfOhIhxHFgIvGXpsSUoeWWCgSx9QDZZd1Je1eK4llMY8owbp8nQqXbsjBh2nswzH0/L6Jbx
	4ID1TGu+7z/Kfb26bBdQRkI6KaWC6wofiamTzF3Gfv6F1HlBhG3Tx+8jfMB1M09HV/XKLW5Q3yI
	I0XatHYKygIPAXJ+Vv9BW5SpLlBE3tHm4hfWd+03XpUBnqYrJ4zdXPMlUEaz/+afIb0fXhwB0t5
	fBFzLnsq+Iq0WA9yg5EkLgmUolz2S75P07qJBTaT5dyrhhxPrqp1K6S4XMseV8XTelyNouSa/yn
	m009uQC32AasL1asEUMlJQL3Fcx6B+vT7ruSfll+5Pnak58SgElkJx6bSRJ7pbjE=
X-Google-Smtp-Source: AGHT+IGBHiSfundG87accVUinkZKsE5MNwQTue7kqgOTCUA2ZmveVegoDTKu8lejFp3C7EeolwybYQ==
X-Received: by 2002:a05:6000:2003:b0:3b5:e084:283b with SMTP id ffacd0b85a97d-3bb67007615mr1525536f8f.17.1755261224898;
        Fri, 15 Aug 2025 05:33:44 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb7f02578dsm1736472f8f.62.2025.08.15.05.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 05:33:44 -0700 (PDT)
Message-ID: <074b6da4-ea61-453a-a398-608cf7750251@linaro.org>
Date: Fri, 15 Aug 2025 13:33:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sa8775p: Add CCI definitions
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
 <20250815-rb8_camera-v2-2-6806242913ed@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250815-rb8_camera-v2-2-6806242913ed@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/08/2025 08:07, Wenmeng Liu wrote:
> Qualcomm SA8775P SoC contains 4 Camera Control Interface controllers.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/lemans.dtsi | 268 +++++++++++++++++++++++++++++++++++
>   1 file changed, 268 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 67d1e293861970e9ddfc0df1bb674aeffb6bee6f..ba2715eee4fbf705b790a46c3b09eb20007b32b5 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4358,6 +4358,162 @@ videocc: clock-controller@abf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		cci0: cci@ac13000 {
> +			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac13000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "cpas_ahb",
> +				      "cci";
> +
> +			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
> +			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci1: cci@ac14000 {
> +			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac14000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_1_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "cpas_ahb",
> +				      "cci";
> +
> +			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
> +			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci1_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci1_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci2: cci@ac15000 {
> +			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac15000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_2_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "cpas_ahb",
> +				      "cci";
> +
> +			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
> +			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci2_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci2_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci3: cci@ac16000 {
> +			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac16000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_3_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "cpas_ahb",
> +				      "cci";
> +
> +			pinctrl-0 = <&cci3_0_default &cci3_1_default>;
> +			pinctrl-1 = <&cci3_0_sleep &cci3_1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci3_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci3_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>   		camss: isp@ac78000 {
>   			compatible = "qcom,sa8775p-camss";
>   
> @@ -5189,6 +5345,118 @@ tlmm: pinctrl@f000000 {
>   			gpio-ranges = <&tlmm 0 0 149>;
>   			wakeup-parent = <&pdc>;
>   
> +			cci0_0_default: cci0-0-default-state {
> +				pins = "gpio60", "gpio61";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-up = <2200>;
> +			};
> +
> +			cci0_0_sleep: cci0-0-sleep-state {
> +				pins = "gpio60", "gpio61";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci0_1_default: cci0-1-default-state {
> +				pins = "gpio52", "gpio53";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-up = <2200>;
> +			};
> +
> +			cci0_1_sleep: cci0-1-sleep-state {
> +				pins = "gpio52", "gpio53";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci1_0_default: cci1-0-default-state {
> +				pins = "gpio62", "gpio63";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-up = <2200>;
> +			};
> +
> +			cci1_0_sleep: cci1-0-sleep-state {
> +				pins = "gpio62", "gpio63";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci1_1_default: cci1-1-default-state {
> +				pins = "gpio54", "gpio55";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-up = <2200>;
> +			};
> +
> +			cci1_1_sleep: cci1-1-sleep-state {
> +				pins = "gpio54", "gpio55";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci2_0_default: cci2-0-default-state {
> +				pins = "gpio64", "gpio65";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-up = <2200>;
> +			};
> +
> +			cci2_0_sleep: cci2-0-sleep-state {
> +				pins = "gpio64", "gpio65";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci2_1_default: cci2-1-default-state {
> +				pins = "gpio56", "gpio57";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-up = <2200>;
> +			};
> +
> +			cci2_1_sleep: cci2-1-sleep-state {
> +				pins = "gpio56", "gpio57";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci3_0_default: cci3-0-default-state {
> +				pins = "gpio66", "gpio67";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-up = <2200>;
> +			};
> +
> +			cci3_0_sleep: cci3-0-sleep-state {
> +				pins = "gpio66", "gpio67";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci3_1_default: cci3-1-default-state {
> +				pins = "gpio58", "gpio59";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-up = <2200>;
> +			};
> +
> +			cci3_1_sleep: cci3-1-sleep-state {
> +				pins = "gpio58", "gpio59";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
>   			qup_i2c0_default: qup-i2c0-state {
>   				pins = "gpio20", "gpio21";
>   				function = "qup0_se0";
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

