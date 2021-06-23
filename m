Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 857443B1D58
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 17:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbhFWPP1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 11:15:27 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:52981 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbhFWPP1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 11:15:27 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1999220013;
        Wed, 23 Jun 2021 15:13:06 +0000 (UTC)
Date:   Wed, 23 Jun 2021 17:13:55 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: Re: [PATCH 4/6] media: v4l2-fwnode: Simplify
 v4l2_async_nf_parse_fwnode_endpoints()
Message-ID: <20210623151355.zzkhfbhaueoh6jcu@uno.localdomain>
References: <20210622112200.13914-1-sakari.ailus@linux.intel.com>
 <20210622112200.13914-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210622112200.13914-5-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Jun 22, 2021 at 02:21:58PM +0300, Sakari Ailus wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
> There are only one user left of __v4l2_async_nf_parse_fwnode_ep()
> since [1], v4l2_async_nf_parse_fwnode_endpoints(). The two
> functions can be merged.
>
> The merge of the two highlights a dead code block conditioned by the
> argument 'has_port' that always is false and can therefor be removed.
>
> 1. commit 0ae426ebd0dcef81 ("media: v4l2-fwnode: Remove v4l2_async_notifier_parse_fwnode_endpoints_by_port()")
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> [Sakari Ailus: Aligned some lines to opening parentheses.]
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I guess my tag went lost
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 31 +++++----------------------
>  1 file changed, 5 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index e5507501b0f3..00457e1e93f6 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -839,12 +839,11 @@ v4l2_async_nf_fwnode_parse_endpoint(struct device *dev,
>  	return ret == -ENOTCONN ? 0 : ret;
>  }
>
> -static int
> -__v4l2_async_nf_parse_fwnode_ep(struct device *dev,
> -				struct v4l2_async_notifier *notifier,
> -				size_t asd_struct_size, unsigned int port,
> -				bool has_port,
> -				parse_endpoint_func parse_endpoint)
> +int
> +v4l2_async_nf_parse_fwnode_endpoints(struct device *dev,
> +				     struct v4l2_async_notifier *notifier,
> +				     size_t asd_struct_size,
> +				     parse_endpoint_func parse_endpoint)
>  {
>  	struct fwnode_handle *fwnode;
>  	int ret = 0;
> @@ -862,16 +861,6 @@ __v4l2_async_nf_parse_fwnode_ep(struct device *dev,
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
>  		ret = v4l2_async_nf_fwnode_parse_endpoint(dev, notifier,
>  							  fwnode,
> @@ -885,16 +874,6 @@ __v4l2_async_nf_parse_fwnode_ep(struct device *dev,
>
>  	return ret;
>  }
> -
> -int
> -v4l2_async_nf_parse_fwnode_endpoints(struct device *dev,
> -				     struct v4l2_async_notifier *notifier,
> -				     size_t asd_struct_size,
> -				     parse_endpoint_func parse_endpoint)
> -{
> -	return __v4l2_async_nf_parse_fwnode_ep(dev, notifier, asd_struct_size,
> -					       0, false, parse_endpoint);
> -}
>  EXPORT_SYMBOL_GPL(v4l2_async_nf_parse_fwnode_endpoints);
>
>  /*
> --
> 2.30.2
>
