Return-Path: <linux-media+bounces-5941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1269F8675D6
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 13:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 353C01C27FE7
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 12:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC9D127B4D;
	Mon, 26 Feb 2024 12:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FA2VPoDT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD4480BFB;
	Mon, 26 Feb 2024 12:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708952300; cv=none; b=QZjLHi/IF6EIqHMPzhfKQFw5EhbJU+SvXVxDhKnSSQqs6/UB3HWIaYVW9Z9hrP9ywTJDQy8B1ChseGAmqPsChEn+V0yna+NjNYT3htmg8ZpJAhhC+7WVWLbrZhWste+VjfTtSGbDVyr21nVEjGp+ua3ZN1mauFNXAJBJDBlsh1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708952300; c=relaxed/simple;
	bh=nWeVNhQbpzGEzexd0Q9yFGms48MVeo78w5gEoRyrpr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnuQ65HsgsSmV0UBNyYxRMs46WMMp4pWwD94/gibkiptv9JePTm1QCILJeavYdTdWrddc3Mjj0yjVXSkfaBdZZptTUdiXchdnAsjS6Qu2n8oQXfT8wW24SZMGBETBTsCjxgnluhhob/Yo859TwwBQ6Jw8Lbarx6wSCdMGZDoCJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FA2VPoDT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0E37CD1;
	Mon, 26 Feb 2024 13:58:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708952285;
	bh=nWeVNhQbpzGEzexd0Q9yFGms48MVeo78w5gEoRyrpr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FA2VPoDTsT76mAO4hlB105eus3JQOgAMyvmU17kpx2upKpRpUqzhMdawkKCYOfLT2
	 bThxBvxflzXfIeRjq0Q91JyY9gju6LwxeIifN+SgBC9sXCIcUbreil0dpnFqfhhxau
	 Jx62n+VtA2GihTyER94wnzo6pmgUk7cgNU+QoZuQ=
Date: Mon, 26 Feb 2024 14:58:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Message-ID: <20240226125818.GA26163@pendragon.ideasonboard.com>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
 <20240214141906.245685-3-dan.scally@ideasonboard.com>
 <Zdx77nyiQn4zya3h@valkosipuli.retiisi.eu>
 <20240226120431.GA25561@pendragon.ideasonboard.com>
 <ZdyB_yHn9yImTuhm@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZdyB_yHn9yImTuhm@valkosipuli.retiisi.eu>

On Mon, Feb 26, 2024 at 12:20:15PM +0000, Sakari Ailus wrote:
> On Mon, Feb 26, 2024 at 02:04:31PM +0200, Laurent Pinchart wrote:
> > On Mon, Feb 26, 2024 at 11:54:22AM +0000, Sakari Ailus wrote:
> > > On Wed, Feb 14, 2024 at 02:19:03PM +0000, Daniel Scally wrote:
> > > > Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> > > > 
> > > > Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> > > > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > > > ---
> > > > Changes in v2:
> > > > 
> > > > 	- Added clocks information
> > > > 	- Fixed the warnings raised by Rob
> > > > 
> > > >  .../bindings/media/arm,mali-c55.yaml          | 77 +++++++++++++++++++
> > > >  1 file changed, 77 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> > > > new file mode 100644
> > > > index 000000000000..30038cfec3a4
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> > > > @@ -0,0 +1,77 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: ARM Mali-C55 Image Signal Processor
> > > > +
> > > > +maintainers:
> > > > +  - Daniel Scally <dan.scally@ideasonboard.com>
> > > > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: arm,mali-c55
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: ISP video clock
> > > > +      - description: ISP AXI clock
> > > > +      - description: ISP AHB-lite clock
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: vclk
> > > > +      - const: aclk
> > > > +      - const: hclk
> > > > +
> > > > +  ports:
> > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > +
> > > > +    properties:
> > > > +      port@0:
> > > > +        $ref: /schemas/graph.yaml#/properties/port

Adding

        description: Input parallel video bus

here would be useful.

> > > > +
> > > > +        properties:
> > > > +          endpoint:
> > > > +            $ref: /schemas/graph.yaml#/properties/endpoint
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - interrupts
> > > > +  - clocks
> > > > +  - clock-names
> > > > +  - ports
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    mali_c55: isp@400000 {
> > > > +      compatible = "arm,mali-c55";
> > > > +      reg = <0x400000 0x200000>;
> > > > +      clocks = <&clk 0>, <&clk 1>, <&clk 2>;
> > > > +      clock-names = "vclk", "aclk", "hclk";
> > > > +      interrupts = <0>;
> > > > +
> > > > +      ports {
> > > > +        #address-cells = <1>;
> > > > +        #size-cells = <0>;
> > > > +
> > > > +        port@0 {
> > > > +          reg = <0>;
> > > > +          isp_in: endpoint {
> > > > +              remote-endpoint = <&mipi_out>;
> > > 
> > > I suppose this is a CSI-2 interface with D-PHY?
> > 
> > No, that's an internal parallel bus. Depending on the SoC integration,
> > it can be connected to a CSI-2 receiver, a DMA engine, or a mux to
> > select between different sources.
> 
> The name suggests otherwise. Maybe change that to something more
> descriptive?

We could rename mipi_out to csi2_rx_out, sure.

> > > How many lanes do you have and is lane remapping / polarity inversion
> > > supported?
> > > 
> > > This should be reflected in bindings.
> > > 
> > > > +          };
> > > > +        };
> > > > +      };
> > > > +    };
> > > > +...

-- 
Regards,

Laurent Pinchart

