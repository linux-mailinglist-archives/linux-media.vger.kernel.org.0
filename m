Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3198C398C44
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 16:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbhFBOQz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 10:16:55 -0400
Received: from comms.puri.sm ([159.203.221.185]:52480 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231669AbhFBOO7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 10:14:59 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 396EBDFAEF;
        Wed,  2 Jun 2021 07:12:44 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ff76JJN6Hjvg; Wed,  2 Jun 2021 07:12:39 -0700 (PDT)
Message-ID: <76437d47e5ac920baed3429d8839b6175864d13d.camel@puri.sm>
Subject: Re: [PATCH v2 2/5] dt-bindings: media: document SK Hynix Hi-846
 MIPI CSI-2 8M pixel sensor
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab@kernel.org, devicetree@vger.kernel.org, kernel@puri.sm,
        krzysztof.kozlowski@canonical.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com,
        robh@kernel.org, shawnx.tu@intel.com
Date:   Wed, 02 Jun 2021 16:12:33 +0200
In-Reply-To: <YLeQGjDdTX0iohZ0@pendragon.ideasonboard.com>
References: <20210528081336.3858700-1-martin.kepplinger@puri.sm>
         <20210528081336.3858700-3-martin.kepplinger@puri.sm>
         <20210602135137.GW3@valkosipuli.retiisi.eu>
         <YLeQGjDdTX0iohZ0@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, dem 02.06.2021 um 17:05 +0300 schrieb Laurent Pinchart:
> On Wed, Jun 02, 2021 at 04:51:37PM +0300, Sakari Ailus wrote:
> > Hi Martin,
> > 
> > On Fri, May 28, 2021 at 10:13:33AM +0200, Martin Kepplinger wrote:
> > > Document the bindings used for the SK Hynix Hi-846 CMOS camera
> > > driver.
> > > 
> > > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > 
> > Could you read Documentation/driver-api/media/camera-sensor.rst,
> > please?
> > 
> > I believe you'll need assigned-clock-rates device property as well
> > as
> 
> I dn't think assigned-clock-rates should be part of the bindings,
> it's a
> mechanism that can be used in any DT device node.
> 
> > link-frequencies endpoint property.
> > 
> > > ---
> > >  .../bindings/media/i2c/hynix,hi846.yaml       | 99
> > > +++++++++++++++++++
> > >  1 file changed, 99 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > > b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > > new file mode 100644
> > > index 000000000000..2991108e23e5
> > > --- /dev/null
> > > +++
> > > b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > > @@ -0,0 +1,99 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/hynix,hi846.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: SK Hynix Hi-846 1/4" 8M Pixel MIPI CSI-2 sensor
> > > +
> > > +maintainers:
> > > +  - Martin Kepplinger <martin.kepplinger@puri.sm>
> > > +
> > > +description: |-
> > > +  The Hi-846 is a raw image sensor with an MIPI CSI-2 image data
> > > +  interface and CCI (I2C compatible) control bus. The output
> > > format
> > > +  is 10bit Bayer.
> > 
> > Virtually all Bayer sensors can do 8 bpp, too. I'd drop the
> > sentence
> 
> Not this one according to its datasheet (we can't rule out that this
> would be possible an undocumented of course).

actually there is one register that mentions raw8 output but I never
got that to work. I don't have to mention 10bit in this description.
thanks.

> 
> > mentoning 10 bits.
> > 
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: hynix,hi846
> > > +
> > > +  reg:
> > > +    description: I2C device address.
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    description: Reference to the mclk clock.
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    const: mclk
> > > +
> > > +  rst-gpios:
> > > +    description: Reference to the GPIO connected to the reset
> > > pin. Active low.
> > > +    maxItems: 1
> > > +
> > > +  vdd-supply:
> > > +    description: Definition of the regulator used as 1.8V
> > > digital power supply.
> > > +
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/properties/port
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        unevaluatedProperties: false
> > > +
> > > +        properties:
> > > +          data-lanes:
> > > +            oneOf:
> > > +              - items:
> > > +                  - const: 1
> > > +                  - const: 2
> > > +                  - const: 3
> > > +                  - const: 4
> > > +              - items:
> > > +                  - const: 1
> > > +                  - const: 2
> > > +
> > > +        required:
> > > +          - data-lanes
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - rst-gpios
> > > +  - vdd-supply
> > > +  - port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    i2c {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        hi846: camera@20 {
> > > +            compatible = "hynix,hi846";
> > > +            reg = <0x20>;
> > > +            clocks = <&clk>;
> > > +            clock-names = "mclk";
> > > +            vdd-supply = <&reg_camera_pwr_en>; /* 1.8v */
> > > +            rst-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
> > > +
> > > +            port {
> > > +                camera_out: endpoint {
> > > +                    remote-endpoint = <&csi1_ep1>;
> > > +                    data-lanes = <1 2>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +...
> 


