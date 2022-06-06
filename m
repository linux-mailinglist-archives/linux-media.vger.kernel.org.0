Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9613453EE46
	for <lists+linux-media@lfdr.de>; Mon,  6 Jun 2022 21:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232079AbiFFTBh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jun 2022 15:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbiFFTBe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jun 2022 15:01:34 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1658BBF6D
        for <linux-media@vger.kernel.org>; Mon,  6 Jun 2022 12:01:29 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id y29so16759591ljd.7
        for <linux-media@vger.kernel.org>; Mon, 06 Jun 2022 12:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cBrnbfWI3Qkvz93WYqWneBwGVhwSbfP4XoE6iMckXJ8=;
        b=tMZU1dwjsfVHsYigoQgHu0kzMNHnTn89A9JPETRAS/DjS5/nEUY+yi4y7Xsm47S8zE
         6tqYMRK4+Bzb+dCmYvTuKm4xM8/wUXtERp+SBmFH0uMTu/4fGW+mzVbciZ4hUywMWPJi
         +qtJ6hUVC478IG2E4Gvmy5fPk/j8m+Fie7A0AGl/DEgnaPe/xg5vX1sa8wcppytrkSiR
         khmNFr/qHj2qU+jKm4XnJByyWd2Y1wbsJmelMKm7atz+gArgBttpREFvDAfFky08Z0ZA
         4a+L1wDXFGOIr7nkR/59WdaA5JtVNooIhrOjwRCe5c0Vz80BeVC0PaRp1QeYCm+KAJ6U
         Kn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cBrnbfWI3Qkvz93WYqWneBwGVhwSbfP4XoE6iMckXJ8=;
        b=g4/jfkZZsynnjk8PBUSyEOR9Th/DwRVYgFX5gi8HtYd1lyAcgiH5QiASVsNozoNFmD
         s6IsNUH7esuD8j+jByowLgbqE8CAy2LfE/QfIcyxJfJsJy0LPXbGvAI7s/AlWGflCu7B
         o/wGMLa0u103MgZObN+HlJ1pPVGZcVJGFcLAghuWv0TH77jVP/3xAjA4cBc1wHIFzYuy
         jRIG34IdtnZfwwTwhf7gia/ky2O92vf9miy1uttt3NzEa8pOEaYKPtauZVLbCbkiVt0R
         0pd/nZVVhiW59rcXL8xA/majXluETceV5DCoGHrwkiVwIZUlJl0vwSYjXhWcKhok/wGr
         9Q3Q==
X-Gm-Message-State: AOAM531jgwYdkIi+3po+GwcZ1L1B57aOKZBb/5a8tE9KIHq5+FuM/qso
        GNBBsbGT349N+o7kgi5kHE+fyg==
X-Google-Smtp-Source: ABdhPJwnrIb384qTEh3asasSn0tdO2E89/0UCTTbderVk3mKDrB2XjDYJTtp4PXD724CxqkndQwNCQ==
X-Received: by 2002:a05:651c:b29:b0:255:6ecc:96f with SMTP id b41-20020a05651c0b2900b002556ecc096fmr14605961ljr.176.1654542087896;
        Mon, 06 Jun 2022 12:01:27 -0700 (PDT)
Received: from [192.168.88.252] (78-107-206-185.broadband.corbina.ru. [78.107.206.185])
        by smtp.gmail.com with ESMTPSA id be34-20020a056512252200b0047255d2111csm2970452lfb.75.2022.06.06.12.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 12:01:27 -0700 (PDT)
Message-ID: <c0ab9632-ef85-f699-8c89-e9e3dc116828@linaro.org>
Date:   Mon, 6 Jun 2022 22:01:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
 Add vision mezzanine
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, jgrahsl@snap.com, hfink@snap.com,
        vladimir.zapolskiy@linaro.org
References: <20220606132029.2221257-1-bryan.odonoghue@linaro.org>
 <20220606132029.2221257-5-bryan.odonoghue@linaro.org>
 <1622739f-0cac-5b9f-325f-6a7b7eeb0606@linaro.org>
 <26271fb3-7992-7ad0-e3dd-6b69a70f3127@somainline.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
In-Reply-To: <26271fb3-7992-7ad0-e3dd-6b69a70f3127@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/6/22 21:36, Konrad Dybcio wrote:
> 
> On 06/06/2022 18:03, Dmitry Baryshkov wrote:
>> On 06/06/2022 16:20, Bryan O'Donoghue wrote:
>>> The Vision Mezzanine for the RB5 ships with an imx517 and ov9282 populated.
>>> Other sensors and components may be added or stacked with additional
>>> mezzanines.
>>>
>>> In this drop we enable the Sony imx577 main camera sensor.
>>>
>>> The IMX577 is on CCI1/CSI2 provides four lanes of camera data.
>>>
>>> An example media-ctl pipeline is:
>>>
>>> media-ctl --reset
>>> media-ctl -v -d /dev/media0 -V '"imx412 '20-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>>> media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
>>> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>>> media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
>>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>>
>>> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/Makefile             |  1 +
>>>   .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts | 68 +++++++++++++++++++
>>>   arch/arm64/boot/dts/qcom/sm8250.dtsi          | 33 +++++++++
>>>   3 files changed, 102 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>> index 2f8aec2cc6db..86e6801a9c29 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -51,6 +51,7 @@ dtb-$(CONFIG_ARCH_QCOM)    += msm8998-sony-xperia-yoshino-poplar.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs404-evb-1000.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs404-evb-4000.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += qrb5165-rb5.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)    += qrb5165-rb5-vision-mezzanine.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += sa8155p-adp.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += sc7180-idp.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += sc7180-trogdor-coachz-r1.dtb
>>> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts 
>>> b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
>>> new file mode 100644
>>> index 000000000000..c8bed02243f8
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
>>> @@ -0,0 +1,68 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) 2022, Linaro Ltd.
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "qrb5165-rb5.dts"
>>> +
>>> +&camcc {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&camss {
>>> +    status = "okay";
>>> +    vdda-phy-supply = <&vreg_l5a_0p88>;
>>> +    vdda-pll-supply = <&vreg_l9a_1p2>;
>>> +
>>> +    ports {
>>> +        /* The port index denotes CSIPHY id i.e. csiphy2 */
>>> +        port@2 {
>>> +            reg = <2>;
>>> +            csiphy2_ep: endpoint {
>>> +                clock-lanes = <7>;
>>> +                data-lanes = <0 1 2 3>;
>>> +                remote-endpoint = <&imx412_ep>;
>>> +            };
>>> +
>>> +        };
>>> +    };
>>> +};
>>> +
>>> +&cci1 {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&cci1_i2c0 {
>>> +    camera@1a {
>>> +        /*
>>> +         * rb5 ships with an imx577. camx code from qcom treats imx412
>>> +         * and imx577 the same way. Absent better data do the same here.
>>> +         */
>>> +        compatible = "sony,imx412";
>>
>> I'd prefer to list "sony,imx577", "sony,imx412" here or even just imx577 here and extend imx412 driver to support imx577 compat.
> 
> I like this approach as well. Even if they technically *should* be the same, this would allow for introducing per-sensor quirks 
> should there be any.

Also having "sony,imx577", "sony,imx412" in the driver code makes it easier for imx577 users to identify the driver that 
supports their sensor. So the "just imx577 here and extend imx412 driver" looks like the best option for me too.

Thanks,
Andrey

> Konrad
> 
>>
>>> +        reg = <0x1a>;
>>> +
>>> +        reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
>>> +        pinctrl-names = "default", "suspend";
>>> +        pinctrl-0 = <&cam2_default>;
>>> +        pinctrl-1 = <&cam2_suspend>;
>>> +
>>> +        clocks = <&camcc CAM_CC_MCLK2_CLK>;
>>> +        assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
>>> +        assigned-clock-rates = <24000000>;
>>> +
>>> +        dovdd-supply  = <&vreg_l7f_1p8>;
>>> +        avdd-supply = <&vdc_5v>;
>>> +        dvdd-supply = <&vdc_5v>;
>>> +
>>> +        port {
>>> +            imx412_ep: endpoint {
>>
>> I'd call this the imx577_ep. It's still the imx577 sensor, despite the kernel using imx412 compat
>>
>>> +                clock-lanes = <1>;
>>> +                link-frequencies = /bits/ 64 <600000000>;
>>> +                data-lanes = <1 2 3 4>;
>>> +                remote-endpoint = <&csiphy2_ep>;
>>> +            };
>>> +        };
>>> +    };
>>> +};
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> index aa9a13364865..2b65ec2806d0 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> @@ -3788,6 +3788,39 @@ tlmm: pinctrl@f100000 {
>>>               gpio-ranges = <&tlmm 0 0 181>;
>>>               wakeup-parent = <&pdc>;
>>>   +            cam2_default: cam2-default {
>>> +                rst {
>>> +                    pins = "gpio78";
>>> +                    function = "gpio";
>>> +                    drive-strength = <2>;
>>> +                    bias-disable;
>>> +                };
>>> +
>>> +                mclk {
>>> +                    pins = "gpio96";
>>> +                    function = "cam_mclk";
>>> +                    drive-strength = <16>;
>>> +                    bias-disable;
>>> +                };
>>> +            };
>>> +
>>> +            cam2_suspend: cam2-suspend {
>>> +                rst {
>>> +                    pins = "gpio78";
>>> +                    function = "gpio";
>>> +                    drive-strength = <2>;
>>> +                    bias-pull-down;
>>> +                    output-low;
>>> +                };
>>> +
>>> +                mclk {
>>> +                    pins = "gpio96";
>>> +                    function = "cam_mclk";
>>> +                    drive-strength = <2>;
>>> +                    bias-disable;
>>> +                };
>>> +            };
>>> +
>>>               cci0_default: cci0-default {
>>>                   cci0_i2c0_default: cci0-i2c0-default {
>>>                       /* SDA, SCL */
>>
>>
