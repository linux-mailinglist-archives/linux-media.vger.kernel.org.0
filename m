Return-Path: <linux-media+bounces-24186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 874019FEA8A
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 21:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C1B21882E65
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 20:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC9019AD86;
	Mon, 30 Dec 2024 20:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnO3JblX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29052173;
	Mon, 30 Dec 2024 20:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735589320; cv=none; b=KkEIFSX5Fw/2OFsncBeX7uI/G6P+wusX9liUizXJmGX5JDVhIv5qmnPMiIFhK9dZHEC6lVkQsThZBH04TibUfA604O8J0Ad1QgbK07ud513OAxfhkVo3ZdCZLTIbVR44vwoyhqOrIvxT+cwJMNDg+wgt3cLD4ygdjDE4WFfg4Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735589320; c=relaxed/simple;
	bh=iF55zMP9L3C3aKSEuO3ZPhsPTgILQXLSOfQH2gO0RfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cr9n0Jep0326gqxuoUmhKnLZtXJGfJSGIs8XnzQk/IWlU6Sh+41mbjC7+Q5DXNI/4y5J55Gqf0KpqtfSQ0bl2vNwiy6DLAnEfHPEOqigmsIqyMSmZTtb/uuWduD4bird4BfEQuCVd+wyRGxJJvQZMZQMT5Mip8wJ+iLGeSQLRZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnO3JblX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9E8C4CED0;
	Mon, 30 Dec 2024 20:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735589319;
	bh=iF55zMP9L3C3aKSEuO3ZPhsPTgILQXLSOfQH2gO0RfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WnO3JblXuVzBQChHdlG4g7jmRArjY2JM6usCAqyNa1KByG1JIBxjqdBN8eF2Dvozb
	 Ee6a6dJCXB7rnwBOiu99+O/E3Ufp+7ZGjq9r5T8cN7y/QG1lYpsl3IGOg7DemD8o3v
	 ppdWgUoIKv2EPGKEQojkuRuYzlnRc/dz/ZZNYvzruk+A1vf1EmgHybyOLAx9SmvrAW
	 uvAFc4irQxqTB1qfvDIOyPLdhsD4jbLRR8HVnItGpRGY3xIHSYAP8zWjza62puhSqV
	 AepduyBmGTEuOgkbw1LQXgzTJ1f6Ov3rbWOcX+dYCV7DKYDA4SahJVNuwZO0F9OibI
	 XKkRKxxePqT2g==
Date: Mon, 30 Dec 2024 14:08:37 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 3/6] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
Message-ID: <20241230200837.GA2477354-robh@kernel.org>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
 <20241217-v6-8-topic-rk3568-vicap-v2-3-b1d488fcc0d3@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-v6-8-topic-rk3568-vicap-v2-3-b1d488fcc0d3@wolfvision.net>

On Tue, Dec 17, 2024 at 04:55:15PM +0100, Michael Riesch wrote:
> Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 168 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 169 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> new file mode 100644
> index 000000000000..ef7b14ca6879
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> @@ -0,0 +1,168 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-vicap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3568 Video Capture (VICAP)
> +
> +maintainers:
> +  - Michael Riesch <michael.riesch@wolfvision.net>
> +
> +description:
> +  The Rockchip RK3568 Video Capture (VICAP) block features a digital video
> +  port (DVP, a parallel video interface) and a MIPI CSI-2 port. It receives
> +  the data from camera sensors, video decoders, or other companion ICs and
> +  transfers it into system main memory by AXI bus.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3568-vicap
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ACLK
> +      - description: HCLK
> +      - description: DCLK
> +      - description: ICLK
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: dclk
> +      - const: iclk
> +
> +  rockchip,cif-clk-delaynum:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 127
> +    description:
> +      Delay the DVP path clock input to align the sampling phase, only valid
> +      in dual edge sampling mode.
> +
> +  iommus:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: ARST
> +      - description: HRST
> +      - description: DRST
> +      - description: PRST
> +      - description: IRST
> +
> +  reset-names:
> +    items:
> +      - const: arst
> +      - const: hrst
> +      - const: drst
> +      - const: prst
> +      - const: irst
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to general register file used for video input block control.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: input port on the parallel interface

What about the CSI-2 interface?

> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum: [5, 6]
> +
> +            required:
> +              - bus-type
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/rk3568-power.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    parent {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        vicap: video-capture@fdfe0000 {
> +            compatible = "rockchip,rk3568-vicap";
> +            reg = <0x0 0xfdfe0000 0x0 0x200>;
> +            interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
> +            assigned-clocks = <&cru DCLK_VICAP>;
> +            assigned-clock-rates = <300000000>;
> +            clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
> +                     <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
> +            clock-names = "aclk", "hclk", "dclk", "iclk";
> +            iommus = <&vicap_mmu>;
> +            power-domains = <&power RK3568_PD_VI>;
> +            resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
> +                     <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
> +                     <&cru SRST_I_VICAP>;
> +            reset-names = "arst", "hrst", "drst", "prst", "irst";
> +            rockchip,grf = <&grf>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                vicap_dvp: port@0 {
> +                    reg = <0>;
> +
> +                    vicap_dvp_input: endpoint {
> +                        bus-type = <MEDIA_BUS_TYPE_BT656>;
> +                        bus-width = <16>;
> +                        pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
> +                        remote-endpoint = <&it6801_output>;
> +                    };
> +                };
> +
> +                vicap_mipi: port@1 {
> +                    reg = <1>;
> +                };
> +            };
> +        };
> +
> +        vicap_mmu: iommu@fdfe0800 {
> +            compatible = "rockchip,rk3568-iommu";

Not part of this binding, so drop this node.

> +            reg = <0x0 0xfdfe0800 0x0 0x100>;
> +            interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
> +            clock-names = "aclk", "iface";
> +            #iommu-cells = <0>;
> +            power-domains = <&power RK3568_PD_VI>;
> +            rockchip,disable-mmu-reset;
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1138c8858bc7..8dbeb2927a08 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20223,6 +20223,7 @@ M:	Michael Riesch <michael.riesch@wolfvision.net>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
>  
>  ROCKCHIP CRYPTO DRIVERS
>  M:	Corentin Labbe <clabbe@baylibre.com>
> 
> -- 
> 2.34.1
> 

