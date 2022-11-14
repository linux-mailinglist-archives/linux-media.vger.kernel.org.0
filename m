Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4542062796B
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 10:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235895AbiKNJtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 04:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236243AbiKNJst (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 04:48:49 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656CF5FD7
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 01:48:39 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id p8so18325656lfu.11
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 01:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KhoaRoDixQzBDZIa7mDZUSgASBOYSQ9jvgnxALRZ7xE=;
        b=ZaBuAgHpDL8mDYAmiJ2+sx49DyTrjQ0usb5LhsbsReK9ti/x1YggnHwifDjP9P3BUr
         iTLYO+Oh1Ax8Uj9LqSYbtQSGdDNN4dAebvrQhHEBoLtbbuZQiHfCFjnltEJwbaC6nbRC
         brKXeGklpg13xDUz0KNWfP8fj1YILIMkZzFLsKpWO8O1KLo5IBNGo0a5c3afZb9fGvrK
         /wgi5unIEiy84bhKLqR12XNtDVwh9llfxF+CutAFhS2JZGq5ALXCYQdKzJXfedr76cdp
         MDMbPuq0nsPj2VN8GvQr5CtJ1N2LPK2fUSsL4+IVs6xvFoJguayv8z2XrsYPhcuVenFK
         uX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KhoaRoDixQzBDZIa7mDZUSgASBOYSQ9jvgnxALRZ7xE=;
        b=wBAxOkylqtjZiIIcxagr23Wxunf7vOySPMqX59+ojuHe05+eRPvLDzFEAlc0YxiWfv
         st+5x53XXehQ6jkOAzI8qB7VElVvFPO9iGQjKqYWcd8NOdOIL6/h4mVKlskrqPy09/Kz
         PSLY5JFpTVgeg3g643ZY4OtxfsVMYWcFDf2gw7fKZLPKKLZi9SHG3w66Ufe57B3nHpSU
         eYFjk/6+8l6HJiRFEVp0hZhHq1oXvF8oJfgYcGsrb4XK18cu2yA8G3uaZgvCR4iLNI8X
         zDuwCcQmv5wIYdkpCkqEP+vaXbPbeffTgrE/Qhe0WOx9Aqsjdw4oNHMNoPLZdVFVvXZe
         LZkw==
X-Gm-Message-State: ANoB5pn1Z0AZ9NKqT+8l68zQPYguf3E1S7wDEgTx0reU54j04mtKv3ib
        aOoOsVcJMPfhn3RnWoEjDX0Vbw==
X-Google-Smtp-Source: AA0mqf4ELNlADjmrdCkSo129sw2bkZhCfKDYi5JJcckn17ZcymjMCAXeBWfrDmnqnIvSduCM4X5MVg==
X-Received: by 2002:ac2:4f12:0:b0:48a:e80f:4b3a with SMTP id k18-20020ac24f12000000b0048ae80f4b3amr4063394lfr.575.1668419317713;
        Mon, 14 Nov 2022 01:48:37 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id o17-20020ac25e31000000b00498f23c249dsm1753357lfg.74.2022.11.14.01.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 01:48:37 -0800 (PST)
Message-ID: <a05fee50-9df2-d5f7-c071-81ded4bcc873@linaro.org>
Date:   Mon, 14 Nov 2022 10:48:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom:
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
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
 <20221112172650.127280-5-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221112172650.127280-5-bryan.odonoghue@linaro.org>
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



On 12/11/2022 18:26, Bryan O'Donoghue wrote:
> Move the dts data for the rb3 navigation mezzanine into its own dts file.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>   .../sdm845-db845c-navigation-mezzanine.dts    | 107 ++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  99 ----------------
>   3 files changed, 108 insertions(+), 99 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index d534888bcfe52..70ce09bc63a33 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -131,6 +131,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> new file mode 100644
> index 0000000000000..7bd0a15c72657
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> @@ -0,0 +1,107 @@
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
camss goes before cci alphabetically.

Konrad
> +	vdda-phy-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l26a_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
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
> +		status = "okay";
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
> index 5da91c646c200..f41c6d600ea8c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1174,105 +1174,6 @@ &pm8998_gpio {
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
> -		status = "okay";
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
