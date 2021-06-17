Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0372A3AABC1
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 08:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhFQGU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 02:20:56 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:38111 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229515AbhFQGUz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 02:20:55 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id tlMQlmuimhg8ZtlMTlShud; Thu, 17 Jun 2021 08:18:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623910726; bh=6HmWS6ynFzcb3UWknvmVlnIFSb1h9WntxYhD/ZWpF34=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qBJReWXZezuzQcDtMbd0KgJ+8DwUXaWEeXL8Ja7ZhY5UPvjQBnvX6KJV1SAfn5Vob
         ObcXaK+rhtmyxTUN4T/gdB5Pkp0hBEXUWvc3zQY1zZj/ur3ajp6DIVNPkAuXjMWSzB
         lYR9lBUjjk8Gb50il+fIfOvRi2QjNsf/n2xdbPBkv6R0yRo1NqVw5mngajPGeC2Mm7
         nTJy+egUQWAwNKerwbaTMjlBN9jDqqJUfN92U4TIYR8AJ7S1BGPXmIfNv3m7Z1MTLr
         MZFeQ+6wtAv03dbwHNfclY21Zk1ZqDYoFw15ezWzdtLROd1PnJHc9Wo5/iWw8yi03V
         dBiUMcMFUgLnA==
Subject: Re: [PATCH v5 12/15] media: i2c: rdacm20: Embed 'serializer' field
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210616124616.49249-1-jacopo+renesas@jmondi.org>
 <20210616124616.49249-13-jacopo+renesas@jmondi.org>
 <YMqTyFvxer0vjsKT@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1e6e5cd0-82b1-db7a-ec70-ebb8831c11c4@xs4all.nl>
Date:   Thu, 17 Jun 2021 08:18:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YMqTyFvxer0vjsKT@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKc9TqgYXNnwKK3A9jTVqfgmUnrCdOL1KDLjWDjAPZOnmsVcOjCr/buMwniKu0PgQ51CsqEVlLpC9qzgVKJpF6FvIWRQnv/D4eqDbsxmGLQwwsgWWa6b
 wXDcuqMiS7M6HHFoXweEyq6yFynYqAHwcnHC3NsC7Zv4ZTVFVYcCRI8hC/pGeHe1DRRGQAAeR6gOimTu7i9+QhmSxxJKZZpnW1fGgLPP1JUAUx9B1S2KQG3M
 8PMobmPj+r7kkKQT5ng27G1l9vYg8usiBvGRgZpU5FYP+xBk4vtJP/bNMpqtBSHA1H8RTv2UiZZxACabgNnkTMy94H183DhS5lY+72BnPhNJoJ8TjUYGcfSx
 /OF+Wp+4rfeupzZjXwLpPd3GDW5WzvqHM03BBls8aI/XWe7HPEdAhkQ5Jc1fjBPSuTdD62p942ymJP1pVa1xT2V/es+VxtNFIp3nF3KRg3yb4ltCt/yxPxJc
 ZH1Vq9zj/L0k7N0JOO59eMhZtH/bYBBptbnMg16sHT+woS5DQ869CyupXRXnqK0ZF/cGCfffhcngtmiMy/KE65ANxn0x0H/lZlCP7Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/06/2021 02:14, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> This should be moved before 11/15 to avoid a bisection breakage (or
> 11/15 should be fixed, and this patch updated accordingly).

Good catch!

Jacopo, I dropped the PR I made. It you just want to swap patch 11 and 12,
then I can do that, if you want more extensive changes, then I need a v6.

Let me know what you want.

	Hans

> 
> On Wed, Jun 16, 2021 at 02:46:13PM +0200, Jacopo Mondi wrote:
>> There's no reason to allocate dynamically the 'serializer' field in
>> the driver structure.
>>
>> Embed the field and adjust all its users in the driver.
>>
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>  drivers/media/i2c/rdacm20.c | 36 +++++++++++++++---------------------
>>  1 file changed, 15 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
>> index 5e0314a2b1ca..029af8fd7485 100644
>> --- a/drivers/media/i2c/rdacm20.c
>> +++ b/drivers/media/i2c/rdacm20.c
>> @@ -312,7 +312,7 @@ static const struct ov10635_reg {
>>  
>>  struct rdacm20_device {
>>  	struct device			*dev;
>> -	struct max9271_device		*serializer;
>> +	struct max9271_device		serializer;
>>  	struct i2c_client		*sensor;
>>  	struct v4l2_subdev		sd;
>>  	struct media_pad		pad;
>> @@ -399,7 +399,7 @@ static int rdacm20_s_stream(struct v4l2_subdev *sd, int enable)
>>  {
>>  	struct rdacm20_device *dev = sd_to_rdacm20(sd);
>>  
>> -	return max9271_set_serial_link(dev->serializer, enable);
>> +	return max9271_set_serial_link(&dev->serializer, enable);
>>  }
>>  
>>  static int rdacm20_enum_mbus_code(struct v4l2_subdev *sd,
>> @@ -455,10 +455,10 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>>  	unsigned int retry = 3;
>>  	int ret;
>>  
>> -	max9271_wake_up(dev->serializer);
>> +	max9271_wake_up(&dev->serializer);
>>  
>>  	/* Serial link disabled during config as it needs a valid pixel clock. */
>> -	ret = max9271_set_serial_link(dev->serializer, false);
>> +	ret = max9271_set_serial_link(&dev->serializer, false);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -466,35 +466,35 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>>  	 *  Ensure that we have a good link configuration before attempting to
>>  	 *  identify the device.
>>  	 */
>> -	max9271_configure_i2c(dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
>> -					       MAX9271_I2CSLVTO_1024US |
>> -					       MAX9271_I2CMSTBT_105KBPS);
>> +	max9271_configure_i2c(&dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
>> +						MAX9271_I2CSLVTO_1024US |
>> +						MAX9271_I2CMSTBT_105KBPS);
>>  
>> -	max9271_configure_gmsl_link(dev->serializer);
>> +	max9271_configure_gmsl_link(&dev->serializer);
>>  
>> -	ret = max9271_verify_id(dev->serializer);
>> +	ret = max9271_verify_id(&dev->serializer);
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	ret = max9271_set_address(dev->serializer, dev->addrs[0]);
>> +	ret = max9271_set_address(&dev->serializer, dev->addrs[0]);
>>  	if (ret < 0)
>>  		return ret;
>> -	dev->serializer->client->addr = dev->addrs[0];
>> +	dev->serializer.client->addr = dev->addrs[0];
>>  
>>  	/*
>>  	 * Reset the sensor by cycling the OV10635 reset signal connected to the
>>  	 * MAX9271 GPIO1 and verify communication with the OV10635.
>>  	 */
>> -	ret = max9271_enable_gpios(dev->serializer, MAX9271_GPIO1OUT);
>> +	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>>  	if (ret)
>>  		return ret;
>>  
>> -	ret = max9271_clear_gpios(dev->serializer, MAX9271_GPIO1OUT);
>> +	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>>  	if (ret)
>>  		return ret;
>>  	usleep_range(10000, 15000);
>>  
>> -	ret = max9271_set_gpios(dev->serializer, MAX9271_GPIO1OUT);
>> +	ret = max9271_set_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>>  	if (ret)
>>  		return ret;
>>  	usleep_range(10000, 15000);
>> @@ -564,13 +564,7 @@ static int rdacm20_probe(struct i2c_client *client)
>>  	if (!dev)
>>  		return -ENOMEM;
>>  	dev->dev = &client->dev;
>> -
>> -	dev->serializer = devm_kzalloc(&client->dev, sizeof(*dev->serializer),
>> -				       GFP_KERNEL);
>> -	if (!dev->serializer)
>> -		return -ENOMEM;
>> -
>> -	dev->serializer->client = client;
>> +	dev->serializer.client = client;
>>  
>>  	ret = of_property_read_u32_array(client->dev.of_node, "reg",
>>  					 dev->addrs, 2);
> 

