Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4776256CB1E
	for <lists+linux-media@lfdr.de>; Sat,  9 Jul 2022 20:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbiGISuE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jul 2022 14:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiGISuD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Jul 2022 14:50:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A5111479
        for <linux-media@vger.kernel.org>; Sat,  9 Jul 2022 11:50:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FABE47C;
        Sat,  9 Jul 2022 20:49:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657392599;
        bh=9HHbUwSL+h2RgS9FN4hhw3wyTeWo+6vYu9kbvJ2z7D8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CTuetifGr8GRjlUKAiqRdrxp5UFZ2T6z/xV+yZlYW0HRXxRbZopgozoo6xzIqjL1h
         j/5qD3pR/1XDy7VWRoTRck2A05qzodZFi9FZ5LRTIIRaMWEbp9WiFf+NFvx8Q+lZZU
         SH3P5FX80Bfre4Wy5Pt9hfhRMEnfYM5FRRP2V54I=
Date:   Sat, 9 Jul 2022 21:49:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, djrscally@gmail.com,
        mchehab@kernel.org
Subject: Re: [PATCH v2 1/1] v4l: async: Also match secondary fwnode endpoints
Message-ID: <YsnNvKobdSRQxCKj@pendragon.ideasonboard.com>
References: <20220709160123.3033324-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220709160123.3033324-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Sat, Jul 09, 2022 at 07:01:23PM +0300, Sakari Ailus wrote:
> For camera sensor devices the firmware information comes from non-DT (or

Did you mean "camera sensor devices whose formation information comes
from non-DT" ?

> some ACPI variants), the kernel makes the information visible to the
> drivers in a form similar to DT. This takes place through device's
> secondary fwnodes, in which case also the secondary fwnode needs to be
> heterogenously (endpoint vs. device) matched.
> 
> Fixes: 1f391df44607 ("media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> With correct indentation this time.
> 
>  drivers/media/v4l2-core/v4l2-async.c | 49 ++++++++++++++++------------
>  1 file changed, 28 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index c6995718237a4..2db5d7a8af82b 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -66,8 +66,10 @@ static bool match_i2c(struct v4l2_async_notifier *notifier,
>  #endif
>  }
>  
> -static bool match_fwnode(struct v4l2_async_notifier *notifier,
> -			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> +static bool
> +match_fwnode_one(struct v4l2_async_notifier *notifier,
> +		 struct v4l2_subdev *sd, struct fwnode_handle *sd_fwnode,
> +		 struct v4l2_async_subdev *asd)
>  {
>  	struct fwnode_handle *other_fwnode;
>  	struct fwnode_handle *dev_fwnode;
> @@ -75,22 +77,6 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  	bool sd_fwnode_is_ep;
>  	struct device *dev;
>  
> -	/*
> -	 * Both the subdev and the async subdev can provide either an endpoint
> -	 * fwnode or a device fwnode. Start with the simple case of direct
> -	 * fwnode matching.
> -	 */
> -	if (sd->fwnode == asd->match.fwnode)
> -		return true;
> -
> -	/*
> -	 * Check the same situation for any possible secondary assigned to the
> -	 * subdev's fwnode
> -	 */
> -	if (!IS_ERR_OR_NULL(sd->fwnode->secondary) &&
> -	    sd->fwnode->secondary == asd->match.fwnode)
> -		return true;

This check is now gone, is it not needed ?

> -
>  	/*
>  	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
>  	 * endpoint or a device. If they're of the same type, there's no match.
> @@ -99,7 +85,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  	 * ACPI. This won't make a difference, as drivers should not try to
>  	 * match unconnected endpoints.
>  	 */
> -	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd->fwnode);
> +	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
>  	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
>  
>  	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> @@ -110,11 +96,11 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  	 * parent of the endpoint fwnode, and compare it with the other fwnode.
>  	 */
>  	if (sd_fwnode_is_ep) {
> -		dev_fwnode = fwnode_graph_get_port_parent(sd->fwnode);
> +		dev_fwnode = fwnode_graph_get_port_parent(sd_fwnode);
>  		other_fwnode = asd->match.fwnode;
>  	} else {
>  		dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
> -		other_fwnode = sd->fwnode;
> +		other_fwnode = sd_fwnode;
>  	}
>  
>  	fwnode_handle_put(dev_fwnode);
> @@ -143,6 +129,27 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  	return true;
>  }
>  
> +static bool match_fwnode(struct v4l2_async_notifier *notifier,
> +			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> +{
> +	/*
> +	 * Both the subdev and the async subdev can provide either an endpoint
> +	 * fwnode or a device fwnode. Start with the simple case of direct
> +	 * fwnode matching.
> +	 */
> +	if (sd->fwnode == asd->match.fwnode)
> +		return true;
> +
> +	if (match_fwnode_one(notifier, sd, sd->fwnode, asd))
> +		return true;
> +
> +	/* Also check the secondary fwnode. */
> +	if (IS_ERR_OR_NULL(sd->fwnode->secondary))
> +		return false;
> +
> +	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, asd);
> +}
> +
>  static LIST_HEAD(subdev_list);
>  static LIST_HEAD(notifier_list);
>  static DEFINE_MUTEX(list_lock);

-- 
Regards,

Laurent Pinchart
