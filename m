Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2D431A3050
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 09:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgDIHhx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 03:37:53 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:55027 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbgDIHhx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 03:37:53 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2CE064000B;
        Thu,  9 Apr 2020 07:37:48 +0000 (UTC)
Date:   Thu, 9 Apr 2020 09:40:52 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] media: rcar-vin: csi2: Negotiate data lanes number
Message-ID: <20200409074052.m3sjxhkciodcjkj6@uno.localdomain>
References: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
 <20200313144035.401430-5-jacopo+renesas@jmondi.org>
 <20200407223331.GU1716317@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200407223331.GU1716317@oden.dyn.berto.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Wed, Apr 08, 2020 at 12:33:31AM +0200, Niklas Söderlund wrote:
> Hi Jacopo,
>
> Thanks for your work.
>
> On 2020-03-13 15:40:35 +0100, Jacopo Mondi wrote:
> > Use the newly introduced get_mbus_config() subdevice pad operation to
> > retrieve the remote subdevice MIPI CSI-2 bus configuration and configure
> > the number of active data lanes accordingly.
> >
> > In order to be able to call the remote subdevice operation cache the
> > index of the remote pad connected to the single CSI-2 input port.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Please s/rcar-vin: csi2:/rcar-csi2:/ in the subject.
>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-csi2.c | 49 +++++++++++++++++++--
> >  1 file changed, 46 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > index faa9fb23a2e9..4145e028dcdf 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -363,6 +363,7 @@ struct rcar_csi2 {
> >  	struct v4l2_async_notifier notifier;
> >  	struct v4l2_async_subdev asd;
> >  	struct v4l2_subdev *remote;
> > +	unsigned short remote_pad;
> >
> >  	struct v4l2_mbus_framefmt mf;
> >
> > @@ -371,6 +372,7 @@ struct rcar_csi2 {
> >
> >  	unsigned short lanes;
> >  	unsigned char lane_swap[4];
> > +	unsigned short active_lanes;
> >  };
> >
> >  static inline struct rcar_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
> > @@ -414,7 +416,7 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
> >
> >  	/* Wait for the clock and data lanes to enter LP-11 state. */
> >  	for (timeout = 0; timeout <= 20; timeout++) {
> > -		const u32 lane_mask = (1 << priv->lanes) - 1;
> > +		const u32 lane_mask = (1 << priv->active_lanes) - 1;
> >
> >  		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)  &&
> >  		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
> > @@ -471,11 +473,45 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
> >  	 * bps = link_freq * 2
> >  	 */
> >  	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> > -	do_div(mbps, priv->lanes * 1000000);
> > +	do_div(mbps, priv->active_lanes * 1000000);
> >
> >  	return mbps;
> >  }
> >
> > +static int rcsi2_get_mbus_config(struct rcar_csi2 *priv)
>
> This function do not get the mbus configuration as much as update number
> of used lanes. How about renaming it rcsi2_update_lanes_used() or
> something similar ?
>

You know, I'm not sure. Getting the number of lanes is one part of
getting the remote bus configuration, there might be more and then
we'll need to go through a function rename... I'll think about it...

> > +{
> > +	struct v4l2_mbus_pad_config mbus_config;
> > +	int ret;
> > +
> > +	memset(&mbus_config, 0, sizeof(mbus_config));
> > +	ret = v4l2_subdev_call(priv->remote, pad, get_mbus_config,
> > +			       priv->remote_pad, &mbus_config);
> > +	if (ret && ret != -ENOIOCTLCMD) {
> > +		dev_err(priv->dev, "Failed to get remote mbus configuration\n");
> > +		return ret;
> > +	} else if (ret == -ENOIOCTLCMD) {
> > +		dev_dbg(priv->dev, "No remote mbus configuration available\n");
> > +		priv->active_lanes = priv->lanes;
> > +		return 0;
> > +	}
>
> How about something bellow to match style of driver?
>
>     priv->active_lanes = priv->lanes;
>
>     memset(&mbus_config, 0, sizeof(mbus_config));
>     ret = v4l2_subdev_call(... get_mbus_config ...)
>     if (ret && ret != -ENOIOCTLCMD) {
>         dev_err(priv->dev, "Failed to get remote mbus configuration\n");
>         return ret;
>     }

This would not exit gracefully if -ENOIOCTLCMD, but would continue
inspecting the mbus_config.type and fail with "Unsupported bus type"
which is not what we want...

Unfortunately I thinkg -ENOIOCTLCMD should be handled explicitely :(

>
> > +
> > +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> > +		dev_err(priv->dev,
> > +			"Unsupported mbus type %u\n", mbus_config.type);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (mbus_config.csi2_dphy.data_lanes > priv->lanes) {
> > +		dev_err(priv->dev,
> > +			"Unsupported mbus config: too many data lanes %u\n",
> > +			mbus_config.csi2_dphy.data_lanes);
> > +		return -EINVAL;
> > +	}
> > +	priv->active_lanes = mbus_config.csi2_dphy.data_lanes;
> > +
> > +	return 0;
> > +}
> > +
> >  static int rcsi2_start_receiver(struct rcar_csi2 *priv)
> >  {
> >  	const struct rcar_csi2_format *format;
> > @@ -490,6 +526,11 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
> >  	/* Code is validated in set_fmt. */
> >  	format = rcsi2_code_to_fmt(priv->mf.code);
> >
> > +	/* Get the remote mbus config to get the number of enabled lanes. */
> > +	ret = rcsi2_get_mbus_config(priv);
> > +	if (ret)
> > +		return ret;
> > +
> >  	/*
> >  	 * Enable all supported CSI-2 channels with virtual channel and
> >  	 * data type matching.
> > @@ -522,7 +563,7 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
> >  	}
> >
> >  	phycnt = PHYCNT_ENABLECLK;
> > -	phycnt |= (1 << priv->lanes) - 1;
> > +	phycnt |= (1 << priv->active_lanes) - 1;
> >
> >  	mbps = rcsi2_calc_mbps(priv, format->bpp);
> >  	if (mbps < 0)
> > @@ -748,6 +789,7 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
> >  	}
> >
> >  	priv->remote = subdev;
> > +	priv->remote_pad = pad;
> >
> >  	dev_dbg(priv->dev, "Bound %s pad: %d\n", subdev->name, pad);
> >
> > @@ -793,6 +835,7 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
> >  			priv->lanes);
> >  		return -EINVAL;
> >  	}
> > +	priv->active_lanes = priv->lanes;
> >
> >  	for (i = 0; i < ARRAY_SIZE(priv->lane_swap); i++) {
> >  		priv->lane_swap[i] = i < priv->lanes ?
> > --
> > 2.25.1
> >
>
> --
> Regards,
> Niklas Söderlund
