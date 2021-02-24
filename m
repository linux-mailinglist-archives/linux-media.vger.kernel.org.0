Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D3F324553
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 21:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235631AbhBXUgp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 15:36:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbhBXUgo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 15:36:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52ED2C061786;
        Wed, 24 Feb 2021 12:36:04 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 020E76F2;
        Wed, 24 Feb 2021 21:36:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614198961;
        bh=95Gl+LSHpLxdZZF3H9srUIvucB+IGvTAaHED4gu9G3s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uRjfJTtWm0+7KzU+BIlWnRoI80sB8dl5VlY6Mcqx2uRxDxM3nMOxZuqIcK5Kxzp8r
         5b+w25aqa17Zmn0K6+0TO06XiHMZBtunlUprxVvpWGkwECA5bkVQYlRhWY+uawD1OB
         dYPOD9d7Ja6TCgsJvgEMvU+MQFQCaz1jiVdZwMqs=
Date:   Wed, 24 Feb 2021 22:35:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/16] media: i2c: rdacm20: Enable noise immunity
Message-ID: <YDa4leayx0E/AwyX@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-2-jacopo+renesas@jmondi.org>
 <5691f68f-724d-9d6a-9ea8-1e017b305c66@ideasonboard.com>
 <YDL/npLVS7vk3TV7@pendragon.ideasonboard.com>
 <20210222145905.ao4larxjv5tvk3yd@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210222145905.ao4larxjv5tvk3yd@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Feb 22, 2021 at 03:59:05PM +0100, Jacopo Mondi wrote:
> On Mon, Feb 22, 2021 at 02:49:34AM +0200, Laurent Pinchart wrote:
> > On Wed, Feb 17, 2021 at 12:55:19PM +0000, Kieran Bingham wrote:
> > > On 16/02/2021 17:41, Jacopo Mondi wrote:
> > > > Enable the noise immunity threshold at the end of the rdacm20
> > > > initialization routine.
> > > >
> > > > The rdcam20 camera module has been so far tested with a startup
> >
> > s/rdcam20/rdacm20/
> >
> > > > delay that allowed the embedded MCU to program the serializer. If
> > > > the initialization routine is run before the MCU programs the
> > > > serializer and the image sensor and their addresses gets changed
> > > > by the rdacm20 driver it is required to manually enable the noise
> > > > immunity threshold to make the communication on the control channel
> > > > more reliable.
> > >
> > > Oh, this is interesting, ... booting up without the delays would be ...
> > > much nicer.
> >
> > I second that, but I'm a bit worried. The MCU has caused us more pain
> > than gain, the best way to fix it may be with a desoldering station ;-)
> 
> I wish we could
> 
> > Jokes aside, if we want to start initializing with the serializer before
> > the MCU completes its initialization, then we'll have a racy process,
> > with two I2C masters configuring the same device. I don't think anything
> > good can come out of that :-S
> >
> > Taking into account the fact that on some platforms we'll want to
> > implement power management for the cameras, disabling power (possibly
> > individually) when the cameras are not in use, we'll have to handle the
> > race carefully, and I'm not sure there any other way than waiting for
> > the camera to be initialized with an initialization delay after power
> > up.
> 
> Currently I really cannot tell how long the intialization takes, and
> we downstream inserted a 'long enough' 8 seconds delay to accommodate
> that, which seems one of those solution that work as long as they
> don't work anymore.
> 
> One thing to notices is that I tried to interface with the MCU to read
> its most basic parameters, like the number of i2c messages sent to the
> serializer before programming the image sensor and that's just a mere 3
> messages. What I noticed was also that I was not able to talk to the MCU
> for 1.5 seconds, which I'm not sure it's because of a startup delay of
> because of cross-talks. If that was a startup delay, it would really be
> convenient, as we could change the chip addresses immediately and have
> the MCU programming being sent to a non-existing id.

Scary :-)

> > Based on this, I'm not concerned about this patch in particular, but
> > potentially about the series as a whole. I'll comment on individual
> > patches as applicable.
> >
> > Regarding this patch, doies the MCU enable high threshold for the
> > reverse channel as part of its initialization procedure ? Do we have a
> 
> we always assumed so, as it was not required for the RDACM20 to start
> with a de-serializer low power amplitude and increase it after the
> camera has probed like we have to do for the un-programmed RDACM21
> with the intiial startup delay (the custom maxim,reverse-channel-microvolt
> property serves this purpose)
> 
> As a confirmation, if I remove the delay and probe the camera before
> the MCU gets to program it, I need to enable the threshold manually
> as otherwise I lose the ability to stream from cameras.
> 
> All in all, my best bet is that without the delay we get to probe and
> re-program the serializer address before the MCU starts it programming
> phase. All of this is without synchronization, without any known delay
> being described in the camera manual, all based on empirical
> deduction and repeated testing. I'll keep the opinion on GMSL as a
> techology for myself here, but I think this solution is in-line with
> the global quality level of the systems we're working with.

Your opinion may have transpired from that last sentence.

> > full list of what it configures in the MAX9271 ? If so, could we capture
> 
> Not at the moment but I can investigate dumping that from the MCU as
> I've been able to get its 'status' and a command to get its content
> should be available

Thanks, that would be very helpful.

> > it in a comment in the driver ? That would be very helpful as a
> > reference.
> >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >  drivers/media/i2c/rdacm20.c | 8 +++++++-
> > > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> > > > index 90eb73f0e6e9..f7fd5ae955d0 100644
> > > > --- a/drivers/media/i2c/rdacm20.c
> > > > +++ b/drivers/media/i2c/rdacm20.c
> > > > @@ -541,7 +541,13 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
> > > >
> > > >  	dev_info(dev->dev, "Identified MAX9271 + OV10635 device\n");
> > > >
> > > > -	return 0;
> > > > +	/*
> > > > +	 * Set reverse channel high threshold to increase noise immunity.
> > > > +	 *
> > > > +	 * This should be compensated by increasing the reverse channel
> > > > +	 * amplitude on the remote deserializer side.
> > > > +	 */
> > > > +	return max9271_set_high_threshold(&dev->serializer, true);
> > >
> > > Does this work 'out of the box' ? I.e. if this patch is applied, I
> > > assume it is required to remove the regulator delays that I/we have in DT?
> 
> It doesn't hurt, as if this happen -after- the MCU has programmed the
> chip, we're just re-enabling something that was enabled (remember
> RDACM20 goes with maxim,reverse-channel-microvol=170 when the dealy
> was inserted).
> 
> Without the dealy it could be operated as the RDACM21 (start low,
> probe+enable threshold, set high).
> 
> > > Likewise, does that note mean this patch must also be accompanied by the
> > > update in max9286 somehow?
> 
> Ee have a DT property to control this already, and the delay+channel
> amplitude can be controlled from DTS entirely.
> 
> > > I guess we can't keep 'test bisectability' with this very easily so it
> > > probably doesn't matter too much, the end result will be the interesting
> > > part.
> > >
> > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >
> > > >  }
> > > >
> > > >  static int rdacm20_probe(struct i2c_client *client)

-- 
Regards,

Laurent Pinchart
