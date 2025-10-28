Return-Path: <linux-media+bounces-45759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C2CC138CD
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 55A89501DEF
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C712D877B;
	Tue, 28 Oct 2025 08:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jIKURGR5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D56824BD;
	Tue, 28 Oct 2025 08:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761640090; cv=none; b=Pp0kNd4brSGJ1oe9K4g4x7jL+DQZmFV4tIbVpq4Qx5fxG896OCwceL7pgJvqaF60nrKZWaJja6O57Wn2n2h2IlqSrq36p4kq3k36Rc84kV+hGeJfhXH0k4QFFC2Z1H7P+YgCc5uuK1dBr6n+YfxyYN8f41aUdI0NcyeNSLXChGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761640090; c=relaxed/simple;
	bh=oNlpkQO5cst6KsAukF9U7bQZ+Sa47oF2EkKRJDLHMeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OOH6EoQqE+ICnCi4/8bcLxBHA10KFCqjbYINsmlE9mPyPNEUjQVCDmRLQuzm0hYe2TwBrOh7RYyfDX4/u4Z40hIxV4MLmpICtJ/Uk1sWuRHuefN/0pzoaXcU5Xgco1jSWlZ4YuOW2L1tqjhgcKi04a5Hogqlyla7+8d7C9uOWmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jIKURGR5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E545116CD;
	Tue, 28 Oct 2025 09:26:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761639978;
	bh=oNlpkQO5cst6KsAukF9U7bQZ+Sa47oF2EkKRJDLHMeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jIKURGR5U/AmwLf+zhFNmroQF9QQUBrT0sjXi/qZVnGFcfUdImrsM2j8NnW9HLYXZ
	 gcATKbqYBMHtB0VeGe2ohVjfTiTypIovnOmECF9Un2qglKWztUtcfYYxECAvEG3R3z
	 7BUVyheYs5jGK5m14Z1JQbpUiQLyX6EuiMkr8t4w=
Date: Tue, 28 Oct 2025 10:27:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev, Luis Oliveira <lolivei@synopsys.com>
Subject: Re: [PATCH v3 01/31] dt-bindings: media: add DW MIPI CSI-2 Host
 support
Message-ID: <20251028082753.GZ13023@pendragon.ideasonboard.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-1-c9286fbb34b9@nxp.com>
 <aP8t3YClrZxOnHea@valkosipuli.retiisi.eu>
 <aP+enPOHPkvZAkzS@lizhi-Precision-Tower-5810>
 <aP_bSQUIle_9-L-7@valkosipuli.retiisi.eu>
 <aP/ehdkppeVr5G6H@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP/ehdkppeVr5G6H@lizhi-Precision-Tower-5810>

On Mon, Oct 27, 2025 at 05:05:09PM -0400, Frank Li wrote:
> On Mon, Oct 27, 2025 at 10:51:21PM +0200, Sakari Ailus wrote:
> > On Mon, Oct 27, 2025 at 12:32:28PM -0400, Frank Li wrote:
> > > On Mon, Oct 27, 2025 at 10:31:25AM +0200, Sakari Ailus wrote:
> > > > On Thu, Aug 21, 2025 at 04:15:36PM -0400, Frank Li wrote:
> > > > > From: Eugen Hristev <eugen.hristev@linaro.org>
> > > > >
> > > > > Add bindings for Synopsys DesignWare MIPI CSI-2 host, which used at i.MX93
> > > > > and i.MX95 platform.
> > > > >
> > > > > Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> > > > > Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > ---
> > > > > Change in v3
> > > > > - drop remote-endpoint: true
> > > > > - drop clock-lanes
> > > > >
> > > > > Change in v2
> > > > > - remove Eugen Hristev <eugen.hristev@microchip.com> from mantainer.
> > > > > - update ugen Hristev's s-o-b tag to align original author's email address
> > > > > - remove single snps,dw-mipi-csi2-v150 compatible string
> > > > > - move additionalProperties after required
> > > > > ---
> > > > >  .../bindings/media/snps,dw-mipi-csi2-v150.yaml     | 151 +++++++++++++++++++++
> > > > >  MAINTAINERS                                        |   1 +
> > > > >  2 files changed, 152 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> > > > > new file mode 100644
> > > > > index 0000000000000000000000000000000000000000..d950daa4ee9cfd504ef84b83271b2a1b710ffd6b
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> > > > > @@ -0,0 +1,151 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/media/snps,dw-mipi-csi2-v150.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Synopsys DesignWare CSI-2 Host controller (csi2host)
> > > > > +
> > > > > +maintainers:
> > > > > +  - Frank Li <Frank.Li@nxp.com>
> > > > > +
> > > > > +description:
> > > > > +  CSI2HOST is used to receive image coming from an MIPI CSI-2 compatible
> > > > > +  camera. It will convert the incoming CSI-2 stream into a dedicated
> > > > > +  interface called the Synopsys IDI (Image Data Interface).
> > > > > +  This interface is a 32-bit SoC internal only, and can be assimilated
> > > > > +  with a CSI-2 interface.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    items:
> > > > > +      - enum:
> > > > > +          - fsl,imx93-mipi-csi2
> > > > > +      - const: snps,dw-mipi-csi2-v150
> > > > > +
> > > > > +  reg:
> > > > > +    items:
> > > > > +      - description: MIPI CSI-2 core register
> > > > > +
> > > > > +  reg-names:
> > > > > +    items:
> > > > > +      - const: core
> > > > > +
> > > > > +  clocks:
> > > > > +    maxItems: 2
> > > > > +
> > > > > +  clock-names:
> > > > > +    items:
> > > > > +      - const: per
> > > > > +      - const: pixel
> > > > > +
> > > > > +  phys:
> > > > > +    maxItems: 1
> > > > > +    description: MIPI D-PHY
> > > > > +
> > > > > +  phy-names:
> > > > > +    items:
> > > > > +      - const: rx
> > > > > +
> > > > > +  resets:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupts:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  power-domains:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  ports:
> > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > +
> > > > > +    properties:
> > > > > +      port@0:
> > > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > +        unevaluatedProperties: false
> > > > > +        description:
> > > > > +          Input port node, single endpoint describing the input port.
> > > > > +
> > > > > +        properties:
> > > > > +          endpoint:
> > > > > +            $ref: video-interfaces.yaml#
> > > > > +            unevaluatedProperties: false
> > > > > +            description: Endpoint connected to input device
> > > > > +
> > > > > +            properties:
> > > > > +              bus-type:
> > > > > +                const: 4
> > > >
> > > > If 4 is the only value supported, you can drop the property altogether.
> > >
> > > Sorry, What's your means here? There are more options in video-interfaces.yaml.
> > > here just add restriction for bus-type. otherwise other value can be
> > > provide in dts file.
> >
> > It could, but wouldn't any other value be incorrect?
> 
> at least that 5 # Parallel doesn't make sense for CSI2's input.

The point is that, if the only valid value is CSI-2 DPHY (4), then
there's no need to specify it in DT. The driver would know the input bus
is CSI-2 DPHY, so there's no need to convey that information in the
device tree.

> > In other words, this property is redundant and should be dropped.
> >
> > > > > +
> > > > > +              data-lanes:
> > > > > +                minItems: 1
> > > > > +                maxItems: 4
> > > > > +                items:
> > > > > +                  maximum: 4
> > > > > +
> > > > > +      port@1:
> > > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > +        unevaluatedProperties: false
> > > > > +        description:
> > > > > +          Output port node, single endpoint describing the output port.
> > > > > +
> > > > > +        properties:
> > > > > +          endpoint:
> > > > > +            unevaluatedProperties: false
> > > > > +            $ref: video-interfaces.yaml#
> > > > > +            description: Endpoint connected to output device
> > > > > +
> > > > > +            properties:
> > > > > +              bus-type:
> > > > > +                const: 4
> > > >
> > > > Are both input and output of this block CSI-2 with D-PHY?
> > >
> > > Yes, input from camera sensor, output to others image processors to do data
> > > transfer or format convert.
> >
> > The description appears to be saying this is "Synopsys IDI", not CSI-2 with
> > D-PHY. We don't have a bus-type for IDI. Couldn't you simply drop it?

-- 
Regards,

Laurent Pinchart

