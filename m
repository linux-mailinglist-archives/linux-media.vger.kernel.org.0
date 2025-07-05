Return-Path: <linux-media+bounces-36881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 083EFAF9F44
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 11:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CD444A6E81
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 09:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12DF1F4CBE;
	Sat,  5 Jul 2025 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y+DMf88w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0952E36E0
	for <linux-media@vger.kernel.org>; Sat,  5 Jul 2025 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751706112; cv=none; b=S6BclDRREqFlGgaAZqTc6flzXfPlrpkgMm3yYBzPiDxbon613PSLSuzm9xTLABD3pAH/wSSrS59N5k1+uuwXeCT/jkpFX0QGRUnhdYp5z6IvCeGpZkWYyWFHKR3a5qiMwlRttclK0SpI7ywtAwdoDuOxs6XgDNpuyI5mewyGl1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751706112; c=relaxed/simple;
	bh=qi4COI7xKLjWmllrQt18atwCci9mlfEt2Ssg6D/cyQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGnj2wiUjhpX27XEh/uxGvnDsplbcPsrIEq05TQSMVdOZ/UugrqFP0KL9vWtyc9j+MQ05+nSoNzjiChTpsLZNnAu2vPZC8yNDEswheT6n15fwzDI1+O27YNU7JwdXY96Xz69PGwoTK7oiggzhdMKA9+mHYptKFa/MAk0vH1ofDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y+DMf88w; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso1225816f8f.1
        for <linux-media@vger.kernel.org>; Sat, 05 Jul 2025 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751706109; x=1752310909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/dNDpnTs2vBTsMbZS9ejf3gT6RRrlnujMAOC7gRP58s=;
        b=y+DMf88wNDto0PVs21uGtX12KHw9ORc7/UbtK3zxKIQLHMyj2WhsZ5++d7Cn/DT2CH
         2CdF1oxL89fcK+GU6zcUNB0OZh6cYxy781MsGhsaAjtMR+qGIxvQtFKi2DDAUcr8EHzZ
         lba2sWcKxcrFg+lGqdcgNUDOSm6ffoG5/PBH0aXkR3tDXE//nDuavWt1D5CxdntMo0w2
         di2PpiMNQ//ZvkmHD5bz74VRuovaGyEn2hl0yPMkq2+Ozw35VPLLrmeAy6X1ImwqZh1Y
         rCV431svVMeWAqzlBRxqkVLny+g8hQs+hKqhcjTM29GB05R3x8J7kA6PEk1lRRx2UVY6
         Z/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751706109; x=1752310909;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dNDpnTs2vBTsMbZS9ejf3gT6RRrlnujMAOC7gRP58s=;
        b=W5jK/F5yzrCR+IbuVBMzWSgqM08DrQ3wJ2i1ssGKMQoZjQYh3ORy0DWSbWWknZxD0G
         oEkfSnn23qE/9qln73s24t14abNKoUX/r5vTVAP1HDAbzeteznx+rTBxJfPoX9ATrnrj
         HyFeK0Bx/J7RNZjsG8YXN/ZKSBg7esO84dzcYonAt7+YEOUXIraLUJ3o7KoyPLzt1ztR
         FxZLhmaN16NEpLqNrj0R0X9hMIEJyBwjSyy+yEbJcoYiQYXRFCab2y3YWGwtLym7Kvcp
         2yyclaEJPwZuin0BfYMKizbblVS8Uu9n198oBxUFoSqhHP6F/SGaeHcAbF9heXXxevZn
         iV+g==
X-Forwarded-Encrypted: i=1; AJvYcCWxRE3oqXISpA5vymrlnELuLOWpbxzGXUTEIB4v1jSU5aZHOc2XP8hSqNrPE+5b7Xcq6C3gK6l3hr+6yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhLebFMvMPcmpKrUOjVzNRPo3PFGxmy7Ve9kL8yoQQUo631OuT
	ONqKlW1JqsjJeSQ7nI6+VAETTuojhsTMoRqz6Jd/HDnGSxdQD7f5oEGZXuLAmG/dhQM7lyylVFK
	87NX9u+O71w==
X-Gm-Gg: ASbGncsK520kIyysgbbu6YOnrNDTW5OFmwHcOcAfX7JfOxIqxStScz9UQgdiK19rqm8
	cXLdO3Vi9Oq7fET7G3bzw/zjcmk/ToTiiYtceIi9EfWrm7L7oj606rC3lg3aXjNszaM3TsbyFIP
	Zvo3S2bHOKV1NNutDF9hASsUbU8kynf6svIsxSR6RwTRZW7a3OljxmrvRt2uQkH360+hjxg20rS
	W/AEUNYFFWVFbkfqJ737GxqH/431AWQMrXlYvUvFWUZ9hf/lo1QTYdlOPdnOsnwzARDevSCxUN5
	doSXeL3TsqlSFZKWzJOgjng1dPG1Rb6mzR8SBVx5AJJqBrM/BwrMGMx54RoczIANd3ul80EefQ5
	j0TJM8XyKcn76/Ta2C/7EmdunCN4=
X-Google-Smtp-Source: AGHT+IHOtbe3QVlIlYe9HHvUp66crth5N/YcobWgeyoPMBtYTSZoFvDEARoOqF4B31+aMsTwfKcv2A==
X-Received: by 2002:a05:6000:1ac8:b0:3a6:e6c3:6d95 with SMTP id ffacd0b85a97d-3b497038e62mr4049238f8f.41.1751706108628;
        Sat, 05 Jul 2025 02:01:48 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997b492sm77225935e9.13.2025.07.05.02.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 02:01:48 -0700 (PDT)
Message-ID: <a1e59962-53ba-4166-90d2-3533c2c87ebc@linaro.org>
Date: Sat, 5 Jul 2025 10:01:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] media: dt-bindings: Add qcom,qcm2290-camss
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250704081537.1716613-1-loic.poulain@oss.qualcomm.com>
 <20250704081537.1716613-6-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250704081537.1716613-6-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/2025 09:15, Loic Poulain wrote:
> Add bindings for qcom,qcm2290-camss in order to support the camera
> subsystem found in the Qualcomm Robotics RB1 Platform (QRB2210).
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,qcm2290-camss.yaml    | 243 ++++++++++++++++++
>   1 file changed, 243 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> new file mode 100644
> index 000000000000..2824acd49d89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> @@ -0,0 +1,243 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCM2290 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Loic Poulain <loic.poulain@oss.qualcomm.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,qcm2290-camss
> +
> +  reg:
> +    maxItems: 9
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: top

top should come first as its the main register bank in the list.

> +      - const: vfe0
> +      - const: vfe1
> +
> +  clocks:
> +    maxItems: 15
> +
> +  clock-names:
> +    items:
> +      - const: ahb
> +      - const: axi
> +      - const: camnoc_nrt_axi
> +      - const: camnoc_rt_axi
> +      - const: csi0
> +      - const: csi1
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: top_ahb
> +      - const: vfe0
> +      - const: vfe0_cphy_rx
> +      - const: vfe1
> +      - const: vfe1_cphy_rx
> +
> +  interrupts:
> +    maxItems: 8
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: vfe0
> +      - const: vfe1
> +
> +  interconnects:
> +    maxItems: 3
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +      - const: sf_mnoc
> +
> +  iommus:
> +    maxItems: 4
> +
> +  power-domains:
> +    items:
> +      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
> +
> +  vdd-csiphy-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSI PHYs.
> +
> +  vdd-csiphy-1p8-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to CSI PHYs pll block.
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
> +  - vdd-csiphy-1p2-supply
> +  - vdd-csiphy-1p8-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> +    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
> +    #include <dt-bindings/interconnect/qcom,qcm2290.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: camss@5c6e000 {
> +            compatible = "qcom,qcm2290-camss";
> +
> +            reg = <0x0 0x5c6e000 0x0 0x1000>,
> +                  <0x0 0x5c75000 0x0 0x1000>,
> +                  <0x0 0x5c52000 0x0 0x1000>,
> +                  <0x0 0x5c53000 0x0 0x1000>,
> +                  <0x0 0x5c66000 0x0 0x400>,
> +                  <0x0 0x5c68000 0x0 0x400>,
> +                  <0x0 0x5c11000 0x0 0x1000>,
> +                  <0x0 0x5c6f000 0x0 0x4000>,
> +                  <0x0 0x5c76000 0x0 0x4000>;
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csitpg0",
> +                        "csitpg1",
> +                        "top",
> +                        "vfe0",
> +                        "vfe1";
> +
> +            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +                     <&gcc GCC_CAMSS_AXI_CLK>,
> +                     <&gcc GCC_CAMSS_NRT_AXI_CLK>,
> +                     <&gcc GCC_CAMSS_RT_AXI_CLK>,
> +                     <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
> +                     <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
> +                     <&gcc GCC_CAMSS_CPHY_0_CLK>,
> +                     <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
> +                     <&gcc GCC_CAMSS_CPHY_1_CLK>,
> +                     <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
> +                     <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +                     <&gcc GCC_CAMSS_TFE_0_CLK>,
> +                     <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
> +                     <&gcc GCC_CAMSS_TFE_1_CLK>,
> +                     <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
> +            clock-names = "ahb",
> +                          "axi",
> +                          "camnoc_nrt_axi",
> +                          "camnoc_rt_axi",
> +                          "csi0",
> +                          "csi1",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "top_ahb",
> +                          "vfe0",
> +                          "vfe0_cphy_rx",
> +                          "vfe1",
> +                          "vfe1_cphy_rx";
> +
> +            interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 310 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csitpg0",
> +                              "csitpg1",
> +                              "vfe0",
> +                              "vfe1";
> +
> +            interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> +                             &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
> +                            <&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
> +                             &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> +                            <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
> +                             &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
> +            interconnect-names = "ahb",
> +                                 "hf_mnoc",
> +                                 "sf_mnoc";
> +
> +            iommus = <&apps_smmu 0x400 0x0>,
> +                     <&apps_smmu 0x800 0x0>,
> +                     <&apps_smmu 0x820 0x0>,
> +                     <&apps_smmu 0x840 0x0>;
> +
> +            power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +            vdd-csiphy-1p2-supply = <&pm4125_l5>;
> +            vdd-csiphy-1p8-supply = <&pm4125_l13>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +            };
> +        };
> +    };
Other than that LGTM.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

