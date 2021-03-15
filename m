Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3D633C3E6
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 18:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbhCORPO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 13:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234597AbhCOROv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 13:14:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C70C06174A;
        Mon, 15 Mar 2021 10:14:51 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CA00316;
        Mon, 15 Mar 2021 18:14:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615828489;
        bh=t/2I4AQe8JLwQ6fZZPyNFzyesR2yTWenGNed0G0YKUo=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EsgXRxU/hNLLwogP6T416+yKGMkYC7B60UwOGFecPtFbjG5IDHCKwSXTINdNChNFm
         P4WXfXYessZ23RiKtOLRSSqiq27R6pQcmxj8VB9vgwsOJLc6MgKp/tXnl5TBGvUr3d
         vV/luvB27IFTc2PvR1yuTT7V9L3c97MGAoB27paA=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 09/18] media: i2c: max9271: Introduce wake_up()
 function
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-10-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <13e3e14f-db77-28d9-e1e7-8e54f9ab75b5@ideasonboard.com>
Date:   Mon, 15 Mar 2021 17:14:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315131512.133720-10-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/03/2021 13:15, Jacopo Mondi wrote:
> The MAX9271 chip manual prescribes a delay of 5 milliseconds
> after the chip exists from low power state.
> 
> Add a new function to the max9271 library driver that wakes up the chip
> with a dummy i2c transaction and implements the correct delay of 5
> milliseconds after the chip exits from low power state.
> 
> Use the newly introduced function in the rdacm20 and rdacm21 camera
> drivers. The former was not respecting the required delay while the
> latter was waiting for a too-short timeout.
> 
> Do not handle the initial i2c address configuration in the library
> driver function as the camera module drivers control address
> reprogramming.

I still think that the MAX9271_DEFAULT_ADDR belongs in the max9271
library, but this patch is functionally good to me, and correcting those
delays is certainly a good thing to fix here.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9271.c | 7 +++++++
>  drivers/media/i2c/max9271.h | 9 +++++++++
>  drivers/media/i2c/rdacm20.c | 2 +-
>  drivers/media/i2c/rdacm21.c | 3 +--
>  4 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
> index 2c7dc7fb9846..f7bfe7266763 100644
> --- a/drivers/media/i2c/max9271.c
> +++ b/drivers/media/i2c/max9271.c
> @@ -80,6 +80,13 @@ static int max9271_pclk_detect(struct max9271_device *dev)
>  	return -EIO;
>  }
>  
> +void max9271_wake_up(struct max9271_device *dev)
> +{
> +	i2c_smbus_read_byte(dev->client);
> +	usleep_range(5000, 8000);
> +}
> +EXPORT_SYMBOL_GPL(max9271_wake_up);
> +
>  int max9271_set_serial_link(struct max9271_device *dev, bool enable)
>  {
>  	int ret;
> diff --git a/drivers/media/i2c/max9271.h b/drivers/media/i2c/max9271.h
> index d78fb21441e9..dc5e4e70ba6f 100644
> --- a/drivers/media/i2c/max9271.h
> +++ b/drivers/media/i2c/max9271.h
> @@ -85,6 +85,15 @@ struct max9271_device {
>  	struct i2c_client *client;
>  };
>  
> +/**
> + * max9271_wake_up() - Wake up the serializer by issuing an i2c transaction
> + * @dev: The max9271 device
> + *
> + * This function shall be called before any other interaction with the
> + * serializer.
> + */
> +void max9271_wake_up(struct max9271_device *dev);
> +
>  /**
>   * max9271_set_serial_link() - Enable/disable serial link
>   * @dev: The max9271 device
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index b9aaa0f7db42..2265ef7c65d4 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -459,7 +459,7 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  
>  	/* Verify communication with the MAX9271: ping to wakeup. */
>  	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> -	i2c_smbus_read_byte(dev->serializer.client);
> +	max9271_wake_up(&dev->serializer);
>  
>  	/* Serial link disabled during config as it needs a valid pixel clock. */
>  	ret = max9271_set_serial_link(&dev->serializer, false);
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index 179d107f494c..7bce55adfd7c 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -452,8 +452,7 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
>  
>  	/* Verify communication with the MAX9271: ping to wakeup. */
>  	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> -	i2c_smbus_read_byte(dev->serializer.client);
> -	usleep_range(3000, 5000);
> +	max9271_wake_up(&dev->serializer);
>  
>  	/* Enable reverse channel and disable the serial link. */
>  	ret = max9271_set_serial_link(&dev->serializer, false);
> 

