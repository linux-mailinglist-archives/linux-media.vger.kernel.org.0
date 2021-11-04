Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC68445056
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 09:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbhKDIcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 04:32:48 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:34691 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbhKDIcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 04:32:47 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 070706000E;
        Thu,  4 Nov 2021 08:30:06 +0000 (UTC)
Date:   Thu, 4 Nov 2021 09:30:58 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] media: max9271: Fail loudly on bus read errors
Message-ID: <20211104083058.km27mmkjltygftvg@uno.localdomain>
References: <20211103204654.223699-1-jacopo+renesas@jmondi.org>
 <20211103204654.223699-2-jacopo+renesas@jmondi.org>
 <YYMI2K2VrHAmSRfk@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYMI2K2VrHAmSRfk@oden.dyn.berto.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Wed, Nov 03, 2021 at 11:10:32PM +0100, Niklas Söderlund wrote:
> Hi Jacopo,
>
> Thanks for your work.
>
> On 2021-11-03 21:46:53 +0100, Jacopo Mondi wrote:
> > Read errors were silently going ignored. Fail louder to make sure such
> > errors are visible.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/max9271.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
> > index ff86c8c4ea61..aa9ab6831574 100644
> > --- a/drivers/media/i2c/max9271.c
> > +++ b/drivers/media/i2c/max9271.c
> > @@ -30,7 +30,7 @@ static int max9271_read(struct max9271_device *dev, u8 reg)
> >
> >  	ret = i2c_smbus_read_byte_data(dev->client, reg);
> >  	if (ret < 0)
> > -		dev_dbg(&dev->client->dev,
> > +		dev_err(&dev->client->dev,
>
> This feels a bit illogical as all call sites handles the return code and
> acts accordingly. For some it's OK to fail and for others where it's not
> a dev_err() is reported, for example in max9271_verify_id().
>
> Will this not log error messages in situations where there really is no

Yes, that's the case now with my 2/2 applied.

Basically I started this as pclk_detect was silently failing due to a
sporadic read error, and I was not able to start the camera stream. I
went all the way down from VIN to the very end of the pipeline
increasing log verbosity and then I stumbled on this one.

So yes, call sites handles the error code, but most of them also fail
silently making debug even more painful than usual.

> error? Maybe dev_info() is a better choice if you want to increase
> verbosity?

Yes, we could consider this. However, one could argue that errors in
accessing the bus are anyway errors which is worth reporting, then the
caller might decide if they're fatal or not...

Thanks
   j
>
> >  			"%s: register 0x%02x read failed (%d)\n",
> >  			__func__, reg, ret);
> >
> > --
> > 2.33.1
> >
>
> --
> Regards,
> Niklas Söderlund
