Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD1B33D46E
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 13:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234034AbhCPM4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 08:56:51 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:51805 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233865AbhCPMzm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 08:55:42 -0400
Received: from uno.localdomain (host-79-22-58-175.retail.telecomitalia.it [79.22.58.175])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9A26524000B;
        Tue, 16 Mar 2021 12:55:36 +0000 (UTC)
Date:   Tue, 16 Mar 2021 13:56:07 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/18] media: i2c: rdacm20: Enable noise immunity
Message-ID: <20210316125607.lxhrgzahxvxfy6ll@uno.localdomain>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-3-jacopo+renesas@jmondi.org>
 <YE/TlmrLV4ejOjlF@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YE/TlmrLV4ejOjlF@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Mar 15, 2021 at 11:37:26PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Mar 15, 2021 at 02:14:56PM +0100, Jacopo Mondi wrote:
> > Enable the noise immunity threshold at the end of the rdacm20
> > initialization routine.
> >
> > The rdacm20 camera module has been so far tested with a startup
> > delay that allowed the embedded MCU to program the serializer. If
> > the initialization routine is run before the MCU programs the
> > serializer and the image sensor and their addresses gets changed
> > by the rdacm20 driver it is required to manually enable the noise
> > immunity threshold to make the communication on the control channel
> > more reliable.
>
> I'm still worried by the race with the MCU. Any update on dumping the
> MCU configuration to check what it initializes ?
>

Not yet, you're right ...

I mainly focused on testing with rdacm21, what if I strip the rdacm20
changes out from this series ? I will have to keep the init()
operation introduction to maintain compatibility with max9286 changes,
and in case of no regressions, we can keep the 8 seconds delay in the
.dtsi. However it will break upstream support on Eagle for rdacm20 as
we don't have a regulator where to insert the startup delay there, and
a downstream patch that waits for 8 seconds in the deserializer driver
should be used instead...

> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
> >  }
> >
> >  static int rdacm20_probe(struct i2c_client *client)
>
> --
> Regards,
>
> Laurent Pinchart
