Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E263660FE9
	for <lists+linux-media@lfdr.de>; Sat,  7 Jan 2023 16:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbjAGPSe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Jan 2023 10:18:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232413AbjAGPSb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Jan 2023 10:18:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F5018E11;
        Sat,  7 Jan 2023 07:18:30 -0800 (PST)
Received: from ideasonboard.com (mob-5-90-140-117.net.vodafone.it [5.90.140.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A39EE4AE;
        Sat,  7 Jan 2023 16:18:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673104708;
        bh=xPkrDKS9MasNTbhbaDaeSR63/UT2eJ5bZ6VEGEdb74I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N7EYY4cfBZL2vptes9/VzIunlh4FeCUpXU3F+50PR5tNZKYd1lqgyaMfa7zND9p2G
         sffHi+MYj93FSXx3KtK3yqz25XgOxU8BvLovnTKcwaFxHOfyPrqQkUTRpZveKQhz9U
         xn0T4TYLKx/UOFCxBdqEqr9hI77y7aKF91l1QGXk=
Date:   Sat, 7 Jan 2023 16:18:25 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Nicholas Roth <nicholas@rothemail.net>,
        Robert Mader <robert.mader@collabora.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: Add OmniVision OV8858
Message-ID: <20230107151825.6quaenebql3bnjv5@uno.localdomain>
References: <20230106203909.184073-1-jacopo@jmondi.org>
 <20230106203909.184073-2-jacopo@jmondi.org>
 <4f1e55bc-9f0b-6411-2957-e68a049f1d6b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4f1e55bc-9f0b-6411-2957-e68a049f1d6b@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof

On Sat, Jan 07, 2023 at 02:09:54PM +0100, Krzysztof Kozlowski wrote:
> On 06/01/2023 21:39, Jacopo Mondi wrote:
> > From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > Add binding schema for the OmniVision OV8858 8 Megapixels camera sensor.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../bindings/media/i2c/ovti,ov8858.yaml       | 105 ++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
> > new file mode 100644
> > index 000000000000..002461a974f8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov8858.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: OmniVision OV8858 Image Sensor
> > +
> > +maintainers:
> > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > +  - Nicholas Roth <nicholas@rothemail.net>
> > +
> > +description: |
> > +  The OmniVision OV8858 is a color CMOS 8 Megapixels (3264x2448) image sensor
> > +  controlled through an I2C-compatible SCCB bus. The sensor transmits images
> > +  on a MIPI CSI-2 output interface with up to 4 data lanes.
> > +
> > +properties:
> > +  compatible:
> > +    const: ovti,ov8858
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: XVCLK external clock
> > +
> > +  clock-names:
> > +    const: xvclk
> > +
> > +  dvdd-supply:
> > +    description: Digital Domain Power Supply
> > +
> > +  avdd-supply:
> > +    description: Analog Domain Power Supply
> > +
> > +  dovdd-supply:
> > +    description: I/O Domain Power Supply
> > +
> > +  powerdown-gpios:
> > +    description: PWDNB powerdown GPIO (active low)
> > +
> > +  reset-gpios:
> > +    description: XSHUTDN reset GPIO (active low)
>
> Here you need maxItems. I did not propose to remove it here.
>

I'm wondering why you can have multiple resets but not multiple
powerdowns.

Anyway, how is one supposed to know when maxItems is required or not,
where should I look ?

Thanks
   j

>
> Best regards,
> Krzysztof
>
