Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28860626C04
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 22:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235140AbiKLVpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 16:45:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234928AbiKLVpa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 16:45:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F3C1759A;
        Sat, 12 Nov 2022 13:45:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (d5152d7bc.static.telenet.be [81.82.215.188])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC91B8B;
        Sat, 12 Nov 2022 22:45:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668289527;
        bh=K3jdFLJzuo/FXsKxrNQ1SOaO0wY/ZDqkxhB4AUsTWiw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UqUD3ac3yUrndoVEvWBTGsgi6UY2TIo8Om073uoAusBrqj4r1hAVHbRgMltcgQRm2
         T99L4lXtOS2UnoBQJYs7/ns9mDqdwimjra3X8hwziPNu9HLQ+HEkenoCt9m72uhcM6
         MawwOzikgXEGJ5F0HwPQG9ve5m8xqGxSSl4+nMPE=
Date:   Sat, 12 Nov 2022 23:45:08 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org, sakari.ailus@iki.fi,
        hverkuil@xs4all.nl, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
 Add vision mezzanine
Message-ID: <Y3AT5BpHxuZdnidp@pendragon.ideasonboard.com>
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
 <20221112172650.127280-7-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221112172650.127280-7-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

Thank you for the patch.

On Sat, Nov 12, 2022 at 05:26:50PM +0000, Bryan O'Donoghue wrote:
> The Vision Mezzanine for the RB5 ships with an imx517 and ov9282 populated.

Did you mean imx577 ?

> Other sensors and components may be added or stacked with additional
> mezzanines.
> 
> Enable the IMX577 on the vision mezzanine.

Is there a particular reason the ov9282 isn't described ?

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
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts | 63 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi          | 33 ++++++++++
>  3 files changed, 97 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 70ce09bc63a33..5eadd251a0a16 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -54,6 +54,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
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

Could this be an overlay ?

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
>  			gpio-ranges = <&tlmm 0 0 181>;
>  			wakeup-parent = <&pdc>;
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

This seems board-specific, shouldn't it go to the mezzanine .dts ?

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
>  			cci0_default: cci0-default-state {
>  				cci0_i2c0_default: cci0-i2c0-default-pins {
>  					/* SDA, SCL */

-- 
Regards,

Laurent Pinchart
