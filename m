Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06BA9627979
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 10:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235919AbiKNJuN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 04:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236392AbiKNJtu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 04:49:50 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 316A81EC49
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 01:49:48 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id d20so12380719ljc.12
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 01:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEpSeStuRn6i3Xa8okbXnlW3DvC16HOL1lzWLEAD62s=;
        b=fpleBB82HKuLtMiWywncqgMrGbUiwlSnDtPH/ram/gZBFEdLsz2oXFHYwIM3ydHpha
         lM1WqOqTZYrPY2I0GiZMI8GLLaxDxTt9rYNLrrFJI/hVYGldUQNvFevi8RzRgwiovGdM
         QgfQoKUHcyIOjW5ju+XlX6wDujXgwPr5ODGD3Akj0DZqH133BG/SndVNTnZkIEf0jrc+
         r5uxL2k1tTMy9m3yz3xmD2bIb3RF6AH7cj3o9kwZxsDeJaXlUBipe+qY3ReT2hfCdOEB
         LmrP9VKMQEQP4DopP8g2CpYVfYN5VxfxN/jiRzNcY04nTlgq0flxjZZGUUIo6tTHg7qu
         n9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fEpSeStuRn6i3Xa8okbXnlW3DvC16HOL1lzWLEAD62s=;
        b=PuWKTylWwLpdiGS8Jf9YpZQOq+lPZzFqHxbTaGAYnXtZYrlfWGG3PQJ+DkuWbqoWMK
         Bg8hGYkR5OQNQVYyRaNu0fQG1exyBxf6p9zHzsYtovBm3YTkyaYKZGm8iRxnjuXZpdpU
         p2YStSNOyCrNNe/0R3MQrSDsB9/3iK2D7scPjv8dk0YZFVz1i/wZ2BiHWd/LlVDYcwKg
         5Db5Tdrs4LVZsvZoPxCPn3MC8dhy2E7QkXrNx6OLDMdO6GgP0qzKIbecMrf0yVrpgXEX
         Xy7R016mIdo1mYSFjTGpvQekQvZCgZL0V8lkcIi11JG6uubP1G+blsCu8we1lxtM0C5J
         3F7Q==
X-Gm-Message-State: ANoB5pmxHChqR3PXpF0m45cuAYpJudcRSwh02IKQExnzJ82AvAhnz32Y
        Tqp0PztwUAwJeFSfSPR2TCYS5g==
X-Google-Smtp-Source: AA0mqf4C6S4rD8fPTf2Me8DQtgca63HWFBLgqjISq+p6wSqaDu0Iq1b/kcuXgfG8VfjKLZg6IiymAA==
X-Received: by 2002:a2e:7d0b:0:b0:277:5279:1b8 with SMTP id y11-20020a2e7d0b000000b00277527901b8mr3882494ljc.58.1668419387558;
        Mon, 14 Nov 2022 01:49:47 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id bq38-20020a056512152600b0048b1b2233ddsm1760031lfb.120.2022.11.14.01.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 01:49:47 -0800 (PST)
Message-ID: <0dcca394-1e90-6743-a50d-33b26c1a4836@linaro.org>
Date:   Mon, 14 Nov 2022 10:49:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
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
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
 <20221112172650.127280-7-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221112172650.127280-7-bryan.odonoghue@linaro.org>
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
> The Vision Mezzanine for the RB5 ships with an imx517 and ov9282 populated.
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
>   .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts | 63 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8250.dtsi          | 33 ++++++++++
>   3 files changed, 97 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 70ce09bc63a33..5eadd251a0a16 100644
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
> index 0000000000000..315d524045cf3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2022, Linaro Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "qrb5165-rb5.dts"
> +
> +&camss {
> +	status = "okay";
> +	vdda-phy-supply = <&vreg_l5a_0p88>;
> +	vdda-pll-supply = <&vreg_l9a_1p2>;
> +
> +	ports {
> +		/* The port index denotes CSIPHY id i.e. csiphy2 */
> +		port@2 {
> +			reg = <2>;
> +			csiphy2_ep: endpoint {
> +				clock-lanes = <7>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&camcc {
> +	status = "okay";
> +};
camcc goes before camss alphabetically. Though I see no reason why a 
clock controller would be disabled, even if the clocks sit unused.

Konrad
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
> index f28a8893d00d7..83604b9772766 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3798,6 +3798,39 @@ tlmm: pinctrl@f100000 {
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
