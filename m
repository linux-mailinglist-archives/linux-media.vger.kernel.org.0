Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAAAF34A623
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 12:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbhCZLKv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 07:10:51 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:60947 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbhCZLKi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 07:10:38 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 41CA820000A;
        Fri, 26 Mar 2021 11:10:30 +0000 (UTC)
Date:   Fri, 26 Mar 2021 12:11:03 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 19/19] media: i2c: rdacm20: Re-work ov10635 reset
Message-ID: <20210326111103.uaiqtmodwqpm4acb@uno.localdomain>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
 <20210319164148.199192-20-jacopo+renesas@jmondi.org>
 <YFYhqXnxXIFJTYTM@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YFYhqXnxXIFJTYTM@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Mar 20, 2021 at 06:24:09PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Fri, Mar 19, 2021 at 05:41:48PM +0100, Jacopo Mondi wrote:
> > The OV10635 image sensor embedded in the camera module is currently
> > reset after the MAX9271 initialization with two long delays that were
> > most probably not correctly characterized.
> >
> > Re-work the image sensor reset procedure by holding the chip in reset
> > during the MAX9271 configuration, removing the long sleep delays and
> > only wait after the chip exits from reset for 350-500 microseconds
> > interval, which is larger than the minimum (2048 * (1 / XVCLK)) timeout
> > characterized in the chip manual.
> >
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/rdacm20.c | 29 +++++++++++++++++------------
> >  1 file changed, 17 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> > index 7ed3866b5335..7ba2d0249da8 100644
> > --- a/drivers/media/i2c/rdacm20.c
> > +++ b/drivers/media/i2c/rdacm20.c
> > @@ -454,6 +454,19 @@ static int rdacm20_init(struct v4l2_subdev *sd, unsigned int val)
> >  	if (ret)
> >  		return ret;
> >
> > +	/*
> > +	 * Hold OV10635 in reset during max9271 configuration. The reset signal
> > +	 * has to be asserted for at least 200 microseconds.
> > +	 */
> > +	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>
> enable and clear is very cnonfusing. How about mimicking the GPIO API,
> with direction_input(), direction_output() and set_value() functions ?
> It would also be nice if the polarity could be handled in a nicer way.
> There's no GPIO request API here, but maybe a max9271_gpio_set_flags() ?
>

Probably, that's an unrelated rework that could go on top unrelated to
this patch

> > +	if (ret)
> > +		return ret;
> > +	usleep_range(200, 500);
> > +
> >  	ret = max9271_configure_gmsl_link(&dev->serializer);
> >  	if (ret)
> >  		return ret;
> > @@ -468,22 +481,14 @@ static int rdacm20_init(struct v4l2_subdev *sd, unsigned int val)
> >  	dev->serializer.client->addr = dev->addrs[0];
> >
> >  	/*
> > -	 * Reset the sensor by cycling the OV10635 reset signal connected to the
> > -	 * MAX9271 GPIO1 and verify communication with the OV10635.
> > +	 * Release ov10635 from reset and initialize it. The image sensor
> > +	 * requires at least 2048 XVCLK cycles (85 micro-seconds at 24MHz)
> > +	 * before being available. Stay safe and wait up to 500 micro-seconds.
> >  	 */
> > -	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> > -	if (ret)
> > -		return ret;
> > -
> > -	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> > -	if (ret)
> > -		return ret;
> > -	usleep_range(10000, 15000);
> > -
> >  	ret = max9271_set_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> >  	if (ret)
> >  		return ret;
> > -	usleep_range(10000, 15000);
> > +	usleep_range(100, 500);
> >
> >  	for (i = 0; i < OV10635_PID_TIMEOUT; ++i) {
> >  		ret = ov10635_read16(dev, OV10635_PID);
>
> --
> Regards,
>
> Laurent Pinchart
