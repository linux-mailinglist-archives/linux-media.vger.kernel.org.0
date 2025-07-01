Return-Path: <linux-media+bounces-36467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D87AF03D8
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 21:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D56E37AD89D
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 19:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D52280CD5;
	Tue,  1 Jul 2025 19:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a27X8C34"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494B6275AED;
	Tue,  1 Jul 2025 19:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751398402; cv=none; b=fUJmrwo64YomNRNG/uLilBlWJ9s7+TR4nSOyWI/+sjqwwT7o9PcJmzclZSbd0sXYi4XXG95hvpCW7uhQpf6OKnwkyEFj59LThO5PmnterYEMZEbp/s0Gh6R0qeQjgOfxkBtRxTkSvPdupmATAUfsZgLC4aRpDUWspuAdzj+LYXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751398402; c=relaxed/simple;
	bh=e0LWiiDV7mWe0O80pfeWjuB7jaudkzgYWw5HdH9efCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ad1Cv323G8x6IFTcOQqRWdSCg398dbKFhNllQ3blmHTUkYsHHoUZd23O4ZoX1UO46Gw9Me78ysxUZB0KG7f14itReBGn+LBVVof+FVOQgArN60SFWlaiw4pgNJrakWqPTE9DNfjUE1CQM7MIp5u7v1pIQHZyW08EWBTHLrST9JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a27X8C34; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E2056778;
	Tue,  1 Jul 2025 21:32:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751398377;
	bh=e0LWiiDV7mWe0O80pfeWjuB7jaudkzgYWw5HdH9efCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a27X8C34QS5VN4dnhLZAKZSUd6LBGiQLq4F//Qhwj82D7UqXa6QniZMFYVbBPThKq
	 aRM8wspnHZVliCC3L6fwPQzCJe5cxY6RPNn0Em9d8xjueZhI9cTI3K+5Jf3FW0XGOJ
	 mLz8q8cTw5EXbXeOUJH/AdoqAuVcMAp/2dw8JkJg=
Date: Tue, 1 Jul 2025 22:32:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH 2/5] dt-bindings: media: add i.MX parallel csi support
Message-ID: <20250701193253.GC16835@pendragon.ideasonboard.com>
References: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
 <20250630-imx8qxp_pcam-v1-2-eccd38d99201@nxp.com>
 <20250630225340.GE15184@pendragon.ideasonboard.com>
 <aGP2yT9ID1E0BepB@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGP2yT9ID1E0BepB@lizhi-Precision-Tower-5810>

On Tue, Jul 01, 2025 at 10:55:32AM -0400, Frank Li wrote:
> On Tue, Jul 01, 2025 at 01:53:40AM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 30, 2025 at 06:28:18PM -0400, Frank Li wrote:
> > > From: Alice Yuan <alice.yuan@nxp.com>
> > >
> > > Document the binding for parallel CSI controller found in i.MX8QXP, i.MX93
> > > and i.MX91 SoCs.
> > >
> > > Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  .../bindings/media/fsl,imx93-parallel-csi.yaml     | 108 +++++++++++++++++++++
> > >  MAINTAINERS                                        |   1 +
> > >  2 files changed, 109 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml b/Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
> > > new file mode 100644
> > > index 0000000000000..b4657c913adad
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
> > > @@ -0,0 +1,108 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/fsl,imx93-parallel-csi.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: i.MX8/9 Parallel Camera Interface
> > > +
> > > +maintainers:
> > > +  - Frank Li <Frank.Li@nxp.com>
> > > +
> > > +description: |
> > > +  This is device node for the Parallel Camera Interface which enables the
> > > +  chip to connect directly to external Parallel CMOS image sensors.
> > > +  Supports up to 80MHz input clock from sensor.
> > > +  Supports the following input data formats
> > > +    - 8-bit/10-bit Camera Sensor Interface (CSI)
> > > +    - 8-bit data port for RGB, YCbCr, and YUV data input
> > > +    - 8-bit/10-bit data ports for Bayer data input
> > > +  Parallel Camera Interface is hooked to the Imaging subsystem via the
> > > +  Pixel Link.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - const: fsl,imx8qxp-parallel-csi
> >
> > Is there any chance we could avoid calling this "csi", given that the
> > whole block is called "Parallel Capture Interface" in the reference
> > manual ? "CSI" is horribly confusing as it usually refers to MIPI CSI-2.
> > I suppose calling it "PCI" for "Parallel Capture Interface" wouldn't
> > help :-/
> 
> PCI is too famous for PCI(Peripheral Component Interconnec) bus. It will be
> more confused.

Yes, I wasn't really proposing it. We have too few TLAs :)

> Can we use pcam? fsl,imx8qxp-pcam

Brainstorming a bit, we could use use pcif (Pixel Capture InterFace).

> > > +      - items:
> > > +          - enum:
> > > +              - fsl,imx91-parallel-csi
> > > +          - const: fsl,imx93-parallel-csi
> > > +      - const: fsl,imx93-parallel-csi
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 2
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: pixel
> > > +      - const: ipg
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description:
> > > +          Input port node.
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description:
> > > +          Output port node.
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - ports
> >
> > Patch 4/5 lists a power domain, and so does the example below for
> > i.MX93. Should the power-domains property be mandatory ?
> >
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/imx93-clock.h>
> > > +    #include <dt-bindings/power/fsl,imx93-power.h>
> > > +
> > > +    parallel-csi@4ac10070 {
> > > +        compatible = "fsl,imx93-parallel-csi";
> > > +        reg = <0x4ac10070 0x10>;
> >
> > The i.MX93 reference manual doesn't document the register set for this
> > block, so I have a hard time reviewing this. Is there a plan to publish
> > a new version of the reference manual with the complete documentation
> > for the parallel interface ?
> >
> > > +        clocks = <&clk IMX93_CLK_MIPI_CSI_GATE>,
> > > +                 <&clk IMX93_CLK_MEDIA_APB>;
> > > +        clock-names = "pixel", "ipg";
> > > +        assigned-clocks = <&clk IMX93_CLK_CAM_PIX>;
> > > +        assigned-clock-parents = <&clk IMX93_CLK_VIDEO_PLL>;
> > > +        assigned-clock-rates = <140000000>;
> > > +        power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
> > > +
> > > +        ports {
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            port@0 {
> > > +                reg = <0>;
> > > +
> > > +                endpoint {
> > > +                    remote-endpoint = <&mt9m114_ep>;
> > > +                };
> > > +            };
> > > +
> > > +            port@1 {
> > > +                reg = <1>;
> > > +                endpoint {
> > > +                    remote-endpoint = <&isi_in>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 8dc0f6609d1fe..3bd6772c11539 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15107,6 +15107,7 @@ L:	linux-media@vger.kernel.org
> > >  S:	Maintained
> > >  T:	git git://linuxtv.org/media.git
> > >  F:	Documentation/admin-guide/media/imx7.rst
> > > +F:	Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml

-- 
Regards,

Laurent Pinchart

