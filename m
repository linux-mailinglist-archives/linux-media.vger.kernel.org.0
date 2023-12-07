Return-Path: <linux-media+bounces-1809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 781A98085B5
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 11:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99DF61C21DB4
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 10:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4942E641;
	Thu,  7 Dec 2023 10:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EwCL+SVq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21654AA;
	Thu,  7 Dec 2023 02:42:40 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F6A9669;
	Thu,  7 Dec 2023 11:41:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701945717;
	bh=BCaub9ftOdkxvTM7r8VpY4MvA8pplPIDE2K6EnOB4tU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EwCL+SVqcTgUmfg/+6c1Cov5Ue0QXHMxi4F9edO8uLM3/wgoccc4I4gw1tSvVxGJn
	 p3n+f+tZdhazxRa0qY4N5GGCVEKZKojEc2qRr+cjM0GJLII7CUICTCk/EJPhAtEU5h
	 ko7w4Z0fpUv3K8H+97EEVCxBovZu1HStEhfNbdAw=
Date: Thu, 7 Dec 2023 11:42:35 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, devicetree@vger.kernel.org, 
	Lee Jackson <lee.jackson@arducam.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/2] media: dt-bindings: Add OmniVision OV64A40
Message-ID: <pc776i6etbnxiarwupmeoonst727do5ikv6iezcg2xubk3hvgf@oppiffiaijwk>
References: <20231206155900.123904-1-jacopo.mondi@ideasonboard.com>
 <20231206155900.123904-2-jacopo.mondi@ideasonboard.com>
 <ZXGW8iyoQpIXUa1E@kekkonen.localdomain>
 <ecrdq6a2y6uymnzp63vfo7kxnft6eonqgmbkgew3z4iaucfbjg@hu2ws54mqwea>
 <ZXGf1-2_oM_OEtvB@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZXGf1-2_oM_OEtvB@kekkonen.localdomain>

Hi Sakari

On Thu, Dec 07, 2023 at 10:35:03AM +0000, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Thu, Dec 07, 2023 at 11:13:21AM +0100, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Thu, Dec 07, 2023 at 09:57:06AM +0000, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Wed, Dec 06, 2023 at 04:58:59PM +0100, Jacopo Mondi wrote:
> > > > Add bindings for OmniVision OV64A40.
> > > >
> > > > Co-developed-by: Lee Jackson <lee.jackson@arducam.com>
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > >  .../bindings/media/i2c/ovti,ov64a40.yaml      | 97 +++++++++++++++++++
> > > >  1 file changed, 97 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> > > > new file mode 100644
> > > > index 000000000000..e6c9d540a2dd
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> > > > @@ -0,0 +1,97 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov64a40.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: OmniVision OV64A40 Image Sensor
> > > > +
> > > > +maintainers:
> > > > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: ovti,ov64a40
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  avdd-supply:
> > > > +    description: Analog voltage supply, 2.8 volts
> > > > +
> > > > +  dvdd-supply:
> > > > +    description: Digital core voltage supply, 1.1 volts
> > > > +
> > > > +  dovdd-supply:
> > > > +    description: Digital I/O voltage supply, 1.8 volts
> > > > +
> > > > +  powerdown-gpios:
> > > > +    maxItems: 1
> > > > +
> > > > +  reset-gpios:
> > > > +    maxItems: 1
> > > > +
> > > > +  port:
> > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +    additionalProperties: false
> > > > +
> > > > +    properties:
> > > > +      endpoint:
> > > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > > +        additionalProperties: false
> > > > +
> > > > +        properties:
> > > > +          bus-type:
> > > > +            enum:
> > > > +              - 1 # MIPI CSI-2 C-PHY
> > > > +              - 4 # MIPI CSI-2 D-PHY
> > > > +          data-lanes: true
> > > > +          link-frequencies: true
> > > > +          clock-noncontinuous: true
> > > > +          remote-endpoint: true
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - clocks
> > > > +  - port
> > > > +
> > > > +unevaluatedProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +      #include <dt-bindings/gpio/gpio.h>
> > > > +
> > > > +      i2c {
> > > > +          #address-cells = <1>;
> > > > +          #size-cells = <0>;
> > > > +
> > > > +          camera@36 {
> > > > +              compatible = "ovti,ov64a40";
> > > > +              reg = <0x36>;
> > > > +              clocks = <&camera_clk>;
> > > > +              dovdd-supply = <&vgen4_reg>;
> > > > +              avdd-supply = <&vgen3_reg>;
> > > > +              dvdd-supply = <&vgen2_reg>;
> > > > +              powerdown-gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
> > > > +              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> > > > +              rotation = <180>;
> > > > +              orientation = <2>;
> > > > +
> > > > +              port {
> > > > +                  endpoint {
> > > > +                      remote-endpoint = <&mipi_csi2_in>;
> > > > +                      bus-type = <4>;
> > > > +                      data-lanes = <1 2 3 4>;
> > >
> > > This is missing link-frequencies.
> > >
> >
> > I was not sure about this, in facts.
> >
> > Bindings are about HW while link-frequencies is only about restricting
> > how the driver configures the sensor. Thus, I've not listed it as
> > mandatory however the driver mandates its presence.
> >
> > Should I make it mandatory in bindings ?
>
> See
> <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#handling-clocks>.
>
> IOW it's about the driver, too, but only secondarily.
>

Should link-frequencies be made mandatory by video-interfaces.yaml if
the bus type is CSI-2 (D-PHY as well as C-PHY I presume ?)

> >
> > > > +                  };
> > > > +              };
> > > > +          };
> > > > +      };
> > > > +
> > > > +...
> > >
>
> --
> Regards,
>
> Sakari Ailus

