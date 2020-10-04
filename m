Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07E42829A5
	for <lists+linux-media@lfdr.de>; Sun,  4 Oct 2020 10:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgJDIhh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Oct 2020 04:37:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54052 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDIhh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Oct 2020 04:37:37 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8F162A2;
        Sun,  4 Oct 2020 10:37:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601800655;
        bh=HBVcGpLUfbA9yNNqF2L/tQAHa9fxKVmhRIYZoVek6FU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kBkcdahjWMAODJ07Wx4obA7BoyBnUdJWf2TgCzPvWYYWorNOGQ47+RZcBPvJJUTpf
         1dkMtCsQimp05+lfIZGxqKAYsx33bnpDssCBQ8Ep3qpTJV8bD+yAwQh0YVkv7t/sD2
         jW3P3JDU5Lx0l5dYdAAdYJL4pykONILRRdUxzuew=
Date:   Sun, 4 Oct 2020 11:36:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, jmondi@jmondi.org
Subject: Re: [PATCH 3/5] v4l2-fwnode: Don't zero parts of struct
 v4l2_fwnode_endpoint anymore
Message-ID: <20201004083657.GD3938@pendragon.ideasonboard.com>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
 <20200930144811.16612-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200930144811.16612-4-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Wed, Sep 30, 2020 at 05:48:09PM +0300, Sakari Ailus wrote:
> Don't zero parts of the vep argument to v4l2_fwnode_endpoint_parse()
> anymore as this can no longer be done while still supporting defaults on
> multiple bus types.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index dfc53d11053f..44dd04b05e29 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -416,20 +416,8 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
>  	enum v4l2_mbus_type mbus_type;
>  	int rval;
>  
> -	if (vep->bus_type == V4L2_MBUS_UNKNOWN) {
> -		/* Zero fields from bus union to until the end */
> -		memset(&vep->bus, 0,
> -		       sizeof(*vep) - offsetof(typeof(*vep), bus));
> -	}
> -
>  	pr_debug("===== begin parsing endpoint %pfw\n", fwnode);
>  
> -	/*
> -	 * Zero the fwnode graph endpoint memory in case we don't end up parsing
> -	 * the endpoint.
> -	 */
> -	memset(&vep->base, 0, sizeof(vep->base));
> -
>  	fwnode_property_read_u32(fwnode, "bus-type", &bus_type);
>  	pr_debug("fwnode video bus type %s (%u), mbus type %s (%u)\n",
>  		 v4l2_fwnode_bus_type_to_string(bus_type), bus_type,

-- 
Regards,

Laurent Pinchart
