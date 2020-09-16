Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC83B26CE1B
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 23:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgIPVJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 17:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgIPPzb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 11:55:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F09C02C2B6;
        Wed, 16 Sep 2020 08:53:56 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2355126B;
        Wed, 16 Sep 2020 17:53:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600271627;
        bh=/Nvus+PrMrWochMJmORAGkP8PfiOj2DqqXK0WyeZA1M=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=whCRQmtWHn5plp5hngaqk6zNTZOoAlnLK8tyq+PMYoFUivps8HKzfhigKNofvWi5F
         0MSeNgDl3pixTGZSJ1PEHQgPeZyZjuD1s/2zwc/8lFBm7L1g0Rc+HZwyjnHyyDhMzv
         TlP/iuYN+RA7FwOIpXW3oD319m75tTsob9zpSWBo=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 3/5] media: rcar_drif: Allocate v4l2_async_subdev
 dynamically
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
 <20200811205939.19550-4-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <63e718a6-3ca2-751b-4424-1a6ef311e599@ideasonboard.com>
Date:   Wed, 16 Sep 2020 16:53:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811205939.19550-4-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 11/08/2020 21:59, Laurent Pinchart wrote:
> v4l2_async_notifier_add_subdev() requires the asd to be allocated
> dynamically, but the rcar-drif driver embeds it in the
> rcar_drif_graph_ep structure. This causes memory corruption when the
> notifier is destroyed at remove time with v4l2_async_notifier_cleanup().
> 
> Fix this issue by registering the asd with
> v4l2_async_notifier_add_fwnode_subdev(), which allocates it dynamically
> internally.
> 
> Fixes: d079f94c9046 ("media: platform: Switch to v4l2_async_notifier_add_subdev")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>


> ---
>  drivers/media/platform/rcar_drif.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
> index 3f1e5cb8b197..f318cd4b8086 100644
> --- a/drivers/media/platform/rcar_drif.c
> +++ b/drivers/media/platform/rcar_drif.c
> @@ -185,7 +185,6 @@ struct rcar_drif_frame_buf {
>  /* OF graph endpoint's V4L2 async data */
>  struct rcar_drif_graph_ep {
>  	struct v4l2_subdev *subdev;	/* Async matched subdev */
> -	struct v4l2_async_subdev asd;	/* Async sub-device descriptor */
>  };
>  
>  /* DMA buffer */
> @@ -1109,12 +1108,6 @@ static int rcar_drif_notify_bound(struct v4l2_async_notifier *notifier,
>  	struct rcar_drif_sdr *sdr =
>  		container_of(notifier, struct rcar_drif_sdr, notifier);
>  
> -	if (sdr->ep.asd.match.fwnode !=
> -	    of_fwnode_handle(subdev->dev->of_node)) {
> -		rdrif_err(sdr, "subdev %s cannot bind\n", subdev->name);
> -		return -EINVAL;
> -	}
> -
>  	v4l2_set_subdev_hostdata(subdev, sdr);
>  	sdr->ep.subdev = subdev;
>  	rdrif_dbg(sdr, "bound asd %s\n", subdev->name);
> @@ -1218,7 +1211,7 @@ static int rcar_drif_parse_subdevs(struct rcar_drif_sdr *sdr)
>  {
>  	struct v4l2_async_notifier *notifier = &sdr->notifier;
>  	struct fwnode_handle *fwnode, *ep;
> -	int ret;
> +	struct v4l2_async_subdev *asd;
>  
>  	v4l2_async_notifier_init(notifier);
>  
> @@ -1237,12 +1230,13 @@ static int rcar_drif_parse_subdevs(struct rcar_drif_sdr *sdr)
>  		return -EINVAL;
>  	}
>  
> -	sdr->ep.asd.match.fwnode = fwnode;
> -	sdr->ep.asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> -	ret = v4l2_async_notifier_add_subdev(notifier, &sdr->ep.asd);
> +	asd = v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode,
> +						    sizeof(*asd));

I guess this isn't suffering from the same thing that happened on the
max9286 as there is no need for any private data to follow here.

So,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>  	fwnode_handle_put(fwnode);
> +	if (IS_ERR(asd))
> +		return PTR_ERR(asd);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  /* Check if the given device is the primary bond */
> 

