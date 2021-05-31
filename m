Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E958E396A0B
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 01:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbhEaX0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 19:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbhEaX0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 19:26:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38CEDC061574;
        Mon, 31 May 2021 16:25:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F5D288C;
        Tue,  1 Jun 2021 01:25:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622503506;
        bh=UiDZnTgy4dSBkNIVjA2i/pzpL0XI4879xmanMraIx+Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rir9TGv4Q3X5P6p9+l56unvegHDA2sK07JE8mSTAADAU1ZDt+pxUz+dvmVFvXVV+D
         Ubqzqr6Avl/MI+/rwIbbwj53fEClR6ZLXWQOBtd2AgiREx5xRDSFXMN3t+4W0yBXNq
         GDzGOcH61tyNX001tACMHh4SDPbqoIZ8LSqcsSmE=
Date:   Tue, 1 Jun 2021 02:24:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     pavel@ucw.cz, krzysztof.kozlowski@canonical.com,
        mchehab@kernel.org, paul.kocialkowski@bootlin.com, robh@kernel.org,
        shawnx.tu@intel.com, devicetree@vger.kernel.org, kernel@puri.sm,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: media: document SK Hynix Hi-846 MIPI
 CSI-2 8M pixel sensor
Message-ID: <YLVwR7X5xcgoxEAw@pendragon.ideasonboard.com>
References: <20210531120737.168496-1-martin.kepplinger@puri.sm>
 <20210531120737.168496-3-martin.kepplinger@puri.sm>
 <YLVtp/CWouSuEdty@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YLVtp/CWouSuEdty@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

I have now found the datasheet, thanks to the link provided in a later
patch in this series :-) Please see below for a few additional comments.

On Tue, Jun 01, 2021 at 02:13:43AM +0300, Laurent Pinchart wrote:
> On Mon, May 31, 2021 at 02:07:34PM +0200, Martin Kepplinger wrote:
> > Document the bindings used for the SK Hynix Hi-846 CMOS camera driver.
> > 
> > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > ---
> >  .../bindings/media/i2c/hynix,hi846.yaml       | 99 +++++++++++++++++++
> >  1 file changed, 99 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > new file mode 100644
> > index 000000000000..26462f6b5e69
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > @@ -0,0 +1,99 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/hynix,hi846.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SK Hynix Hi-846 1/4" 8M Pixel MIPI CSI-2 sensor
> > +
> > +maintainers:
> > +  - Martin Kepplinger <martin.kepplinger@puri.sm>
> > +
> > +description: |-
> > +  The Hi-846 is a raw image sensor with an MIPI CSI-2 image data
> > +  interface and CCI (I2C compatible) control bus. The output format
> > +  is 10bit Bayer.
> > +
> > +properties:
> > +  compatible:
> > +    const: hynix,hi846
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Reference to the mclk clock.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: mclk
> > +
> > +  reset-gpios:
> > +    description: Reference to the GPIO connected to the reset pin. Active low.

I'd write "RESETB pin" to match the datasheet.

Could you add a property for the XSHUTDOWN GPIO too ? You can name it
shutdown-gpios.

> > +    maxItems: 1
> > +
> > +  vdd-supply:
> > +    description: Definition of the regulator used as 1.8V digital power supply.

There's no VDD signal, and the only 1.8V supply is VDDIO, which can also
use 2.8V. This is thus ambiguous.

How are the different sensor power rails supplied on your board ?

> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    additionalProperties: false
> 
> You can drop the additionalProperties, the graph schema has
> unevaluatedProperties set to false already.
> 
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            oneOf:
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +                  - const: 3
> > +                  - const: 4
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +
> > +        required:
> > +          - data-lanes
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - reset-gpios
> 
> I'd keep the reset-gpios property optional, in case the signal is
> hardwired.
> 
> I don't have access to the sensor datasheet, so I can't provide comments
> on what may be missing. With the above two issues addressed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > +  - vdd-supply
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
> > +        hi846: camera@20 {
> > +            compatible = "hynix,hi846";
> > +            reg = <0x20>;
> > +            clocks = <&clk>;
> > +            clock-names = "mclk";
> > +            vdd-supply = <&reg_camera_pwr_en>; /* 1.8v */
> > +            reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
> > +
> > +            port {
> > +                camera_out: endpoint {
> > +                    remote-endpoint = <&csi1_ep1>;
> > +                    data-lanes = <1 2>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...

-- 
Regards,

Laurent Pinchart
