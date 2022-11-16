Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95E5662C533
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 17:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234298AbiKPQpm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 11:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233978AbiKPQpT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 11:45:19 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B965D61BAB
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:40:58 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id f27so45533976eje.1
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncBrZt8dHCHtYgNNs1VPvS1j5TNqZBWHCdsWeb3FsmQ=;
        b=DdqdS2HdkedzMBlKZdpSPSFz6C+bBcZ0q/vQy29Bznxk/dHoiRmhNOOTohXDPVNnBd
         G1NUBvXNQxtcJNm/MT9z5GWLzZidkbnDlu5AohwPteIoWdfQm3scsfRoG/vEbG/mCi/f
         iwkt+mYo/9hqwH4EqYCbhH6HPNJTkk/LP2UDljirWbyYHO+q0YNLQF7Lb2tTDqI26li9
         IgpMtnvZjrJiwqTznCIGE0iMbs9fSXD4DtjSsN7keZ+JdhHI3jj1Kv407HIsl5WJVjTN
         cVALRRewnA+D2oU5BSX6N7hFMUVQXJGFEZrYHkVJxa1XoExQtw/N3ts7Zqr1AW/ipVjN
         O2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ncBrZt8dHCHtYgNNs1VPvS1j5TNqZBWHCdsWeb3FsmQ=;
        b=zrnyFXg8szStkjHTaR2cTGnxMdxMEMOEL3GGV/8GoDUN2cJP2ZX5EsNTpMjRVfyVnn
         PghlSw7st8K980aD9W2hPGMDrcLMEKca/eUECvActgMk+iMXaj/EmVf47XmeIhKfSv96
         bBh8KiB63hm//atxdegNrAYgLZDNeFDEJCiA9pdtlhA2Vjx8Ks5fLkLtVg/HjAKYmD2i
         8ck3PAwG1KsxeMnWpGBJyu4injCTsU9w7DFWJhNvWDTEuN+dG/eY+/Yy1XEXxTlt0Kch
         f5ls51XJLGD6lz23E5Ua/54/N1Kc2K2t8MnD5QZbFJzCBhJzZkpv0c3gnN43h6PsOm8x
         cDNg==
X-Gm-Message-State: ANoB5pkrr95XSSlPyjtSZ41aal6/EKxjZJj7bPz6q+XX9nL3NQQcGRdD
        FNWdttyQueYoQhUuBBu1/0kEYA==
X-Google-Smtp-Source: AA0mqf5Mhr1nT7yuGXg8SeB3g2r6xlvEwsmX+zfUhiT9cXuasWNyATjDuTePNnD+gn0lC+8yhNCY8g==
X-Received: by 2002:a17:906:d8d:b0:7af:883:ec72 with SMTP id m13-20020a1709060d8d00b007af0883ec72mr10301690eji.727.1668616857198;
        Wed, 16 Nov 2022 08:40:57 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id qq18-20020a17090720d200b0077205dd15basm7017995ejb.66.2022.11.16.08.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 08:40:56 -0800 (PST)
Message-ID: <3aed0e79-1efb-d6ad-101e-84a5202776b2@linaro.org>
Date:   Wed, 16 Nov 2022 17:40:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
 Add vision mezzanine
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
 <20221116162801.546737-8-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116162801.546737-8-bryan.odonoghue@linaro.org>
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



On 16/11/2022 17:28, Bryan O'Donoghue wrote:
> The Vision Mezzanine for the RB5 ships with an imx577 and ov9282 populated.
> Other sensors and components may be added or stacked with additional
> mezzanines.
> 
> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -d /dev/media0 -V '"imx577 '22-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |  1 +
>   .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts | 62 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8250.dtsi          | 33 ++++++++++
>   3 files changed, 96 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4c81c1ee7f7c7..f5a76ec8a85e0 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -54,6 +54,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
> new file mode 100644
> index 0000000000000..ac3ccab2da35e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2022, Linaro Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "qrb5165-rb5.dts"
> +
> +&camcc {
> +	status = "okay";
> +};
> +
> +&camss {
> +	status = "okay";
> +	vdda-phy-supply = <&vreg_l5a_0p88>;
> +	vdda-pll-supply = <&vreg_l9a_1p2>;
Status goes last.

With this:
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +
> +	ports {
> +		/* The port index denotes CSIPHY id i.e. csiphy2 */
> +		port@2 {
> +			csiphy2_ep: endpoint {
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
> +&cci1_i2c0 {
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default", "suspend";
> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-1 = <&cam2_suspend>;
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		dovdd-supply  = <&vreg_l7f_1p8>;
> +		avdd-supply = <&vdc_5v>;
> +		dvdd-supply = <&vdc_5v>;
> +
> +		port {
> +			imx577_ep: endpoint {
> +				clock-lanes = <1>;
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy2_ep>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 806aa19ad93ce..d37694342b53f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3822,6 +3822,39 @@ tlmm: pinctrl@f100000 {
>   			gpio-ranges = <&tlmm 0 0 181>;
>   			wakeup-parent = <&pdc>;
>   
> +			cam2_default: cam2-default-state {
> +				rst-pins {
> +					pins = "gpio78";
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				mclk-pins {
> +					pins = "gpio96";
> +					function = "cam_mclk";
> +					drive-strength = <16>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam2_suspend: cam2-suspend-state {
> +				rst-pins {
> +					pins = "gpio78";
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +					output-low;
> +				};
> +
> +				mclk-pins {
> +					pins = "gpio96";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
>   			cci0_default: cci0-default-state {
>   				cci0_i2c0_default: cci0-i2c0-default-pins {
>   					/* SDA, SCL */
