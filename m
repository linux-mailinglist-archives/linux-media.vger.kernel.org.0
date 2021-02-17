Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4460431DA4B
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 14:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbhBQNX0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 08:23:26 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50136 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbhBQNXO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 08:23:14 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9267C8C4;
        Wed, 17 Feb 2021 14:22:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613568152;
        bh=i/DqpnagSZO1zcBhuqsIpOu5IQQOiJD5JpOhUCiHBus=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MepW53EzCaRPukO1S3TfIaW391YtmosUGGRpVtHocc5ZADZKW/qUJqMyQ9WKMpDMI
         74HkqupNZXB51KSo5YBMhubkZNP26MdciY6J3Nzf49K0lqigMrMWlxVW3uvC8avkXK
         PV1lpYQN+Zg2MMKqLmczOwG5UheuWjM0gflSFtN0=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 06/16] media: i2c: rdacm20: Re-work ov10635 reset
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-7-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <c8e0591e-8abe-bec3-d043-1fbcce5689bb@ideasonboard.com>
Date:   Wed, 17 Feb 2021 13:22:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216174146.106639-7-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/02/2021 17:41, Jacopo Mondi wrote:
> The OV10635 image sensor embedded in the camera module is currently
> reset after the MAX9271 initialization with two long delays that were
> most probably not correctly characterized.
> 
> Re-work the image sensor reset procedure by holding the chip in reset
> during the MAX9271 configuration, removing the long sleep delays and
> only wait after the chip exits from reset for 350-500 microseconds
> interval, which is larger than the minimum (2048 * (1 / XVCLK)) timeout
> characterized in the chip manual.

Holding the OV10635 in reset earlier sounds good to me, but I don't know
beyond that what implications there would be. If it's working better
that's good though.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm20.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index e982373908f2..ea30cc936531 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -477,6 +477,15 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  	if (ret)
>  		return ret;
>  
> +	/* Hold OV10635 in reset during max9271 configuration. */
> +	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> +	if (ret)
> +		return ret;
> +
> +	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> +	if (ret)
> +		return ret;
> +
>  	ret = max9271_configure_gmsl_link(&dev->serializer);
>  	if (ret)
>  		return ret;
> @@ -490,23 +499,11 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  		return ret;
>  	dev->serializer.client->addr = dev->addrs[0];
>  
> -	/*
> -	 * Reset the sensor by cycling the OV10635 reset signal connected to the
> -	 * MAX9271 GPIO1 and verify communication with the OV10635.
> -	 */
> -	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> -	if (ret)
> -		return ret;
> -
> -	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
> -	if (ret)
> -		return ret;
> -	usleep_range(10000, 15000);
> -
> +	/* Release ov10635 from reset and initialize it. */
>  	ret = max9271_set_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>  	if (ret)
>  		return ret;
> -	usleep_range(10000, 15000);
> +	usleep_range(350, 500);
>  
>  	for (i = 0; i < OV10635_PID_TIMEOUT; ++i) {
>  		ret = ov10635_read16(dev, OV10635_PID);
> 

