Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A685A12CE35
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2019 10:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727290AbfL3JZT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Dec 2019 04:25:19 -0500
Received: from retiisi.org.uk ([95.216.213.190]:43510 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727243AbfL3JZT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Dec 2019 04:25:19 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 662DD634C86;
        Mon, 30 Dec 2019 11:24:30 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1ilrHq-0001XR-LZ; Mon, 30 Dec 2019 11:24:30 +0200
Date:   Mon, 30 Dec 2019 11:24:30 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        peter.griffin@linaro.org, ezequiel@collabora.com
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX219 CMOS sensor
 binding
Message-ID: <20191230092430.GB5050@valkosipuli.retiisi.org.uk>
References: <20191227122114.23075-1-andrey.konovalov@linaro.org>
 <20191227122114.23075-2-andrey.konovalov@linaro.org>
 <20191227141739.GD861@valkosipuli.retiisi.org.uk>
 <e3a9161a-feaf-f4a4-5122-871e68409698@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3a9161a-feaf-f4a4-5122-871e68409698@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

On Fri, Dec 27, 2019 at 09:26:25PM +0300, Andrey Konovalov wrote:
> Hi Sakari,
> 
> Thank you for reviewing the patchset, and for the pointers on improving the driver (nokia,smia.txt etc)!
> I'll write a separate email later, or just fix what you suggested in v3 (I agree with the proposed changes
> I didn't comment on in this email).

Ack.

Please wrap the lines around 72 chars or so.

> 
> Just few quick answers below.
> 
> Thanks,
> Andrey
> 
> On 27.12.2019 17:17, Sakari Ailus wrote:
> > Hi Andrey,
> > 
> > Thanks for the patchset.
> > 
> > On Fri, Dec 27, 2019 at 03:21:13PM +0300, Andrey Konovalov wrote:
> > > Add YAML device tree binding for IMX219 CMOS image sensor, and
> > > the relevant MAINTAINERS entries.
> > > 
> > > Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> > > ---
> > >   .../devicetree/bindings/media/i2c/imx219.yaml | 134 ++++++++++++++++++
> > >   MAINTAINERS                                   |   8 ++
> > >   2 files changed, 142 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > > new file mode 100644
> > > index 000000000000..b58aa49a7c03
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > > @@ -0,0 +1,134 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
> > > +
> > > +maintainers:
> > > +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > +
> > > +description: |-
> > > +  The Sony imx219 is a 1/4.0-inch CMOS active pixel digital image sensor
> > > +  with an active array size of 3280H x 2464V. It is programmable through
> > > +  I2C interface. The I2C address is fixed to 0x10 as per sensor data sheet.
> > > +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> > > +  4 data lanes.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: sony,imx219
> > > +
> > > +  reg:
> > > +    description: I2C device address
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: xclk
> > 
> > There's a single clock. Does it need a name? I'd just omit it.
> > 
> > > +
> > > +  VDIG-supply:
> > > +    description:
> > > +      Digital I/O voltage supply, 1.8 volts
> > > +
> > > +  VANA-supply:
> > > +    description:
> > > +      Analog voltage supply, 2.8 volts
> > > +
> > > +  VDDL-supply:
> > > +    description:
> > > +      Digital core voltage supply, 1.2 volts
> > > +
> > > +  xclr-gpios:
> > > +    description: |-
> > > +      Reference to the GPIO connected to the xclr pin, if any.
> > > +      Must be released (set high) after all supplies are applied.
> > 
> > A common name for this in camera sensors is xshutdown. I'd suggest to use
> > that.
> 
> Indeed, "xshutdown" is the pin name commonly used by OmniVision for their sensors.

Some Aptina (OnSemi) devices also use xshutdown, and so does the CCS
standard.

> (In older sensors they used "pwdn" which is similar, but the polarity is reversed.)

Some devices have both xshutdown and pwdn. I don't see why; they're
controlled together in practice anyway.

> 
> In their sensor datasheets Sony consistently use "xclr" for the pin and signal otherwise
> very similar to OmniVision's "xshutdown".
> 
> Wouldn't using the signal name from the sensor by the different vendor just add more confusion
> instead?

What matters is the functionality really. I checked the existing bindings,
and it seems devices using "xshutdown" document reset-gpios property under
Documentation/devicetree/bindings/media/i2c . None refers to xclr.

So "reset-gpios" is the right name. The vast majority are active low (i.e.
lifting the sensor from reset requires high output) but there's at least
one that is active high. 

> 
> > > +
> > > +  camera-clk:
> > > +    type: object
> > > +
> > > +    description: Clock source for imx219
> > > +
> > > +    properties:
> > > +      clock-frequency: true
> > > +
> > > +    required:
> > > +      - clock-frequency
> > 
> > Hmm. The driver doesn't seem to use this for anything.
> > 
> > There are two approaches to this; either you can get and check the
> > frequency, or specify it in DT bindings, set and then check it.
> > 
> > See e.g. Documentation/devicetree/bindings/media/i2c/nokia,smia.txt (not in
> > YAML though).
> > 
> > > +
> > > +  # See ../video-interfaces.txt for more details
> > > +  port:
> > > +    type: object
> > > +    properties:
> > > +      endpoint:
> > > +        type: object
> > > +        properties:
> > > +          clock-lanes:
> > > +            const: 0
> > 
> > If the hardware does not support lane reordering, you can omit the
> > clock-lanes property as it provides no information.
> > 
> > > +
> > > +          data-lanes:
> > > +            description: |-
> > > +              Should be <1 2> for two-lane operation, or <1 2 3 4> for
> > > +              four-lane operation.
> > > +            oneOf:
> > > +              - const: [[ 1, 2 ]]
> > > +              - const: [[ 1, 2, 3, 4 ]]
> > > +
> > > +          clock-noncontinuous:
> > > +            type: boolean
> > > +            description: |-
> > > +              Presence of this boolean property decides whether the MIPI CSI-2
> > > +              clock is continuous or non-continuous.
> > 
> > How about: MIPI CSI-2 clock will be non-continuous if this property is
> > present, otherwise it's continuous.
> 
> This statement is more clear than the original. Thanks!

Perhaps:

s/will be/is/

In order to keep the same tense.

-- 
Kind regards,

Sakari Ailus
