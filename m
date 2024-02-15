Return-Path: <linux-media+bounces-5206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E618560C5
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 12:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B4D3286C26
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 11:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D806784A3D;
	Thu, 15 Feb 2024 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MBk8zBOQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C2A12C7E0;
	Thu, 15 Feb 2024 11:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707994927; cv=none; b=sXeC3Ujr7/KDS2CvuCfI8qatm3HlquqghDPkaMidSrkmEDFmGMjTpVeYG89ddTptpJe57ZiDn8fEetX1tFXVbqSHfYinm9oaMGm54BGNRJHMJckGfazTUG/q3DoOiPUz/awHk9Y+F9whpYi7WktNXqdU448I4jzAj0CZN0i9ZmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707994927; c=relaxed/simple;
	bh=Nj1yulrL/F/3NFHpUqtTgULAH+4SIsqHUM2uketxzIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NczVqy+o3tO9ZHGAvCyZHXknPofNGJmMzp8ZJ8AFxZOS4BX3zdvNSFojt5mMRHYkirhqBnXHNOaccxBnHXEDcrNauZqETYYtBba43S7l7CVaMyuDDE0NQI6Ul9hThPXVnVc+/N2O+cWVdfk2w8VbaSsCBLAJOREBnK/MXVPOdwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MBk8zBOQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E488E183;
	Thu, 15 Feb 2024 12:01:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707994919;
	bh=Nj1yulrL/F/3NFHpUqtTgULAH+4SIsqHUM2uketxzIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MBk8zBOQqbJHfWopb+XTymwf/ByBbxflk6s44hkpi/zBcKTZ0AY0fdVB946vnkz7B
	 KfSy8pfE1x61XO0G3WZ1ABUngH0T3DTyU+frXdHobiApQRM8LmcZJ0mYCPGhrhoaY+
	 mLruYonaTmhAzT4n24Z2wWzPwmxq9zgBTjlPfdRM=
Date: Thu, 15 Feb 2024 13:02:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Conor Dooley <conor@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Message-ID: <20240215110205.GD7873@pendragon.ideasonboard.com>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
 <20240214141906.245685-3-dan.scally@ideasonboard.com>
 <20240214142825.GA7873@pendragon.ideasonboard.com>
 <20240214-velcro-pushy-0cbd18b23361@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240214-velcro-pushy-0cbd18b23361@spud>

On Wed, Feb 14, 2024 at 05:37:17PM +0000, Conor Dooley wrote:
> On Wed, Feb 14, 2024 at 04:28:25PM +0200, Laurent Pinchart wrote:
> > On Wed, Feb 14, 2024 at 02:19:03PM +0000, Daniel Scally wrote:
> > > Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> > > 
> > > Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> > > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > > ---
> > > Changes in v2:
> > > 
> > > 	- Added clocks information
> > > 	- Fixed the warnings raised by Rob
> > > 
> > >  .../bindings/media/arm,mali-c55.yaml          | 77 +++++++++++++++++++
> > >  1 file changed, 77 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> > > new file mode 100644
> > > index 000000000000..30038cfec3a4
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> > > @@ -0,0 +1,77 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: ARM Mali-C55 Image Signal Processor
> > > +
> > > +maintainers:
> > > +  - Daniel Scally <dan.scally@ideasonboard.com>
> > > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: arm,mali-c55
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: ISP video clock
> > 
> > I wonder if we need this clock. Granted, it's an input clock to the ISP,
> > but it's part of the input video bus. I don't expect anyone would ever
> > need to control it manually, it should be provided by the video source
> > automatically.
> 
> I'd say that if there's a clock controller providing this clock, even if
> it is implicit in the video feed it's good to have here. Being able to
> increment the refcount on that clock would be good, even if you don't
> actually control it manually?

I don't expect there would be a clock controller to directly reference
in most cases. It depends a bit on where the clock domain crossing
between the source (often a CSI-2 receiver) and the ISP is. If it's
implemented in glue logic bundled with the ISP, which wouldn't be
described in DT as a separate node, then there's a higher chance we'll
have a clock controller for vclk. If it's implemented in the source,
vclk will just come from the source, which won't be listed as a clock
controller.

One option would be to make this clock optional, by moving it to the end
of the clocks list, and setting

	minItems: 2
	maxItems: 3

> > > +      - description: ISP AXI clock
> > > +      - description: ISP AHB-lite clock
> > 
> > These two other clocks look good to me.
> > 
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: vclk
> > > +      - const: aclk
> > > +      - const: hclk
> 
> Why not "video" "axi" "ahb-lite"? There's 3 useful letters between the
> tree clock names you've provided - they're all clocks, so having "clk"
> in them is just noise :)

As far as I understand, the names proposed by Dan come directly from the
IP core documentation.

-- 
Regards,

Laurent Pinchart

