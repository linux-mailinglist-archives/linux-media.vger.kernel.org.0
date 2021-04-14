Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84C535F941
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 18:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348366AbhDNQuE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 12:50:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35408 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbhDNQuD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 12:50:03 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0934F88C;
        Wed, 14 Apr 2021 18:49:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618418980;
        bh=dmJqvtAu20k6uHA9vLOp5QC4mYsESyJYOScJUJjXNZs=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=B3ccg4yVp40KQopQ1JJo6fScBbqzdrk9REOT6GcwouBqZEK9BVxcW2WdAVXux/X1Q
         vEqLxQzSiK+qhnnXOTaL5lyme080z2uzXihfTo4ebGO/OpM7FaBxItVJQr4NfT/iwM
         L2TAd4EFx65K+U65JF19rOTOtZIjhybqPLH5h1e0=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v4 08/17] media: i2c: rdacm21: Add dealy after OV490 reset
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
 <20210412093451.14198-9-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <e47bbf9b-5ba0-d4a4-ee64-0724d6d55957@ideasonboard.com>
Date:   Wed, 14 Apr 2021 17:49:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210412093451.14198-9-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

There's still a s/dealy/delay/ in $SUBJECT

On 12/04/2021 10:34, Jacopo Mondi wrote:
> Add a delay after the OV490 chip is put in reset state. The reset
> signal shall be held for at least 250 useconds.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

I added this on v3...

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/rdacm21.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index 553e3f03752b..6be8ce130e78 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -469,7 +469,10 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
>  	if (ret)
>  		return ret;
>  
> -	/* Enable GPIO1 and hold OV490 in reset during max9271 configuration. */
> +	/*
> +	 * Enable GPIO1 and hold OV490 in reset during max9271 configuration.
> +	 * The reset signal has to be asserted for at least 250 useconds.


Is it worth mentioning here that it is asserted to active low? Just to
make it clear that holding it low for 250 uS is the desired effect?

It might not be worth it - but perhaps that was the reason for some
confusion here.

Eitherway RB tag still stands I think.

--
Kieran

> +	 */
>  	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>  	if (ret)
>  		return ret;
> @@ -477,6 +480,7 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
>  	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
>  	if (ret)
>  		return ret;
> +	usleep_range(250, 500);
>  
>  	ret = max9271_configure_gmsl_link(&dev->serializer);
>  	if (ret)
> 

