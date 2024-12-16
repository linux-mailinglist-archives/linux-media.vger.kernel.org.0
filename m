Return-Path: <linux-media+bounces-23519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEDE9F3DBB
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 23:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1D657A6042
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93861D63D1;
	Mon, 16 Dec 2024 22:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iuS6P5kj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6BE1CDFD3
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 22:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734389232; cv=none; b=R+uM8qkrYgO+xGvUMBerFZTN3kYs94sWcwKzNp9SYLTSvpz12E4IXNYxEQ9u+Er1GE28XBLGG56jVj4/7k8BLMG7sk41TWIPHWXi2KtjWlgYkYm5tS2XDo6CXGTMGsrYVlLf8GJv4i3ZQImJdODsnAejFISdBWtc8bzEv+e2WoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734389232; c=relaxed/simple;
	bh=S9QOBhUKBj5pc1xrWHebREQdsD4A36ZsJM6YjAsXqhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OktUkJk5h6XNV/CtFLlIDvoSukPiulPuecgI6aatPt9oUwGFFaZCsEaZwI/HvyRt9RKuy7i3sENsBgvDrTQvm4tUNKHPW7oPIPNl30fwG2tvLrKbBRtmrXl2Q1Srd9zTFDHnKpiA+qPMP4M0gNYp4RnnmynnwT/Xa6hx7akEjjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iuS6P5kj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4362f61757fso34336135e9.2
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 14:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734389228; x=1734994028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GY3WfQvE6Rn3BuU/SuMZva8b6pht7cw7y89zqmyB+1E=;
        b=iuS6P5kj8ND3IGfkRrmkESmyMBxKDnU0ln46SN+a+k6BFnUgQZm3/Es/PtoxAteeEi
         gcmRg1kWZ67eY4KL4ZVKX+d+4YJ9W/DO4uajzk+SWVA2n2MFLXDx42PR8mx9tknkf2gO
         FCE1epuxK9N4cEngz0+KIr7E5r9oYgny+j7YNGM72e0yap/4snnTDnWVdXFrIFSCKiD8
         hjMOSTu+xFaBBQhQD6iGxYSDPQ8wxfjaRoY4uWgDUqfO802D16O8xAlJ7PUVAXGi/R37
         0mFV0wfop2T255yIuD5rYS2VnbS458AsQFiB0h3LzOZYJjGuATyKTNC/HhntepUG1iQI
         2BlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734389228; x=1734994028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GY3WfQvE6Rn3BuU/SuMZva8b6pht7cw7y89zqmyB+1E=;
        b=a7KuVuQTc25k0SFvl98m7eFDgLpjVDbDO37+dvXxC4rK9Z8FY0BrpOG7od2mn7aElq
         V+FedHwhviEHlDL4ZLeiDRaK3BxkASRN/mxK6gWgcvbQOvw4x/7gFoancBHJQ2zd2bbt
         54plhLn0cPUlUBkQ5Z7Taud9RGBnMhWTs046bAq3xOn92E6V3gZL7vugv6Wu5YGXVddd
         pj9vU+Zz+w8AlU+IjTG4wEtbcXjc/h0xp7WRekWJkzM5p1+xVFtv4p/TX/QGK+M9ad2m
         4pZPI8t2hBJneTB25sELEKWMDkM3tyNDHFGe+drsprk52Old3qg+uJXKFjWtThqB9z9G
         4baA==
X-Forwarded-Encrypted: i=1; AJvYcCWSII0NxM4SbfDOxqOvi3cekNiPfbLYqDDix3tUlG6pTKhP5zyLrwz1BXnvxzdSREm7kRxptdlAOBqVmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyet94uTgWQx2R4+QK5qNU2nipUByDUzphFQpiSrZPc94tTQzYz
	w718Gz0qEQBPzv5U0w5hrOvqTJouw1Ov7f+3hQcMZ96yX3ShWqWi5ieQyJxVzm8=
X-Gm-Gg: ASbGncufz8i+Vulj0his1PFidAh5F0Nr5/i8fvjVu4KhsCCUCaRtoIHUgbo2SiTv2jo
	xvAAO3tslpgyctpED+JP8QUCTKdxdPDlr2MTa10PEtE/a3OP4s6SwCgp7tVzjf7I291M5G1+GAo
	kKdymYG0OrSBlwUU6HkNulI2rYmt+0EvVku9npWEBkBeLd1QZh3/KlaeHzu63mZICXFttJ6/gJ2
	fl3thWaqO8CmJRadqo101Fyu9IWWu+Kuv9JuEKQuZxPGwLH3lq1pPsjGByA9gveewpANA==
X-Google-Smtp-Source: AGHT+IGpSnEPp99EJiXp4CS362L8nhr0pQBHAx37Li2yI6XqdH/kPjgtNOAm5OcJMJ34Fi87QNg6jw==
X-Received: by 2002:a05:6000:1fae:b0:386:3e0f:944b with SMTP id ffacd0b85a97d-3888e0f4676mr10698301f8f.37.1734389228503;
        Mon, 16 Dec 2024 14:47:08 -0800 (PST)
Received: from [192.168.0.27] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8016c0bsm9428971f8f.42.2024.12.16.14.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 14:47:08 -0800 (PST)
Message-ID: <b79439a5-4bed-4610-9917-3f866996d49c@linaro.org>
Date: Mon, 16 Dec 2024 22:47:06 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241216223019.70155-8-mailingradian@gmail.com>
 <20241216223019.70155-10-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241216223019.70155-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/12/2024 22:30, Richard Acayan wrote:
> As found in the Pixel 3a, the Snapdragon 670 has a camera subsystem with
> 3 CSIDs and 3 VFEs (including 1 VFE lite). Add this camera subsystem to
> the bindings.
> 
> Adapted from SC8280XP camera subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../bindings/media/qcom,sdm670-camss.yaml     | 318 ++++++++++++++++++
>   1 file changed, 318 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> new file mode 100644
> index 000000000000..f8701a8d27fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -0,0 +1,318 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SDM670 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Richard Acayan <mailingradian@gmail.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sdm670-camss
> +
> +  reg:
> +    maxItems: 9
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite
> +
> +  interrupts:
> +    maxItems: 9
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite
> +
> +  clocks:
> +    maxItems: 22
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: cpas_ahb
> +      - const: csi0
> +      - const: csi1
> +      - const: csi2
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: gcc_camera_ahb
> +      - const: gcc_camera_axi
> +      - const: soc_ahb
> +      - const: vfe0
> +      - const: vfe0_axi
> +      - const: vfe0_cphy_rx
> +      - const: vfe1
> +      - const: vfe1_axi
> +      - const: vfe1_cphy_rx
> +      - const: vfe_lite
> +      - const: vfe_lite_cphy_rx
> +
> +  iommus:
> +    maxItems: 4
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: top
> +
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
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
> +          Input port for receiving CSI data from CSIPHY0.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY1.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY2.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camera-controller@acb3000 {

isp@

> +            compatible = "qcom,sdm670-camss";
> +
> +            reg = <0 0x0acb3000 0 0x1000>,
> +                  <0 0x0acba000 0 0x1000>,
> +                  <0 0x0acc8000 0 0x1000>,
> +                  <0 0x0ac65000 0 0x1000>,
> +                  <0 0x0ac66000 0 0x1000>,
> +                  <0 0x0ac67000 0 0x1000>,
> +                  <0 0x0acaf000 0 0x4000>,
> +                  <0 0x0acb6000 0 0x4000>,
> +                  <0 0x0acc4000 0 0x4000>;
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe_lite";
> +
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe_lite";

> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY1_CLK>,
> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY2_CLK>,
> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                     <&gcc GCC_CAMERA_AHB_CLK>,
> +                     <&gcc GCC_CAMERA_AXI_CLK>,
> +                     <&camcc CAM_CC_SOC_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CLK>,
> +                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
> +            clock-names = "camnoc_axi",
> +                          "cpas_ahb",
> +                          "csi0",
> +                          "csi1",
> +                          "csi2",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "gcc_camera_ahb",
> +                          "gcc_camera_axi",
> +                          "soc_ahb",
> +                          "vfe0",
> +                          "vfe0_axi",
> +                          "vfe0_cphy_rx",
> +                          "vfe1",
> +                          "vfe1_axi",
> +                          "vfe1_cphy_rx",
> +                          "vfe_lite",
> +                          "vfe_lite_cphy_rx";
> +
> +            iommus = <&apps_smmu 0x808 0x0>,
> +                     <&apps_smmu 0x810 0x8>,
> +                     <&apps_smmu 0xc08 0x0>,
> +                     <&apps_smmu 0xc10 0x8>;
> +
> +            power-domains = <&camcc IFE_0_GDSC>,
> +                            <&camcc IFE_1_GDSC>,
> +                            <&camcc TITAN_TOP_GDSC>;
> +            power-domain-names = "ife0",
> +                                 "ife1",
> +                                 "top";
> +
> +            vdda-phy-supply = <&vreg_l1a_1p225>;
> +            vdda-pll-supply = <&vreg_l8a_1p8>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    csiphy_ep0: endpoint {
> +                        clock-lanes = <7>;
> +                        data-lanes = <0 1 2 3>;
> +                        remote-endpoint = <&front_sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };

Otherwise LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

