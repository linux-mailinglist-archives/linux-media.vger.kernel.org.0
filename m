Return-Path: <linux-media+bounces-21462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7459CF310
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 18:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 758ACB3602E
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 16:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B431D5174;
	Fri, 15 Nov 2024 16:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9Tj0mrb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343E7762E0;
	Fri, 15 Nov 2024 16:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731689434; cv=none; b=KgF4jSK1p9CJc0JA5yAnv0hVBUPQG1O5tVkGBeZBbUaggbRs2zyM91frsm/mEfoY7HUh+Sf8Mu8dWQljwbwJXn1rpvlOcY2OvMm6JzDQUvzgilFkPQO5IFZRPiYiv9p5x4/js/5n/0QjZb6u0HCMd+LSxI8VAxadSMMxPNPMd5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731689434; c=relaxed/simple;
	bh=1a6nd/GYT/Zj4xa8bJgguHQP2TbHcMHmW38I1Csrm6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+V+WMMVsmRQdulyK4M54HCZHQ0o3s2Kjnv0+rS4HUmVV/JaJJqUDUh3cjSYgKc/9juWTOKrGrAaB7/bX1ghHOSrCMvUTSFti9d+3ovPzTsPzhDYuEfpPGSm/JXeCSpc8hkDmv0ClvtnK9rlZYtWqivlZ1LEzlqioKanwMlrkY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9Tj0mrb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6E0C4CECF;
	Fri, 15 Nov 2024 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731689433;
	bh=1a6nd/GYT/Zj4xa8bJgguHQP2TbHcMHmW38I1Csrm6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n9Tj0mrbjhtOfkeQiN10bbq0lwBDggIUs+VL88KUbFCwYemFlH5MCh+QZ7mYia/hG
	 4GDZ87GABMjk+7Mu4HcSjYOXjyuMlC3eI/nX6TrFMzBJrWQYdj6KzC238HDzPXr+Mh
	 bpd1JPR7RrSrzF5SLMDv09LOIVEwv429N7cBq5groIWYG65ZeGxnmc7q14mUNcZOOZ
	 4Q6kVJL6SCT7xPWUP9RODqWVwnbO1PO7NJwJ7fLhGPD1QJMA1pcTA321LFcQltbEcm
	 RZ2dFbty+8R980kSr+W9HHt2Fmf2jmT6wlEJ8ArdRvXjcVolMnXQfgZtIbZ7HdMrQp
	 dCebfr2kP+rUA==
Date: Fri, 15 Nov 2024 10:50:31 -0600
From: Rob Herring <robh@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
	mchehab@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
	konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
	cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH v5 1/5] media: dt-bindings: Add qcom,sc7280-camss
Message-ID: <20241115165031.GA3344225-robh@kernel.org>
References: <20241112173032.2740119-1-quic_vikramsa@quicinc.com>
 <20241112173032.2740119-2-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112173032.2740119-2-quic_vikramsa@quicinc.com>

On Tue, Nov 12, 2024 at 11:00:28PM +0530, Vikram Sharma wrote:
> Add bindings for qcom,sc7280-camss to support the camera subsystem
> on the SC7280 platform.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  .../bindings/media/qcom,sc7280-camss.yaml     | 415 ++++++++++++++++++
>  1 file changed, 415 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> new file mode 100644
> index 000000000000..b27d4af8a64e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> @@ -0,0 +1,415 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SC7280 CAMSS ISP
> +
> +maintainers:
> +  - Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
> +  - Hariram Purushothaman <hariramp@quicinc.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7280-camss
> +
> +  clocks:
> +    maxItems: 32
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: gcc_camera_ahb
> +      - const: gcc_cam_hf_axi
> +      - const: soc_ahb
> +      - const: vfe0
> +      - const: vfe0_axi
> +      - const: vfe0_cphy_rx
> +      - const: vfe0_csid
> +      - const: vfe0_lite
> +      - const: vfe0_lite_cphy_rx
> +      - const: vfe0_lite_csid
> +      - const: vfe1
> +      - const: vfe1_axi
> +      - const: vfe1_cphy_rx
> +      - const: vfe1_csid
> +      - const: vfe1_lite
> +      - const: vfe1_lite_cphy_rx
> +      - const: vfe1_lite_csid
> +      - const: vfe2
> +      - const: vfe2_axi
> +      - const: vfe2_cphy_rx
> +      - const: vfe2_csid
> +
> +  interrupts:
> +    maxItems: 15
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid0_lite
> +      - const: csid1
> +      - const: csid1_lite
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: vfe0
> +      - const: vfe0_lite
> +      - const: vfe1
> +      - const: vfe1_lite
> +      - const: vfe2
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_0
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: ife2
> +      - const: top
> +
> +  ports:

Nodes go after properties.

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

You have the same description for every port. How does one distinguish 
each port?

Looks like there are 5 channels, but I can only guess that looking at 
clock and interrupt names...

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
> +      port@4:
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
> +    maxItems: 15
> +
> +  reg-names:

reg and reg-names go after 'compatible'. See the documented ordering.

> +    items:
> +      - const: csid0
> +      - const: csid0_lite
> +      - const: csid1
> +      - const: csid1_lite
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: vfe0
> +      - const: vfe0_lite
> +      - const: vfe1
> +      - const: vfe1_lite
> +      - const: vfe2
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
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sc7280.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +    #include <dt-bindings/interconnect/qcom,sc7280.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: camss@acaf000 {
> +            compatible = "qcom,sc7280-camss";
> +
> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
> +                  <0x0 0x0acc8000 0x0 0x1000>,
> +                  <0x0 0x0acba000 0x0 0x1000>,
> +                  <0x0 0x0accf000 0x0 0x1000>,
> +                  <0x0 0x0acc1000 0x0 0x1000>,
> +                  <0x0 0x0ace0000 0x0 0x2000>,
> +                  <0x0 0x0ace2000 0x0 0x2000>,
> +                  <0x0 0x0ace4000 0x0 0x2000>,
> +                  <0x0 0x0ace6000 0x0 0x2000>,
> +                  <0x0 0x0ace8000 0x0 0x2000>,
> +                  <0x0 0x0acaf000 0x0 0x4000>,
> +                  <0x0 0x0acc4000 0x0 0x4000>,
> +                  <0x0 0x0acb6000 0x0 0x4000>,
> +                  <0x0 0x0accb000 0x0 0x4000>,
> +                  <0x0 0x0acbd000 0x0 0x4000>;
> +            reg-names = "csid0",
> +                        "csid0_lite",
> +                        "csid1",
> +                        "csid1_lite",
> +                        "csid2",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "csiphy3",
> +                        "csiphy4",
> +                        "vfe0",
> +                        "vfe0_lite",
> +                        "vfe1",
> +                        "vfe1_lite",
> +                        "vfe2";
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY1_CLK>,
> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY2_CLK>,
> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY3_CLK>,
> +                     <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY4_CLK>,
> +                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +                     <&gcc GCC_CAMERA_AHB_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CLK>,
> +                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_1_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
> +                     <&camcc CAM_CC_IFE_2_CLK>,
> +                     <&camcc CAM_CC_IFE_2_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_2_CSID_CLK>;
> +            clock-names = "camnoc_axi",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy3",
> +                          "csiphy3_timer",
> +                          "csiphy4",
> +                          "csiphy4_timer",
> +                          "gcc_camera_ahb",
> +                          "gcc_cam_hf_axi",
> +                          "soc_ahb",
> +                          "vfe0",
> +                          "vfe0_axi",
> +                          "vfe0_cphy_rx",
> +                          "vfe0_csid",
> +                          "vfe0_lite",
> +                          "vfe0_lite_cphy_rx",
> +                          "vfe0_lite_csid",
> +                          "vfe1",
> +                          "vfe1_axi",
> +                          "vfe1_cphy_rx",
> +                          "vfe1_csid",
> +                          "vfe1_lite",
> +                          "vfe1_lite_cphy_rx",
> +                          "vfe1_lite_csid",
> +                          "vfe2",
> +                          "vfe2_axi",
> +                          "vfe2_cphy_rx",
> +                          "vfe2_csid";
> +
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid0_lite",
> +                              "csid1",
> +                              "csid1_lite",
> +                              "csid2",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy3",
> +                              "csiphy4",
> +                              "vfe0",
> +                              "vfe0_lite",
> +                              "vfe1",
> +                              "vfe1_lite",
> +                              "vfe2";
> +
> +            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
> +                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
> +            interconnect-names = "ahb", "hf_0";
> +
> +            iommus = <&apps_smmu 0x800 0x4e0>;
> +
> +            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +                            <&camcc CAM_CC_IFE_1_GDSC>,
> +                            <&camcc CAM_CC_IFE_2_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +            power-domain-names = "ife0", "ife1", "ife2", "top";
> +
> +            vdda-phy-supply = <&vreg_l10c_0p88>;
> +            vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +            };
> +        };
> +    };
> -- 
> 2.25.1
> 

