Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BD145EB05
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 11:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240422AbhKZKIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 05:08:24 -0500
Received: from comms.puri.sm ([159.203.221.185]:36684 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1376699AbhKZKGX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 05:06:23 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id EB6E1DF80A;
        Fri, 26 Nov 2021 02:02:39 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FTwc4evxQriD; Fri, 26 Nov 2021 02:02:38 -0800 (PST)
Message-ID: <d5e0fe8f8a5445c9c2d2b90fcf454829daf393e8.camel@puri.sm>
Subject: Re: [PATCH v9 2/4] dt-bindings: media: document SK Hynix Hi-846
 MIPI CSI-2 8M pixel sensor
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, kernel@puri.sm,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        phone-devel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        shawnx.tu@intel.com
Date:   Fri, 26 Nov 2021 11:02:31 +0100
In-Reply-To: <CAMuHMdVVNhLa2p-ywmpcEj-sw+NyRNp2z9jsVqsXEDrKphivCQ@mail.gmail.com>
References: <20210906102837.2190387-1-martin.kepplinger@puri.sm>
         <20210906102837.2190387-3-martin.kepplinger@puri.sm>
         <CAMuHMdVVNhLa2p-ywmpcEj-sw+NyRNp2z9jsVqsXEDrKphivCQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, dem 25.11.2021 um 12:15 +0100 schrieb Geert
Uytterhoeven:
> On Mon, Sep 6, 2021 at 12:30 PM Martin Kepplinger
> <martin.kepplinger@puri.sm> wrote:
> > Document the bindings used for the SK Hynix Hi-846 CMOS camera
> > driver.
> > 
> > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/media/i2c/hynix,hi846.yaml       | 120
> > ++++++++++++++++++
> >  1 file changed, 120 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > new file mode 100644
> > index 000000000000..85a8877c2f38
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > @@ -0,0 +1,120 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/hynix,hi846.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SK Hynix Hi-846 1/4" 8M Pixel MIPI CSI-2 sensor
> > +
> > +maintainers:
> > +  - Martin Kepplinger <martin.kepplinger@puri.sm>
> > +
> > +description: |-
> > +  The Hi-846 is a raw image sensor with an MIPI CSI-2 image data
> > +  interface and CCI (I2C compatible) control bus. The output
> > format
> > +  is raw Bayer.
> > +
> > +properties:
> > +  compatible:
> > +    const: hynix,hi846
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Reference to the mclk clock.
> > +
> > +  assigned-clocks:
> > +    maxItems: 1
> > +
> > +  assigned-clock-rates:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    description: Reference to the GPIO connected to the RESETB
> > pin. Active low.
> > +    maxItems: 1
> > +
> > +  shutdown-gpios:
> > +    description: Reference to the GPIO connected to the XSHUTDOWN
> > pin. Active low.
> > +    maxItems: 1
> > +
> > +  vddio-supply:
> > +    description: Definition of the regulator used for the VDDIO
> > power supply.
> > +
> > +  vdda-supply:
> > +    description: Definition of the regulator used for the VDDA
> > power supply.
> > +
> > +  vddd-supply:
> > +    description: Definition of the regulator used for the VDDD
> > power supply.
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            oneOf:
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +                  - const: 3
> > +                  - const: 4
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +
> > +        required:
> > +          - data-lanes
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - assigned-clocks
> > +  - assigned-clock-rates
> > +  - vddio-supply
> > +  - vdda-supply
> > +  - vddd-supply
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        hi846: camera@20 {
> > +            compatible = "hynix,hi846";
> > +            reg = <0x20>;
> > +            pinctrl-names = "default";
> > +            pinctrl-0 = <&pinctrl_csi1>;
> > +            clocks = <&clk 0>;
> > +            assigned-clocks = <&clk 0>;
> > +            assigned-clock-rates = <25000000>;
> > +            vdda-supply = <&reg_camera_vdda>;
> > +            vddd-supply = <&reg_camera_vddd>;
> > +            vddio-supply = <&reg_camera_vddio>;
> > +            reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
> > +            shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
> > +
> > +            port {
> > +                camera_out: endpoint {
> > +                    remote-endpoint = <&csi1_ep1>;
> > +                    link-frequencies = /bits/ 64
> > +                        <80000000 200000000>;
> > +                    data-lanes = <1 2>;
> 
> "make dt_binding_check":
> 
>    
> Documentation/devicetree/bindings/media/i2c/hynix,hi846.example.dt.ya
> ml:
> camera@20: port:endpoint: Unevaluated properties are not allowed
> ('link-frequencies', 'data-lanes' were unexpected)
>     From schema:
> Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> 
> > +                };
> > +            };
> > +        };
> > +    };
> 
> Gr{oetje,eeting}s,
> 
>                         Geert


thanks a lot Geert, but I can't reproduce this on linux-next. Which
tree did you run it against?

What I *do* see is the following during dtbs_check, so I guess I could
remove "orientation" and "rotation" from the example, which would be
kind of sad because these useful properties are not yet too wide know
anyway in the media device driver world...

/home/martin/dev/purism-forks/linux-
next/arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dt.yaml:
camera-front@20: 'orientation', 'rotation' do not match any of the
regexes: 'pinctrl-[0-9]+'
	From schema: /home/martin/dev/purism-forks/linux-
next/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml


if you can be more speicific I'll definitely try to reproduce again
though.

thanks,
                             martin


