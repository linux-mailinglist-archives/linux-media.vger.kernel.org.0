Return-Path: <linux-media+bounces-54468-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPgbJYo4qGkTqgAAu9opvQ
	(envelope-from <linux-media+bounces-54468-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 14:50:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E385B200B3E
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 14:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C645307A55B
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 13:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BFC3A4F26;
	Wed,  4 Mar 2026 13:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFOhj92F"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFAC39FCD1;
	Wed,  4 Mar 2026 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632142; cv=none; b=Tpv5d51T4TRtSVJkWxsaVZYqdfXTumtezkbQFEMDDTgJQFxz3maRn39z7Hndm5L7ysxCWw1IIJ2JCf3CY4W7U7uJ0dHDTincVAS3hJBXtibSsCy+6JMvIO+zE+35Gv2JO/LNH4TXPdNzf6mzWi/zWbdeIjL+AlXodUqHucB1QzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632142; c=relaxed/simple;
	bh=qy151rX+YmtEP/Sa8aXip0kJW5DNxW4N5mW24QjwEZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxOY8ESZoGQYdL0ogYvih/xB7LjfM0TM4rXpJZPEZsY6Wx2ER2QUAtQG7Kd41LUzet8LLM8msgW6xfD91mKsFgxru60E227fG3r4OJ6d0qs94OGr8b0ftISNjK6so1OmkGwTJ/idKaX4GPiEq7i5A8cuTCboyhx0ipf7Lzw0iPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFOhj92F; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772632141; x=1804168141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qy151rX+YmtEP/Sa8aXip0kJW5DNxW4N5mW24QjwEZs=;
  b=FFOhj92FRFl/IHwkQ5qK/VRB/OUBlKiTivVAqGe4S/BkTy7s2zm0yZGC
   sdV3Yi0vNYFCpznw7JY22dAO+BikwlUnttR1GBlu70aldrrac435DxMsW
   9g2yz3bnaNx5fmf0TGrOwlwQFpx081gTXzVNgN+HC9siQeHwdb2qoilV2
   W7fQYtP5YOcEFDpRV6pIJ/LaJQw7D15frwKuIUOBbBN3HYvqh6pTevcBi
   +TuRGLZmIya2SVBbqQlfGBk+KEfSu88RHJA2gq9lY25CTlcqogzliiSbN
   h58RP4f/7x1l0kg2eG7/rz30z83SEudND8Bx7/G+Y+DSjcqEUJOC42nFN
   A==;
X-CSE-ConnectionGUID: AhSAgiBMQCKdtnlhwib36g==
X-CSE-MsgGUID: cqdLuLNURNiRKxnwMsS3pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73817703"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73817703"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:49:00 -0800
X-CSE-ConnectionGUID: 4+VvCo/iRuS+lEtrDzqtzg==
X-CSE-MsgGUID: WS/8tVENSuy/wOuVEdrN6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="215290195"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.233])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:48:58 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AB7FD121D1E;
	Wed, 04 Mar 2026 15:49:27 +0200 (EET)
Date: Wed, 4 Mar 2026 15:49:27 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: subdev: Add
 v4l2_subdev_get_frame_desc_passthrough helper
Message-ID: <aag4ZzS9TrmivwDg@kekkonen.localdomain>
References: <20250324-frame-desc-passthrough-v4-0-dbe2412297cc@ideasonboard.com>
 <20250324-frame-desc-passthrough-v4-1-dbe2412297cc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-frame-desc-passthrough-v4-1-dbe2412297cc@ideasonboard.com>
X-Rspamd-Queue-Id: E385B200B3E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54468-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,kekkonen.localdomain:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:email]
X-Rspamd-Action: no action

Moi,

On Mon, Mar 24, 2025 at 10:04:44AM +0200, Tomi Valkeinen wrote:
> Add a helper for v4l2_subdev_pad_ops.v4l2_get_frame_desc operation. The
> helper can be used when the subdevice directly passes through the
> streams.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 113 ++++++++++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           |  22 +++++++
>  2 files changed, 135 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index a3074f469b15..a415d3234ca6 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2502,6 +2502,119 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
>  
> +int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> +					   unsigned int pad,
> +					   struct v4l2_mbus_frame_desc *fd)
> +{
> +	const struct media_pad *pads = sd->entity.pads;
> +	struct media_pad *local_sink_pad;
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_subdev_state *state;
> +	struct device *dev = sd->dev;
> +	int ret = 0;
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
> +			struct media_pad *remote_source_pad;
> +			struct v4l2_subdev *remote_sd;
> +			unsigned int i;
> +
> +			if (route->source_pad != pad ||
> +			    route->sink_pad != local_sink_pad->index)
> +				continue;
> +
> +			if (!have_source_fd) {
> +				remote_source_pad = media_pad_remote_pad_unique(local_sink_pad);
> +				if (!remote_source_pad) {
> +					dev_dbg(dev, "Failed to find remote pad for sink pad %u\n",
> +						local_sink_pad->index);
> +					ret = -EINVAL;
> +					goto out_unlock;
> +				}
> +
> +				remote_sd = media_entity_to_v4l2_subdev(remote_source_pad->entity);
> +				if (!remote_sd) {
> +					ret = -EINVAL;
> +					goto out_unlock;
> +				}
> +
> +				ret = v4l2_subdev_call(remote_sd, pad,
> +						       get_frame_desc,
> +						       remote_source_pad->index,
> +						       &source_fd);
> +				if (ret) {
> +					dev_err(dev,
> +						"Failed to get frame desc from remote subdev %s\n",
> +						remote_sd->name);
> +					goto out_unlock;
> +				}
> +
> +				have_source_fd = true;
> +
> +				if (fd->num_entries == 0) {
> +					fd->type = source_fd.type;



> +				} else if (fd->type != source_fd.type) {
> +					dev_err(dev,
> +						"Frame desc type mismatch: %u != %u\n",
> +						fd->type, source_fd.type);
> +					ret = -EPIPE;
> +					goto out_unlock;
> +				}
> +			}
> +
> +			for (i = 0; i < source_fd.num_entries; i++) {

You could declare i here.

> +				if (source_fd.entry[i].stream == route->sink_stream) {
> +					source_entry = &source_fd.entry[i];
> +					break;
> +				}
> +			}
> +
> +			if (!source_entry) {
> +				dev_dbg(sd->dev,
> +					"Failed to find stream %u from source frame desc\n",
> +					route->sink_stream);
> +				ret = -EPIPE;
> +				goto out_unlock;
> +			}
> +
> +			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {

V4L2_FRAME_DESC_ENTRY_MAX is actually the size of the array. It'd be good
to rename the macro to reflect that. Of course that's out of scope right
now...

> +				dev_dbg(sd->dev, "Frame desc entry limit reached\n");
> +				ret = -ENOSPC;
> +				goto out_unlock;
> +			}
> +
> +			fd->entry[fd->num_entries] = *source_entry;
> +
> +			fd->entry[fd->num_entries].stream = route->source_stream;
> +
> +			fd->num_entries++;
> +		}
> +	}
> +
> +out_unlock:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>  
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 57f2bcb4eb16..7dc8625b131e 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1748,6 +1748,28 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>   */
>  int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable);
>  
> +/**
> + * v4l2_subdev_get_frame_desc_passthrough() - Helper to implement the subdev
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

Could you add how different frame descriptor types are handled?

A follow-up patch would be nice.

> + *
> + * Return: 0 on success, or a negative error code otherwise.
> + */
> +int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> +					   unsigned int pad,
> +					   struct v4l2_mbus_frame_desc *fd);
> +
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>  
>  #endif /* CONFIG_MEDIA_CONTROLLER */
> 

-- 
Kind regards,

Sakari Ailus

