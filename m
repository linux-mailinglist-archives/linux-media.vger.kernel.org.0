Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F89F47C960
	for <lists+linux-media@lfdr.de>; Tue, 21 Dec 2021 23:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbhLUWrS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 17:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbhLUWrS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 17:47:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C36C061574;
        Tue, 21 Dec 2021 14:47:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E52C1881;
        Tue, 21 Dec 2021 23:47:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1640126835;
        bh=Tnos1Ny1B4l9Wui/thdK1aYdIcFfXmwEfqHhmHiBPzo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=izbJQDzWV1yYvixpzlfDdSp1l7JbxcKej1mAhTBKIqIhkJOxJ8PBGBNkWhXrqsGhH
         L7jeflo3aNf+5MAAJzH47l4cAIbwN176fbHb7CBmJdSqpD0RizS7GBTZGzMvxmAkAK
         ghD2VN7IYA/LZTapC93tM6VjZ8kcnYNuZMOutdj8=
Date:   Wed, 22 Dec 2021 00:47:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor
 binding
Message-ID: <YcJZb2bd+c2hru2g@pendragon.ideasonboard.com>
References: <20211219220948.28953-1-laurent.pinchart@ideasonboard.com>
 <20211219220948.28953-2-laurent.pinchart@ideasonboard.com>
 <YcJW+EZhDkxk2u2w@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YcJW+EZhDkxk2u2w@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Dec 22, 2021 at 12:36:40AM +0200, Sakari Ailus wrote:
> On Mon, Dec 20, 2021 at 12:09:47AM +0200, Laurent Pinchart wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Add YAML devicetree binding for IMX296 CMOS image sensor. Let's also
> > add MAINTAINERS entry for the binding and driver.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v4:
> > 
> > - Rename to sony,imx296.yaml
> > - Add Laurent Pinchart as maintainer
> > - Rename power supplies
> > - Rename clock to INCK
> > - Drop clock-frequency property
> > - Reference OF graph DT schema
> > - Mention reset GPIO pin name
> > - Fix schema $id
> > - Fix port
> > ---
> >  .../bindings/media/i2c/sony,imx296.yaml       | 95 +++++++++++++++++++
> >  MAINTAINERS                                   |  8 ++
> >  2 files changed, 103 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
> > new file mode 100644
> > index 000000000000..e8f9a73bf2db
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
> > @@ -0,0 +1,95 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/sony,imx296.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony IMX296 1/2.8-Inch CMOS Image Sensor
> > +
> > +maintainers:
> > +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +
> > +description: |-
> > +  The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
> > +  sensor with square pixel array and 1.58 M effective pixels. This chip
> > +  features a global shutter with variable charge-integration time. It is
> > +  programmable through I2C and 4-wire interfaces. The sensor output is
> > +  available via CSI-2 serial data output (1 Lane).
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx296
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    description: Input clock (37.125 MHz, 54 MHz or 74.25 MHz)
> > +    items:
> > +      - const: inck
> 
> As the driver only gets the frequency, should we require assigned-clock-*
> stuff here?
> 
> Virtually all other sensors have a wide range of supported frequencies.

I don't like requiring assigned-clock-* in DT bindings for a particular
device, as it's a way to force a specific clock tree configuration, not
a description of that device. For instance, on my board, the clock is
provided by a fixed-frequency oscillator, so assigning a clock rate
would be redundant.

I believe it should be up to the DT author to ensure that the clock has
the right frequency, using one of the available means to do so.

> > +
> > +  avdd-supply:
> > +    description: Analog power supply (3.3V)
> > +
> > +  dvdd-supply:
> > +    description: Digital power supply (1.2V)
> > +
> > +  ovdd-supply:
> > +    description: Interface power supply (1.8V)
> > +
> > +  reset-gpios:
> > +    description: Sensor reset (XCLR) GPIO
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - avdd-supply
> > +  - dvdd-supply
> > +  - ovdd-supply
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        imx296: camera-sensor@1a {
> > +            compatible = "sony,imx296";
> > +            reg = <0x1a>;
> > +
> > +            pinctrl-names = "default";
> > +            pinctrl-0 = <&camera_rear_default>;
> > +
> > +            clocks = <&gcc 90>;
> > +            clock-names = "inck";
> > +
> > +            avdd-supply = <&camera_vdda_3v3>;
> > +            dvdd-supply = <&camera_vddd_1v2>;
> > +            ovdd-supply = <&camera_vddo_1v8>;
> > +
> > +            reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
> > +
> > +            port {
> > +                imx296_ep: endpoint {
> > +                    remote-endpoint = <&csiphy0_ep>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 43007f2d29e0..1b20f2b90aec 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17752,6 +17752,14 @@ T:	git git://linuxtv.org/media_tree.git
> >  F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
> >  F:	drivers/media/i2c/imx290.c
> >  
> > +SONY IMX296 SENSOR DRIVER
> > +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +T:	git git://linuxtv.org/media_tree.git
> > +F:	Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
> > +
> >  SONY IMX319 SENSOR DRIVER
> >  M:	Bingbu Cao <bingbu.cao@intel.com>
> >  L:	linux-media@vger.kernel.org

-- 
Regards,

Laurent Pinchart
