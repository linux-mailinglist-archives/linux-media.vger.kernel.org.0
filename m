Return-Path: <linux-media+bounces-49221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D43CD2938
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 07:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C10573019857
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 06:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B2029346F;
	Sat, 20 Dec 2025 06:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OhUeYW3X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E399AEEB3
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 06:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766213163; cv=none; b=E0rBDozJ12lTkBq/6DOlmMFxuhqisHj8IyjR4s5lHsAklL+rl4qCqrxmYZxEj3TNw0x0I+9Ch/c5N1a1/0dvHA/QljPbjV5rynzWMQIf2uaWMcXvWmglqkkIM3wjqXXL42Pzp8o14Ml5roYYhRcRN/Y7yvfPGKZ/wpJ4Ypl6VNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766213163; c=relaxed/simple;
	bh=jrDXZfIdr3gSln4yJsBbyeVlwe0BKlX79lTTpKbm1xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lExpToEm8Vtrx2PkCtZO+g+CAKcR2Qw5LJAh4KfdHVsufH90cEd+vTMT7OuZxYUCKBBFt5oHrniP+gWprVI6ZtyE5gTbxbrXrpaNQJf/FMJrlcgXXAWKMIQPC2npVKDoE2qWltWeETv7OZZMfOtADrAoKOcSRvJoIpaWhZwGNO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OhUeYW3X; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477770019e4so21359395e9.3
        for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 22:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766213159; x=1766817959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7xaCKKsfDDPPJX/k6ru1B/GULEocKYrJfWpHmAeP00Q=;
        b=OhUeYW3XSf1qPFry8W0M9hhnq5JVnvmIPu8P1hW6PUUQAOS+PS6wEbGxugYOXKi3Yw
         uGKS7c9XD5EB3WGTjsYENUcCn+4h56KV+Xr9Ra6706KshMxHHxiiCCWYAkPUrdTal6yu
         6NNXaghHcrcICaqHaXMqFR+V8OY8crZVZ4wGQTTaNGdgUPEfmH0MZX3O6fpnsGZEIpUJ
         GbnfgzLunoOdpFruC7VgjUUe9AyECqZyY9uHclZmoSPBxuvGa0Xhj8EJ9AvcBeFxkxrx
         RQjhSN096qxraJ9i1K/q7RJ5fQ01E/NariJs6bVv2btWmO8AcXFanNmpDihxzzZ7W42k
         pNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766213159; x=1766817959;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xaCKKsfDDPPJX/k6ru1B/GULEocKYrJfWpHmAeP00Q=;
        b=Ab3yH9o0MAcGxfU9/R7WF1dRLtBbyKbYJvfTKzpsjlndeslsEma0zwlrSmX/sUi019
         B4XnXwkt36U+/HHP3DrelxpOaFsd3/JgYhuUdwqI7yKykM1eXqUAt+lyWBiPuLcEva4R
         VC+48ocj/270aTy3o/c0RMvBfHtw12QZPemgFxazQA7sFqTm5FeXY16iA0MT3vOvXZqd
         Zi+fUPgkJ91ggMo7b3BjBOR3bpnj7lJDDfrXwmt5W3CtLfP4LKeIUUIjCTznecUOaUD8
         018h4kIwR78SYFOI+Exn2qWW//VPhe52cUWS2vj5slcC3um6SPLeUNDopXlVx6E0JRCa
         +rnA==
X-Forwarded-Encrypted: i=1; AJvYcCXuyVOwdXoFu7dX7s4b89H9hK0xcCUTpxP6s5DL+ROzetQ7FuJUOlr3rgP2DNc+G90xkMSjTTKQRLmm8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiQ9vxsrUO6GwZUKMmdUo0VighnWkLDQROtQY51die7mq0Zc0N
	0Znjb6oFRwb0FEjY8VbWDDJ7H8neYI+Ahk28iPxWfFAYsmg8gD78gG7oyiFrUwIKY2s=
X-Gm-Gg: AY/fxX6HQsGS2ar1oPl9pVgaRjJhSuibbEhpL22mVfzZm00ETCp+6m14+F/zf09hO4r
	zDFl418K/fmLuYQXgXgs9wsCFlncw4s3f4sfs/bxaTu0tnWkAim2S9thKkcJVPBKGqk3lEs3uzy
	Vzr1HhdXQXCiFu1hpIz6DKWWFfELqL4GftbeMv+voL7BjYbERFGDq5YZOvGOsNBUWNDaM8Rech3
	j6PtQum791SILVfp0Gn6gYJcA3VGP3vEEk3aSoKf0w6wr9RpITbWXOL1GaP5KxcIQsHFohcP5rz
	rflf2vVSZJ7uhqYcVd0dip9lBymypVg0cKSqMIm5ZkjqyxwvzDFnDNUQ2zESE+A5xh8hd8PlzHi
	7XldrftgiaY5RvYTXxFxU//iUB8EEL5NdA3PzOQWLeSsH1OvmUrt3DXx4f5gBNf38s94wcqSMCo
	x+dh0Yghm5Np2W3BHFnRoebiKHa/FrSm2bI3XABkqSa/PynhzHXZ9x
X-Google-Smtp-Source: AGHT+IH736wO1TAaLYE00KZ1NFWRrPVoRoApOLJJhVC03/nxlFCLLZ1cIzfeqGq6RUcgKOToAE8dgg==
X-Received: by 2002:a05:600c:828c:b0:479:3a87:2092 with SMTP id 5b1f17b1804b1-47d19598e86mr38158915e9.36.1766213159206;
        Fri, 19 Dec 2025 22:45:59 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a49315sm52528055e9.2.2025.12.19.22.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 22:45:57 -0800 (PST)
Message-ID: <3414c65f-6019-4d30-9df7-4ca2db4e0c6c@linaro.org>
Date: Sat, 20 Dec 2025 06:45:56 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Luca Weiss <luca.weiss@fairphone.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
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
 <d7dfeb7e-c0b2-426e-8572-023715c33674@linaro.org>
 <272d039c-25a0-4db5-96a3-c28907882cd2@linaro.org>
 <DF291XT4MOYA.3OVO84CAJKJ5R@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <DF291XT4MOYA.3OVO84CAJKJ5R@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/12/2025 14:06, Luca Weiss wrote:
> Hi Bryan,
> 
> On Sun Nov 16, 2025 at 3:05 PM CET, Bryan O'Donoghue wrote:
>> On 14/11/2025 17:06, Vladimir Zapolskiy wrote:
>>> On 11/14/25 18:09, Bryan O'Donoghue wrote:
>>>> On 14/11/2025 13:06, Luca Weiss wrote:
>>>>> Hi Vladimir,
>>>>>
>>>>> On Fri Nov 14, 2025 at 1:40 PM CET, Vladimir Zapolskiy wrote:
>>>>>> Hi Luca.
>>>>>>
>>>>>> On 11/14/25 13:15, Luca Weiss wrote:
>>>>>>> Add bindings for the Camera Subsystem on the SM6350 SoC.
>>>>>>>
>>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>>> ---
>>>>>>>      .../bindings/media/qcom,sm6350-camss.yaml          | 349 ++++++
>>>>>>> +++++++++++++++
>>>>>>>      1 file changed, 349 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-
>>>>>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6350-
>>>>>>> camss.yaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..d812b5b50c05
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
>>>>>>> @@ -0,0 +1,349 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/media/qcom,sm6350-camss.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: Qualcomm SM6350 Camera Subsystem (CAMSS)
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Luca Weiss <luca.weiss@fairphone.com>
>>>>>>> +
>>>>>>> +description:
>>>>>>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm
>>>>>>> platforms.
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    const: qcom,sm6350-camss
>>>>>>> +
>>>>>>> +  reg:
>>>>>>> +    maxItems: 12
>>>>>>> +
>>>>>>> +  reg-names:
>>>>>>> +    items:
>>>>>>> +      - const: csid0
>>>>>>> +      - const: csid1
>>>>>>> +      - const: csid2
>>>>>>> +      - const: csid_lite
>>>>>>> +      - const: csiphy0
>>>>>>> +      - const: csiphy1
>>>>>>> +      - const: csiphy2
>>>>>>> +      - const: csiphy3
>>>>>>> +      - const: vfe0
>>>>>>> +      - const: vfe1
>>>>>>> +      - const: vfe2
>>>>>>> +      - const: vfe_lite
>>>>>>> +
>>>>>>> +  clocks:
>>>>>>> +    maxItems: 30
>>>>>>> +
>>>>>>> +  clock-names:
>>>>>>> +    items:
>>>>>>> +      - const: cam_ahb_clk
>>>>>>> +      - const: cam_axi
>>>>>>> +      - const: soc_ahb
>>>>>>> +      - const: camnoc_axi
>>>>>>> +      - const: core_ahb
>>>>>>> +      - const: cpas_ahb
>>>>>>> +      - const: csiphy0
>>>>>>> +      - const: csiphy0_timer
>>>>>>> +      - const: csiphy1
>>>>>>> +      - const: csiphy1_timer
>>>>>>> +      - const: csiphy2
>>>>>>> +      - const: csiphy2_timer
>>>>>>> +      - const: csiphy3
>>>>>>> +      - const: csiphy3_timer
>>>>>>> +      - const: slow_ahb_src
>>>>>>> +      - const: vfe0_axi
>>>>>>> +      - const: vfe0
>>>>>>> +      - const: vfe0_cphy_rx
>>>>>>> +      - const: vfe0_csid
>>>>>>> +      - const: vfe1_axi
>>>>>>> +      - const: vfe1
>>>>>>> +      - const: vfe1_cphy_rx
>>>>>>> +      - const: vfe1_csid
>>>>>>> +      - const: vfe2_axi
>>>>>>> +      - const: vfe2
>>>>>>> +      - const: vfe2_cphy_rx
>>>>>>> +      - const: vfe2_csid
>>>>>>> +      - const: vfe_lite
>>>>>>> +      - const: vfe_lite_cphy_rx
>>>>>>> +      - const: vfe_lite_csid
>>>>>>
>>>>>> The sorting order of this list does not follow the sorting order
>>>>>> accepted
>>>>>> in the past.
>>>>>
>>>>> What file should I best reference?
>>>>
>>>> Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
>>>>
>>>>>>
>>>>>> I'm very sorry for the vagueness, but I can not pronounce the accepted
>>>>>> sorting order name, because it triggers people.
>>>>>>
>>>>>>> +
>>>>>>> +  interrupts:
>>>>>>> +    maxItems: 12
>>>>>>> +
>>>>>>> +  interrupt-names:
>>>>>>> +    items:
>>>>>>> +      - const: csid0
>>>>>>> +      - const: csid1
>>>>>>> +      - const: csid2
>>>>>>> +      - const: csid_lite
>>>>>>> +      - const: csiphy0
>>>>>>> +      - const: csiphy1
>>>>>>> +      - const: csiphy2
>>>>>>> +      - const: csiphy3
>>>>>>> +      - const: vfe0
>>>>>>> +      - const: vfe1
>>>>>>> +      - const: vfe2
>>>>>>> +      - const: vfe_lite
>>>>>>> +
>>>>>>> +  interconnects:
>>>>>>> +    maxItems: 4
>>>>>>> +
>>>>>>> +  interconnect-names:
>>>>>>> +    items:
>>>>>>> +      - const: ahb
>>>>>>> +      - const: hf_mnoc
>>>>>>> +      - const: sf_mnoc
>>>>>>> +      - const: sf_icp_mnoc
>>>>>>
>>>>>> Please remove sf_mnoc and sf_icp_mnoc, they are not needed for enabling
>>>>>> IP to produce raw images, and one day you may use them somewhere else.
>>>>>
>>>>> Ack, will give it a try.
>>>>
>>>> Disagree with this.
>>>>
>>>> See the Kanaapali patches. I'm asking new submissions to be as complete
>>>> as possible, instead of limiting the hardware description to the RDI.
>>>>
>>>> So listing the ICP noc is the right thing to do.
>>>>
>>>> So please include register banks for
>>>>
>>>> - bps
>>>> - cdm
>>>> - icp
>>>> - ipe
>>>> - jpeg
>>>> - lrme
>>>
>>> This suggests to get a DT backward compatibility lock forever,
>>
>> I'm not entirely sure what this comment means.
>>
>> The objective here is to get a full and complete DT describing camera
>> hardware that can be consumed by
>>
>> - CAMSS RDI
>> - CAMSS RDI + future goodness
>> - FreeBSD
>> - Any other DT consumer of upstream data perhaps even CamX
>> which
>>> makes it
>>> a very bad advice, which is favourable for just the single interested
>>> party,
>>> which offers an alternative to the upstream CAMSS.
>>>
>>> Anybody who wants to get support of any CAMSS ISP functionality above RAW
>>> images shall not add anything unrelated and unsupported.
>>>
>>> The asked inclusion shall be done later on safely, if ever needed.
>>
>> As I say the objective is to fully describe the hardware in DT, not to
>> describe only the RDI path.
> 
> So far I've gotten this diff on top of v2, not quite sure how to
> continue further...
> 
> Please advice how to turn these resources into a usable dt-binding.
> 
> I'm also a bit worried that it'll be subtly wrong due to all the
> additions being impossible to test for me.
> 
> Regards
> Luca
> 
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
> index d812b5b50c05..340bf03ffe91 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
> @@ -203,6 +202,23 @@ examples:
>                     <0x0 0x0acb6000 0x0 0x4000>,
>                     <0x0 0x0acbd000 0x0 0x4000>,
>                     <0x0 0x0acc4000 0x0 0x4000>;
> +
> +                  // ICP ?? == qcom,cam-a5 ?
> +               // <0x0 0x0ac00000 0x0 0x6000>, // ? a5_qgic
> +               // <0x0 0x0ac10000 0x0 0x8000>, // ? a5_sierra
> +               // <0x0 0x0ac18000 0x0 0x3000>; // ? a5_csr
> +
> +               // <0x0 0x0ac87000 0x0 0xa000> // "ipe" IPE (Image Processing Engine)
> +               // <0x0 0x0ac6f000 0x0 0x8000> // "bps"? BPS
> +               // <0x0 0x0ac6b000 0x0 0xa00> // "lrme"? LRME
> +
> +               // <0x0 0x0ac40000 0x0 0x1000>, // ? CAM CPAS: cam_cpas_top
> +               // <0x0 0x0ac42000 0x0 0x4600>, // ? CAM CPAS: cam_camnoc
> +               // <0x0 0x01fc0000 0x0 0x40000>; // ? CAM CPAS: core_top_csr_tcsr
> +
> +               // <0x0 0x0ac52000 0x0 0x4000> // "jpeg_dma" JPEG DMA & Downscaler
> +               // <0x0 0x0ac4e000 0x0 0x4000> // "jpeg_enc" JPEG Encoder
> +               // <0x0 0x0ac48000 0x0 0x1000> // ? CPAS CDM

Looks correct.

>               reg-names = "csid0",
>                           "csid1",
>                           "csid2",
> @@ -216,8 +232,12 @@ examples:
>                           "vfe2",
>                           "vfe_lite";
>   
> -            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> -                     <&gcc GCC_CAMERA_AXI_CLK>,
> +            // CAMCC_FAST_AHB_CLK_SRC + CAMCC_ICP_CLK for qcom,cam-a5
> +            // CAMCC_IPE_0_AHB_CLK + CAMCC_IPE_0_AREG_CLK + CAMCC_IPE_0_AXI_CLK + CAMCC_IPE_0_CLK for qcom,cam-ipe
> +            // CAMCC_BPS_AHB_CLK + CAMCC_BPS_AREG_CLK + CAMCC_BPS_AXI_CLK + CAMCC_BPS_CLK for qcom,cam-bps
> +            // CAMCC_JPEG_CLK for qcom,cam_jpeg_enc / qcom,cam_jpeg_dma
> +            // CAMCC_LRME_CLK for qcom,lrme
> +            clocks = <&gcc GCC_CAMERA_AXI_CLK>,
>                        <&camcc CAMCC_SOC_AHB_CLK>,
>                        <&camcc CAMCC_CAMNOC_AXI_CLK>,
>                        <&camcc CAMCC_CORE_AHB_CLK>,
> @@ -246,8 +266,7 @@ examples:
>                        <&camcc CAMCC_IFE_LITE_CLK>,
>                        <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
>                        <&camcc CAMCC_IFE_LITE_CSID_CLK>;
> -            clock-names = "cam_ahb_clk",
> -                          "cam_axi",
> +            clock-names = "cam_axi",
>                             "soc_ahb",
>                             "camnoc_axi",
>                             "core_ahb",
> @@ -277,18 +296,24 @@ examples:
>                             "vfe_lite_cphy_rx",
>                             "vfe_lite_csid";
>   
> -            interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 717 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 718 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
> +            // 469 for cpas-cdm
> +            // 463 for qcom,cam-a5
> +            // 474 for qcom,cam_jpeg_enc
> +            // 475 for qcom,cam_jpeg_dma
> +            // 476 for qcom,lrme
> +            // 459 for qcom,cam-cpas
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 717 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 473 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 718 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 472 IRQ_TYPE_EDGE_RISING>;
>               interrupt-names = "csid0",
>                                 "csid1",
>                                 "csid2",
> @@ -302,6 +327,9 @@ examples:
>                                 "vfe2",
>                                 "vfe_lite";
>   
> +            // MASTER_CAMNOC_HF0_UNCOMP -> SLAVE_CAMNOC_UNCOMP ?
> +            // MASTER_CAMNOC_SF_UNCOMP -> SLAVE_CAMNOC_UNCOMP ?
> +            // MASTER_CAMNOC_ICP_UNCOMP -> SLAVE_CAMNOC_UNCOMP ?
>               interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
>                                &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>                               <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> @@ -315,12 +343,18 @@ examples:
>                                    "sf_mnoc",
>                                    "sf_icp_mnoc";
>   
> +            // <&apps_smmu 0xd40 0x20> & <&apps_smmu 0xd60 0x20> for lrme
> +            // <&apps_smmu 0xd00 0x20> & <&apps_smmu 0xd20 0x20> for jpeg
> +            // <&apps_smmu 0xca2 0x0> & <&apps_smmu 0xc40 0x20> & <&apps_smmu 0xc60 0x20> & <&apps_smmu 0xcc0 0x20> & <&apps_smmu 0xce0 0x20> for icp
> +            // <&apps_smmu 0xc80 0x0> for cpas-cdm0
>               iommus = <&apps_smmu 0x820 0xc0>,
>                        <&apps_smmu 0x840 0x0>,
>                        <&apps_smmu 0x860 0xc0>,
>                        <&apps_smmu 0x880 0x0>;
>   
> -            power-domains = <&camcc TITAN_TOP_GDSC>
> +            // ipe_0_gdsc for qcom,cam-ipe
> +            // bps_gdsc for qcom,cam-bps
> +            power-domains = <&camcc TITAN_TOP_GDSC>,
>                               <&camcc IFE_0_GDSC>,
>                               <&camcc IFE_1_GDSC>,
>                               <&camcc IFE_2_GDSC>;
> @@ -329,8 +363,14 @@ examples:
>                                    "ife1",
>                                    "ife2";
>   
> -            vdd-csiphy-0p9-supply = <&vreg_l18a>;
> -            vdd-csiphy-1p25-supply = <&vreg_l22a>;
> +            vdd-csiphy0-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy0-1p25-supply = <&vreg_l22a>;
> +            vdd-csiphy1-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy1-1p25-supply = <&vreg_l22a>;
> +            vdd-csiphy2-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy2-1p25-supply = <&vreg_l22a>;
> +            vdd-csiphy3-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy3-1p25-supply = <&vreg_l22a>;
>   
>               ports {
>                   #address-cells = <1>;
> 
These look right to me, consistent with what I see downstream.

---
bod

