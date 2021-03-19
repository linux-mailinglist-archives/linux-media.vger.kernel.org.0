Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE772342272
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 17:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbhCSQuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 12:50:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35150 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhCSQt4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 12:49:56 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 053D18EF;
        Fri, 19 Mar 2021 17:49:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616172588;
        bh=EIbEVZoJtQcPzgY11TiM0Rs8F4dkdFCSO7Skdg6wC0A=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=i9P4488dZZ9tqEIQKMUizkjDVLg1XVrH1DhhAXm6cQO9QhH/5wjNDbJeaz4iGE5m7
         I6rNSjtjS23d7JaD7bQHyDBYT6j92hLos4xC7kUO0peV4C3Tow+tcVOGT/ZknxhE2+
         7dlkjVpMXwCi1NYM7468NvUbnt0bNruZtolZtBvE=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v3 11/19] media: i2c: rdacm21: Add dealy after OV490 reset
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
 <20210319164148.199192-12-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <99971a13-4d02-2255-6653-569915da181d@ideasonboard.com>
Date:   Fri, 19 Mar 2021 16:49:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210319164148.199192-12-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

s/dealy/delay/ in $SUBJECT

On 19/03/2021 16:41, Jacopo Mondi wrote:
> Add a delay after the OV490 chip is put in reset state. The reset
> signal shall be held for at least 250 useconds.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm21.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index babd14b21252..875bec9f7904 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -448,7 +448,10 @@ static int rdacm21_init(struct v4l2_subdev *sd, unsigned int val)
>  	if (ret)
>  		return ret;
>  
> -	/* Enable GPIO1 and hold OV490 in reset during max9271 configuration. */
> +	/*
> +	 * Enable GPIO1 and hold OV490 in reset during max9271 configuration.
> +	 * The reset signal has to be asserted for at least 250 useconds.
> +	 */
>  	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>  	if (ret)
>  		return ret;
> @@ -456,6 +459,7 @@ static int rdacm21_init(struct v4l2_subdev *sd, unsigned int val)
>  	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>  	if (ret)
>  		return ret;
> +	usleep_range(250, 500);

Aha, for a second there I thought the comment meant it had to be
asserted for 250 uS before clearing it again. But it's 250 uS before
using the OV490.

Perhaps possible to update the comment a little, but nothing that matters.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


>  	ret = max9271_configure_gmsl_link(&dev->serializer);
>  	if (ret)
> 

