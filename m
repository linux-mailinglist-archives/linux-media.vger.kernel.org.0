Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90064324536
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 21:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235511AbhBXUaS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 15:30:18 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54180 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235116AbhBXUaL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 15:30:11 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E72376F2;
        Wed, 24 Feb 2021 21:29:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614198569;
        bh=xB+t/dbl8MPLz86P0E8LwwNoxS6LpK7iEniBg30Noms=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MBWu8P9qXAZCXJdzxHY+l9g6bFWVhvqsFhEIG7R/7oodjlX6qDoLuwftX9uC1CXVN
         Y03RUgzjBFnNCSyi2mznA+NYTrsuV7PVkHvdXjLvEorN4A9ICiAD9xBNTQLNOvytQ0
         1P1uKizy7Z37+Qs/QXSn8DUzJhLr+nOyKqPvs768=
Date:   Wed, 24 Feb 2021 22:29:01 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/16] media: i2c: rdacm2x: Fix wake up delay
Message-ID: <YDa3DZ/ynR324EuZ@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-8-jacopo+renesas@jmondi.org>
 <3e759da5-9bba-54ae-fe39-a7db2cbbb31c@ideasonboard.com>
 <YDMGfQFKWUq9hyDv@pendragon.ideasonboard.com>
 <20210222151141.4cydkhwiw4ylbebj@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210222151141.4cydkhwiw4ylbebj@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Feb 22, 2021 at 04:11:41PM +0100, Jacopo Mondi wrote:
> On Mon, Feb 22, 2021 at 03:18:53AM +0200, Laurent Pinchart wrote:
> > On Wed, Feb 17, 2021 at 01:33:01PM +0000, Kieran Bingham wrote:
> > > On 16/02/2021 17:41, Jacopo Mondi wrote:
> > > > The MAX9271 chip manual prescribes a delay of 5 milliseconds
> > > > after the chip exists from low power state.
> > > >
> > > > Adjust the required delay in the rdacm21 camera module and add it
> > > > to the rdacm20 that currently doesn't implement one.
> > >
> > > This sounds to me like it should be a common function in the max9271 module:
> > >
> > > >         /* Verify communication with the MAX9271: ping to wakeup. */
> > > >         dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> > > >         i2c_smbus_read_byte(dev->serializer.client);
> > > >         usleep_range(5000, 8000);
> > >
> > > Especially as that MAX9271_DEFAULT_ADDR should probably be handled
> > > directly in the max9271.c file too, and the RDACM's shouldn't care about it.
> >
> > I think this is a good idea. With this addressed,
> 
> The address reprogramming was exactly why I refrained from adding a
> function to the max9271 library, as handling of the addresses there
> would introduce a precendece order in the function calls, ie the newly
> introduced function would require to be called first after a chip
> reset and that's something I considered better handled by the camera
> driver (even if it wouldn't be suprising a 'wake up' function to be
> called first).

I'm not sure this would be an issue, it's fine for library code to set
requirements on how APIs have to be used, including which order
functions have to be called.

> please also note that I will next try to make the max9271 a proper i2c
> driver so this might be even less relevant that what it is right now

Let's see how that works out.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > > If we end up moving the max9271 'library' into more of a module/device
> > > then this would have to be done in it's 'probe' anyway, so it's likely
> > > better handled down there...?
> > >
> > > But ... it's not essential at this point in the series, so if you want
> > > to keep this patch as is,
> > >
> > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > 	> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >  drivers/media/i2c/rdacm20.c | 1 +
> > > >  drivers/media/i2c/rdacm21.c | 2 +-
> > > >  2 files changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> > > > index ea30cc936531..39e4b4241870 100644
> > > > --- a/drivers/media/i2c/rdacm20.c
> > > > +++ b/drivers/media/i2c/rdacm20.c
> > > > @@ -460,6 +460,7 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
> > > >  	/* Verify communication with the MAX9271: ping to wakeup. */
> > > >  	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> > > >  	i2c_smbus_read_byte(dev->serializer.client);
> > > > +	usleep_range(5000, 8000);
> > > >
> > > >  	/* Serial link disabled during config as it needs a valid pixel clock. */
> > > >  	ret = max9271_set_serial_link(&dev->serializer, false);
> > > > diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> > > > index 179d107f494c..b22a2ca5340b 100644
> > > > --- a/drivers/media/i2c/rdacm21.c
> > > > +++ b/drivers/media/i2c/rdacm21.c
> > > > @@ -453,7 +453,7 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
> > > >  	/* Verify communication with the MAX9271: ping to wakeup. */
> > > >  	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> > > >  	i2c_smbus_read_byte(dev->serializer.client);
> > > > -	usleep_range(3000, 5000);
> > > > +	usleep_range(5000, 8000);
> > > >
> > > >  	/* Enable reverse channel and disable the serial link. */
> > > >  	ret = max9271_set_serial_link(&dev->serializer, false);

-- 
Regards,

Laurent Pinchart
