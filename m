Return-Path: <linux-media+bounces-3560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E1C82AED7
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 13:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE06B1C21094
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 12:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC80915AE4;
	Thu, 11 Jan 2024 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JnpLr8k1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A913512E6E
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 12:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704976673; x=1736512673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ksSAN7WJzjucCW+RTr+9U0yQ+MczmJoZaGPWnMVcYxY=;
  b=JnpLr8k18vqOPHWhCidU7okGAsNl3b/0bj/te7r0g/GBEr99kj+CQ8Q4
   +ws6Q29KMwLS96LbMUPbY4TW+gxAZSUS2VO821mhhf1f+RZw25+gP02kW
   PRqpFTPo8I2kzStLCDNy2k3LlFWHCKCmmrOopjoqgvfBvektuw1i2vKZ3
   G5pyLY/LxQJKmdbn6I/zAXYXNbZ0WmhIg5t/NWQyevbgyhWH9RK2u4wzG
   kHq1a3+VLGx2UeDELklhkD4PTY5+p1jxluR4sIOQSs0bJQ+RCP1CGaUP4
   wRpGRrXRgMJEdeVfQYP1TQjy6eOgqD52/4aMhoaa+N3U4dRGz6/myQEeg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="463119146"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="463119146"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 04:37:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="732217123"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="732217123"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 04:37:40 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4013A11F913;
	Thu, 11 Jan 2024 14:37:37 +0200 (EET)
Date: Thu, 11 Jan 2024 12:37:37 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
	senozhatsky@chromium.org, andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: Re: [PATCH v3 17/17] media: ipu6/isys: support new v4l2 subdev state
 APIs
Message-ID: <ZZ_hEdib8KMf_vvo@kekkonen.localdomain>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
 <20240111065531.2418836-18-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111065531.2418836-18-bingbu.cao@intel.com>

Hi Bingbu,

On Thu, Jan 11, 2024 at 02:55:31PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Add support for the upcoming v4l2-subdev API changes in kernel 6.8.
> This patch is based on Sakari's branch:
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>

These changes should be squashed to the preceding patches, the driver
currently won't compile without this patch.

> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  8 +++-----
>  .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 19 +++++++++++--------
>  .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  2 --
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    |  3 +--
>  4 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> index a6430d531129..6f258cf92fc1 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> @@ -403,12 +403,11 @@ static int ipu6_isys_csi2_set_sel(struct v4l2_subdev *sd,
>  	if (!sink_ffmt)
>  		return -EINVAL;
>  
> -	src_ffmt = v4l2_subdev_state_get_stream_format(state, sel->pad,
> -						       sel->stream);
> +	src_ffmt = v4l2_subdev_state_get_format(state, sel->pad, sel->stream);
>  	if (!src_ffmt)
>  		return -EINVAL;
>  
> -	crop = v4l2_subdev_state_get_stream_crop(state, sel->pad, sel->stream);
> +	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
>  	if (!crop)
>  		return -EINVAL;
>  
> @@ -453,7 +452,7 @@ static int ipu6_isys_csi2_get_sel(struct v4l2_subdev *sd,
>  	if (!sink_ffmt)
>  		return -EINVAL;
>  
> -	crop = v4l2_subdev_state_get_stream_crop(state, sel->pad, sel->stream);
> +	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
>  	if (!crop)
>  		return -EINVAL;
>  
> @@ -480,7 +479,6 @@ static const struct v4l2_subdev_video_ops csi2_sd_video_ops = {
>  };
>  
>  static const struct v4l2_subdev_pad_ops csi2_sd_pad_ops = {
> -	.init_cfg = ipu6_isys_subdev_init_cfg,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = ipu6_isys_subdev_set_fmt,
>  	.get_selection = ipu6_isys_csi2_get_sel,
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> index 3c9263ac02a3..aeccd6f93986 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> @@ -156,8 +156,7 @@ int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
>  	format->format.field = V4L2_FIELD_NONE;
>  
>  	/* Store the format and propagate it to the source pad. */
> -	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
> -						  format->stream);
> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
>  	if (!fmt)
>  		return -EINVAL;
>  
> @@ -182,8 +181,7 @@ int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
>  	if (ret)
>  		return -EINVAL;
>  
> -	crop = v4l2_subdev_state_get_stream_crop(state, other_pad,
> -						 other_stream);
> +	crop = v4l2_subdev_state_get_crop(state, other_pad, other_stream);
>  	/* reset crop */
>  	crop->left = 0;
>  	crop->top = 0;
> @@ -241,7 +239,7 @@ int ipu6_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
>  		return -EINVAL;
>  
>  	state = v4l2_subdev_lock_and_get_active_state(sd);
> -	fmt = v4l2_subdev_state_get_stream_format(state, pad, stream);
> +	fmt = v4l2_subdev_state_get_format(state, pad, stream);
>  	if (fmt)
>  		*format = *fmt;
>  	v4l2_subdev_unlock_state(state);
> @@ -259,7 +257,7 @@ int ipu6_isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
>  		return -EINVAL;
>  
>  	state = v4l2_subdev_lock_and_get_active_state(sd);
> -	rect = v4l2_subdev_state_get_stream_crop(state, pad, stream);
> +	rect = v4l2_subdev_state_get_crop(state, pad, stream);
>  	if (rect)
>  		*crop = *rect;
>  	v4l2_subdev_unlock_state(state);
> @@ -291,8 +289,8 @@ u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
>  	return source_stream;
>  }
>  
> -int ipu6_isys_subdev_init_cfg(struct v4l2_subdev *sd,
> -			      struct v4l2_subdev_state *state)
> +static int ipu6_isys_subdev_init_state(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *state)
>  {
>  	struct v4l2_subdev_route route = {
>  		.sink_pad = 0,
> @@ -317,6 +315,10 @@ int ipu6_isys_subdev_set_routing(struct v4l2_subdev *sd,
>  	return subdev_set_routing(sd, state, routing);
>  }
>  
> +static const struct v4l2_subdev_internal_ops ipu6_isys_subdev_internal_ops = {
> +	.init_state = ipu6_isys_subdev_init_state,
> +};
> +
>  int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
>  			  const struct v4l2_subdev_ops *ops,
>  			  unsigned int nr_ctrls,
> @@ -334,6 +336,7 @@ int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
>  			 V4L2_SUBDEV_FL_STREAMS;
>  	asd->sd.owner = THIS_MODULE;
>  	asd->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	asd->sd.internal_ops = &ipu6_isys_subdev_internal_ops;
>  
>  	asd->pad = devm_kcalloc(&asd->isys->adev->auxdev.dev, num_pads,
>  				sizeof(*asd->pad), GFP_KERNEL);
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
> index adea2a55761d..f4e32b094b5b 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
> @@ -46,8 +46,6 @@ int ipu6_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
>  				 struct v4l2_mbus_framefmt *format);
>  int ipu6_isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
>  				  struct v4l2_rect *crop);
> -int ipu6_isys_subdev_init_cfg(struct v4l2_subdev *sd,
> -			      struct v4l2_subdev_state *state);
>  int ipu6_isys_subdev_set_routing(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *state,
>  				 enum v4l2_subdev_format_whence which,
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index 1a023bf1e1a6..62d4043fc2a1 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -389,8 +389,7 @@ static int link_validate(struct media_link *link)
>  
>  	v4l2_subdev_lock_state(s_state);
>  
> -	s_fmt = v4l2_subdev_state_get_stream_format(s_state, s_pad->index,
> -						    s_stream);
> +	s_fmt = v4l2_subdev_state_get_format(s_state, s_pad->index, s_stream);
>  	if (!s_fmt) {
>  		dev_err(dev, "failed to get source pad format\n");
>  		goto unlock;

-- 
Regards,

Sakari Ailus

