Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D24B3D7542
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 14:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbhG0MpM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 08:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbhG0MpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 08:45:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311F5C061757
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 05:45:08 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 751763F2;
        Tue, 27 Jul 2021 14:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627389906;
        bh=1n16Sqa9QZU+WgPj8Qg3JKcb4ilCUMnpZze30TKNwEg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=qTOfAXPl0aQnz8CAx/hTyv1RA5j5thSMgqqtkoeV39fMpWCcDLryEH0eNRO/WvoJq
         yFoaB12coVYZgD4lLt4GwDGNeQRyLNUkvCFWO5KA8vZ83OH5ElJHo/KzqbLAk0rt0b
         pqHZsyvEQRAS0pgeacEzucHfy8e2tEmaJWr4HG6Y=
Subject: Re: [PATCH v3 4/6] media: v4l2-fwnode: Simplify
 v4l2_async_nf_parse_fwnode_endpoints()
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20210624084046.13136-1-sakari.ailus@linux.intel.com>
 <20210624084046.13136-5-sakari.ailus@linux.intel.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <cf5bcd62-a761-0ff9-6d71-f795f89b18de@ideasonboard.com>
Date:   Tue, 27 Jul 2021 13:45:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624084046.13136-5-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas/Sakari

On 24/06/2021 09:40, Sakari Ailus wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> There are only one user left of __v4l2_async_nf_parse_fwnode_ep()
> since [1], v4l2_async_nf_parse_fwnode_endpoints(). The two
> functions can be merged.
> 
> The merge of the two highlights a dead code block conditioned by the
> argument 'has_port' that always is false and can therefor be removed.

s/therefor/therefore/

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> 
> 1. commit 0ae426ebd0dcef81 ("media: v4l2-fwnode: Remove v4l2_async_notifier_parse_fwnode_endpoints_by_port()")
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> [Sakari Ailus: Aligned some lines to opening parentheses.]
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
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
> 
