Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AADF3AAE9B
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 10:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhFQIVy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 04:21:54 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:49377 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbhFQIVx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 04:21:53 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5E077240002;
        Thu, 17 Jun 2021 08:19:41 +0000 (UTC)
Date:   Thu, 17 Jun 2021 10:20:30 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 12/15] media: i2c: rdacm20: Embed 'serializer' field
Message-ID: <20210617082030.lgtr3thsngt3zhem@uno.localdomain>
References: <20210616124616.49249-1-jacopo+renesas@jmondi.org>
 <20210616124616.49249-13-jacopo+renesas@jmondi.org>
 <YMqTyFvxer0vjsKT@pendragon.ideasonboard.com>
 <1e6e5cd0-82b1-db7a-ec70-ebb8831c11c4@xs4all.nl>
 <20210617074222.4lbcewsydre4b2nb@uno.localdomain>
 <1c460f30-91d3-25a3-78dd-7108bfa24d7c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1c460f30-91d3-25a3-78dd-7108bfa24d7c@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Thu, Jun 17, 2021 at 10:12:26AM +0200, Hans Verkuil wrote:
> On 17/06/2021 09:42, Jacopo Mondi wrote:
> > Hello,
> >
> > On Thu, Jun 17, 2021 at 08:18:42AM +0200, Hans Verkuil wrote:
> >> On 17/06/2021 02:14, Laurent Pinchart wrote:
> >>> Hi Jacopo,
> >>>
> >>> Thank you for the patch.
> >>>
> >>> This should be moved before 11/15 to avoid a bisection breakage (or
> >>> 11/15 should be fixed, and this patch updated accordingly).
> >>
> >> Good catch!
> >
> > Good catch indeed... Sorry about this I shuffled patches around
> > multiple times and missed this one
> >
> >>
> >> Jacopo, I dropped the PR I made. It you just want to swap patch 11 and 12,
> >> then I can do that, if you want more extensive changes, then I need a v6.
> >>
> >> Let me know what you want.
> >
> > I think swapping 11 and 12 is enough, thanks for handling it.
> > (BTW there's one additional tag from Kieran to collect which is not in
> > v5. Would you like a v6 for that ?)
>
> Updated the PR and added Kieran's tag. So no need for you to do anything.

Thanks a lot then and sorry for hiccup

>
> Regards,
>
> 	Hans
>
> >
> > Thanks
> >   j
> >
> >>
> >> 	Hans
> >>
> >>>
> >>> On Wed, Jun 16, 2021 at 02:46:13PM +0200, Jacopo Mondi wrote:
> >>>> There's no reason to allocate dynamically the 'serializer' field in
> >>>> the driver structure.
> >>>>
> >>>> Embed the field and adjust all its users in the driver.
> >>>>
> >>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>> ---
> >>>>  drivers/media/i2c/rdacm20.c | 36 +++++++++++++++---------------------
> >>>>  1 file changed, 15 insertions(+), 21 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> >>>> index 5e0314a2b1ca..029af8fd7485 100644
> >>>> --- a/drivers/media/i2c/rdacm20.c
> >>>> +++ b/drivers/media/i2c/rdacm20.c
> >>>> @@ -312,7 +312,7 @@ static const struct ov10635_reg {
> >>>>
> >>>>  struct rdacm20_device {
> >>>>  	struct device			*dev;
> >>>> -	struct max9271_device		*serializer;
> >>>> +	struct max9271_device		serializer;
> >>>>  	struct i2c_client		*sensor;
> >>>>  	struct v4l2_subdev		sd;
> >>>>  	struct media_pad		pad;
> >>>> @@ -399,7 +399,7 @@ static int rdacm20_s_stream(struct v4l2_subdev *sd, int enable)
> >>>>  {
> >>>>  	struct rdacm20_device *dev = sd_to_rdacm20(sd);
> >>>>
> >>>> -	return max9271_set_serial_link(dev->serializer, enable);
> >>>> +	return max9271_set_serial_link(&dev->serializer, enable);
> >>>>  }
> >>>>
> >>>>  static int rdacm20_enum_mbus_code(struct v4l2_subdev *sd,
> >>>> @@ -455,10 +455,10 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
> >>>>  	unsigned int retry = 3;
> >>>>  	int ret;
> >>>>
> >>>> -	max9271_wake_up(dev->serializer);
> >>>> +	max9271_wake_up(&dev->serializer);
> >>>>
> >>>>  	/* Serial link disabled during config as it needs a valid pixel clock. */
> >>>> -	ret = max9271_set_serial_link(dev->serializer, false);
> >>>> +	ret = max9271_set_serial_link(&dev->serializer, false);
> >>>>  	if (ret)
> >>>>  		return ret;
> >>>>
> >>>> @@ -466,35 +466,35 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
> >>>>  	 *  Ensure that we have a good link configuration before attempting to
> >>>>  	 *  identify the device.
> >>>>  	 */
> >>>> -	max9271_configure_i2c(dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
> >>>> -					       MAX9271_I2CSLVTO_1024US |
> >>>> -					       MAX9271_I2CMSTBT_105KBPS);
> >>>> +	max9271_configure_i2c(&dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
> >>>> +						MAX9271_I2CSLVTO_1024US |
> >>>> +						MAX9271_I2CMSTBT_105KBPS);
> >>>>
> >>>> -	max9271_configure_gmsl_link(dev->serializer);
> >>>> +	max9271_configure_gmsl_link(&dev->serializer);
> >>>>
> >>>> -	ret = max9271_verify_id(dev->serializer);
> >>>> +	ret = max9271_verify_id(&dev->serializer);
> >>>>  	if (ret < 0)
> >>>>  		return ret;
> >>>>
> >>>> -	ret = max9271_set_address(dev->serializer, dev->addrs[0]);
> >>>> +	ret = max9271_set_address(&dev->serializer, dev->addrs[0]);
> >>>>  	if (ret < 0)
> >>>>  		return ret;
> >>>> -	dev->serializer->client->addr = dev->addrs[0];
> >>>> +	dev->serializer.client->addr = dev->addrs[0];
> >>>>
> >>>>  	/*
> >>>>  	 * Reset the sensor by cycling the OV10635 reset signal connected to the
> >>>>  	 * MAX9271 GPIO1 and verify communication with the OV10635.
> >>>>  	 */
> >>>> -	ret = max9271_enable_gpios(dev->serializer, MAX9271_GPIO1OUT);
> >>>> +	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> >>>>  	if (ret)
> >>>>  		return ret;
> >>>>
> >>>> -	ret = max9271_clear_gpios(dev->serializer, MAX9271_GPIO1OUT);
> >>>> +	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> >>>>  	if (ret)
> >>>>  		return ret;
> >>>>  	usleep_range(10000, 15000);
> >>>>
> >>>> -	ret = max9271_set_gpios(dev->serializer, MAX9271_GPIO1OUT);
> >>>> +	ret = max9271_set_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> >>>>  	if (ret)
> >>>>  		return ret;
> >>>>  	usleep_range(10000, 15000);
> >>>> @@ -564,13 +564,7 @@ static int rdacm20_probe(struct i2c_client *client)
> >>>>  	if (!dev)
> >>>>  		return -ENOMEM;
> >>>>  	dev->dev = &client->dev;
> >>>> -
> >>>> -	dev->serializer = devm_kzalloc(&client->dev, sizeof(*dev->serializer),
> >>>> -				       GFP_KERNEL);
> >>>> -	if (!dev->serializer)
> >>>> -		return -ENOMEM;
> >>>> -
> >>>> -	dev->serializer->client = client;
> >>>> +	dev->serializer.client = client;
> >>>>
> >>>>  	ret = of_property_read_u32_array(client->dev.of_node, "reg",
> >>>>  					 dev->addrs, 2);
> >>>
> >>
>
