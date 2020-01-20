Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E736F1429D3
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2020 12:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgATLsz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jan 2020 06:48:55 -0500
Received: from retiisi.org.uk ([95.216.213.190]:53796 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726642AbgATLsz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jan 2020 06:48:55 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id A0B84634C86;
        Mon, 20 Jan 2020 13:48:42 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1itVXu-0000XL-KJ; Mon, 20 Jan 2020 13:48:42 +0200
Date:   Mon, 20 Jan 2020 13:48:42 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        peter.griffin@linaro.org, dave.stevenson@raspberrypi.com,
        ezequiel@collabora.com
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add IMX219 CMOS sensor
 binding
Message-ID: <20200120114842.GF856@valkosipuli.retiisi.org.uk>
References: <20200120081558.25258-1-andrey.konovalov@linaro.org>
 <20200120081558.25258-2-andrey.konovalov@linaro.org>
 <c3c8c2a7-d21a-6e2d-f4ec-e62cfac1d5d6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3c8c2a7-d21a-6e2d-f4ec-e62cfac1d5d6@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

On Mon, Jan 20, 2020 at 02:32:16PM +0300, Andrey Konovalov wrote:
> v3 of this patch got "Reviewed-by" from Rob Herring.
> But unfortunately, as one more property had to be added afterwards, my understanding
> is that that "Reviewed-by" doesn't apply to v4.

I assumed that Rob's Reviewed-by: applies also to v4 as adding the link
frequency is a small change, and also because the link-frequency property
is also present in pretty much all other recently added camera sensor DT
bindings (apart from the one that only supports a single frequency).

> 
> Thanks,
> Andrey
> 
> On 20.01.2020 11:15, Andrey Konovalov wrote:
> > Add YAML device tree binding for IMX219 CMOS image sensor, and
> > the relevant MAINTAINERS entries.
> > 
> > Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> > ---
> >   .../devicetree/bindings/media/i2c/imx219.yaml | 114 ++++++++++++++++++
> >   MAINTAINERS                                   |   8 ++
> >   2 files changed, 122 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > new file mode 100644
> > index 000000000000..32d6b693274f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > @@ -0,0 +1,114 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
> > +
> > +maintainers:
> > +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> > +
> > +description: |-
> > +  The Sony imx219 is a 1/4.0-inch CMOS active pixel digital image sensor
> > +  with an active array size of 3280H x 2464V. It is programmable through
> > +  I2C interface. The I2C address is fixed to 0x10 as per sensor data sheet.
> > +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> > +  4 data lanes.
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx219
> > +
> > +  reg:
> > +    description: I2C device address
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  VDIG-supply:
> > +    description:
> > +      Digital I/O voltage supply, 1.8 volts
> > +
> > +  VANA-supply:
> > +    description:
> > +      Analog voltage supply, 2.8 volts
> > +
> > +  VDDL-supply:
> > +    description:
> > +      Digital core voltage supply, 1.2 volts
> > +
> > +  reset-gpios:
> > +    description: |-
> > +      Reference to the GPIO connected to the xclr pin, if any.
> > +      Must be released (set high) after all supplies are applied.
> > +
> > +  # See ../video-interfaces.txt for more details
> > +  port:
> > +    type: object
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +        properties:
> > +          data-lanes:
> > +            description: |-
> > +              The sensor supports either two-lane, or four-lane operation.
> > +              If this property is omitted four-lane operation is assumed.
> > +              For two-lane operation the property must be set to <1 2>.
> > +            items:
> > +              - const: 1
> > +              - const: 2
> > +
> > +          clock-noncontinuous:
> > +            type: boolean
> > +            description: |-
> > +              MIPI CSI-2 clock is non-continuous if this property is present,
> > +              otherwise it's continuous.
> > +
> > +          link-frequencies:
> > +            allOf:
> > +              - $ref: /schemas/types.yaml#/definitions/uint64-array
> > +            description:
> > +              Allowed data bus frequencies.
> > +
> > +        required:
> > +          - link-frequencies
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - VANA-supply
> > +  - VDIG-supply
> > +  - VDDL-supply
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c0 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        imx219: sensor@10 {
> > +            compatible = "sony,imx219";
> > +            reg = <0x10>;
> > +            clocks = <&imx219_clk>;
> > +            VANA-supply = <&imx219_vana>;   /* 2.8v */
> > +            VDIG-supply = <&imx219_vdig>;   /* 1.8v */
> > +            VDDL-supply = <&imx219_vddl>;   /* 1.2v */
> > +
> > +            port {
> > +                imx219_0: endpoint {
> > +                    remote-endpoint = <&csi1_ep>;
> > +                    data-lanes = <1 2>;
> > +                    clock-noncontinuous;
> > +                    link-frequencies = /bits/ 64 <456000000>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cf6ccca6e61c..aae83699e146 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15351,6 +15351,14 @@ S:	Maintained
> >   F:	drivers/media/i2c/imx214.c
> >   F:	Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
> > +SONY IMX219 SENSOR DRIVER
> > +M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
> > +L:	linux-media@vger.kernel.org
> > +T:	git git://linuxtv.org/media_tree.git
> > +S:	Maintained
> > +F:	drivers/media/i2c/imx219.c
> > +F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > +
> >   SONY IMX258 SENSOR DRIVER
> >   M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> >   L:	linux-media@vger.kernel.org
> > 

-- 
Regards,

Sakari Ailus
