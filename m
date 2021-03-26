Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 156F634A667
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 12:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbhCZLWO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 07:22:14 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:46721 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbhCZLWM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 07:22:12 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 231141C0004;
        Fri, 26 Mar 2021 11:22:07 +0000 (UTC)
Date:   Fri, 26 Mar 2021 12:22:40 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/19] media: i2c: rdacm21: Add dealy after OV490 reset
Message-ID: <20210326112240.eqoo7lpwhbmtaqq5@uno.localdomain>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
 <20210319164148.199192-12-jacopo+renesas@jmondi.org>
 <99971a13-4d02-2255-6653-569915da181d@ideasonboard.com>
 <YFYaMh832WYlsR9u@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YFYaMh832WYlsR9u@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Kieran,

On Sat, Mar 20, 2021 at 05:52:18PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Fri, Mar 19, 2021 at 04:49:44PM +0000, Kieran Bingham wrote:
> > Hi Jacopo,
> >
> > s/dealy/delay/ in $SUBJECT
> >
> > On 19/03/2021 16:41, Jacopo Mondi wrote:
> > > Add a delay after the OV490 chip is put in reset state. The reset
> > > signal shall be held for at least 250 useconds.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/media/i2c/rdacm21.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> > > index babd14b21252..875bec9f7904 100644
> > > --- a/drivers/media/i2c/rdacm21.c
> > > +++ b/drivers/media/i2c/rdacm21.c
> > > @@ -448,7 +448,10 @@ static int rdacm21_init(struct v4l2_subdev *sd, unsigned int val)
> > >  	if (ret)
> > >  		return ret;
> > >
> > > -	/* Enable GPIO1 and hold OV490 in reset during max9271 configuration. */
> > > +	/*
> > > +	 * Enable GPIO1 and hold OV490 in reset during max9271 configuration.
> > > +	 * The reset signal has to be asserted for at least 250 useconds.
> > > +	 */
> > >  	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> > >  	if (ret)
> > >  		return ret;
> > > @@ -456,6 +459,7 @@ static int rdacm21_init(struct v4l2_subdev *sd, unsigned int val)
> > >  	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> > >  	if (ret)
> > >  		return ret;
> > > +	usleep_range(250, 500);
> >
> > Aha, for a second there I thought the comment meant it had to be
> > asserted for 250 uS before clearing it again. But it's 250 uS before
> > using the OV490.

No, it's 250usecond before releasing it. After the OV490 is released
from reset there's a 3-5 milliseconds sleep below.

> >
> > Perhaps possible to update the comment a little, but nothing that matters.
>
> The commit message and comment should match the code, especially given

They do if I'm not mistaken.

> that I'm not sure here which of the two is actually incorrect. I suspect
> the sleep is actually in the wrong location.
>
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> >
> > >  	ret = max9271_configure_gmsl_link(&dev->serializer);
> > >  	if (ret)
> > >
>
> --
> Regards,
>
> Laurent Pinchart
