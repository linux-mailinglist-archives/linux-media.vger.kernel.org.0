Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 824611D0152
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 23:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731065AbgELVxk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 17:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728313AbgELVxk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 17:53:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B18C061A0C
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 14:53:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 406F051F;
        Tue, 12 May 2020 23:53:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589320418;
        bh=oOM/L3v90djYnAaRq3Rki0f+tZQQWFBRnMIKvj2h2EA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dDd5XvRK3GqnzCjuI0LnStnzi0A8EmTm6+RMbnxhDBJVvDZ3a8w1t9xejw4gdzUst
         IkjKFNd/Uytym38Et/XiTG66xqbVKjuL/JwEJ97Cs8/qz4fswnPoMEey6FeDTSaVzQ
         QacyCdUQVv5WCherZQbILfAQHyZ2LpKH+xxYY1IA=
Date:   Wed, 13 May 2020 00:53:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: media: i2c: Add MT9M114 camera
 sensor binding
Message-ID: <20200512215332.GG28527@pendragon.ideasonboard.com>
References: <20200511233456.9722-1-laurent.pinchart@ideasonboard.com>
 <20200512084551.GY867@valkosipuli.retiisi.org.uk>
 <20200512205812.GF28527@pendragon.ideasonboard.com>
 <20200512213114.GZ867@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200512213114.GZ867@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, May 13, 2020 at 12:31:14AM +0300, Sakari Ailus wrote:
> On Tue, May 12, 2020 at 11:58:12PM +0300, Laurent Pinchart wrote:
> > On Tue, May 12, 2020 at 11:45:51AM +0300, Sakari Ailus wrote:
> > > On Tue, May 12, 2020 at 02:34:55AM +0300, Laurent Pinchart wrote:
> > > > Add device tree binding for the ON Semiconductor MT9M114 CMOS camera
> > > > sensor.
> > > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > >  .../bindings/media/i2c/onnn,mt9m114.yaml      | 188 ++++++++++++++++++
> > > >  MAINTAINERS                                   |   7 +
> > > >  2 files changed, 195 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > > new file mode 100644
> > > > index 000000000000..2c3c691aacfd
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > > @@ -0,0 +1,188 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: ON Semiconductor 1/6-inch 720p CMOS Digital Image Sensor
> > > > +
> > > > +maintainers:
> > > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > +
> > > > +description: |-
> > > > +  The ON Semiconductor MT9M114 is a 1/6-inch 720p (1.26 Mp) CMOS digital image
> > > > +  sensor with an active pixel-array size of 1296H x 976V. It is programmable
> > > > +  through an I2C interface and outputs image data over a 8-bit parallel or
> > > > +  1-lane MIPI CSI-2 connection.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: onnn,mt9m114
> > > > +
> > > > +  reg:
> > > > +    description: I2C device address
> > > > +    enum:
> > > > +      - 0x48
> > > > +      - 0x5d
> > > > +
> > > > +  clocks:
> > > > +    description: EXTCLK clock signal
> > > > +    maxItems: 1
> > > > +
> > > > +  vdd-supply:
> > > > +    description:
> > > > +      Core digital voltage supply, 1.8V
> > > > +
> > > > +  vddio-supply:
> > > > +    description:
> > > > +      I/O digital voltage supply, 1.8V or 2.8V
> > > > +
> > > > +  vaa-supply:
> > > > +    description:
> > > > +      Analog voltage supply, 2.8V
> > > > +
> > > > +  reset-gpios:
> > > > +    description: |-
> > > > +      Reference to the GPIO connected to the RESET_BAR pin, if any (active
> > > > +      low).
> > > > +
> > > > +  # See ../video-interfaces.txt for more details
> > > > +  port:
> > > > +    type: object
> > > > +    properties:
> > > > +      endpoint:
> > > > +        type: object
> > > > +        properties:
> > > > +          bus-type:
> > > > +            enum: [4, 5, 6]
> > > > +
> > > > +          clock-lanes:
> > > > +            items:
> > > > +              - const: 0
> > > > +
> > > > +          data-lanes:
> > > > +            items:
> > > > +              - const: 1
> > > > +
> > > > +          bus-width:
> > > > +            items:
> > > > +              - const: 8
> > > > +
> > > > +          hsync-active:
> > > > +            items:
> > > > +              - const: 1
> > > > +
> > > > +          vsync-active:
> > > > +            items:
> > > > +              - const: 1
> > > 
> > > Is there anything to configure here with these properties apart from
> > > bus-type? If not, they should be omitted.
> > 
> > The bindings make those properties optional. Do you think that we
> > generally should require them not to be present when their value is
> > fixed ? This implies that the mt9m114 driver won't be able to parse them
> > (not that it would need any particular information anyway). It also
> > implies that, if the driver wants to call __v4l2_fwnode_endpoint_parse()
> > (indirectly as that's a static function), it will need to fill the flags
> > with the hardcoded values before calling the function. This however
> > conflicts with __v4l2_fwnode_endpoint_parse() zeroing vep->bus when the
> > bus type is unknown, and the bus type can't be hardcoded as there are
> > three options. The other option would be for the driver to fill the
> > flags after calling __v4l2_fwnode_endpoint_parse() if it wants to rely
> > on the contents of v4l2_fwnode_endpoint through the code, which could be
> > the best option.
> > 
> > And I've now read the documentation of
> > v4l2_fwnode_endpoint_alloc_parse():
> > 
> >  * This function parses the V4L2 fwnode endpoint specific parameters from the
> >  * firmware. The caller is responsible for assigning @vep.bus_type to a valid
> >  * media bus type. The caller may also set the default configuration for the
> >  * endpoint --- a configuration that shall be in line with the DT binding
> >  * documentation. Should a device support multiple bus types, the caller may
> >  * call this function once the correct type is found --- with a default
> >  * configuration valid for that type.
> >  *
> >  * As a compatibility means guessing the bus type is also supported by setting
> >  * @vep.bus_type to V4L2_MBUS_UNKNOWN. The caller may not provide a default
> >  * configuration in this case as the defaults are specific to a given bus type.
> >  * This functionality is deprecated and should not be used in new drivers and it
> >  * is only supported for CSI-2 D-PHY, parallel and Bt.656 buses.
> > 
> > If V4L2_MBUS_UNKNOWN is deprecated, what is the caller supposed to do
> > when multiple bus types are supported by the device ? I'm having a bit
> > of trouble figuring out how everything fits together.
> 
> As the defaults are specific to the bus type, the bus type must be
> specified with the defaults. See e.g. drivers/media/platform/omap3isp/isp.c
> for an example --- it parses ports that may be configured to use CSI1, CCP2
> or CSI-2 D-PHY. v4l2_fwnode_endpoint_parse() returns -ENXIO if it
> encounters a bus type that does not match with what was expected.

But how about a sensor driver that can support multiple bus types on the
same port ? Will it have to call v4l2_fwnode_endpoint_alloc_parse() for
each possible bus type until one of the calls succeed ?

> This change made it both possible to have defaults for parameters as well
> as avoided having to have useless DT properties just to push the endpoint
> parser to the right direction.

-- 
Regards,

Laurent Pinchart
