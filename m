Return-Path: <linux-media+bounces-31181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16930A9ED49
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 767547AE3AC
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AAE25F976;
	Mon, 28 Apr 2025 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IIkj46+K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3B325F7A9;
	Mon, 28 Apr 2025 09:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745833941; cv=none; b=T3honlgvZWI7rfh7BUtTArzddZjwN2QGMcsIv7/nAqzZ/8jY+Rq9KeCfUkZtfjIhgD6IRm42LuRQp9GNpqKhJf96JTpZJEqHD6MKjxVXmiHIdBE3Tb6f07bu1b2GA5sSmEzGyQ8wnxTVAgCIYDHxBtOZUiD7Qn/CPZ6PnyRrRb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745833941; c=relaxed/simple;
	bh=dWpRQX+CGHl+qDOq8dzcQkHH9x2Cri+xTU+SEnQBc8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsaHTYooReM6bY1oG92bFGyBHaldDR3xCk2ZF53Swl8jfsXGfBv8gaH/rOPIWPFqkX2vM9B9maU8B3hoxZymimMyUyRSI+SwTu4HORCXvOtoncNEaXVOs1PU3n67BN4Gvr4CWEFZZ9opheZMAoecn5bSMLTnu7RnCfCcruBwoS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IIkj46+K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C734489A;
	Mon, 28 Apr 2025 11:52:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745833930;
	bh=dWpRQX+CGHl+qDOq8dzcQkHH9x2Cri+xTU+SEnQBc8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIkj46+KmFFSzp9NZncTswS+3fy+umEfUdCLs8tj4tuCeqQFbT6SSr8PlUtpmAxWK
	 BH3eQKDZ5HUOiWi3u6aU+gRcN3mzH6u6pBk+4coU/VI/YslPk3yKVCBZLhP5SmRBU1
	 74fwAlDNqUS5l1I8QRGVe9OPe9jvao2/QpiKg+V8=
Date: Mon, 28 Apr 2025 12:52:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 03/11] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
Message-ID: <20250428095208.GD3371@pendragon.ideasonboard.com>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
 <20250306-v6-8-topic-rk3568-vicap-v5-3-f02152534f3c@wolfvision.net>
 <20250307-pink-dalmatian-of-kindness-f87ad2@krzk-bin>
 <Z8rBGHK9Tjx7D1D2@kekkonen.localdomain>
 <4a1e5834-df52-43d2-ab19-e3117840a001@collabora.com>
 <20250428092232.GC3371@pendragon.ideasonboard.com>
 <1b3245c1-2a4b-4854-ac2f-e89a52a454ec@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1b3245c1-2a4b-4854-ac2f-e89a52a454ec@collabora.com>

On Mon, Apr 28, 2025 at 11:48:57AM +0200, Michael Riesch wrote:
> On 4/28/25 11:22, Laurent Pinchart wrote:
> > On Mon, Apr 28, 2025 at 10:11:51AM +0200, Michael Riesch wrote:
> >> Hi Krzysztof, Sakari,
> >>
> >> Thanks for your feedback! Also, sorry for the delayed response, but as
> >> the e-mail address indicates, there has been a job change in between
> >> that kept me busy :-)
> >>
> >> On 3/7/25 10:49, Sakari Ailus wrote:
> >>> Hi Krzysztof, Michael,
> >>>
> >>> On Fri, Mar 07, 2025 at 08:51:54AM +0100, Krzysztof Kozlowski wrote:
> >>>> On Thu, Mar 06, 2025 at 05:56:04PM +0100, Michael Riesch wrote:
> >>>>> Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
> >>>>>
> >>>>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> >>>>
> >>>> subject: only one media prefix, the first
> >>>>
> >>>> A nit, subject: drop second/last, redundant "bindings". The
> >>>> "dt-bindings" prefix is already stating that these are bindings.
> >>>> See also:
> >>>> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> >>
> >> Ack. Plain "media: dt-bindings: add rockchip rk3568 vicap" it is, then.
> >>
> >>>>
> >>>>> ---
> >>>>>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 169 +++++++++++++++++++++
> >>>>>  MAINTAINERS                                        |   1 +
> >>>>>  2 files changed, 170 insertions(+)
> >>>>>
> >>>>
> >>>> ...
> >>>>
> >>>>> +  clocks:
> >>>>> +    items:
> >>>>> +      - description: ACLK
> >>>>> +      - description: HCLK
> >>>>> +      - description: DCLK
> >>>>> +      - description: ICLK
> >>>>> +
> >>>>> +  clock-names:
> >>>>> +    items:
> >>>>> +      - const: aclk
> >>>>> +      - const: hclk
> >>>>> +      - const: dclk
> >>>>> +      - const: iclk
> >>>>> +
> >>>>> +  rockchip,cif-clk-delaynum:
> >>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>>>> +    minimum: 0
> >>>>> +    maximum: 127
> >>>>> +    description:
> >>>>> +      Delay the DVP path clock input to align the sampling phase, only valid
> >>>>> +      in dual edge sampling mode. Delay is zero by default and can be adjusted
> >>>>> +      optionally.
> >>>>
> >>>> default: 0
> >>
> >> Ack.
> >>
> >>>
> >>> And this is technically specific to the DVP port (0). Should (or could?) it
> >>> be located there?
> >>
> >> "Should"? Yes, makes sense to me.
> >> "Could"? I guess, as we are referencing port-base here it should be
> >> feasible. Not an expert opinion, mind you.
> >>
> >>>
> >>>>
> >>>>> +
> >>>>> +  iommus:
> >>>>> +    maxItems: 1
> >>>>> +
> >>>>> +  resets:
> >>>>> +    items:
> >>>>> +      - description: ARST
> >>>>> +      - description: HRST
> >>>>> +      - description: DRST
> >>>>> +      - description: PRST
> >>>>> +      - description: IRST
> >>>>> +
> >>>>> +  reset-names:
> >>>>> +    items:
> >>>>> +      - const: arst
> >>>>> +      - const: hrst
> >>>>> +      - const: drst
> >>>>> +      - const: prst
> >>>>> +      - const: irst
> >>>>> +
> >>>>> +  rockchip,grf:
> >>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>>>> +    description: Phandle to general register file used for video input block control.
> >>>>> +
> >>>>> +  power-domains:
> >>>>> +    maxItems: 1
> >>>>> +
> >>>>> +  ports:
> >>>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>>> +
> >>>>> +    properties:
> >>>>> +      port@0:
> >>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>>>> +        unevaluatedProperties: false
> >>>>> +        description: The digital video port (DVP, a parallel video interface).
> >>>>> +
> >>>>> +        properties:
> >>>>> +          endpoint:
> >>>>> +            $ref: video-interfaces.yaml#
> >>>>> +            unevaluatedProperties: false
> >>>>> +
> >>>>> +            properties:
> >>>>> +              bus-type:
> >>>>> +                enum: [5, 6]
> >>>>> +
> >>>>> +            required:
> >>>>> +              - bus-type
> >>>>> +
> >>>>> +      port@1:
> >>>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>>> +        description: Internal port connected to a MIPI CSI-2 host.
> >>>>> +
> >>>>> +        properties:
> >>>>> +          endpoint:
> >>>>> +            $ref: video-interfaces.yaml#
> >>>>> +            unevaluatedProperties: false
> >>>>
> >>>> Hm, does it actually work? graph/port does not allow any other
> >>>> properties. You should use graph/port-base and probably still narrow
> >>>> lanes for both of port@0 and port@1.
> >>>
> >>> I'd list the relevant properties for both DVP and CSI-2, either as
> >>> mandatory or with defaults (could be reasonable for DVP signal polarities
> >>> but not e.g. on number of CSI-2 lanes).
> >>
> >> Not sure whether we are on the same page here. As pointed out in the
> >> last round of feedback
> >> (https://lore.kernel.org/all/0b19c544-f773-435e-9829-aaaa1c6daf7a@wolfvision.net/),
> >> port@1 is not MIPI CSI, but some internal interface.
> >>
> >> I tried to clarify this by changing the description of this port to
> >> "Internal port connected to a MIPI CSI-2 host." The host (see
> >> rockchip,rk3568-mipi-csi.yaml) has a port that is actually MIPI CSI and
> >> one port that is the other end of port@1 here.
> > 
> > I'd write "Port connected to the MIPI CSI-2 receiver output". We use
> > "receiver" instead of "host".
> 
> Ack. I'll adjust the "host" -> "receiver" wording change in all the
> other places as well.

You can keep "host" when you quote documentation if it uses that
vocabulary, but for generic usage, "receiver" is better.

> >> As to port@1 here, I am not aware of any properties that can be set. Not
> >> even very peculiar ones similar to rockchip,cif-clk-delaynum. Should I
> >> have overlooked something, I think we can relax the constraints, but we
> >> should start strict, right?
> >>
> >>>>> +
> >>>>> +required:
> >>>>> +  - compatible
> >>>>> +  - reg
> >>>>> +  - interrupts
> >>>>> +  - clocks
> >>>>> +  - ports
> >>>>> +
> >>>>> +additionalProperties: false
> >>>>> +
> >>>>> +examples:
> >>>>> +  - |
> >>>>> +    #include <dt-bindings/clock/rk3568-cru.h>
> >>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
> >>>>> +    #include <dt-bindings/power/rk3568-power.h>
> >>>>> +    #include <dt-bindings/media/video-interfaces.h>
> >>>>> +
> >>>>> +    parent {
> >>>>
> >>>> soc {
> >>
> >> Ack.
> >>
> >>>>> +        #address-cells = <2>;
> >>>>> +        #size-cells = <2>;

-- 
Regards,

Laurent Pinchart

