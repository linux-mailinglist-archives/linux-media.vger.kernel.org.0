Return-Path: <linux-media+bounces-17013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC9796271E
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E16071C2321F
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D828B176230;
	Wed, 28 Aug 2024 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEQCJ/eD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BBF1E4A9;
	Wed, 28 Aug 2024 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848230; cv=none; b=gbk9Tx4NP5byw9b+9/MZd93sJVAot+tJ4JPynBtz3C5eISE/MPie9jMc3VzX8xAwC1pSx6AcKZPB0tAxWv9RGUgYETtwrmjEz6f259rfjRmVIDpJibsAi3HkcXUTGIAeyKVJiY7+fcSTJXdVn4K/xlCLHkqBTAenDtwICwouy6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848230; c=relaxed/simple;
	bh=ctW73pHklNe9RINO0iCUE5vW5BGZGLv6BijjDcxDt3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OyUwS0JRnkXFeXUtK8ihCaQXWGS7rCb0sOb4kXaUCjNuaKPfkcG2PIjwQTL+ZpoVkUkYxNIIcSabA0Lck/F1MYQ+iTTbv/nTQr/QZN9Vpzc1AiY8xo5I6E9I2Zyu7g0UmBZl5mzBgvW39AWhWTTHXpN/NMQYWIzlHFBsC0Hg79M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEQCJ/eD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724848228; x=1756384228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ctW73pHklNe9RINO0iCUE5vW5BGZGLv6BijjDcxDt3Q=;
  b=ZEQCJ/eD22XOLg6AtXvf7arjo+6dxUa32YiCWnXhFkXbrSdC+kxApAiX
   dQFOegAcumEwoUptn/qJioG64ub7XX0EGJ/qpBRW9Jq23/uRMQjF6aop1
   Ujp7+j5o3ZM9MlFm+AdxZDph0gyxbcuFwmEowZEs+ueynehoVkkTWsIRr
   9x+ykfAOxDxz7161bcA08i1T+RdJVgPBSHIyAzRXkxPPbRikVMFNraXv+
   p8FySW/uKj7DXPOI3VnsTfA4PVoixusITmLPjpOAD7GQuRWlF5CydijaU
   OSyasTAdLQj6aL21EwCzhwJ7z18ROGiNH920IFJQt8D7hLFH0fllYon8D
   g==;
X-CSE-ConnectionGUID: ewnu/BJtRx2GR1Cj5HWWBw==
X-CSE-MsgGUID: c4zaJe3iRBKrW9hOWrVE1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23558291"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="23558291"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 05:30:28 -0700
X-CSE-ConnectionGUID: UUaCcM39TnKc9iOjo1aeBg==
X-CSE-MsgGUID: oQpyLYd1Rfu7ufkyjGRP7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="94007581"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 05:30:24 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4B1321201A1;
	Wed, 28 Aug 2024 15:30:21 +0300 (EEST)
Date: Wed, 28 Aug 2024 12:30:21 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <Zs8YXVQ4armJJN4X@kekkonen.localdomain>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3fe348b-60a3-4480-8a8e-89760c5bb7ae@ideasonboard.com>

Heippa,

On Wed, Aug 28, 2024 at 03:14:47PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 28/08/2024 14:12, Laurent Pinchart wrote:
> > On Wed, Aug 28, 2024 at 11:06:23AM +0000, Sakari Ailus wrote:
> > > On Thu, Jun 20, 2024 at 02:07:51PM +0300, Tomi Valkeinen wrote:
> > > > Add DT bindings for raspberrypi,rp1-cfe.
> > > > 
> > > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > ---
> > > >   .../bindings/media/raspberrypi,rp1-cfe.yaml        | 98 ++++++++++++++++++++++
> > > >   1 file changed, 98 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
> > > > new file mode 100644
> > > > index 000000000000..851533de2305
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
> > > > @@ -0,0 +1,98 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/raspberrypi,rp1-cfe.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Raspberry Pi PiSP Camera Front End
> > > > +
> > > > +maintainers:
> > > > +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > +  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > > > +
> > > > +description: |
> > > > +  The Raspberry Pi PiSP Camera Front End is a module in Raspberrypi 5's RP1 I/O
> > > > +  controller, that contains:
> > > > +  - MIPI D-PHY
> > > > +  - MIPI CSI-2 receiver
> > > > +  - Simple image processor (called PiSP Front End, or FE)
> > > > +
> > > > +  The FE documentation is available at:
> > > > +  https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> > > > +
> > > > +  The PHY and CSI-2 receiver part have no public documentation.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - const: raspberrypi,rp1-cfe
> > > > +
> > > > +  reg:
> > > > +    items:
> > > > +      - description: CSI-2 registers
> > > > +      - description: D-PHY registers
> > > > +      - description: MIPI CFG (a simple top-level mux) registers
> > > > +      - description: FE registers
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  port:
> > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +    additionalProperties: false
> > > > +    description: CSI-2 RX Port
> > > > +
> > > > +    properties:
> > > > +      endpoint:
> > > > +        $ref: video-interfaces.yaml#
> > > > +        unevaluatedProperties: false
> > > > +
> > > > +        properties:
> > > > +          data-lanes:
> > > > +            minItems: 1
> > > > +            maxItems: 4
> > > > +
> > > > +          clock-lanes:
> > > > +            maxItems: 1
> > > 
> > > minItems needs to be 1 as well.
> 
> Hmm, I see a lot of
> 
> clock-lanes:
>   maxItems: 1
> 
> in the device tree bindings. And
> https://docs.kernel.org/devicetree/bindings/writing-schema.html says "Cases
> that have only a single entry just need to express that with maxItems".

Fair enough.

> 
> > > 
> > > Or... is this actually configurable in hardware?
> > 
> > Looking at the driver, lane reordering is not supported, so we could
> > drop this property. If the hardware is found to support it later, it can
> > easily be added back without any backward compatibility issue.
> 
> Re-ordering is not supported. I guess clock-lanes can be dropped, although I
> feel that if we have the clock lane in the hardware, and the numbering of
> data-lanes must take that into account, then:
> 
> clock-lanes = <0>;
> data-lanes = <1 2>;
> 
> looks better than:
> 
> data-lanes = <1 2>; /* and implicit clk lane 0 */
> 
> But I can't think of any practical benefit it brings...

The clock-lanes property is optional, it only provides any information if
the clock lane is configurable. Please drop it.

-- 
Terveisin,

Sakari Ailus

