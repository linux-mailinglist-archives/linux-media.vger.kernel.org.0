Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A32F2C5E0C
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 00:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388266AbgKZXFR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 18:05:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730159AbgKZXFR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 18:05:17 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA76FC0613D4;
        Thu, 26 Nov 2020 15:05:16 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4DA93634C24;
        Fri, 27 Nov 2020 01:04:29 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kiQJR-0001vW-OP; Fri, 27 Nov 2020 01:04:29 +0200
Date:   Fri, 27 Nov 2020 01:04:29 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Rob Herring <robh@kernel.org>
Cc:     kholk11@gmail.com, mchehab@kernel.org, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add IMX300 CMOS
 sensor binding
Message-ID: <20201126230429.GG4351@valkosipuli.retiisi.org.uk>
References: <20201029172947.34315-1-kholk11@gmail.com>
 <20201029172947.34315-3-kholk11@gmail.com>
 <20201104214806.GA4175708@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104214806.GA4175708@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob, AngeloGioacchino,

On Wed, Nov 04, 2020 at 03:48:06PM -0600, Rob Herring wrote:
> On Thu, Oct 29, 2020 at 06:29:47PM +0100, kholk11@gmail.com wrote:
> > From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > 
> > Add YAML device tree binding for IMX300 CMOS image sensor, and
> > the relevant MAINTAINERS entries.
> > 
> > Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > ---
> >  .../bindings/media/i2c/sony,imx300.yaml       | 112 ++++++++++++++++++
> >  MAINTAINERS                                   |   7 ++
> >  2 files changed, 119 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> > new file mode 100644
> > index 000000000000..8f1d795f8072
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> > @@ -0,0 +1,112 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/sony,imx300.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony 1/2.3-Inch 8Mpixel Stacked CMOS Digital Image Sensor
> > +
> > +maintainers:
> > +  - AngeloGioacchino Del Regno <kholk11@gmail.com>
> > +
> > +description: |-
> > +  The Sony IMX300 is a 1/2.3-inch Stacked CMOS (Exmor-RS) digital image
> > +  sensor with a pixel size of 1.08um and an active array size of
> > +  5948H x 4140V. It is programmable through I2C interface at address 0x10.
> > +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> > +  4 data lanes.
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx300
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1

The frequency needs to come from DT; it's not a property of the sensor.

> > +
> > +  vdig-supply:
> > +    description:
> > +      Digital I/O voltage supply, 1.15-1.20 volts
> > +
> > +  vana-supply:
> > +    description:
> > +      Analog voltage supply, 2.2 volts
> > +
> > +  vddl-supply:
> > +    description:
> > +      Digital core voltage supply, 1.8 volts
> > +
> > +  reset-gpios:
> 
> maxItems: 1
> 
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
> > +
> > +        properties:
> > +          data-lanes:
> > +            description: |-
> > +              The sensor supports either two-lane, or four-lane operation,
> > +              but the driver currently supports only four-lane.
> 
> What the driver is not relevant. Please define all possible 
> configurations. Or just omit? What's the behavior if omitted?

I think we've used to specify the number of lanes if it's configurable,
instead of having defaults. I'd do the same here, i.e. require data-lanes.

> 
> > +            items:
> > +              - const: 0
> > +              - const: 1
> > +              - const: 2
> > +              - const: 3

-- 
Kind regards,

Sakari Ailus
