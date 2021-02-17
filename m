Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9E831D9CA
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 13:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbhBQM4G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 07:56:06 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47566 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhBQM4F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 07:56:05 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 308EB8C4;
        Wed, 17 Feb 2021 13:55:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613566522;
        bh=SZmom8e6Ukq+kensQZ86TKqC3oX7PjE2ZGFbW5sEnbI=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=l7KOgWSOyzPyUPo2F6t44T8fMqWskLMrWg+2CSXSwlDdyNYAJCkz1L6DbTUlbBapI
         i/3mJJUYg6WJrp4HLNQmOQHHOlvA9VS1+9xvsPzi3qak9Ek1b4PNE2xarSe+MX4Gjo
         GEPQOaDFPjbmctfKAWh6iGeuUW5AeymcP9TXvq08=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 01/16] media: i2c: rdacm20: Enable noise immunity
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-2-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <5691f68f-724d-9d6a-9ea8-1e017b305c66@ideasonboard.com>
Date:   Wed, 17 Feb 2021 12:55:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216174146.106639-2-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 16/02/2021 17:41, Jacopo Mondi wrote:
> Enable the noise immunity threshold at the end of the rdacm20
> initialization routine.
> 
> The rdcam20 camera module has been so far tested with a startup
> delay that allowed the embedded MCU to program the serializer. If
> the initialization routine is run before the MCU programs the
> serializer and the image sensor and their addresses gets changed
> by the rdacm20 driver it is required to manually enable the noise
> immunity threshold to make the communication on the control channel
> more reliable.
> 

Oh, this is interesting, ... booting up without the delays would be ...
much nicer.

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm20.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 90eb73f0e6e9..f7fd5ae955d0 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -541,7 +541,13 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  
>  	dev_info(dev->dev, "Identified MAX9271 + OV10635 device\n");
>  
> -	return 0;
> +	/*
> +	 * Set reverse channel high threshold to increase noise immunity.
> +	 *
> +	 * This should be compensated by increasing the reverse channel
> +	 * amplitude on the remote deserializer side.
> +	 */
> +	return max9271_set_high_threshold(&dev->serializer, true);

Does this work 'out of the box' ? I.e. if this patch is applied, I
assume it is required to remove the regulator delays that I/we have in DT?

Likewise, does that note mean this patch must also be accompanied by the
update in max9286 somehow?

I guess we can't keep 'test bisectability' with this very easily so it
probably doesn't matter too much, the end result will be the interesting
part.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>



>  }
>  
>  static int rdacm20_probe(struct i2c_client *client)
> 

