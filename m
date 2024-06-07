Return-Path: <linux-media+bounces-12755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82295900782
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 16:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10EEE28F3FC
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 14:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A0219AA68;
	Fri,  7 Jun 2024 14:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hhiYA8rH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A0C19A2BA;
	Fri,  7 Jun 2024 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717771343; cv=none; b=rc06AnSBNGSVDKe1J0iF5Dj2SEa/Gw4hrvZl6l5XPqBTDLNB4qsbitT+dMSkg0KUZG5ag+tpJwBygEIZx6ekOflhCg44iIkh083+EFyixKrBMxAF8hDojNOjA0wqJnZuulr+VBgpWKsN9Cn/E7CBeWuKIXAwQxyvPu3+3cgFdag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717771343; c=relaxed/simple;
	bh=TXfIcxfKZ+HO9/x3g0vX/xX24/WbzhKt8eJbqKRPiYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSYjlTCXQmk5ewed9OgMLRJK3w9nBqCiKic557fJqAIYlVmLJJGShC2/I5xvau5beP1y557C8S/lnfDU6t9MUeQVpYituQLohvbIMl1h7ZWzAbW9orzfhpYzYU4m4qnRxt78eqST+eYy7eTUnRJQgcrA288ohlqX2/HvHKb7jbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hhiYA8rH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0410C720;
	Fri,  7 Jun 2024 16:42:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717771324;
	bh=TXfIcxfKZ+HO9/x3g0vX/xX24/WbzhKt8eJbqKRPiYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hhiYA8rHBz74Da65hnnjBv6TmnLse8pBYPca66L+wnUmaI1rJTsMeWX2PkE9FFd2y
	 2PmAfTk8/Z3/MYjvi6yklgkJ5exQ2LPdUf992QxJ7RhE8rbQ0Wv6AwzYK0ZbMaop5E
	 D2DpiIgJDKc8PxDE3VdHzpu1nDbpq+iMmUx4j7r4=
Date: Fri, 7 Jun 2024 17:41:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Julien Stephan <jstephan@baylibre.com>,
	Louis Kuo <louis.kuo@mediatek.com>,
	Phi-Bang Nguyen <pnguyen@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Message-ID: <20240607144154.GD18479@pendragon.ideasonboard.com>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-2-jstephan@baylibre.com>
 <e0bf8667-cbb8-49ba-bb44-3edf93b019b8@linaro.org>
 <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>

Hi Krzysztof,

On Fri, Jun 07, 2024 at 10:52:33AM +0200, Julien Stephan wrote:
> Le ven. 12 janv. 2024 à 08:32, Krzysztof Kozlowski a écrit :
> > On 10/01/2024 15:14, Julien Stephan wrote:
> > > From: Louis Kuo <louis.kuo@mediatek.com>
> > >
> > > This adds the bindings, for the mediatek ISP3.0 SENINF module embedded in
> > > some Mediatek SoC, such as the mt8365
> > >
> >
> > ...
> >
> > > +  clock-names:
> > > +    items:
> > > +      - const: camsys
> > > +      - const: top_mux
> > > +
> > > +  phys:
> > > +    minItems: 1
> > > +    maxItems: 4
> > > +    description:
> > > +      phandle to the PHYs connected to CSI0/A, CSI1, CSI2 and CSI0B
> > > +
> > > +  phy-names:
> > > +    minItems: 1
> > > +    items:
> > > +      - const: csi0
> > > +      - const: csi1
> > > +      - const: csi2
> > > +      - const: csi0b
> >
> > Why one hardware has flexible number of phys?
> 
> Hi Krzysztof,
> 
> seninf can have multiple port depending on the soc, each requiring its own phy
> 
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description: CSI0 or CSI0A port
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              clock-lanes:
> > > +                maxItems: 1
> > > +              data-lanes:
> > > +                minItems: 1
> > > +                maxItems: 4
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description: CSI1 port
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              clock-lanes:
> > > +                maxItems: 1
> > > +              data-lanes:
> > > +                minItems: 1
> > > +                maxItems: 4
> > > +
> > > +      port@2:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description: CSI2 port
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              clock-lanes:
> > > +                maxItems: 1
> > > +              data-lanes:
> > > +                minItems: 1
> > > +                maxItems: 4
> > > +
> > > +      port@3:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description: CSI0B port
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              clock-lanes:
> > > +                maxItems: 1
> > > +              data-lanes:
> > > +                minItems: 1
> > > +                maxItems: 2
> > > +
> > > +      port@4:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: connection point for cam0
> > > +
> > > +      port@5:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: connection point for cam1
> > > +
> > > +      port@6:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: connection point for camsv0
> > > +
> > > +      port@7:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: connection point for camsv1
> > > +
> > > +      port@8:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: connection point for camsv2
> > > +
> > > +      port@9:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: connection point for camsv3
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +      - port@2
> > > +      - port@3
> > > +      - port@4
> > > +      - port@5
> > > +      - port@6
> > > +      - port@7
> > > +      - port@8
> > > +      - port@9
> > > +
> > > +required:
> > > +  - compatible
> > > +  - interrupts
> > > +  - clocks
> > > +  - clock-names
> > > +  - power-domains
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/phy/phy.h>
> > > +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> > > +
> > > +    soc {
> > > +          #address-cells = <2>;
> > > +          #size-cells = <2>;
> >
> > Use 4 spaces for example indentation.
> >
> > > +
> > > +          seninf: seninf@15040000 {
> >
> > Node names should be generic. See also an explanation and list of
> > examples (not exhaustive) in DT specification:
> > https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

The seninf is (mostly) a set of MIPI CSI-2 receivers. Would you prefer
'csi', 'mipi-csi', 'csi-2' or any other name ?

There's also the camsv IP in the same series that needs a generic name.
I really don't know what to propose for it. Could you recommend
something that would make you happy ?

On a side note, that document lacks appropriate generic names for lots
of building blocks found in recent SoCs, it would be nice to get it
updated. You will eventually get better quality DT patches then :-)

> > > +                compatible = "mediatek,mt8365-seninf";
> > > +                reg = <0 0x15040000 0 0x6000>;
> > > +                interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
> > > +                clocks = <&camsys CLK_CAM_SENIF>,
> > > +                         <&topckgen CLK_TOP_SENIF_SEL>;
> > > +                clock-names = "camsys", "top_mux";
> > > +
> > > +                power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
> > > +
> > > +                phys = <&mipi_csi0 PHY_TYPE_DPHY>;
> > > +                phy-names = "csi0";
> > > +
> > > +                ports {
> > > +                      #address-cells = <1>;
> > > +                      #size-cells = <0>;
> > > +
> > > +                      port@0 {
> > > +                            reg = <0>;
> > > +                            seninf_in1: endpoint {
> > > +                              clock-lanes = <2>;
> > > +                              data-lanes = <1 3 0 4>;
> > > +                              remote-endpoint = <&isp1_out>;
> > > +                            };
> > > +                      };
> > > +
> > > +                      port@1 {
> > > +                          reg = <1>;
> > > +                      };
> > > +
> > > +                      port@2 {
> > > +                            reg = <2>;
> > > +                      };
> > > +
> > > +                      port@3 {
> > > +                            reg = <3>;
> > > +                      };
> > > +
> > > +                      port@4 {
> > > +                            reg = <4>;
> > > +                            seninf_camsv1_endpoint: endpoint {
> > > +                                remote-endpoint = <&camsv1_endpoint>;
> > > +                            };
> > > +                      };
> > > +
> > > +                      port@5 {
> > > +                            reg = <5>;
> > > +                      };
> > > +
> > > +                      port@6 {
> > > +                            reg = <6>;
> > > +                      };
> > > +
> > > +                      port@7 {
> > > +                            reg = <7>;
> > > +                      };
> > > +
> > > +                      port@8 {
> > > +                            reg = <8>;
> > > +                      };
> > > +
> > > +                      port@9 {
> > > +                            reg = <9>;
> > > +                      };
> > > +
> >
> > Stray blank line
> >
> > > +                };

-- 
Regards,

Laurent Pinchart

