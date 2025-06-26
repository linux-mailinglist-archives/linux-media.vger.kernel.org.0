Return-Path: <linux-media+bounces-35947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A19AE9C60
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EEA06A2999
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 11:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9C0275AEA;
	Thu, 26 Jun 2025 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ktaGs3hu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0717F275866
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936627; cv=none; b=UjU10a+YmFVGNtBS69tL8AhjSTJ4ig6jSOo7uNCjMQVbkq+CAIfM4Ozf5Nlq8RW5SnNgaoecteci6m8FkLrsYYi62pJK1EacyYfAPVsHQmxJLCPwQ4akbJwsFVW6odz9DXKp67KeSX+G/4X70Ja9YI0SL7PJmBLq94OJJqHQbLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936627; c=relaxed/simple;
	bh=XcwxXmF6zSHfXn/quotUGx5sUVWoEq2Qvc437Bg9Hgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHvQlYUmlBpMtPLeEYUJmYkuI96hUK3mzOPL+Pyz/gYmV2XNn7e1mCo87nqznAugxsQe6hDOvJm0flTP79RXNUOm78/cAYWiD5jqRKKIjZ+7PLScZ/E3MdcAIZCemXpC/1gIX/8YqJTSsgwVK2c1noj3hvkqze+C3m8UvPY0vdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ktaGs3hu; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so628088f8f.2
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 04:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750936623; x=1751541423; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XP8xDt9zHE198oeyEIph4G3vaFbGuZqa2m+s3UehFrg=;
        b=ktaGs3hu5AruLXAPAFBW+PaaAPx1ldV5kBovL1jMmtMAHPCgKcvCfaNSYwkgEpNBjW
         ev5tWqNfu7s7Hq97Sow6ZjnoDr6T1Ex+d8pTHt8GiCldxZwU/crHzysPMr9JUPQSj7Zc
         BHzNm0soPvzJyR59ijEFKdrBU0KtMby2s2EkGLtGfjBbX6CSADjAghSoO8xCgp95oOjS
         Sf9om/d806JTyDY1HNwU//zzLaEX9kN6291rqv9ce4vNnaJ0SPu/1EwMfwS96THi/0YZ
         CDsjrR2WilTdszNcSl4ZaoQCL6paNZ0waSywkEbUe6IEja0jNLfb6OaePMh1mmnc1JCN
         YEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750936623; x=1751541423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XP8xDt9zHE198oeyEIph4G3vaFbGuZqa2m+s3UehFrg=;
        b=JvosMssTxow285hY+pY1LTbptqskAVJtLqwy+3CmOp9ALxpno046L+QQCRz+uGp1nO
         mhhi9kDhaAtUdfljErol4SwSEykSJUAqZVLpFu+JAWZACkZGlvcZHIP5rIuGyab95Luc
         lGFwmuKdv8OSS1GQUbOVQxqUkUAJ3K/CWOdIafiG/MbNwRX3bhu1U3jt3R4ulDUpvHnO
         NrYdBAEW8ocXda+LT3USipcVd9hcJC7Na1tGQnYAIdYMvE40hiadtPGEn6RWpjfgg2aV
         FdeiwGTzoIeX/DL00Z6UjuMnF4K+BzYi0DIaGFTytQvuN0j6qlSH2VspewCVOnGSES5G
         Ea0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUq36/rmzP1MhqKxWXXAN+Vt/L+RuMwOivAqU46ekQrzuD1KA4NYQTtU675d7Yj97sdKZeI40co4VeZcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YztkmCMHLem2nq8ml7pkx0kph/U9R2y/NKjtIgqactVKkn0bruX
	D6qzvTtOox9T4bd7ZIksEjNCoPBUqKgtVEOx5I0I7BggzfmrO4bywnz76GQe3xSwEnM=
X-Gm-Gg: ASbGncvt+jyuqtuwX3QUQ+ynxbA13kbx+MncIgSIklRvSIouFOrc570s2ufdqV9C7lC
	OErW52KJNGP2BDYn3IEeY8lPak+rtaIoCRhmd+LPUx8NXHBfkKWCFGF3NN0GN4xvqJIFCm1GTZ0
	aJlllDPJj80pk3V0NLhRnpqKyZ1v4ioEwlgjT48CASfbRzNqPIFPWu9il7/EKK7veuotnzT4ogo
	84vEgb6Zivi/bJnXivX7MmkacgXvtWmk5MXbNi3fsWy2UiFwl16bQFJTMI4IJdK6uCBw2DORN9r
	uqwqSxIz4IZoNLkyFpo88VwXCBSBxoUmuqFmrRNzgyu+xpxyYWHv8dnCcZIo7MXcz9wG1y0QucJ
	DgQ1EED3J+b8cfzKTnPHNUW/CpGA=
X-Google-Smtp-Source: AGHT+IF9Fs46hD/L1eBvXtk9XHkDEVT3U5qRnYEc2khequYkVflqMidoXDDX3uefM4joe4S8TNONVg==
X-Received: by 2002:a5d:584a:0:b0:3a3:65b5:51d7 with SMTP id ffacd0b85a97d-3a6ed601d8emr5767870f8f.26.1750936623110;
        Thu, 26 Jun 2025 04:17:03 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e81106b8sm7232461f8f.91.2025.06.26.04.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 04:17:02 -0700 (PDT)
Message-ID: <c5652e34-3697-4657-8bbb-aae5c2b903dd@linaro.org>
Date: Thu, 26 Jun 2025 12:17:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] media: dt-bindings: Add qcom,msm8939-camss
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org>
 <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 10:33, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add bindings for qcom,msm8939-camss in order to support the camera
> subsystem for MSM8939.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>   .../bindings/media/qcom,msm8939-camss.yaml         | 254 +++++++++++++++++++++
>   1 file changed, 254 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9fbb4b204ac8728b822864ad8336aa9d826d6b5b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
> @@ -0,0 +1,254 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,msm8939-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm MSM8939 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Vincent Knecht <vincent.knecht@mailoo.org>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
> +
> +properties:
> +  compatible:
> +    const: qcom,msm8939-camss
> +
> +  reg:
> +    maxItems: 11
> +
> +  reg-names:
> +    items:
> +      - const: csi_clk_mux
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy0_clk_mux
> +      - const: csiphy1
> +      - const: csiphy1_clk_mux
> +      - const: ispif
> +      - const: vfe0
> +      - const: vfe0_vbif
> +
> +  clocks:
> +    maxItems: 24
> +
> +  clock-names:
> +    items:
> +      - const: ahb
> +      - const: csi0
> +      - const: csi0_ahb
> +      - const: csi0_phy
> +      - const: csi0_pix
> +      - const: csi0_rdi
> +      - const: csi1
> +      - const: csi1_ahb
> +      - const: csi1_phy
> +      - const: csi1_pix
> +      - const: csi1_rdi
> +      - const: csi2
> +      - const: csi2_ahb
> +      - const: csi2_phy
> +      - const: csi2_pix
> +      - const: csi2_rdi
> +      - const: csi_vfe0
> +      - const: csiphy0_timer
> +      - const: csiphy1_timer
> +      - const: ispif_ahb
> +      - const: top_ahb
> +      - const: vfe0
> +      - const: vfe_ahb
> +      - const: vfe_axi
> +
> +  interrupts:
> +    maxItems: 7
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: ispif
> +      - const: vfe0
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: VFE GDSC - Video Front End, Global Distributed Switch
> +          Controller.
> +
> +  vdda-supply:
> +    description:
> +      Definition of the regulator used as 1.2V analog power supply.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-1]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data.
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
> +  - iommus
> +  - power-domains
> +  - vdda-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
> +
> +    isp@1b00020 {
> +        compatible = "qcom,msm8939-camss";
> +
> +        reg = <0x01b00020 0x10>,
> +              <0x01b08000 0x100>,
> +              <0x01b08400 0x100>,
> +              <0x01b08800 0x100>,
> +              <0x01b0ac00 0x200>,
> +              <0x01b00030 0x4>,
> +              <0x01b0b000 0x200>,
> +              <0x01b00038 0x4>,
> +              <0x01b0a000 0x500>,
> +              <0x01b10000 0x1000>,
> +              <0x01b40000 0x200>;
> +
> +        reg-names = "csi_clk_mux",
> +                    "csid0",
> +                    "csid1",
> +                    "csid2",
> +                    "csiphy0",
> +                    "csiphy0_clk_mux",
> +                    "csiphy1",
> +                    "csiphy1_clk_mux",
> +                    "ispif",
> +                    "vfe0",
> +                    "vfe0_vbif";
> +
> +        clocks = <&gcc GCC_CAMSS_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0PHY_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0PIX_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0RDI_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1PHY_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1PIX_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1RDI_CLK>,
> +                 <&gcc GCC_CAMSS_CSI2_CLK>,
> +                 <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_CSI2PHY_CLK>,
> +                 <&gcc GCC_CAMSS_CSI2PIX_CLK>,
> +                 <&gcc GCC_CAMSS_CSI2RDI_CLK>,
> +                 <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
> +                 <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_VFE0_CLK>,
> +                 <&gcc GCC_CAMSS_VFE_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_VFE_AXI_CLK>;
> +
> +        clock-names = "ahb",
> +                      "csi0",
> +                      "csi0_ahb",
> +                      "csi0_phy",
> +                      "csi0_pix",
> +                      "csi0_rdi",
> +                      "csi1",
> +                      "csi1_ahb",
> +                      "csi1_phy",
> +                      "csi1_pix",
> +                      "csi1_rdi",
> +                      "csi2",
> +                      "csi2_ahb",
> +                      "csi2_phy",
> +                      "csi2_pix",
> +                      "csi2_rdi",
> +                      "csi_vfe0",
> +                      "csiphy0_timer",
> +                      "csiphy1_timer",
> +                      "ispif_ahb",
> +                      "top_ahb",
> +                      "vfe0",
> +                      "vfe_ahb",
> +                      "vfe_axi";
> +
> +        interrupts = <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
> +
> +        interrupt-names = "csid0",
> +                          "csid1",
> +                          "csid2",
> +                          "csiphy0",
> +                          "csiphy1",
> +                          "ispif",
> +                          "vfe0";
> +
> +        iommus = <&apps_iommu 3>;
> +
> +        power-domains = <&gcc VFE_GDSC>;
> +
> +        vdda-supply = <&reg_1v2>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                csiphy1_ep: endpoint {
> +                    data-lanes = <0 2>;
> +                    remote-endpoint = <&sensor_ep>;
> +                };
> +            };
> +        };
> +    };
> 

Hi Vincent.

Would appreciate if you could make the order of items here the same as 
in 8916 per discussions with Krzysztof clarifying.

8916, 8939, 8953 are of a similar class of device so the correct 
ordering here is as with 8916.

---
bod

