Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B91092A78BF
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 09:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgKEIUA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 03:20:00 -0500
Received: from mga14.intel.com ([192.55.52.115]:37310 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgKEIUA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 03:20:00 -0500
IronPort-SDR: Gkf9i6Qx5/8f8E4KhF4tHx+9cHxERrc1T+dSjwuQ0aMnfa8epV7qxsqvhkJ5r2JamXYP+ZiXNE
 mgvLotcF0Pug==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="168563474"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="168563474"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 00:19:59 -0800
IronPort-SDR: O/o1cnDJQWHLK+3wesbrRUnUKklIQLUUX4s/ZXWpEXNmcKcSloDJmB6FLY9bcKwwjTKrSSrF7B
 tizqufv3+rdw==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="321118743"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 00:19:56 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2AE2920901; Thu,  5 Nov 2020 10:19:54 +0200 (EET)
Date:   Thu, 5 Nov 2020 10:19:54 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Maxime Ripard <mripard@kernel.org>, kevin.lhopital@hotmail.com,
        =?iso-8859-1?Q?K=E9vin_L'h=F4pital?= <kevin.lhopital@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: Add OV8865 bindings
 documentation
Message-ID: <20201105081954.GX26150@paasikivi.fi.intel.com>
References: <20201023175406.504527-1-paul.kocialkowski@bootlin.com>
 <20201023175406.504527-2-paul.kocialkowski@bootlin.com>
 <20201102232411.GD26150@paasikivi.fi.intel.com>
 <20201104102643.GH2123@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201104102643.GH2123@aptenodytes>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Wed, Nov 04, 2020 at 11:26:43AM +0100, Paul Kocialkowski wrote:
> Hi Sakari and thanks for the review!
> 
> On Tue 03 Nov 20, 01:24, Sakari Ailus wrote:
> > On Fri, Oct 23, 2020 at 07:54:04PM +0200, Paul Kocialkowski wrote:
> > > This introduces YAML bindings documentation for the OV8865
> > > image sensor.
> > > 
> > > Co-developed-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> > > Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > >  .../bindings/media/i2c/ovti,ov8865.yaml       | 124 ++++++++++++++++++
> > >  1 file changed, 124 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> > > new file mode 100644
> > > index 000000000000..807f1a94afae
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> > > @@ -0,0 +1,124 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov8865.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: OmniVision OV8865 Image Sensor Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ovti,ov8865
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: EXTCLK Clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: extclk
> > 
> > Is this needed with a single clock?
> 
> Yes I think so: we grab the clock with devm_clk_get which takes a name string
> that matches the clock-names property.

That argument may be NULL.

> 
> > And... shouldn't this also come with assigned-clock-rates etc., to set the
> > clock frequency?
> 
> I'm a bit confused why we would need to do that in the device-tree rather than
> setting the clock rate with clk_set_rate in the driver, like any other driver
> does. I think this was discussed before (on the initial ov8865 series) and the
> conclusion was that there is no particular reason for media i2c drivers to
> behave differently. So I believe this is the correct approach.

I'm not exactly sure about that conclusion.

You can use clk_set_rate() if you get the frequency from DT, but we
recently did conclude that camera sensor drivers can expect to get the
frequency indicated by assigned-clock-rate property.

In other words, the driver may not be specific to a particular board and
SoC you have.

Please also read Documentation/driver-api/media/camera-sensor.rst .

> 
> > > +
> > > +  dvdd-supply:
> > > +    description: Digital Domain Power Supply
> > > +
> > > +  avdd-supply:
> > > +    description: Analog Domain Power Supply (internal AVDD is used if missing)
> > > +
> > > +  dovdd-supply:
> > > +    description: I/O Domain Power Supply
> > > +
> > > +  powerdown-gpios:
> > > +    maxItems: 1
> > > +    description: Power Down Pin GPIO Control (active low)
> > > +
> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +    description: Reset Pin GPIO Control (active low)
> > > +
> > > +  port:
> > > +    type: object
> > > +    description: Input port, connect to a MIPI CSI-2 receiver
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        type: object
> > > +
> > > +        properties:
> > > +          remote-endpoint: true
> > > +
> > > +          bus-type:
> > > +            const: 4
> > > +
> > > +          clock-lanes:
> > > +            maxItems: 1
> > 
> > I believe you can drop clock-lanes and bus-type; these are both constants.
> 
> I don't understand why bus-type should be dropped because it is constant:
> if bus-type is set to something else, the driver will definitely not probe
> since we're requesting V4L2_MBUS_CSI2_DPHY for v4l2_fwnode_endpoint_parse.
> So I think it's quite important for the bindings to reflect this.

This driver is for a particular device that has MIPI CSI-2 on D-PHY as the
data bus. You can assume that in the driver.

> 
> > I presume the device does not support lane remapping?
> 
> That's correct so this is indeed not something we can configure.
> But shouldn't we instead specift clock-lanes = <0> as a const rather than
> getting rid of it?

Why would you put redundant information to DT?

> 
> > Could you also add link-frequencies, to list which frequencies are known to
> > be good?
> 
> Ah right, I had missed it. I'm a bit unsure about what I should do with the
> information from the driver though: should I refuse to use link frequencies that
> are not in the list?

Yes, please.

-- 
Regards,

Sakari Ailus
