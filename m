Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2EB01897DA
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 10:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbgCRJW0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 05:22:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbgCRJW0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 05:22:26 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9BC6F9;
        Wed, 18 Mar 2020 10:22:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584523344;
        bh=UcboyiqbUa5HovPakxxqQp2CczdAAe9uedzabdNBloM=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=K9o2+J79czRW2VAZvDJmiCe0/Y9J6m7wiYTVc0OySFghoyrBME2qrUx5kQEwZL2GF
         C6vQdwIanMMtlBbiLGeMJwULinMMTbCkDQ7sJ1+laZCM8iaqu/5srFzDKvR5/t4fz9
         GHIJVnH9VVZnugNH+IvERL4/fKGqqBR6Lp0vk2lA=
Subject: Re: [PATCH v2 4/4] media: v4l2-async: Don't check fwnode name to
 detect endpoint
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org
References: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200318002507.30336-5-laurent.pinchart+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <42d4269d-7498-b5f8-d966-86ecb75e7999@ideasonboard.com>
Date:   Wed, 18 Mar 2020 09:22:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200318002507.30336-5-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 18/03/2020 00:25, Laurent Pinchart wrote:
> Use the presence of a "remote-endpoint" property to detect if a fwnode
> is an endpoint node, as checking the node name won't work on ACPI-based
> implementations.

Technically, won't this property only detect that the endpoint is
connected to another endpoint, and 'un-connected' endpoints wont' match?

Of course in this instance - an unconnected endpoint is likely not much
use and probably even shouldn't match ;-) ~(but it may still 'be' an
endpoint).

Also - would this patch be squashed into 1/4?

I'll leave it to Sakari to comment on the actual validity of this
approach all the same :-)

--
Kieran


> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 9f393a7be455..a5f83ba502df 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -78,7 +78,6 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  	bool asd_fwnode_is_ep;
>  	bool sd_fwnode_is_ep;
>  	struct device *dev;
> -	const char *name;
>  
>  	/*
>  	 * Both the subdev and the async subdev can provide either an endpoint
> @@ -92,10 +91,10 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
>  	 * endpoint or a device. If they're of the same type, there's no match.
>  	 */
> -	name = fwnode_get_name(sd->fwnode);
> -	sd_fwnode_is_ep = name && strstarts(name, "endpoint");
> -	name = fwnode_get_name(asd->match.fwnode);
> -	asd_fwnode_is_ep = name && strstarts(name, "endpoint");
> +	sd_fwnode_is_ep = fwnode_property_present(sd->fwnode,
> +						  "remote-endpoint");
> +	asd_fwnode_is_ep = fwnode_property_present(asd->match.fwnode,
> +						   "remote-endpoint");
>  
>  	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
>  		return false;
> 

