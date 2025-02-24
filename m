Return-Path: <linux-media+bounces-26826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5794A41F62
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 13:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11DFA188515C
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 12:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB9A233730;
	Mon, 24 Feb 2025 12:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XE0BJl0W"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CCF70830;
	Mon, 24 Feb 2025 12:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740400991; cv=none; b=dpxH5j7kk/EeceXCXGuAnGbsNng99xYwsH3CfKF0ToZwLSbH25EjB8Zp95eTkrP6xPtwICshfesxMlVJFklHNourR3eHDq6gUMXATO5PGv/I68mnxwlWbpOwt+nyax21/yj6bEEPcK10fzEWauFuEI/QxCZaYWZ8pccNz9TKlfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740400991; c=relaxed/simple;
	bh=5bE1sNTKCIcMIFatENWw4OlhtEJZGUhcXJTzBuK9DHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vcc6MWEkgTDGcP0lR93c135qgmi+yv5SaDzayDoCFNYMeau+W3/6COd/6l7AuewuMbiGmIPRNc0BeZPCwinLeWMfc9+W7MKKDH3c1+r572WQR7P8F8tgdwzZqAJ101A45aXXC58nFDd54OfDfneTLTy1dyfQrEgnZsFjlR8PNMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XE0BJl0W; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740400989; x=1771936989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5bE1sNTKCIcMIFatENWw4OlhtEJZGUhcXJTzBuK9DHE=;
  b=XE0BJl0W7jAx9zSVUXRlER0+iYRtemOLyFt/82HIrKfAaGV2nek97NAW
   whP6KAI3kPEpdV/h6mKyMyDewv3gH0JTuBTKujAR3BSQfrEKXs5/SO+wX
   DE1GL+QMnT9KK1bIW3HDZOd1N3YGSeRpXUhq60CsOTguLEQJ/XjG71YdJ
   OayZN6ES143wM5ka4dMb11kD6BgFX9E6abmsn6CoFemdsQp4TM623uUIi
   4XIndeDxrlBlpD/pxElrfH/4Sx8E3hiODNQlXKe3Rl96OKLDcCw5ySx2t
   maKuOL0zJIExbK6h3O4+lmUHLE2JbOmuVukdaVpRcOU6JwIYP6Hb9kWeX
   Q==;
X-CSE-ConnectionGUID: 6Vfi9Uf5R0i2xDWbZWjegw==
X-CSE-MsgGUID: xjmtmOirRceVahdASA/0wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="43982314"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="43982314"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 04:43:08 -0800
X-CSE-ConnectionGUID: vjFgtAYERzqgYiHCoWu2XA==
X-CSE-MsgGUID: aGhihvvHTNOeYhbEn9nRsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116677593"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 04:43:02 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8314111F944;
	Mon, 24 Feb 2025 14:42:59 +0200 (EET)
Date: Mon, 24 Feb 2025 12:42:59 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Subject: Re: [PATCH v4 03/11] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
Message-ID: <Z7xpU8yKNKBReage@kekkonen.localdomain>
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
 <20250219-v6-8-topic-rk3568-vicap-v4-3-e906600ae3b0@wolfvision.net>
 <Z7iJV1rOaqMmcjY7@kekkonen.localdomain>
 <0b19c544-f773-435e-9829-aaaa1c6daf7a@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b19c544-f773-435e-9829-aaaa1c6daf7a@wolfvision.net>

Hi Michael,

On Mon, Feb 24, 2025 at 11:21:41AM +0100, Michael Riesch wrote:
> Hi Sakari,
> 
> Thanks for the review.
> 
> On 2/21/25 15:10, Sakari Ailus wrote:
> > Hi Michael,
> > 
> > Thanks for the update.
> > 
> > On Wed, Feb 19, 2025 at 11:16:34AM +0100, Michael Riesch wrote:
> >> Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
> >>
> >> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> >> ---
> >>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 168 +++++++++++++++++++++
> >>  MAINTAINERS                                        |   1 +
> >>  2 files changed, 169 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> >> new file mode 100644
> >> index 000000000000..3dc15efeb32e
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> >> @@ -0,0 +1,168 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-vicap.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Rockchip RK3568 Video Capture (VICAP)
> >> +
> >> +maintainers:
> >> +  - Michael Riesch <michael.riesch@wolfvision.net>
> >> +
> >> +description:
> >> +  The Rockchip RK3568 Video Capture (VICAP) block features a digital video
> >> +  port (DVP, a parallel video interface) and a MIPI CSI-2 port. It receives
> >> +  the data from camera sensors, video decoders, or other companion ICs and
> >> +  transfers it into system main memory by AXI bus.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: rockchip,rk3568-vicap
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    items:
> >> +      - description: ACLK
> >> +      - description: HCLK
> >> +      - description: DCLK
> >> +      - description: ICLK
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: aclk
> >> +      - const: hclk
> >> +      - const: dclk
> >> +      - const: iclk
> >> +
> >> +  rockchip,cif-clk-delaynum:
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +    minimum: 0
> >> +    maximum: 127
> >> +    description:
> >> +      Delay the DVP path clock input to align the sampling phase, only valid
> >> +      in dual edge sampling mode.
> > 
> > I suppose there's further documentation on this somewhere else? A reference
> > would be nice.
> 
> I like your optimism :-) No, I am afraid this single sentence is all the
> the RK3568 TRM has to say about it. I can add a reference to the TRM
> page, but everyone who actually follows this reference will be
> disappointed...

:-(

Is this something that needs to be set? Is there a default, for instance?

If there's documentation available, it'd be nice to refer to that from
somewhere, I'm not sure if the driver or DT bindings would be better.
Probably the driver.

> 
> >> +
> >> +  iommus:
> >> +    maxItems: 1
> >> +
> >> +  resets:
> >> +    items:
> >> +      - description: ARST
> >> +      - description: HRST
> >> +      - description: DRST
> >> +      - description: PRST
> >> +      - description: IRST
> >> +
> >> +  reset-names:
> >> +    items:
> >> +      - const: arst
> >> +      - const: hrst
> >> +      - const: drst
> >> +      - const: prst
> >> +      - const: irst
> >> +
> >> +  rockchip,grf:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      Phandle to general register file used for video input block control.
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  ports:
> >> +    $ref: /schemas/graph.yaml#/properties/ports
> >> +
> >> +    properties:
> >> +      port@0:
> >> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >> +        unevaluatedProperties: false
> >> +        description:
> >> +          The digital video port (DVP, a parallel video interface).
> >> +
> >> +        properties:
> >> +          endpoint:
> >> +            $ref: video-interfaces.yaml#
> >> +            unevaluatedProperties: false
> >> +
> >> +            properties:
> >> +              bus-type:
> >> +                enum: [5, 6]
> >> +
> >> +            required:
> >> +              - bus-type
> >> +
> >> +      port@1:
> >> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >> +        unevaluatedProperties: false
> >> +        description: The MIPI CSI-2 port.
> >> +
> >> +        properties:
> >> +          endpoint:
> >> +            $ref: video-interfaces.yaml#
> >> +            unevaluatedProperties: false
> > 
> > Don't you need things like data-lanes here? Or is this a single lane
> > receiver?
> 
> This may be a bit confusing, and I probably should extend the
> description a bit. This port/endpoint faces the MIPI CSI Host, which has
> its own driver provided in patch 6. The connection in between is a link
> with some internal format. Hence, no properties required.
> 
> This is the same issue as the one discussed in the other thread, since
> the other end of this connection is discussed there. I'll fix the issue
> on both ends using Rob's suggestion.

If this is some custom interface, you should not say it's MIPI CSI-2
(even though MIPI CSI-2 data could be transported on top).

> >> +                vicap_mipi: port@1 {
> >> +                    reg = <1>;
> > 
> > Where is the endpoint?
> 
> I'll add the endpoint in the example.

Thank you.

-- 
Kind regards,

Sakari Ailus

