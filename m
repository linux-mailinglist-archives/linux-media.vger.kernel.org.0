Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8D80290761
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 16:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406179AbgJPOmK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 10:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395258AbgJPOmK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 10:42:10 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72E9C061755;
        Fri, 16 Oct 2020 07:42:09 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id j136so3239232wmj.2;
        Fri, 16 Oct 2020 07:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vboLU1koxpPIQBOoTbGtXBkZYCehVDhO9l5JYy2MLxc=;
        b=DHUqeU67o/gh1IMc2HZu5ORst63DD5hPpGj/mIm6TJpDvC5WeKI0lz8nROaKnqPv0d
         u+ZmJYJLuw7huWmIgnh3owbw/rIzgwmzz6KfRnp8Rxn/Oz3M936VyPOAop3hPFjf/NHy
         g1yPMr4P/vvqjOgl7gCwtqEh44tfmlfd5snYNC4sbtxYsfWNik0gJo4RCjQ2BxL712jV
         VD1UJhQNKpHmEDuc1ohISGpBkMjC/SZtc1D8UBlUM2oflqLm9MSKw5Vgk8+2d/20Q4Pi
         F0BnMqv7vwQaAExOFlwMwSLeNKkOwhOe7haJE/QdFpkrPipywDKjn5JesDj0MQ4c/2SW
         FLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vboLU1koxpPIQBOoTbGtXBkZYCehVDhO9l5JYy2MLxc=;
        b=EaUEuSnucymsb21XT2fid3pCgIvGfVTft7OMt1Iy0SsMKb5DiP5dJma04Cem4I/eKJ
         mRDFQXWCKmLjE2hVF3iMTuU1npVK2d6ORbYcAb63KcdiMw0I6Wv0VBhAwSI58RIupWbY
         NhaTvsHPkVvivkHnFEZIg73g/zLuzUHGZy5ex+L6K/Gn5LNu+ZcM/XtYU4XmApy75V+y
         jMlbtAook746qLhAqo024tOdY16f0BB50eaBf/sPi7Bcq4VEqTzMLjfX+vhQmSpl+qRb
         zqiIwGi5C0qUE7R9oclzaFGAaptz2lyV2KR2guHaNUVEvEVUDsllIUzrKxkIiofcfBdY
         S16w==
X-Gm-Message-State: AOAM533kngmfkUNwyAryS9yrGkQi0cs2CYwuaR4nk8w4USVMycXSyJ/9
        i58m3Tl5ag0QwJISqd05R2s=
X-Google-Smtp-Source: ABdhPJyAvr/dCjR5tF5N5anYSWloY8Mf5F01vgyGPm4dnZikDgVTFClZGColpP2DuPrTt0x2UWHWZg==
X-Received: by 2002:a7b:c408:: with SMTP id k8mr4241462wmi.68.1602859328364;
        Fri, 16 Oct 2020 07:42:08 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c16sm3840130wrx.31.2020.10.16.07.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 07:42:07 -0700 (PDT)
Date:   Fri, 16 Oct 2020 15:42:04 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: ov2680: convert bindings to yaml
Message-ID: <20201016144204.3viee7spmvwtms5i@arch-thunder.localdomain>
References: <20201014142759.726823-1-rmfrfs@gmail.com>
 <20201014142759.726823-2-rmfrfs@gmail.com>
 <20201015144905.4b23k5uy7ycuhvlo@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015144905.4b23k5uy7ycuhvlo@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Jacopo,
Thanks for the review.

On Thu, Oct 15, 2020 at 04:49:05PM +0200, Jacopo Mondi wrote:
> Hi Rui,
> 
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
> 
> Might this be a good occasion to rename the file to ovti,ov2680.yaml ?

Yeah, was just following your precedent in ov5647 and the other ov
already ported to yaml in the directory. But I agree that it makes
sense to rename the files.

> 
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
>                 ^ double space
> 
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
> 
> I'll never get yaml right, doesn't breaking lines require '|' after
> the semicolon ? The validator does not complain, so I guess not.

I also had that idea, but looking also to other cases, and also in the
examlpe-schema where you have both cases, looks like it is not needed.

> 
> > +      Input clock for the sensor.
> > +    items:
> > +      - const: xvclk
> > +
> > +  reset-gpios:
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
> If no endpoint properties are specified, the last 6 lines here can be
> omitted. The rationale is that 'port' will be validated against a
> forthcoming 'of-graph.yaml' schema. So just:
> 
>    port:
>      type: object
>      additionalProperties: false
>      description:
>        A node containing an output port node with an endpoint definition
>        as documented in
>        Documentation/devicetree/bindings/media/video-interfaces.txt
> 
> With 'port' listed as mandatory, as you do already.

you are right, will fix this.

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
> 'additionalProperties: false' too ?

instead.

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
> 
> Applying the patch gives me:
> .git/rebase-apply/patch:182: new blank line at EOF.
> 
> I see most bindings have an empty line before '...'
> 
> With this small issues fixed:
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
 
 Thanks again Jacopo.

 Cheers,
    Rui
> 
> Thanks
>    j
> 
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
