Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 593582B87D0
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 23:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgKRWiY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 17:38:24 -0500
Received: from mga05.intel.com ([192.55.52.43]:63166 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726184AbgKRWiX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 17:38:23 -0500
IronPort-SDR: UQ2hG9QpQ35MdOqQqWCsZBP+xNl7o0uG+pcxmfTjKQksmFuuUSBfIkj/RkYKjLRJC2PQ7EcQrq
 SUXbzVSECLfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="255908289"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="255908289"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 14:38:22 -0800
IronPort-SDR: NlEO+jFuWzs5JUBFJNWgGsUKNQ4SZm+Ynzb/XiErNgzV08DUyPyAc1BHHeV+JgcpOlXqT90tJE
 COyGvBYF4Hqg==
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="431037518"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 14:38:18 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 726E9207BF; Thu, 19 Nov 2020 00:38:16 +0200 (EET)
Date:   Thu, 19 Nov 2020 00:38:16 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com,
        =?iso-8859-1?Q?K=E9vin_L'h=F4pital?= <kevin.lhopital@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: Add OV8865 bindings
 documentation
Message-ID: <20201118223816.GS3940@paasikivi.fi.intel.com>
References: <20201023175406.504527-1-paul.kocialkowski@bootlin.com>
 <20201023175406.504527-2-paul.kocialkowski@bootlin.com>
 <20201102232411.GD26150@paasikivi.fi.intel.com>
 <20201104102643.GH2123@aptenodytes>
 <20201105081954.GX26150@paasikivi.fi.intel.com>
 <20201105153534.GD615923@aptenodytes>
 <20201111131857.GC26150@paasikivi.fi.intel.com>
 <20201113172735.mkgyrrobgxa33uo3@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201113172735.mkgyrrobgxa33uo3@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

Sorry for the late reply.

On Fri, Nov 13, 2020 at 06:27:35PM +0100, Maxime Ripard wrote:
> Hi Sakari,
> 
> On Wed, Nov 11, 2020 at 03:18:57PM +0200, Sakari Ailus wrote:
> > Hi Paul,
> > 
> > On Thu, Nov 05, 2020 at 04:35:34PM +0100, Paul Kocialkowski wrote:
> > > Hi Sakari,
> > > 
> > > On Thu 05 Nov 20, 10:19, Sakari Ailus wrote:
> > > > Hi Paul,
> > > > 
> > > > On Wed, Nov 04, 2020 at 11:26:43AM +0100, Paul Kocialkowski wrote:
> > > > > Hi Sakari and thanks for the review!
> > > > > 
> > > > > On Tue 03 Nov 20, 01:24, Sakari Ailus wrote:
> > > > > > On Fri, Oct 23, 2020 at 07:54:04PM +0200, Paul Kocialkowski wrote:
> > > > > > > This introduces YAML bindings documentation for the OV8865
> > > > > > > image sensor.
> > > > > > > 
> > > > > > > Co-developed-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> > > > > > > Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> > > > > > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > > > > ---
> > > > > > >  .../bindings/media/i2c/ovti,ov8865.yaml       | 124 ++++++++++++++++++
> > > > > > >  1 file changed, 124 insertions(+)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> > > > > > > 
> > > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..807f1a94afae
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> > > > > > > @@ -0,0 +1,124 @@
> > > > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov8865.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: OmniVision OV8865 Image Sensor Device Tree Bindings
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    const: ovti,ov8865
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  clocks:
> > > > > > > +    items:
> > > > > > > +      - description: EXTCLK Clock
> > > > > > > +
> > > > > > > +  clock-names:
> > > > > > > +    items:
> > > > > > > +      - const: extclk
> > > > > > 
> > > > > > Is this needed with a single clock?
> > > > > 
> > > > > Yes I think so: we grab the clock with devm_clk_get which takes a name string
> > > > > that matches the clock-names property.
> > > > 
> > > > That argument may be NULL.
> > > 
> > > Understood, let's get rid of clock-names then. I see this is done in a few
> > > drivers already, but many also give it a name with a single clock.
> > > 
> > > It would be nice if that was consistent across all drivers just so that the
> > > expectation is clear (that the best way for that to happen is probably to
> > > fix up a patch myself though).
> > 
> > I guess somewhat different practices exist depending on the tree albeit
> > it's all DT bindings. It's also not wrong to have the name of the clock
> > there, no, but virtually all camera sensors consume a single clock, so you
> > may as well omit the information.
> > 
> > > 
> > > > > > And... shouldn't this also come with assigned-clock-rates etc., to set the
> > > > > > clock frequency?
> > > > > 
> > > > > I'm a bit confused why we would need to do that in the device-tree rather than
> > > > > setting the clock rate with clk_set_rate in the driver, like any other driver
> > > > > does. I think this was discussed before (on the initial ov8865 series) and the
> > > > > conclusion was that there is no particular reason for media i2c drivers to
> > > > > behave differently. So I believe this is the correct approach.
> > > > 
> > > > I'm not exactly sure about that conclusion.
> > > 
> > > I may have jumped too far here. It's not exactly clear to me what was the
> > > conclusion from...
> > > https://lore.kernel.org/linux-arm-kernel/20200401080705.j4goeqcqhoswhx4u@gilmour.lan/
> > 
> > Yes, there has been more discussion on the topic, most recently in this
> > thread:
> > 
> > <URL:https://lore.kernel.org/linux-arm-kernel/20201102150547.GY26150@paasikivi.fi.intel.com/>
> > 
> > I think this deserves to be added to camera-sensor.rst .
> 
> It's not really a discussion though :)
> 
> We had back in that thread some issues with assigned-clock-rates that
> don't get addressed at all.
> 
> > > > You can use clk_set_rate() if you get the frequency from DT, but we
> > > > recently did conclude that camera sensor drivers can expect to get the
> > > > frequency indicated by assigned-clock-rate property.
> > > 
> > > ...but it looks like clock-frequency was preferred over assigned-clock-rates
> > > and this is what the binding that was merged suggests. Is that correct?
> > 
> > assigned-clock-rates is fine. The assumption is that the clock frequency
> > does not change from the value set through DT, and the driver gets that
> > exact frequency.
> 
> That's two fairly big assumptions though. A clock driver is free to
> round the clock to whatever rate it wants, and assigned-clock-rates
> doesn't provide any guarantee on this, nor does it let the potential
> user know about it.
> 
> It might work for one-off cases, but there's no guarantee that it will
> in the future since this is very much dependent on the clock setup,
> driver and the other devices in the system (and to some extent the
> configuration as well).
> 
> And since we only rely on it, we can't fix it properly either if it ever
> occurs.
> 
> And then, semantically, this assigned-clock-rates isn't about what the
> devices support but what the driver supports. The clock tree of
> omnivision sensors (at least, I can't comment on the imx218 linked
> above) allows for a very flexible input clock, it's only the driver that
> requires it because most of its configuration relies on it.

There is a semantic difference, yes. The driver in this case assumes the
frequency is the one it is expected to use. In case the frequency is
different, the most likely outcome is that the image sensor is inoperable.
But again that is fairly easy to notice.

If someone prefers to fix this and make it reliable also in principle, that
would require changing the semantics a little as well as adding a function
to the clock framework to set the assigned frequency.

> 
> It's definitely fine for the driver to do so, but it really doesn't
> belong in the DT.
> 
> I thought we had an agreement on this last time we discussed it, but I'm
> not really sure what made you change your mind.

Most new sensor drivers come with assigned-clock-rates etc. properties and
I'll need to explain the same over and over again in review. Then using
"clock-frequency" property requires quite a few more lines of code in the
drivers.

I also recently discussed the matter with Rob H. and his opinion was
basically that we should be using assigned-clock-rates here instead.

I wonder how this works on other places where the frequency can be one of
several options, but the correct frequency is board specific.

-- 
Kind regards,

Sakari Ailus
