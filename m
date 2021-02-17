Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3151331D9CD
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 13:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbhBQM5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 07:57:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbhBQM5j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 07:57:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBF3C061574;
        Wed, 17 Feb 2021 04:56:59 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B09F98C4;
        Wed, 17 Feb 2021 13:56:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613566615;
        bh=N1iYn7bi2jeqm/vuWmZGkRcnJPc8uFeqeRkupaPeAYA=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TxIcOhXh36VjVYR6mPrJnpDdJb3uhqn8GinjJsBV9g/uUclLkXHUUVljWc74YyBGW
         xMnhmIei5RqqJE6v44y3aZzWjfr5qvd4edpsitf6b9l7YKlGMYeO9wioLC3I9RkCz1
         TOhpNi5uYnsiwb4TAI/f5gq/y5eo4yldso0oZTRM=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 02/16] media: i2c: rdacm20: Embedded 'serializer' field
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-3-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <f1c765b4-e5c4-7bf0-dcbd-65eeefeb3f2d@ideasonboard.com>
Date:   Wed, 17 Feb 2021 12:56:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216174146.106639-3-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 16/02/2021 17:41, Jacopo Mondi wrote:
> There's no reason to allocate dynamically the 'serializer' field in
> the driver structure.
> 
> Embed the field and adjust all its users in the driver.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
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

Every allocation removed is a win.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> -
> -	dev->serializer->client = client;
> +	dev->serializer.client = client;
>  
>  	ret = of_property_read_u32_array(client->dev.of_node, "reg",
>  					 dev->addrs, 2);
> 

