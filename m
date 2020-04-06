Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEAD319F1AD
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 10:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgDFIgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 04:36:13 -0400
Received: from retiisi.org.uk ([95.216.213.190]:37940 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726595AbgDFIgM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Apr 2020 04:36:12 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 1B24F634C8C;
        Mon,  6 Apr 2020 11:35:08 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jLNDn-0002Bc-5M; Mon, 06 Apr 2020 11:35:07 +0300
Date:   Mon, 6 Apr 2020 11:35:07 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 1/3] media: dt-bindings: ov8856: Document YAML bindings
Message-ID: <20200406083506.GE6127@valkosipuli.retiisi.org.uk>
References: <20200331133346.372517-1-robert.foss@linaro.org>
 <20200331133346.372517-2-robert.foss@linaro.org>
 <20200401080705.j4goeqcqhoswhx4u@gilmour.lan>
 <CAG3jFyvUd08U9yNVPUD9Y=nd5Xpcx34GcHJRhtvAAycoq3qimg@mail.gmail.com>
 <20200403232736.GA6127@valkosipuli.retiisi.org.uk>
 <20200404093446.vuvwrhn5436h4d3s@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200404093446.vuvwrhn5436h4d3s@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On Sat, Apr 04, 2020 at 11:34:46AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Sat, Apr 04, 2020 at 02:27:36AM +0300, Sakari Ailus wrote:
> > Hi Robert,
> >
> > On Thu, Apr 02, 2020 at 12:10:00PM +0200, Robert Foss wrote:
> > > Hey Maxime,
> > >
> > > On Wed, 1 Apr 2020 at 10:07, Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Tue, Mar 31, 2020 at 03:33:44PM +0200, Robert Foss wrote:
> > > > > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > >
> > > > > This patch adds documentation of device tree in YAML schema for the
> > > > > OV8856 CMOS image sensor.
> > > > >
> > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > > > > ---
> > > > >
> > > > > - Changes since v5:
> > > > >   * Add assigned-clocks and assigned-clock-rates
> > > > >   * robher: dt-schema errors
> > > > >
> > > > > - Changes since v4:
> > > > >   * Fabio: Change reset-gpio to GPIO_ACTIVE_LOW, explain in description
> > > > >   * Add clock-lanes property to example
> > > > >   * robher: Fix syntax error in devicetree example
> > > > >
> > > > > - Changes since v3:
> > > > >   * robher: Fix syntax error
> > > > >   * robher: Removed maxItems
> > > > >   * Fixes yaml 'make dt-binding-check' errors
> > > > >
> > > > > - Changes since v2:
> > > > >   Fixes comments from from Andy, Tomasz, Sakari, Rob.
> > > > >   * Convert text documentation to YAML schema.
> > > > >
> > > > > - Changes since v1:
> > > > >   Fixes comments from Sakari, Tomasz
> > > > >   * Add clock-frequency and link-frequencies in DT
> > > > >
> > > > >  .../devicetree/bindings/media/i2c/ov8856.yaml | 150 ++++++++++++++++++
> > > > >  MAINTAINERS                                   |   1 +
> > > > >  2 files changed, 151 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..beeddfbb8709
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > > > @@ -0,0 +1,150 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +# Copyright (c) 2019 MediaTek Inc.
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Omnivision OV8856 CMOS Sensor Device Tree Bindings
> > > > > +
> > > > > +maintainers:
> > > > > +  - Ben Kao <ben.kao@intel.com>
> > > > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > +
> > > > > +description: |-
> > > > > +  The Omnivision OV8856 is a high performance, 1/4-inch, 8 megapixel, CMOS
> > > > > +  image sensor that delivers 3264x2448 at 30fps. It provides full-frame,
> > > > > +  sub-sampled, and windowed 10-bit MIPI images in various formats via the
> > > > > +  Serial Camera Control Bus (SCCB) interface. This chip is programmable
> > > > > +  through I2C and two-wire SCCB. The sensor output is available via CSI-2
> > > > > +  serial data output (up to 4-lane).
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: ovti,ov8856
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clock-names:
> > > > > +    description:
> > > > > +      Input clock for the sensor.
> > > > > +    items:
> > > > > +      - const: xvclk
> > > > > +
> > > > > +  clock-frequency:
> > > > > +    description:
> > > > > +      Frequency of the xvclk clock in Hertz.
> > > >
> > > > We also had that discussion recently for another omnivision sensor
> > > > (ov5645 iirc), but what is clock-frequency useful for?
> > > >
> > > > It seems that the sensor is passed in clocks, so if you need to
> > > > retrieve the clock rate you should use the clock API instead.
> > > >
> > > > Looking at the driver, it looks like it first retrieves the clock, set
> > > > it to clock-frequency, and then checks that this is OV8856_XVCLK_19_2
> > > > (19.2 MHz).
> > >
> > > As far as I understand it, 19.2MHz is requirement for the sensor mode
> > > that currently defaults to. Some modes require higher clock speeds
> > > than this however.
> >
> > It's very system specific. Either way, bindings should not assume a
> > particular driver implementation.
> >
> > >
> > > >
> > > > The datasheet says that the sensor can have any frequency in the 6 -
> > > > 27 MHz range, so this is a driver limitation and should be set in the
> > > > driver using the clock API, and you can always bail out if it doesn't
> > > > provide a rate that is not acceptable for the drivers assumption.
> > > >
> > > > In any case, you don't need clock-frequency here...
> > >
> > > So your suggestion is that we remove all clocks-rate properties, and
> > > replace the clk_get_rate() calls in the driver with clk_set_rate()
> > > calls for the desired frequencies?
> >
> > The driver shouldn't set the rate here unless it gets it from DT (but that
> > was not the intention). So the driver should get the frequency instead.
> 
> I'm actually saying the opposite :)
> 
> Like you were saying, the binding (or DT, for that matter) shouldn't
> assume a particular driver implementation.
> 
> So one corollary is that if the driver has some restrictions in Linux,
> it shouldn't be part of the binding, right?

Correct.

> 
> This binding uses multiple clock properties but as far as I can see,
> the driver retrieves a clock using clocks and makes sure that its rate
> match its limitation of 19.2MHz using clock-frequency (which is
> redundant on a clk_get_rate on the clocks provided earlier).
> 
> I'm suspecting that the parent clock on multiple SoCs can be
> configured and is not a fixed rate crystal, so assigned-clocks-rate is
> here just to make sure we set the frequency at the one being checked
> in the driver's probe so that it all works.

Agreed.

> 
> But that 19.2MHz is not a limitation of the device itself, it's a
> limitation of our implementation, so we can instead implement
> something equivalent in Linux using a clk_set_rate to 19.2MHz (to make
> sure that our parent clock is configured at the right rate) and the
> clk_get_rate and compare that to 19.2MHz (to make sure that it's not
> been rounded too far apart from the frequency we expect).
> 
> This is doing exactly the same thing, except that we don't encode our
> implementation limitations in the DT, but in the driver instead.

What I really wanted to say that a driver that doesn't get the clock
frequency from DT but still sets that frequency is broken.

This frequency is highly system specific, and in many cases only a certain
frequency is usable, for a few reasons: On many SoCs, not all common
frequencies can be used (e.g. 9,6 MHz, 19,2 MHz and 24 MHz; while others
are being used as well), and then that frequency affects the usable CSI-2
bus frequencies directly --- and of those, only safe, known-good ones
should be used. IOW, getting the external clock frequency wrong typically
has an effect that that none of the known-good CSI-2 bus clock frequencies
are available.

-- 
Regards,

Sakari Ailus
