Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 948D5626992
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 14:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234146AbiKLNR7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 08:17:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbiKLNR6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 08:17:58 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E792318B26
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 05:17:56 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id g7so12222804lfv.5
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 05:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jcy+djpMg1rXIrBCbzya11fYoqa6yqLDq4A+DRvhQs=;
        b=eALRF7XWHNnCEX0Crh/6w+F6wJWF9HhKD31WBQLwkiukfJjbrHKgGd6NllaG3p9B/v
         lf37R0R+J6Kz5Qo8HOkLN0n4m+1wYxqhcrbPv07WDlYLfXjSFOwptwqoHZBex9Pt4Ig5
         /xrHk5K2fgLWmNhKHs/r+7mwc/svUorr15jAWz+QugX5jO1Tp5mNaWc2RDKdUB+NVpsP
         6wZIOGP6SlXBY5JWD/SILsCN8ULaJdRl4VAxwKB7e6mw5WXNd3mCT6wptAOB1lx6G+tS
         odDLOBUFhsiYy5qgkKddZa6bXG2wrSW0Z5hIL4xHkIrDAaCyEvczkrI1HATFxPx7h4lr
         qQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3jcy+djpMg1rXIrBCbzya11fYoqa6yqLDq4A+DRvhQs=;
        b=kVEiAZDFxYRnDC7vJJI9c87JlhlOt7iuNyNSzvViwpVgBNOpLf5tR0faXyKo724trI
         4d402e8Dsz9WrGBC6ZrNOmDZLPUZY/a6o7+6FYb5EZUe0onOGUrzvN3jbA/+cG5j3Hyd
         562a180VGsFXfbMIZIdI537Kf805xJNLyz74gAewByvTHwyFJdqD0ukx4MvyqpX4x1M0
         hwDQsr4EuBMcJ2XR41E5pzbJCjRfGqU+sbk4s2MvRbBx1yOCZBc2z3xdn5oxb53wm4A/
         b28kYN11jIDicOWZCEv79A6MQpnHAFu80bACvgjWopf0nxHwWcQKAG34M5VksHuhcVnI
         weCA==
X-Gm-Message-State: ANoB5pkyUiJs8wtQxjuH4goqAe1C5Ehhk87x3E6dd1n/TmyCGnzFVbPr
        2bO0YAm3I/UOJRN4+Veub0/n/g==
X-Google-Smtp-Source: AA0mqf4klf3oyqp6wBjRnN1gvp4EIhdj+MpCn7t6RmG+O2rqIcxSL3CqwngekVgbH/buKVoWU+Y8Sw==
X-Received: by 2002:a19:6d02:0:b0:4ab:5d1f:9325 with SMTP id i2-20020a196d02000000b004ab5d1f9325mr2090896lfc.438.1668259075270;
        Sat, 12 Nov 2022 05:17:55 -0800 (PST)
Received: from [192.168.1.110] (95.49.29.126.neoplus.adsl.tpnet.pl. [95.49.29.126])
        by smtp.gmail.com with ESMTPSA id a17-20020a056512201100b0049d83646ce7sm868309lfb.110.2022.11.12.05.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Nov 2022 05:17:54 -0800 (PST)
Message-ID: <5729af47-8e18-535d-8e3a-299e82f54a06@linaro.org>
Date:   Sat, 12 Nov 2022 14:17:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom:
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
References: <20221112124126.86815-1-bryan.odonoghue@linaro.org>
 <20221112124126.86815-4-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221112124126.86815-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12/11/2022 13:41, Bryan O'Donoghue wrote:
> Move the dts data for the rb3 navigation mezzanine into its own dts file.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>   .../sdm845-db845c-navigation-mezzanine.dts    | 109 ++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 101 ----------------
>   3 files changed, 110 insertions(+), 101 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index cd88efa19e750..5eadd251a0a16 100644
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
> index 0000000000000..0862ca30c8963
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022, Linaro Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm845-db845c.dts"
> +
> +&cci {
> +	status = "okay";
> +};
> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l26a_1p2>;
> +
> +	status = "ok";
"okay" is preferred.

> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
Looks like the -cells properties are defined in 845 dtsi already.


> +		port@0 {
> +			reg = <0>;
> +			csiphy0_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&ov8856_ep>;
> +			};
> +		};
> +	};
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
> +		status = "ok";
"okay" is prefered.

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
> +		status = "disable";
Missing d

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
> index 3e7ceb0861eb0..f41c6d600ea8c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1174,107 +1174,6 @@ &pm8998_gpio {
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
> -	status = "ok";
> -
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		port@0 {
> -			reg = <0>;
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
> -		status = "ok";
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
> -		status = "disable";
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
