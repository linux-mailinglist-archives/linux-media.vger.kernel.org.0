Return-Path: <linux-media+bounces-1808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8306E8085A5
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 11:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39C5B284137
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 10:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2764F374E7;
	Thu,  7 Dec 2023 10:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnVK0qDz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EDCEAA;
	Thu,  7 Dec 2023 02:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701945309; x=1733481309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tusDsZJtvdZ6iZF8v1gIwDPpIUvG7xVnQQQ7/Dbuzmk=;
  b=cnVK0qDz6PFjntrN7z06dQss1+yrtkZwmkJmVsz8hU1Wd+xfITm2b6oh
   +1BjliPrk3OQAoEorJjcwTT3EzWLmorlYqRmddBAEnCmaACwFvhxIQ7gq
   5jduncXiBngqtB0SfE7yH83h4Zo6btmAHlsZREzSeTElsE5ZT9X33q6yS
   ah8HqoN2gXLTbdvEOwWNNh3KY8Dx1q/excnk1OpL5mb8vmrZAAiUIphkn
   rvOXIVRB+gYwRLmwrvBdXUz5DV9/7GQcmQAkWtHjD9Ksan2Fy98kNiU5E
   wvOoICsPvGVyg4QM5u4RtEo+ceiGKIKo9E/RE+v/wCi5mEK96Io6TNJhU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1078102"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1078102"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 02:35:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="19665012"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 02:35:06 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2ACC611FB50;
	Thu,  7 Dec 2023 12:35:03 +0200 (EET)
Date: Thu, 7 Dec 2023 10:35:03 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	devicetree@vger.kernel.org, Lee Jackson <lee.jackson@arducam.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/2] media: dt-bindings: Add OmniVision OV64A40
Message-ID: <ZXGf1-2_oM_OEtvB@kekkonen.localdomain>
References: <20231206155900.123904-1-jacopo.mondi@ideasonboard.com>
 <20231206155900.123904-2-jacopo.mondi@ideasonboard.com>
 <ZXGW8iyoQpIXUa1E@kekkonen.localdomain>
 <ecrdq6a2y6uymnzp63vfo7kxnft6eonqgmbkgew3z4iaucfbjg@hu2ws54mqwea>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecrdq6a2y6uymnzp63vfo7kxnft6eonqgmbkgew3z4iaucfbjg@hu2ws54mqwea>

Hi Jacopo,

On Thu, Dec 07, 2023 at 11:13:21AM +0100, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Dec 07, 2023 at 09:57:06AM +0000, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Wed, Dec 06, 2023 at 04:58:59PM +0100, Jacopo Mondi wrote:
> > > Add bindings for OmniVision OV64A40.
> > >
> > > Co-developed-by: Lee Jackson <lee.jackson@arducam.com>
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >  .../bindings/media/i2c/ovti,ov64a40.yaml      | 97 +++++++++++++++++++
> > >  1 file changed, 97 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> > > new file mode 100644
> > > index 000000000000..e6c9d540a2dd
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> > > @@ -0,0 +1,97 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov64a40.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: OmniVision OV64A40 Image Sensor
> > > +
> > > +maintainers:
> > > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ovti,ov64a40
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  avdd-supply:
> > > +    description: Analog voltage supply, 2.8 volts
> > > +
> > > +  dvdd-supply:
> > > +    description: Digital core voltage supply, 1.1 volts
> > > +
> > > +  dovdd-supply:
> > > +    description: Digital I/O voltage supply, 1.8 volts
> > > +
> > > +  powerdown-gpios:
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        additionalProperties: false
> > > +
> > > +        properties:
> > > +          bus-type:
> > > +            enum:
> > > +              - 1 # MIPI CSI-2 C-PHY
> > > +              - 4 # MIPI CSI-2 D-PHY
> > > +          data-lanes: true
> > > +          link-frequencies: true
> > > +          clock-noncontinuous: true
> > > +          remote-endpoint: true
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - port
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +      #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +      i2c {
> > > +          #address-cells = <1>;
> > > +          #size-cells = <0>;
> > > +
> > > +          camera@36 {
> > > +              compatible = "ovti,ov64a40";
> > > +              reg = <0x36>;
> > > +              clocks = <&camera_clk>;
> > > +              dovdd-supply = <&vgen4_reg>;
> > > +              avdd-supply = <&vgen3_reg>;
> > > +              dvdd-supply = <&vgen2_reg>;
> > > +              powerdown-gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
> > > +              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> > > +              rotation = <180>;
> > > +              orientation = <2>;
> > > +
> > > +              port {
> > > +                  endpoint {
> > > +                      remote-endpoint = <&mipi_csi2_in>;
> > > +                      bus-type = <4>;
> > > +                      data-lanes = <1 2 3 4>;
> >
> > This is missing link-frequencies.
> >
> 
> I was not sure about this, in facts.
> 
> Bindings are about HW while link-frequencies is only about restricting
> how the driver configures the sensor. Thus, I've not listed it as
> mandatory however the driver mandates its presence.
> 
> Should I make it mandatory in bindings ?

See
<URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#handling-clocks>.

IOW it's about the driver, too, but only secondarily.

> 
> > > +                  };
> > > +              };
> > > +          };
> > > +      };
> > > +
> > > +...
> >

-- 
Regards,

Sakari Ailus

