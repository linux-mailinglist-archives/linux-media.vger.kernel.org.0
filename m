Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD406BD17
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 15:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfGQNe2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 09:34:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40244 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfGQNe2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 09:34:28 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A6FB33C;
        Wed, 17 Jul 2019 15:34:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1563370466;
        bh=jncdj1nJCCU+MwGY1kMmVxVoCFCQYDt1Wi2FHRMyjoY=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=YPsEsnaSh3pnOebQ8+nnmD4y39ereXKRXZqJ6+9pKXgrwB8Bsu4chak4yf4Q//O2a
         5P/DXv/0Zz7U94HBaMME3xZZNDCaG2jk/Py92aaqgma0NTAomTDlnOgUJ0BOnn4bB7
         JwzNxczYOQZYfz+X7iO1VqG2vMtsQ+Vw8d7Yf8JQ=
Subject: Re: [PATCH v2] rcar-vin: Clean up correct notifier in error path
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20190702174258.11128-1-niklas.soderlund+renesas@ragnatech.se>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <fa6f9b8a-42a8-88be-de7b-878dac131627@ideasonboard.com>
Date:   Wed, 17 Jul 2019 14:34:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190702174258.11128-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 02/07/2019 18:42, Niklas Söderlund wrote:
> The parallel input initialization error path cleans up the wrong
> async notifier, fix this by cleaning up the correct notifier.
> 
> Fixes: 9863bc8695bc36e3 ("media: rcar-vin: Cleanup notifier in error path")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 64f9cf790445d14e..a6efe1a8099a6ae6 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -633,7 +633,7 @@ static int rvin_parallel_init(struct rvin_dev *vin)
>  	ret = v4l2_async_notifier_register(&vin->v4l2_dev, &vin->notifier);
>  	if (ret < 0) {
>  		vin_err(vin, "Notifier registration failed\n");
> -		v4l2_async_notifier_cleanup(&vin->group->notifier);
> +		v4l2_async_notifier_cleanup(&vin->notifier);
>  		return ret;
>  	}
>  
> 

