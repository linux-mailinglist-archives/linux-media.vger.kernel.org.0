Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 696D7320ED5
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 02:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbhBVA7f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 19:59:35 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54344 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbhBVA70 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 19:59:26 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB8AD58E;
        Mon, 22 Feb 2021 01:58:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613955522;
        bh=323TC+vAFgYdqYeUrXUcysK+7LkTLS6Zx5cPnpw8BHk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=axi49CHfZHV/SY0ehaNGuD0pP6Qk4JTImZFjyF6aU4EueAzBqGbi90duNUxWYwE0Z
         knSau8f+sJl+nLon2vDsVYqupsec/s5hi8zAeuVIGnr1/KWobJLWvZQmL/GQobvUjk
         ec52sihXfNzA5Fssly698HMexTIZAiWdnWMkiKkQ=
Date:   Mon, 22 Feb 2021 02:58:15 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/16] media: i2c: rdacm20: Embedded 'serializer' field
Message-ID: <YDMBp5KV/kytZJSr@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210216174146.106639-3-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Feb 16, 2021 at 06:41:32PM +0100, Jacopo Mondi wrote:
> There's no reason to allocate dynamically the 'serializer' field in
> the driver structure.
> 
> Embed the field and adjust all its users in the driver.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

This requires making the max9271_device structure definition available
to the rdacm20 and other drivers. Given how tightly coupled they are, I
don't think that's an issue, but let's keep in mind in the future that
the camera drivers should not, as a general rule, peek into the
max9271_device structure directly. It may be nice to add a
max9271_init() function that will initialize the client field, and move
the client->addr assignment to max9271_set_address().

Maybe you've already done so in the rest of the series, I'll find out
soon :-) For this patch,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/rdacm20.c | 38 ++++++++++++++++---------------------
>  1 file changed, 16 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index f7fd5ae955d0..4d9bac87cba8 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -312,7 +312,7 @@ static const struct ov10635_reg {
>  
>  struct rdacm20_device {
>  	struct device			*dev;
> -	struct max9271_device		*serializer;
> +	struct max9271_device		serializer;
>  	struct i2c_client		*sensor;
>  	struct v4l2_subdev		sd;
>  	struct media_pad		pad;
> @@ -399,7 +399,7 @@ static int rdacm20_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct rdacm20_device *dev = sd_to_rdacm20(sd);
>  
> -	return max9271_set_serial_link(dev->serializer, enable);
> +	return max9271_set_serial_link(&dev->serializer, enable);
>  }
>  
>  static int rdacm20_enum_mbus_code(struct v4l2_subdev *sd,
> @@ -456,11 +456,11 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  	int ret;
>  
>  	/* Verify communication with the MAX9271: ping to wakeup. */
> -	dev->serializer->client->addr = MAX9271_DEFAULT_ADDR;
> -	i2c_smbus_read_byte(dev->serializer->client);
> +	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> +	i2c_smbus_read_byte(dev->serializer.client);
>  
>  	/* Serial link disabled during config as it needs a valid pixel clock. */
> -	ret = max9271_set_serial_link(dev->serializer, false);
> +	ret = max9271_set_serial_link(&dev->serializer, false);
>  	if (ret)
>  		return ret;
>  
> @@ -468,35 +468,35 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  	 *  Ensure that we have a good link configuration before attempting to
>  	 *  identify the device.
>  	 */
> -	max9271_configure_i2c(dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
> -					       MAX9271_I2CSLVTO_1024US |
> -					       MAX9271_I2CMSTBT_105KBPS);
> +	max9271_configure_i2c(&dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
> +						MAX9271_I2CSLVTO_1024US |
> +						MAX9271_I2CMSTBT_105KBPS);
>  
> -	max9271_configure_gmsl_link(dev->serializer);
> +	max9271_configure_gmsl_link(&dev->serializer);
>  
> -	ret = max9271_verify_id(dev->serializer);
> +	ret = max9271_verify_id(&dev->serializer);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = max9271_set_address(dev->serializer, dev->addrs[0]);
> +	ret = max9271_set_address(&dev->serializer, dev->addrs[0]);
>  	if (ret < 0)
>  		return ret;
> -	dev->serializer->client->addr = dev->addrs[0];
> +	dev->serializer.client->addr = dev->addrs[0];
>  
>  	/*
>  	 * Reset the sensor by cycling the OV10635 reset signal connected to the
>  	 * MAX9271 GPIO1 and verify communication with the OV10635.
>  	 */
> -	ret = max9271_enable_gpios(dev->serializer, MAX9271_GPIO1OUT);
> +	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>  	if (ret)
>  		return ret;
>  
> -	ret = max9271_clear_gpios(dev->serializer, MAX9271_GPIO1OUT);
> +	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>  	if (ret)
>  		return ret;
>  	usleep_range(10000, 15000);
>  
> -	ret = max9271_set_gpios(dev->serializer, MAX9271_GPIO1OUT);
> +	ret = max9271_set_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>  	if (ret)
>  		return ret;
>  	usleep_range(10000, 15000);
> @@ -560,13 +560,7 @@ static int rdacm20_probe(struct i2c_client *client)
>  	if (!dev)
>  		return -ENOMEM;
>  	dev->dev = &client->dev;
> -
> -	dev->serializer = devm_kzalloc(&client->dev, sizeof(*dev->serializer),
> -				       GFP_KERNEL);
> -	if (!dev->serializer)
> -		return -ENOMEM;
> -
> -	dev->serializer->client = client;
> +	dev->serializer.client = client;
>  
>  	ret = of_property_read_u32_array(client->dev.of_node, "reg",
>  					 dev->addrs, 2);

-- 
Regards,

Laurent Pinchart
