Return-Path: <linux-media+bounces-7871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CABA788D090
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 23:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08B771C3943D
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 22:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8525113DB92;
	Tue, 26 Mar 2024 22:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jaXHsYfF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7B413D538;
	Tue, 26 Mar 2024 22:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711491126; cv=none; b=pPywhBO9U59ngzvRTs6Ijh/o2D7FZLPQPgCc9DiCZACO+sV2R4fK55GWmWBvCyus/Wgdfhe9C9F0y3oLeBGWUP05tMukQkqA+/2PCJM631V/X0HSvhCoR3XgpP8bzgZh7pexo4A560/LQreS11tT6P6sw2vbGS6XaMW1PauGEoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711491126; c=relaxed/simple;
	bh=CjltGs2WDbODvpUErxnWwWyh+2tdgskx4zYdcdTvReU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1HaM1wAoA3Xk4GZ87sPH5rPhl8NuFjaxQSzJu4liFyNm5OJezrQmdWfa+RnhTngXg3bOPI+0IkiK0fefVVvsk5aXgyjVfqNFqn5gI/oyV96chsXu4pLI+eMxWu6KB3spXsJTUBn63kCtcIrnbQP6+bDIY/EN/IhWLu9kIUU7mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jaXHsYfF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711491125; x=1743027125;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CjltGs2WDbODvpUErxnWwWyh+2tdgskx4zYdcdTvReU=;
  b=jaXHsYfF9wR7qW0dHV2FoUMDlhdHzYRjgfAMXDuKtFoJJCtHkWzP8b1p
   lQSC/moCJWCxvtCSsKNuIQC0+Hx3jhRxS9SNiK+Tyw8GR644c9jcj2D+e
   WJ0yNPXjGy3pMzRxB1k0Gt6PjJ1Yk0E8IOgYbO/9GsZ8jw/FPLgofaFC/
   0OZWHFFX56Br3jWZ6pfTZiEqQIwyNA3bnxi6fYQc2GbiHckvA83Bj37Vx
   PSVh5656Z6DlRavp4HyzKq5SP5xakfmtvErBiCBNyU02KZ44VSsNk8+3G
   6dvN2ILSli6lzamH64IQySOE+yZNn+XXI9Aj01+r3/Qp/EW6oajd24rOY
   A==;
X-CSE-ConnectionGUID: TybfpKSVT761VAnS5GuRIg==
X-CSE-MsgGUID: +RTTUoFYRWq1TOs3oxi73g==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="7167381"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="7167381"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 15:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="16483960"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 15:11:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0279611F8B1;
	Wed, 27 Mar 2024 00:11:57 +0200 (EET)
Date: Tue, 26 Mar 2024 22:11:56 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>, kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 08/15] dt-bindings: media: Add bindings for
 bcm2835-unicam
Message-ID: <ZgNILE-t7orLv72Z@kekkonen.localdomain>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-9-laurent.pinchart@ideasonboard.com>
 <ZgHCOySoPhOS0u2M@kekkonen.localdomain>
 <20240325230203.GG23988@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240325230203.GG23988@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Mar 26, 2024 at 01:02:03AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Mon, Mar 25, 2024 at 06:28:11PM +0000, Sakari Ailus wrote:
> > On Fri, Mar 01, 2024 at 11:32:23PM +0200, Laurent Pinchart wrote:
> > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > 
> > > Introduce the dt-bindings documentation for bcm2835 CCP2/CSI2 Unicam
> > > camera interface.
> > > 
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > Co-developed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes since v5:
> > > 
> > > - Squash MAINTAINERS changes in
> > > 
> > > Changes since v3:
> > > 
> > > - Make MAINTAINERS its own patch
> > > - Describe the reg and clocks correctly
> > > - Use a vendor entry for the number of data lanes
> > > ---
> > >  .../bindings/media/brcm,bcm2835-unicam.yaml   | 117 ++++++++++++++++++
> > >  MAINTAINERS                                   |   6 +
> > >  2 files changed, 123 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> > > new file mode 100644
> > > index 000000000000..1938ace23b3d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> > > @@ -0,0 +1,117 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/brcm,bcm2835-unicam.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Broadcom BCM283x Camera Interface (Unicam)
> > > +
> > > +maintainers:
> > > +  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > > +
> > > +description: |-
> > > +  The Unicam block on BCM283x SoCs is the receiver for either
> > > +  CSI-2 or CCP2 data from image sensors or similar devices.
> > > +
> > > +  The main platform using this SoC is the Raspberry Pi family of boards.  On
> > > +  the Pi the VideoCore firmware can also control this hardware block, and
> > > +  driving it from two different processors will cause issues.  To avoid this,
> > > +  the firmware checks the device tree configuration during boot. If it finds
> > > +  device tree nodes whose name starts with 'csi' then it will stop the firmware
> > > +  accessing the block, and it can then safely be used via the device tree
> > > +  binding.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: brcm,bcm2835-unicam
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: Unicam block.
> > > +      - description: Clock Manager Image (CMI) block.
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: unicam
> > > +      - const: cmi
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Clock to drive the LP state machine of Unicam.
> > > +      - description: Clock for the VPU (core clock).
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: lp
> > > +      - const: vpu
> > > +
> > > +  power-domains:
> > > +    items:
> > > +      - description: Unicam power domain
> > > +
> > > +  brcm,num-data-lanes:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [ 2, 4 ]
> > > +    description: |
> > > +      Number of CSI-2 data lanes supported by this Unicam instance. The number
> > > +      of data lanes actively used is specified with the data-lanes endpoint
> > > +      property.
> > > +
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > +    unevaluatedProperties: false
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        unevaluatedProperties: false
> > > +
> > > +        properties:
> > > +          data-lanes: true
> > > +
> > > +        required:
> > > +          - data-lanes
> > 
> > As the device supports multiple data interfaces (at least so it seems when
> > looking at the driver code), you need to list the bus-type property here,
> > too.
> 
> Good point, I'll add
> 
>         properties:
> 	  bus-type:
> 	    enum: [ 3, 4 ]
> 	required:
> 	  - bus-type
> 
> Should I also change unevaluatedProperties to additionalProperties for
> the endpoint node, to reject any other property (and the explicitly list
> remote-endpoint as an allowed property) ? The result would be 
> 
>       endpoint:
>         $ref: /schemas/media/video-interfaces.yaml#
>         additionalProperties: false
> 
>         properties:
>           bus-type:
>             enum: [ 3, 4 ]
> 
>           data-lanes: true
>           remote-endpoint: true
> 
>         required:
>           - bus-type
>           - data-lanes
>           - remote-endpoint

Seems good to me.

> 
> > > +
> > > +    required:
> > > +      - endpoint
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reg-names
> > > +  - interrupts
> > > +  - clocks
> > > +  - clock-names
> > > +  - power-domains
> > > +  - brcm,num-data-lanes
> > > +  - port
> > > +
> > > +additionalProperties: False
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/bcm2835.h>
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/power/raspberrypi-power.h>
> > > +    csi1: csi@7e801000 {
> > > +        compatible = "brcm,bcm2835-unicam";
> > > +        reg = <0x7e801000 0x800>,
> > > +              <0x7e802004 0x4>;
> > > +        reg-names = "unicam", "cmi";
> > > +        interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > > +        clocks = <&clocks BCM2835_CLOCK_CAM1>,
> > > +                 <&firmware_clocks 4>;
> > > +        clock-names = "lp", "vpu";
> > > +        power-domains = <&power RPI_POWER_DOMAIN_UNICAM1>;
> > > +        brcm,num-data-lanes = <2>;
> > > +        port {
> > > +                csi1_ep: endpoint {
> > > +                        remote-endpoint = <&imx219_0>;
> > > +                        data-lanes = <1 2>;
> > > +                };
> > > +        };
> > > +    };
> > > +...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index fada59148cb5..e50a59654e6e 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -3997,6 +3997,12 @@ N:	bcm113*
> > >  N:	bcm216*
> > >  N:	kona
> > >  
> > > +BROADCOM BCM2835 CAMERA DRIVERS
> > > +M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > > +L:	linux-media@vger.kernel.org
> > > +S:	Maintained
> > > +F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> > > +
> > >  BROADCOM BCM47XX MIPS ARCHITECTURE
> > >  M:	Hauke Mehrtens <hauke@hauke-m.de>
> > >  M:	Rafał Miłecki <zajec5@gmail.com>
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,

Sakari Ailus

