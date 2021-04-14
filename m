Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97FB35FE37
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 01:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhDNXLH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 19:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbhDNXLF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 19:11:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140F7C061574;
        Wed, 14 Apr 2021 16:10:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C41CA51E;
        Thu, 15 Apr 2021 01:10:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618441840;
        bh=29CH3AwVUqaKvqkhxjku+Htx2LUlRYQ+AO+dMqCsA58=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mGslc9aqMB6PaIH8tffi7OfHiF+HuzLRcaMubAPwSBeSPrq6SmeHN01WGLCkTn6Q7
         wPcBZ5wtQoF63NYNJZdMHrbjA8pnI2td7ny48zSYwCAgRVH7BMuNCMm6asUypdXmjr
         V8JKmy6gHUXbNpIoJtmaJ9C/jZuarZ4qXYFVhJu4=
Date:   Thu, 15 Apr 2021 02:10:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/17] media: i2c: rdacm21: Add dealy after OV490 reset
Message-ID: <YHd2bjUlkMjNQEDR@pendragon.ideasonboard.com>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
 <20210412093451.14198-9-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412093451.14198-9-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Apr 12, 2021 at 11:34:42AM +0200, Jacopo Mondi wrote:
> Add a delay after the OV490 chip is put in reset state. The reset
> signal shall be held for at least 250 useconds.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

With s/dealy/delay/ in the subject line,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
