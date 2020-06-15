Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA35C1F9245
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 10:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbgFOIxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 04:53:42 -0400
Received: from mga03.intel.com ([134.134.136.65]:11546 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728522AbgFOIxm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 04:53:42 -0400
IronPort-SDR: q8+U/KK5QKWjwoyLqAm+eaceXO2BtmecRgA2Cc+DX9O/nssxsP/ee549f4xa7y/suT+q8s4lNV
 6cbEzCs1EZXA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 01:53:40 -0700
IronPort-SDR: 3djufBK0fUTEPqWjLAF5wHr0kbNLJFyUwAbVCPHaeTqkdFE2mTYUWYJCEgm3Xp2JZBdgFYhhpA
 Z+ypajZdNnRA==
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="261721427"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 01:53:37 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id DE11820448; Mon, 15 Jun 2020 11:53:35 +0300 (EEST)
Date:   Mon, 15 Jun 2020 11:53:35 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 9/9] media: rcar-csi2: Negotiate data lanes number
Message-ID: <20200615085335.GR16711@paasikivi.fi.intel.com>
References: <20200611161651.264633-1-jacopo+renesas@jmondi.org>
 <20200611161651.264633-10-jacopo+renesas@jmondi.org>
 <20200615083405.GP16711@paasikivi.fi.intel.com>
 <20200615084306.intk7hmrf7qptsx6@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615084306.intk7hmrf7qptsx6@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jacopo,

On Mon, Jun 15, 2020 at 10:43:06AM +0200, Jacopo Mondi wrote:
> Hi Sakari,
> 
> On Mon, Jun 15, 2020 at 11:34:06AM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Thu, Jun 11, 2020 at 06:16:51PM +0200, Jacopo Mondi wrote:
> > > Use the newly introduced get_mbus_config() subdevice pad operation to
> > > retrieve the remote subdevice MIPI CSI-2 bus configuration and configure
> > > the number of active data lanes accordingly.
> > >
> > > In order to be able to call the remote subdevice operation cache the
> > > index of the remote pad connected to the single CSI-2 input port.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 61 ++++++++++++++++++++-
> > >  1 file changed, 58 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > index 151e6a90c5fb..11769f004fd8 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > @@ -363,6 +363,7 @@ struct rcar_csi2 {
> > >  	struct v4l2_async_notifier notifier;
> > >  	struct v4l2_async_subdev asd;
> > >  	struct v4l2_subdev *remote;
> > > +	unsigned int remote_pad;
> > >
> > >  	struct v4l2_mbus_framefmt mf;
> > >
> > > @@ -371,6 +372,7 @@ struct rcar_csi2 {
> > >
> > >  	unsigned short lanes;
> > >  	unsigned char lane_swap[4];
> > > +	unsigned short active_lanes;
> >
> > Do you need this? I.e. should you not always request this from the
> > transmitter device?
> 
> It's actually the other way around. The receiver queries the
> transmitter to know how many data lanes it intends to use and adjusts
> its configuration to accommodate it.

I think we didn't have a different view on the process. But you basically
need this when you're starting streaming, so why is the information stored
here?

> 
> >
> > >  };
> > >
> > >  static inline struct rcar_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
> > > @@ -414,7 +416,7 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
> > >
> > >  	/* Wait for the clock and data lanes to enter LP-11 state. */
> > >  	for (timeout = 0; timeout <= 20; timeout++) {
> > > -		const u32 lane_mask = (1 << priv->lanes) - 1;
> > > +		const u32 lane_mask = (1 << priv->active_lanes) - 1;
> > >
> > >  		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)  &&
> > >  		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
> > > @@ -471,11 +473,57 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
> > >  	 * bps = link_freq * 2
> > >  	 */
> > >  	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> > > -	do_div(mbps, priv->lanes * 1000000);
> > > +	do_div(mbps, priv->active_lanes * 1000000);
> > >
> > >  	return mbps;
> > >  }
> > >
> > > +static int rcsi2_config_active_lanes(struct rcar_csi2 *priv)
> > > +{
> > > +	struct v4l2_mbus_config mbus_config = { 0 };
> > > +	unsigned int num_lanes = (-1U);
> > > +	int ret;
> > > +
> > > +	priv->active_lanes = priv->lanes;
> > > +	ret = v4l2_subdev_call(priv->remote, pad, get_mbus_config,
> > > +			       priv->remote_pad, &mbus_config);
> > > +	if (ret == -ENOIOCTLCMD) {
> > > +		dev_dbg(priv->dev, "No remote mbus configuration available\n");
> > > +		return 0;
> > > +	}
> > > +
> > > +	if (ret) {
> > > +		dev_err(priv->dev, "Failed to get remote mbus configuration\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> > > +		dev_err(priv->dev, "Unsupported media bus type %u\n",
> > > +			mbus_config.type);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (mbus_config.flags & V4L2_MBUS_CSI2_1_LANE)
> > > +		num_lanes = 1;
> > > +	else if (mbus_config.flags & V4L2_MBUS_CSI2_2_LANE)
> > > +		num_lanes = 2;
> > > +	else if (mbus_config.flags & V4L2_MBUS_CSI2_3_LANE)
> > > +		num_lanes = 3;
> > > +	else if (mbus_config.flags & V4L2_MBUS_CSI2_4_LANE)
> > > +		num_lanes = 4;
> >
> > This is the downside of using flags... Anyway, I guess this is certainly
> > fine now.
> >
> 
> Let's change this on top, if we like to (and I would like to :)

Agreed.

-- 
Sakari Ailus
