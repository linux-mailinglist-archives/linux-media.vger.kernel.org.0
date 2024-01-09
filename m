Return-Path: <linux-media+bounces-3394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D73EC8285CD
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 13:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 819712873F8
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 12:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38872374F2;
	Tue,  9 Jan 2024 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PTlbiIts"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A27374CB
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14C15552;
	Tue,  9 Jan 2024 13:08:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1704802117;
	bh=UvwI9pm5kscdncnYXgo/8sKHwOwOSrkn6IRmv4fQmJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PTlbiItsFVq/YL0v5D/bFF7OEfhdi4ANaMJZc1QFP8ZWm0q6R8Yb2BboZYTqCY+Pb
	 EEYmJtjbwzlQ3dBIUUmqiBS1jph87h8u99QpG4mNYCnynqNnHLiqM/XcqZqDhJLtj6
	 toCjHuS8+PId0RvIm9Pzn7/LzMjxxCxynVnkwRsI=
Date: Tue, 9 Jan 2024 14:09:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@intel.com, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 2/3] media: v4l2-mc: Add debug prints for
 v4l2_fwnode_create_links_for_pad()
Message-ID: <20240109120950.GB11622@pendragon.ideasonboard.com>
References: <20240105083757.197846-1-sakari.ailus@linux.intel.com>
 <20240105083757.197846-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240105083757.197846-3-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Fri, Jan 05, 2024 at 10:37:56AM +0200, Sakari Ailus wrote:
> Add relevant debug prints for v4l2_fwnode_create_links_for_pad(). This
> should help debugging when things go wrong.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-mc.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> index 52d349e72b8c..e394f3e505d8 100644
> --- a/drivers/media/v4l2-core/v4l2-mc.c
> +++ b/drivers/media/v4l2-core/v4l2-mc.c
> @@ -337,12 +337,18 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
>  		src_idx = media_entity_get_fwnode_pad(&src_sd->entity,
>  						      endpoint,
>  						      MEDIA_PAD_FL_SOURCE);
> -		if (src_idx < 0)
> +		if (src_idx < 0) {
> +			dev_dbg(src_sd->dev, "no pad found for %pfw\n",

Make is "no source pad found", as we're looking for source pads only and
the message would be confusing if the entity has sink pads.

> +				endpoint);
>  			continue;
> +		}
>  
>  		remote_ep = fwnode_graph_get_remote_endpoint(endpoint);
> -		if (!remote_ep)
> +		if (!remote_ep) {
> +			dev_dbg(src_sd->dev, "no remote ep found for %pfw\n",
> +				endpoint);
>  			continue;
> +		}
>  
>  		/*
>  		 * ask the sink to verify it owns the remote endpoint,
> @@ -353,8 +359,12 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
>  						       MEDIA_PAD_FL_SINK);
>  		fwnode_handle_put(remote_ep);
>  
> -		if (sink_idx < 0 || sink_idx != sink->index)
> +		if (sink_idx < 0 || sink_idx != sink->index) {
> +			dev_dbg(src_sd->dev,
> +				"sink pad index mismatch or error (is %d, expected %u)\n",
> +				sink_idx, sink->index);
>  			continue;
> +		}
>  
>  		/*
>  		 * the source endpoint corresponds to one of its source pads,
> @@ -367,8 +377,13 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
>  		src = &src_sd->entity.pads[src_idx];
>  
>  		/* skip if link already exists */
> -		if (media_entity_find_link(src, sink))
> +		if (media_entity_find_link(src, sink)) {
> +			dev_dbg(src_sd->dev,
> +				"link %s:%d -> %s:%d already exists\n",
> +				src_sd->entity.name, src_idx,

Is this worth a debug message ? If the link already exists, do you
expect this to cause any kind of issue that someone will want to debug ?

Overall, are the new debug messages in this patch helped debugging a
real life problem ?

> +				sink->entity->name, sink_idx);
>  			continue;
> +		}
>  
>  		dev_dbg(src_sd->dev, "creating link %s:%d -> %s:%d\n",
>  			src_sd->entity.name, src_idx,

-- 
Regards,

Laurent Pinchart

