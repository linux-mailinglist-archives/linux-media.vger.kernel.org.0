Return-Path: <linux-media+bounces-35340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC762AE0795
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 15:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3BCC3A96F2
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 13:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B52325CC5D;
	Thu, 19 Jun 2025 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hkv9pMOO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24CC253939
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340262; cv=none; b=Xq6g/Gf+3fR8tjnrR663mrAgKq3TfQJOhXMlMr1Fls4f7ir5dwmGgBxCt9An0f0wGxjH1xCXUkEEJ4BBcvkW+SAs29tNjLY/Z/LDmoN51y1+Y+OWHT/F0OgRUsx2QiRfa4qogmI7cvZFvDhWWol9vK+ho+a9q2QzrwONEjWGsrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340262; c=relaxed/simple;
	bh=3t8nLpTgL7zzb4SQd1dOrKh8PSF/hvMkqbdOJlsgC8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VW2X2kmezXMt8/Uh8XrGFt6OJK7A4iU1D3zOTjb/MZYMsBRaLFkTv1Knq/pypSQTZG3KE9KN3udQ/djdaXuSr0bbZN2PbklzMANLCvokKNIlOX/oHYI/Sozcc1Fb/53ym1R29Oxbi9s/aK8CFBCXx8KNsoM2oeb9sP0uls+kHac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Hkv9pMOO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DCE82EC;
	Thu, 19 Jun 2025 15:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750340244;
	bh=3t8nLpTgL7zzb4SQd1dOrKh8PSF/hvMkqbdOJlsgC8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hkv9pMOO5+ZrmmiwmUzbqJ5Y5CZolplQaqffCZxtKZtf/SFMBWbMmiwu611fArG5b
	 1BlapUToRW+aKAvYxMmVGkxOCu/pW250TCPTXFp0b750prq79Bdy2TSVCoyemhVLD/
	 taXON9xen7oqIibc+Vo7GKzDRLboIbfhMfjh5Y6g=
Date: Thu, 19 Jun 2025 16:37:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 04/13] media: v4l2-subdev: Add a helper to figure out the
 pad streaming state
Message-ID: <20250619133720.GF32166@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-5-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619081546.1582969-5-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Jun 19, 2025 at 11:15:37AM +0300, Sakari Ailus wrote:
> Add a helper, v4l2_subdev_state_streams_enabled(), to tell which streams
> are enabled on a pad. This is useful to e.g. figure out in a driver
> whether a hardware configuration change is necessary to enable a given
> stream.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 17 +++++++++++++++++
>  include/media/v4l2-subdev.h           |  3 +++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index a3074f469b15..60b8febd3339 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2453,6 +2453,23 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_disable_streams);
>  
> +u64 v4l2_subdev_state_streams_enabled(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *state, u32 pad)

You can make the state const.

> +{
> +	u64 streams_mask = 0;
> +
> +	for (unsigned int i = 0; i < state->stream_configs.num_configs; i++) {
> +		struct v4l2_subdev_stream_config *cfg =

const

> +			&state->stream_configs.configs[i];
> +
> +		if (cfg->pad == pad && cfg->enabled)
> +			streams_mask |= BIT_ULL(cfg->stream);
> +	}
> +
> +	return streams_mask;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_state_streams_enabled);
> +
>  int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
>  {
>  	struct v4l2_subdev_state *state;
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 57f2bcb4eb16..deab128a4779 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1731,6 +1731,9 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>  int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>  				u64 streams_mask);
>  

Missing documentation.

The function looks fine. It's a bit costly though, so I'll see in
subsequent patches if there could be a better way to handle whatever
issue this solves.

> +u64 v4l2_subdev_state_streams_enabled(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *state, u32 pad);
> +
>  /**
>   * v4l2_subdev_s_stream_helper() - Helper to implement the subdev s_stream
>   *	operation using enable_streams and disable_streams

-- 
Regards,

Laurent Pinchart

