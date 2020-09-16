Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC1826C4EE
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 18:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgIPQMu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 12:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgIPQEk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 12:04:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93313C02C2B4;
        Wed, 16 Sep 2020 08:52:27 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B07C6276;
        Wed, 16 Sep 2020 17:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600271190;
        bh=vU4CX35WdhIO84M8bi8/e3UppxFuPqd6yDjuzFb8N+Q=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=HMFsbCyj8EQ0JR7wU4Y7kx0qzhdXYQ1yA5H2OJTJH354j6YhL9GfDp8DLestnF1AI
         H6LbT3tai6ISYHNdWBRknp0aNofOfLRBYHM3hO6EUhU9ompuZ51rWMPksekHzS19wf
         yy31jFwzEiHUyljAxNYrWhYyBTeA7JPbWbBJddC8=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 2/5] media: rcar_drif: Fix fwnode reference leak when
 parsing DT
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
References: <20200811205939.19550-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200811205939.19550-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <ba59bb4e-733f-a76d-413d-cde7e1bcad9d@ideasonboard.com>
Date:   Wed, 16 Sep 2020 16:46:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811205939.19550-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 11/08/2020 21:59, Laurent Pinchart wrote:
> The fwnode reference corresponding to the endpoint is leaked in an error
> path of the rcar_drif_parse_subdevs() function. Fix it, and reorganize
> fwnode reference handling in the function to release references early,
> simplifying error paths.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Simplified indeed.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/rcar_drif.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
> index 3d2451ac347d..3f1e5cb8b197 100644
> --- a/drivers/media/platform/rcar_drif.c
> +++ b/drivers/media/platform/rcar_drif.c
> @@ -1227,28 +1227,22 @@ static int rcar_drif_parse_subdevs(struct rcar_drif_sdr *sdr)
>  	if (!ep)
>  		return 0;
>  
> +	/* Get the endpoint properties */
> +	rcar_drif_get_ep_properties(sdr, ep);
> +
>  	fwnode = fwnode_graph_get_remote_port_parent(ep);
> +	fwnode_handle_put(ep);
>  	if (!fwnode) {
>  		dev_warn(sdr->dev, "bad remote port parent\n");
> -		fwnode_handle_put(ep);
>  		return -EINVAL;
>  	}
>  
>  	sdr->ep.asd.match.fwnode = fwnode;
>  	sdr->ep.asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
>  	ret = v4l2_async_notifier_add_subdev(notifier, &sdr->ep.asd);
> -	if (ret) {
> -		fwnode_handle_put(fwnode);
> -		return ret;
> -	}
> -
> -	/* Get the endpoint properties */
> -	rcar_drif_get_ep_properties(sdr, ep);
> -
>  	fwnode_handle_put(fwnode);
> -	fwnode_handle_put(ep);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /* Check if the given device is the primary bond */
> 

