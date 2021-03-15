Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A52F33C420
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 18:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235031AbhCOR2e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 13:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235832AbhCOR2O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 13:28:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F4DC06174A;
        Mon, 15 Mar 2021 10:28:14 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8115A316;
        Mon, 15 Mar 2021 18:28:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615829292;
        bh=0tDUrg5BPE+L6CK+xldLeDBVG745e69d2TIvietyZYY=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZJFU3icWTJDLcwPXPcPYQ9+dAG08yyfNzDUd4pXjzrjHU6u+W0ZXkWgNUhRd1pOMm
         MMiMlxDTjVNPq21peDVa/+ZseMDRyHPmJzlywJluksd/BQ0+8Tytwdz4joT5gKEhZO
         0LZDAHjSTcZdYzVAuVoA6SYAZuV1iXXx5Vn4OPlQ=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 18/18] media: i2c: max9286: Rework comments in .bound()
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-19-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <3067efad-a563-842f-5cf8-d38dfe0a96e1@ideasonboard.com>
Date:   Mon, 15 Mar 2021 17:28:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315131512.133720-19-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/03/2021 13:15, Jacopo Mondi wrote:
> Re-phrase a comment in .bound() callback to make it clear we register
> a subdev notifier and remove a redundant comment about disabling i2c
> auto-ack.
> 
> No functional changes intended.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/max9286.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index b6347639901e..16b2cb9b44a2 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -556,9 +556,9 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
>  		subdev->name, src_pad, index);
>  
>  	/*
> -	 * We can only register v4l2_async_notifiers, which do not provide a
> -	 * means to register a complete callback. bound_sources allows us to
> -	 * identify when all remote serializers have completed their probe.
> +	 * As we register a subdev notifiers we won't get a .complete() callback
> +	 * here, so we have to use bound_sources to identify when all remote
> +	 * serializers have probed.
>  	 */
>  	if (priv->bound_sources != priv->source_mask)
>  		return 0;
> @@ -581,16 +581,12 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
>  	/*
>  	 * All enabled sources have probed and enabled their reverse control
>  	 * channels:
> +	 * - The reverse channel amplitude stays high
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

