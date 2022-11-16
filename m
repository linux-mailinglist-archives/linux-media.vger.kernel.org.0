Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A500462C512
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 17:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239094AbiKPQoD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 11:44:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239021AbiKPQnq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 11:43:46 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367D656ED3
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:39:55 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id f27so45526620eje.1
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGt5w008Aw/mOmudQutDKfx6AOu1GCDDQhgNGcEyo/M=;
        b=MKe7GM/g4sZSo1FwX4K2GMxG8jD2bIKQEEyw3RMGnTzCFtDNHI4/ikH1I7qowiypKk
         NQ1xQgG6O26CgAaM/4OP+ESNt2LU6SVLTMTDG/bfRAB07H6fBsbhEC8c0s9BnQmG19Mt
         VZj0ViyCer1HLgbJLtKPbOEaEJ/NHPccaWLp5SrBxnoJrOC6soUAEe7r8VUcBPJ9JIWF
         gHb8XUge6i6UVfz2WB+QzHQU3NUb0l/WjuQQU7EeefI52MlJk153e7Sz7+MPSlrjDD0w
         p4QGw7aEgYsGuHcz2UVrZGnE+65ooN7wnpma3l5bc1IbJAAxiEA1tFlsCH4dtSll9UXQ
         xZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QGt5w008Aw/mOmudQutDKfx6AOu1GCDDQhgNGcEyo/M=;
        b=I589G2dTzYr55tFdWP8if1/szl1buvorvRM2UdiVK32PXuJQxs9yldu6/Gi6D0WMUK
         gttv/8iRdLkmBAd3+YyOzxzCXETxIsnMikuwiG8e6PqMxV9oKPH8hLVjNrffAZfp0vkl
         /i+Eu/tmMG3iyby14DIezKm8Z9LVAg6PF3v2OQLx3GxddvKJOuPWAqMzIgLzd3TMEija
         ohc6yu9/ROZLMekugVbgajsnL3c3Ew7J7QVK5arHOSlzljAu8vcLLspZ9HkLMIGXYCVr
         rjkNdwjeO5JxThu/UFaMK/divHMWh5rorz2Vp47AIpee0MDS+jySniqxYVOR1Lpiwwe7
         vb5g==
X-Gm-Message-State: ANoB5pkahTF8K5pM51J7Oe5TGtoNfVvGNSTqwzXpCxOk6tHU95fGn+fy
        jpOYN1njNjoteKcbrAbFJSALZQ==
X-Google-Smtp-Source: AA0mqf7lXuKp8prUXvhDRCSK3/g80sQD+pyGjK3+8EVeBvkdh3+sqPJ+1V66RGHPv433ezBthYbpSg==
X-Received: by 2002:a17:906:1dd7:b0:7ac:a335:203f with SMTP id v23-20020a1709061dd700b007aca335203fmr18326216ejh.460.1668616793750;
        Wed, 16 Nov 2022 08:39:53 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007a62215eb4esm7205202ejk.16.2022.11.16.08.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 08:39:53 -0800 (PST)
Message-ID: <730467dc-419f-bcb6-c4d8-24951b4dde62@linaro.org>
Date:   Wed, 16 Nov 2022 17:39:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v6 5/7] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: Add navigation mezzanine dts
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
 <20221116162801.546737-6-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116162801.546737-6-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 16/11/2022 17:27, Bryan O'Donoghue wrote:
> Move the dts data for the rb3 navigation mezzanine into its own dts file.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>   .../sdm845-db845c-navigation-mezzanine.dts    | 104 ++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  96 ----------------
>   3 files changed, 105 insertions(+), 96 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index afe496a93f945..4c81c1ee7f7c7 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -132,6 +132,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> new file mode 100644
> index 0000000000000..a21caa6f3fa25
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022, Linaro Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm845-db845c.dts"
> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l26a_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			csiphy0_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&ov8856_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci {
> +	status = "okay";
> +};
> +
> +&cci_i2c0 {
> +	camera@10 {
> +		compatible = "ovti,ov8856";
> +		reg = <0x10>;
> +
> +		/* CAM0_RST_N */
> +		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam0_default>;
> +
> +		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
> +		clock-names = "xvclk";
> +		clock-frequency = <19200000>;
> +
> +		/*
> +		 * The &vreg_s4a_1p8 trace is powered on as a,
> +		 * so it is represented by a fixed regulator.
> +		 *
> +		 * The 2.8V vdda-supply and 1.2V vddd-supply regulators
> +		 * both have to be enabled through the power management
> +		 * gpios.
> +		 */
> +		dovdd-supply = <&vreg_lvs1a_1p8>;
> +		avdd-supply = <&cam0_avdd_2v8>;
> +		dvdd-supply = <&cam0_dvdd_1v2>;
> +
> +		port {
> +			ov8856_ep: endpoint {
> +				link-frequencies = /bits/ 64
> +					<360000000 180000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy0_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci_i2c1 {
> +	camera@60 {
> +		compatible = "ovti,ov7251";
> +
> +		/* I2C address as per ov7251.txt linux documentation */
> +		reg = <0x60>;
> +
> +		/* CAM3_RST_N */
> +		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam3_default>;
> +
> +		clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
> +		clock-names = "xclk";
> +		clock-frequency = <24000000>;
> +
> +		/*
> +		 * The &vreg_s4a_1p8 trace always powered on.
> +		 *
> +		 * The 2.8V vdda-supply regulator is enabled when the
> +		 * vreg_s4a_1p8 trace is pulled high.
> +		 * It too is represented by a fixed regulator.
> +		 *
> +		 * No 1.2V vddd-supply regulator is used.
> +		 */
> +		vdddo-supply = <&vreg_lvs1a_1p8>;
> +		vdda-supply = <&cam3_avdd_2v8>;
> +
> +		status = "disabled";
I know you're just moving things around, but.. any reason this thing is 
still disabled?

Konrad
> +
> +		port {
> +			ov7251_ep: endpoint {
> +				data-lanes = <0 1>;
> +/*				remote-endpoint = <&csiphy3_ep>; */
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index be946f71666bc..f41c6d600ea8c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1174,102 +1174,6 @@ &pm8998_gpio {
>   
>   };
>   
> -&cci {
> -	status = "okay";
> -};
> -
> -&camss {
> -	vdda-phy-supply = <&vreg_l1a_0p875>;
> -	vdda-pll-supply = <&vreg_l26a_1p2>;
> -
> -	status = "okay";
> -
> -	ports {
> -		port@0 {
> -			csiphy0_ep: endpoint {
> -				data-lanes = <0 1 2 3>;
> -				remote-endpoint = <&ov8856_ep>;
> -			};
> -		};
> -	};
> -};
> -
> -&cci_i2c0 {
> -	camera@10 {
> -		compatible = "ovti,ov8856";
> -		reg = <0x10>;
> -
> -		/* CAM0_RST_N */
> -		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&cam0_default>;
> -
> -		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
> -		clock-names = "xvclk";
> -		clock-frequency = <19200000>;
> -
> -		/*
> -		 * The &vreg_s4a_1p8 trace is powered on as a,
> -		 * so it is represented by a fixed regulator.
> -		 *
> -		 * The 2.8V vdda-supply and 1.2V vddd-supply regulators
> -		 * both have to be enabled through the power management
> -		 * gpios.
> -		 */
> -		dovdd-supply = <&vreg_lvs1a_1p8>;
> -		avdd-supply = <&cam0_avdd_2v8>;
> -		dvdd-supply = <&cam0_dvdd_1v2>;
> -
> -		port {
> -			ov8856_ep: endpoint {
> -				link-frequencies = /bits/ 64
> -					<360000000 180000000>;
> -				data-lanes = <1 2 3 4>;
> -				remote-endpoint = <&csiphy0_ep>;
> -			};
> -		};
> -	};
> -};
> -
> -&cci_i2c1 {
> -	camera@60 {
> -		compatible = "ovti,ov7251";
> -
> -		/* I2C address as per ov7251.txt linux documentation */
> -		reg = <0x60>;
> -
> -		/* CAM3_RST_N */
> -		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&cam3_default>;
> -
> -		clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
> -		clock-names = "xclk";
> -		clock-frequency = <24000000>;
> -
> -		/*
> -		 * The &vreg_s4a_1p8 trace always powered on.
> -		 *
> -		 * The 2.8V vdda-supply regulator is enabled when the
> -		 * vreg_s4a_1p8 trace is pulled high.
> -		 * It too is represented by a fixed regulator.
> -		 *
> -		 * No 1.2V vddd-supply regulator is used.
> -		 */
> -		vdddo-supply = <&vreg_lvs1a_1p8>;
> -		vdda-supply = <&cam3_avdd_2v8>;
> -
> -		status = "disabled";
> -
> -		port {
> -			ov7251_ep: endpoint {
> -				data-lanes = <0 1>;
> -/*				remote-endpoint = <&csiphy3_ep>; */
> -			};
> -		};
> -	};
> -};
> -
>   /* PINCTRL - additions to nodes defined in sdm845.dtsi */
>   &qup_spi0_default {
>   	config {
