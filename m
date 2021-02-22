Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0156320EC3
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 01:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhBVAuw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 19:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbhBVAuu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 19:50:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D82C061574;
        Sun, 21 Feb 2021 16:50:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E91258E;
        Mon, 22 Feb 2021 01:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613955006;
        bh=QDgBEUcxtnBMr+2qeCkHrC4sgHHhnA4SnzpEQF/qJU0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K4BZpwWfzMQy/dLBVQUdRT2fPcMzeBNpBgTaw1zgkwjXP0vUJRq1fGJsDcItWtJDl
         7qdHwFV4LKeSULiTygX8VkecNviyqzam71Ab0LeWe2mCgmykgxS985ftzSm4m/7PN2
         BA8zV56/iJP9TsQOpW2GOKQE02dkG5iZwLwe0MfE=
Date:   Mon, 22 Feb 2021 02:49:34 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/16] media: i2c: rdacm20: Enable noise immunity
Message-ID: <YDL/npLVS7vk3TV7@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-2-jacopo+renesas@jmondi.org>
 <5691f68f-724d-9d6a-9ea8-1e017b305c66@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5691f68f-724d-9d6a-9ea8-1e017b305c66@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Feb 17, 2021 at 12:55:19PM +0000, Kieran Bingham wrote:
> On 16/02/2021 17:41, Jacopo Mondi wrote:
> > Enable the noise immunity threshold at the end of the rdacm20
> > initialization routine.
> > 
> > The rdcam20 camera module has been so far tested with a startup

s/rdcam20/rdacm20/

> > delay that allowed the embedded MCU to program the serializer. If
> > the initialization routine is run before the MCU programs the
> > serializer and the image sensor and their addresses gets changed
> > by the rdacm20 driver it is required to manually enable the noise
> > immunity threshold to make the communication on the control channel
> > more reliable.
> 
> Oh, this is interesting, ... booting up without the delays would be ...
> much nicer.

I second that, but I'm a bit worried. The MCU has caused us more pain
than gain, the best way to fix it may be with a desoldering station ;-)
Jokes aside, if we want to start initializing with the serializer before
the MCU completes its initialization, then we'll have a racy process,
with two I2C masters configuring the same device. I don't think anything
good can come out of that :-S

Taking into account the fact that on some platforms we'll want to
implement power management for the cameras, disabling power (possibly
individually) when the cameras are not in use, we'll have to handle the
race carefully, and I'm not sure there any other way than waiting for
the camera to be initialized with an initialization delay after power
up.

Based on this, I'm not concerned about this patch in particular, but
potentially about the series as a whole. I'll comment on individual
patches as applicable.

Regarding this patch, doies the MCU enable high threshold for the
reverse channel as part of its initialization procedure ? Do we have a
full list of what it configures in the MAX9271 ? If so, could we capture
it in a comment in the driver ? That would be very helpful as a
reference.

> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/rdacm20.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> > index 90eb73f0e6e9..f7fd5ae955d0 100644
> > --- a/drivers/media/i2c/rdacm20.c
> > +++ b/drivers/media/i2c/rdacm20.c
> > @@ -541,7 +541,13 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
> >  
> >  	dev_info(dev->dev, "Identified MAX9271 + OV10635 device\n");
> >  
> > -	return 0;
> > +	/*
> > +	 * Set reverse channel high threshold to increase noise immunity.
> > +	 *
> > +	 * This should be compensated by increasing the reverse channel
> > +	 * amplitude on the remote deserializer side.
> > +	 */
> > +	return max9271_set_high_threshold(&dev->serializer, true);
> 
> Does this work 'out of the box' ? I.e. if this patch is applied, I
> assume it is required to remove the regulator delays that I/we have in DT?
> 
> Likewise, does that note mean this patch must also be accompanied by the
> update in max9286 somehow?
> 
> I guess we can't keep 'test bisectability' with this very easily so it
> probably doesn't matter too much, the end result will be the interesting
> part.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> >  }
> >  
> >  static int rdacm20_probe(struct i2c_client *client)

-- 
Regards,

Laurent Pinchart
