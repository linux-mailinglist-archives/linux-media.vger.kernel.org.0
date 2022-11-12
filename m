Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E18C96269FF
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 15:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234884AbiKLOhv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 09:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234007AbiKLOhu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 09:37:50 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE561C116
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 06:37:48 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id m22so18488486eji.10
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 06:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vE9vHQ1GxZrhNxIqKdhrGPPNxHu5WjObDhAr7v58OGs=;
        b=K8ZqOnGkyoGS8KXqk4X+gJJ1L2foUkItW/ICjLcl2wZCnjOt2Bs2spBCh2EuZaZ855
         U6hZMRgpTgH8iQdSriSIiGNsBB21hqYVsjnlnKheW8MuaytVDPHBZ8z5d/pPJReyk5aL
         WNP5XS6GM9rTkRmeQgrUxMfzrBGoCwl9yu4cw/4GPqXb44TPp9oRzr17KxLuPsTTwIdd
         HDaeK3HBWtFG/0N57bBSK7XaXxNPVp7TqVSf82PAsLYdXZk73nb/V0G2lsQyOo+tHUp3
         vnTcV8nkM7nZCJTv0SmK/kNONnnX7XkTWazcVWPYPR+Y48ThMEvgO1iDppBArQbZhzYa
         5kEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vE9vHQ1GxZrhNxIqKdhrGPPNxHu5WjObDhAr7v58OGs=;
        b=4mUK4MPGraBYz1T9MOfgbhUOr7XJkwU7bL12vmLa8dQ0hL2ZqMZO72EWMkAvBK+bXb
         x4rzCDebwhlcSXNGOzxV5DNR7guUS+3mzb5wbB/bfzcn3uBDI16B19t4kMfd5E10usBp
         8KadHMRvRk6EJ0CPUZYtx8SlzREnAcGQvGnXNimTqFFAXWQSNI2oMgNqSCznp9BCx6RV
         Mvl7F+a3I0XSegwP9H5JrmRRN+jV7bQkUzi/tV1WCw/coQzk+5RjxDCYm59iZlyWd6MW
         WLZz57iiVCzYwTGI46DlCXcvxw2gco9zatuyqLlOOIqwhYWelU73cSONaIEuh0ovCvfJ
         xnfQ==
X-Gm-Message-State: ANoB5plgPQysYIgWkZXHFGAX4nghn+Fgdu12pGemvPktCYr7NBco4CST
        xCz+tvjXVkPecZASgENhZ6NOMOxFMZLDfIL3
X-Google-Smtp-Source: AA0mqf6GQjcU1H6BnA5a+CimHeHjbbDLUyt7tJQwf3fSo8uh5kB+qYf9VGdvXINTUhgh3QSLfgTkBQ==
X-Received: by 2002:a17:906:3ace:b0:7ad:9028:4b17 with SMTP id z14-20020a1709063ace00b007ad90284b17mr5354884ejd.366.1668263867159;
        Sat, 12 Nov 2022 06:37:47 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:3861:6a56:346:9c90? (2001-1c06-2302-5600-3861-6a56-0346-9c90.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:3861:6a56:346:9c90])
        by smtp.gmail.com with ESMTPSA id i15-20020a05640200cf00b00463c5c32c6esm2371982edu.89.2022.11.12.06.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Nov 2022 06:37:46 -0800 (PST)
Message-ID: <836531bb-e2ae-e851-82d1-e2c7f39482a3@linaro.org>
Date:   Sat, 12 Nov 2022 14:37:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: Add navigation mezzanine dts
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, robert.foss@linaro.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221112124126.86815-1-bryan.odonoghue@linaro.org>
 <20221112124126.86815-4-bryan.odonoghue@linaro.org>
 <5729af47-8e18-535d-8e3a-299e82f54a06@linaro.org>
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <5729af47-8e18-535d-8e3a-299e82f54a06@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/11/2022 13:17, Konrad Dybcio wrote:
> 
> 
> On 12/11/2022 13:41, Bryan O'Donoghue wrote:
>> Move the dts data for the rb3 navigation mezzanine into its own dts file.
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>   .../sdm845-db845c-navigation-mezzanine.dts    | 109 ++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 101 ----------------
>>   3 files changed, 110 insertions(+), 101 deletions(-)
>>   create mode 100644 
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile 
>> b/arch/arm64/boot/dts/qcom/Makefile
>> index cd88efa19e750..5eadd251a0a16 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -132,6 +132,7 @@ dtb-$(CONFIG_ARCH_QCOM)    += sdm845-cheza-r1.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sdm845-cheza-r2.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sdm845-cheza-r3.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sdm845-db845c.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)    += sdm845-db845c-navigation-mezzanine.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sdm845-lg-judyln.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sdm845-lg-judyp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sdm845-mtp.dtb
>> diff --git 
>> a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts 
>> b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
>> new file mode 100644
>> index 0000000000000..0862ca30c8963
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
>> @@ -0,0 +1,109 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2022, Linaro Ltd.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "sdm845-db845c.dts"
>> +
>> +&cci {
>> +    status = "okay";
>> +};
>> +
>> +&camss {
>> +    vdda-phy-supply = <&vreg_l1a_0p875>;
>> +    vdda-pll-supply = <&vreg_l26a_1p2>;
>> +
>> +    status = "ok";
> "okay" is preferred.
> 
>> +
>> +    ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
> Looks like the -cells properties are defined in 845 dtsi already.
> 
> 
>> +        port@0 {
>> +            reg = <0>;
>> +            csiphy0_ep: endpoint {
>> +                data-lanes = <0 1 2 3>;
>> +                remote-endpoint = <&ov8856_ep>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&cci_i2c0 {
>> +    camera@10 {
>> +        compatible = "ovti,ov8856";
>> +        reg = <0x10>;
>> +
>> +        /* CAM0_RST_N */
>> +        reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&cam0_default>;
>> +
>> +        clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
>> +        clock-names = "xvclk";
>> +        clock-frequency = <19200000>;
>> +
>> +        /*
>> +         * The &vreg_s4a_1p8 trace is powered on as a,
>> +         * so it is represented by a fixed regulator.
>> +         *
>> +         * The 2.8V vdda-supply and 1.2V vddd-supply regulators
>> +         * both have to be enabled through the power management
>> +         * gpios.
>> +         */
>> +        dovdd-supply = <&vreg_lvs1a_1p8>;
>> +        avdd-supply = <&cam0_avdd_2v8>;
>> +        dvdd-supply = <&cam0_dvdd_1v2>;
>> +
>> +        status = "ok";
> "okay" is prefered.
> 
>> +
>> +        port {
>> +            ov8856_ep: endpoint {
>> +                link-frequencies = /bits/ 64
>> +                    <360000000 180000000>;
>> +                data-lanes = <1 2 3 4>;
>> +                remote-endpoint = <&csiphy0_ep>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&cci_i2c1 {
>> +    camera@60 {
>> +        compatible = "ovti,ov7251";
>> +
>> +        /* I2C address as per ov7251.txt linux documentation */
>> +        reg = <0x60>;
>> +
>> +        /* CAM3_RST_N */
>> +        enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&cam3_default>;
>> +
>> +        clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
>> +        clock-names = "xclk";
>> +        clock-frequency = <24000000>;
>> +
>> +        /*
>> +         * The &vreg_s4a_1p8 trace always powered on.
>> +         *
>> +         * The 2.8V vdda-supply regulator is enabled when the
>> +         * vreg_s4a_1p8 trace is pulled high.
>> +         * It too is represented by a fixed regulator.
>> +         *
>> +         * No 1.2V vddd-supply regulator is used.
>> +         */
>> +        vdddo-supply = <&vreg_lvs1a_1p8>;
>> +        vdda-supply = <&cam3_avdd_2v8>;
>> +
>> +        status = "disable";
> Missing d
> 
> Konrad
>> +
>> +        port {
>> +            ov7251_ep: endpoint {
>> +                data-lanes = <0 1>;
>> +/*                remote-endpoint = <&csiphy3_ep>; */
>> +            };
>> +        };
>> +    };
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts 
>> b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>> index 3e7ceb0861eb0..f41c6d600ea8c 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>> @@ -1174,107 +1174,6 @@ &pm8998_gpio {
>>   };
>> -&cci {
>> -    status = "okay";
>> -};
>> -
>> -&camss {
>> -    vdda-phy-supply = <&vreg_l1a_0p875>;
>> -    vdda-pll-supply = <&vreg_l26a_1p2>;
>> -
>> -    status = "ok";
>> -
>> -    ports {
>> -        #address-cells = <1>;
>> -        #size-cells = <0>;
>> -        port@0 {
>> -            reg = <0>;
>> -            csiphy0_ep: endpoint {
>> -                data-lanes = <0 1 2 3>;
>> -                remote-endpoint = <&ov8856_ep>;
>> -            };
>> -        };
>> -    };
>> -};
>> -
>> -&cci_i2c0 {
>> -    camera@10 {
>> -        compatible = "ovti,ov8856";
>> -        reg = <0x10>;
>> -
>> -        /* CAM0_RST_N */
>> -        reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
>> -        pinctrl-names = "default";
>> -        pinctrl-0 = <&cam0_default>;
>> -
>> -        clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
>> -        clock-names = "xvclk";
>> -        clock-frequency = <19200000>;
>> -
>> -        /*
>> -         * The &vreg_s4a_1p8 trace is powered on as a,
>> -         * so it is represented by a fixed regulator.
>> -         *
>> -         * The 2.8V vdda-supply and 1.2V vddd-supply regulators
>> -         * both have to be enabled through the power management
>> -         * gpios.
>> -         */
>> -        dovdd-supply = <&vreg_lvs1a_1p8>;
>> -        avdd-supply = <&cam0_avdd_2v8>;
>> -        dvdd-supply = <&cam0_dvdd_1v2>;
>> -
>> -        status = "ok";
>> -
>> -        port {
>> -            ov8856_ep: endpoint {
>> -                link-frequencies = /bits/ 64
>> -                    <360000000 180000000>;
>> -                data-lanes = <1 2 3 4>;
>> -                remote-endpoint = <&csiphy0_ep>;
>> -            };
>> -        };
>> -    };
>> -};
>> -
>> -&cci_i2c1 {
>> -    camera@60 {
>> -        compatible = "ovti,ov7251";
>> -
>> -        /* I2C address as per ov7251.txt linux documentation */
>> -        reg = <0x60>;
>> -
>> -        /* CAM3_RST_N */
>> -        enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
>> -        pinctrl-names = "default";
>> -        pinctrl-0 = <&cam3_default>;
>> -
>> -        clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
>> -        clock-names = "xclk";
>> -        clock-frequency = <24000000>;
>> -
>> -        /*
>> -         * The &vreg_s4a_1p8 trace always powered on.
>> -         *
>> -         * The 2.8V vdda-supply regulator is enabled when the
>> -         * vreg_s4a_1p8 trace is pulled high.
>> -         * It too is represented by a fixed regulator.
>> -         *
>> -         * No 1.2V vddd-supply regulator is used.
>> -         */
>> -        vdddo-supply = <&vreg_lvs1a_1p8>;
>> -        vdda-supply = <&cam3_avdd_2v8>;
>> -
>> -        status = "disable";
>> -
>> -        port {
>> -            ov7251_ep: endpoint {
>> -                data-lanes = <0 1>;
>> -/*                remote-endpoint = <&csiphy3_ep>; */
>> -            };
>> -        };
>> -    };
>> -};
>> -
>>   /* PINCTRL - additions to nodes defined in sdm845.dtsi */
>>   &qup_spi0_default {
>>       config {

Hmm.

I wasn't really looking to do anything other than move existing upstream 
stuff from one location to another.

But, since you flag it I will generate a number of Fixes: and append 
them to the head of this series.

---
bod
