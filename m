Return-Path: <linux-media+bounces-56224-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGpbBYPkummdcwIAu9opvQ
	(envelope-from <linux-media+bounces-56224-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 18:44:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 691DA2C083A
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 18:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EA7E3243E72
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 17:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C97921576E;
	Wed, 18 Mar 2026 17:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cje+x5TK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157963242D9;
	Wed, 18 Mar 2026 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853252; cv=none; b=oy7u2hYffa1WFcNUsygBc7/KgUDLOAQ2APsbxLAh9MafMMYRkp1MBVfwM9hvpt2fTH5M6WpIKNj89ytS8gbQxWrP5waUCUvLFMTk0RN1zgf68NkxlJbA9Uyg0I+pDQWPZgMC8cyPpjDmklYgwhLuxMR5fPqBNURnsx0HTEv+EE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853252; c=relaxed/simple;
	bh=8sqekVVwlhrh7Ch7gPJPaOLxwFw6Db7aI/CwVV+d284=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wug5OllSnJnf2eY+ygIK6DyU6O2z7buSpdeoG6kEv644vtOloIOF8Os1YJr2dKhrKHMI5MetpuJH8LM+c5mVmq91+pctCaK6rcd9XLBW1tsULEUo/Ob2gmR7Tgjrs4NOGID6cEvr56CwP9Wz1tvTit+RlkJiIxNTdTZm/R+qIcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cje+x5TK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 653778CC;
	Wed, 18 Mar 2026 17:59:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773853175;
	bh=8sqekVVwlhrh7Ch7gPJPaOLxwFw6Db7aI/CwVV+d284=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cje+x5TKrE8H0CigRciBfYHeWu7AxMHAwQ4CtDe/NvnMnXC6d6LQB2XT1KZFJsh0S
	 vvgEf7C4aBJevlTvT4ylCyUJrkQkgOv8uVLFfRSIUvi4IWo1DzMuLnxMsP+YiT0dYL
	 7ZrnKSyje2arx7Q/58hSsyFOuVdKVnfBxvqwLqCg=
Date: Wed, 18 Mar 2026 19:00:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v2 3/3] media: subdev: Split
 v4l2_subdev_get_frame_desc_passthrough() into locked and unlocked
Message-ID: <20260318170046.GG633439@killaraus.ideasonboard.com>
References: <20260317-frame-desc-passthrough-impro-v2-0-0c93b437d85d@ideasonboard.com>
 <20260317-frame-desc-passthrough-impro-v2-3-0c93b437d85d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317-frame-desc-passthrough-impro-v2-3-0c93b437d85d@ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56224-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 691DA2C083A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tomi,

Thank you for the patch.

On Tue, Mar 17, 2026 at 02:09:42PM +0200, Tomi Valkeinen wrote:
> The recently added v4l2_subdev_get_frame_desc_passthrough() can be used
> directly as an implementation for .get_frame_desc subdev op. However, in
> some cases the drivers may want to add some customizations, while the
> bulk of the work is still identical to what
> v4l2_subdev_get_frame_desc_passthrough() does. Current locking scheme
> makes this impossible to do properly.
> 
> Split v4l2_subdev_get_frame_desc_passthrough() into two functions:
> 
> __v4l2_subdev_get_frame_desc_passthrough(), which takes a locked subdev
> state as a parameter, instead of locking and getting the active state
> internally. Other than that, it does the same as
> v4l2_subdev_get_frame_desc_passthrough() used to do.
> 
> v4l2_subdev_get_frame_desc_passthrough(), which locks the active state
> and calls __v4l2_subdev_get_frame_desc_passthrough().
> 
> In other words, v4l2_subdev_get_frame_desc_passthrough() works as
> before, but drivers can now alternatively add custom .get_frame_desc
> code and call v4l2_subdev_get_frame_desc_passthrough().

This looks fine (and quite standard) to me.

> An example use case is with DS90UB953 serializer: in normal use the
> serializer passes through everything, but when test-pattern-generator
> (TPG) is used, an internal TPG source is used. After this commit, the
> UB953 get_frame_desc() can lock the state, look at the routing table to
> see if we're in normal or TPG mode, then either call
> __v4l2_subdev_get_frame_desc_passthrough() if in normal mode, or
> construct a TPG frame desc if in TPG mode.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 48 ++++++++++++++++++++---------------
>  include/media/v4l2-subdev.h           | 38 +++++++++++++++++++++++----
>  2 files changed, 61 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 2757378c628a..b73ccd1c83d2 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2545,21 +2545,21 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
>  
> -int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> -					   unsigned int pad,
> -					   struct v4l2_mbus_frame_desc *fd)
> +int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> +					     struct v4l2_subdev_state *state,
> +					     unsigned int pad,
> +					     struct v4l2_mbus_frame_desc *fd)
>  {
>  	struct media_pad *local_sink_pad;
>  	struct v4l2_subdev_route *route;
> -	struct v4l2_subdev_state *state;
>  	struct device *dev = sd->dev;
>  	int ret = 0;
>  
> +	lockdep_assert_held(state->lock);
> +
>  	if (WARN_ON(!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
>  		return -EINVAL;
>  
> -	state = v4l2_subdev_lock_and_get_active_state(sd);
> -
>  	/* Iterate over sink pads */
>  	media_entity_for_each_pad(&sd->entity, local_sink_pad) {
>  		struct v4l2_mbus_frame_desc source_fd;
> @@ -2586,15 +2586,12 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  				if (!remote_source_pad) {
>  					dev_dbg(dev, "Failed to find remote pad for sink pad %u\n",
>  						local_sink_pad->index);
> -					ret = -EINVAL;
> -					goto out_unlock;
> +					return -EINVAL;
>  				}
>  
>  				remote_sd = media_entity_to_v4l2_subdev(remote_source_pad->entity);
> -				if (!remote_sd) {
> -					ret = -EINVAL;
> -					goto out_unlock;
> -				}
> +				if (!remote_sd)
> +					return -EINVAL;
>  
>  				ret = v4l2_subdev_call(remote_sd, pad,
>  						       get_frame_desc,
> @@ -2604,7 +2601,7 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  					dev_err(dev,
>  						"Failed to get frame desc from remote subdev %s\n",
>  						remote_sd->name);
> -					goto out_unlock;
> +					return ret;
>  				}
>  
>  				have_source_fd = true;
> @@ -2615,8 +2612,7 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  					dev_err(dev,
>  						"Frame desc type mismatch: %u != %u\n",
>  						fd->type, source_fd.type);
> -					ret = -EPIPE;
> -					goto out_unlock;
> +					return -EPIPE;
>  				}
>  			}
>  
> @@ -2631,14 +2627,12 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  				dev_dbg(dev,
>  					"Failed to find stream %u from source frame desc\n",
>  					route->sink_stream);
> -				ret = -EPIPE;
> -				goto out_unlock;
> +				return -EPIPE;
>  			}
>  
>  			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
>  				dev_dbg(dev, "Frame desc entry limit reached\n");
> -				ret = -ENOSPC;
> -				goto out_unlock;
> +				return -ENOSPC;
>  			}
>  
>  			fd->entry[fd->num_entries] = *source_entry;
> @@ -2649,7 +2643,21 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  		}
>  	}
>  
> -out_unlock:
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(__v4l2_subdev_get_frame_desc_passthrough);
> +
> +int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> +					   unsigned int pad,
> +					   struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct v4l2_subdev_state *state;
> +	int ret;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	ret = __v4l2_subdev_get_frame_desc_passthrough(sd, state, pad, fd);
> +
>  	v4l2_subdev_unlock_state(state);
>  
>  	return ret;
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 23c03ba7f84c..d256b7ec8f84 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1723,15 +1723,15 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>  int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable);
>  
>  /**
> - * v4l2_subdev_get_frame_desc_passthrough() - Helper to implement the subdev
> - *	get_frame_desc operation in simple passthrough cases
> + * __v4l2_subdev_get_frame_desc_passthrough - Helper to implement the
> + *	subdev get_frame_desc operation in simple passthrough cases
>   * @sd: The subdevice
> + * @state: The locked subdevice active state
>   * @pad: The source pad index
>   * @fd: The mbus frame desc
>   *
> - * This helper implements get_frame_desc operation for subdevices that pass
> - * streams through without modification. It can be assigned directly as the
> - * .get_frame_desc callback in &v4l2_subdev_pad_ops.
> + * This helper implements the get_frame_desc operation for subdevices that pass

Nitpicking, the insertion of "the" belongs to a previous patch.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> + * streams through without modification.
>   *
>   * The helper iterates over the subdevice's sink pads, calls get_frame_desc on
>   * the remote subdevice connected to each sink pad, and collects the frame desc
> @@ -1744,6 +1744,34 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable);
>   * sink pads are involved and the upstream sources report different frame desc
>   * types, -EPIPE is returned.
>   *
> + * The caller must hold the subdevice's active state lock. This variant is
> + * intended for drivers that need to perform additional work around the
> + * passthrough frame descriptor collection. Drivers that do not need any
> + * customization should use v4l2_subdev_get_frame_desc_passthrough() instead.
> + *
> + * Return: 0 on success, or a negative error code otherwise.
> + */
> +int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> +					     struct v4l2_subdev_state *state,
> +					     unsigned int pad,
> +					     struct v4l2_mbus_frame_desc *fd);
> +
> +/**
> + * v4l2_subdev_get_frame_desc_passthrough() - Helper to implement the subdev
> + *	get_frame_desc operation in simple passthrough cases
> + * @sd: The subdevice
> + * @pad: The source pad index
> + * @fd: The mbus frame desc
> + *
> + * This function locks the subdevice's active state, calls
> + * __v4l2_subdev_get_frame_desc_passthrough(), and unlocks the state.
> + *
> + * This function can be assigned directly as the .get_frame_desc callback in
> + * &v4l2_subdev_pad_ops for subdevices that pass streams through without
> + * modification. Drivers that need to perform additional work should use
> + * __v4l2_subdev_get_frame_desc_passthrough() in their custom
> + * .get_frame_desc implementation instead.
> + *
>   * Return: 0 on success, or a negative error code otherwise.
>   */
>  int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> 

-- 
Regards,

Laurent Pinchart

