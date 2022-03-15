Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADC34D95ED
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 09:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242150AbiCOILJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 04:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238106AbiCOILH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 04:11:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60024AE14;
        Tue, 15 Mar 2022 01:09:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC858EE;
        Tue, 15 Mar 2022 09:09:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647331793;
        bh=ktA+T7Yl213BEdxlNiMwQRMAYnAC1RO/yA3ttvHOQVY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IUoQJA8G2owulc1O7vOP99Yp6ey9PaSEBvLG85G/bmdhTncD496AwoqTGAoD4c55h
         M8CVOLoIOieB4JIF3NBypxVsHsolAkM9gvE4RAQe43+vV9VSGyBNkwgNyn1Ae+eSlq
         8kkGUjHMukS9kDEsgqpTrztOaUMueBXDA0GB4pYY=
Date:   Tue, 15 Mar 2022 10:09:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/8] media: dt-bindings: i2c: Document ov5670
Message-ID: <YjBJwDQSQh4ZyY+T@pendragon.ideasonboard.com>
References: <20220314162714.153970-1-jacopo@jmondi.org>
 <20220314162714.153970-2-jacopo@jmondi.org>
 <ba09e048-d619-5bd2-e6c3-da071a6d2ab6@canonical.com>
 <YjBHVY/clnMUlNFj@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YjBHVY/clnMUlNFj@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Mar 15, 2022 at 09:59:17AM +0200, Sakari Ailus wrote:
> On Tue, Mar 15, 2022 at 08:32:58AM +0100, Krzysztof Kozlowski wrote:
> > On 14/03/2022 17:27, Jacopo Mondi wrote:
> > > Provide the bindings documentation for Omnivision OV5670 image sensor.
> > > 
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > 
> > > ---
> > > v1->v2 (comments from Krzysztof)
> > > 
> > > - Rename to include manufacturer name
> > > - Add entry to MAINTAINERS
> > > - Add maxItems: to -gpios properties
> > > - Use common clock properties
> > > - Use enum: [1, 2] for data lanes
> > > - Fix whitespace issue in example
> > > ---
> > > 
> > >  .../bindings/media/i2c/ovti,ov5670.yaml       | 99 +++++++++++++++++++
> > >  MAINTAINERS                                   |  1 +
> > >  2 files changed, 100 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> > > new file mode 100644
> > > index 000000000000..73cf72203f17
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> > > @@ -0,0 +1,99 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5670.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Omnivision OV5670 5 Megapixels raw image sensor
> > > +
> > > +maintainers:
> > > +  - Jacopo Mondi <jacopo@jmondi.org>
> > > +
> > > +description: |-
> > > +  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
> > > +  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
> > > +  controlled through an I2C compatible control bus.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ovti,ov5670
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  assigned-clocks: true
> > > +  assigned-clock-parents: true
> > > +  assigned-clock-rates: true
> > 
> > You should not need these. These are coming with schema. You can add
> > these to example schema below and double-check.
> 
> They should probably be required actually.

Why so ?

> > > +
> > > +  clocks:
> > > +    description: System clock. From 6 to 27 MHz.
> > > +    maxItems: 1
> > > +
> > > +  pwdn-gpios:
> > > +    description: Reference to the GPIO connected to the PWDNB pin. Active low.
> > 
> > This does not look like a standard property, so you need a vendor prefix.
> 
> The similarly named property exists elsewhere. I wouldn't use a vendor
> prefix, also for the reason that the functionality is quite common. I guess
> alternative name would be possible, too --- "shutdown" seems to be more
> common.

There's a desire to standardize GPIO names ("reset" and "enable" being
the two most common candidates), but I'm not aware of an official list
of standard names. Have I missed it ?

In this case, I'd use powerdown-gpios, as it's more common than
pwdn-gpios (used in 21 bindings, compared to 2 for pwdn-gpios).

-- 
Regards,

Laurent Pinchart
