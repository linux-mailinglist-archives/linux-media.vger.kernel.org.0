Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7740E2E3905
	for <lists+linux-media@lfdr.de>; Mon, 28 Dec 2020 14:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731634AbgL1NRx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Dec 2020 08:17:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731631AbgL1NRw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Dec 2020 08:17:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207B8C061794;
        Mon, 28 Dec 2020 05:17:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6598799;
        Mon, 28 Dec 2020 14:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609161428;
        bh=IcgI8ZiGoVQeWrVhvAi4jCXSswEN/GJ7vur314v3VMs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sfs1EOUqkruSzYbSEdcuk/cDF6oMCJCLnv0bV8O88ff8F8X8nw0hVOMbHqSf2qLpH
         aPxcY5TLOt7EfBroZAfYiZ2vcIH5nLWFirVjKEQjFHB9GzweXPdQ/YLUaqVV7iBQXJ
         UAXcWMX5N32ipvAc2PuLZwxez4jm1c+I/7MRSeW8=
Date:   Mon, 28 Dec 2020 15:16:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-async: Put fwnode after last access
Message-ID: <X+naygVCfh2QVh8P@pendragon.ideasonboard.com>
References: <20201228121725.133898-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201228121725.133898-1-ezequiel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Thank you for the patch.

On Mon, Dec 28, 2020 at 09:17:25AM -0300, Ezequiel Garcia wrote:
> fwnode_handle_put() should be called after the fwnode
> is last accessed. Fix it.
> 
> Fixes: b98158d837ef ("media: v4l2-async: Accept endpoints and devices for fwnode matching")
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index e3ab003a6c85..1303c9b83138 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -78,6 +78,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  	bool asd_fwnode_is_ep;
>  	bool sd_fwnode_is_ep;
>  	struct device *dev;
> +	bool match;
>  
>  	/*
>  	 * Both the subdev and the async subdev can provide either an endpoint
> @@ -113,9 +114,10 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  		other_fwnode = sd->fwnode;
>  	}
>  
> -	fwnode_handle_put(dev_fwnode);
> +	match = (dev_fwnode == other_fwnode);
>  
> -	if (dev_fwnode != other_fwnode)

This only performs a pointer comparison, it doesn't access dev_fwnode. I
don't think the change is necessary.

> +	fwnode_handle_put(dev_fwnode);
> +	if (!match)
>  		return false;
>  
>  	/*

-- 
Regards,

Laurent Pinchart
