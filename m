Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0C94D9BB7
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 14:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239755AbiCONDH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 09:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234583AbiCONDH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 09:03:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9EA42B24B;
        Tue, 15 Mar 2022 06:01:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 974DA1BBB;
        Tue, 15 Mar 2022 14:01:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647349312;
        bh=ioi1BuJwoUIJaDqmBXxNMAk5Q/Eg7oI7DoPOBMJp10U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PIgtItNZHzXqkuaaJpRrVg9VIExIuE/m5c3wPj9e2zcLFAy0dRALUFa9DTCulwBW4
         knPwBev0+C18r7ZQ4sswwe+E/Uafo+yGa8suAy4yoXEQOtEkdkRkGFF77DwdJ8UVai
         wXSNJ8Ilo9mIFesJvxuMWNdjpmD+AXOeX470a3ns=
Date:   Tue, 15 Mar 2022 15:01:35 +0200
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
Message-ID: <YjCOL2H33oc2pOWN@pendragon.ideasonboard.com>
References: <20220314162714.153970-1-jacopo@jmondi.org>
 <20220314162714.153970-2-jacopo@jmondi.org>
 <ba09e048-d619-5bd2-e6c3-da071a6d2ab6@canonical.com>
 <YjBHVY/clnMUlNFj@valkosipuli.retiisi.eu>
 <58745ae2-40be-65f6-bea6-f62d8935719f@canonical.com>
 <YjCK75F7Xmiy8nGF@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YjCK75F7Xmiy8nGF@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Mar 15, 2022 at 02:47:43PM +0200, Sakari Ailus wrote:
> On Tue, Mar 15, 2022 at 09:03:41AM +0100, Krzysztof Kozlowski wrote:
> > On 15/03/2022 08:59, Sakari Ailus wrote:
> > > On Tue, Mar 15, 2022 at 08:32:58AM +0100, Krzysztof Kozlowski wrote:
> > >> On 14/03/2022 17:27, Jacopo Mondi wrote:
> > >>> Provide the bindings documentation for Omnivision OV5670 image sensor.
> > >>>
> > >>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > >>>
> > >>> ---
> > >>> v1->v2 (comments from Krzysztof)
> > >>>
> > >>> - Rename to include manufacturer name
> > >>> - Add entry to MAINTAINERS
> > >>> - Add maxItems: to -gpios properties
> > >>> - Use common clock properties
> > >>> - Use enum: [1, 2] for data lanes
> > >>> - Fix whitespace issue in example
> > >>> ---
> > >>>
> > >>>  .../bindings/media/i2c/ovti,ov5670.yaml       | 99 +++++++++++++++++++
> > >>>  MAINTAINERS                                   |  1 +
> > >>>  2 files changed, 100 insertions(+)
> > >>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> > >>> new file mode 100644
> > >>> index 000000000000..73cf72203f17
> > >>> --- /dev/null
> > >>> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> > >>> @@ -0,0 +1,99 @@
> > >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > >>> +%YAML 1.2
> > >>> +---
> > >>> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5670.yaml#
> > >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >>> +
> > >>> +title: Omnivision OV5670 5 Megapixels raw image sensor
> > >>> +
> > >>> +maintainers:
> > >>> +  - Jacopo Mondi <jacopo@jmondi.org>
> > >>> +
> > >>> +description: |-
> > >>> +  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
> > >>> +  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
> > >>> +  controlled through an I2C compatible control bus.
> > >>> +
> > >>> +properties:
> > >>> +  compatible:
> > >>> +    const: ovti,ov5670
> > >>> +
> > >>> +  reg:
> > >>> +    maxItems: 1
> > >>> +
> > >>> +  assigned-clocks: true
> > >>> +  assigned-clock-parents: true
> > >>> +  assigned-clock-rates: true
> > >>
> > >> You should not need these. These are coming with schema. You can add
> > >> these to example schema below and double-check.
> > > 
> > > They should probably be required actually.
> > 
> > Why required? The hardware can work with different clocks, get their
> > rate and configure internal PLLs/clocks to new value. Having it required
> > might have sense for current implementation of driver but this is
> > independent of bindings. Bindings do not describe driver, but hardware.
> 
> We've had this discussion before and the result of that was this (see
> "Handling clocks"):
> 
> Documentation/driver-api/media/camera-sensor.rst

I don't think those properties should be required in the sensor
bindings. There are platforms where the clock provided to the sensor
comes from a fixed-frequency oscillator, assigning a rate or parent
makes no sense for those (assigning a parent would actually be
impossible).

Assigning a parent or rate is fine when applicable, but as it can't be
required, there's also no point in listing the properties here.

> > >>> +
> > >>> +  clocks:
> > >>> +    description: System clock. From 6 to 27 MHz.
> > >>> +    maxItems: 1
> > >>> +
> > >>> +  pwdn-gpios:
> > >>> +    description: Reference to the GPIO connected to the PWDNB pin. Active low.
> > >>
> > >> This does not look like a standard property, so you need a vendor prefix.
> > > 
> > > The similarly named property exists elsewhere. I wouldn't use a vendor
> > > prefix, also for the reason that the functionality is quite common. I guess
> > > alternative name would be possible, too --- "shutdown" seems to be more
> > > common.
> > 
> > It exists in three bindings, so it is not a standard property...
> > although something closer to standard is "powerdown-gpios" so maybe just
> > use that one?
> 
> Seems like a better choice.

-- 
Regards,

Laurent Pinchart
