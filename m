Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE05D871A7
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 07:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405442AbfHIFnB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 01:43:01 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60589 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405424AbfHIFnB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Aug 2019 01:43:01 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hvxfy-0004qe-Pc; Fri, 09 Aug 2019 07:42:54 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hvxfy-0006TL-FG; Fri, 09 Aug 2019 07:42:54 +0200
Date:   Fri, 9 Aug 2019 07:42:54 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH v6 08/13] media: tvp5150: initialize subdev before
 parsing device tree
Message-ID: <20190809054254.k6saouaq6l4ebb3l@pengutronix.de>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-9-m.felsch@pengutronix.de>
 <20190514172052.7123204f@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514172052.7123204f@coco.lan>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:42:22 up 83 days, 12:00, 54 users,  load average: 0.06, 0.08,
 0.04
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On 19-05-14 17:20, Mauro Carvalho Chehab wrote:
> Em Mon, 15 Apr 2019 14:44:08 +0200
> Marco Felsch <m.felsch@pengutronix.de> escreveu:
> 
> > From: Michael Tretter <m.tretter@pengutronix.de>
> > 
> > There are several debug prints in the tvp5150_parse_dt() function, which
> > do not print the prefix, because the v4l2_subdev is not initialized, yet.
> > 
> > Initialize the v4l2_subdev before parsing the device tree to fix the
> > debug messages.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> Looks ok to me.

Can I add you Reviewed-by tag here?

Regards,
  Marco

> 
> > ---
> >  drivers/media/i2c/tvp5150.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> > index 9331609425bf..305a5e256b31 100644
> > --- a/drivers/media/i2c/tvp5150.c
> > +++ b/drivers/media/i2c/tvp5150.c
> > @@ -1973,6 +1973,9 @@ static int tvp5150_probe(struct i2c_client *c,
> >  
> >  	core->regmap = map;
> >  	sd = &core->sd;
> > +	v4l2_i2c_subdev_init(sd, c, &tvp5150_ops);
> > +	sd->internal_ops = &tvp5150_internal_ops;
> > +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> >  
> >  	if (IS_ENABLED(CONFIG_OF) && np) {
> >  		res = tvp5150_parse_dt(core, np);
> > @@ -1985,10 +1988,6 @@ static int tvp5150_probe(struct i2c_client *c,
> >  		core->mbus_type = V4L2_MBUS_BT656;
> >  	}
> >  
> > -	v4l2_i2c_subdev_init(sd, c, &tvp5150_ops);
> > -	sd->internal_ops = &tvp5150_internal_ops;
> > -	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > -
> >  	res = tvp5150_mc_init(core);
> >  	if (res)
> >  		goto err_cleanup_dt;
> 
> 
> 
> Thanks,
> Mauro
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
