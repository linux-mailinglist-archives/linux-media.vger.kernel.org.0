Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0409548447C
	for <lists+linux-media@lfdr.de>; Tue,  4 Jan 2022 16:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234621AbiADP0o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jan 2022 10:26:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234580AbiADP0o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jan 2022 10:26:44 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4AF7C061761
        for <linux-media@vger.kernel.org>; Tue,  4 Jan 2022 07:26:43 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id l4so23480638wmq.3
        for <linux-media@vger.kernel.org>; Tue, 04 Jan 2022 07:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2RREQ97neVusOnaH2fnArGrbf/gMrFB/pp4jcOaRLWc=;
        b=m2OTr324cC+ldSS5JNZdi3kcJO/CXnOPzRuXF4dq7UwNfrppczxSTk9KByS2qy5wWS
         lwI3ll9ffE+FS9qmUAVIumvCyNkhsKd8iLb84QQolCTs2T6wMn8yR+q6f11KW1dDly35
         SoR6BgrSxCrcznuxYDsGqd8N4EOnqzGlvRGSdY+yn912wT72SViuibnBRHPLddl1lIYS
         jiY/zEfxon4NWJjlxT5uBnUEEEYO2ElQ1hI6q43g4GQxpx9d+8ajHC0NFyNk3Af70f4h
         WjSPdHm4labO4zIlH4v/QyFN8x2R8MkqW/eHi4Bxm90bDtx0YXV0f/BxyOEVyGLMFPV3
         U8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2RREQ97neVusOnaH2fnArGrbf/gMrFB/pp4jcOaRLWc=;
        b=QjhDJlbJU2qBvY1Pi7ZI5ooTACLtLH8Yi0ZYUXqyLKuLB0cbzcGGaXdQfb/pdhDPFt
         HXg6v0SMo3g3QeTgVasEwGwcENmziakoqH6x4jvx/aLASo2eBrsrUPZ6lykP56soZDVg
         NAmr1AFkJ67CznsnoIyBdNBKhKppiP9EubwLDsAxshUT1JEo+dQ53BvZIadezkcnRsB0
         HnMX3/4yZYj07y80xmcNlxrjM9UsEk47BezCEUmdJOv/plrcbtSYXNLmimkdEcTOr/PZ
         P+gjZZhGkOjewWX2+EoJM/55dtACIeTzbmSRM8HRRzjSThAwP3GnJ3ZL95hDz7JYDaJy
         Uqhw==
X-Gm-Message-State: AOAM532XAieiufFmc8B4RH6Iur91yAUADvBYA00zn6ATFmF4IOmk0wFm
        CVLJrxkJ4ssavAsVrdq/A8UDuQ==
X-Google-Smtp-Source: ABdhPJzWspnwMgyqYTZbFqttx1UQZAMYQ2R1/eC/Pxo1xT9vWHwOqDKZjn1m9Ju1XwrbtvsxL5hhHQ==
X-Received: by 2002:a05:600c:1d1c:: with SMTP id l28mr41227648wms.69.1641310002210;
        Tue, 04 Jan 2022 07:26:42 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p23sm36934980wms.3.2022.01.04.07.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 07:26:41 -0800 (PST)
Message-ID: <80123075-17c5-663a-b175-a3b2cba22b9b@linaro.org>
Date:   Tue, 4 Jan 2022 15:28:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 01/19] media: dt-bindings: media: camss: Add
 qcom,sm8250-camss binding
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, dmitry.baryshkov@linaro.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        hverkuil@xs4all.nl, mchehab@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
 <20211222003751.2461466-2-bryan.odonoghue@linaro.org>
 <1d753716-ba3c-8fb6-eeaf-7c68ef0c6e5c@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1d753716-ba3c-8fb6-eeaf-7c68ef0c6e5c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/01/2022 13:42, Vladimir Zapolskiy wrote:
> Hi Bryan, Robert,
> 
> On 12/22/21 2:37 AM, Bryan O'Donoghue wrote:
>> From: Jonathan Marek <jonathan@marek.ca>
>>
>> Add bindings for qcom,sm8250-camss in order to support the camera
>> subsystem for SM8250.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   .../bindings/media/qcom,sm8250-camss.yaml     | 450 ++++++++++++++++++
>>   1 file changed, 450 insertions(+)
>>   create mode 100644 
>> Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml 
>> b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> 
> <snip>
> 
>> +required:
>> +  - clock-names
>> +  - clocks
>> +  - compatible
>> +  - interconnects
>> +  - interconnect-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - iommus
>> +  - power-domains
>> +  - reg
>> +  - reg-names
>> +
>> +additionalProperties: false
> 
> I've discovered that there is a noticeable difference between this bindings
> and all the previous ones, for instance see qcom,sdm845-camss.yaml
> 
> There is no required 'vdda-supply' property on the list, and fwiw I believe
> there should be two supply properties for 0p9 and 1p2 supplies in fact.
> Similarly, two separate supplies should be present in sdm845 camss 
> bindings.

The 1p2 supply is defined in the camera sensor section as dvdd-supply

https://git.linaro.org/people/bryan.odonoghue/kernel.git/tree/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts?h=v5.16-rc6-sm8250-camss-imx577-only-v3

1p2 connects to dvdd-supply as per Miura(865-RB5)-Camera_NAV_Mezz page 
10 - thundercomm registration required to view

arch/arm64/boot/dts/qcom/qrb5165-rb5.dts::&cci_i2c2::camera@1a
{
     dovdd-supply  = <&vreg_s4a_1p8>;
     avdd-supply = <&vreg_l7f_1p8>;
     dvdd-supply = <&vreg_l9a_1p2>;
}

similarly to

arch/arm64/boot/dts/qcom/sdm845-db845c.dts::&cci_i2c0::camera@10 {
     dovdd-supply = <&vreg_lvs1a_1p8>;
     avdd-supply = <&cam0_avdd_2v8>;
     dvdd-supply = <&cam0_dvdd_1v2>;
}

and

arch/arm64/boot/dts/qcom/apq8016-sbc.dts::&cci_i2c0::camera_rear@3b
{
     vdddo-supply = <&camera_vdddo_1v8>;
     vdda-supply = <&camera_vdda_2v8>;
     vddd-supply = <&camera_vddd_1v5>; /* bod: here */
}

The IMX sensor needs to have the regulator_bulk_enable() stuff added, 
I'll post this patch it works standalone

https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=v5.16-rc6-sm8250-camss-imx577-only-v3&id=e82fc1b29d9227cad3ad7dcab362c39dd4a63bdb

Simiar to 0c2c7a1e0d69 ("media: ov8856: Add devicetree support")

Downstream points the CPA to "camss-vdd-supply = <&titan_top_gdsc>;" 
which is covered by our TITAN_TOP_GDSC power-domain and 
"mipi-csi-vdd-supply = <&pm8150_l9>;"

regulator-pm8150-l9 == rpmh-regulator-ldoa9 == ldoa9 == pmic5-ldo

aka l9a upstream

"dvdd-supply = <&vreg_l9a_1p2>;"

vreg_l9a_1p2: ldo9 {
     regulator-name = "vreg_l9a_1p2";
     regulator-min-microvolt = <1200000>;
     regulator-max-microvolt = <1200000>;
     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
};

Not sure I see on the schematic or in the downstream dts how 0p9 is 
connected to the camera - seems to be a pcie and or mdss-dsi regulator.

If vdda-supply is a required property of the camera and not the sensor 
then what regulator do you think it should point to ?

> At the moment the driver operates with 'vdda' supply only, commit 9e5d1581
> introduced undocumented 'vdd_sec' for sdm660, but, if I'm not mistaken,
> it's unused.

I agree with you there - vdd_sec is either unspecified in the 
Documentation or not required.

---
bod
