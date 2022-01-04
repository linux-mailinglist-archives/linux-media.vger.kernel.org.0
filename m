Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF91F484964
	for <lists+linux-media@lfdr.de>; Tue,  4 Jan 2022 21:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbiADUmW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jan 2022 15:42:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbiADUmV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jan 2022 15:42:21 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62939C061761
        for <linux-media@vger.kernel.org>; Tue,  4 Jan 2022 12:42:21 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id j18so78545184wrd.2
        for <linux-media@vger.kernel.org>; Tue, 04 Jan 2022 12:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=zc14HqcUdO67FWJHEtT1bYN39eVYKixkG2MiL3UgbTI=;
        b=cUeD6josjdZHQZ3HnqsjOGVXK07aNgAcfh/7vxdMZZS9av0lbFjbAholSTntGalo8y
         D9wtSgVJuR8lnmyjmvdL/lFdcaIW7rsoOI0R0NPm/j+8zct+093LO9BsgtDUpUyP2HyM
         k54H3AR0HbJzFczxRItjOvFbEPCnmg5n3Y1q23kJOfWmOf+tDdY8ZKBjQAA1SzntkGC2
         qdyT7IzTlFA5k0+7FAnr28s6igCkv0mxBye/qT6jk7vzk0Rv1j/7jzcs7C7Hjplte3wg
         0akgCSXHJSvfSZTT5YOMkm1FcpHL1twiptU8ESPXvokZMdItCTaLnIVHWFM6V3T+Otzd
         0DKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=zc14HqcUdO67FWJHEtT1bYN39eVYKixkG2MiL3UgbTI=;
        b=YemPx4mNnBoFLl+l1e5nylk56iFN65C7moRNdhiLsU6cU4Xr2l3EX6FBPEsfo1uc51
         6UD7QqOVU+6HmIPP4vjIdYrJ6+oguZvi78zIN0zwuYDy3guKEgT0BXNShARFVNphCtJZ
         qt6JtmMuuggxP2SmSrQ4h7YMKqQzI1ybv2IDUalFw4aqurGaHhuzkL/e+X72JYv22yAU
         i7oemM75EL/stGT/YQDlu4vPedlhUSvlahWX9BUfNk4lf4Bb9lU6X24Q38bq2TbtHFs5
         JLfirQwnTBvViSrJJZ1Nad1Z4QrTDEaIVvF9H0MDQcWYJUvJfVuJStHH437mefapmqkH
         gyUA==
X-Gm-Message-State: AOAM530zr4PJTEZyveB8YeTaaoc/c7Qi8P1V5xOYZMxvI0XrwtH7NKUd
        bUVBvxkEOQNBdZ8tLh30lxFsIg==
X-Google-Smtp-Source: ABdhPJwMt5ar4RFdev0h9zz7JyDqtFPFSxdFNkgy/53GC4W3skJsykgZLbm1BDWybwKSkqYmiOysfw==
X-Received: by 2002:a5d:4804:: with SMTP id l4mr44327912wrq.629.1641328939947;
        Tue, 04 Jan 2022 12:42:19 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g187sm470128wmg.40.2022.01.04.12.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 12:42:19 -0800 (PST)
Message-ID: <6baa737b-441a-3dfe-f363-aaf4d4fd62c8@linaro.org>
Date:   Tue, 4 Jan 2022 20:44:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 01/19] media: dt-bindings: media: camss: Add
 qcom,sm8250-camss binding
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
 <80123075-17c5-663a-b175-a3b2cba22b9b@linaro.org>
In-Reply-To: <80123075-17c5-663a-b175-a3b2cba22b9b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/01/2022 15:28, Bryan O'Donoghue wrote:
> On 04/01/2022 13:42, Vladimir Zapolskiy wrote:
>> Hi Bryan, Robert,
>>
>> On 12/22/21 2:37 AM, Bryan O'Donoghue wrote:
>>> From: Jonathan Marek <jonathan@marek.ca>
>>>
>>> Add bindings for qcom,sm8250-camss in order to support the camera
>>> subsystem for SM8250.
>>>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> ---
>>>   .../bindings/media/qcom,sm8250-camss.yaml     | 450 ++++++++++++++++++
>>>   1 file changed, 450 insertions(+)
>>>   create mode 100644 
>>> Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml 
>>> b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>>
>> <snip>
>>
>>> +required:
>>> +  - clock-names
>>> +  - clocks
>>> +  - compatible
>>> +  - interconnects
>>> +  - interconnect-names
>>> +  - interrupts
>>> +  - interrupt-names
>>> +  - iommus
>>> +  - power-domains
>>> +  - reg
>>> +  - reg-names
>>> +
>>> +additionalProperties: false
>>
>> I've discovered that there is a noticeable difference between this 
>> bindings
>> and all the previous ones, for instance see qcom,sdm845-camss.yaml
>>
>> There is no required 'vdda-supply' property on the list, and fwiw I 
>> believe
>> there should be two supply properties for 0p9 and 1p2 supplies in fact.
>> Similarly, two separate supplies should be present in sdm845 camss 
>> bindings.
> 
> The 1p2 supply is defined in the camera sensor section as dvdd-supply
> 
> https://git.linaro.org/people/bryan.odonoghue/kernel.git/tree/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts?h=v5.16-rc6-sm8250-camss-imx577-only-v3 
> 
> 
> 1p2 connects to dvdd-supply as per Miura(865-RB5)-Camera_NAV_Mezz page 
> 10 - thundercomm registration required to view
> 
> arch/arm64/boot/dts/qcom/qrb5165-rb5.dts::&cci_i2c2::camera@1a
> {
>      dovdd-supply  = <&vreg_s4a_1p8>;
>      avdd-supply = <&vreg_l7f_1p8>;
>      dvdd-supply = <&vreg_l9a_1p2>;
> }
> 
> similarly to
> 
> arch/arm64/boot/dts/qcom/sdm845-db845c.dts::&cci_i2c0::camera@10 {
>      dovdd-supply = <&vreg_lvs1a_1p8>;
>      avdd-supply = <&cam0_avdd_2v8>;
>      dvdd-supply = <&cam0_dvdd_1v2>;
> }
> 
> and
> 
> arch/arm64/boot/dts/qcom/apq8016-sbc.dts::&cci_i2c0::camera_rear@3b
> {
>      vdddo-supply = <&camera_vdddo_1v8>;
>      vdda-supply = <&camera_vdda_2v8>;
>      vddd-supply = <&camera_vddd_1v5>; /* bod: here */
> }
> 
> The IMX sensor needs to have the regulator_bulk_enable() stuff added, 
> I'll post this patch it works standalone
> 
> https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=v5.16-rc6-sm8250-camss-imx577-only-v3&id=e82fc1b29d9227cad3ad7dcab362c39dd4a63bdb 
> 
> 
> Simiar to 0c2c7a1e0d69 ("media: ov8856: Add devicetree support")
> 
> Downstream points the CPA to "camss-vdd-supply = <&titan_top_gdsc>;" 
> which is covered by our TITAN_TOP_GDSC power-domain and 
> "mipi-csi-vdd-supply = <&pm8150_l9>;"
> 
> regulator-pm8150-l9 == rpmh-regulator-ldoa9 == ldoa9 == pmic5-ldo
> 
> aka l9a upstream
> 
> "dvdd-supply = <&vreg_l9a_1p2>;"
> 
> vreg_l9a_1p2: ldo9 {
>      regulator-name = "vreg_l9a_1p2";
>      regulator-min-microvolt = <1200000>;
>      regulator-max-microvolt = <1200000>;
>      regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> };
> 
> Not sure I see on the schematic or in the downstream dts how 0p9 is 
> connected to the camera - seems to be a pcie and or mdss-dsi regulator.
> 
> If vdda-supply is a required property of the camera and not the sensor 
> then what regulator do you think it should point to ?
> 
>> At the moment the driver operates with 'vdda' supply only, commit 
>> 9e5d1581
>> introduced undocumented 'vdd_sec' for sdm660, but, if I'm not mistaken,
>> it's unused.
> 
> I agree with you there - vdd_sec is either unspecified in the 
> Documentation or not required.
> 
> ---
> bod

Keep guessing there BOD.

Having a deep dive on the schematics of the RB3 and the RB5 there are a 
number of broken assumptions on regulators that "just happen to work"

I've corrected these for RB5 and will presently validate on RB3, I've 
added in regulator_bulk_enable and regulator_bulk_disable which should 
capture what we need to do for sm8250 and 630 - once we fixup the DTS 
for 630

Note: I don't have schematics for 630 or to my knowledge DTS either - I 
haven't looked all that hard, perhaps its easy to find.

The CSI vdda enable is still required in the sensor but @

dovdd-supply = <&vreg_l7f_1p8>; not dovdd-supply  = <&vreg_s4a_1p8>;

The sensor stuff hasn't been submitted upstream but still my v3 tree is 
wrong.

On RB5 if we switched off USB, UFS and PCIe there's no way the camera 
could come up.

The patch in the series I picked up from @Jonathan to drop regulator 
enable for rb3 is also wrong.

I've got the RB5 part working a bit better - need to fixup for RB3 and 
will resend

git.linaro.org/people/bryan.odonoghue/kernel.git / 
v5.16-rc6-sm8250-camss-imx577-only-v4


Thanks for the ping @Vladimir.

Please don't apply V3 for now

---
bod
