Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2C6320EF2
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 02:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhBVBKf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 20:10:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhBVBKe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 20:10:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E785C061574;
        Sun, 21 Feb 2021 17:09:54 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8CA5E517;
        Mon, 22 Feb 2021 02:09:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613956192;
        bh=xhnHSB0XbiYzNW1xDqCxM9Uy6dA62lkumHVq0f5L/KE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QoA/kbaVUsgw7GQwn/yj3mL2GecM1ooNHE9d6fwHp2lY47FsCm2Hb6zHJF4QQ4U81
         ILdYw7d6XoIaRuM/1cCRtN0PDQhUm0wwHKM76NI86yHWL8U3lZz7vXySCKiKvz7ckB
         B1bPCaA/MVXtR8Tc383yy4zlon4qnRZ8Z3ab3hTs=
Date:   Mon, 22 Feb 2021 03:09:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/16] media: i2c: rdacm20: Check return values
Message-ID: <YDMERvqtWulct59d@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210216174146.106639-6-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Feb 16, 2021 at 06:41:35PM +0100, Jacopo Mondi wrote:
> The camera module initialization routine does not check the return
> value of a few functions. Fix that.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm20.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 56406d82b5ac..e982373908f2 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -470,11 +470,16 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  	 *  Ensure that we have a good link configuration before attempting to
>  	 *  identify the device.
>  	 */
> -	max9271_configure_i2c(&dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
> -						MAX9271_I2CSLVTO_1024US |
> -						MAX9271_I2CMSTBT_105KBPS);
> +	ret = max9271_configure_i2c(&dev->serializer,
> +				    MAX9271_I2CSLVSH_469NS_234NS |
> +				    MAX9271_I2CSLVTO_1024US |
> +				    MAX9271_I2CMSTBT_105KBPS);
> +	if (ret)
> +		return ret;
>  
> -	max9271_configure_gmsl_link(&dev->serializer);
> +	ret = max9271_configure_gmsl_link(&dev->serializer);
> +	if (ret)
> +		return ret;

This looks good, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

But it would be more useful if max9271_configure_gmsl_link() returned
errors when I2C writes fail :-)

>  
>  	ret = max9271_verify_id(&dev->serializer);
>  	if (ret < 0)

-- 
Regards,

Laurent Pinchart
