Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 981EB31D9EE
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 14:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbhBQNDS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 08:03:18 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:48276 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbhBQNDQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 08:03:16 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A4288C4;
        Wed, 17 Feb 2021 14:02:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613566953;
        bh=HQRsCEFT7QpOzPKX75Qke9FB06sIR4AyroWPQ2IR9DE=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KR3q+cKtQpkhZjtpZ3INYaVTPmWh7xqKl3r02y5dfj35GRX/vwxC1i2ZD9LGrrwn6
         aBOQDIu5Wd0m3bvqJZNXxffmXQaLtAqT7DNEDh/X2KT5X50LIu+E0KbtPf/M1QUM2R
         /RXkNESOmL3RYqw5ug3KbCM16ImBULUDTrhwdzpM=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 04/16] media: i2c: rdacm20: Report camera module name
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-5-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <1c9e6fac-9f1c-296b-564c-624280ffaa33@ideasonboard.com>
Date:   Wed, 17 Feb 2021 13:02:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216174146.106639-5-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 16/02/2021 17:41, Jacopo Mondi wrote:
> When the device is identified the driver currently reports the
> names of the chips embedded in the camera module.
> 
> Report the name of the camera module itself instead.
> Cosmetic change only.

Aha, there go all my scripts that rely on this string to know if the
camera was found ... but I can fix that ;-)

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 6504ed0bd3bc..56406d82b5ac 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -532,7 +532,7 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  	if (ret)
>  		return ret;
>  
> -	dev_info(dev->dev, "Identified MAX9271 + OV10635 device\n");
> +	dev_info(dev->dev, "Identified RDACM20 camera module\n");
>  
>  	/*
>  	 * Set reverse channel high threshold to increase noise immunity.
> 

