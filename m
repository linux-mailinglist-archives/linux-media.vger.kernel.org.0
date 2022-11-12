Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9E34626C22
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 23:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235056AbiKLWGU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 17:06:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbiKLWGS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 17:06:18 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1196112AB0
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 14:06:17 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id q9so20215519ejd.0
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 14:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=md9plnrd1EYQtAzkcg1mMMv1c/09eiBi6mfp9v5WZtc=;
        b=tT4jObAv3GZVUxyNah0xD4F9oZ7AsA4na7viM05+UqBDIlUAD64FnLEXkyVTVqOciX
         GQGALfJBKrHWeiIwUUKjCq9DSnMfi0QD6O2Q/F/mADR5atXyqgAbfhNaKON6trv3B6QL
         hl2TZVHJtfqwNJNUkOUBqx/RVFYR+EJyCxNPRQXj1ECQAuubwmTx1/atYGumVWsgAEvj
         A6lkXMK3jUqRBSY5Ea1ahrC7MLLaRPou0qwHXMDr9WCdwFl8MdXxH03cCATm5D/QQsSd
         igMhmNiWJWaakDSek0GrfI3+Miq5r69rYvQcKs1HfklfGnloFgpvnP9g21wI6V9ddTD7
         /Pjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=md9plnrd1EYQtAzkcg1mMMv1c/09eiBi6mfp9v5WZtc=;
        b=KAgt+3Rx1Dfw4sfGL3YViFaG+GtbHDfrd/WpM7W0a+YFyGW9BeuDtW30Qbn4apEXai
         mc2vTOID9YoRVuEdHEPaGVd+Ez+TCF/jiWA8HhQd7yBAwW5oNsUXyn5UgI4pd038pW1A
         doLGPI+onKaNqbao3mkVNbFmSO3ppdELrCwuYoaL29Vsc/Ql8z585gyGYkUKQj7+fQaV
         fHKzpFfGVsAV94H5HUP9XL7t8Ao4P0eRtktHxQhxfl2ZIw/9Y2QRsoRMa5cpuIJNJ3So
         pABu8S2Pe8Gbs94TjuLYmoBG0WEvzwpeKPSlfO9D1mWj3MAI6tKm6rdv0A6sbXjM0/eM
         +xeg==
X-Gm-Message-State: ANoB5pnM9S3yfuR09oVvHfcAnTPX69boMxxarTNRhMse4tfak1xUR6BG
        38vr7eiavCPDstmqbUcm3vyu4w==
X-Google-Smtp-Source: AA0mqf5jGzojo8EGWCnSPzyQ7udz/1vz+9tiZgIvp0mfcetXmtDKK8aIXzSTlWdKUekA2QFSFEVChA==
X-Received: by 2002:a17:906:4113:b0:7aa:97c7:2bfe with SMTP id j19-20020a170906411300b007aa97c72bfemr6123899ejk.196.1668290775592;
        Sat, 12 Nov 2022 14:06:15 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:316d:3d05:f910:22aa? (2001-1c06-2302-5600-316d-3d05-f910-22aa.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:316d:3d05:f910:22aa])
        by smtp.gmail.com with ESMTPSA id e1-20020aa7d7c1000000b00463c367024bsm2729293eds.63.2022.11.12.14.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Nov 2022 14:06:15 -0800 (PST)
Message-ID: <97be6108-3c43-9970-fb88-b99c38aae4e6@linaro.org>
Date:   Sat, 12 Nov 2022 22:06:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
 Add vision mezzanine
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org, sakari.ailus@iki.fi,
        hverkuil@xs4all.nl, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
 <20221112172650.127280-7-bryan.odonoghue@linaro.org>
 <Y3AT5BpHxuZdnidp@pendragon.ideasonboard.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Y3AT5BpHxuZdnidp@pendragon.ideasonboard.com>
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

On 12/11/2022 21:45, Laurent Pinchart wrote:
> Hi Bryan,
> 
> Thank you for the patch.
> 
> On Sat, Nov 12, 2022 at 05:26:50PM +0000, Bryan O'Donoghue wrote:
>> The Vision Mezzanine for the RB5 ships with an imx517 and ov9282 populated.
> 
> Did you mean imx577 ?

Yes 1 looks like 7 in my defence

> 
>> Other sensors and components may be added or stacked with additional
>> mezzanines.
>>
>> Enable the IMX577 on the vision mezzanine.
> 
> Is there a particular reason the ov9282 isn't described ?

ov9282 is WIP.

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=next-20221013-sm8250-camss-vc

Its too much detail for here but, i2c works, no data is delivered on the 
CSI bus - I suspect the upstream init sequence isn't a match for my board.

I'm aiming to unblock just the imx577 for rb5.

>> An example media-ctl pipeline for the imx577 is:
>>
>> media-ctl --reset
>> media-ctl -v -d /dev/media0 -V '"imx577 '22-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>> media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>
>> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile             |  1 +
>>   .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts | 63 +++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi          | 33 ++++++++++
>>   3 files changed, 97 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 70ce09bc63a33..5eadd251a0a16 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -54,6 +54,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
>> new file mode 100644
>> index 0000000000000..315d524045cf3
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
>> @@ -0,0 +1,63 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2022, Linaro Ltd.
>> + */
>> +
>> +/dts-v1/;
> 
> Could this be an overlay ?

Could be. Its a nice idea. I'll look into it separately.

I think it will probably mean chainloading to grub, u-boot or a ramdisk 
though..

>>   
>> +			cam2_default: cam2-default-state {
>> +				rst-pins {
>> +					pins = "gpio78";
>> +					function = "gpio";
>> +					drive-strength = <2>;
>> +					bias-disable;
>> +				};
>> +
>> +				mclk-pins {
>> +					pins = "gpio96";
>> +					function = "cam_mclk";
>> +					drive-strength = <16>;
>> +					bias-disable;
>> +				};
>> +			};
> 
> This seems board-specific, shouldn't it go to the mezzanine .dts ?

Fair comment, originally that's where I had them

https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=linux-next-18-05-22%2bimx577-rb5&id=cd394110d80a23292e84deced50f607ff81344e9

These specific pins are dedicated though

https://lore.kernel.org/all/33abcc93-13f1-d6f5-36a3-6ab796f124f9@linaro.org/

---
bod
