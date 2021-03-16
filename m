Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B5833DD64
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 20:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240372AbhCPTY6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 15:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240371AbhCPTYl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 15:24:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89008C06174A;
        Tue, 16 Mar 2021 12:24:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EED088C8;
        Tue, 16 Mar 2021 20:24:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615922680;
        bh=8IOV9swkrnF2YntaMgVClYDlrliiv5d39VZFWxuasgY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ADlB/ful233Uxf4OhdAYcDSV382Z7ChN1L8+YnD9HqIXosdb41veNcIn6x816wfIK
         N078BmT6lK2ZC6Nobx5juZXZug7iY2kK0nF28TG682+XJfSl6rSIA7f/LKfRMLbzOE
         7Yh1Nmx70W8dA2jfkBos+p98VH9y6BfDMUQp6kjU=
Date:   Tue, 16 Mar 2021 21:24:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/18] media: i2c: rdacm20: Enable noise immunity
Message-ID: <YFEF0/ev7bJ8ghN6@pendragon.ideasonboard.com>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-3-jacopo+renesas@jmondi.org>
 <YE/TlmrLV4ejOjlF@pendragon.ideasonboard.com>
 <20210316125607.lxhrgzahxvxfy6ll@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210316125607.lxhrgzahxvxfy6ll@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Mar 16, 2021 at 01:56:07PM +0100, Jacopo Mondi wrote:
> On Mon, Mar 15, 2021 at 11:37:26PM +0200, Laurent Pinchart wrote:
> > On Mon, Mar 15, 2021 at 02:14:56PM +0100, Jacopo Mondi wrote:
> > > Enable the noise immunity threshold at the end of the rdacm20
> > > initialization routine.
> > >
> > > The rdacm20 camera module has been so far tested with a startup
> > > delay that allowed the embedded MCU to program the serializer. If
> > > the initialization routine is run before the MCU programs the
> > > serializer and the image sensor and their addresses gets changed
> > > by the rdacm20 driver it is required to manually enable the noise
> > > immunity threshold to make the communication on the control channel
> > > more reliable.
> >
> > I'm still worried by the race with the MCU. Any update on dumping the
> > MCU configuration to check what it initializes ?
> 
> Not yet, you're right ...
> 
> I mainly focused on testing with rdacm21, what if I strip the rdacm20
> changes out from this series ? I will have to keep the init()
> operation introduction to maintain compatibility with max9286 changes,
> and in case of no regressions, we can keep the 8 seconds delay in the
> .dtsi. However it will break upstream support on Eagle for rdacm20 as
> we don't have a regulator where to insert the startup delay there, and
> a downstream patch that waits for 8 seconds in the deserializer driver
> should be used instead...

I don't think the rdacm20 changes need to wait. Even this one could be
merged as-is, as long as we consider it to be a temporary workaround and
don't build anything on top that would make it more difficult to address
the issue properly (a TODO comment in the code could help).

> > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/media/i2c/rdacm20.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> > > index 90eb73f0e6e9..f7fd5ae955d0 100644
> > > --- a/drivers/media/i2c/rdacm20.c
> > > +++ b/drivers/media/i2c/rdacm20.c
> > > @@ -541,7 +541,13 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
> > >
> > >  	dev_info(dev->dev, "Identified MAX9271 + OV10635 device\n");
> > >
> > > -	return 0;
> > > +	/*
> > > +	 * Set reverse channel high threshold to increase noise immunity.
> > > +	 *
> > > +	 * This should be compensated by increasing the reverse channel
> > > +	 * amplitude on the remote deserializer side.
> > > +	 */
> > > +	return max9271_set_high_threshold(&dev->serializer, true);
> > >  }
> > >
> > >  static int rdacm20_probe(struct i2c_client *client)

-- 
Regards,

Laurent Pinchart
