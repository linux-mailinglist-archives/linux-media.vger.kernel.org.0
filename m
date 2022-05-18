Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69A5852C31A
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 21:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241766AbiERTJ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 15:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241758AbiERTJ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 15:09:27 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC53A880FC
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 12:09:24 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id o22so3640531ljp.8
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 12:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=O3+TeHGlj78jW1XEh5KfQ6XWZQiUtFAgDTrtf5N/VEs=;
        b=WQ0kW/nLEazXZzlIDWwWlBNO9Jq2o3fMine2DnwAcO7OE6qspEcJ4JiBzIzjNMGMS3
         QBFV63dLFkVauC/gwYFGgxHNHaGVP5TQXaGiakU2/HdGfv7V3OXfVoCU739mlIiW0U70
         3s8Gxd3vJpIeVcbhTzNacmQBk/2aOPzOqYD4HnOgrNUz4wUh/mhotzSm2usttv95oWi1
         k0CyM1NAoECSbtnnWZHaDZotXe28p0IicEtf/fi6p2Wk/SKkxY5Cq2iair7/1M2JVkGG
         m8tKsKnn1gf1nQu0rzQIhcRawx/+8FEaCOIvdXU8YoruRhc8XrimkYQvLefBuBeqhXnu
         aalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=O3+TeHGlj78jW1XEh5KfQ6XWZQiUtFAgDTrtf5N/VEs=;
        b=Ur4THqNcHA/++dP2l1lq5Lc5QGh4Q2QhWMdk/JbFPV31jdfNCjAp+P6EIIAGOlMa62
         MqIO92skApdOopl8WZHK+3/6PoYwkmsnS8AcH0ICaxDuVrpLPz7X6wXrVdLL/N5fJAHg
         sWy9yUYpsk+kU1zx3umHzID0r2XEqPYx+1I+aXZCXABTOOp3UGGlFuV1oVXzhjvkiaDG
         A8daTr24Flnn4ghsFt4yJJgG+XuPn1ubiMS9l/LWkg4KnSv2oHHky/f6Fd7R4LCJYcG3
         +cLh4o01CROkdvHqOIXByzYsSDo7+AapPDPY6MlCjMnd+/wRqcDPO0MVzCkm4/vgCQbn
         TO7g==
X-Gm-Message-State: AOAM533GzWbJR/y6+Yy3nywbCLh2ddSuaiNAyqVuBHg4ERObJy5jpdid
        JRk1tHdKi5i7+9foo2N9nzNLLQ==
X-Google-Smtp-Source: ABdhPJxGsMPUlH6sy7idvon1aGjw7EO7PsAEp2KCBwesRxaQ8VvR5QjE31Lgazu67XBiso6tA2q3Ow==
X-Received: by 2002:a05:651c:513:b0:250:5d51:46d3 with SMTP id o19-20020a05651c051300b002505d5146d3mr476161ljp.429.1652900963045;
        Wed, 18 May 2022 12:09:23 -0700 (PDT)
Received: from [192.168.1.102] (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id u13-20020ac248ad000000b0047255d21100sm32359lfg.47.2022.05.18.12.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 12:09:22 -0700 (PDT)
Message-ID: <33abcc93-13f1-d6f5-36a3-6ab796f124f9@linaro.org>
Date:   Wed, 18 May 2022 22:09:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/1] arm64: dts: qcom: qrb5165-rb5: Enable the IMX577 on
 cam1
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com
References: <20220518133004.342775-1-bryan.odonoghue@linaro.org>
 <20220518133004.342775-2-bryan.odonoghue@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220518133004.342775-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

On 5/18/22 16:30, Bryan O'Donoghue wrote:
> The IMX577 is on CCI1/CSI2 providing four lanes of camera data.
> 
> An example media-ctl pipeline is:
> 
> media-ctl --reset
> media-ctl -v -d /dev/media0 -V '"imx412 '20-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
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
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 98 ++++++++++++++++++++++++
>   1 file changed, 98 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 0e63f707b911..48b31790c434 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1203,6 +1203,43 @@ sdc2_card_det_n: sd-card-det-n {
>   		function = "gpio";
>   		bias-pull-up;
>   	};
> +
> +	cam2_default: cam2-default {
> +		rst {
> +			pins = "gpio78";
> +			function = "gpio";
> +
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		mclk {
> +			pins = "gpio96";
> +			function = "cam_mclk";
> +
> +			drive-strength = <16>;
> +			bias-disable;
> +		};
> +	};
> +
> +	cam2_suspend: cam2-suspend {
> +		rst {
> +			pins = "gpio78";
> +			function = "gpio";
> +
> +			drive-strength = <2>;
> +			bias-pull-down;
> +			output-low;
> +		};
> +
> +		mclk {
> +			pins = "gpio96";
> +			function = "cam_mclk";
> +
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};

I still stick to my opinion that the description of rst/mclk pins should
be uniformly added to the SoC specific .dtsi file. The pins and functions
in these device tree nodes are not changeable, a board file should just
select proper pairs.

Do you have any objections to it?

>   };
>   
>   &uart12 {
> @@ -1294,3 +1331,64 @@ &qup_spi0_data_clk {
>   	drive-strength = <6>;
>   	bias-disable;
>   };
> +
> +&camcc {
> +	status = "okay";
> +};
> +
> +&camss {
> +	status = "okay";
> +	vdda-phy-supply = <&vreg_l5a_0p88>;
> +	vdda-pll-supply = <&vreg_l9a_1p2>;
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* The port index denotes CSIPHY id i.e. csiphy2 */
> +		port@2 {
> +			reg = <2>;
> +			csiphy2_ep: endpoint {
> +				clock-lanes = <7>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx412_ep>;
> +			};
> +
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
> +		compatible = "sony,imx412";
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
> +		power-domains = <&camcc TITAN_TOP_GDSC>;

Above 'power-domains' property is not needed, it shall be implied by CCI.

> +		dovdd-supply  = <&vreg_l7f_1p8>;
> +		avdd-supply = <&vdc_5v>;
> +		dvdd-supply = <&vdc_5v>;
> +
> +		status = "okay";

Here 'status' property is not needed.

> +		port {
> +			imx412_ep: endpoint {
> +				clock-lanes = <1>;
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy2_ep>;
> +			};
> +		};
> +	};
> +};

I run on you branch on top of linux-next, but switch build options from modules to built-in

    CONFIG_I2C_QCOM_CCI=y
    CONFIG_VIDEO_QCOM_CAMSS=y

I didn't get the sensor initialized and hence there is no /dev/media0 node:

[    0.620205] i2c-qcom-cci ac50000.cci: Found 19200000 cci clk rate while 37500000 was expected
[    0.620551] i2c 20-001a: Fixing up cyclic dependency with ac6a000.camss
[    0.620754] imx412 20-001a: Looking up dovdd-supply from device tree
[    0.620797] imx412 20-001a: Looking up avdd-supply from device tree
[    0.620860] imx412 20-001a: Looking up dvdd-supply from device tree
[    0.620876] duplicated lane 1 in clock-lanes, using defaults
[    0.622789] imx412 20-001a: failed to find sensor: -5
[    0.622880] imx412: probe of 20-001a failed with error -5

I believe the problem could be related to CCI, please remind me, are there I2C bus pull-ups?

--
Best wishes,
Vladimir
