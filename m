Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 898E352BF74
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 18:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239456AbiERPfP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 11:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239458AbiERPfN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 11:35:13 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D18679811
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 08:35:11 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id a14-20020a7bc1ce000000b00393fb52a386so3410048wmj.1
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1k9s1VyRT5qdsyVYSsVS4g8dr+t4pbwtVP3vJMMJ0Tk=;
        b=bF1gVETtXN5CfyL5cKmcje9earBCnj4fwq5VN2yE60xmijJpoefEOPoXwEEk+tJjcT
         sm6kNbUeE2d+Zh+lu5/s8u15LR2kplEX3DGCocsjj8p0bMuwZ/vyXAsVq3B8E7oupPKH
         TQW5Wno48QjJKHhDOBmJwtP6zsBMUSHdf9ub268Hzu0x3NWFBKAhbwASDgkOLQe9PMo2
         59/d58F0T73mLdsEkK305K55D4gbbuhtDDCCxj0gpXF69Ug9sGW1i47LBF2daxrtkFDL
         0jB7p0c4n2RRcnRUMVejy46LyR0/OvZ+aVs+cdW98czbvzUnIkqDM9d9ggvUkozu9ISf
         wMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1k9s1VyRT5qdsyVYSsVS4g8dr+t4pbwtVP3vJMMJ0Tk=;
        b=NJ+CfuDsayb2DT8OMLaTKb998U8XkNCG8gj16z/Hhmhl8hRAM4FZRW0AZ++BI/rle2
         yolQgQRkDMviK88aSwW0xK57ByQ+x1NLro2QQkz46+aCm9qHVZj1K140+HuLA7/dinxJ
         Z+e9p4G8pBgT/igp5u0a1cB+3kHdrUk5AcSmh4cTah7IAPz+Cj8rWtpM/Zdm8zW5Nsc7
         +d6O1Ke4BnYQKipNx3gMnrkz8CFUI1RAzBAsJIG/BCjbPL7aU4s+Jcm7v2a6y2RWqMLQ
         hdWo6MuomsZI/qRpNgdP/8kmpxL8SYO6cOqhWX3qqO3RYpSU8vOHHQMgzaroO22+8UPo
         ejTA==
X-Gm-Message-State: AOAM533IpCtgg40hnQyPu3tiC85EfuBLzOj0EzB4lH9m+KFkwHkPg83Z
        XLWswMMKm5MS5DUxaQUgPbHHgdXBKevmJpUJ
X-Google-Smtp-Source: ABdhPJwVY1/mQkzWCqkeSRRRNIXzNrBBLXWpdqnQocArgEvAhBU811vAGXWm3Pw98/mwX21+ivwuAA==
X-Received: by 2002:a1c:5459:0:b0:394:1191:a1ff with SMTP id p25-20020a1c5459000000b003941191a1ffmr486529wmi.96.1652888109964;
        Wed, 18 May 2022 08:35:09 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t12-20020adfba4c000000b0020c5253d91esm2273298wrg.106.2022.05.18.08.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 08:35:09 -0700 (PDT)
Message-ID: <22f4a9c7-31e6-10c1-6230-cbd3c0972fdc@linaro.org>
Date:   Wed, 18 May 2022 16:35:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/1] arm64: dts: qcom: qrb5165-rb5: Enable the IMX577 on
 cam1
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com
References: <20220518133004.342775-1-bryan.odonoghue@linaro.org>
 <20220518133004.342775-2-bryan.odonoghue@linaro.org>
 <58af3b06-97fe-fd29-b6e3-fa68737b1d96@somainline.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <58af3b06-97fe-fd29-b6e3-fa68737b1d96@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/05/2022 14:55, Konrad Dybcio wrote:
> Hi!
> 
> 
> On 18/05/2022 15:30, Bryan O'Donoghue wrote:
>> The IMX577 is on CCI1/CSI2 providing four lanes of camera data.
> 
> Commit says IMX577, code says IMX412.
> 
> 

The silicon enabling code for imx412 from Sony is the same as is used on 
imx577.

We have an imx577. I'll explain the difference in the V2 commit though.

>>
>> An example media-ctl pipeline is:
>>
>> media-ctl --reset
>> media-ctl -v -d /dev/media0 -V '"imx412 
>> '20-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>> media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>
>> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F 
>> /dev/video0
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 98 ++++++++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts 
>> b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> index 0e63f707b911..48b31790c434 100644
>> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> @@ -1203,6 +1203,43 @@ sdc2_card_det_n: sd-card-det-n {
>>           function = "gpio";
>>           bias-pull-up;
>>       };
>> +
>> +    cam2_default: cam2-default {
>> +        rst {
>> +            pins = "gpio78";
>> +            function = "gpio";
>> +
>> +            drive-strength = <2>;
>> +            bias-disable;
> 
> Other pins in this DT don't have a newline between function and 
> drive-strength, please remove it for consistency.
> 
> 
>> +        };
>> +
>> +        mclk {
>> +            pins = "gpio96";
>> +            function = "cam_mclk";
>> +
>> +            drive-strength = <16>;
>> +            bias-disable;
>> +        };
>> +    };
>> +
>> +    cam2_suspend: cam2-suspend {
>> +        rst {
>> +            pins = "gpio78";
>> +            function = "gpio";
>> +
>> +            drive-strength = <2>;
>> +            bias-pull-down;
>> +            output-low;
>> +        };
>> +
>> +        mclk {
>> +            pins = "gpio96";
>> +            function = "cam_mclk";
>> +
>> +            drive-strength = <2>;
>> +            bias-disable;
>> +        };
>> +    };
>>   };
>>   &uart12 {
>> @@ -1294,3 +1331,64 @@ &qup_spi0_data_clk {
>>       drive-strength = <6>;
>>       bias-disable;
>>   };
>> +
>> +&camcc {
>> +    status = "okay";
>> +};
> 
> It's enabled by default.

I'm assuming Vladimir's patch to disable by default goes in.
I'll include his patch as #1 in V2 so its clear on this point.

> 
>> +
>> +&camss {
>> +    status = "okay";
>> +    vdda-phy-supply = <&vreg_l5a_0p88>;
>> +    vdda-pll-supply = <&vreg_l9a_1p2>;
>> +
>> +    ports {
> 
> Maybe the port definitions along with #-cells here and on camss could be 
> moved to the SoC DTSI?

Makes sense.

---
bod
