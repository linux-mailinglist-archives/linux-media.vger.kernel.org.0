Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35C2F56CEE4
	for <lists+linux-media@lfdr.de>; Sun, 10 Jul 2022 14:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiGJMDw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 08:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiGJMDu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 08:03:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8CF1181A
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 05:03:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22BD64F7;
        Sun, 10 Jul 2022 14:03:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657454626;
        bh=NLz3tL+EShQA0bQOwVG/HJloJvPwu3tILbMv4O2VToM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d0gxZ68abYCgzHP38JTmhj9zKeIoH1aUf6wWnRhh8/ll3KK2/JtJmH89BjZClLRyF
         +bGfs+n106jTaycnbnslVFbdhjZRm5WESbo/Hq4Isoa8efypqCG2/561FkHstLwgp7
         bKMxNjJ83lTkYTZkPjjwFQprv6fe2UpJ05q7/cnI=
Date:   Sun, 10 Jul 2022 15:03:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, djrscally@gmail.com,
        mchehab@kernel.org
Subject: Re: [PATCH v3 1/1] v4l: async: Also match secondary fwnode endpoints
Message-ID: <YsrAB86fDl1gMKZG@pendragon.ideasonboard.com>
References: <20220710084416.3048177-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220710084416.3048177-1-sakari.ailus@linux.intel.com>
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

On Sun, Jul 10, 2022 at 11:44:16AM +0300, Sakari Ailus wrote:
> For camera sensor devices the firmware information of which comes from

I'll let a native English speaker comment on "whose" vs. "of which".

> non-DT (or some ACPI variants), the kernel makes the information visible
> to the drivers in a form similar to DT. This takes place through device's
> secondary fwnodes, in which case also the secondary fwnode needs to be
> heterogenously (endpoint vs. device) matched.
> 
> Fixes: 1f391df44607 ("media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> since v2:
> 
> - Also check direct match with secondary fwnode.
> 
>  drivers/media/v4l2-core/v4l2-async.c | 35 +++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index c6995718237a4..b16f3ce8e5ef1 100644
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
> @@ -80,15 +82,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  	 * fwnode or a device fwnode. Start with the simple case of direct
>  	 * fwnode matching.
>  	 */
> -	if (sd->fwnode == asd->match.fwnode)
> -		return true;
> -
> -	/*
> -	 * Check the same situation for any possible secondary assigned to the
> -	 * subdev's fwnode
> -	 */
> -	if (!IS_ERR_OR_NULL(sd->fwnode->secondary) &&
> -	    sd->fwnode->secondary == asd->match.fwnode)
> +	if (sd_fwnode == asd->match.fwnode)
>  		return true;
>  
>  	/*
> @@ -99,7 +93,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  	 * ACPI. This won't make a difference, as drivers should not try to
>  	 * match unconnected endpoints.
>  	 */
> -	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd->fwnode);
> +	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
>  	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
>  
>  	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> @@ -110,11 +104,11 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
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
> @@ -143,6 +137,19 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  	return true;
>  }
>  
> +static bool match_fwnode(struct v4l2_async_notifier *notifier,
> +			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> +{
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
