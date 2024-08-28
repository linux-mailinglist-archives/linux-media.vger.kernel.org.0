Return-Path: <linux-media+bounces-17023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 421FC9627DF
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEAB1282431
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AAED188002;
	Wed, 28 Aug 2024 12:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sc+4mqMm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ED31850B5;
	Wed, 28 Aug 2024 12:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849617; cv=none; b=KyOu2LisMt/6YOH65wtiO6mDkASvbYTfQptHjAq9OrVTHMZhIPGmL8abc0yuww5xItLGn6+w4PuZ5DcCFX1C2B9BTYICJdn7yqxBQNH6KkMqhdBaERqSJRPN43hiRio0OOM7yK6y/MO6CQ5oI5Npfg7kQvoY/gwoRoCh+8Rs2Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849617; c=relaxed/simple;
	bh=46WC4OiKlA9644ndxCFD7R4IcQ2ESAAhgIpa4+EO6yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uh4z+FfnfdI23lJediOgeqmRzmSevhYnkJyhEwaElitNCVJxstor8HwT8Ds2wubeaMGWnca1vkD/CjVzk+Mt1nKZi52zVQC8biibRXGtWb4vPbK66LRX3hya0SmvW44A/6RSRTfcy6s5dqdxbPnuVbVNW+RfR//rlxP9M9lfeEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sc+4mqMm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FB8A220;
	Wed, 28 Aug 2024 14:52:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724849545;
	bh=46WC4OiKlA9644ndxCFD7R4IcQ2ESAAhgIpa4+EO6yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sc+4mqMmXCISzCGkYsGEi+HEN7dzMLofuR2jHVNrAe50sjdsMRy/QDr13p0jkUCuB
	 Y6VMYNFt+jxejeHMZ2eteZfSoLFpvqGvkzSp6fhrWtEjqBn3ovB6Ch0a6ZdqB5HNEx
	 yFyJ9mtuB6mnd9zI/gHGUidqDlnYEQZuqE+3mU2M=
Date: Wed, 28 Aug 2024 15:53:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: media: Add bindings for
 raspberrypi,rp1-cfe
Message-ID: <20240828125329.GA27131@pendragon.ideasonboard.com>
References: <20240620-rp1-cfe-v2-0-b8b48fdba3b3@ideasonboard.com>
 <20240620-rp1-cfe-v2-2-b8b48fdba3b3@ideasonboard.com>
 <Zs8ErwJVTGYkHfJl@kekkonen.localdomain>
 <20240828111153.GL30398@pendragon.ideasonboard.com>
 <b3fe348b-60a3-4480-8a8e-89760c5bb7ae@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b3fe348b-60a3-4480-8a8e-89760c5bb7ae@ideasonboard.com>

On Wed, Aug 28, 2024 at 03:14:47PM +0300, Tomi Valkeinen wrote:
> On 28/08/2024 14:12, Laurent Pinchart wrote:
> > On Wed, Aug 28, 2024 at 11:06:23AM +0000, Sakari Ailus wrote:
> >> On Thu, Jun 20, 2024 at 02:07:51PM +0300, Tomi Valkeinen wrote:
> >>> Add DT bindings for raspberrypi,rp1-cfe.
> >>>
> >>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>> ---
> >>>   .../bindings/media/raspberrypi,rp1-cfe.yaml        | 98 ++++++++++++++++++++++
> >>>   1 file changed, 98 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
> >>> new file mode 100644
> >>> index 000000000000..851533de2305
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
> >>> @@ -0,0 +1,98 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/media/raspberrypi,rp1-cfe.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Raspberry Pi PiSP Camera Front End
> >>> +
> >>> +maintainers:
> >>> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>> +  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> >>> +
> >>> +description: |
> >>> +  The Raspberry Pi PiSP Camera Front End is a module in Raspberrypi 5's RP1 I/O
> >>> +  controller, that contains:
> >>> +  - MIPI D-PHY
> >>> +  - MIPI CSI-2 receiver
> >>> +  - Simple image processor (called PiSP Front End, or FE)
> >>> +
> >>> +  The FE documentation is available at:
> >>> +  https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> >>> +
> >>> +  The PHY and CSI-2 receiver part have no public documentation.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - const: raspberrypi,rp1-cfe
> >>> +
> >>> +  reg:
> >>> +    items:
> >>> +      - description: CSI-2 registers
> >>> +      - description: D-PHY registers
> >>> +      - description: MIPI CFG (a simple top-level mux) registers
> >>> +      - description: FE registers
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 1
> >>> +
> >>> +  port:
> >>> +    $ref: /schemas/graph.yaml#/$defs/port-base
> >>> +    additionalProperties: false
> >>> +    description: CSI-2 RX Port
> >>> +
> >>> +    properties:
> >>> +      endpoint:
> >>> +        $ref: video-interfaces.yaml#
> >>> +        unevaluatedProperties: false
> >>> +
> >>> +        properties:
> >>> +          data-lanes:
> >>> +            minItems: 1
> >>> +            maxItems: 4
> >>> +
> >>> +          clock-lanes:
> >>> +            maxItems: 1
> >>
> >> minItems needs to be 1 as well.
> 
> Hmm, I see a lot of
> 
> clock-lanes:
>    maxItems: 1
> 
> in the device tree bindings. And 
> https://docs.kernel.org/devicetree/bindings/writing-schema.html says 
> "Cases that have only a single entry just need to express that with 
> maxItems".

The rules may have changed recently, I'm not entirely sure. I've asked
in https://lore.kernel.org/dri-devel/20240818173003.122025-1-krzysztof.kozlowski@linaro.org/T/#m7669ca56543567e36733af745798713ae0293654

> >> Or... is this actually configurable in hardware?
> > 
> > Looking at the driver, lane reordering is not supported, so we could
> > drop this property. If the hardware is found to support it later, it can
> > easily be added back without any backward compatibility issue.
> 
> Re-ordering is not supported. I guess clock-lanes can be dropped, 
> although I feel that if we have the clock lane in the hardware, and the 
> numbering of data-lanes must take that into account, then:
> 
> clock-lanes = <0>;
> data-lanes = <1 2>;
> 
> looks better than:
> 
> data-lanes = <1 2>; /* and implicit clk lane 0 */
> 
> But I can't think of any practical benefit it brings...

-- 
Regards,

Laurent Pinchart

