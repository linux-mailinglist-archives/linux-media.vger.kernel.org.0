Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189362937B0
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 11:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390903AbgJTJKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 05:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392542AbgJTJJr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 05:09:47 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DE6C061755;
        Tue, 20 Oct 2020 02:09:46 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id f21so986196wml.3;
        Tue, 20 Oct 2020 02:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9+j1rGorH+sK+vTmh9IrzFABygAPTROIyRl4L4hR8/k=;
        b=HiEJBgGuSB052FG9V+poOfiMrKpA2K44PTfvPnqj13DFZnS9hGV9hlRKVgCv24G3LT
         tzoUdvzTW1F/ZwBBDOn6Qlml3R0v1+MbrePLHcrJmGXI2v90PLFxPfYL1CuilXqfS2Y/
         7p0aPYRPk1dJ1P7aFfBvNBRgvk0wmbDBH+EweKzSbWKC723TxuRU1Ct6WbHDBq9qdnuS
         n66mQLADqbXHjGrf/xADPWnJ49OYiYPfHcw85086a+4FmuumSWqDkac6xJpLUSccvLzx
         wzEgc91dbWQFaH4CvOtx9RgwgEHUYGFeJVVhvTBpgkvhH/Ck3KUBAlMgeb7CTv77nz7l
         7hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9+j1rGorH+sK+vTmh9IrzFABygAPTROIyRl4L4hR8/k=;
        b=n6WSpen0XqqZRKyh9B1IbmSF0O9hlIFOFMdxRmgib/K0SngZe+5Zc3sQ73KiV4uCOd
         MkpXJohGcczwUPnUhc4UgMQdFDl/eecMDMErM1RUeUObe6JRfQ8c92Wv0tTmELF9tAD4
         xhZxyh+QXvOdyzIPNhr8O84OfwPgPBvexmuCPkVmzJ0sju+n6fM2sxHb/OCY0WQ0TJX7
         8vB15uxu8fx4f24TCy64Z858Urz9SpdB5010IXwbRnMVMVNPLDqb5DTYVc9NPND+8INb
         s1ZoZX4uQoTzTlSbpXdKPgEy+KE41cvIJ7MQ0+pAcH5IwBDjlQerKJ8lZPuyHzoC6sVb
         nxvg==
X-Gm-Message-State: AOAM531Llp0jm+qHCvR7AzF01PEIQZowTr3Y37o0hUElZwW6e2Ll5x4G
        fjga5A+mH0Ndw9Oj4+LlPUM=
X-Google-Smtp-Source: ABdhPJybOwxS2lQqkxPRPqXE4PyJUZaZOVScQNuHfs3aiN4WV9auyusgBcW/Po2pN69lmkLGJVzQVg==
X-Received: by 2002:a1c:6743:: with SMTP id b64mr1745956wmc.157.1603184985518;
        Tue, 20 Oct 2020 02:09:45 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id j13sm1932448wru.86.2020.10.20.02.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 02:09:44 -0700 (PDT)
Date:   Tue, 20 Oct 2020 10:09:42 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     sakari.ailus@linux.intel.com, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: ov2680: convert bindings to yaml
Message-ID: <20201020090942.rmtbx2lyogaadehc@arch-thunder.localdomain>
References: <20201014142759.726823-1-rmfrfs@gmail.com>
 <20201014142759.726823-2-rmfrfs@gmail.com>
 <20201019203910.GB3550266@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019203910.GB3550266@bogus>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Rob,
On Mon, Oct 19, 2020 at 03:39:10PM -0500, Rob Herring wrote:
> On Wed, Oct 14, 2020 at 03:27:57PM +0100, Rui Miguel Silva wrote:
> > Convert ov2680 sensor bindings documentation to yaml schema, remove
> > the textual bindings document and update MAINTAINERS entry.
> > 
> > Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > ---
> >   
> > v1 -> v2:
> >   Sakari Ailus - Patch 1/3:
> >   https://lore.kernel.org/linux-media/20201013160908.GC13341@paasikivi.fi.intel.com/
> >   - omit remote-endpoint
> >   - remove not needed clock-lanes and data-lanes

There was already a V3 on the list when you reviewed this version,
Jacopo had already made some of the same comments as you. So,
some are already solved in that version.

I will send a v4 please just jump to that version.
Many thanks,

------
Cheers,
     Rui
> > 
> >  .../devicetree/bindings/media/i2c/ov2680.txt  |  46 --------
> >  .../devicetree/bindings/media/i2c/ov2680.yaml | 109 ++++++++++++++++++
> >  MAINTAINERS                                   |   2 +-
> >  3 files changed, 110 insertions(+), 47 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov2680.txt b/Documentation/devicetree/bindings/media/i2c/ov2680.txt
> > deleted file mode 100644
> > index 11e925ed9dad..000000000000
> > --- a/Documentation/devicetree/bindings/media/i2c/ov2680.txt
> > +++ /dev/null
> > @@ -1,46 +0,0 @@
> > -* Omnivision OV2680 MIPI CSI-2 sensor
> > -
> > -Required Properties:
> > -- compatible: should be "ovti,ov2680".
> > -- clocks: reference to the xvclk input clock.
> > -- clock-names: should be "xvclk".
> > -- DOVDD-supply: Digital I/O voltage supply.
> > -- DVDD-supply: Digital core voltage supply.
> > -- AVDD-supply: Analog voltage supply.
> > -
> > -Optional Properties:
> > -- reset-gpios: reference to the GPIO connected to the powerdown/reset pin,
> > -               if any. This is an active low signal to the OV2680.
> > -
> > -The device node must contain one 'port' child node for its digital output
> > -video port, and this port must have a single endpoint in accordance with
> > - the video interface bindings defined in
> > -Documentation/devicetree/bindings/media/video-interfaces.txt.
> > -
> > -Endpoint node required properties for CSI-2 connection are:
> > -- remote-endpoint: a phandle to the bus receiver's endpoint node.
> > -- clock-lanes: should be set to <0> (clock lane on hardware lane 0).
> > -- data-lanes: should be set to <1> (one CSI-2 lane supported).
> > -
> > -Example:
> > -
> > -&i2c2 {
> > -	ov2680: camera-sensor@36 {
> > -		compatible = "ovti,ov2680";
> > -		reg = <0x36>;
> > -		clocks = <&osc>;
> > -		clock-names = "xvclk";
> > -		reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
> > -		DOVDD-supply = <&sw2_reg>;
> > -		DVDD-supply = <&sw2_reg>;
> > -		AVDD-supply = <&reg_peri_3p15v>;
> > -
> > -		port {
> > -			ov2680_to_mipi: endpoint {
> > -				remote-endpoint = <&mipi_from_sensor>;
> > -				clock-lanes = <0>;
> > -				data-lanes = <1>;
> > -			};
> > -		};
> > -	};
> > -};
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ov2680.yaml
> > new file mode 100644
> > index 000000000000..ef2b45b03dcc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov2680.yaml
> > @@ -0,0 +1,109 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ov2680.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Omnivision OV2680 CMOS Sensor
> > +
> > +maintainers:
> > +  - Rui Miguel Silva <rmfrfs@gmail.com>
> > +
> > +description: |-
> > +  The OV2680 color sensor is a low voltage, high performance 1/5 inch UXGA (2
> > +  megapixel) CMOS image sensor that provides a single-chip UXGA (1600 x 1200)
> > +  camera. It provides full-frame, sub-sampled, or windowed 10-bit images in
> > +  various formats via the control of the Serial Camera Control Bus (SCCB)
> > +  interface.  The OV2680 has an image array capable of operating at up to 30
> > +  frames per second (fps) in UXGA resolution.
> > +
> > +properties:
> > +  compatible:
> > +    const: ovti,ov2680
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    description:
> > +      Input clock for the sensor.
> > +    items:
> > +      - const: xvclk
> > +
> > +  reset-gpios:
> 
> How many? (maxItems: 1)
> 
> > +    description:
> > +      The phandle and specifier for the GPIO that controls sensor reset.
> > +      This corresponds to the hardware pin XSHUTDOWN which is physically
> > +      active low.
> > +
> > +  dovdd-supply:
> > +    description:
> > +      Definition of the regulator used as interface power supply.
> > +
> > +  avdd-supply:
> > +    description:
> > +      Definition of the regulator used as analog power supply.
> > +
> > +  dvdd-supply:
> > +    description:
> > +      Definition of the regulator used as digital power supply.
> > +
> > +  port:
> > +    type: object
> > +    additionalProperties: false
> > +    description:
> > +      A node containing an output port node with an endpoint definition
> > +      as documented in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +
> > +    required:
> > +      - endpoint
> 
> Just need a description of the data/direction for 'port'. Drop the rest.
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - dovdd-supply
> > +  - avdd-supply
> > +  - dvdd-supply
> > +  - reset-gpios
> > +  - port
> > +
> > +unevaluatedProperties: false
> 
> You can use 'additionalProperties: false' here instead.
> 
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ov2680: camera-sensor@36 {
> > +                compatible = "ovti,ov2680";
> > +                reg = <0x36>;
> > +                clocks = <&osc>;
> > +                clock-names = "xvclk";
> > +                reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
> > +
> > +                dovdd-supply = <&sw2_reg>;
> > +                dvdd-supply = <&sw2_reg>;
> > +                avdd-supply = <&reg_peri_3p15v>;
> > +
> > +                port {
> > +                        ov2680_to_mipi: endpoint {
> > +                                remote-endpoint = <&mipi_from_sensor>;
> > +                        };
> > +                };
> > +        };
> > +    };
> > +...
> > +
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2e85e114c9c3..926dcdc4794c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12775,7 +12775,7 @@ M:	Rui Miguel Silva <rmfrfs@gmail.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  T:	git git://linuxtv.org/media_tree.git
> > -F:	Documentation/devicetree/bindings/media/i2c/ov2680.txt
> > +F:	Documentation/devicetree/bindings/media/i2c/ov2680.yaml
> >  F:	drivers/media/i2c/ov2680.c
> >  
> >  OMNIVISION OV2685 SENSOR DRIVER
> > -- 
> > 2.28.0
> > 
