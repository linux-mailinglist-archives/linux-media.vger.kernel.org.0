Return-Path: <linux-media+bounces-45374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B05AC00A94
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 13:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F84D19A323B
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956DA30DEA0;
	Thu, 23 Oct 2025 11:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DG6XPpgK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73958302CC4
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 11:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218044; cv=none; b=PS+MkSnYW00JqPTGzuJ5HnHMWJh6AZN/v9fcGFfIPbX5kjdiOjH8F7Biej0bi58vE4ef1DGIPxAAI4IapOtAQ50Ubyg8OtJlSQZXD8vqBgM4lLzY8HwG/g8LlT07O8YNNhBAmEISQvq1RWs7tUb2J6mp/4bcmVobZ56iJY5GbGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218044; c=relaxed/simple;
	bh=Xd2oFztkHA1Q2+4oN13MbfhKhMmhNS3MhkJQtZ1wae4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELfyPheMj2NpTG4vrfPlOr2oQzvAsk8vTHEmFvvJGyL60Gz1nmqGnlmOEQdjpsLiU6idzk3a6XVKhesMx7L3UtVyAgDkrD7usWY1t6Z9+gS9meu2z7dfoYel+BjwSUSX9DO7y5Kb0dAQnOfIZPYiEx8Lj+TFi5XGTSSelpzUmVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DG6XPpgK; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57e3cad25e8so196838e87.1
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 04:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761218039; x=1761822839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NnriRC9eaGPaTyOosu675gl9jkYjYRUomRRP0nsD1w=;
        b=DG6XPpgKrSdWg/qJ78mFPDnklvXWev/pwkWLJOKXf90/xKky/TeWTCeOKwMzNwAyGC
         Fnx/LoYKCLfeMA4iE9EysX4Yc073NyZgyQ0F9m4wtEbQDputNK00bhP6GJVWn1WVFaeB
         9Rl/7VSgqHW+ftOoX78UEL1tY5kjf9LZTB1sUNm6CjEk+/FC7ansnmuWhbKdqgtl4yga
         q0ceNYpU7gzHZoxW3MqVWfxkdwrE39iQTnxJSPstAABQvOA4s3/VTC3tl5E3epIiY4Sw
         4kyBlkRM3LmvHdkwfkxWEDUXiopgU4MSAmABCwKUXGDDnY7Y1spN4DvAFXmke4fL0pFX
         OHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218039; x=1761822839;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4NnriRC9eaGPaTyOosu675gl9jkYjYRUomRRP0nsD1w=;
        b=lMoW4cTi28P7kMpsi0H82sr5aPcpUFkb7RLkyIvtyAePoS0YQJ4cPN58h1rXUyt4f5
         5Eo9nzU9Y1tcYjDVGyEhUvPHgAqX/i0jC49XBvgoGrBMv4mgaP7WTcftXq4+GmcYCe11
         wP+IN0fs46kAuQx5PkH5T0b+GD5lQcI0E1mgXh2aMnGxzjbW6wXuqp628bi9Sw9hTv7I
         Y4Sc6P2V18UXpF09W/y/Euc84mg74P4Pg7/iV09mZXrZNRQedkE/SxGVTrFshgFh9AO3
         bugWGOIBVrfh9xRvBB0xHmWF5Ej9VdCuxWABicTsUhK2omz4oBlqrkYCOpdkah/pJZkx
         94HA==
X-Forwarded-Encrypted: i=1; AJvYcCUfkDK3Or1bfJYEaRYfkFhHXvZDGBiRheN8jfZ7WbFGmhAh1gKAR6v8jL5JzlqBj/dcDEpM/XLo7OpSqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEDqCkyR3wlyxs6kYOU4Mmib4mra/DpFFb1BHrjFlEW0vsUckj
	waZW/HmZsiIcYO3SYtV3KdD1famP5FN8hrhZA0MSsYuPuxPSdnz53IxCGjGoBHAMBsA=
X-Gm-Gg: ASbGnctx+99fh7XN0U2BaQXUPnanDwZPSSvcH+sXWw2cD2w0xKzwc/TXzxTzDpMv3Dh
	sfbydyTatPbOeGadSvT5WS9JDkZGh4r6BpI1RqoJT5M8jYEOk4OHUeEwT5qRIJD13Vm0DxZnTd/
	8Jo8S67zh8ddOs+oF7dPXhOZGiUpuquuLxl0tWoo6Aq2a08JNWYmu9Y/xQEFhZkJOaFuI03k7Db
	YPlVaC5o5v3CHTafr+M6NbK2ZvEx6lyBkFjoCSzp6WgJMogKRcIYvb0ZXgDygnVLe07U03JVM72
	Wb24L9TirZkQPWJ5gkRiVDN95O35dt4b8CARPkR9ildyo9LhPbUTuL5AmuUu3mD8h1U7Wr9GQio
	9GYDpP1EdIzXlCYUH+9fHjbelpYOhKW6FV9/yQmY86k4jUugFtciXbsWyMG7sPruhE1n0ELSTYY
	KU4rSPF8BNvAA9D1Wkeku9eMrYOd/WHPNWId5AJrgjaLfodhxmbntgZcE=
X-Google-Smtp-Source: AGHT+IEzgWJvYGBcQF2ghyYuGuGA1AUq1vVSVuceN2e2JnaCFLqWBkxRqBMih2S4N5OXUxtsHRZnFQ==
X-Received: by 2002:a05:6512:b85:b0:57a:6d7d:dd74 with SMTP id 2adb3069b0e04-591ea28dc85mr1817576e87.0.1761218038545;
        Thu, 23 Oct 2025 04:13:58 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d2c8c4sm650021e87.93.2025.10.23.04.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 04:13:58 -0700 (PDT)
Message-ID: <24b6ce21-aaff-4ecd-8cd7-42df71cfd222@linaro.org>
Date: Thu, 23 Oct 2025 14:13:50 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-2-f5745ba2dff9@oss.qualcomm.com>
 <dce1018c-6165-407c-8f3d-40859cb36b11@linaro.org>
 <1d6a20d8-b011-4608-a722-a1996b366a56@oss.qualcomm.com>
 <b18fc946-a249-481a-b727-7d3e49d47f8e@linaro.org>
 <d4b8cd74-0b0a-4fc8-8ed0-a9023a516b58@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <d4b8cd74-0b0a-4fc8-8ed0-a9023a516b58@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Vijay.

On 10/23/25 07:52, Vijay Kumar Tumati wrote:
> 
> On 10/16/2025 5:27 PM, Vladimir Zapolskiy wrote:
>> On 10/17/25 02:53, Vijay Kumar Tumati wrote:
>>>
>>> On 10/15/2025 12:45 PM, Vladimir Zapolskiy wrote:
>>>> On 10/15/25 05:56, Hangxiang Ma wrote:
>>>>> Add bindings for qcom,kaanapali-camss in order to support the camera
>>>>> subsystem for Kaanapali.
>>>>>
>>>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>> ---
>>>>>     .../bindings/media/qcom,kaanapali-camss.yaml       | 494
>>>>> +++++++++++++++++++++
>>>>>     1 file changed, 494 insertions(+)
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..d04c21103cfd
>>>>> --- /dev/null
>>>>> +++
>>>>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>> @@ -0,0 +1,494 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>>>>> +
>>>>> +maintainers:
>>>>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>> +
>>>>> +description:
>>>>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm
>>>>> platforms.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: qcom,kaanapali-camss
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 16
>>>>> +
>>>>> +  reg-names:
>>>>> +    items:
>>>>> +      - const: csid0
>>>>> +      - const: csid1
>>>>> +      - const: csid2
>>>>> +      - const: csid_lite0
>>>>> +      - const: csid_lite1
>>>>> +      - const: csiphy0
>>>>> +      - const: csiphy1
>>>>> +      - const: csiphy2
>>>>> +      - const: csiphy3
>>>>> +      - const: csiphy4
>>>>> +      - const: csiphy5
>>>>> +      - const: vfe0
>>>>> +      - const: vfe1
>>>>> +      - const: vfe2
>>>>> +      - const: vfe_lite0
>>>>> +      - const: vfe_lite1
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 34
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: camnoc_nrt_axi
>>>>> +      - const: camnoc_rt_axi
>>>>> +      - const: camnoc_rt_vfe0
>>>>> +      - const: camnoc_rt_vfe1
>>>>> +      - const: camnoc_rt_vfe2
>>>>> +      - const: camnoc_rt_vfe_lite
>>>>> +      - const: cam_top_ahb
>>>>> +      - const: cam_top_fast_ahb
>>>>> +      - const: csid
>>>>> +      - const: csid_csiphy_rx
>>>>> +      - const: csiphy0
>>>>> +      - const: csiphy0_timer
>>>>> +      - const: csiphy1
>>>>> +      - const: csiphy1_timer
>>>>> +      - const: csiphy2
>>>>> +      - const: csiphy2_timer
>>>>> +      - const: csiphy3
>>>>> +      - const: csiphy3_timer
>>>>> +      - const: csiphy4
>>>>> +      - const: csiphy4_timer
>>>>> +      - const: csiphy5
>>>>> +      - const: csiphy5_timer
>>>>> +      - const: gcc_hf_axi
>>>>> +      - const: qdss_debug_xo
>>>>> +      - const: vfe0
>>>>> +      - const: vfe0_fast_ahb
>>>>> +      - const: vfe1
>>>>> +      - const: vfe1_fast_ahb
>>>>> +      - const: vfe2
>>>>> +      - const: vfe2_fast_ahb
>>>>> +      - const: vfe_lite
>>>>> +      - const: vfe_lite_ahb
>>>>> +      - const: vfe_lite_cphy_rx
>>>>> +      - const: vfe_lite_csid
>>>>
>>>> The list of 'clock-names' values is not alphanumerically sorted.
>>>>
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 16
>>>>> +  interrupt-names:
>>>>
>>>> Missing empty line to separate properties.
>>>>
>>>>> +    items:
>>>>> +      - const: csid0
>>>>> +      - const: csid1
>>>>> +      - const: csid2
>>>>> +      - const: csid_lite0
>>>>> +      - const: csid_lite1
>>>>> +      - const: csiphy0
>>>>> +      - const: csiphy1
>>>>> +      - const: csiphy2
>>>>> +      - const: csiphy3
>>>>> +      - const: csiphy4
>>>>> +      - const: csiphy5
>>>>> +      - const: vfe0
>>>>> +      - const: vfe1
>>>>> +      - const: vfe2
>>>>> +      - const: vfe_lite0
>>>>> +      - const: vfe_lite1
>>>>> +
>>>>> +  interconnects:
>>>>> +    maxItems: 2
>>>>> +
>>>>> +  interconnect-names:
>>>>> +    items:
>>>>> +      - const: ahb
>>>>> +      - const: hf_0_mnoc
>>>>
>>>> Please rename "hf_0_mnoc" to "hf_mnoc", see qcom,qcm2290-camss.yaml
>>>> etc.
>>>>
>>>>> +
>>>>> +  iommus:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  power-domains:
>>>>> +    items:
>>>>> +      - description:
>>>>> +          TFE0 GDSC - Thin Front End, Global Distributed Switch
>>>>> Controller.
>>>>> +      - description:
>>>>> +          TFE1 GDSC - Thin Front End, Global Distributed Switch
>>>>> Controller.
>>>>> +      - description:
>>>>> +          TFE2 GDSC - Thin Front End, Global Distributed Switch
>>>>> Controller.
>>>>> +      - description:
>>>>> +          Titan GDSC - Titan ISP Block Global Distributed Switch
>>>>> Controller.
>>>>> +
>>>>> +  power-domain-names:
>>>>> +    items:
>>>>> +      - const: tfe0
>>>>> +      - const: tfe1
>>>>> +      - const: tfe2
>>>>
>>>> Please remove all 'tfeX' power domains, they are not going to be
>>>> utilized
>>>> any time soon.
>>>>
>>>> When 'power-domains' list is just a single Titan GDSC,
>>>> 'power-domain-names'
>>>> property is not needed.
>>>>
>>>>> +      - const: top
>>>>> +
>>>>> +  vdda-pll-supply:
>>>>> +    description:
>>>>> +      Phandle to 1.2V regulator supply to PHY refclk pll block.
>>>>> +
>>>>> +  vdda-phy0-supply:
>>>>> +    description:
>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>> +
>>>>> +  vdda-phy1-supply:
>>>>> +    description:
>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>> +
>>>>> +  vdda-phy2-supply:
>>>>> +    description:
>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>> +
>>>>> +  vdda-phy3-supply:
>>>>> +    description:
>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>> +
>>>>> +  vdda-phy4-supply:
>>>>> +    description:
>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>> +
>>>>> +  vdda-phy5-supply:
>>>>> +    description:
>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>
>>>> What is the difference between vdda-phyX-supply properties, why do you
>>>> need so many of them, when their descriptions say they are all the
>>>> same?
>>> Each of these supply power to a specific CSIPHY and could be different
>>> based on the board architecture. But I agree that the description should
>>> probably capture that than just relying on the name.
>>>>
>>>>> +  ports:
>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>> +
>>>>> +    description:
>>>>> +      CSI input ports.
>>>>> +
>>>>> +    properties:
>>>>> +      port@0:
>>>>
>>>> Please use
>>>>
>>>>       patternProperties:
>>>>         "^port@[0-3]$":
>>>>
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        unevaluatedProperties: false
>>>>> +        description:
>>>>> +          Input port for receiving CSI data on CSI0.
>>>>> +
>>>>> +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: video-interfaces.yaml#
>>>>> +            unevaluatedProperties: false
>>>>> +
>>>>> +            properties:
>>>>> +              clock-lanes:
>>>>> +                maxItems: 1
>>>>
>>>> Please remove 'clock-lanes' property, it is non-configurable, redundant
>>>> and tends to store some irrelevant value.
>>>>
>>>>> +
>>>>> +              data-lanes:
>>>>> +                minItems: 1
>>>>> +                maxItems: 4
>>>>> +
>>>>> +              bus-type:
>>>>> +                enum:
>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>> +
>>>>> +            required:
>>>>> +              - clock-lanes
>>>>
>>>> The 'clock-lanes' property is expected to be removed.
>>>>
>>>>> +              - data-lanes
>>>>> +
>>>>> +      port@1:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        unevaluatedProperties: false
>>>>> +        description:
>>>>> +          Input port for receiving CSI data on CSI1.
>>>>> +
>>>>> +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: video-interfaces.yaml#
>>>>> +            unevaluatedProperties: false
>>>>> +
>>>>> +            properties:
>>>>> +              clock-lanes:
>>>>> +                maxItems: 1
>>>>> +
>>>>> +              data-lanes:
>>>>> +                minItems: 1
>>>>> +                maxItems: 4
>>>>> +
>>>>> +              bus-type:
>>>>> +                enum:
>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>> +
>>>>> +            required:
>>>>> +              - clock-lanes
>>>>> +              - data-lanes
>>>>> +
>>>>> +      port@2:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        unevaluatedProperties: false
>>>>> +        description:
>>>>> +          Input port for receiving CSI data on CSI2.
>>>>> +
>>>>> +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: video-interfaces.yaml#
>>>>> +            unevaluatedProperties: false
>>>>> +
>>>>> +            properties:
>>>>> +              clock-lanes:
>>>>> +                maxItems: 1
>>>>> +
>>>>> +              data-lanes:
>>>>> +                minItems: 1
>>>>> +                maxItems: 4
>>>>> +
>>>>> +              bus-type:
>>>>> +                enum:
>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>> +
>>>>> +            required:
>>>>> +              - clock-lanes
>>>>> +              - data-lanes
>>>>> +
>>>>> +      port@3:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        unevaluatedProperties: false
>>>>> +        description:
>>>>> +          Input port for receiving CSI data on CSI3.
>>>>> +
>>>>> +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: video-interfaces.yaml#
>>>>> +            unevaluatedProperties: false
>>>>> +
>>>>> +            properties:
>>>>> +              clock-lanes:
>>>>> +                maxItems: 1
>>>>> +
>>>>> +              data-lanes:
>>>>> +                minItems: 1
>>>>> +                maxItems: 4
>>>>> +
>>>>> +              bus-type:
>>>>> +                enum:
>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>> +
>>>>> +            required:
>>>>> +              - clock-lanes
>>>>> +              - data-lanes
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - reg-names
>>>>> +  - clocks
>>>>> +  - clock-names
>>>>> +  - interrupts
>>>>> +  - interrupt-names
>>>>> +  - interconnects
>>>>> +  - interconnect-names
>>>>> +  - iommus
>>>>> +  - power-domains
>>>>> +  - power-domain-names
>>>>> +  - vdda-pll-supply
>>>>> +  - vdda-phy0-supply
>>>>> +  - vdda-phy1-supply
>>>>> +  - vdda-phy2-supply
>>>>> +  - vdda-phy3-supply
>>>>> +  - vdda-phy4-supply
>>>>> +  - vdda-phy5-supply
>>>>
>>>> Please exclude supplies from the list of required properties.
>>> One of these supplies is required based which PHY the use case is being
>>> run. Can you please advise how to handle that? Thanks.
>>
>> 1. Please rename all of them, reference to qcom,x1e80100-camss.yaml,
>> qcom,qcm2290-camss.yaml or published on linux-media
>> qcom,sm8650-camss.yaml
>>
>> 2. Remove all of them from the list of required properties, and in a
>> board
>> specific dts file add only the neccesary ones, that's it.
>>
> Thanks. We will try to follow the same for rev3. Just a caveat though.
> If, for instance, two CSIPHYs have different 1.2 supplies and they are
> required to be operated concurrently, it may be is a problem? as we can

It should not be a problem, you can add two regulators, and it's fine,
anyway all of them shall be optional properties, because it's unknown in
advance which ones are actually needed.

> put only one of those in the board specific DTS for the 1.2 supply node
> (ex: vdd-csiphy-1p2 in SM2290). Is it not? However, if we don't have
> such a use case requirement on the upstream may be it's OK. Thank you.

Link to the published SM8650 CAMSS dt bindings, please follow this model:
https://lore.kernel.org/linux-media/20251017031131.2232687-2-vladimir.zapolskiy@linaro.org/

Please note the chosen naming scheme, when the supply property names
follow the SoC pad namings one to one.

-- 
Best wishes,
Vladimir

