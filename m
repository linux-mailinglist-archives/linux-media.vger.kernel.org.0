Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1927B62698E
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 14:14:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbiKLNOE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 08:14:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234053AbiKLNOC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 08:14:02 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91BEE03A
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 05:13:59 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id l12so12196697lfp.6
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 05:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utLYmG/OJC1d3zZ2EVsPS+7wf05on7tQNsg2IWJpL0A=;
        b=A/2DSFgNwo/1jB297Dac08SD88E+7OcrP/M5w/1aq3hGVNKqKH8xGfDrNGbZnLdgPq
         LIlPfzYP9K5spjoCt6EmfVisi5y0543o/rgtumFf0Tgiuqtr3hl2mMtJDoQw10fDcGf2
         AGQRfVJKrREfJQ2Pw3VM1PE3kqgbQuLcOpdQyIwpIWiSshDnoPBx+LRsAd4T+lrjpvMu
         ZSMK2rWJIThlJRUVSoFwiLW20JYWpT6NPmp0MGbSVwP2mQtd92unVcVy5vv9k6R6cf9L
         3elO7kv9w9GIJmMd8lJ3hdIajVlg5sFJgRX3evIm92NJj3yqnIU2ccD/NSOGmKQFXMLk
         iZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=utLYmG/OJC1d3zZ2EVsPS+7wf05on7tQNsg2IWJpL0A=;
        b=7xIJG+Basu3SmCeIHLG3UPL6lqlqdguFqj4t/tR69zqm1ZB8ar8LQl+MnI7LZukSu3
         0A5dawAxmEPlJVMLCB3f3lIYIvMMIh8CaxONeUkJHB//HLnbSMEhkcwMYBUCd+zCS0DX
         f4hLlyaGQ+HZasQNhYbFUBsxZYX0IjMaUzWSpSBJs9vmL8hQ2SbJdwMTY21PR+UIOgS7
         +smAQR8Hq2JJ7zZC+3VVVVxJF4jM0VWd7y4iIiur+1koUL098DZAryJczkS3bOvJBnLu
         Jgq/PYaL8FI5GRlCOt/rnNYEJw+MB6zi5DrN0YgS6p+1GdyKwQOoMUW851M3WszXPnzz
         Ngyw==
X-Gm-Message-State: ANoB5pm501NT1TiOPwMHVSn97jFis0YzpmtgJ0GRj1BwVGfqnAzZMyV4
        mHKzRAfnVcXPljRDbjVjjKPo2Q==
X-Google-Smtp-Source: AA0mqf6rRWEQZeaWc9+Ar7AxmZpFl1+wVNHlVQgjDtu/7L0qPdjyrkJOs0oHogZhosTYL+f8oiDVBQ==
X-Received: by 2002:ac2:47e8:0:b0:4a2:60f7:d5de with SMTP id b8-20020ac247e8000000b004a260f7d5demr1987829lfp.169.1668258838195;
        Sat, 12 Nov 2022 05:13:58 -0800 (PST)
Received: from [192.168.1.110] (95.49.29.126.neoplus.adsl.tpnet.pl. [95.49.29.126])
        by smtp.gmail.com with ESMTPSA id u16-20020a2e1410000000b0026fa9e19197sm926498ljd.36.2022.11.12.05.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Nov 2022 05:13:57 -0800 (PST)
Message-ID: <a1196a4c-3d08-040d-6add-d09c054842c6@linaro.org>
Date:   Sat, 12 Nov 2022 14:13:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
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
References: <20221112124126.86815-1-bryan.odonoghue@linaro.org>
 <20221112124126.86815-3-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221112124126.86815-3-bryan.odonoghue@linaro.org>
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

Hi!


On 12/11/2022 13:41, Bryan O'Donoghue wrote:
> The Vision Mezzanine for the RB5 ships with an imx517 and ov9282 populated.
> Other sensors and components may be added or stacked with additional
> mezzanines.
> 
> Enable both the IMX577
Sounds like a copypaste error?

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
> index d534888bcfe52..cd88efa19e750 100644
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
Maybe setting
model = "Qualcomm Technologies, Inc. Robotics RB5 with Vision Mezzanine"
could be beneficial, so that when somebody shares a log, you can easily 
differentiate between the two configurations. Not sure if that wouldn't 
get too long too fast with different mezzanines..


> +&camss {
> +	status = "okay";
Status should be last.


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
camcc goes before camss alphabetically.


Konrad

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
