Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDD56A5DC7
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 17:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjB1Q44 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 11:56:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjB1Q4w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 11:56:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11743367C0
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 08:56:24 -0800 (PST)
Received: from ideasonboard.com (host-87-18-61-24.retail.telecomitalia.it [87.18.61.24])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA6C956A;
        Tue, 28 Feb 2023 17:56:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677603382;
        bh=lIdlWM92SGbYDyzalAbmirEcmTdlvpc1Bci9pTJ4mEU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PG2hh5Gf6sdUpylE/GM2KCQ6D2s+7mwbcrDYs5cPpumjTU01Jm675hH/4zatS9DoM
         qJ1+YlKNjhDc04j0efpxOgpLHL+UzNwINJBy2Ys02chxjLKlTlotOc0u4dF4a2Z5Ge
         fKhb8uVF9akmJxQM8lVXULnV+Gg5EW71acjElfO4=
Date:   Tue, 28 Feb 2023 17:56:18 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     niklas soderlund <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>
Subject: Re: [PATCH v1 3/3] media: ti: cal: add multiplexed streams support
Message-ID: <20230228165618.ugfnpcwmykgkt2v6@uno.localdomain>
References: <20230222125630.421020-1-tomi.valkeinen@ideasonboard.com>
 <20230222125630.421020-4-tomi.valkeinen@ideasonboard.com>
 <20230224154855.kmiwg2h5b3vq272l@uno.localdomain>
 <Y/jx8euxuxg07C08@sleipner.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/jx8euxuxg07C08@sleipner.dyn.berto.se>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas

On Fri, Feb 24, 2023 at 06:20:49PM +0100, niklas soderlund wrote:
> Hello,
>
> On 2023-02-24 16:48:55 +0100, Jacopo Mondi wrote:
> > Hi Tomi
> >
> > On Wed, Feb 22, 2023 at 02:56:30PM +0200, Tomi Valkeinen wrote:
> > > Add routing and stream_config support to CAL driver.
> > >
> > > Add multiplexed streams support. CAL has 8 dma-engines and can capture 8
> > > separate streams at the same time.
> > >
> > > Add 8 video device nodes, each representing a single dma-engine, and set
> > > the number of source pads on camerarx to 8. Each video node can be
> > > connected to any of the source pads on either of the camerarx instances
> > > using media links. Camerarx internal routing is used to route the
> > > incoming CSI-2 streams to one of the 8 source pads.
> > >
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > >  drivers/media/platform/ti/cal/cal-camerarx.c | 233 ++++++++++++++-----
> > >  drivers/media/platform/ti/cal/cal-video.c    | 146 +++++++++---
> > >  drivers/media/platform/ti/cal/cal.c          |  65 ++++--
> > >  drivers/media/platform/ti/cal/cal.h          |   4 +-
> > >  4 files changed, 342 insertions(+), 106 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
> > > index faafbd0e9240..49ae29065cd1 100644
> > > --- a/drivers/media/platform/ti/cal/cal-camerarx.c
> > > +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
> > > @@ -49,21 +49,41 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
> > >  {
> > >  	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
> > >  	u32 num_lanes = mipi_csi2->num_data_lanes;
> > > -	const struct cal_format_info *fmtinfo;
> > >  	struct v4l2_subdev_state *state;
> > > -	struct v4l2_mbus_framefmt *fmt;
> > >  	u32 bpp;
> > >  	s64 freq;
> > >
> > > -	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
> > > +	/*
> > > +	 * v4l2_get_link_freq() uses V4L2_CID_LINK_FREQ first, and falls back
> > > +	 * to V4L2_CID_PIXEL_RATE if V4L2_CID_LINK_FREQ is not available.
> > > +	 *
> > > +	 * With multistream input there is no single pixel rate, and thus we
> > > +	 * cannot use V4L2_CID_PIXEL_RATE, so we pass 0 as the bpp which
> > > +	 * causes v4l2_get_link_freq() to return an error if it falls back to
> > > +	 * V4L2_CID_PIXEL_RATE.
> > > +	 */
> >
> > To recap a bit of our offline discussion:
> > - max9286 GMSL deserializer (as a comparison for a multiplexed
> >   transmitter) use PIXEL_RATE to report the cumulative pixel rate of
> >   enabled transmitters. This is because the R-Car CSI-2 receiver on
> >   which use PIXEL_RATE to compute the link freq [1]
> >
> > - according to [2]
> >   pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample (on D-PHY)
> >
> >   from which:
> >   link_freq = pixel_rate * bits_per_sample / (2 * nr_of_lanes)
> >
> >   This works as long the reported pixel rate includes visible and
> >   blankings, something I'm not sure how many transmitters handle
> >   correctly as PIXEL_RATE control is meant to report the visible pixel
> >   sampling rate on the pixel array.
> >
> > I guess we should go towards mandating LINK_FREQ for transmitters.
> >
> > cc-Niklas for opinions on R-Car CSI-2 rcsi2_calc_mbps()
>
> Thanks for the ping.
>
> The choice to use the PIXEL_RATE instead of the LINK_FREQ control for
> the R-Car CSI-2 was originally because the ADV748x which was the first
> CSI-2 transmitter used during development.
>
> AFIK the ADV748x adjusts the CSI-2 TX link frequency to match the pixel
> clock. This results in quiet a big range of possible values that need to
> be communicated between the two sub devices. The V4L2_CID_LINK_FREQ
> control is a V4L2_CTRL_TYPE_INTEGER_MENU which do not render itself to
> report the large range of values needed.

I see the HDMI and analog front-end adjusting the value of PIXEL_RATE
control through adv748x_csi2_set_pixelrate() which however only update
the value of the control. The ADV748x automatically adjusts the "MIPI
output frequency" (Chapter 9.6 of the chip manual) according to the
pixel rate, so I concur it is not possible/resonable to express all
the possible values as menu control items.

To be honest I always had troubles with LINK_FREQ being a menu
control, as it requires to pre-calculate all of the possible values it
can assume when the bus link frequency varies according to the pixel
rate or to the image format and output size.

>
> When we added MAX9286 and friends to the mix, we built on-top of this by
> reporting the total pixel rate of all streams being transmitted on the
> CSI-2 link. IMHO the v4l2_get_link_freq() was an OK middle ground on how
> to align the two use-cases.
>
> I agree that situation is not ideal. And in a perfect world a control
> other then PIXEL_RATE would be used for the R-Car CSI-2 driver, but no
> such control exists. And chancing the control type of LINK_FREQ is not a
> good idea as that is usually specified in as a list in DT.
>

I agree with most of this. I'm also concerned changing a control type
which userspace has access to might be considered a regression, so I
guess we have to live with LINK_FREQ as a menu control.

> Adding a new control DYNAMIC_LINK_FREQ and wire that into
> v4l2_get_link_freq() ?
>

I wonder if we shouldn't instead move away from controls and report
the CSI-2 link frequency between the transmitter and the receiver
drivers through the .get_mbus_config pad operation..

> >
> > [1] https://elixir.bootlin.com/linux/v6.2/source/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c#L608
> > [2] https://www.kernel.org/doc/html/latest/driver-api/media/tx-rx.html#csi-2-transmitter-drivers
> >
>
> --
> Kind Regards,
> Niklas Söderlund
