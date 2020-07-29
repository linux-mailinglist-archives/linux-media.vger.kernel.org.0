Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE82231C17
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 11:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgG2J3G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 05:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbgG2J3G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 05:29:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD8AFC061794
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 02:29:05 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1k0iOT-0001ti-Sm; Wed, 29 Jul 2020 11:29:01 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1k0iOT-00009e-4f; Wed, 29 Jul 2020 11:29:01 +0200
Date:   Wed, 29 Jul 2020 11:29:01 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andreas Pretzsch <apr@cn-eng.de>
Subject: Re: [PATCH] media: i2c: tvp5150: Fix horizontal crop stop boundry
Message-ID: <20200729092901.yfic3vywmnykncod@pengutronix.de>
References: <20190917071442.24986-1-robin@protonic.nl>
 <23cbd4c0-b53e-d01f-e6d6-b4d2d689bb59@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23cbd4c0-b53e-d01f-e6d6-b4d2d689bb59@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:27:34 up 257 days, 46 min, 240 users,  load average: 0.13, 0.10,
 0.08
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 20-06-25 13:05, Hans Verkuil wrote:
> On 17/09/2019 09:14, Robin van der Gracht wrote:
> > The value for AVID stop is relative to the width of the active video area,
> > not the maximum register value. Zero means equal and a negative value means
> > we're cropping on the right side.
> 
> While going through old unreviewed patches I came across this one (sorry Robin,
> your patch fell through the cracks).
> 
> Can someone verify/test that this is correct? Marco perhaps?

sorry for my long absence on this. I will test it next week if it is not
already to late.

Regards,
  Marco

> Regards,
> 
> 	Hans
> 
> > 
> > Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> > ---
> >  drivers/media/i2c/tvp5150.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> > index f47cb9a023fb..6bc65ab5e8ab 100644
> > --- a/drivers/media/i2c/tvp5150.c
> > +++ b/drivers/media/i2c/tvp5150.c
> > @@ -1231,10 +1231,10 @@ __tvp5150_set_selection(struct v4l2_subdev *sd, struct v4l2_rect rect)
> >  	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
> >  		     rect.left | (1 << TVP5150_CROP_SHIFT));
> >  	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
> > -		     (rect.left + rect.width - TVP5150_MAX_CROP_LEFT) >>
> > +		     (rect.left + rect.width - TVP5150_H_MAX) >>
> >  		     TVP5150_CROP_SHIFT);
> >  	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
> > -		     rect.left + rect.width - TVP5150_MAX_CROP_LEFT);
> > +		     rect.left + rect.width - TVP5150_H_MAX);
> >  }
> >  
> >  static int tvp5150_set_selection(struct v4l2_subdev *sd,
> > 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
