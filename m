Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C18E871A4
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 07:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405539AbfHIFmR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 01:42:17 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53767 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbfHIFmR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Aug 2019 01:42:17 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hvxfG-0004mh-ND; Fri, 09 Aug 2019 07:42:10 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hvxfG-0006T7-DJ; Fri, 09 Aug 2019 07:42:10 +0200
Date:   Fri, 9 Aug 2019 07:42:10 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v6 13/13] media: tvp5150: make debug output more readable
Message-ID: <20190809054210.bff35njzrdss3jrl@pengutronix.de>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-14-m.felsch@pengutronix.de>
 <20190506133905.gvdgrei5n6crbwxc@uno.localdomain>
 <20190514171845.0eafb6f8@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514171845.0eafb6f8@coco.lan>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:41:34 up 83 days, 11:59, 54 users,  load average: 0.14, 0.10,
 0.05
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

On 19-05-14 17:18, Mauro Carvalho Chehab wrote:
> Em Mon, 6 May 2019 15:39:05 +0200
> Jacopo Mondi <jacopo@jmondi.org> escreveu:
> 
> > Hi Marco,
> >   thanks
> > 
> > Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> Looks ok to me too.

Same here, can I add your Reviewed-by tag too?

Regards,
  Marco

> > 
> > On Mon, Apr 15, 2019 at 02:44:13PM +0200, Marco Felsch wrote:
> > > The debug output for tvp5150_selmux() isn't really intuitive. Register
> > > values are printed decimal formatted and the input/output driver states
> > > are printed as enum. Even more the "normal" output enum mapps to zero so
> > > a active output will printing output=0 and a inactive output=1.
> > >
> > > Change this by brinting the register values hex formatted and the states
> > > as more readable string.
> > >
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  drivers/media/i2c/tvp5150.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> > > index c0ee08546643..13ee6d781efb 100644
> > > --- a/drivers/media/i2c/tvp5150.c
> > > +++ b/drivers/media/i2c/tvp5150.c
> > > @@ -302,9 +302,12 @@ static void tvp5150_selmux(struct v4l2_subdev *sd)
> > >  		break;
> > >  	}
> > >
> > > -	dev_dbg_lvl(sd->dev, 1, debug, "Selecting video route: route input=%i, output=%i => tvp5150 input=%i, opmode=%i\n",
> > > -			decoder->input, decoder->output,
> > > -			input, opmode);
> > > +	dev_dbg_lvl(sd->dev, 1, debug,
> > > +		    "Selecting video route: route input=%s, output=%s => tvp5150 input=0x%02x, opmode=0x%02x\n",
> > > +		    decoder->input == 0 ? "aip1a" :
> > > +		    decoder->input == 2 ? "aip1b" : "svideo",
> > > +		    decoder->output == 0 ? "normal" : "black-frame-gen",
> > > +		    input, opmode);
> > >
> > >  	regmap_write(decoder->regmap, TVP5150_OP_MODE_CTL, opmode);
> > >  	regmap_write(decoder->regmap, TVP5150_VD_IN_SRC_SEL_1, input);
> > > --
> > > 2.20.1
> > >  
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
