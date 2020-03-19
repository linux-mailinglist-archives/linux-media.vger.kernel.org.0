Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EABC318AE86
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 09:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgCSInI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 04:43:08 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:52127 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgCSInH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 04:43:07 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8C38620008;
        Thu, 19 Mar 2020 08:43:00 +0000 (UTC)
Date:   Thu, 19 Mar 2020 09:45:57 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hyun Kwon <hyun.kwon@xilinx.com>
Cc:     Hyun Kwon <hyunk@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v7 2/2] media: i2c: Add MAX9286 driver
Message-ID: <20200319084557.v5hw54mmw4swzwly@uno.localdomain>
References: <20200214103136.12526-1-kieran.bingham+renesas@ideasonboard.com>
 <20200214103136.12526-3-kieran.bingham+renesas@ideasonboard.com>
 <68a0cc3d-083b-8907-5b66-5f576f4be464@ideasonboard.com>
 <20200228181303.GA21745@smtp.xilinx.com>
 <20200315231517.d3e2fcvcwkmxds5g@uno.localdomain>
 <20200319010734.GA27556@smtp.xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200319010734.GA27556@smtp.xilinx.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hyun,

On Wed, Mar 18, 2020 at 06:07:35PM -0700, Hyun Kwon wrote:
> Hi Jacobo,
>
> On Sun, 2020-03-15 at 16:15:17 -0700, Jacopo Mondi wrote:
> > Hello Hyun, Kieran,
> >    it's great you are looking into this!
> >
> > On Fri, Feb 28, 2020 at 10:13:04AM -0800, Hyun Kwon wrote:
> > > Hi Kieran,
> > >
> > > Thanks for sharing a patch.
> > >
> > [snip]
> >
> > > > > +
> > > > > +	/*
> > > > > +	 * Set the I2C bus speed.
> > > > > +	 *
> > > > > +	 * Enable I2C Local Acknowledge during the probe sequences of the camera
> > > > > +	 * only. This should be disabled after the mux is initialised.
> > > > > +	 */
> > > > > +	max9286_configure_i2c(priv, true);
> > > > > +
> > > > > +	/*
> > > > > +	 * Reverse channel setup.
> > > > > +	 *
> > > > > +	 * - Enable custom reverse channel configuration (through register 0x3f)
> > > > > +	 *   and set the first pulse length to 35 clock cycles.
> > > > > +	 * - Increase the reverse channel amplitude to 170mV to accommodate the
> > > > > +	 *   high threshold enabled by the serializer driver.
> > > > > +	 */
> > > > > +	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> > > > > +	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
> > > > > +		      MAX9286_REV_AMP_X);
> > > > > +	usleep_range(2000, 2500);
> > > > > +
> > > > > +	/*
> > > > > +	 * Enable GMSL links, mask unused ones and autodetect link
> > > > > +	 * used as CSI clock source.
> > > > > +	 */
> > > > > +	max9286_write(priv, 0x00, MAX9286_MSTLINKSEL_AUTO | priv->route_mask);
> > > > > +	max9286_write(priv, 0x0b, link_order[priv->route_mask]);
> > > > > +	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
> > > > > +
> > > > > +	/*
> > > > > +	 * Video format setup:
> > > > > +	 * Disable CSI output, VC is set according to Link number.
> > > > > +	 */
> > > > > +	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
> > > > > +
> > > > > +	/* Enable CSI-2 Lane D0-D3 only, DBL mode, YUV422 8-bit. */
> > > > > +	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
> > > > > +		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
> > > > > +		      MAX9286_DATATYPE_YUV422_8BIT);
> > > > > +
> > > > > +	/* Automatic: FRAMESYNC taken from the slowest Link. */
> > > > > +	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
> > > > > +		      MAX9286_FSYNCMETH_AUTO);
> > > > > +
> > > > > +	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
> > > > > +	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
> > > > > +		      MAX9286_HVSRC_D14);
> > >
> >
> > I agree we need to make some of these configurable, we need that too
> > to handle both rdacm20 and 21.
> >
> > > Some of these configs in fact need some handshake between serializer and
> > > de-serializer. For example, I had to invert vsync in serializer [3] to make
> > > it work with this patch.
> >
> > Quickly skamming through the datasheet I'm surprised there is no way
> > to control the vsync input polarity and you have to go through the
> > crossbar :) Oh well, I think this could be well controlled through a
> > device property of the serializer, what do you think?
> >
> > We have standard properties to control vsync and hsync polarities, but
> > they're usually used for output signals, and I would reserve them for
> > that future usage.. maybe a custom property to control the input vsync
> > and hsync polarities would do...
>
> Thanks for sharing pointers. These are not really hardened - static properties
> so I'm not sure if device tree is the right place. I was thinking something
> more similar to phy_configure_opts_mipi_dphy in phy subsystem.

Let's take a step back, as it seems I was confused as well.

Not knowing the device, I can only guess on why you need to invert
the input VSYNC signal in the cross-bar. I see two options:

1) Looking at Figure 1 (Functional block diagram) the sensor vsync signal
is fed to the video timing generation circtuit. The cross-bar switch
comes after the timing generation circuit, and inverting vsync there
is then equivalent to invert the vsync output of the timing generation
block. If that's the case, instead of going through the crossbar,
the same result can be obtained by setting the VSYNC_INV bit of
register cxtp (0x4d[3]). If that's the case, I agree this setting
should be negotiated between ser/desr, as the VS_OUT signal in Figure
18 is inverted in the serialized byte stream. Is this the case ?

2) Alternatively, you need to invert the input vsync polarity to trigger
the timing generation circuit. This mean vsync is inverted -before-
being fed to timing generation, and this was my first understanding,
as I assumed the crossbar switch come -before- the timing generation
circtuitry. If this is the case, this setting should not be negotiated
between ser/deser but between the serializer and the connected camera
sensor.

Which case are you trying to address ?

>
> >
> > >
> > > In addition to that, I need a couple of additional programmings on max9286
> > > (registers 0x0 to 0x63/0x64- disable overlap window and 0xf4 to 0x1c which
> > > oddly change reserved bits) to get frames. The datasheet doesn't explain
> > > enough for me to understand. I'm talking to Maxim to get more details and
> > > see if those can be handled by serilizer driver.
> >
> > I would be really interested in knowing what's the overlap window control
> > about... it's very little detailed in the manual, I agree :) 0xf4 is
> > not even documented in my version. I assume it's something related to
> > fsync sync locking (Fig. 46) as I failed to achieve it without that
> > setting. How did it fail for you ?
> >
>
> I received one doc "Frame Synchronization Block" that explains the overlap
> window in more details. It's essentially a window between camera vsync and
> frame sync. If those 2 don't happen within the window, it errors out. So it
> gives a validation check, but may not work depending on the vsync patterm from
> camera or the window should be bigger, which makes the validation less
> useful in my opinion.

Thanks for the detailed info!

This reinforces the idea this setting should be disabled by default.
If we want to enable it, a value should be provided explicitly. I
still think DTS are the right place for this setting, as this is a
deserializer-only configuration parameter..

>
> I believe 0x1c has something to do with BWS as mentioned in my previous reply.
> The max9286 on my board sets BWS pin as open, and it makes the bandwidth
> to be 27 bit mode by default. So writing 0xf4 to 0x1c register sets to 24 bit
> mode (while 0xf6 = 27 bit mode). But I didn't hear back from Maxim regarding
> this yet. And unfortunately, I couldn't make it work with 27 bit mode on both
> max9286 and max96705.
>
> So this and similar properties may also be something that can be handled by
> the negotiating call mentioned above, while the configuraton through external
> pins can be modeled as device tree properties?

Indeed external pin configuration fits well as DTS property. Would you
like to have a go ?

Thanks
   j

>
> Thanks,
> -hyun
>
> > On how to control overlap window a integer would do ? Setting it to 0
> > disables it, so we could use a boolean property for convenience..
> >
> > Not knowing what it does I would be careful.. I think we should
> > actualy require a mandatory property, so all current dts select their
> > behaviour explicitly. If we later find out what it does we could
> > define a default behaviour by defining a boolean property. New dts
> > simpler and old dts still happy. What do you think ?
> >
> > >
> > > In a longer term, it'd be nice if such alignment between serializer and
> > > de-serializer is handled in more scalable way.
> > >
> >
> > Indeed :)
> >
> > Thanks
> >   j
> >
> > > Thanks,
> > > -hyun
> > >
> > > [1] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/3bd2dded834492f4ee89e370c22877b97c2e106e
> > > [2] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/fb0ad7fd699d90d6bbc78fc55dd98639389cfc5b
> > > [3] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/fe0b33b174b2850bf0bb25b3a367319127ae12ee
> > >
