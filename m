Return-Path: <linux-media+bounces-26645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10831A4028E
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 23:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4FB317ED20
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 22:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E539C250BED;
	Fri, 21 Feb 2025 22:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQHqptEY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442502040A4;
	Fri, 21 Feb 2025 22:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740176442; cv=none; b=CefjKDNqGZUckzRBXpsHF+cXtdxUKvLTze8Z7zcYKpwwu24UksHRaoJvj5qL03Lvh/gU5/Nb/mT8jYeWGSQSZqAmKInm/+3OurpDLxM8Xy5V9t3mahyTrMnQxNKQILNwwxQOrM/wLDuaMCmJoQbPva+RXw7tIQKwA6Kbc7hdC7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740176442; c=relaxed/simple;
	bh=7aHNW9A/Uq8Lugq2wM6k+l78zNQMYLApgkpRccP75pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTrO/nVigiENJlPkR+4kJL6Py8Gf5/b0V9fFvCz/gMn41AZERh1Ic5Ts7phO2GSi0qA0iPCAjuEogvZiUuMtbPAQ/3H90iNkBbK96zHth0e2FQdgQuV4jYP2XGLbrPNHaWvKAoqL7UkOPThgTT2nrfe4NoJNC5RzfvPnNfO2m30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQHqptEY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735FAC4CED6;
	Fri, 21 Feb 2025 22:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740176441;
	bh=7aHNW9A/Uq8Lugq2wM6k+l78zNQMYLApgkpRccP75pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQHqptEYXy861nH4Dp3RHO8Sdfum1rPxoXVSQxqSsLeHc/wzblZu01Jp8LwAxnwa+
	 nursnUX6W+mwkV1VbDQW34IoGY3OUrqwDy11zDOHvubeZPD9CVvKmUwkboH/gr3Dku
	 w9V4pnrNV83ZKiFYvUvm5KIbXoybGj6dxHwT4AA2F/aDdKYQiyX2LSc/IFCpXum91M
	 +X2+x8IBhBAgiWxLFTsSBtmPm1P4+SWZETkDS1uO5Tu2guE6nQCgfP9EaiFDzYMkYl
	 ZukxOU4JMRtlwHaaH4Zv/ZcoTWerV8eKB9Ruln0azVoYwoIRqxSOmnKyTvN5cDDFcP
	 CfSNstlUdpt6A==
Date: Fri, 21 Feb 2025 16:20:39 -0600
From: Rob Herring <robh@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Michael Riesch <michael.riesch@wolfvision.net>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 04/11] media: dt-bindings: media: add bindings for
 rockchip mipi csi host
Message-ID: <20250221222039.GA164750-robh@kernel.org>
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
 <20250219-v6-8-topic-rk3568-vicap-v4-4-e906600ae3b0@wolfvision.net>
 <Z7iJ-UaLabqK4ZhY@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7iJ-UaLabqK4ZhY@kekkonen.localdomain>

On Fri, Feb 21, 2025 at 02:13:13PM +0000, Sakari Ailus wrote:
> Hi Michael,
> 
> On Wed, Feb 19, 2025 at 11:16:35AM +0100, Michael Riesch wrote:
> > Add documentation for the Rockchip RK3568 MIPI CSI-2 Host unit.
> > 
> > Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> > ---
> >  .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 123 +++++++++++++++++++++
> >  MAINTAINERS                                        |   1 +
> >  2 files changed, 124 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> > new file mode 100644
> > index 000000000000..288941686e96
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> > @@ -0,0 +1,123 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip RK3568 MIPI CSI-2 Host
> > +
> > +maintainers:
> > +  - Michael Riesch <michael.riesch@wolfvision.net>
> > +
> > +description:
> > +  The Rockchip RK3568 MIPI CSI-2 Host is a CSI-2 bridge with one input port
> > +  and one output port. It receives the data with the help of an external
> > +  MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video Capture
> > +  (VICAP) block.
> > +
> > +properties:
> > +  compatible:
> > +    const: rockchip,rk3568-mipi-csi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description: MIPI C-PHY or D-PHY.
> > +
> > +  phy-names:
> > +    items:
> > +      - const: csiphy

*-names is kind of pointless when there is only 1. Drop it.

> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port node. Connect to e.g., a MIPI CSI-2 image sensor.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              bus-type:
> > +                enum: [1, 4]
> > +
> > +            required:
> > +              - bus-type
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Output port node. Connect to RK3568 VICAP MIPI CSI-2 port.
> 
> What's the purpose of a port node without an endpoint?

If there are not custom endpoint properties, then you don't need to 
describe the endpoint node. But that case should be this instead:

$ref: /schemas/graph.yaml#/properties/port

(no unevaluatedProperties)

Rob

