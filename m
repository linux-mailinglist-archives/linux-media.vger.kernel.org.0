Return-Path: <linux-media+bounces-32949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6757FABE38B
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 21:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5310A18953E3
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 19:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A57F283128;
	Tue, 20 May 2025 19:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LgOEdokE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A714F280CE8
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 19:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768907; cv=none; b=Zj9IvZxO2TWCx/N5smLTsw/KmwZNlEYp6AFPn+x1f17vuZXGZDjgyayIEViqZ59FiNfoj1CtHT1PF9K6GuXttN2cblp2+d71vg90Kk2wHImt89QEO2aH1kMomYbRqtACxRfzGXsI0ZvQq9DLMCnEZHA9EiyGP+aaYCSPrikuAlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768907; c=relaxed/simple;
	bh=BDitTtRWvIz2UMDQvJ11zwEAcrvBiBZ8hWp1th8DRps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KR5CoAVFRxzJS3TyxW242Mf9R7YBbxVvu1XmpGBQkOifpq77HSJ2tm6oUaEgt1r8h3G5cZLfjTarOWEK8V5/id0rOxhsAuGQXYLS/i4LnKXZGf0Fh9MRVoedyzpsqxVfEN8X0rBBO+3wTfGaBscVdBAITG/9v0oiFw8JebddISI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LgOEdokE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so66353595e9.2
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 12:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747768904; x=1748373704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GisGtYp9H5pY8mpY2FEw65OMLHF45oHVcxojdMvrrr4=;
        b=LgOEdokEHY1RDDxhaJbVBbRtjmEpojzSPyy+nRvddHdAzCAYe5KmMIUgwLO8/e4HYO
         LGNzyRYxWbmqrBiLP1k3LjHcFtD/F78s3ZIufEkDpEsdPtf6eM8/lBGo48CdJ4xx+I3I
         2bEmPj4MUyswItcb1dRDjHGwSh+EyFDr5Jcsd7nYYLj9kOgeopXdhZ3z7z1TnFl3QJnz
         kwA1qzNc3KZfs0nY1s6Q6K7MpoBgQIt0elIf2Qiyln3zacxomnA10TqDSEy1OQ4kwd87
         43wbMXrWj1GoxPWcgUPtcIi3TOrMArHJIab42PLfbWEjUKhl6oex5ehUC60VY4dIYwFJ
         H47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768904; x=1748373704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GisGtYp9H5pY8mpY2FEw65OMLHF45oHVcxojdMvrrr4=;
        b=rCpkQpLANG6Dxu/4ydtvWV+7HJdXzo3pR7aodaLNCJLm0rFlws823oiQVVQvbgnvuJ
         5H21zPyvRUKpcp5QbIlW6mKM9naaWHdDHgtl++MEMlit+74BSiDdUx+ruMKz3fYB0W+/
         TkebEIs+s7LChLrtdkjTV7SIQ8rwTRMa1PC2pQi07hsnzW2CpLNUkd5AzoVzGxu99CfY
         gDYcPwq2lFu1Hr8+7H49D6Ay92RiYMchHHIWKzcrIntQrzA9ZRRG1p/sTnsIAMilJEo6
         1Z0W7Sy/aSkcCkCiPqE20QzUAbMjkvX6Ncdq1uj/6R880Wy7pCieurm9kefZT4eIiVsm
         rwRA==
X-Forwarded-Encrypted: i=1; AJvYcCUUSzQ0+2BC2xhhunhPFHS5okYphoThoQlusRjkXl63JF9MtEHE1nrkh9QYhUiZ8YIvsXXTyALvqhHatA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXU5eCTy/znN8yBs7ZeL+kgNNdjymNAiqpGMCjveOok5Bx9RQt
	SrP9xu7vqDICco0073EMGorJdbHV06dACGM+9N5qRzrNOGOLuwsHZCrZ1kL/at54p60=
X-Gm-Gg: ASbGnct22yU+Bl5yqYnI9rZZX7GqsZzoCjPmfym2Tx5wWQPi0mNMFNORMYa4qHJsB7S
	M2R0jj2JqNzToN4BFS+t/Z3ejMfA2i6VD7NssSlNlM1TZUfX2MjKB8iSh+Q5nWAcW3ELwqUw4SB
	lu6umQ9GacjTUYYlssSagpwIRfXZW8ED/ZpQ1ediogJenmdFNS17kSuwbfk+HSl7AINpKIswR9+
	U5EmXbgoRMPQgXmqBlDiJZLPb+kGb/vWd+2vTgDxXTLQV6d5Qgc/PJo0GX5q+WfEuikLvFSwJMz
	cE7yIK0oB448w2yrki4/vmHksZV8/n4Cw+XZvvrEJngIbONC/xyejRf6EK+K46CyEgYRQD3+iuv
	xr88qWKBVjFbyAXIE
X-Google-Smtp-Source: AGHT+IHY2rdorKPlsReEga2AUsycUHpEvjBSidFBsgJz9bbiCz4Cm/MX+//BE7dn2/65SPisNxGrpw==
X-Received: by 2002:a05:600c:524d:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442fd6649bdmr161791585e9.24.1747768903979;
        Tue, 20 May 2025 12:21:43 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447eee9d8desm43924795e9.0.2025.05.20.12.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 12:21:43 -0700 (PDT)
Message-ID: <8f5b390c-05ab-4033-9711-3ea7d97e9d5e@linaro.org>
Date: Tue, 20 May 2025 20:21:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: dt-bindings: Add qcom,msm8939-camss
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-3-a12cd6006af9@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250520-camss-8x39-vbif-v1-3-a12cd6006af9@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 19:39, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add bindings for qcom,msm8939-camss in order to support the camera
> subsystem for MSM8939.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>   .../bindings/media/qcom,msm8939-camss.yaml         | 269 +++++++++++++++++++++
>   1 file changed, 269 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e300b2c84971a45cca43366817a5ed70f9bae630
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
> @@ -0,0 +1,269 @@
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
> +  clocks:
> +    minItems: 24
> +    maxItems: 24
> +
> +  clock-names:
> +    items:
> +      - const: top_ahb
> +      - const: ispif_ahb
> +      - const: csiphy0_timer
> +      - const: csiphy1_timer
> +      - const: csi0_ahb
> +      - const: csi0
> +      - const: csi0_phy
> +      - const: csi0_pix
> +      - const: csi0_rdi
> +      - const: csi1_ahb
> +      - const: csi1
> +      - const: csi1_phy
> +      - const: csi1_pix
> +      - const: csi1_rdi
> +      - const: csi2_ahb
> +      - const: csi2
> +      - const: csi2_phy
> +      - const: csi2_pix
> +      - const: csi2_rdi
> +      - const: ahb
> +      - const: vfe0
> +      - const: csi_vfe0
> +      - const: vfe_ahb
> +      - const: vfe_axi
> +
> +  interrupts:
> +    minItems: 7
> +    maxItems: 7
> +
> +  interrupt-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: ispif
> +      - const: vfe0
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: VFE GDSC - Video Front End, Global Distributed Switch Controller.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
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
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
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
> +  reg:
> +    minItems: 11
> +    maxItems: 11
> +
> +  reg-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy0_clk_mux
> +      - const: csiphy1
> +      - const: csiphy1_clk_mux
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: ispif
> +      - const: csi_clk_mux
> +      - const: vfe0
> +      - const: vfe0_vbif
> +
> +  vdda-supply:
> +    description:
> +      Definition of the regulator used as analog power supply.
> +
> +required:
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interrupt-names
> +  - interrupts
> +  - iommus
> +  - power-domains
> +  - reg
> +  - reg-names
> +  - vdda-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
> +
> +    camss: camss@1b0ac00 {
> +      compatible = "qcom,msm8939-camss";
> +
> +      clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +               <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
> +               <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
> +               <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
> +               <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
> +               <&gcc GCC_CAMSS_CSI0_CLK>,
> +               <&gcc GCC_CAMSS_CSI0PHY_CLK>,
> +               <&gcc GCC_CAMSS_CSI0PIX_CLK>,
> +               <&gcc GCC_CAMSS_CSI0RDI_CLK>,
> +               <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
> +               <&gcc GCC_CAMSS_CSI1_CLK>,
> +               <&gcc GCC_CAMSS_CSI1PHY_CLK>,
> +               <&gcc GCC_CAMSS_CSI1PIX_CLK>,
> +               <&gcc GCC_CAMSS_CSI1RDI_CLK>,
> +               <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
> +               <&gcc GCC_CAMSS_CSI2_CLK>,
> +               <&gcc GCC_CAMSS_CSI2PHY_CLK>,
> +               <&gcc GCC_CAMSS_CSI2PIX_CLK>,
> +               <&gcc GCC_CAMSS_CSI2RDI_CLK>,
> +               <&gcc GCC_CAMSS_AHB_CLK>,
> +               <&gcc GCC_CAMSS_VFE0_CLK>,
> +               <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
> +               <&gcc GCC_CAMSS_VFE_AHB_CLK>,
> +               <&gcc GCC_CAMSS_VFE_AXI_CLK>;
> +
> +      clock-names = "top_ahb",
> +                    "ispif_ahb",
> +                    "csiphy0_timer",
> +                    "csiphy1_timer",
> +                    "csi0_ahb",
> +                    "csi0",
> +                    "csi0_phy",
> +                    "csi0_pix",
> +                    "csi0_rdi",
> +                    "csi1_ahb",
> +                    "csi1",
> +                    "csi1_phy",
> +                    "csi1_pix",
> +                    "csi1_rdi",
> +                    "csi2_ahb",
> +                    "csi2",
> +                    "csi2_phy",
> +                    "csi2_pix",
> +                    "csi2_rdi",
> +                    "ahb",
> +                    "vfe0",
> +                    "csi_vfe0",
> +                    "vfe_ahb",
> +                    "vfe_axi";

The ordering should be alphanum sorted.

> +      interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
> +
> +      interrupt-names = "csiphy0",
> +                        "csiphy1",
> +                        "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "ispif",
> +                        "vfe0";
> +
> +      iommus = <&apps_iommu 3>;
> +
> +      power-domains = <&gcc VFE_GDSC>;
> +
> +      reg = <0x01b0ac00 0x200>,
> +            <0x01b00030 0x4>,
> +            <0x01b0b000 0x200>,
> +            <0x01b00038 0x4>,
> +            <0x01b08000 0x100>,
> +            <0x01b08400 0x100>,
> +            <0x01b08800 0x100>,
> +            <0x01b0a000 0x500>,
> +            <0x01b00020 0x10>,
> +            <0x01b10000 0x1000>,
> +            <0x01b40000 0x200>;
> +
> +      reg-names = "csiphy0",
> +                  "csiphy0_clk_mux",
> +                  "csiphy1",
> +                  "csiphy1_clk_mux",
> +                  "csid0",
> +                  "csid1",
> +                  "csid2",
> +                  "ispif",
> +                  "csi_clk_mux",
> +                  "vfe0",
> +                  "vfe0_vbif";
> +
> +      vdda-supply = <&reg_2v8>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +      };
> +
> +    };
> 


