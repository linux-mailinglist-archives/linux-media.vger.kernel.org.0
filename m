Return-Path: <linux-media+bounces-47080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF604C5D266
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 13:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EA3A3B01A0
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 12:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47481DE4DC;
	Fri, 14 Nov 2025 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jA05jM76"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91F01BD9CE
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 12:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763124028; cv=none; b=r9C6Wup9EbfwDyYnOT8jBqaoBHUaOXICreRvzVB2BrUQXP5vW03UIycKo+R78+R+rWtsikjnILP6BMyolZuPBE3/h4Jmwmgz6MSxha0VPDL7MTPQvBwjDsgUV1a92gZUKbjJkjjeRQYP/D/DMhIdYPDzBv+v2E93Dd2z02w6qC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763124028; c=relaxed/simple;
	bh=6RjWDLI+pLbByiw5tflsFWzlyUGWfktb18dMsX6Y0m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DbSRYEWRiSYab62zYO/frZ6wlnD1pyQZzxHk4FTjF1UgU9vyA1sXT2ll7Laol31Y4fne6DUwCCT/mcU9mpaBFXWmiaKFXTTsdn9oVTHy+m0Vl2g/zEmqZtnj1Y8pT7doJWBVpKoGafkIybqQsdMlXBj8/z9SE9eRBHDUK6e+mD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jA05jM76; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59426dc96f2so111327e87.2
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 04:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763124024; x=1763728824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jg0PvqRezKbupz3Kg00de1ttMmCopst/jLXtGT3bTZQ=;
        b=jA05jM76wLX7UYqLFe4u1+5ESJSj+yFeHRCxb4XOeZmwOMa6HYliJpFHICDZXmjGqJ
         YiPdXULZHWWKNVF9wjwJpBd/Lf5HvLMFxi7kp8uZ6oyGhVCAVVTa1MxdVfhvfxbfzhWF
         z53FYzaPLIv2CvIbAt7rUomxQ3kwXojZckfBlYlkvaLkobg/ZAbikL0MuQ+wsqwDmNxm
         YiopAKgsU4XZE3JZecEpu58Cj/LjHAqUFsJW4xhGTkcTHFDP4ED6u+slv8qTqy9aTJOz
         sSvMeOpuI6tyuPYi7HCLcYWA4zcoFg1pE+0zYCOuxVsMe2BpB2HgCe/2t6yf+VbjfFKw
         lVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763124024; x=1763728824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jg0PvqRezKbupz3Kg00de1ttMmCopst/jLXtGT3bTZQ=;
        b=VVpo10WyHgmjpeXuqqCOd5SAhWCFOgArh+E46D0Q30t4AioqKUANAfIN/VJESqERkG
         9dnPlbWYmHTyLcwXYJTTMVMLUF3AIznk+cC5Yg/sPnM07jVS6Riq2/Hl5X2eXRByv2Dh
         BDfaZWF4/kAziNcZN5u8bdwHy0Qj45DuhFKnlSK2XWi3j2jWub9mgqCnV4dGSK41no6a
         7ac2VQKEZGM81FIEgetY1sgB/LLyiM/lRhqk2Iv3gbYYOaEriydCDeI/7kCnN+t0A1bQ
         +qkGD7Wg7CIXAyNybK04LRk5qDVxz1u9lGBT5v0OzVBh+KdCibhFRVUXpnsLbPxV9r2n
         0A6g==
X-Forwarded-Encrypted: i=1; AJvYcCVOHYfOzhpMXMH868xJBJsVmU1WXVZdi9FJW4wEWdQypUoBK+cHu82PRi2mfFS+EbSf3O+aWOGU+tACiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIFaLUdNvbiR2YqJHb2vbNX01dXnJmgfwCgmXNoxUvq+5zWxuK
	JMM6Wqj0f9Lbu6X2fe2sI+FH1NRd//Ma/bOEByjaxaQ5Dsoft1ADTWJ+uChoErS9D6M=
X-Gm-Gg: ASbGncuXOfPxahOik3n7YiPjS+ujZr1SVf9mFv9K7gAv7nFSEUMPNcjMqd+oEkzaY5h
	EGgTZfoFpnqD4nWEiK0+q5AmvRxYC8G0fK7U3X8iy5N+DKaRqvXrgfyUOmwM11ZbhfA8k15Vp0c
	NGO46xMVNGcvKxGtfz3tnFH17CJlfH3P40LGTertmd0dTEDXyiI1FrMg2g6WvEpRsRF3JRXTzsD
	E22DRTmNrIWnT+0pETGcXEMjaAaAJCnxjTC1Jqc6JaDkX/joWHnay2GMdz2cS2Idc81WdgzP//J
	3O9HgzjM+U9sZJ6b8B5nVXkYGy9fSK/9ATwW3JTpkBaoQv9gD9oMuOEpS6/EruymRjJbpV29Myh
	aBMXPfHpG1h0Uoq2+Tv+s1aSVcK9AdYhaVNTTnL8mhh1TH2wdydECTxeU5ff+Zg4Z9jTflO7DH2
	Z8hhTs4ngObiQTFtrH7Q/ZCgmW1K++0M83vnLwxsNxAjDneb1rVaGRqPp9U4zujys4kw==
X-Google-Smtp-Source: AGHT+IGJYPQlaR8EvmhvGbzkYup72zeZ7xs1plmBFOUBHn0OvAXWI4uYws2IEREwIrDVLw6kZ9Ksyw==
X-Received: by 2002:a05:6512:1150:b0:594:2e4e:6996 with SMTP id 2adb3069b0e04-59584924433mr442379e87.7.1763124023670;
        Fri, 14 Nov 2025 04:40:23 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803acc1asm1056622e87.13.2025.11.14.04.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 04:40:22 -0800 (PST)
Message-ID: <de7ad562-80bc-498e-a6fb-cc26bb6343f0@linaro.org>
Date: Fri, 14 Nov 2025 14:40:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251114-sm6350-camss-v2-1-d1ff67da33b6@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca.

On 11/14/25 13:15, Luca Weiss wrote:
> Add bindings for the Camera Subsystem on the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   .../bindings/media/qcom,sm6350-camss.yaml          | 349 +++++++++++++++++++++
>   1 file changed, 349 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
> new file mode 100644
> index 000000000000..d812b5b50c05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
> @@ -0,0 +1,349 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm6350-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM6350 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Luca Weiss <luca.weiss@fairphone.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm6350-camss
> +
> +  reg:
> +    maxItems: 12
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite
> +
> +  clocks:
> +    maxItems: 30
> +
> +  clock-names:
> +    items:
> +      - const: cam_ahb_clk
> +      - const: cam_axi
> +      - const: soc_ahb
> +      - const: camnoc_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: slow_ahb_src
> +      - const: vfe0_axi
> +      - const: vfe0
> +      - const: vfe0_cphy_rx
> +      - const: vfe0_csid
> +      - const: vfe1_axi
> +      - const: vfe1
> +      - const: vfe1_cphy_rx
> +      - const: vfe1_csid
> +      - const: vfe2_axi
> +      - const: vfe2
> +      - const: vfe2_cphy_rx
> +      - const: vfe2_csid
> +      - const: vfe_lite
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid

The sorting order of this list does not follow the sorting order accepted
in the past.

I'm very sorry for the vagueness, but I can not pronounce the accepted
sorting order name, because it triggers people.

> +
> +  interrupts:
> +    maxItems: 12
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +      - const: sf_mnoc
> +      - const: sf_icp_mnoc

Please remove sf_mnoc and sf_icp_mnoc, they are not needed for enabling
IP to produce raw images, and one day you may use them somewhere else.

> +
> +  iommus:
> +    maxItems: 4
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: top
> +      - const: ife0
> +      - const: ife1
> +      - const: ife2

Note that the list of items and the list of the item descriptions do not
correspond to each other. Titan Top GDSC shall be at the end.

> +
> +  vdd-csiphy-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to a PHY.
> +
> +  vdd-csiphy-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to a PHY.
> +

Please reference to the schematics or SoC TRM, does SM6350 SoC
have different pads to get supplies to different CSIPHYx IPs?

If so, then please provide hardware properties to get a proper
correspondence between supplies and CSIPHYx, and make all these
properties optional.

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-3]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data from a CSIPHY.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - vdd-csiphy-0p9-supply
> +  - vdd-csiphy-1p25-supply

When a change to add CSIPHYx specific supplies is done, please remove
*-supply properties from the list of the requred ones.

> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
> +    #include <dt-bindings/clock/qcom,sm6350-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,sm6350.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        isp@acb3000 {
> +            compatible = "qcom,sm6350-camss";
> +
> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
> +                  <0x0 0x0acba000 0x0 0x1000>,
> +                  <0x0 0x0acc1000 0x0 0x1000>,
> +                  <0x0 0x0acc8000 0x0 0x1000>,
> +                  <0x0 0x0ac65000 0x0 0x1000>,
> +                  <0x0 0x0ac66000 0x0 0x1000>,
> +                  <0x0 0x0ac67000 0x0 0x1000>,
> +                  <0x0 0x0ac68000 0x0 0x1000>,
> +                  <0x0 0x0acaf000 0x0 0x4000>,
> +                  <0x0 0x0acb6000 0x0 0x4000>,
> +                  <0x0 0x0acbd000 0x0 0x4000>,
> +                  <0x0 0x0acc4000 0x0 0x4000>;
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "csiphy3",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe2",
> +                        "vfe_lite";
> +
> +            clocks = <&gcc GCC_CAMERA_AHB_CLK>,

I believe this clock is critical, and it is set so in the SM6350 GCC driver,
therefore it should not be added here.

Multiple CAMCC drivers define some of the clocks as "critical" and always
enabled, a misconfiguration in this area may cause the reported warning.

> +                     <&gcc GCC_CAMERA_AXI_CLK>,
> +                     <&camcc CAMCC_SOC_AHB_CLK>,
> +                     <&camcc CAMCC_CAMNOC_AXI_CLK>,
> +                     <&camcc CAMCC_CORE_AHB_CLK>,
> +                     <&camcc CAMCC_CPAS_AHB_CLK>,
> +                     <&camcc CAMCC_CSIPHY0_CLK>,
> +                     <&camcc CAMCC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAMCC_CSIPHY1_CLK>,
> +                     <&camcc CAMCC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAMCC_CSIPHY2_CLK>,
> +                     <&camcc CAMCC_CSI2PHYTIMER_CLK>,
> +                     <&camcc CAMCC_CSIPHY3_CLK>,
> +                     <&camcc CAMCC_CSI3PHYTIMER_CLK>,
> +                     <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_0_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_0_CLK>,
> +                     <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_0_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_1_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_1_CLK>,
> +                     <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_1_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_2_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_2_CLK>,
> +                     <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_2_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_CSID_CLK>;
> +            clock-names = "cam_ahb_clk",
> +                          "cam_axi",
> +                          "soc_ahb",
> +                          "camnoc_axi",
> +                          "core_ahb",
> +                          "cpas_ahb",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy3",
> +                          "csiphy3_timer",
> +                          "slow_ahb_src",
> +                          "vfe0_axi",
> +                          "vfe0",
> +                          "vfe0_cphy_rx",
> +                          "vfe0_csid",
> +                          "vfe1_axi",
> +                          "vfe1",
> +                          "vfe1_cphy_rx",
> +                          "vfe1_csid",
> +                          "vfe2_axi",
> +                          "vfe2",
> +                          "vfe2_cphy_rx",
> +                          "vfe2_csid",
> +                          "vfe_lite",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid";
> +
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 717 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 718 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;

Interrupt types shall be IRQ_TYPE_EDGE_RISING.

> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy3",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe2",
> +                              "vfe_lite";
> +
> +            interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names = "ahb",
> +                                 "hf_mnoc",
> +                                 "sf_mnoc",
> +                                 "sf_icp_mnoc";
> +
> +            iommus = <&apps_smmu 0x820 0xc0>,
> +                     <&apps_smmu 0x840 0x0>,
> +                     <&apps_smmu 0x860 0xc0>,
> +                     <&apps_smmu 0x880 0x0>;
> +
> +            power-domains = <&camcc TITAN_TOP_GDSC>

It should be the last one in the list, if the settled practice is followed.

> +                            <&camcc IFE_0_GDSC>,
> +                            <&camcc IFE_1_GDSC>,
> +                            <&camcc IFE_2_GDSC>;
> +            power-domain-names = "top",
> +                                 "ife0",
> +                                 "ife1",
> +                                 "ife2";
> +
> +            vdd-csiphy-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy-1p25-supply = <&vreg_l22a>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    csiphy0_ep: endpoint {

An empty line before a child node is always needed.

> +                        data-lanes = <0 1 2 3>;
> +                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                        remote-endpoint = <&sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 

-- 
Best wishes,
Vladimir

