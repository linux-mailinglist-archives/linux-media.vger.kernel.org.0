Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E15C66207D0
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 04:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233230AbiKHDvh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 22:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbiKHDva (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 22:51:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290EA30F70;
        Mon,  7 Nov 2022 19:51:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 990446143F;
        Tue,  8 Nov 2022 03:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D227AC433C1;
        Tue,  8 Nov 2022 03:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667879483;
        bh=Vx6TvoROTWTkE/OerDVvKJ4brq59iV6fvXPIQbzNIks=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hiVroebYIGqvlgwgzHW+cxRzA+gv1+Q9LOlLRkQiJZjhRNSHNJYmev+l2lP8uPTAX
         4w6WjbF7wHz2avkeqltYmBRtUucllYqYzOYLvvqxKvtEakdLN8TSkjm2Y8iF+hyeO2
         CbIDC49kd1JQ0XpTfAUCiYCEbM42YMV5I2uScTrwv2Jeiu86nV2iB2OpGdNy3E9i1s
         e2omToxqZW0Ti5ZedTjpz+Z9jeGw1xMqbYcUQA5Mra3FkyHjQknL9xqiJYzz8Ng2uC
         1t6uoX4Cg0HIS49kcWPj0340Mr4TS66atHRIuGaEY61rG9NtsVd3xRezoC8p+V4Pod
         PMU1mQJ6kzBtw==
Date:   Mon, 7 Nov 2022 21:51:19 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        konrad.dybcio@somainline.org, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: Add navigation mezzanine dts
Message-ID: <20221108035119.knwekj6yexfw63rv@builder.lan>
References: <20221108021816.213084-1-bryan.odonoghue@linaro.org>
 <20221108021816.213084-4-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108021816.213084-4-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 08, 2022 at 02:18:16AM +0000, Bryan O'Donoghue wrote:
> Move the dts data for the rb3 navigation mezzanine into its own dts file.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

I picked up a change from Konrad fixing up comments today, please pick
up the changes as you're respinning this for the fixes in patch 2.

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../sdm845-db845c-navigation-mezzanine.dts    | 107 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  99 ----------------
>  3 files changed, 108 insertions(+), 99 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 78f6e78d8ed4..0b714e9d5de3 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -129,6 +129,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> new file mode 100644
> index 000000000000..5308f40257c2
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
> +	vdda-phy-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l26a_1p2>;
> +
> +	status = "ok";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
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
> +		// CAM0_RST_N
> +		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam0_default>;
> +
> +		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
> +		clock-names = "xvclk";
> +		clock-frequency = <19200000>;
> +
> +		/* The &vreg_s4a_1p8 trace is powered on as a,
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
> +		// I2C address as per ov7251.txt linux documentation
> +		reg = <0x60>;
> +
> +		// CAM3_RST_N
> +		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam3_default>;
> +
> +		clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
> +		clock-names = "xclk";
> +		clock-frequency = <24000000>;
> +
> +		/* The &vreg_s4a_1p8 trace always powered on.
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
> +
> +		port {
> +			ov7251_ep: endpoint {
> +				data-lanes = <0 1>;
> +//				remote-endpoint = <&csiphy3_ep>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 8ba3188ac4c3..b22ee5df2eb9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1164,105 +1164,6 @@ &pm8998_gpio {
>  
>  };
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
> -		// CAM0_RST_N
> -		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&cam0_default>;
> -
> -		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
> -		clock-names = "xvclk";
> -		clock-frequency = <19200000>;
> -
> -		/* The &vreg_s4a_1p8 trace is powered on as a,
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
> -		// I2C address as per ov7251.txt linux documentation
> -		reg = <0x60>;
> -
> -		// CAM3_RST_N
> -		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&cam3_default>;
> -
> -		clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
> -		clock-names = "xclk";
> -		clock-frequency = <24000000>;
> -
> -		/* The &vreg_s4a_1p8 trace always powered on.
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
> -//				remote-endpoint = <&csiphy3_ep>;
> -			};
> -		};
> -	};
> -};
> -
>  /* PINCTRL - additions to nodes defined in sdm845.dtsi */
>  &qup_spi0_default {
>  	config {
> -- 
> 2.34.1
> 
