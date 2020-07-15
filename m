Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E13FF2206EE
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 10:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729721AbgGOIUc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 04:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729712AbgGOIUb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 04:20:31 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345AFC061755
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2020 01:20:31 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e4so1611944ljn.4
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2020 01:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tWn3aLja0T3YW+Z9v5dHqf6DJ1pX6YnBbpp7FSmVxFY=;
        b=0kp6/YSImp7fYXUs3hhkD9BpxU9hoEDEiIyACdv6tMoc9Wwg4KmUowkgWuR36nV/P1
         m7GpgaZw2dHHuVZ9Um6aLAH9SCnEVcm7Oe5AVZ/aJDjLQaydP/c/A8wyV+NVCo00dfsd
         7WzLEaLeJ1IvKpo6rFGl3t5a3Fc9zMa4qu4j4Y0csuSnjvIbiM32lOxfnqgfd8HwbM7R
         f8tC7UBMIykcRpxBO4q5UMcM8P/eVKUW0PMM0kmBwMswlFYgwkPDpQCyy5CQSY5PraFP
         V3oerhEPd/4cpsEhJ/L2pt8S4eshKDQPP+tojLRgOGrj5F6F68zkGYH2FfT7n8uVY6DH
         I8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tWn3aLja0T3YW+Z9v5dHqf6DJ1pX6YnBbpp7FSmVxFY=;
        b=ZTiDTThzGEouiYfjEuHreiR3TbPZ79zF8EensEgK/Kj8M65AjTZEtetlZih7CejA/m
         iZKwZU5XbRuoCy6v/ml2dYFEfcWaqS6DCeGjTZmqopixe+j6cssmTn9uX2UqwiWuAX1q
         5O3iGHvwpNs1XbQ1m4RQtkB8P5nK4achLL6kE3S+K8hJ1wzStxniMzwob6iJWT+3Lhco
         azcm4EV4j2qi+3rCTOr9WxaH45H5sn2DWxhy97yXmqA1ySn5+zgqwl6m9cZo8YWNl9Hx
         MfgT8uD7iaiY6ethmnIR418iImfxzOCWqzZYkTNiYB7+8FreuTqKX8yN/s2bJRePycT7
         PpQQ==
X-Gm-Message-State: AOAM530TjiMEDLxgnPWeq6ytmLjuDZ2Myr9Yd00JAVgwt0CIO78OBmiE
        p4wGAirwVtsUCvoltDo6uy/vMA==
X-Google-Smtp-Source: ABdhPJw7+8KzTqCndJy8NaVDHo+zaerdMmqkx/0Otin+gicjDQeNZMB0ga9BU9sXgk4wSXbAU2GKLA==
X-Received: by 2002:a2e:9b94:: with SMTP id z20mr4084349lji.404.1594801229627;
        Wed, 15 Jul 2020 01:20:29 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id m1sm342393lfa.22.2020.07.15.01.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 01:20:28 -0700 (PDT)
Date:   Wed, 15 Jul 2020 10:20:28 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        dave.stevenson@raspberrypi.com, hyun.kwon@xilinx.com,
        jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 9/9] media: rcar-csi2: Negotiate data lanes number
Message-ID: <20200715082028.GJ3051471@oden.dyn.berto.se>
References: <20200714135812.55158-1-jacopo+renesas@jmondi.org>
 <20200714135812.55158-10-jacopo+renesas@jmondi.org>
 <20200715065538.GI3051471@oden.dyn.berto.se>
 <20200715071325.epyuci3urjqoex4m@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200715071325.epyuci3urjqoex4m@uno.localdomain>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 2020-07-15 09:13:25 +0200, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Wed, Jul 15, 2020 at 08:55:38AM +0200, Niklas Söderlund wrote:
> > Hi Jacopo,
> >
> > Thanks for your work.
> >
> > On 2020-07-14 15:58:12 +0200, Jacopo Mondi wrote:
> > > Use the newly introduced get_mbus_config() subdevice pad operation to
> > > retrieve the remote subdevice MIPI CSI-2 bus configuration and configure
> > > the number of active data lanes accordingly.
> > >
> > > In order to be able to call the remote subdevice operation cache the
> > > index of the remote pad connected to the single CSI-2 input port.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 74 +++++++++++++++++++--
> > >  1 file changed, 67 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > index c6cc4f473a07..d39f312ebff9 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > @@ -364,6 +364,7 @@ struct rcar_csi2 {
> > >  	struct v4l2_async_notifier notifier;
> > >  	struct v4l2_async_subdev asd;
> > >  	struct v4l2_subdev *remote;
> > > +	unsigned int remote_pad;
> > >
> > >  	struct v4l2_mbus_framefmt mf;
> > >
> > > @@ -409,13 +410,14 @@ static void rcsi2_exit_standby(struct rcar_csi2 *priv)
> > >  	reset_control_deassert(priv->rstc);
> > >  }
> > >
> > > -static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
> > > +static int rcsi2_wait_phy_start(struct rcar_csi2 *priv,
> > > +				unsigned int active_lanes)
> >
> > Maybe s/active_lanes/lanes/ here and below?
> >
> 
> ok, I guess it's not important to convey the distinction between
> active and available lanes here.
> 
> > >  {
> > >  	unsigned int timeout;
> > >
> > >  	/* Wait for the clock and data lanes to enter LP-11 state. */
> > >  	for (timeout = 0; timeout <= 20; timeout++) {
> > > -		const u32 lane_mask = (1 << priv->lanes) - 1;
> > > +		const u32 lane_mask = (1 << active_lanes) - 1;
> > >
> > >  		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)  &&
> > >  		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
> > > @@ -447,7 +449,8 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
> > >  	return 0;
> > >  }
> > >
> > > -static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
> > > +static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> > > +			   unsigned int active_lanes)
> > >  {
> > >  	struct v4l2_subdev *source;
> > >  	struct v4l2_ctrl *ctrl;
> > > @@ -472,15 +475,63 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
> > >  	 * bps = link_freq * 2
> > >  	 */
> > >  	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> > > -	do_div(mbps, priv->lanes * 1000000);
> > > +	do_div(mbps, active_lanes * 1000000);
> > >
> > >  	return mbps;
> > >  }
> > >
> > > +static int rcsi2_config_active_lanes(struct rcar_csi2 *priv,
> > > +				     unsigned int *active_lanes)
> >
> > I would name this rcsi2_get_active_lanes() as it does not configure
> > anything just queries the subdevice for information.
> >
> 
> ack
> 
> > > +{
> > > +	struct v4l2_mbus_config mbus_config = { 0 };
> > > +	unsigned int num_lanes = (-1U);
> >
> > This looks odd and could just be set 0 with the same effect but clearer
> > to read.
> >
> 
> Not really.
> 
> Have a look at this part:
> 
> 	if (mbus_config.flags & V4L2_MBUS_CSI2_1_LANE)
> 		num_lanes = 1;
> 	else if (mbus_config.flags & V4L2_MBUS_CSI2_2_LANE)
> 		num_lanes = 2;
> 	else if (mbus_config.flags & V4L2_MBUS_CSI2_3_LANE)
> 		num_lanes = 3;
> 	else if (mbus_config.flags & V4L2_MBUS_CSI2_4_LANE)
> 		num_lanes = 4;
> 
> 	if (num_lanes > priv->lanes) {
> 
>         ^^ I should then change this one to:
> 
>         if (!num_lanes)
> 
> But this does not protect against the case num_lanes is actually set
> to a meaningful value, but it's larger than the number of actually
> available lanes (which is held by priv->lanes).
> 
> I would keep this one as it is.

I see your point but please initialize it to UINT_MAX instead of -1U 
then :-)

> 
> Thanks
>   j
> 
> > > +	int ret;
> > > +
> > > +	*active_lanes = priv->lanes;
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
> > > +
> > > +	if (num_lanes > priv->lanes) {
> > > +		dev_err(priv->dev,
> > > +			"Unsupported mbus config: too many data lanes %u\n",
> > > +			num_lanes);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	*active_lanes = num_lanes;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int rcsi2_start_receiver(struct rcar_csi2 *priv)
> > >  {
> > >  	const struct rcar_csi2_format *format;
> > >  	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
> > > +	unsigned int active_lanes;
> > >  	unsigned int i;
> > >  	int mbps, ret;
> > >
> > > @@ -522,10 +573,18 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
> > >  			fld |= FLD_FLD_NUM(1);
> > >  	}
> > >
> > > +	/*
> > > +	 * Get the number of active data lanes inspecting the remote mbus
> > > +	 * configuration.
> > > +	 */
> > > +	ret = rcsi2_config_active_lanes(priv, &active_lanes);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > >  	phycnt = PHYCNT_ENABLECLK;
> > > -	phycnt |= (1 << priv->lanes) - 1;
> > > +	phycnt |= (1 << active_lanes) - 1;
> > >
> > > -	mbps = rcsi2_calc_mbps(priv, format->bpp);
> > > +	mbps = rcsi2_calc_mbps(priv, format->bpp, active_lanes);
> > >  	if (mbps < 0)
> > >  		return mbps;
> > >
> > > @@ -572,7 +631,7 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
> > >  	rcsi2_write(priv, PHYCNT_REG, phycnt | PHYCNT_SHUTDOWNZ);
> > >  	rcsi2_write(priv, PHYCNT_REG, phycnt | PHYCNT_SHUTDOWNZ | PHYCNT_RSTZ);
> > >
> > > -	ret = rcsi2_wait_phy_start(priv);
> > > +	ret = rcsi2_wait_phy_start(priv, active_lanes);
> > >  	if (ret)
> > >  		return ret;
> > >
> > > @@ -749,6 +808,7 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
> > >  	}
> > >
> > >  	priv->remote = subdev;
> > > +	priv->remote_pad = pad;
> > >
> > >  	dev_dbg(priv->dev, "Bound %s pad: %d\n", subdev->name, pad);
> > >
> > > --
> > > 2.27.0
> > >
> >
> > --
> > Regards,
> > Niklas Söderlund

-- 
Regards,
Niklas Söderlund
