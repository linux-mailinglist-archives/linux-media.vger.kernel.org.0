Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27A001F9309
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 11:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbgFOJQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 05:16:31 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:46489 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbgFOJQb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 05:16:31 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0724124000E;
        Mon, 15 Jun 2020 09:16:25 +0000 (UTC)
Date:   Mon, 15 Jun 2020 11:19:49 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 9/9] media: rcar-csi2: Negotiate data lanes number
Message-ID: <20200615091949.65dopovonlzs465l@uno.localdomain>
References: <20200611161651.264633-1-jacopo+renesas@jmondi.org>
 <20200611161651.264633-10-jacopo+renesas@jmondi.org>
 <20200615083405.GP16711@paasikivi.fi.intel.com>
 <20200615084306.intk7hmrf7qptsx6@uno.localdomain>
 <20200615085335.GR16711@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200615085335.GR16711@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, Jun 15, 2020 at 11:53:35AM +0300, Sakari Ailus wrote:
> Jacopo,
>
> On Mon, Jun 15, 2020 at 10:43:06AM +0200, Jacopo Mondi wrote:
> > Hi Sakari,
> >
> > On Mon, Jun 15, 2020 at 11:34:06AM +0300, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Thu, Jun 11, 2020 at 06:16:51PM +0200, Jacopo Mondi wrote:
> > > > Use the newly introduced get_mbus_config() subdevice pad operation to
> > > > retrieve the remote subdevice MIPI CSI-2 bus configuration and configure
> > > > the number of active data lanes accordingly.
> > > >
> > > > In order to be able to call the remote subdevice operation cache the
> > > > index of the remote pad connected to the single CSI-2 input port.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 61 ++++++++++++++++++++-
> > > >  1 file changed, 58 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > index 151e6a90c5fb..11769f004fd8 100644
> > > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > @@ -363,6 +363,7 @@ struct rcar_csi2 {
> > > >  	struct v4l2_async_notifier notifier;
> > > >  	struct v4l2_async_subdev asd;
> > > >  	struct v4l2_subdev *remote;
> > > > +	unsigned int remote_pad;
> > > >
> > > >  	struct v4l2_mbus_framefmt mf;
> > > >
> > > > @@ -371,6 +372,7 @@ struct rcar_csi2 {
> > > >
> > > >  	unsigned short lanes;
> > > >  	unsigned char lane_swap[4];
> > > > +	unsigned short active_lanes;
> > >
> > > Do you need this? I.e. should you not always request this from the
> > > transmitter device?
> >
> > It's actually the other way around. The receiver queries the
> > transmitter to know how many data lanes it intends to use and adjusts
> > its configuration to accommodate it.
>
> I think we didn't have a different view on the process. But you basically
> need this when you're starting streaming, so why is the information stored
> here?
>

Still not sure I got your question, so pardon me if the reply is
something obvious to you already, and I'm missing the real point.

But, basically what happens is there at probe time the number of
'available' data lanes is parsed from firmware and stored in
priv->lanes. At stream start time, the remote end gets queried and the
number of 'active' lanes adjusted according to what it's reported.

Then, during the whole CSI-2 interface startup process, the number of
'active' lanes is used in a few different places (ie.
rcsi2_wait_phy_start() and rcsi2_calc_mbps()) so I had to store it
somewhere.

Now that I wrote that, I realize you might be wondering why a
parameter that is valid for a single streaming session is stored in
the main driver structure. This might not be optimal, but the driver
struct already contains, in example, a v4l2_mbus_framefmt entry which
is a session specific paramter as well, so I thought it was no harm
adding the number of active 'lanes' there. Is this what's bothering
you ?

Thanks
  j

> >
> > >
> > > >  };
> > > >
> > > >  static inline struct rcar_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
> > > > @@ -414,7 +416,7 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
> > > >
> > > >  	/* Wait for the clock and data lanes to enter LP-11 state. */
> > > >  	for (timeout = 0; timeout <= 20; timeout++) {
> > > > -		const u32 lane_mask = (1 << priv->lanes) - 1;
> > > > +		const u32 lane_mask = (1 << priv->active_lanes) - 1;
> > > >
> > > >  		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)  &&
> > > >  		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
> > > > @@ -471,11 +473,57 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
> > > >  	 * bps = link_freq * 2
> > > >  	 */
> > > >  	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> > > > -	do_div(mbps, priv->lanes * 1000000);
> > > > +	do_div(mbps, priv->active_lanes * 1000000);
> > > >
> > > >  	return mbps;
> > > >  }
> > > >
> > > > +static int rcsi2_config_active_lanes(struct rcar_csi2 *priv)
> > > > +{
> > > > +	struct v4l2_mbus_config mbus_config = { 0 };
> > > > +	unsigned int num_lanes = (-1U);
> > > > +	int ret;
> > > > +
> > > > +	priv->active_lanes = priv->lanes;
> > > > +	ret = v4l2_subdev_call(priv->remote, pad, get_mbus_config,
> > > > +			       priv->remote_pad, &mbus_config);
> > > > +	if (ret == -ENOIOCTLCMD) {
> > > > +		dev_dbg(priv->dev, "No remote mbus configuration available\n");
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	if (ret) {
> > > > +		dev_err(priv->dev, "Failed to get remote mbus configuration\n");
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> > > > +		dev_err(priv->dev, "Unsupported media bus type %u\n",
> > > > +			mbus_config.type);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	if (mbus_config.flags & V4L2_MBUS_CSI2_1_LANE)
> > > > +		num_lanes = 1;
> > > > +	else if (mbus_config.flags & V4L2_MBUS_CSI2_2_LANE)
> > > > +		num_lanes = 2;
> > > > +	else if (mbus_config.flags & V4L2_MBUS_CSI2_3_LANE)
> > > > +		num_lanes = 3;
> > > > +	else if (mbus_config.flags & V4L2_MBUS_CSI2_4_LANE)
> > > > +		num_lanes = 4;
> > >
> > > This is the downside of using flags... Anyway, I guess this is certainly
> > > fine now.
> > >
> >
> > Let's change this on top, if we like to (and I would like to :)
>
> Agreed.
>
> --
> Sakari Ailus
