Return-Path: <linux-media+bounces-30663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1306CA9588B
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 23:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF0201896751
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 21:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0D421B9C5;
	Mon, 21 Apr 2025 21:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OOZbEV2U"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873811EF387;
	Mon, 21 Apr 2025 21:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272741; cv=none; b=iK1nJfxfZLU+ORSPsJvZm1jYKt8LKJfW+pdDZGuEXiueM46JWZ8ixgGmNcG9xtUInBzqkKnZbhpvCEJy4cOnlzsBwjRTLHvY/rcMXPvGA15hIGz5IUMBzh23ICEAIK66cM1fyz2ZYWfE4qDfQbKee2SG7EP9b/EJwDSLmdelcPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272741; c=relaxed/simple;
	bh=IhvTrBPT9MajnxD0h1Zm9/Y9wvCGsNsEcHqoA7mdQ5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFcxllnTJ5MqYx68h6OOMUKIX7tTauj02cyLdW0z06+Y3ZV8JdrFI85+yF2DNjSgIAb9eoeu/UlohChXl1PKpsXrKQHzWqazGnGoVOtJ/HY8U7NGUOWCAk0gsaOLdWCN3OgHZYhXsAVUtzQ2OfTv/qZRB2OfuSsXDx8Jt1AlpCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OOZbEV2U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA24C6D6;
	Mon, 21 Apr 2025 23:56:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745272611;
	bh=IhvTrBPT9MajnxD0h1Zm9/Y9wvCGsNsEcHqoA7mdQ5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OOZbEV2UQiH6RcClkRuaM/ImkkkPeLr3TDOIT3KK/1+7lP1ed4pT0AC6SgUG5QQaZ
	 +DLn7UJMiDqyQSgONrJdIbEeGliH86t+cm1ZWVSWIyvUrVAYPzmGoDZvfqIb6nUTuf
	 zQhHoyomXTWl+XU/59/yMfXNHnPX3Xi1pHUGJE5U=
Date: Tue, 22 Apr 2025 00:58:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 03/12] media: dt-bindings: Add binding doc for
 i.MX8QXP and i.MX8QM ISI
Message-ID: <20250421215855.GA31885@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-3-324f5105accc@nxp.com>
 <20250327184425.GE4861@pendragon.ideasonboard.com>
 <Z+WzZDNxpPcYScYT@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z+WzZDNxpPcYScYT@lizhi-Precision-Tower-5810>

Hi Frank,

On Thu, Mar 27, 2025 at 04:21:56PM -0400, Frank Li wrote:
> On Thu, Mar 27, 2025 at 08:44:25PM +0200, Laurent Pinchart wrote:
> > On Mon, Feb 10, 2025 at 03:59:22PM -0500, Frank Li wrote:
> > > Add binding documentation for i.MX8QXP and i.MX8QM ISI. The clock-names,
> > > power-domains, and ports differ significantly from the existing
> > > nxp,imx8-isi.yaml. Create a new file to avoid complex if-else branches.
> >
> > Mixed feelings about having different bindings files for what is
> > essentially the same IP, but I won't object.
> 
> Rob suggest split it at v1.
> 
> https://lore.kernel.org/all/20250203221659.GA130749-robh@kernel.org/
> 
> "I think this addition is borderline whether it should be its own schema
> doc. The if/then schemas are larger than the main part. The ports are
> not even the same."
> 
> >
> > > Add new file to MAINTAINERS.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > change from v2 to v3
> > > - none
> > > change from v1 to v2
> > > - create new file for 8qm and 8qxp accroding rob's suggestion.
> > > ---
> > >  .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++++++++++++++++
> > >  .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 103 ++++++++++++++++++
> > >  MAINTAINERS                                        |   1 +
> > >  3 files changed, 221 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml b/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml
> > > new file mode 100644
> > > index 0000000000000..61c551673e2a4
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml
> > > @@ -0,0 +1,117 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/fsl,imx8qm-isi.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: i.MX8QM Image Sensing Interface
> > > +
> > > +maintainers:
> > > +  - Frank Li <Frank.Li@nxp.com>
> > > +
> > > +description:
> > > +  The Image Sensing Interface (ISI) combines image processing pipelines with
> > > +  DMA engines to process and capture frames originating from a variety of
> > > +  sources. The inputs to the ISI go through Pixel Link interfaces, and their
> > > +  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
> > > +  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - fsl,imx8qm-isi
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 8
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: per0
> > > +      - const: per1
> > > +      - const: per2
> > > +      - const: per3
> > > +      - const: per4
> > > +      - const: per5
> > > +      - const: per6
> > > +      - const: per7
> > > +
> > > +  interrupts:
> > > +    maxItems: 8
> > > +
> > > +  power-domains:
> > > +    maxItems: 8
> >
> > This surprises me. The reference manual does list 8 clocks and
> > interrupts, but only 6 channels in the ISI section (for instance in
> > 15.6.1.1.4). Which one is wrong ?
> 
> Support 6 input, 8 output.
> 
> "The crossbar is a 6 input 8 output multiplexer where each output port can
> be configured to connect to any of the 6 inputs."

Which version of the reference manual are you looking at ? The latest
version I can find on the nxp.com website is "i.MX 8QuadMax Applications
Processor Reference Manual, Rev. 1.1, 05/2024", and it states on page 

    The crossbar is a 6 input, 6 output multiplexer where each output
    port can be configured to connect to any of the 6 inputs.

> 8 irq and clocks is for output dmac.
> 
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +    properties:
> > > +      port@2:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: MIPI CSI-2 RX 0
> > > +      port@3:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: MIPI CSI-2 RX 1
> > > +      port@4:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: HDMI RX
> >
> > Figure 15-59 in the reference manual list MIPI CSI-2 RX 0 and RX 1 as
> > connected to inputs 0 and 1 respectively.
> 
> Reference document should be wrong, I reference another internal document

Ah, that answers my question above.

Could you report this issue, to get it fixed in the next version of the
reference manual ? Same for the QXP.

> 0: display control 0
> 1: display control 1
> 2: csi2 rx0
> 3: csi2 rx1
> 4: hdmi rx

I assume you've tested the driver, so I'll trust those values more than
the ones from the reference manual.

> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - interrupts
> > > +  - power-domains
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +    #include <dt-bindings/clock/imx8-clock.h>
> > > +    #include <dt-bindings/clock/imx8-lpcg.h>
> > > +    #include <dt-bindings/firmware/imx/rsrc.h>
> > > +
> > > +    image-controller@58100000 {
> > > +        compatible = "fsl,imx8qm-isi";
> > > +        reg = <0x58100000 0x90000>;
> >
> > The memory map in the reference manual lists the "Pixel DMA" region as
> > ending at 0x5817ffff. Shouldn't the length of the region be 0x80000 ?
> 
> Yes, it should be 0x80000.
> 
> > > +        interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
> > > +        clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
> > > +                 <&pdma1_lpcg IMX_LPCG_CLK_0>,
> > > +                 <&pdma2_lpcg IMX_LPCG_CLK_0>,
> > > +                 <&pdma3_lpcg IMX_LPCG_CLK_0>,
> > > +                 <&pdma4_lpcg IMX_LPCG_CLK_0>,
> > > +                 <&pdma5_lpcg IMX_LPCG_CLK_0>,
> > > +                 <&pdma6_lpcg IMX_LPCG_CLK_0>,
> > > +                 <&pdma7_lpcg IMX_LPCG_CLK_0>;
> > > +        clock-names = "per0", "per1", "per2", "per3",
> > > +                      "per4", "per5", "per6", "per7";
> > > +        power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH1>,
> > > +                        <&pd IMX_SC_R_ISI_CH2>, <&pd IMX_SC_R_ISI_CH3>,
> > > +                        <&pd IMX_SC_R_ISI_CH4>, <&pd IMX_SC_R_ISI_CH5>,
> > > +                        <&pd IMX_SC_R_ISI_CH6>, <&pd IMX_SC_R_ISI_CH7>;
> > > +
> > > +        ports {
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            port@2 {
> > > +                reg = <2>;
> > > +                endpoint {
> > > +                    remote-endpoint = <&mipi_csi0_out>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +...
> > > diff --git a/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml b/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml
> > > new file mode 100644
> > > index 0000000000000..818fea0e4679f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml
> > > @@ -0,0 +1,103 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/fsl,imx8qxp-isi.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: i.MX8QXP Image Sensing Interface
> > > +
> > > +maintainers:
> > > +  - Frank Li <Frank.Li@nxp.com>
> > > +
> > > +description:
> > > +  The Image Sensing Interface (ISI) combines image processing pipelines with
> > > +  DMA engines to process and capture frames originating from a variety of
> > > +  sources. The inputs to the ISI go through Pixel Link interfaces, and their
> > > +  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
> > > +  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - fsl,imx8qxp-isi
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 5
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: per0
> > > +      - const: per4
> > > +      - const: per5
> > > +      - const: per6
> > > +      - const: per7
> > > +
> > > +  interrupts:
> > > +    maxItems: 5
> > > +
> > > +  power-domains:
> > > +    maxItems: 5
> >
> > Here you have 5 channels, while the reference manual lists 8 interrupts
> > and 6 channels in the ISI documentation.
> 
> QXP should only have 5 irqs and clocks. QM have 8, see above reply.
> 
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +    properties:
> > > +      port@2:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: MIPI CSI-2 RX 0
> > > +      port@6:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: CSI-2 Parallel RX
> >
> > Table 15-6 in the reference manual lists the parallel port as input 4.
> 
> Reference manual is wrong.
> 
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - interrupts
> > > +  - power-domains
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +    #include <dt-bindings/clock/imx8-clock.h>
> > > +    #include <dt-bindings/clock/imx8-lpcg.h>
> > > +    #include <dt-bindings/firmware/imx/rsrc.h>
> > > +
> > > +    image-controller@58100000 {
> > > +        compatible = "fsl,imx8qxp-isi";
> > > +        reg = <0x58100000 0x90000>;
> >
> > Same comment here about the registers range.
> >
> > > +        interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
> > > +        clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
> > > +                 <&pdma4_lpcg IMX_LPCG_CLK_0>,
> > > +                 <&pdma5_lpcg IMX_LPCG_CLK_0>,
> > > +                 <&pdma6_lpcg IMX_LPCG_CLK_0>,
> > > +                 <&pdma7_lpcg IMX_LPCG_CLK_0>;
> > > +        clock-names = "per0", "per4", "per5", "per6", "per7";
> > > +        power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH4>,
> > > +                        <&pd IMX_SC_R_ISI_CH5>, <&pd IMX_SC_R_ISI_CH6>,
> > > +                        <&pd IMX_SC_R_ISI_CH7>;
> > > +
> > > +        ports {
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            port@2 {
> > > +                reg = <2>;
> > > +                endpoint {
> > > +                    remote-endpoint = <&mipi_csi0_out>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 40d1b7ec30fde..f243257ef7653 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -17000,6 +17000,7 @@ NXP i.MX 8M ISI DRIVER
> > >  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >  L:	linux-media@vger.kernel.org
> > >  S:	Maintained
> > > +F:	Documentation/devicetree/bindings/media/fsl,imx8*-isi.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> >
> > Should nxp,imx8-isi.yaml be renamed to fsl,imx8-isi.yaml ?
> 
> Suppose yes, it should match one of compatible string name. This patch
> have not touch nxp,imx8-isi.yaml. we may rename it later
> 
> > >  F:	drivers/media/platform/nxp/imx8-isi/
> > >

-- 
Regards,

Laurent Pinchart

