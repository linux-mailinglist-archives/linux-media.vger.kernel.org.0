Return-Path: <linux-media+bounces-28134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D85A5F19B
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 683D117A67C
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CA626770E;
	Thu, 13 Mar 2025 10:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlNziZZ/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8760F13C689;
	Thu, 13 Mar 2025 10:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741863227; cv=none; b=XCAEvosuW44L7cHfvacifxPAZH6pkQlP0gycMP2rF6+TSpDODQMa72dSNU/CwRzwbrPLXKOJwDQ/IkJtvbDgaH5ikZxOZB+9q8J4pDViicFgHpyVgZEORuoC0uSnXsXH/t4PJBZFJ3bu8eqjJdzzAi4+LZgReMnr6zqX+glxj1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741863227; c=relaxed/simple;
	bh=VBvW1Cz+KeMZ6s39Dpsv+cM8XoNO1COwFwQZUAeoqtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaMlJbbVZ2wNUo/yyKOTTxbwSGiWiza6qRvmUiAJwGqZLbEXpHQLTdoem1BHL4LWaXhAwEVzKyTjv4mVZi4crUF7DhrvPgmO6xlKl09iCWLJcdXj/0J/u1qzTQeNNjVdf1ykhGZwNNVZpaOKfRXmzc/+508X9xFqd1FqmKs+/Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlNziZZ/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741863225; x=1773399225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VBvW1Cz+KeMZ6s39Dpsv+cM8XoNO1COwFwQZUAeoqtw=;
  b=YlNziZZ//HslBbIEW7jtKD+u+m0uTd1Kv+1+G82GH0QMNzmGnUeeR3bt
   wM3v9o6hBMuBx/XF+0yLrQ+6We1IXKFoYelUoJ5THuy2Cc1M97ccbvZo7
   3I7QfGGL4qN+fNzHMF3k6HBXKgGZFWCDTlKZdn1dWb+uMT/tw1Itqo/2o
   ZXO5EtDqBvp+nMVYHcX1/xAzehXRhDVIP9Q9VSgIu8oEVAeWk2HIPvgk9
   uei21bwWcTczrbw/Nu8UPlBX0o3ieb7W4+m06nq7pjWj1PLMfg6tajmJ2
   OjgGHs8BZ8GFXxBCgvXhdpBvMBrRut8lNoVdTQpJ0y1vnLsxvv9Kq0hZA
   w==;
X-CSE-ConnectionGUID: M7gTLczWQ2OgL+mtvwiGvQ==
X-CSE-MsgGUID: XHNgq/l/SSCDs1spgfXS2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53609980"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="53609980"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:53:44 -0700
X-CSE-ConnectionGUID: vVJ7n8MASNq97fLfPeLeoA==
X-CSE-MsgGUID: cy6aRTCTR+WdC67qth86jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="144101340"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:53:42 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2A4711202E6;
	Thu, 13 Mar 2025 12:53:40 +0200 (EET)
Date: Thu, 13 Mar 2025 10:53:40 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: subdev: Add v4l2_get_frame_desc_passthrough
 helper
Message-ID: <Z9K5ND3PYwitjuAg@kekkonen.localdomain>
References: <20250218-frame-desc-passthrough-v1-0-a32458f53714@ideasonboard.com>
 <20250218-frame-desc-passthrough-v1-1-a32458f53714@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-frame-desc-passthrough-v1-1-a32458f53714@ideasonboard.com>

Moi,

Thanks for the set.

On Tue, Feb 18, 2025 at 06:15:43PM +0200, Tomi Valkeinen wrote:
> Add a helper for v4l2_subdev_pad_ops.v4l2_get_frame_desc operation. The
> helper can be used when the subdevice directly passes through the
> streams.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 96 +++++++++++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 21 ++++++++
>  2 files changed, 117 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index cde1774c9098..f04de851d777 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2500,6 +2500,102 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
>  
> +int v4l2_get_frame_desc_passthrough(struct v4l2_subdev *sd, unsigned int pad,

Shouldn't this be called v4l2_subdev_get_frame_desc_passthrough? It's long
but that's unlikely to be a problem still.

> +				    struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_subdev_state *state;
> +	int ret;
> +	const struct media_pad *pads = sd->entity.pads;
> +	struct media_pad *local_sink_pad;
> +
> +	if (WARN_ON(!(pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
> +		return -EINVAL;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	/* Iterate over sink pads */
> +	media_entity_for_each_pad(&sd->entity, local_sink_pad) {
> +		struct v4l2_mbus_frame_desc source_fd;
> +		bool have_source_fd = false;
> +
> +		if (!(local_sink_pad->flags & MEDIA_PAD_FL_SINK))
> +			continue;
> +
> +		/*
> +		 * Copy frame desc entries for the streams going from the sink
> +		 * pad to the requested pad
> +		 */
> +		for_each_active_route(&state->routing, route) {
> +			struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
> +			unsigned int i;
> +			struct media_pad *remote_source_pad;
> +			struct v4l2_subdev *remote_sd;
> +
> +			if (route->source_pad != pad ||
> +			    route->sink_pad != local_sink_pad->index)
> +				continue;
> +
> +			if (!have_source_fd) {
> +				remote_source_pad = media_pad_remote_pad_unique(local_sink_pad);
> +				if (!remote_source_pad) {
> +					ret = -EINVAL;
> +					goto out_unlock;
> +				}
> +
> +				remote_sd = media_entity_to_v4l2_subdev(remote_source_pad->entity);
> +				if (!remote_sd) {
> +					ret = -EINVAL;

Having dev_dbg()'s for all these cases would be nice. Otherwise it'll be
hard to figure out what went wrong.

> +					goto out_unlock;
> +				}
> +
> +				ret = v4l2_subdev_call(remote_sd, pad,
> +						       get_frame_desc,
> +						       remote_source_pad->index,
> +						       &source_fd);
> +				if (ret)
> +					goto out_unlock;
> +
> +				have_source_fd = true;
> +
> +				if (fd->num_entries == 0) {
> +					fd->type = source_fd.type;
> +				} else if (fd->type != source_fd.type) {
> +					ret = -EPIPE;
> +					goto out_unlock;
> +				}
> +			}
> +
> +			for (i = 0; i < source_fd.num_entries; i++) {
> +				if (source_fd.entry[i].stream == route->sink_stream) {
> +					source_entry = &source_fd.entry[i];
> +					break;
> +				}
> +			}
> +
> +			if (!source_entry) {
> +				dev_err(sd->dev,
> +					"Failed to find stream %u from source frame desc\n",
> +					route->sink_stream);
> +				ret = -EPIPE;
> +				goto out_unlock;
> +			}
> +
> +			fd->entry[fd->num_entries] = *source_entry;
> +
> +			fd->entry[fd->num_entries].stream = route->source_stream;
> +
> +			fd->num_entries++;

Could you check you're not overflowing what's allocated?

> +		}
> +	}
> +
> +out_unlock:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_get_frame_desc_passthrough);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>  
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 2f2200875b03..d42fb3f55515 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1746,6 +1746,27 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>   */
>  int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable);
>  
> +/**
> + * v4l2_get_frame_desc_passthrough() - Helper to implement the subdev
> + *	v4l2_get_frame_desc operation in simple passthrough cases
> + * @sd: The subdevice
> + * @pad: The source pad index
> + * @fd: The mbus frame desc
> + *
> + * Subdevice drivers that only pass through the streams can use this helper
> + * to implement the &v4l2_subdev_pad_ops.v4l2_get_frame_desc operation.
> + *
> + * The helper will call get_frame_desc on the subdevice's sources, create a new
> + * frame desc which contains only the streams on the given source pad. The data
> + * for each frame desc entry is copied directly from the data provided from the
> + * calls to the subdevice's sources, with the exception of the 'stream' field
> + * which is set according to the subdevice's routing table.
> + *
> + * Return: 0 on success, or a negative error code otherwise.
> + */
> +int v4l2_get_frame_desc_passthrough(struct v4l2_subdev *sd, unsigned int pad,
> +				    struct v4l2_mbus_frame_desc *fd);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>  
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> 

-- 
Kind regards,

Sakari Ailus

