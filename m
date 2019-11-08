Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30CDEF446E
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 11:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbfKHKZM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 05:25:12 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53715 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbfKHKZL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 05:25:11 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iT1Rv-0002k6-SC; Fri, 08 Nov 2019 11:25:03 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iT1Ru-0007OD-5N; Fri, 08 Nov 2019 11:25:02 +0100
Date:   Fri, 8 Nov 2019 11:25:02 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v11 11/15] media: tvp5150: add s_power callback
Message-ID: <20191108102502.6bzhzip7x3qsidem@pengutronix.de>
References: <20190930093900.16524-1-m.felsch@pengutronix.de>
 <20190930093900.16524-12-m.felsch@pengutronix.de>
 <20191024115905.GB3966@mara.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024115905.GB3966@mara.localdomain>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:03:44 up 174 days, 15:21, 119 users,  load average: 0.18, 0.21,
 0.15
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 19-10-24 14:59, Sakari Ailus wrote:
> Hi Marco,
> 
> On Mon, Sep 30, 2019 at 11:38:56AM +0200, Marco Felsch wrote:
> > Don't en-/disable the interrupts during s_stream because someone can
> > disable the stream but wants to get informed if the stream is locked
> > again. So keep the interrupts enabled the whole time the pipeline is
> > opened.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/media/i2c/tvp5150.c | 23 +++++++++++++++++------
> >  1 file changed, 17 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> > index dda9f0a2995f..4afe2093b950 100644
> > --- a/drivers/media/i2c/tvp5150.c
> > +++ b/drivers/media/i2c/tvp5150.c
> > @@ -1356,11 +1356,26 @@ static const struct media_entity_operations tvp5150_sd_media_ops = {
> >  /****************************************************************************
> >  			I2C Command
> >   ****************************************************************************/
> > +static int tvp5150_s_power(struct  v4l2_subdev *sd, int on)
> > +{
> > +	struct tvp5150 *decoder = to_tvp5150(sd);
> > +	unsigned int val = 0;
> > +
> > +	if (on)
> > +		val = TVP5150_INT_A_LOCK;
> > +
> > +	if (decoder->irq)
> > +		/* Enable / Disable lock interrupt */
> > +		regmap_update_bits(decoder->regmap, TVP5150_INT_ENABLE_REG_A,
> > +				   TVP5150_INT_A_LOCK, val);
> 
> Could you use runtime PM to do this instead?

You mean I should add a simple runtime_resume/suspend() which is called
during v4l2_subdev_internal_ops.open/close()? Of course I can do that
but why?

Regards,
  Marco

> > +
> > +	return 0;
> > +}
> >  
> >  static int tvp5150_s_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >  	struct tvp5150 *decoder = to_tvp5150(sd);
> > -	unsigned int mask, val = 0, int_val = 0;
> > +	unsigned int mask, val = 0;
> >  
> >  	mask = TVP5150_MISC_CTL_YCBCR_OE | TVP5150_MISC_CTL_SYNC_OE |
> >  	       TVP5150_MISC_CTL_CLOCK_OE;
> > @@ -1373,15 +1388,10 @@ static int tvp5150_s_stream(struct v4l2_subdev *sd, int enable)
> >  			val = decoder->lock ? decoder->oe : 0;
> >  		else
> >  			val = decoder->oe;
> > -		int_val = TVP5150_INT_A_LOCK;
> >  		v4l2_subdev_notify_event(&decoder->sd, &tvp5150_ev_fmt);
> >  	}
> >  
> >  	regmap_update_bits(decoder->regmap, TVP5150_MISC_CTL, mask, val);
> > -	if (decoder->irq)
> > -		/* Enable / Disable lock interrupt */
> > -		regmap_update_bits(decoder->regmap, TVP5150_INT_ENABLE_REG_A,
> > -				   TVP5150_INT_A_LOCK, int_val);
> >  
> >  	return 0;
> >  }
> > @@ -1580,6 +1590,7 @@ static const struct v4l2_subdev_core_ops tvp5150_core_ops = {
> >  	.g_register = tvp5150_g_register,
> >  	.s_register = tvp5150_s_register,
> >  #endif
> > +	.s_power = tvp5150_s_power,
> >  };
> >  
> >  static const struct v4l2_subdev_tuner_ops tvp5150_tuner_ops = {
> > -- 
> > 2.20.1
> > 
> 
> -- 
> Sakari Ailus
> sakari.ailus@linux.intel.com
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
