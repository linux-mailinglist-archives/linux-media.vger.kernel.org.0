Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A696C33C8AC
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 22:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233631AbhCOVoe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 17:44:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41634 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233604AbhCOVoM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 17:44:12 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FDED316;
        Mon, 15 Mar 2021 22:44:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615844650;
        bh=PDnq21KTjYKfjxP5VoiNl8fnnSBXMC/DE5GGMXNiVuk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OYkn4KI+cCvcUYpt8GakGxRWN4fbmTkKCaStwlxtmCEScquMhvDH+yr1wvVCxfz7C
         PlbPWCjuh94ouAndzfjbJRruUBtfVZiBoZjuV5szeCsupJu8Z/HwWOv3wvb1HNemxb
         Ukr6QN3B5oEU59T0T8ivFHy+nWYeeKF+rB5htffk=
Date:   Mon, 15 Mar 2021 23:43:34 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/18] media: i2c: max9271: Introduce wake_up()
 function
Message-ID: <YE/VBi3uXPP48nPr@pendragon.ideasonboard.com>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-10-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210315131512.133720-10-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 15, 2021 at 02:15:03PM +0100, Jacopo Mondi wrote:
> The MAX9271 chip manual prescribes a delay of 5 milliseconds
> after the chip exists from low power state.

I don't think we'll ever try to access the chip within 5ms of the
beginning of its existence.

s/exists/exits/

:-)

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

Isn't the initial address fixed though ? Nonetheless, this can be
addressed separately, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
