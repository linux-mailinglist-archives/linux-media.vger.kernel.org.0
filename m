Return-Path: <linux-media+bounces-35366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F7AAE0BBC
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 19:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E363A4A23A8
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 17:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF32928C5B1;
	Thu, 19 Jun 2025 17:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qFlxBhLD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD3621D3E7
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 17:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750352859; cv=none; b=rqydd53lLhkl9P6KSxLOMcHXNKY6M10sjBxdXOKU73wMVKv13Gi0BGMKjUtXwRZaQXg8HIAn2w5/ZGGeVGLK7GbbOU639YfhtI3sCKiJm9WmHANt7jqioScEKGPDsgXkIcdvBy6rhO/9gqIcUwGUYKgMRDj/xqJ+8EwKdXGA/ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750352859; c=relaxed/simple;
	bh=BC9x1/KIg8M+1xsTHEyRUohVq9OGJs/e0EbFAAdf/o4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zl79AKeTjS3ni2iGPHYiAlghTABhkDCokbvGOarMHi2yR1kXmwDZ5Br31NzrlMqzgCcZe59RKbLKxGO6jcb6MuZrUdp2jEsVl2aqUAiZfyqWJ9JOzMebjlYkyhduCSfswc/xwIz+urtN9UyC1eM3+FHt5J/U0UKvijr4sLHNSic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qFlxBhLD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C93B346;
	Thu, 19 Jun 2025 19:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750352841;
	bh=BC9x1/KIg8M+1xsTHEyRUohVq9OGJs/e0EbFAAdf/o4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFlxBhLDcBfq8qEhSDrX+AIhjKqAWFwEbk/CghCxSbjDwbQCoOCqLcglXUPwtqvo5
	 RV7qnSedw863T+JaDWqKokAlPxq17t7QfbJxOOWNAEs0W2bRB+bFAdQX67MLiTIhx/
	 vHcw3w12163CbNdihjZYNXZgB569r1Qu7DyNEUz8=
Date: Thu, 19 Jun 2025 20:07:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 09/13] media: v4l2-subdev: Collect streams on source pads
 only
Message-ID: <20250619170717.GK32166@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619081546.1582969-10-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Jun 19, 2025 at 11:15:42AM +0300, Sakari Ailus wrote:
> v4l2_subdev_collect_streams() is used to find the streams present on
> source pads only. Only iterate through the streams on source pads, i.e. on
> odd array indices.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 6bc855058ca6..932fca795d4a 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2225,16 +2225,17 @@ static void v4l2_subdev_collect_streams(struct v4l2_subdev *sd,
>  	*found_streams = 0;
>  	*enabled_streams = 0;
>  
> -	for (unsigned int i = 0; i < state->stream_configs.num_configs; ++i) {
> -		const struct v4l2_subdev_stream_config *cfg =
> -			&state->stream_configs.configs[i];
> +	for (unsigned int i = 0; i < state->stream_configs.num_configs; i += 2) {
> +		const struct v4l2_subdev_stream_config *src_cfg =
> +			&state->stream_configs.configs[i + 1];

You could start at i = 1 and avoid the + 1 here.

Unless I missed it, I don't think we document anywhere that we store two
values per route in the array, and that, if multiple routes have the
same sink or source stream, multiple entries will exist for the same
stream. I'd like to see this clearly explained somewhere, instead of
relying on an implemetation detail only known by few people.

>  
> -		if (cfg->pad != pad || !(streams_mask & BIT_ULL(cfg->stream)))
> +		if (src_cfg->pad != pad ||
> +		    !(streams_mask & BIT_ULL(src_cfg->stream)))
>  			continue;
>  
> -		*found_streams |= BIT_ULL(cfg->stream);
> -		if (cfg->enabled)
> -			*enabled_streams |= BIT_ULL(cfg->stream);
> +		*found_streams |= BIT_ULL(src_cfg->stream);
> +		if (src_cfg->enabled)
> +			*enabled_streams |= BIT_ULL(src_cfg->stream);
>  	}
>  }
>  

-- 
Regards,

Laurent Pinchart

