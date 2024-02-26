Return-Path: <linux-media+bounces-5917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4F3867444
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 13:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 024BF290855
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 12:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5B95EE87;
	Mon, 26 Feb 2024 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MrCXcpYz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E86B5F472;
	Mon, 26 Feb 2024 12:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708949073; cv=none; b=RTXUoWYRs+tjRuqqIO/+M5eJHkPXB3mtmNj6xP6f5vai9+x742lzs+t5/sK71vtv0cfIwH85wa1wTdo+euCZqELfC8U9fG4cw1cADk8fnwr7L4/tTFAknYy6vLmbnKxyWn05nyoKSckhrYDzNwCoAEJmLZVismt79l7Mrd8p5Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708949073; c=relaxed/simple;
	bh=SBWQqDUjMuE20OwA5Ka1zYuiXs+U4rc0sinqikqflbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gao/ErgMBdFUA1saiMZdHdvEWLp9/SlPRb9IbGmA1tXKff1wutRsPdsY8qPKE4QADTid2mM6bm1EfGH/Aw0ypJBSimoC9rErVmlnMkw2C2VtFP92fZvJDdRnd82MWC1Mh8MEt9FGUGzKnhFWU0lE0Wi0GFVJVVRAgIlL1aSTCkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MrCXcpYz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C66C1CD1;
	Mon, 26 Feb 2024 13:04:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708949058;
	bh=SBWQqDUjMuE20OwA5Ka1zYuiXs+U4rc0sinqikqflbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrCXcpYz8sCU9NvJMhAhyCKca/5zJW7Xs99m3ng5c9vl4DDb6uVKZNxTUPCqYcFtd
	 PldsFNYhDv31nQsgt+HaT82L8rCh8zbz66FpasdeQ/XiehXUK+QjA9NC3L5sG+L1zT
	 OzTvMnunlnRRQp+lpKP84VxomOVnb3Fe3y0pAlWI=
Date: Mon, 26 Feb 2024 14:04:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Message-ID: <20240226120431.GA25561@pendragon.ideasonboard.com>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
 <20240214141906.245685-3-dan.scally@ideasonboard.com>
 <Zdx77nyiQn4zya3h@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zdx77nyiQn4zya3h@valkosipuli.retiisi.eu>

Hi Sakari,

On Mon, Feb 26, 2024 at 11:54:22AM +0000, Sakari Ailus wrote:
> On Wed, Feb 14, 2024 at 02:19:03PM +0000, Daniel Scally wrote:
> > Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> > 
> > Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > ---
> > Changes in v2:
> > 
> > 	- Added clocks information
> > 	- Fixed the warnings raised by Rob
> > 
> >  .../bindings/media/arm,mali-c55.yaml          | 77 +++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> > new file mode 100644
> > index 000000000000..30038cfec3a4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ARM Mali-C55 Image Signal Processor
> > +
> > +maintainers:
> > +  - Daniel Scally <dan.scally@ideasonboard.com>
> > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: arm,mali-c55
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: ISP video clock
> > +      - description: ISP AXI clock
> > +      - description: ISP AHB-lite clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: vclk
> > +      - const: aclk
> > +      - const: hclk
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/graph.yaml#/properties/endpoint
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    mali_c55: isp@400000 {
> > +      compatible = "arm,mali-c55";
> > +      reg = <0x400000 0x200000>;
> > +      clocks = <&clk 0>, <&clk 1>, <&clk 2>;
> > +      clock-names = "vclk", "aclk", "hclk";
> > +      interrupts = <0>;
> > +
> > +      ports {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        port@0 {
> > +          reg = <0>;
> > +          isp_in: endpoint {
> > +              remote-endpoint = <&mipi_out>;
> 
> I suppose this is a CSI-2 interface with D-PHY?

No, that's an internal parallel bus. Depending on the SoC integration,
it can be connected to a CSI-2 receiver, a DMA engine, or a mux to
select between different sources.

> How many lanes do you have and is lane remapping / polarity inversion
> supported?
> 
> This should be reflected in bindings.
> 
> > +          };
> > +        };
> > +      };
> > +    };
> > +...

-- 
Regards,

Laurent Pinchart

