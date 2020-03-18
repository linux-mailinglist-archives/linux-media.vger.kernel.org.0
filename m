Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B27B41897B9
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 10:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbgCRJQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 05:16:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41706 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbgCRJQG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 05:16:06 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E228F9;
        Wed, 18 Mar 2020 10:16:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584522964;
        bh=3o2/e8gyLj/2x2Z4LY2FFr8Posxc/v6Q8FfiiZysezo=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=HLk2tHuEjfqAw20uYRP3dLD9zawAaYyWLJnoihDHI+pllw1H/ml4q8KWUnqRJTjgC
         LEH2kZaBYIHhn7aW76gEhXXDt5V5EW1kTeJiTwluPZvZOlVGjht9szCeE6Zr5qTDem
         1C+jx3Om3Lq5MQdwvuUFi1uZHO1qOJsJ9yaSsu0w=
Subject: Re: [PATCH v2 3/4] media: v4l2-async: Log message in case of
 heterogenous fwnode match
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org
References: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200318002507.30336-4-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <a7d96e73-c86c-951e-d586-a1cee1a7fa59@ideasonboard.com>
Date:   Wed, 18 Mar 2020 09:16:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200318002507.30336-4-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 18/03/2020 00:25, Laurent Pinchart wrote:
> When a notifier supplies a device fwnode and a subdev supplies an
> endpoint fwnode, incorrect matches may occur if multiple subdevs
> correspond to the same device fwnode. This can't be handled
> transparently in the framework, and requires the notifier to switch to
> endpoint fwnodes. Log a message to notify of this problem. A second
> message is added to help accelerating the transition to endpoint
> matching.

Only minor comments and discussion below:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 224b39a7aeb1..9f393a7be455 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -77,6 +77,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  	struct fwnode_handle *dev_fwnode;
>  	bool asd_fwnode_is_ep;
>  	bool sd_fwnode_is_ep;
> +	struct device *dev;
>  	const char *name;
>  
>  	/*
> @@ -113,7 +114,28 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  
>  	fwnode_handle_put(dev_fwnode);
>  
> -	return dev_fwnode == other_fwnode;
> +	if (dev_fwnode != other_fwnode)
> +		return false;
> +
> +	/*
> +	 * We have an heterogenous match. Retrieve the struct device of the

s/an/a/

s/heterogenous/heterogeneous/ (and that's not an en-gb/en-us thing)
Also in $SUBJECT

> +	 * side that matched on a device fwnode to print its driver name.
> +	 */
> +	if (sd_fwnode_is_ep)
> +		dev = notifier->v4l2_dev ? notifier->v4l2_dev->dev
> +		    : notifier->sd->dev;

Eugh ... I guess if this gets needed elsewhere, notifiers need a helper
to get the appropriate dev out... but if this is the only place, then so
be it.


> +	else
> +		dev = sd->dev;
> +
> +	if (dev && dev->driver) {
> +		if (sd_fwnode_is_ep)
> +			dev_info(dev, "Driver %s uses device fwnode, incorrect match may occur\n",
> +				 dev->driver->name);
> +		dev_info(dev, "Consider updating driver %s to match on endpoints\n",
> +			 dev->driver->name);

I think I interpret that in the case that existing drivers match on
dev->dev (i.e. no endpoints involved) then this will not print, as we
would already have matched and returned earlier in the function.

I don't think that's a problem, but it means people will not be
'encouraged' to move to endpoint matching until they encounter a device
which uses endpoints.

Perhaps that's ok ... but I was almost thinking of being more 'pushy'
and guiding device matches to move to endpoints too ;-)


> +	}
> +
> +	return true;
>  }
>  
>  static bool match_custom(struct v4l2_async_notifier *notifier,
> 

