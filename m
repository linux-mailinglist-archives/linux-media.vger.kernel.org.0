Return-Path: <linux-media+bounces-44714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BD3BE2E58
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 12:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D32843E522F
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 10:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D25B330D23;
	Thu, 16 Oct 2025 10:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9MdsCrK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C9731AF30;
	Thu, 16 Oct 2025 10:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760611409; cv=none; b=onE/XY/Ax7wuGNVLcY6o4+fjSkbAJea88yFxBRG3H83M7/Nsbslqyyrkw6IM8GlhUzkwswgxNRP1aQU3qlZ4hINvJLEElfJCGUljV9dnhGfhFE7a28+4YS+wwH1J9RczNsnF+bfG8NojF44eRiEmAHA983NHCz+SRJwmHF5emA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760611409; c=relaxed/simple;
	bh=2XOMkiJOY/4oMEMAJ4fhJh85KKZmUqpNPCfnq7C2Xmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOwT02bqCIs8ZqGG+2mMdsIAA/THmEB15qtOpSvbGPXBdw2qtOp2RqtWKQbws2l9gl9OJf4fp2Q4o3JqT6bIN384rkHdZYfc1Gxc4mW4azWYiVTQ6u9bpUGqbYTTmGpL6RR4mYIaJzulasXCzH9E0OuduWYVj+G3RY8mwaBnKOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9MdsCrK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8ECAC4CEF1;
	Thu, 16 Oct 2025 10:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760611408;
	bh=2XOMkiJOY/4oMEMAJ4fhJh85KKZmUqpNPCfnq7C2Xmk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R9MdsCrKrbrzqpaEn9hL8SOWQHnR17ROOHPy/VO6nwswnhb9gY+wVhfsaefNiV8cM
	 cxi5D+B/ImJg7S8zccWg4z258mHs/5xKcZr6NBYdfldoFGpmZOeurg0z7BQ77mLGHe
	 dSO6NtbJaIloyD5nx5GLfPaEL/SRwIL/JQJ0ciQel4C7wM87rmUgIuXaMcfGhesyGN
	 HpwXBtosv0Vs8xuDIlnVG7Jij0mDqGeeSM//vmUxoI4+lXeowhEkUWA5jjpEPvkqqL
	 6ZclUVaRiofQWqpvzpqxrgkYaB+8+FYkH+vTIuIFOvCzC+N8WBZVl+RO03F6e4vhmH
	 /g6wgzxfAVULA==
Message-ID: <edcdb19f-619b-4dc8-b3d2-8d54c9594aeb@kernel.org>
Date: Thu, 16 Oct 2025 11:43:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: dt-bindings: Add qcom,sm6150-camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com>
 <20251016-sm6150-camss-v1-1-e7f64ac32370@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251016-sm6150-camss-v1-1-e7f64ac32370@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2025 11:22, Wenmeng Liu wrote:
> Add bindings for qcom,sm6150-camss in order to support the camera
> subsystem found in Qualcomm Talos EVK board.

Understood you are doing this to support the Talos EVK but the yaml 
should describe the specific SoC.

> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,sm6150-camss.yaml          | 283 +++++++++++++++++++++
>   1 file changed, 283 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm6150-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6150-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..758bed0970f2ceee7df30b579a0f60d583a9230c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm6150-camss.yaml
> @@ -0,0 +1,283 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm6150-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM6150 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm6150-camss
> +
> +  reg:
> +    maxItems: 9
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid_lite
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite
> +
> +  clocks:
> +    maxItems: 21
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: cpas_ahb
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: gcc_axi_hf
> +      - const: soc_ahb
> +      - const: vfe0
> +      - const: vfe0_axi
> +      - const: vfe0_cphy_rx
> +      - const: vfe0_csid
> +      - const: vfe1
> +      - const: vfe1_axi
> +      - const: vfe1_cphy_rx
> +      - const: vfe1_csid
> +      - const: vfe_lite
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 9
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid_lite
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: top
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
> +      "^port@[0-2]+$":
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
> +  - power-domain-names
> +  - vdd-csiphy-1p2-supply
> +  - vdd-csiphy-1p8-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/clock/qcom,qcs615-camcc.h>
> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>

rpmh should come after qcs615.

> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: isp@acb3000 {
> +            compatible = "qcom,sm6150-camss";
> +
> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
> +                  <0x0 0x0acba000 0x0 0x1000>,
> +                  <0x0 0x0acc8000 0x0 0x1000>,
> +                  <0x0 0x0ac65000 0x0 0x1000>,
> +                  <0x0 0x0ac66000 0x0 0x1000>,
> +                  <0x0 0x0ac67000 0x0 0x1000>,
> +                  <0x0 0x0acaf000 0x0 0x4000>,
> +                  <0x0 0x0acb6000 0x0 0x4000>,
> +                  <0x0 0x0acc4000 0x0 0x4000>;
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid_lite",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe_lite";
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY1_CLK>,
> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY2_CLK>,
> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&camcc CAM_CC_SOC_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CLK>,
> +                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +            clock-names = "camnoc_axi",
> +                          "cpas_ahb",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "gcc_axi_hf",
> +                          "soc_ahb",
> +                          "vfe0",
> +                          "vfe0_axi",
> +                          "vfe0_cphy_rx",
> +                          "vfe0_csid",
> +                          "vfe1",
> +                          "vfe1_axi",
> +                          "vfe1_cphy_rx",
> +                          "vfe1_csid",
> +                          "vfe_lite",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid";
> +
> +            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names = "ahb",
> +                                 "hf_mnoc";
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
> +                              "csid_lite",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe_lite";
> +
> +            iommus = <&apps_smmu 0x820 0x40>;
> +
> +            power-domains = <&camcc IFE_0_GDSC>,
> +                            <&camcc IFE_1_GDSC>,
> +                            <&camcc TITAN_TOP_GDSC>;
> +            power-domain-names = "ife0",
> +                                 "ife1",
> +                                 "top";
> +
> +            vdd-csiphy-1p2-supply = <&vreg_l11a_1p2>;
> +            vdd-csiphy-1p8-supply = <&vreg_l12a_1p8>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    csiphy_ep0: endpoint {
> +                        data-lanes = <0 1>;
> +                        remote-endpoint = <&sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 


