Return-Path: <linux-media+bounces-47145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 250A3C5E8A2
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 18:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0BD6E4F4719
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 17:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322F73396F1;
	Fri, 14 Nov 2025 17:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0rllwnd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CE83385A7
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 17:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763139986; cv=none; b=LAnoQQ3l6iRoLG7/gEtku36ltf3YSvhuUGBK0H6SHqPw06FyC+jUIzIXXncLX5EIVDrOaNdPqLWitFZwnrV3X8MBvbP8dBxm139e2Rclq93KFfO2tu8raLYHznwtL5E+DnYExEDrtFR/A2JDS2RcpuW9RyhZizadHqQDGeYvFh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763139986; c=relaxed/simple;
	bh=Xl/T+7gW26E3BUgtzfvLO96Wc+g/bLp5rVsLDzs/K/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4004zz1XqtbotD5Fcmz2/mCiL5nDV6WTvK89XzPJGOCqAwQtzPgj5U1RLUQcrp7bMnuwRqoNbehf8B5ENLJ+WiklICkgZEiAZ3fv//oqgoLkaIOWIkMOeDuquHOuQgtOYWMzIrdHYa45rv1etiQ/bvw/fr3dGQw8sKbEBNzU5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q0rllwnd; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5942708701dso320973e87.3
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 09:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763139982; x=1763744782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlhPAP5+1oFFKgv+MpnDTSssBlYdDgswWjb+bMT9Sd4=;
        b=Q0rllwndyERBaEYpqrHGlEw3yRi8EHRKT0V5lxOfQg9bd++BqFwQwQCZD7drdg8Egj
         hsHlpevjoBj4LVTMZBp7miRcZIMCBriry9vEvVZMg6Ey4ApPA9msYxBIg7quJzwMTP/u
         8no8O2MpYk5m46CyzYxbsp62b37baHX3t/tYVpqYLIYXZbAmljr4Rd3lQgxkavv8GkT8
         d4P9ArAcergemScphzsOZfr48EQof0EANuwM6qz8G8MlaDNXM2sODJwZF7g3wY3C4PKv
         RN34gsqcbjnEz05/BrO09tWTzllMFlkfEqlyTfnZvgJZkjUZ+UpnkbFl9+OxKN78cJxO
         UWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763139982; x=1763744782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KlhPAP5+1oFFKgv+MpnDTSssBlYdDgswWjb+bMT9Sd4=;
        b=quRyfu6TfuyjjxExTJSx/iMrw122412JUqVkzEIf9EP3KFtHRc8dPmiqQJM6YUFzTd
         0u2eAmAiLb8v3FitrwdOcIzd909gAdQHFGBpHP+/taSALgAj9oXpiJn8sXl2+Utk2t4p
         Ft1cM+LiSwmpuMnEPYPRTvlnd6raqUWF8J3AE0IRepkUmhlfrgdWoJsXCR7z7v3i1wcc
         fyHHAbxdbrAuezvZLbkeLPudvCQikX+Ez8t6McbApE3HGMsw0xAv2p4uSszIsjD1Err1
         X6KPiaqVqhQGnuRaj5I8Dr0X8kWMlVOEHGqNtyTluUyBXwp+dvfZrXFYfxr40ZgFt8WE
         GDBg==
X-Forwarded-Encrypted: i=1; AJvYcCUXXcWS+VAH/JUq/cNflWHMvlDYjMqDNn76KznxiHXRhK/gtljja1HOIndmDK52GUzHhfEAIPkp9tdzjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKyT+uoJKvlWYL2t7KSIz0/nRFGUmoXqeqdarb4rKfN68O9zSo
	jAWEH21bggvx+kO7yp4zPFGphjolK0acYvDM1IbFjpAmJPMTWhT0k0/trN1FgLhM+iQ=
X-Gm-Gg: ASbGncvMypvJ87sVDw7QKuez1pD5BwEiiwCSUoLk5ELEHxSYxluH27pQJB54WQn9XTi
	9j1u58BiJv76LXry9TKy28hJIWD+IviO4Rt7Qu+0HjYRnvxwg7T494bPXPoimkIFbkvrd7aoOa1
	lA6/RsppD55FPQl8E/lVngvboC7DHx/gGfta2qQ69NaQZsFGEFZPEEqQw9fvOrOuB7pM9LujgPU
	5lfzbJU8P65ntN8SduewRC+KOWe/VOms9akIhJl7aQ3zQ5lEybD+72nuHqWeudIzQmGGcn/B6ln
	xb/aCTXwRtUGbZ4cq1QOwd2YZ9UDelT3VzAkp++7fNaAFRA8Dfr4WmK0ceRa+WLr7+hTSq7TEzF
	XYq2ut9WUFaqmUqQjxtpGw50f/CGWYqge85Ww2PgTrmrOev7N3hF+JBFa0D5gWZEC/q0mTxoerv
	8oOlUosDbuPhPGX0v4zdPZMTCmQqKgBpfbx37HSIvNrjF9H7p6RtIjUPDRiLtF4J4Sqg==
X-Google-Smtp-Source: AGHT+IHaRwr/3L7amq8e0vJ7Cj+Q+Jh1Mnwn4lSkjFPbzcqtvkP5+pPuZTEPCbSDf5bdWhULZKaKcA==
X-Received: by 2002:a05:6512:318f:b0:595:81e7:3dad with SMTP id 2adb3069b0e04-595847eba8cmr571470e87.3.1763139981826;
        Fri, 14 Nov 2025 09:06:21 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405a4esm1164751e87.95.2025.11.14.09.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 09:06:20 -0800 (PST)
Message-ID: <d7dfeb7e-c0b2-426e-8572-023715c33674@linaro.org>
Date: Fri, 14 Nov 2025 19:06:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Bryan O'Donoghue <bod@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <20251114-sm6350-camss-v2-1-d1ff67da33b6@fairphone.com>
 <de7ad562-80bc-498e-a6fb-cc26bb6343f0@linaro.org>
 <r6EgtiSu8pqs2ouFERTw7fx8kYZ3RcSbGklwd17UPxNGGd3sbRDl2BPyplkABZVu3qyfrIzRMisa0qTSrm89BA==@protonmail.internalid>
 <DE8FV81S45S5.CH6K1QAX940D@fairphone.com>
 <a428f8b9-c338-4404-8dc1-da6daae37d5c@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <a428f8b9-c338-4404-8dc1-da6daae37d5c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/25 18:09, Bryan O'Donoghue wrote:
> On 14/11/2025 13:06, Luca Weiss wrote:
>> Hi Vladimir,
>>
>> On Fri Nov 14, 2025 at 1:40 PM CET, Vladimir Zapolskiy wrote:
>>> Hi Luca.
>>>
>>> On 11/14/25 13:15, Luca Weiss wrote:
>>>> Add bindings for the Camera Subsystem on the SM6350 SoC.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>     .../bindings/media/qcom,sm6350-camss.yaml          | 349 +++++++++++++++++++++
>>>>     1 file changed, 349 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
>>>> new file mode 100644
>>>> index 000000000000..d812b5b50c05
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
>>>> @@ -0,0 +1,349 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/media/qcom,sm6350-camss.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm SM6350 Camera Subsystem (CAMSS)
>>>> +
>>>> +maintainers:
>>>> +  - Luca Weiss <luca.weiss@fairphone.com>
>>>> +
>>>> +description:
>>>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,sm6350-camss
>>>> +
>>>> +  reg:
>>>> +    maxItems: 12
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: csid0
>>>> +      - const: csid1
>>>> +      - const: csid2
>>>> +      - const: csid_lite
>>>> +      - const: csiphy0
>>>> +      - const: csiphy1
>>>> +      - const: csiphy2
>>>> +      - const: csiphy3
>>>> +      - const: vfe0
>>>> +      - const: vfe1
>>>> +      - const: vfe2
>>>> +      - const: vfe_lite
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 30
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: cam_ahb_clk
>>>> +      - const: cam_axi
>>>> +      - const: soc_ahb
>>>> +      - const: camnoc_axi
>>>> +      - const: core_ahb
>>>> +      - const: cpas_ahb
>>>> +      - const: csiphy0
>>>> +      - const: csiphy0_timer
>>>> +      - const: csiphy1
>>>> +      - const: csiphy1_timer
>>>> +      - const: csiphy2
>>>> +      - const: csiphy2_timer
>>>> +      - const: csiphy3
>>>> +      - const: csiphy3_timer
>>>> +      - const: slow_ahb_src
>>>> +      - const: vfe0_axi
>>>> +      - const: vfe0
>>>> +      - const: vfe0_cphy_rx
>>>> +      - const: vfe0_csid
>>>> +      - const: vfe1_axi
>>>> +      - const: vfe1
>>>> +      - const: vfe1_cphy_rx
>>>> +      - const: vfe1_csid
>>>> +      - const: vfe2_axi
>>>> +      - const: vfe2
>>>> +      - const: vfe2_cphy_rx
>>>> +      - const: vfe2_csid
>>>> +      - const: vfe_lite
>>>> +      - const: vfe_lite_cphy_rx
>>>> +      - const: vfe_lite_csid
>>>
>>> The sorting order of this list does not follow the sorting order accepted
>>> in the past.
>>
>> What file should I best reference?
> 
> Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> 
>>>
>>> I'm very sorry for the vagueness, but I can not pronounce the accepted
>>> sorting order name, because it triggers people.
>>>
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 12
>>>> +
>>>> +  interrupt-names:
>>>> +    items:
>>>> +      - const: csid0
>>>> +      - const: csid1
>>>> +      - const: csid2
>>>> +      - const: csid_lite
>>>> +      - const: csiphy0
>>>> +      - const: csiphy1
>>>> +      - const: csiphy2
>>>> +      - const: csiphy3
>>>> +      - const: vfe0
>>>> +      - const: vfe1
>>>> +      - const: vfe2
>>>> +      - const: vfe_lite
>>>> +
>>>> +  interconnects:
>>>> +    maxItems: 4
>>>> +
>>>> +  interconnect-names:
>>>> +    items:
>>>> +      - const: ahb
>>>> +      - const: hf_mnoc
>>>> +      - const: sf_mnoc
>>>> +      - const: sf_icp_mnoc
>>>
>>> Please remove sf_mnoc and sf_icp_mnoc, they are not needed for enabling
>>> IP to produce raw images, and one day you may use them somewhere else.
>>
>> Ack, will give it a try.
> 
> Disagree with this.
> 
> See the Kanaapali patches. I'm asking new submissions to be as complete
> as possible, instead of limiting the hardware description to the RDI.
> 
> So listing the ICP noc is the right thing to do.
> 
> So please include register banks for
> 
> - bps
> - cdm
> - icp
> - ipe
> - jpeg
> - lrme

This suggests to get a DT backward compatibility lock forever, which makes it
a very bad advice, which is favourable for just the single interested party,
which offers an alternative to the upstream CAMSS.

Anybody who wants to get support of any CAMSS ISP functionality above RAW
images shall not add anything unrelated and unsupported.

The asked inclusion shall be done later on safely, if ever needed.

>>>
>>>> +
>>>> +  iommus:
>>>> +    maxItems: 4
>>>> +
>>>> +  power-domains:
>>>> +    items:
>>>> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
>>>> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
>>>> +      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
>>>> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
>>>> +
>>>> +  power-domain-names:
>>>> +    items:
>>>> +      - const: top
>>>> +      - const: ife0
>>>> +      - const: ife1
>>>> +      - const: ife2
>>>
>>> Note that the list of items and the list of the item descriptions do not
>>> correspond to each other. Titan Top GDSC shall be at the end.
>>
>> In the v1 the comment was that top can now be put on top (because a
>> limitation in the driver was fixed). But yes, forgot to modify
>> power-domains description. Will fix.
>>
>>>
>>>> +
>>>> +  vdd-csiphy-0p9-supply:
>>>> +    description:
>>>> +      Phandle to a 0.9V regulator supply to a PHY.
>>>> +
>>>> +  vdd-csiphy-1p25-supply:
>>>> +    description:
>>>> +      Phandle to a 1.25V regulator supply to a PHY.
>>>> +
>>>
>>> Please reference to the schematics or SoC TRM, does SM6350 SoC
>>> have different pads to get supplies to different CSIPHYx IPs?
>>>
>>> If so, then please provide hardware properties to get a proper
>>> correspondence between supplies and CSIPHYx, and make all these
>>> properties optional.
>>
>> I shared the names in replies to v1.
>>
>> * VDD_CAMSS_PLL_0P9 - Camera SS PLL 0.9 V circuits
>>       (not referenced in downstream kernel, connected to vreg_s5a in
>>       schematics, which is MX)
>> * VDD_A_CSI_x_0P9 - MIPI CSIx 0.9 V circuits
>>       With pad names VDD_A_CSI_0_0P9 to VDD_A_CSI_3_0P9
>> * VDD_A_CSI_x_1P25 - MIPI CSIx 1.25 V circuits
>>       With pad names VDD_A_CSI_0_1P25 to VDD_A_CSI_3_1P25
> 

So, if to follow SM8650 CAMSS, the properties shall be:

* vdd-csiphy0-0p9-supply,
* vdd-csiphy0-1p2-supply,
* vdd-csiphy1-0p9-supply,
* vdd-csiphy1-1p2-supply,
* vdd-csiphy2-0p9-supply,
* vdd-csiphy2-1p2-supply,
* vdd-csiphy3-0p9-supply,
* vdd-csiphy3-1p2-supply,

and all of them are optional obviously.

This way you may get a future support of proper CSIPHY separation from
the already overbloated CAMSS device tree node.

> I'm fine with your proposed rail names, they appear to correspond to the
> voltage values in the docs.
> 
>>
>>>
>>>> +  ports:
>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>> +
>>>> +    description:
>>>> +      CSI input ports.
>>>> +
>>>> +    patternProperties:
>>>> +      "^port@[0-3]$":
>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>> +        unevaluatedProperties: false
>>>> +
>>>> +        description:
>>>> +          Input port for receiving CSI data from a CSIPHY.
>>>> +
>>>> +        properties:
>>>> +          endpoint:
>>>> +            $ref: video-interfaces.yaml#
>>>> +            unevaluatedProperties: false
>>>> +
>>>> +            properties:
>>>> +              data-lanes:
>>>> +                minItems: 1
>>>> +                maxItems: 4
>>>> +
>>>> +              bus-type:
>>>> +                enum:
>>>> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>>>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>>>> +
>>>> +            required:
>>>> +              - data-lanes
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - reg-names
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - interrupts
>>>> +  - interrupt-names
>>>> +  - interconnects
>>>> +  - interconnect-names
>>>> +  - iommus
>>>> +  - power-domains
>>>> +  - power-domain-names
>>>> +  - vdd-csiphy-0p9-supply
>>>> +  - vdd-csiphy-1p25-supply
>>>
>>> When a change to add CSIPHYx specific supplies is done, please remove
>>> *-supply properties from the list of the requred ones.
>>
>> Is this pending some other change that will be posted? Or what do you mean?
> 
> He means in the current CSIPHY dt its not possible to require these
> properties.
> 
>>
>>>
>>>> +  - ports
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
>>>> +    #include <dt-bindings/clock/qcom,sm6350-camcc.h>
>>>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>>>> +    #include <dt-bindings/interconnect/qcom,sm6350.h>
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/media/video-interfaces.h>
>>>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>>>> +
>>>> +    soc {
>>>> +        #address-cells = <2>;
>>>> +        #size-cells = <2>;
>>>> +
>>>> +        isp@acb3000 {
>>>> +            compatible = "qcom,sm6350-camss";
>>>> +
>>>> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
>>>> +                  <0x0 0x0acba000 0x0 0x1000>,
>>>> +                  <0x0 0x0acc1000 0x0 0x1000>,
>>>> +                  <0x0 0x0acc8000 0x0 0x1000>,
>>>> +                  <0x0 0x0ac65000 0x0 0x1000>,
>>>> +                  <0x0 0x0ac66000 0x0 0x1000>,
>>>> +                  <0x0 0x0ac67000 0x0 0x1000>,
>>>> +                  <0x0 0x0ac68000 0x0 0x1000>,
>>>> +                  <0x0 0x0acaf000 0x0 0x4000>,
>>>> +                  <0x0 0x0acb6000 0x0 0x4000>,
>>>> +                  <0x0 0x0acbd000 0x0 0x4000>,
>>>> +                  <0x0 0x0acc4000 0x0 0x4000>;
>>>> +            reg-names = "csid0",
>>>> +                        "csid1",
>>>> +                        "csid2",
>>>> +                        "csid_lite",
>>>> +                        "csiphy0",
>>>> +                        "csiphy1",
>>>> +                        "csiphy2",
>>>> +                        "csiphy3",
>>>> +                        "vfe0",
>>>> +                        "vfe1",
>>>> +                        "vfe2",
>>>> +                        "vfe_lite";
>>>> +
>>>> +            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>>>
>>> I believe this clock is critical, and it is set so in the SM6350 GCC driver,
>>> therefore it should not be added here.
>>
>> True, gcc_camera_ahb_clk has CLK_IS_CRITICAL in gcc-sm6350.c
> 
> DT describes hardware, not the happenstance of Linux driver setup.
> 
> On that basis omitting <&gcc GCC_CAMERA_AHB_CLK> from the clock list is
> not correct.

This has been already discussed, an enumerous amount of Qualcomm/MSM
specific resourced like clocks enabled in ABL, Linux etc. are considered
critical and not described in the dtb.

> 
> Because being bornign, can I then reuse this DT in FreeBSD ? No I cannot
> because it won't describe hardware it will desscirbe Linux-DT which
> ain't the same thing.

Yes, you can reuse it in FreeBSD, because bug-free FreeBSD sets critical
resources as critical and always enabled.

>>>
>>> Multiple CAMCC drivers define some of the clocks as "critical" and always
>>> enabled, a misconfiguration in this area may cause the reported warning.
>>
>> Will try to remove it then.
> 
> I really object to that. DT is a hardware description. Listing the
> clocks here does no harm and is factually accurate, which again is the
> point of DT.

Here you should argue with linux-arm-msm maintainers, it's not something
new.

>>
>>>
>>>> +                     <&gcc GCC_CAMERA_AXI_CLK>,
>>>> +                     <&camcc CAMCC_SOC_AHB_CLK>,
>>>> +                     <&camcc CAMCC_CAMNOC_AXI_CLK>,
>>>> +                     <&camcc CAMCC_CORE_AHB_CLK>,
>>>> +                     <&camcc CAMCC_CPAS_AHB_CLK>,
>>>> +                     <&camcc CAMCC_CSIPHY0_CLK>,
>>>> +                     <&camcc CAMCC_CSI0PHYTIMER_CLK>,
>>>> +                     <&camcc CAMCC_CSIPHY1_CLK>,
>>>> +                     <&camcc CAMCC_CSI1PHYTIMER_CLK>,
>>>> +                     <&camcc CAMCC_CSIPHY2_CLK>,
>>>> +                     <&camcc CAMCC_CSI2PHYTIMER_CLK>,
>>>> +                     <&camcc CAMCC_CSIPHY3_CLK>,
>>>> +                     <&camcc CAMCC_CSI3PHYTIMER_CLK>,
>>>> +                     <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
>>>> +                     <&camcc CAMCC_IFE_0_AXI_CLK>,
>>>> +                     <&camcc CAMCC_IFE_0_CLK>,
>>>> +                     <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
>>>> +                     <&camcc CAMCC_IFE_0_CSID_CLK>,
>>>> +                     <&camcc CAMCC_IFE_1_AXI_CLK>,
>>>> +                     <&camcc CAMCC_IFE_1_CLK>,
>>>> +                     <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
>>>> +                     <&camcc CAMCC_IFE_1_CSID_CLK>,
>>>> +                     <&camcc CAMCC_IFE_2_AXI_CLK>,
>>>> +                     <&camcc CAMCC_IFE_2_CLK>,
>>>> +                     <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
>>>> +                     <&camcc CAMCC_IFE_2_CSID_CLK>,
>>>> +                     <&camcc CAMCC_IFE_LITE_CLK>,
>>>> +                     <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
>>>> +                     <&camcc CAMCC_IFE_LITE_CSID_CLK>;
>>>> +            clock-names = "cam_ahb_clk",
>>>> +                          "cam_axi",
>>>> +                          "soc_ahb",
>>>> +                          "camnoc_axi",
>>>> +                          "core_ahb",
>>>> +                          "cpas_ahb",
>>>> +                          "csiphy0",
>>>> +                          "csiphy0_timer",
>>>> +                          "csiphy1",
>>>> +                          "csiphy1_timer",
>>>> +                          "csiphy2",
>>>> +                          "csiphy2_timer",
>>>> +                          "csiphy3",
>>>> +                          "csiphy3_timer",
>>>> +                          "slow_ahb_src",
>>>> +                          "vfe0_axi",
>>>> +                          "vfe0",
>>>> +                          "vfe0_cphy_rx",
>>>> +                          "vfe0_csid",
>>>> +                          "vfe1_axi",
>>>> +                          "vfe1",
>>>> +                          "vfe1_cphy_rx",
>>>> +                          "vfe1_csid",
>>>> +                          "vfe2_axi",
>>>> +                          "vfe2",
>>>> +                          "vfe2_cphy_rx",
>>>> +                          "vfe2_csid",
>>>> +                          "vfe_lite",
>>>> +                          "vfe_lite_cphy_rx",
>>>> +                          "vfe_lite_csid";
>>>> +
>>>> +            interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                         <GIC_SPI 717 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                         <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                         <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                         <GIC_SPI 718 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                         <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
>>>
>>> Interrupt types shall be IRQ_TYPE_EDGE_RISING.
>>
>> Ack
>>
>>>
>>>> +            interrupt-names = "csid0",
>>>> +                              "csid1",
>>>> +                              "csid2",
>>>> +                              "csid_lite",
>>>> +                              "csiphy0",
>>>> +                              "csiphy1",
>>>> +                              "csiphy2",
>>>> +                              "csiphy3",
>>>> +                              "vfe0",
>>>> +                              "vfe1",
>>>> +                              "vfe2",
>>>> +                              "vfe_lite";
>>>> +
>>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
>>>> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
>>>> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
>>>> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
>>>> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
>>>> +                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
>>>> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
>>>> +            interconnect-names = "ahb",
>>>> +                                 "hf_mnoc",
>>>> +                                 "sf_mnoc",
>>>> +                                 "sf_icp_mnoc";
>>>> +
>>>> +            iommus = <&apps_smmu 0x820 0xc0>,
>>>> +                     <&apps_smmu 0x840 0x0>,
>>>> +                     <&apps_smmu 0x860 0xc0>,
>>>> +                     <&apps_smmu 0x880 0x0>;
>>>> +
>>>> +            power-domains = <&camcc TITAN_TOP_GDSC>
>>>
>>> It should be the last one in the list, if the settled practice is followed.
>>
>> See above.
>>
>>>
>>>> +                            <&camcc IFE_0_GDSC>,
>>>> +                            <&camcc IFE_1_GDSC>,
>>>> +                            <&camcc IFE_2_GDSC>;
>>>> +            power-domain-names = "top",
>>>> +                                 "ife0",
>>>> +                                 "ife1",
>>>> +                                 "ife2";
>>>> +
>>>> +            vdd-csiphy-0p9-supply = <&vreg_l18a>;
>>>> +            vdd-csiphy-1p25-supply = <&vreg_l22a>;
>>>> +
>>>> +            ports {
>>>> +                #address-cells = <1>;
>>>> +                #size-cells = <0>;
>>>> +
>>>> +                port@0 {
>>>> +                    reg = <0>;
>>>> +                    csiphy0_ep: endpoint {
>>>
>>> An empty line before a child node is always needed.
>>
>> Ack
>>
>>>
>>>> +                        data-lanes = <0 1 2 3>;
>>>> +                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>>>> +                        remote-endpoint = <&sensor_ep>;
>>>> +                    };
>>>> +                };
>>>> +            };
>>>> +        };
>>>> +    };
>>>>
>>
> 

-- 
Best wishes,
Vladimir

