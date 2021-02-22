Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656C4321ADD
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 16:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbhBVPMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 10:12:09 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:57247 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbhBVPMF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 10:12:05 -0500
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E7BB61BF213;
        Mon, 22 Feb 2021 15:11:13 +0000 (UTC)
Date:   Mon, 22 Feb 2021 16:11:41 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/16] media: i2c: rdacm2x: Fix wake up delay
Message-ID: <20210222151141.4cydkhwiw4ylbebj@uno.localdomain>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-8-jacopo+renesas@jmondi.org>
 <3e759da5-9bba-54ae-fe39-a7db2cbbb31c@ideasonboard.com>
 <YDMGfQFKWUq9hyDv@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YDMGfQFKWUq9hyDv@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Mon, Feb 22, 2021 at 03:18:53AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Wed, Feb 17, 2021 at 01:33:01PM +0000, Kieran Bingham wrote:
> > On 16/02/2021 17:41, Jacopo Mondi wrote:
> > > The MAX9271 chip manual prescribes a delay of 5 milliseconds
> > > after the chip exists from low power state.
> > >
> > > Adjust the required delay in the rdacm21 camera module and add it
> > > to the rdacm20 that currently doesn't implement one.
> >
> > This sounds to me like it should be a common function in the max9271 module:
> >
> > >         /* Verify communication with the MAX9271: ping to wakeup. */
> > >         dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> > >         i2c_smbus_read_byte(dev->serializer.client);
> > >         usleep_range(5000, 8000);
> >
> > Especially as that MAX9271_DEFAULT_ADDR should probably be handled
> > directly in the max9271.c file too, and the RDACM's shouldn't care about it.
>
> I think this is a good idea. With this addressed,

The address reprogramming was exactly why I refrained from adding a
function to the max9271 library, as handling of the addresses there
would introduce a precendece order in the function calls, ie the newly
introduced function would require to be called first after a chip
reset and that's something I considered better handled by the camera
driver (even if it wouldn't be suprising a 'wake up' function to be
called first).

please also note that I will next try to make the max9271 a proper i2c
driver so this might be even less relevant that what it is right now

Thanks
   j
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > If we end up moving the max9271 'library' into more of a module/device
> > then this would have to be done in it's 'probe' anyway, so it's likely
> > better handled down there...?
> >
> > But ... it's not essential at this point in the series, so if you want
> > to keep this patch as is,
> >
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 	> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/media/i2c/rdacm20.c | 1 +
> > >  drivers/media/i2c/rdacm21.c | 2 +-
> > >  2 files changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> > > index ea30cc936531..39e4b4241870 100644
> > > --- a/drivers/media/i2c/rdacm20.c
> > > +++ b/drivers/media/i2c/rdacm20.c
> > > @@ -460,6 +460,7 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
> > >  	/* Verify communication with the MAX9271: ping to wakeup. */
> > >  	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> > >  	i2c_smbus_read_byte(dev->serializer.client);
> > > +	usleep_range(5000, 8000);
> > >
> > >  	/* Serial link disabled during config as it needs a valid pixel clock. */
> > >  	ret = max9271_set_serial_link(&dev->serializer, false);
> > > diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> > > index 179d107f494c..b22a2ca5340b 100644
> > > --- a/drivers/media/i2c/rdacm21.c
> > > +++ b/drivers/media/i2c/rdacm21.c
> > > @@ -453,7 +453,7 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
> > >  	/* Verify communication with the MAX9271: ping to wakeup. */
> > >  	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> > >  	i2c_smbus_read_byte(dev->serializer.client);
> > > -	usleep_range(3000, 5000);
> > > +	usleep_range(5000, 8000);
> > >
> > >  	/* Enable reverse channel and disable the serial link. */
> > >  	ret = max9271_set_serial_link(&dev->serializer, false);
>
> --
> Regards,
>
> Laurent Pinchart
