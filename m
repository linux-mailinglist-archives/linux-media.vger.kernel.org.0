Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2664D967B
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 09:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240409AbiCOImd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 04:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235554AbiCOImc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 04:42:32 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805344CD5E;
        Tue, 15 Mar 2022 01:41:20 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id E28CEE0015;
        Tue, 15 Mar 2022 08:41:14 +0000 (UTC)
Date:   Tue, 15 Mar 2022 09:41:13 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/8] media: dt-bindings: i2c: Document ov5670
Message-ID: <20220315084113.lwtmhy335jbqdll2@uno.localdomain>
References: <20220314162714.153970-1-jacopo@jmondi.org>
 <20220314162714.153970-2-jacopo@jmondi.org>
 <ba09e048-d619-5bd2-e6c3-da071a6d2ab6@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ba09e048-d619-5bd2-e6c3-da071a6d2ab6@canonical.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Tue, Mar 15, 2022 at 08:32:58AM +0100, Krzysztof Kozlowski wrote:
> On 14/03/2022 17:27, Jacopo Mondi wrote:
> > Provide the bindings documentation for Omnivision OV5670 image sensor.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >
> > ---
> > v1->v2 (comments from Krzysztof)
> >
> > - Rename to include manufacturer name
> > - Add entry to MAINTAINERS
> > - Add maxItems: to -gpios properties
> > - Use common clock properties
> > - Use enum: [1, 2] for data lanes
> > - Fix whitespace issue in example
> > ---
> >
> >  .../bindings/media/i2c/ovti,ov5670.yaml       | 99 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 100 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> > new file mode 100644
> > index 000000000000..73cf72203f17
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> > @@ -0,0 +1,99 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5670.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Omnivision OV5670 5 Megapixels raw image sensor
> > +
> > +maintainers:
> > +  - Jacopo Mondi <jacopo@jmondi.org>
> > +
> > +description: |-
> > +  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
> > +  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
> > +  controlled through an I2C compatible control bus.
> > +
> > +properties:
> > +  compatible:
> > +    const: ovti,ov5670
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  assigned-clocks: true
> > +  assigned-clock-parents: true
> > +  assigned-clock-rates: true
>
> You should not need these. These are coming with schema. You can add
> these to example schema below and double-check.
>

Thanks, I'll try removing and see how it works

> > +
> > +  clocks:
> > +    description: System clock. From 6 to 27 MHz.
> > +    maxItems: 1
> > +
> > +  pwdn-gpios:
> > +    description: Reference to the GPIO connected to the PWDNB pin. Active low.
>
> This does not look like a standard property, so you need a vendor prefix.
>

$ git grep powerdown-gpio arch/arm*/boot/dts | wc -l
48

$ git grep pwdn-gpio arch/arm*/boot/dts | wc -l
5

I'll go with the majority.

I wonder however if 'standard' proeprties are documented somewhere.

Thanks
  j


> > +    maxItems: 1
> > +
>
> Best regards,
> Krzysztof
