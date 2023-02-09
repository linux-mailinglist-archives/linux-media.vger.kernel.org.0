Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E72D691367
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 23:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbjBIWeG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 17:34:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjBIWeF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 17:34:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5175021A00
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 14:34:04 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 327BF9CA;
        Thu,  9 Feb 2023 23:34:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675982042;
        bh=jXWrMiRYk03KcsgUdV0/ClmprNlQWdcYO5mIQE8UvlI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pFxdGij6epUEdSzCOfkHr816Vpiu9PFEPAIiPJ7Y0nP+c9V2DyLVwQlnKFT4N3Jjw
         wTvwrM9FZwVSnxqPASoyVKOBQD8Sza0APnV0V50icB6WQxbc3xJP157DyPoDD0gewH
         oQ9Wjf0GBalZ9hg37qV75SRzXHZD6EcUME0v1fi8=
Date:   Fri, 10 Feb 2023 00:34:01 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, frieder.schrempf@kontron.de,
        Tim Harvey <tharvey@gateworks.com>,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [RFC 1/1] v4l: async: Add some debug prints
Message-ID: <Y+V02fe9lqVrt3lb@pendragon.ideasonboard.com>
References: <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
 <20230209221634.35239-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230209221634.35239-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Feb 10, 2023 at 12:16:34AM +0200, Sakari Ailus wrote:
> Just add some debug prints for V4L2 async sub-device matching process. These
> might come useful in figuring out why things don't work as expected.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Frieder,
> 
> Can you try this? It prints what is being matched with what. Perhaps this
> could be merged in a bit more refined form if it proves useful.
> 
> Not tested in any way.
> 
>  drivers/media/v4l2-core/v4l2-async.c | 41 ++++++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 2f1b718a9189..6c13a9488415 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -86,13 +86,18 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  	bool sd_fwnode_is_ep;
>  	struct device *dev;
>  
> +	dev_dbg(sd->dev, "async fwnode match %pfw vs. %pfw\n", sd_fwnode,
> +		asd->match.fwnode);

Let's be more explicit:

	dev_dbg(sd->dev, "async fwnode match: need %pfw, trying %pfw\n",
		sd_fwnode, asd->match.fwnode);

(feel free to adjust, as long as we differentiate what we're looking for
from what we're testing)

> +
>  	/*
>  	 * Both the subdev and the async subdev can provide either an endpoint
>  	 * fwnode or a device fwnode. Start with the simple case of direct
>  	 * fwnode matching.
>  	 */
> -	if (sd_fwnode == asd->match.fwnode)
> +	if (sd_fwnode == asd->match.fwnode) {
> +		dev_dbg(sd->dev, "true\n");

		dev_dbg(sd->dev, "direct match found\n");

>  		return true;
> +	}
>  
>  	/*
>  	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> @@ -105,8 +110,12 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
>  	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
>  
> -	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> +	dev_dbg(sd->dev, "async fwnode match %pfw vs. %pfw\n", sd_fwnode,
> +		asd->match.fwnode);

You've already printed this above, no need to repeat it.

> +	if (sd_fwnode_is_ep == asd_fwnode_is_ep) {
> +		dev_dbg(sd->dev, "unmatching node types (false)\n");

		dev_dbg(sd->dev, "direct match not found\n");

>  		return false;
> +	}
>  
>  	/*
>  	 * The sd and asd fwnodes are of different types. Get the device fwnode
> @@ -120,10 +129,15 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  		other_fwnode = sd_fwnode;
>  	}
>  
> +	dev_dbg(sd->dev, "async fwnode (compat) match %pfw vs. %pfw\n",
> +		dev_fwnode, other_fwnode);

Same comment as above regarding "vs." not telling which is which.

> +
>  	fwnode_handle_put(dev_fwnode);
>  
> -	if (dev_fwnode != other_fwnode)
> +	if (dev_fwnode != other_fwnode) {
> +		dev_dbg(sd->dev, "false\n");

		dev_dbg(sd->dev, "compat match not found\n");

>  		return false;
> +	}
>  
>  	/*
>  	 * We have a heterogeneous match. Retrieve the struct device of the side
> @@ -143,6 +157,8 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  			   dev->driver->name);
>  	}
>  
> +	dev_dbg(sd->dev, "true\n");

	dev_dbg(sd->dev, "compat match found\n");

> +
>  	return true;
>  }
>  
> @@ -255,7 +271,10 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
>  			v4l2_async_find_subdev_notifier(sd);
>  
>  		if (subdev_notifier &&
> -		    !v4l2_async_nf_can_complete(subdev_notifier))
> +		    !v4l2_async_nf_can_complete(subdev_notifier)) {
> +			if (subdev_notifier->sd)
> +				deb_dbg(subdev_notifier->sd->dev,
> +					"cannot complete\n");

I'd add a reference to v4l2-async, either directly in the string, or
with a "%s: ", __func__ prefix. Otherwise the message will be easy to
miss. Same in other messages. Maybe a "v4l2-async: " prefix for all
debug messages ?

>  			return false;
>  	}
>  
> @@ -273,18 +292,27 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
>  	if (!list_empty(&notifier->waiting))
>  		return 0;
>  
> +	if (notifier->sd)
> +		deb_dbg(notifier->sd->dev, "trying to complete\n");
> +
>  	/* Check the entire notifier tree; find the root notifier first. */
>  	while (notifier->parent)
>  		notifier = notifier->parent;
>  
>  	/* This is root if it has v4l2_dev. */
> -	if (!notifier->v4l2_dev)
> +	if (!notifier->v4l2_dev) {
> +		if (notifier->sd)
> +			deb_dbg(notifier->sd->dev,
> +				"V4L2 device not available\n");
>  		return 0;
> +	}
>  
>  	/* Is everything ready? */
>  	if (!v4l2_async_nf_can_complete(notifier))
>  		return 0;
>  
> +	deb_dbg(notifier->sd->dev, "complete\n");

You guard against notifier->sd being NULL above, but not here. At least
one of the two is wrong.

> +
>  	return v4l2_async_nf_call_complete(notifier);
>  }
>  
> @@ -386,6 +414,9 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
>  			continue;
>  
>  		ret = v4l2_async_match_notify(notifier, v4l2_dev, sd, asd);
> +		deb_dbg(sd->dev, "bound to %s's notifier (ret %d)\n",
> +			notifier->sd ? dev_name(notifier->sd->dev) : "no-dev",
> +			ret);
>  		if (ret < 0)
>  			return ret;
>  

-- 
Regards,

Laurent Pinchart
