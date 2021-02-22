Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B69320F45
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 02:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbhBVBx5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 20:53:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbhBVBx4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 20:53:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F631C061574;
        Sun, 21 Feb 2021 17:53:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A52DA517;
        Mon, 22 Feb 2021 02:53:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613958793;
        bh=cZo8VAxkk3xeVoof9QR0VTyYNyYcuhuTFVM0e9anjpU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gw5QBU46pr0Q2rZWMKaRoYLBHMc+AZA7eyyCu/+mx48yV/8RZR+ilNR+3uY+pkCei
         XSV5E9rlM73rAY3QJckkB3ze7zrjtu7yJMgk2zw37ZLw2HNn34aCxtSzsSBE3zBf99
         oc8ANk4VpEDdOgi/W6ZAxYeo0qGOhLcvDgXIGuPw=
Date:   Mon, 22 Feb 2021 03:52:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/16] media: i2c: rdacm2x: Implement .init() subdev op
Message-ID: <YDMOaZUi8Q1vWq9j@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-14-jacopo+renesas@jmondi.org>
 <ce1673db-9ea7-f28c-a22a-0d129c0bff98@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ce1673db-9ea7-f28c-a22a-0d129c0bff98@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On Thu, Feb 18, 2021 at 04:13:14PM +0000, Kieran Bingham wrote:
> On 16/02/2021 17:41, Jacopo Mondi wrote:
> > The current probe() procedure of the RDACM20 and RDACM20 performs
> 
> and RDACM21?
> 
> > initialization of the serializer image sensors and increases the noise
> 
> Of the serializer 'and' image sensors ?
> or perhaps just
> 
> s/serializer/serializer,/ ?
> 
> > immunity threshold as last operation, which is then compensated by the
> 
> as a last operation
> or
> as a final operation
> 
> 
> > remote deserializer by increasing the reverse channel signal amplitude
> > once all remotes have bound.
> > 
> > The probe routine is then run without noise immunity activated which

Maybe s/then/thus/ ? I initially interpreted this as meaning the probe
routine is run after the operations listed above.

> > in noisy environment conditions makes the probe sequence less reliable as
> > the chips configuration requires a relevant amount of i2c transactions.
> 
> s/relevant/relatively high/ ?
> 
> > Break chip initialization in two:
> > - At probe time only configure the serializer's reverse channel with
> >   noise immunity activated, to reduce the number of transactions
> >   performed without noise immunity protection
> > - Move the chips initialization to the .init() core subdev operation to
> >   be invoked by the deserializer after the camera has probed and it has
> >   increased the reverse channel amplitude
> 
> Is this the op you said was deprecated?
> 
> 
> Functionally in this code, it seems fine, but as mentioned on the next
> patch, I suspect it might need squashing to make sure it stays functional...
> 
> I'm not fully sure of the implications of this patch, but your tests
> have reportede that this series is helping a lot with reliability so I
> don't want to block it.
> 
> The code changes themselves look ok, with the following thougts:
> 
>  - If this op/methodology is deprecated it might be harder to get
>    acceptance?

I think we need to propose de-deprecating the operation, which should
include a clear explanation of the valid use cases.

>  - now we have _init and _initialise - should that be made more
>    distinct?
> 
>  - Seeing the duplication of the MAX9271_DEFAULT_ADDR / ping again
>    really makes me want to see that wrapped in the max9271.c ;-)
> 
>  - Likely needs squashed with relevant changes in max9286?

I share the bisectability concerns.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> But even with those thoughts, I don't think this is necessarily wrong so:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/rdacm20.c | 65 ++++++++++++++++++++++---------------
> >  drivers/media/i2c/rdacm21.c | 65 ++++++++++++++++++++++---------------
> >  2 files changed, 78 insertions(+), 52 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> > index 39e4b4241870..0632ef98eea7 100644
> > --- a/drivers/media/i2c/rdacm20.c
> > +++ b/drivers/media/i2c/rdacm20.c
> > @@ -437,36 +437,12 @@ static int rdacm20_get_fmt(struct v4l2_subdev *sd,
> >  	return 0;
> >  }
> >  
> > -static const struct v4l2_subdev_video_ops rdacm20_video_ops = {
> > -	.s_stream	= rdacm20_s_stream,
> > -};
> > -
> > -static const struct v4l2_subdev_pad_ops rdacm20_subdev_pad_ops = {
> > -	.enum_mbus_code = rdacm20_enum_mbus_code,
> > -	.get_fmt	= rdacm20_get_fmt,
> > -	.set_fmt	= rdacm20_get_fmt,
> > -};
> > -
> > -static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
> > -	.video		= &rdacm20_video_ops,
> > -	.pad		= &rdacm20_subdev_pad_ops,
> > -};
> > -
> > -static int rdacm20_initialize(struct rdacm20_device *dev)
> > +static int rdacm20_init(struct v4l2_subdev *sd, unsigned int val)
> >  {
> > +	struct rdacm20_device *dev = sd_to_rdacm20(sd);
> >  	unsigned int i;
> >  	int ret;
> >  
> > -	/* Verify communication with the MAX9271: ping to wakeup. */
> > -	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> > -	i2c_smbus_read_byte(dev->serializer.client);
> > -	usleep_range(5000, 8000);
> > -
> > -	/* Serial link disabled during config as it needs a valid pixel clock. */
> > -	ret = max9271_set_serial_link(&dev->serializer, false);
> > -	if (ret)
> > -		return ret;
> > -
> >  	/*
> >  	 *  Ensure that we have a good link configuration before attempting to
> >  	 *  identify the device.
> > @@ -537,6 +513,43 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
> >  
> >  	dev_info(dev->dev, "Identified RDACM20 camera module\n");
> >  
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_core_ops rdacm20_core_ops = {
> > +	.init           = rdacm20_init,
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops rdacm20_video_ops = {
> > +	.s_stream	= rdacm20_s_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops rdacm20_subdev_pad_ops = {
> > +	.enum_mbus_code = rdacm20_enum_mbus_code,
> > +	.get_fmt	= rdacm20_get_fmt,
> > +	.set_fmt	= rdacm20_get_fmt,
> > +};
> > +
> > +static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
> > +	.core		= &rdacm20_core_ops,
> > +	.video		= &rdacm20_video_ops,
> > +	.pad		= &rdacm20_subdev_pad_ops,
> > +};
> > +
> > +static int rdacm20_initialize(struct rdacm20_device *dev)
> > +{
> > +	int ret;
> > +
> > +	/* Verify communication with the MAX9271: ping to wakeup. */
> > +	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> > +	i2c_smbus_read_byte(dev->serializer.client);
> > +	usleep_range(5000, 8000);
> > +
> > +	/* Serial link disabled during config as it needs a valid pixel clock. */
> > +	ret = max9271_set_serial_link(&dev->serializer, false);
> > +	if (ret)
> > +		return ret;
> > +
> >  	/*
> >  	 * Set reverse channel high threshold to increase noise immunity.
> >  	 *
> > diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> > index c420a6b96879..80b6f16f87a8 100644
> > --- a/drivers/media/i2c/rdacm21.c
> > +++ b/drivers/media/i2c/rdacm21.c
> > @@ -314,21 +314,6 @@ static int rdacm21_get_fmt(struct v4l2_subdev *sd,
> >  	return 0;
> >  }
> >  
> > -static const struct v4l2_subdev_video_ops rdacm21_video_ops = {
> > -	.s_stream	= rdacm21_s_stream,
> > -};
> > -
> > -static const struct v4l2_subdev_pad_ops rdacm21_subdev_pad_ops = {
> > -	.enum_mbus_code = rdacm21_enum_mbus_code,
> > -	.get_fmt	= rdacm21_get_fmt,
> > -	.set_fmt	= rdacm21_get_fmt,
> > -};
> > -
> > -static const struct v4l2_subdev_ops rdacm21_subdev_ops = {
> > -	.video		= &rdacm21_video_ops,
> > -	.pad		= &rdacm21_subdev_pad_ops,
> > -};
> > -
> >  static int ov10640_initialize(struct rdacm21_device *dev)
> >  {
> >  	u8 val;
> > @@ -448,20 +433,11 @@ static int ov490_initialize(struct rdacm21_device *dev)
> >  	return 0;
> >  }
> >  
> > -static int rdacm21_initialize(struct rdacm21_device *dev)
> > +static int rdacm21_init(struct v4l2_subdev *sd, unsigned int val)
> >  {
> > +	struct rdacm21_device *dev = sd_to_rdacm21(sd);
> >  	int ret;
> >  
> > -	/* Verify communication with the MAX9271: ping to wakeup. */
> > -	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> > -	i2c_smbus_read_byte(dev->serializer.client);
> > -	usleep_range(5000, 8000);
> > -
> > -	/* Enable reverse channel and disable the serial link. */
> > -	ret = max9271_set_serial_link(&dev->serializer, false);
> > -	if (ret)
> > -		return ret;
> > -
> >  	/* Configure I2C bus at 105Kbps speed and configure GMSL. */
> >  	ret = max9271_configure_i2c(&dev->serializer,
> >  				    MAX9271_I2CSLVSH_469NS_234NS |
> > @@ -508,6 +484,43 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
> >  	if (ret)
> >  		return ret;
> >  
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_core_ops rdacm21_core_ops = {
> > +	.init		= rdacm21_init,
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops rdacm21_video_ops = {
> > +	.s_stream	= rdacm21_s_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops rdacm21_subdev_pad_ops = {
> > +	.enum_mbus_code = rdacm21_enum_mbus_code,
> > +	.get_fmt	= rdacm21_get_fmt,
> > +	.set_fmt	= rdacm21_get_fmt,
> > +};
> > +
> > +static const struct v4l2_subdev_ops rdacm21_subdev_ops = {
> > +	.core		= &rdacm21_core_ops,
> > +	.video		= &rdacm21_video_ops,
> > +	.pad		= &rdacm21_subdev_pad_ops,
> > +};
> > +
> > +static int rdacm21_initialize(struct rdacm21_device *dev)
> > +{
> > +	int ret;
> > +
> > +	/* Verify communication with the MAX9271: ping to wakeup. */
> > +	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> > +	i2c_smbus_read_byte(dev->serializer.client);
> > +	usleep_range(5000, 8000);
> > +
> > +	/* Enable reverse channel and disable the serial link. */
> > +	ret = max9271_set_serial_link(&dev->serializer, false);
> > +	if (ret)
> > +		return ret;
> > +
> >  	/*
> >  	 * Set reverse channel high threshold to increase noise immunity.
> >  	 *

-- 
Regards,

Laurent Pinchart
