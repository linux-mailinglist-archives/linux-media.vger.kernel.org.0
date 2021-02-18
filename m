Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1532131ECBA
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 18:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234177AbhBRQ7C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 11:59:02 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33118 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233076AbhBRQEm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 11:04:42 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4BB93F0;
        Thu, 18 Feb 2021 17:03:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613664227;
        bh=SLloweOlW3YyvTIFbGXuKXMzMH/hzXvlCc4Uv3Qfkbw=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jsdokd8ueTpIyZ6oWK86J3Xl+7JRhHz0uqUipRlLgXKaKGKdCma8ALRQEthsLX6tA
         Cx3vMHakIWeuSXHciPWdkc5TlKu3+jB+v6GMPFZepIHTlHFiTqh7tYBus8nuHDUYEF
         f9fg0BIIivMrvU13VsXxEZE+8j4QkywyZqLiQMyc=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 15/16] media: i2c: max9286: Rework comments in .bound()
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-16-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <c1f9acd4-b5e6-1c57-8878-7d3e2d20b2a1@ideasonboard.com>
Date:   Thu, 18 Feb 2021 16:03:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216174146.106639-16-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/02/2021 17:41, Jacopo Mondi wrote:
> Re-phrase a comment in .bound() callback to make it clear we register
> a subdev notifier and remove a redundant comment about disabling i2c
> auto-ack.
> 
> No functional changes intended.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index c41284de89b6..aa01d5bb79ef 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -567,9 +567,9 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
>  	}
>  
>  	/*
> -	 * We can only register v4l2_async_notifiers, which do not provide a
> -	 * means to register a complete callback. bound_sources allows us to
> -	 * identify when all remote serializers have completed their probe.
> +	 * As we register a subdev notifiers we won't get a .complete() callback
> +	 * here, so we have to use bound_sources to identify when all remote
> +	 * serializers have probed.

s/subdev notifiers/subdev notifier/ ?

... I'm not sure that helps me ? :S

>  	 */
>  	if (priv->bound_sources != priv->source_mask) {
>  		/*
> @@ -583,16 +583,12 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
>  	/*
>  	 * All enabled sources have probed and enabled their reverse control
>  	 * channels:
> +	 * - The reverse channel amplitude stays high

Isn't this part of the previous patch?


>  	 * - Verify all configuration links are properly detected
> -	 * - Disable auto-ack as communication on the control channel are now
> -	 *   stable.
> +	 * - Disable auto-ack as communications on the control channel are now
> +	 *   stable
>  	 */
>  	max9286_check_config_link(priv, priv->source_mask);
> -
> -	/*
> -	 * Re-configure I2C with local acknowledge disabled after cameras have
> -	 * probed.
> -	 */
>  	max9286_configure_i2c(priv, false);
>  
>  	return max9286_set_pixelrate(priv);
> 

