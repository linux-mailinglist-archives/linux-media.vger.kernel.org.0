Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD4B3A9F0D
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 17:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234379AbhFPPa1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 11:30:27 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:57477 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234357AbhFPPaZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 11:30:25 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4009E6000A;
        Wed, 16 Jun 2021 15:28:16 +0000 (UTC)
Date:   Wed, 16 Jun 2021 17:29:06 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] media: v4l2-fwnode: Simplify
 v4l2_async_nf_parse_fwnode_endpoints()
Message-ID: <20210616152906.wv6y766ttc4fsiyy@uno.localdomain>
References: <20210613150847.774978-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210613150847.774978-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Sun, Jun 13, 2021 at 05:08:47PM +0200, Niklas Söderlund wrote:
> There are only one user left of __v4l2_async_notifier_parse_fwnode_ep()
> since [1], v4l2_async_notifier_parse_fwnode_endpoints(). The two
> functions can be merged.
>
> The merge of the two highlights a dead code block conditioned by the
> argument 'has_port' that always is false and can therefor be removed.
>
> 1. commit 0ae426ebd0dcef81 ("media: v4l2-fwnode: Remove v4l2_async_notifier_parse_fwnode_endpoints_by_port()")
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Makes sense to me

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
> * Changes since v2
> - Extend commit message to describe that the dead code removed is created
>   by the merge of the two functions.
> - The rename of the effected function never made it upstream, rebase
>   this patch to latest media-tree so it can be picked-up without the
>   rename.
>
> * Changes since v1
> - Rebased on Sakari's branch which renames
>   v4l2_async_notifier_parse_fwnode_endpoints() to
>   v4l2_async_nf_parse_fwnode_endpoints).
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 33 ++++-----------------------
>  1 file changed, 5 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 843259c304bb5857..60ef0e11af51850c 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -839,13 +839,11 @@ v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
>  	return ret == -ENOTCONN ? 0 : ret;
>  }
>
> -static int
> -__v4l2_async_notifier_parse_fwnode_ep(struct device *dev,
> -				      struct v4l2_async_notifier *notifier,
> -				      size_t asd_struct_size,
> -				      unsigned int port,
> -				      bool has_port,
> -				      parse_endpoint_func parse_endpoint)
> +int
> +v4l2_async_notifier_parse_fwnode_endpoints(struct device *dev,
> +					   struct v4l2_async_notifier *notifier,
> +					   size_t asd_struct_size,
> +					   parse_endpoint_func parse_endpoint)
>  {
>  	struct fwnode_handle *fwnode;
>  	int ret = 0;
> @@ -863,16 +861,6 @@ __v4l2_async_notifier_parse_fwnode_ep(struct device *dev,
>  		if (!is_available)
>  			continue;
>
> -		if (has_port) {
> -			struct fwnode_endpoint ep;
> -
> -			ret = fwnode_graph_parse_endpoint(fwnode, &ep);
> -			if (ret)
> -				break;
> -
> -			if (ep.port != port)
> -				continue;
> -		}
>
>  		ret = v4l2_async_notifier_fwnode_parse_endpoint(dev,
>  								notifier,
> @@ -887,17 +875,6 @@ __v4l2_async_notifier_parse_fwnode_ep(struct device *dev,
>
>  	return ret;
>  }
> -
> -int
> -v4l2_async_notifier_parse_fwnode_endpoints(struct device *dev,
> -					   struct v4l2_async_notifier *notifier,
> -					   size_t asd_struct_size,
> -					   parse_endpoint_func parse_endpoint)
> -{
> -	return __v4l2_async_notifier_parse_fwnode_ep(dev, notifier,
> -						     asd_struct_size, 0,
> -						     false, parse_endpoint);
> -}
>  EXPORT_SYMBOL_GPL(v4l2_async_notifier_parse_fwnode_endpoints);
>
>  /*
> --
> 2.32.0
>
