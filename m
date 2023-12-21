Return-Path: <linux-media+bounces-2883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D941481BC4F
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 17:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 172481C243BF
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 16:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A582F58229;
	Thu, 21 Dec 2023 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pw/U4W11"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E4055E77
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7EA8C27C;
	Thu, 21 Dec 2023 17:44:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1703177077;
	bh=s0LtzrxsYzJS+yt2j7DmWUpPIYh1EOWZEsJ4StJ+beI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pw/U4W11K2IQ1/lU5k5hWSWfK2RY7vNfz6EfSldgSZQis6YYJaNHHOYXf6kQ+r015
	 B2Nfe2gJgbg7shtzm07o+aFhKZwvaS/dk4gll+kpmbIHP6k3lCx8i5wna9DGmVcv1q
	 vvZ3WmnTpZLn7RTqhoO2J/2+VT5ySaaz1sajfG6k=
Date: Thu, 21 Dec 2023 18:45:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@intel.com, hverkuil@xs4all.nl
Subject: Re: [PATCH 2/3] media: v4l2-mc: Add debug prints for
 v4l2_fwnode_create_links_for_pad()
Message-ID: <20231221164534.GD13598@pendragon.ideasonboard.com>
References: <20231221135822.152448-1-sakari.ailus@linux.intel.com>
 <20231221135822.152448-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231221135822.152448-3-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Dec 21, 2023 at 03:58:21PM +0200, Sakari Ailus wrote:
> Add relevant debug prints for v4l2_fwnode_create_links_for_pad(). This
> should help debugging when things go wrong.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
> ---
>  drivers/media/v4l2-core/v4l2-mc.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> index 52d349e72b8c..b1a6246580ec 100644
> --- a/drivers/media/v4l2-core/v4l2-mc.c
> +++ b/drivers/media/v4l2-core/v4l2-mc.c
> @@ -337,12 +337,18 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
>  		src_idx = media_entity_get_fwnode_pad(&src_sd->entity,
>  						      endpoint,
>  						      MEDIA_PAD_FL_SOURCE);
> -		if (src_idx < 0)
> +		if (src_idx < 0) {
> +			dev_dbg(src_sd->dev, "no pad found for %pfw\n",
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
> +				"sink pad index mismatch or error (was %d, expected %u)\n",

s/was/is/

> +				sink_idx, sink->index);
>  			continue;
> +		}
>  
>  		/*
>  		 * the source endpoint corresponds to one of its source pads,
> @@ -367,8 +377,11 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
>  		src = &src_sd->entity.pads[src_idx];
>  
>  		/* skip if link already exists */
> -		if (media_entity_find_link(src, sink))
> +		if (media_entity_find_link(src, sink)) {
> +			dev_dbg(src_sd->dev, "link from %pfw to %pfw exists\n",
> +				endpoint, remote_ep);

Should this be printed using the entity names and pad numbers instead,
as done below ?

>  			continue;
> +		}
>  
>  		dev_dbg(src_sd->dev, "creating link %s:%d -> %s:%d\n",
>  			src_sd->entity.name, src_idx,

-- 
Regards,

Laurent Pinchart

