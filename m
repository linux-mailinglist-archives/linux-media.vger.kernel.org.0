Return-Path: <linux-media+bounces-13915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1199691216C
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 12:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 336EF1C22121
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 10:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96E517106B;
	Fri, 21 Jun 2024 10:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/xsUEMs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C4816EB6D;
	Fri, 21 Jun 2024 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718964159; cv=none; b=CGnYtg9cL0AGualWdo/5Ue+yyBCKTPA3iqf8JjzQDkrKUROmmxjjKtceEpzuqA1juFfz4stp1nUYqWhwYKVV3aZyfkXuvehXIvKHpyWvXv9qJDfojwV8yKwzT04S2ejwgsHnmjtE+m5yB3SKnV2d8aY++mr0xYUayNjuhkWm8XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718964159; c=relaxed/simple;
	bh=dmwsNvDKdvJyzog0BmeRIafnVzdlhm+iSDk33lXZPfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c56/YRT8bmpNcgN8shlKaK9bPo78ML2cd/WU8AshW67x7MBaqpvYaO/772+IQvg4RGBZwNWe73z+nE9bB9AxIbeJRFrA9k5MWrOkkLY8BbJ+mQw3io3lGNQTkbTvefqnAw1EMmi0hQYqQz7P7FY49yN+4xAVRJbnP1D6dsaHdt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/xsUEMs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491BBC2BBFC;
	Fri, 21 Jun 2024 10:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718964158;
	bh=dmwsNvDKdvJyzog0BmeRIafnVzdlhm+iSDk33lXZPfo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F/xsUEMsS04zCX8+SaxYsPUhm75Yu/RgnmwFnjWNa2r8esrMvPBl/oI1k0AYPKxja
	 5iHxbHR08oU4yLXxEQBTLo3Ofr8QOQsyNsKJyXo0PC1FpOPg5uaeN+km9UzwuFdzq+
	 WhzIkK47LNLg3I9zaXIUA3WxEMmdC3PhKRp+TCJwmfD9ctcCtmJGjt8/tC9XUvanyq
	 iv4eYdtgW54d3c0PACWzKPFQ1n85eOOVoa1y2blkrIxnA1BbyYoXBvNFpWZ+foIEzl
	 agenxxmoYDkecirxZ0Neghibe+ng3PpU2q8b5/4mqFRzJThvI+JkZ5IVDQ35yOjmt6
	 +YHV7iOVrDCBg==
Message-ID: <c3e2e7a1-e424-4808-a690-a457e0526f3f@kernel.org>
Date: Fri, 21 Jun 2024 12:02:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: dt-bindings: media: camss: Add
 qcom,sc7180-camss binding
To: gchan9527@gmail.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-1-14937929f30e@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240621-b4-sc7180-camss-v1-1-14937929f30e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/06/2024 11:40, George Chan via B4 Relay wrote:
> From: George Chan <gchan9527@gmail.com>
> 
> Add bindings for qcom,sc7180-camss in order to support the camera
> subsystem for sm7125 as found in the Xiaomi Redmi 9 Pro cellphone.
> 
> Signed-off-by: George Chan <gchan9527@gmail.com>

Subject: just one media (first). No need to write media: media: ...


A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18


> ---
>  .../bindings/media/qcom,sc7180-camss.yaml          | 324 +++++++++++++++++++++
>  1 file changed, 324 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-camss.yaml
> new file mode 100644
> index 000000000000..4dc10c32ee9c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-camss.yaml
> @@ -0,0 +1,324 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CAMSS ISP

What is CAMSS?

> +
> +maintainers:
> +  - Robert Foss <robert.foss@linaro.org>

For sure this is not true. Robert does not work in Linaro and I doubt he
cares that much about camss.

> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7180-camss
> +
> +  clocks:
> +    minItems: 25

Drop minItems

> +    maxItems: 25
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: cpas_ahb
> +      - const: cphy_rx_src
> +      - const: csi0
> +      - const: csi1
> +      - const: csi2
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: gcc_camera_ahb
> +      - const: gcc_camera_axi
> +      - const: soc_ahb
> +      - const: vfe0_axi
> +      - const: vfe0
> +      - const: vfe0_cphy_rx
> +      - const: vfe1_axi
> +      - const: vfe1
> +      - const: vfe1_cphy_rx
> +      - const: vfe_lite
> +      - const: vfe_lite_cphy_rx
> +
> +  interrupts:
> +    minItems: 10

Drop minItems

> +    maxItems: 10
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite
> +
> +  iommus:
> +    maxItems: 4
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
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
> +            required:
> +              - data-lanes
> +
> +      port@2:
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
> +            required:
> +              - data-lanes
> +
> +      port@3:
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
> +            required:
> +              - data-lanes
> +
> +  reg:
> +    minItems: 10

Drop minItems

> +    maxItems: 10
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite
> +
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
> +required:
> +  - clock-names
> +  - clocks
> +  - compatible

Keep the list ordered, the same as list properties.

> +  - interrupt-names
> +  - interrupts
> +  - iommus
> +  - power-domains
> +  - reg
> +  - reg-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,camcc-sc7180.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      camss: camss@acb3000 {
> +        compatible = "qcom,sc7180-camss";
> +
> +        clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
> +          <&clock_camcc CAM_CC_CPAS_AHB_CLK>,

Missed alignment with previous <.

> +          <&clock_camcc CAM_CC_IFE_0_CSID_CLK>,
> +          <&clock_camcc CAM_CC_IFE_1_CSID_CLK>,
> +          <&clock_camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +          <&clock_camcc CAM_CC_CSIPHY0_CLK>,
> +          <&clock_camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +          <&clock_camcc CAM_CC_CSIPHY1_CLK>,
> +          <&clock_camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +          <&clock_camcc CAM_CC_CSIPHY2_CLK>,
> +          <&clock_camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +          <&clock_camcc CAM_CC_CSIPHY3_CLK>,
> +          <&clock_camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +          <&gcc GCC_CAMERA_AHB_CLK>,
> +          <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +          <&clock_camcc CAM_CC_SOC_AHB_CLK>,
> +          <&clock_camcc CAM_CC_IFE_0_AXI_CLK>,
> +          <&clock_camcc CAM_CC_IFE_0_CLK>,
> +          <&clock_camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +          <&clock_camcc CAM_CC_IFE_1_AXI_CLK>,
> +          <&clock_camcc CAM_CC_IFE_1_CLK>,
> +          <&clock_camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +          <&clock_camcc CAM_CC_IFE_LITE_CLK>,
> +          <&clock_camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
> +
> +        clock-names = "camnoc_axi",
> +          "cpas_ahb",

Same problem.

> +          "csi0",
> +          "csi1",
> +          "csi2",
> +          "csiphy0",
> +          "csiphy0_timer",
> +          "csiphy1",
> +          "csiphy1_timer",
> +          "csiphy2",
> +          "csiphy2_timer",
> +          "csiphy3",
> +          "csiphy3_timer",
> +          "gcc_camera_ahb",
> +          "gcc_camera_axi",
> +          "soc_ahb",
> +          "vfe0_axi",
> +          "vfe0",
> +          "vfe0_cphy_rx",
> +          "vfe1_axi",
> +          "vfe1",
> +          "vfe1_cphy_rx",
> +          "vfe_lite",
> +          "vfe_lite_cphy_rx";
> +
> +        interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        interrupt-names = "csid0",
> +          "csid1",
> +          "csid2",
> +          "csiphy0",
> +          "csiphy1",
> +          "csiphy2",
> +          "csiphy3",
> +          "vfe0",
> +          "vfe1",
> +          "vfe_lite";
> +
> +        iommus = <&apps_smmu 0x820 0x0>,
> +          <&apps_smmu 0x840 0x0>,
> +          <&apps_smmu 0x860 0x0>;
> +
> +        power-domains = <&camcc IFE_0_GDSC>,
> +          <&camcc IFE_1_GDSC>,
> +          <&camcc TITAN_TOP_GDSC>;
> +
> +        reg = <0 0xacb3000 0 0x1000>,

reg is always the second property. See DTS coding style.

> +          <0 0xacba000 0 0x1000>,
> +          <0 0xacc8000 0 0x1000>,
> +          <0 0xac65000 0 0x1000>,
> +          <0 0xac66000 0 0x1000>,
> +          <0 0xac67000 0 0x1000>,
> +          <0 0xac68000 0 0x1000>,
> +          <0 0xacaf000 0 0x4000>,
> +          <0 0xacb6000 0 0x4000>,
> +          <0 0xacc4000 0 0x4000>;
> +
> +        reg-names = "csid0",

So this will be the third property.



Best regards,
Krzysztof


