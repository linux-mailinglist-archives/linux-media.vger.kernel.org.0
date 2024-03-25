Return-Path: <linux-media+bounces-7799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BDE88B4ED
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 00:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A40C13030D4
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 23:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1916682890;
	Mon, 25 Mar 2024 23:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pTEwW4Ko"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11B15A0EA;
	Mon, 25 Mar 2024 23:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711407734; cv=none; b=VwGerdHpApTYYhRG0l4vW2GVw4jdBPm5jtqc0mbD8Ne/oq7PKxTcQOgE42tM+YfzwB4edqulD59pJeJN2rue7xkjBTcnTASJ0wbgn2bpyDHEORzx+ipoZhqErQM+byhUGHEHGKz0Qg5r4yiQT31E8StWgI9uQFjcWBATs44KQOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711407734; c=relaxed/simple;
	bh=6CiAHcyt9ngLB9Fpb0+WYF2fbjDehQV6P24J0Li4dDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFcE997fp+6iE+JA2BD0qQ8y9mpEHF+18kLfWSXhCkapw4uGIxetRYYdxt0Aq+ZhBqRkz/bfTEvLtYn3E6eouB7ukqB69CLUUTFFYv+bKFnAkMhqQicWDWzd4su0i5Oyol/HTzl1tH4XwBzgiL9HO5fTWcJW+Ca/+IPV9HJu498=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pTEwW4Ko; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7B738B9;
	Tue, 26 Mar 2024 00:01:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711407699;
	bh=6CiAHcyt9ngLB9Fpb0+WYF2fbjDehQV6P24J0Li4dDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pTEwW4KotQgB/Hn0MjLLZAq6Qhh+V8ZDTTa7K/h1RWIfqpD7bYkadu0Q8eB38OW5l
	 8dEwymRTENCgGQAfU94zzcLkyPG/ExLEb+xR1MgHjDprN6TqGxD/wplXQm5cyXsr2L
	 SY85IXJgo+HubR/o7HtUoGhf7fF2ezz+VH5OleNw=
Date: Tue, 26 Mar 2024 01:02:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
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
Message-ID: <20240325230203.GG23988@pendragon.ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-9-laurent.pinchart@ideasonboard.com>
 <ZgHCOySoPhOS0u2M@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgHCOySoPhOS0u2M@kekkonen.localdomain>

Hi Sakari,

On Mon, Mar 25, 2024 at 06:28:11PM +0000, Sakari Ailus wrote:
> On Fri, Mar 01, 2024 at 11:32:23PM +0200, Laurent Pinchart wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > 
> > Introduce the dt-bindings documentation for bcm2835 CCP2/CSI2 Unicam
> > camera interface.
> > 
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Co-developed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v5:
> > 
> > - Squash MAINTAINERS changes in
> > 
> > Changes since v3:
> > 
> > - Make MAINTAINERS its own patch
> > - Describe the reg and clocks correctly
> > - Use a vendor entry for the number of data lanes
> > ---
> >  .../bindings/media/brcm,bcm2835-unicam.yaml   | 117 ++++++++++++++++++
> >  MAINTAINERS                                   |   6 +
> >  2 files changed, 123 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> > new file mode 100644
> > index 000000000000..1938ace23b3d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> > @@ -0,0 +1,117 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/brcm,bcm2835-unicam.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom BCM283x Camera Interface (Unicam)
> > +
> > +maintainers:
> > +  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > +
> > +description: |-
> > +  The Unicam block on BCM283x SoCs is the receiver for either
> > +  CSI-2 or CCP2 data from image sensors or similar devices.
> > +
> > +  The main platform using this SoC is the Raspberry Pi family of boards.  On
> > +  the Pi the VideoCore firmware can also control this hardware block, and
> > +  driving it from two different processors will cause issues.  To avoid this,
> > +  the firmware checks the device tree configuration during boot. If it finds
> > +  device tree nodes whose name starts with 'csi' then it will stop the firmware
> > +  accessing the block, and it can then safely be used via the device tree
> > +  binding.
> > +
> > +properties:
> > +  compatible:
> > +    const: brcm,bcm2835-unicam
> > +
> > +  reg:
> > +    items:
> > +      - description: Unicam block.
> > +      - description: Clock Manager Image (CMI) block.
> > +
> > +  reg-names:
> > +    items:
> > +      - const: unicam
> > +      - const: cmi
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Clock to drive the LP state machine of Unicam.
> > +      - description: Clock for the VPU (core clock).
> > +
> > +  clock-names:
> > +    items:
> > +      - const: lp
> > +      - const: vpu
> > +
> > +  power-domains:
> > +    items:
> > +      - description: Unicam power domain
> > +
> > +  brcm,num-data-lanes:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 2, 4 ]
> > +    description: |
> > +      Number of CSI-2 data lanes supported by this Unicam instance. The number
> > +      of data lanes actively used is specified with the data-lanes endpoint
> > +      property.
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes: true
> > +
> > +        required:
> > +          - data-lanes
> 
> As the device supports multiple data interfaces (at least so it seems when
> looking at the driver code), you need to list the bus-type property here,
> too.

Good point, I'll add

        properties:
	  bus-type:
	    enum: [ 3, 4 ]
	required:
	  - bus-type

Should I also change unevaluatedProperties to additionalProperties for
the endpoint node, to reject any other property (and the explicitly list
remote-endpoint as an allowed property) ? The result would be 

      endpoint:
        $ref: /schemas/media/video-interfaces.yaml#
        additionalProperties: false

        properties:
          bus-type:
            enum: [ 3, 4 ]

          data-lanes: true
          remote-endpoint: true

        required:
          - bus-type
          - data-lanes
          - remote-endpoint

> > +
> > +    required:
> > +      - endpoint
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - brcm,num-data-lanes
> > +  - port
> > +
> > +additionalProperties: False
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/bcm2835.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/raspberrypi-power.h>
> > +    csi1: csi@7e801000 {
> > +        compatible = "brcm,bcm2835-unicam";
> > +        reg = <0x7e801000 0x800>,
> > +              <0x7e802004 0x4>;
> > +        reg-names = "unicam", "cmi";
> > +        interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&clocks BCM2835_CLOCK_CAM1>,
> > +                 <&firmware_clocks 4>;
> > +        clock-names = "lp", "vpu";
> > +        power-domains = <&power RPI_POWER_DOMAIN_UNICAM1>;
> > +        brcm,num-data-lanes = <2>;
> > +        port {
> > +                csi1_ep: endpoint {
> > +                        remote-endpoint = <&imx219_0>;
> > +                        data-lanes = <1 2>;
> > +                };
> > +        };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index fada59148cb5..e50a59654e6e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3997,6 +3997,12 @@ N:	bcm113*
> >  N:	bcm216*
> >  N:	kona
> >  
> > +BROADCOM BCM2835 CAMERA DRIVERS
> > +M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> > +
> >  BROADCOM BCM47XX MIPS ARCHITECTURE
> >  M:	Hauke Mehrtens <hauke@hauke-m.de>
> >  M:	Rafał Miłecki <zajec5@gmail.com>

-- 
Regards,

Laurent Pinchart

