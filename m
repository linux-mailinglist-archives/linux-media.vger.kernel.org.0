Return-Path: <linux-media+bounces-9215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CA78A3570
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 20:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A22B4282739
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 18:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F4614EC44;
	Fri, 12 Apr 2024 18:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MKomKTcq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1693E13DDAC;
	Fri, 12 Apr 2024 18:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712945598; cv=none; b=Hy5qj9XixeIl76EtVoQYxuSnpxYCZBjVmvASlVFHO9iXaP41vGw5o1fPwvwfkMqXSoOSDi/PVVG0rdBpg+k8CxBk3WPBg/g1lGiNNQDaPaLKMSXPQ5lMHuZjfv8fLfUoP8zyInIXDnCQfFUZmWMsH+ki3hQQt49YBbVpQoUruD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712945598; c=relaxed/simple;
	bh=as8kUEXEqmCl0HfzmltonScQtng7vdgpKbd4m/93Prw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kx3Nhi3alx0KRu+R56M5BwVLFnHx9MjAykbxugdvIfoOBkmzv2MsQd+04HsNmpH0IsCe+il2K5idniZRmwgp3yw9dZKltZQjIAk2k0MZPq0aWcGjRQ7leBCn7w5zYpazjJvQj4iNFxhOtf8nt5cA6vpPvhToH6GZmoi4QdsufmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MKomKTcq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-65-73-nat.elisa-mobile.fi [85.76.65.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22C3A9D5;
	Fri, 12 Apr 2024 20:12:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712945551;
	bh=as8kUEXEqmCl0HfzmltonScQtng7vdgpKbd4m/93Prw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MKomKTcq+ULebpPBNcKKNn01E35La/Rh27j1ySr2P2kOvphQgKSUB8Khfrm+xpABF
	 T+CJita13kmeuICmcYF/pMwsn0Cfd+uvc2Jy3IV6GIz7TniAVz8u6pE1VZnxv4CcDj
	 AVxHvPyJqdHFrfEWoamVqFyNj56r2rQsj3GL/8l0=
Date: Fri, 12 Apr 2024 21:13:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/9] media: subdev: Improve
 v4l2_subdev_enable/disable_streams_fallback
Message-ID: <20240412181304.GH31122@pendragon.ideasonboard.com>
References: <20240410-enable-streams-impro-v3-0-e5e7a5da7420@ideasonboard.com>
 <20240410-enable-streams-impro-v3-5-e5e7a5da7420@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240410-enable-streams-impro-v3-5-e5e7a5da7420@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Wed, Apr 10, 2024 at 03:35:52PM +0300, Tomi Valkeinen wrote:
> v4l2_subdev_enable/disable_streams_fallback() supports falling back to
> .s_stream() for subdevs with a single source pad. It also tracks the
> enabled streams for that one pad in the sd->enabled_streams field.
> 
> Tracking the enabled streams with sd->enabled_streams does not make
> sense, as with .s_stream() there can only be a single stream per pad.
> Thus, as the v4l2_subdev_enable/disable_streams_fallback() only supports
> a single source pad, all we really need is a boolean which tells whether
> streaming has been enabled on this pad or not.
> 
> However, as we only need a true/false state for a pad (instead of
> tracking which streams have been enabled for a pad), we can easily
> extend the fallback mechanism to support multiple source pads as we only
> need to keep track of which pads have been enabled.
> 
> Change the sd->enabled_streams field to sd->enabled_pads, which is a
> 64-bit bitmask tracking the enabled source pads. With this change we can
> remove the restriction that
> v4l2_subdev_enable/disable_streams_fallback() only supports a single
> source pad.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 68 ++++++++++++++++++++---------------
>  include/media/v4l2-subdev.h           |  9 +++--
>  2 files changed, 44 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 6cd353d83dfc..3d2c9c224b8f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2104,37 +2104,43 @@ static int v4l2_subdev_enable_streams_fallback(struct v4l2_subdev *sd, u32 pad,
>  					       u64 streams_mask)
>  {
>  	struct device *dev = sd->entity.graph_obj.mdev->dev;
> -	unsigned int i;
>  	int ret;
>  
>  	/*
>  	 * The subdev doesn't implement pad-based stream enable, fall back
> -	 * on the .s_stream() operation. This can only be done for subdevs that
> -	 * have a single source pad, as sd->enabled_streams is global to the
> -	 * subdev.
> +	 * to the .s_stream() operation.
>  	 */
>  	if (!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE))
>  		return -EOPNOTSUPP;
>  
> -	for (i = 0; i < sd->entity.num_pads; ++i) {
> -		if (i != pad && sd->entity.pads[i].flags & MEDIA_PAD_FL_SOURCE)
> -			return -EOPNOTSUPP;
> -	}
> +	/*
> +	 * .s_stream() means there is no streams support, so only allowed stream

s/only/the only/

> +	 * is the implicit stream 0.
> +	 */
> +	if (streams_mask != BIT_ULL(0))
> +		return -EOPNOTSUPP;
> +
> +	/*
> +	 * We use a 64-bit bitmask for tracking enabled pads, so only subdevices
> +	 * with 64 pads or less can be supported.
> +	 */
> +	if (pad >= sizeof(sd->enabled_pads) * BITS_PER_BYTE)
> +		return -EOPNOTSUPP;
>  
> -	if (sd->enabled_streams & streams_mask) {
> -		dev_dbg(dev, "set of streams %#llx already enabled on %s:%u\n",
> -			streams_mask, sd->entity.name, pad);
> +	if (sd->enabled_pads & BIT_ULL(pad)) {
> +		dev_dbg(dev, "pad %u already enabled on %s\n",
> +			pad, sd->entity.name);
>  		return -EALREADY;
>  	}
>  
> -	/* Start streaming when the first streams are enabled. */
> -	if (!sd->enabled_streams) {
> +	/* Start streaming when the first pad is enabled. */
> +	if (!sd->enabled_pads) {
>  		ret = v4l2_subdev_call(sd, video, s_stream, 1);
>  		if (ret)
>  			return ret;
>  	}
>  
> -	sd->enabled_streams |= streams_mask;
> +	sd->enabled_pads |= BIT_ULL(pad);
>  
>  	return 0;
>  }
> @@ -2221,37 +2227,43 @@ static int v4l2_subdev_disable_streams_fallback(struct v4l2_subdev *sd, u32 pad,
>  						u64 streams_mask)
>  {
>  	struct device *dev = sd->entity.graph_obj.mdev->dev;
> -	unsigned int i;
>  	int ret;
>  
>  	/*
> -	 * If the subdev doesn't implement pad-based stream enable, fall  back
> -	 * on the .s_stream() operation. This can only be done for subdevs that
> -	 * have a single source pad, as sd->enabled_streams is global to the
> -	 * subdev.
> +	 * If the subdev doesn't implement pad-based stream enable, fall back
> +	 * to the .s_stream() operation.
>  	 */
>  	if (!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE))
>  		return -EOPNOTSUPP;
>  
> -	for (i = 0; i < sd->entity.num_pads; ++i) {
> -		if (i != pad && sd->entity.pads[i].flags & MEDIA_PAD_FL_SOURCE)
> -			return -EOPNOTSUPP;
> -	}
> +	/*
> +	 * .s_stream() means there is no streams support, so only allowed stream

Same here.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	 * is the implicit stream 0.
> +	 */
> +	if (streams_mask != BIT_ULL(0))
> +		return -EOPNOTSUPP;
> +
> +	/*
> +	 * We use a 64-bit bitmask for tracking enabled pads, so only subdevices
> +	 * with 64 pads or less can be supported.
> +	 */
> +	if (pad >= sizeof(sd->enabled_pads) * BITS_PER_BYTE)
> +		return -EOPNOTSUPP;
>  
> -	if ((sd->enabled_streams & streams_mask) != streams_mask) {
> -		dev_dbg(dev, "set of streams %#llx already disabled on %s:%u\n",
> -			streams_mask, sd->entity.name, pad);
> +	if (!(sd->enabled_pads & BIT_ULL(pad))) {
> +		dev_dbg(dev, "pad %u already disabled on %s\n",
> +			pad, sd->entity.name);
>  		return -EALREADY;
>  	}
>  
>  	/* Stop streaming when the last streams are disabled. */
> -	if (!(sd->enabled_streams & ~streams_mask)) {
> +	if (!(sd->enabled_pads & ~BIT_ULL(pad))) {
>  		ret = v4l2_subdev_call(sd, video, s_stream, 0);
>  		if (ret)
>  			return ret;
>  	}
>  
> -	sd->enabled_streams &= ~streams_mask;
> +	sd->enabled_pads &= ~BIT_ULL(pad);
>  
>  	return 0;
>  }
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index f55d03e0acc1..d6867511e9cf 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1039,10 +1039,9 @@ struct v4l2_subdev_platform_data {
>   * @active_state: Active state for the subdev (NULL for subdevs tracking the
>   *		  state internally). Initialized by calling
>   *		  v4l2_subdev_init_finalize().
> - * @enabled_streams: Bitmask of enabled streams used by
> - *		     v4l2_subdev_enable_streams() and
> - *		     v4l2_subdev_disable_streams() helper functions for fallback
> - *		     cases.
> + * @enabled_pads: Bitmask of enabled pads used by v4l2_subdev_enable_streams()
> + *		  and v4l2_subdev_disable_streams() helper functions for
> + *		  fallback cases.
>   * @streaming_enabled: Tracks whether streaming has been enabled with s_stream.
>   *                     This is only for call_s_stream() internal use.
>   *
> @@ -1092,7 +1091,7 @@ struct v4l2_subdev {
>  	 * doesn't support it.
>  	 */
>  	struct v4l2_subdev_state *active_state;
> -	u64 enabled_streams;
> +	u64 enabled_pads;
>  	bool streaming_enabled;
>  };
>  
> 

-- 
Regards,

Laurent Pinchart

