Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E3431ECB3
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 18:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbhBRQ6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 11:58:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232525AbhBRPkk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 10:40:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE5CC061756;
        Thu, 18 Feb 2021 07:39:59 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A3F53E7;
        Thu, 18 Feb 2021 16:39:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613662798;
        bh=ZHHiQ6gYoD6rbj8ZaT1vd53VCJRxatXjuxo/otylGNc=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XlxWeZ63L7UY30O/Cbb99cNcuk/PGe0YWieExHs6PXDaOcc6vM2kOt+JFkNOGnfFs
         OHu5WCjqNRgDy2imvLbPgOQm0Z6FrM6ekJkRYANu+TnwDNdi+D6Dyh9ZKQa+ezXjhA
         bHS9D5J9YKQh6kqdXcxlgDSzmYi9+4RITHjRhg+0=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 12/16] media: i2c: max9286: Define high channel amplitude
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-13-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <732fca69-dddf-dd0b-af32-fcfb96e35dd1@ideasonboard.com>
Date:   Thu, 18 Feb 2021 15:39:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216174146.106639-13-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 16/02/2021 17:41, Jacopo Mondi wrote:
> Provide a macro to define the reverse channel amplitude to
> be used to compensate the remote serializer noise immunity.
> 
> While at it, update a comment.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 4afb5ca06448..7913b5f2249e 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -113,6 +113,7 @@
>  #define MAX9286_REV_TRF(n)		((n) << 4)
>  #define MAX9286_REV_AMP(n)		((((n) - 30) / 10) << 1) /* in mV */
>  #define MAX9286_REV_AMP_X		BIT(0)
> +#define MAX9286_REV_AMP_HIGH		170
>  /* Register 0x3f */
>  #define MAX9286_EN_REV_CFG		BIT(6)
>  #define MAX9286_REV_FLEN(n)		((n) - 20)
> @@ -566,12 +567,12 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
>  	 * channels:
>  	 *
>  	 * - Increase the reverse channel amplitude to compensate for the
> -	 *   remote ends high threshold, if not done already
> +	 *   remote ends high threshold
>  	 * - Verify all configuration links are properly detected
>  	 * - Disable auto-ack as communication on the control channel are now
>  	 *   stable.
>  	 */
> -	max9286_reverse_channel_setup(priv, 170);
> +	max9286_reverse_channel_setup(priv, MAX9286_REV_AMP_HIGH);
>  	max9286_check_config_link(priv, priv->source_mask);
>  
>  	/*
> 

