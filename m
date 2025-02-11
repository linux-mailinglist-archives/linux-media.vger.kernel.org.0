Return-Path: <linux-media+bounces-25992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F645A30805
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 11:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93FDC188918C
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 10:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEEA41F3B8A;
	Tue, 11 Feb 2025 10:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tp9g0bzd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4701F238B
	for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268540; cv=none; b=TTR5JyblVGvoNKxN+kAy2sOPKWQ+MKqmpVz62HEkfcjjMHMHx2cQVyqL8YaT+Wz4G2b+gQwoZ8WU96MOGo4XqvAsWNrI7ZOJMijP0LnSQK6VOwsMcuS66vI6b0F1bCRCdLfZQRvKNRZYZYFb1ldsUMy0CcoQUkC2ZipyjHnAd94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268540; c=relaxed/simple;
	bh=qgED/VaTq2b+BKY/gVRDst+rBS9B6uxl4vUYwOKsCFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+PBaLg/OWaIFLwXGugS3OtXllp3m43n8l1csG+JyTFP4BrMRDPH/MdnACbHEsOs2s+VgVUVpGEpUnzwHibhu+3qbHzl/uHZ5z39qL6dG+MCqBcjnMn5greqsnoxEbHR9FEWapeFnDlM3U/XozKi6g7PEgRShjm5pYzEDavK+80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tp9g0bzd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso36743505e9.3
        for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 02:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739268536; x=1739873336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hS279wtgfC+HMu2GjBqlAO5ie1NpxFDuPG1BWrESvn0=;
        b=Tp9g0bzdr2Ipnk6bNi0IAaPMUAXF0pFYfeYIkmkCvmcynzqrbnquI9wrmNDCYOvlZs
         opkwbVvXVlKoRHz6P8yiZ38uBqj3w3HUmBVq5jNoHr4QnVrC2mrdfpSzrVbADui3/neR
         YEnvNjaVkbLF0pMioa9tbGtjx1Kb0oHKXjX8EZwE9bNUETXIEd48NyIhHQpuRJ1w9Xos
         pmcAgqOPJHHYnUaOsqeIvtXUlki0KhqdZo7kWX0R5EMp6EeHxFvo4+Rrld6zIxo4DRxx
         8SwIMtAlu/csa91a0wSSgx4+/9fRo4wDdyaux/cVpfefxIvSOmPveCaStRbwvgPsmAwm
         tAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739268536; x=1739873336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hS279wtgfC+HMu2GjBqlAO5ie1NpxFDuPG1BWrESvn0=;
        b=McGV21569sdLKAdvRpF91gkJhJOMsPh13e9fWWQ1YiyMk5hx1y9sTkQ5H7oSR8FWs/
         aRauJZ+ThzKHcoLUNRoUfcBO0F+tJVB+sm4QxybIr4vTJ7iJFQM1caJG4P7kwMgYwDLj
         XMJEAz98T6fEsUHx1jND54dt4KcIo2E7Nb0MhZhVQoIakRj6B36oNFmSyWyk4D/eo8FL
         BKnUyGLDTGCn/dtBED16LKop/beV1hlJfLFmLdxdFCWMhE4xVw3XRi9jTDdrW8HbfQVd
         K8h82UJhGymSsvZQ6Hkcnnt5P9x7mIfL5MMLqbYsmEq88ws6CoXE3kwWCmV2KWjjcgzw
         dRsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4RleRCms8f2R1S2E6TCM+fKq3grAx5XpDSP8vljAvwvwscsjgyhTP/JTBBPC8UykcjFvLx/KAQLwl7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhsy3rAkBjsNFr78Okj3ap/EP5/Jw7DbEXZp0gOUq8XCdm7cnK
	n9iUiFlZLMR1BM0/CLeUer96V6sinY1pGY/ytqhx8CJJDtVpIXkFs5QnY+4ppFc=
X-Gm-Gg: ASbGncv9w5llzfRhddVglUJsOvbnktlN6vC6EjaJ0e/HWT9GnGgjMqXdJYFtxFTHKe0
	rGOd0BKvQtvclaYOP1qJ39+QBm7e2rBrkaMKm7xwZ0EeHHKOWfy5OLQcu53nganNxQDpW9Nvxjk
	OXdquNk0Ih7s0WWrhR6LMt8lg0eSW6XKy0PRX52rP+81UFzHq/zllbiNRoqlpzweaxVGJFsm56d
	/MGv4535Rex6vVgJDVRaA/ZIFNAxx+Q0Wt/tft7jZNMG2wFofLlpBl50Lt/bhZ2OnuwVANMKDNf
	OtEZ1NBM7zXHLRFT9cE/duVwoSO9Fs8ywja/LlGoES2uws0r23Z+3zYjJg==
X-Google-Smtp-Source: AGHT+IFlquyvLpEOgTN92ry8b+zPCiAQjCN4XazaPqP0cYAEpyMAFcGq2rGZLwiX0+qTWvYPXNwHYQ==
X-Received: by 2002:adf:e9cb:0:b0:38d:c85c:f917 with SMTP id ffacd0b85a97d-38dc948d81dmr9400460f8f.55.1739268535753;
        Tue, 11 Feb 2025 02:08:55 -0800 (PST)
Received: from [192.168.0.156] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd7f039sm14664803f8f.59.2025.02.11.02.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:08:55 -0800 (PST)
Message-ID: <e152ff78-caa5-493a-88da-96a6670eb2a2@linaro.org>
Date: Tue, 11 Feb 2025 10:08:55 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] media: dt-bindings: Add qcom,sa8775p-camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-2-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250210155605.575367-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/02/2025 15:56, Vikram Sharma wrote:
> Add bindings for qcom,sa8775p-camss to support the camera subsystem
> on SA8775P platform.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../bindings/media/qcom,sa8775p-camss.yaml    | 351 ++++++++++++++++++
>   1 file changed, 351 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> new file mode 100644
> index 000000000000..083e1193c474
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -0,0 +1,351 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sa8775p-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SA8775P CAMSS ISP
> +
> +maintainers:
> +  - Vikram Sharma <quic_vikramsa@quicinc.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8775p-camss
> +
> +  reg:
> +    maxItems: 22
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csid_lite2
> +      - const: csid_lite3
> +      - const: csid_lite4
> +      - const: csid_wrapper

csid_wrapper should come first

https://git.codelinaro.org/bryan.odonoghue/kernel/-/blob/x1e80100-6.13-inspiron14p/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml?ref_type=heads

> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +      - const: vfe_lite2
> +      - const: vfe_lite3
> +      - const: vfe_lite4
> +
> +  clocks:
> +    maxItems: 28
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb_clk
> +      - const: cpas_ife_lite
> +      - const: cpas_vfe0
> +      - const: cpas_vfe1
> +      - const: csid
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy_rx
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: icp_ahb
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 21
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid-lite0
> +      - const: csid-lite1
> +      - const: csid-lite2
> +      - const: csid-lite3
> +      - const: csid-lite4
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe-lite0
> +      - const: vfe-lite1
> +      - const: vfe-lite2
> +      - const: vfe-lite3
> +      - const: vfe-lite4
> +
> +  interconnects:
> +    maxItems: 3
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_0
> +      - const: sf_0
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: top
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-3]+$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data on CSIPHY 0-3.
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

ports should be required

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> +    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
> +    #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        isp@ac7a000 {
> +            compatible = "qcom,sa8775p-camss";
> +
> +            reg = <0x0 0xac7a000 0x0 0x0f01>,
> +                  <0x0 0xac7c000 0x0 0x0f01>,
> +                  <0x0 0xac84000 0x0 0x0f01>,
> +                  <0x0 0xac88000 0x0 0x0f01>,
> +                  <0x0 0xac8c000 0x0 0x0f01>,
> +                  <0x0 0xac90000 0x0 0x0f01>,
> +                  <0x0 0xac94000 0x0 0x0f01>,
> +                  <0x0 0xac78000 0x0 0x1000>,
> +                  <0x0 0xac9c000 0x0 0x2000>,
> +                  <0x0 0xac9e000 0x0 0x2000>,
> +                  <0x0 0xaca0000 0x0 0x2000>,
> +                  <0x0 0xaca2000 0x0 0x2000>,
> +                  <0x0 0xacac000 0x0 0x0400>,
> +                  <0x0 0xacad000 0x0 0x0400>,
> +                  <0x0 0xacae000 0x0 0x0400>,
> +                  <0x0 0xac4d000 0x0 0xd000>,
> +                  <0x0 0xac5a000 0x0 0xd000>,
> +                  <0x0 0xac85000 0x0 0x0d00>,
> +                  <0x0 0xac89000 0x0 0x0d00>,
> +                  <0x0 0xac8d000 0x0 0x0d00>,
> +                  <0x0 0xac91000 0x0 0x0d00>,
> +                  <0x0 0xac95000 0x0 0x0d00>;
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csid_lite2",
> +                        "csid_lite3",
> +                        "csid_lite4",
> +                        "csid_wrapper",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "csiphy3",
> +                        "tpg0",
> +                        "tpg1",
> +                        "tpg2",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe_lite0",
> +                        "vfe_lite1",
> +                        "vfe_lite2",
> +                        "vfe_lite3",
> +                        "vfe_lite4";
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                     <&camcc CAM_CC_CORE_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +                     <&camcc CAM_CC_CSID_CLK>,
> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY1_CLK>,
> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY2_CLK>,
> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY3_CLK>,
> +                     <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                     <&gcc   GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc   GCC_CAMERA_SF_AXI_CLK>,
> +                     <&camcc CAM_CC_ICP_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CLK>,
> +                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +            clock-names = "camnoc_axi",
> +                          "core_ahb",
> +                          "cpas_ahb",
> +                          "cpas_fast_ahb_clk",
> +                          "cpas_ife_lite",
> +                          "cpas_vfe0",
> +                          "cpas_vfe1",
> +                          "csid",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy3",
> +                          "csiphy3_timer",
> +                          "csiphy_rx",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
> +                          "icp_ahb",
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe1",
> +                          "vfe1_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid";
> +
> +            interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid-lite0",
> +                              "csid-lite1",
> +                              "csid-lite2",
> +                              "csid-lite3",
> +                              "csid-lite4",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy3",
> +                              "tpg0",
> +                              "tpg1",
> +                              "tpg2",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe-lite0",
> +                              "vfe-lite1",
> +                              "vfe-lite2",
> +                              "vfe-lite3",
> +                              "vfe-lite4";
> +
> +            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +            interconnect-names = "ahb",
> +                                 "hf_0",
> +                                 "sf_0";
> +
> +            iommus = <&apps_smmu 0x3400 0x20>;
> +
> +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +            power-domain-names = "top";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +            };
> +        };
> +    };


