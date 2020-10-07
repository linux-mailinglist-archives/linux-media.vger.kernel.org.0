Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286492859A4
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 09:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727732AbgJGHi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 03:38:26 -0400
Received: from mga04.intel.com ([192.55.52.120]:57905 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727566AbgJGHi0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Oct 2020 03:38:26 -0400
IronPort-SDR: Tkj1g+ruNoY4H6m12PfS2yDSUZuq0tCjoczqdAH4cbGP9huXPHv7trCpBmU1CoYUP80DTOKr0S
 5Yzsl9pJ9s0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="162233362"
X-IronPort-AV: E=Sophos;i="5.77,345,1596524400"; 
   d="scan'208";a="162233362"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 00:38:25 -0700
IronPort-SDR: x7gspdlz0qllEYl4D79o76rnUWUwn+JDIVUDMMoC/9WK1wNQwBldWDk8iZtwgudjpGt2TLWpcH
 dbTzT+9ZLYIw==
X-IronPort-AV: E=Sophos;i="5.77,345,1596524400"; 
   d="scan'208";a="316091399"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 00:38:23 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id DA1FB207B6; Wed,  7 Oct 2020 10:38:21 +0300 (EEST)
Date:   Wed, 7 Oct 2020 10:38:21 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH 023/100] dt-bindings: nokia,smia: Convert to YAML
Message-ID: <20201007073821.GI26842@paasikivi.fi.intel.com>
References: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
 <20200930201914.31377-5-sakari.ailus@linux.intel.com>
 <20201006195807.GA2724596@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006195807.GA2724596@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thank you for the review.

On Tue, Oct 06, 2020 at 02:58:07PM -0500, Rob Herring wrote:
> On Wed, Sep 30, 2020 at 11:19:11PM +0300, Sakari Ailus wrote:
> > Convert nokia,smia DT bindings to YAML.
> > 
> > Also add explicit license to bindings.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../bindings/media/i2c/nokia,smia.txt         |  68 --------
> >  .../bindings/media/i2c/nokia,smia.yaml        | 147 ++++++++++++++++++
> >  2 files changed, 147 insertions(+), 68 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt b/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
> > deleted file mode 100644
> > index 5ea4f799877b..000000000000
> > --- a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
> > +++ /dev/null
> > @@ -1,68 +0,0 @@
> > -SMIA/SMIA++ sensor
> > -
> > -SMIA (Standard Mobile Imaging Architecture) is an image sensor standard
> > -defined jointly by Nokia and ST. SMIA++, defined by Nokia, is an extension
> > -of that. These definitions are valid for both types of sensors.
> > -
> > -More detailed documentation can be found in
> > -Documentation/devicetree/bindings/media/video-interfaces.txt .
> > -
> > -The device node should contain a "port" node which may contain one or more
> > -endpoint nodes, in accordance with video interface bindings defined in
> > -Documentation/devicetree/bindings/media/video-interfaces.txt .
> > -
> > -Mandatory properties
> > ---------------------
> > -
> > -- compatible: "nokia,smia"
> > -- reg: I2C address (0x10, or an alternative address)
> > -- clocks: External clock to the sensor
> > -- clock-frequency: Frequency of the external clock to the sensor
> > -
> > -
> > -Optional properties
> > --------------------
> > -
> > -- reset-gpios: XSHUTDOWN GPIO
> > -- flash-leds: See ../video-interfaces.txt
> > -- lens-focus: See ../video-interfaces.txt
> > -- rotation: Integer property; valid values are 0 (sensor mounted upright)
> > -	    and 180 (sensor mounted upside down). See
> > -	    ../video-interfaces.txt .
> > -- vana-supply: Analogue voltage supply (VANA), typically 2,8 volts (sensor
> > -  dependent).
> > -
> > -
> > -Endpoint node mandatory properties
> > -----------------------------------
> > -
> > -- data-lanes: <1..n>
> > -- link-frequencies: List of allowed data link frequencies. An array of
> > -  64-bit elements.
> > -
> > -
> > -Example
> > --------
> > -
> > -&i2c2 {
> > -	clock-frequency = <400000>;
> > -
> > -	camera-sensor@10 {
> > -		compatible = "nokia,smia";
> > -		reg = <0x10>;
> > -		reset-gpios = <&gpio3 20 0>;
> > -		vana-supply = <&vaux3>;
> > -		clocks = <&omap3_isp 0>;
> > -		clock-frequency = <9600000>;
> > -		nokia,nvm-size = <512>; /* 8 * 64 */
> > -		port {
> > -			smiapp_ep: endpoint {
> > -				data-lanes = <1 2>;
> > -				remote-endpoint = <&csi2a_ep>;
> > -				link-frequencies =
> > -					/bits/ 64 <199200000 210000000
> > -						   499200000>;
> > -			};
> > -		};
> > -	};
> > -};
> > diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml b/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
> > new file mode 100644
> > index 000000000000..3d6f68b0e559
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
> > @@ -0,0 +1,147 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (C) 2014--2020 Intel Corporation
> > +
> > +$id: http://devicetree.org/schemas/media/i2c/nokia,smia.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SMIA/SMIA++ sensor
> > +
> > +maintainers:
> > +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> > +
> > +description:
> > +
> > +  SMIA (Standard Mobile Imaging Architecture) is an image sensor standard
> > +  defined jointly by Nokia and ST. SMIA++, defined by Nokia, is an extension of
> > +  that. These definitions are valid for both types of sensors.
> > +
> > +  More detailed documentation can be found in
> > +  Documentation/devicetree/bindings/media/video-interfaces.txt .
> > +
> > +properties:
> > +  compatible:
> > +    const: nokia,smia
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vana-supply:
> > +    description: Analogue voltage supply (VANA), typically 2,8 volts (sensor
> > +      dependent).
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description: External clock to the sensor.
> > +    maxItems: 1
> > +
> > +  clock-frequency:
> > +    description: Frequency of the external clock to the sensor.
> > +
> > +  reset-gpios:
> > +    description: Reset GPIO. Also commonly called XSHUTDOWN in hardware
> > +      documentation.
> > +    maxItems: 1
> > +
> > +  flash-leds:
> > +    description: Flash LED phandles. See ../video-interfaces.txt for details.
> > +
> > +  lens-focus:
> > +    description: Lens focus controller phandles. See ../video-interfaces.txt
> > +      for details.
> > +
> > +  rotation:
> > +    description: Rotation; either 0 or 180 degrees.
> 
> enum: [ 0, 180 ]

Yes.

> 
> > +
> > +  port:
> > +    type: object
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +        properties:
> > +          link-frequencies:
> > +            $ref: /schemas/types.yaml#/definitions/uint64-array
> > +            description: List of allowed data link frequencies. An array of
> > +              64-bit elements.
> 
> Just 'link-frequencies: true' unless you have some additional 
> constraints.

We don't have video-interfaces.yaml yet, so $ref is needed. But I think
mentioning it's a 64-bit element is redundant in the description so I
remove it.

> 
> > +          data-lanes:
> > +            oneOf:
> > +              - items:
> > +                - const: 1
> > +              - items:
> > +                - const: 1
> > +                - const: 2
> > +              - items:
> > +                - const: 1
> > +                - const: 2
> > +                - const: 3
> > +              - items:
> > +                - const: 1
> > +                - const: 2
> > +                - const: 3
> > +                - const: 4
> > +              - items:
> > +                - const: 1
> > +                - const: 2
> > +                - const: 3
> > +                - const: 4
> > +                - const: 5
> > +              - items:
> > +                - const: 1
> > +                - const: 2
> > +                - const: 3
> > +                - const: 4
> > +                - const: 5
> > +                - const: 6
> > +              - items:
> > +                - const: 1
> > +                - const: 2
> > +                - const: 3
> > +                - const: 4
> > +                - const: 5
> > +                - const: 6
> > +                - const: 7
> > +              - items:
> > +                - const: 1
> > +                - const: 2
> > +                - const: 3
> > +                - const: 4
> > +                - const: 5
> > +                - const: 6
> > +                - const: 7
> > +                - const: 8
> 
> This all can be just the last 'items' plus:
> 
> minItems: 1
> maxItems: 8

I'll use that in v2.

> 
> 
> > +        required:
> > +          - link-frequencies
> > +          - data-lanes
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clock-frequency
> > +  - clocks
> 
> additionalProperties: false

Yes.

> 
> > +
> > +examples:
> > +  - |
> > +    i2c2 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        clock-frequency = <400000>;
> > +
> > +        camera-sensor@10 {
> > +            compatible = "nokia,smia";
> > +            reg = <0x10>;
> > +            reset-gpios = <&gpio3 20 0>;
> > +            vana-supply = <&vaux3>;
> > +            clocks = <&omap3_isp 0>;
> > +            clock-frequency = <9600000>;
> > +            nokia,nvm-size = <512>; /* 8 * 64 */
> 
> Not documented.

I'll remove it before this patch in v2.

> 
> > +            port {
> > +                smiapp_ep: endpoint {
> > +                    data-lanes = <1 2>;
> > +                    remote-endpoint = <&csi2a_ep>;
> > +                    link-frequencies = /bits/ 64 <199200000 210000000
> > +                                                  499200000>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...

-- 
Kind regards,

Sakari Ailus
