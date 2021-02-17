Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F6E31DAB5
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 14:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbhBQNei (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 08:34:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50218 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233097AbhBQNdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 08:33:46 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64FF98C4;
        Wed, 17 Feb 2021 14:33:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613568784;
        bh=uJZ45WxQROloySzVhB55LTkBrXUfdRnph4seJ/EiOX4=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=C+p8M596IMCiulZTOnqsdxGSdnTmtRVSMEmq67pGLi0Pn1PEiuQyct3fon4sheVB2
         76xxgXlWsTjHxTF40P+bvpHXiQfWr4txlfyY2KrKFgB4FLZh7XQC2Q7AMs+ztNp81n
         ryjVWZBQFLmwRi1v5SMFJl2HgptAMQu1Lslfkohk=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 07/16] media: i2c: rdacm2x: Fix wake up delay
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-8-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <3e759da5-9bba-54ae-fe39-a7db2cbbb31c@ideasonboard.com>
Date:   Wed, 17 Feb 2021 13:33:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216174146.106639-8-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,


On 16/02/2021 17:41, Jacopo Mondi wrote:
> The MAX9271 chip manual prescribes a delay of 5 milliseconds
> after the chip exists from low power state.
> 
> Adjust the required delay in the rdacm21 camera module and add it
> to the rdacm20 that currently doesn't implement one.
> 

This sounds to me like it should be a common function in the max9271 module:

>         /* Verify communication with the MAX9271: ping to wakeup. */
>         dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
>         i2c_smbus_read_byte(dev->serializer.client);
>         usleep_range(5000, 8000);


Especially as that MAX9271_DEFAULT_ADDR should probably be handled
directly in the max9271.c file too, and the RDACM's shouldn't care about it.


If we end up moving the max9271 'library' into more of a module/device
then this would have to be done in it's 'probe' anyway, so it's likely
better handled down there...?

But ... it's not essential at this point in the series, so if you want
to keep this patch as is,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
	> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm20.c | 1 +
>  drivers/media/i2c/rdacm21.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index ea30cc936531..39e4b4241870 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -460,6 +460,7 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  	/* Verify communication with the MAX9271: ping to wakeup. */
>  	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
>  	i2c_smbus_read_byte(dev->serializer.client);
> +	usleep_range(5000, 8000);
>  
>  	/* Serial link disabled during config as it needs a valid pixel clock. */
>  	ret = max9271_set_serial_link(&dev->serializer, false);
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index 179d107f494c..b22a2ca5340b 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -453,7 +453,7 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
>  	/* Verify communication with the MAX9271: ping to wakeup. */
>  	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
>  	i2c_smbus_read_byte(dev->serializer.client);
> -	usleep_range(3000, 5000);
> +	usleep_range(5000, 8000);
>  
>  	/* Enable reverse channel and disable the serial link. */
>  	ret = max9271_set_serial_link(&dev->serializer, false);
> 

