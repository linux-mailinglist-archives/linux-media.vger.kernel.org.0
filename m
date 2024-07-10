Return-Path: <linux-media+bounces-14820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD0B92CCAB
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 10:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ABD3283947
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 08:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3980F84E14;
	Wed, 10 Jul 2024 08:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kb+P/i8V"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBA32B9DD
	for <linux-media@vger.kernel.org>; Wed, 10 Jul 2024 08:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720599390; cv=none; b=nGmbZdZR5NGs1C0rEESaXkcCE4B9JQL2J+A1U4/KY0q1l2BiIdXvenkk6a4y6TkdbOODcdTHiWeMJhZvdR+CcsO47PHHO2eYX2exDfmykBdUV+EHqXmKdGp8Nx2T36H+qjaZ7oEtIc7iW6+FP91ilHSHYSeL16/NqOXmHTT0uVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720599390; c=relaxed/simple;
	bh=vzka+I/HsMet9seCYg/ka9l7s+0UeH9Uk9gXbsbP9Ng=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=gLu/GLU1ubAiE+cO3vZ9irajtd2TdpvFm9Q0DmL+b3GOXZ+Feh+mSAcJ9wSDhQpmIBvbXyaQ+xJClhSanLskvW52lyh81YEINTQcUVh8yRYh5orR0aOkvmgi8/m4y7+1GTlVBZKNxtieZkAh0iqWoSaaUZA/syJ7lpAISv5SR70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kb+P/i8V; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720599388; x=1752135388;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=vzka+I/HsMet9seCYg/ka9l7s+0UeH9Uk9gXbsbP9Ng=;
  b=Kb+P/i8VpxnIibrO7ZYrODJpGUKXy3tAVkIivFIztgUKPH7zeYMI9LbB
   DQCgov68TNqErU8ingYQn3sl0g7O5X+mUi3pgsBmOX62dZLmn3lyKSNy7
   W6lPDokrQ/b8w+SSGD2ljV+0WEJp0b+w1/qQW00z9PWHh8nHFpRT/9XL1
   EWkHse6fPEs1rk823IeawlkPODmbUZC6aPJahFgKICDSl/d3v5bx6446O
   Z4Ldk8ubbNlAt0oOo49XSpiw/kbV1Pzvx3CrChK2YJAuTu5H3qgoeV6mk
   iqXAyVgOPIk0swlwjCu0aPbF+0UT25dGXMfQKe0jqDskS/8PktjWAsJ/w
   A==;
X-CSE-ConnectionGUID: w0qhBL2tRwGUjzNw6zoiZQ==
X-CSE-MsgGUID: 6WyUDjhVRayv1iq5wCtAgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="18106443"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="18106443"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 01:16:27 -0700
X-CSE-ConnectionGUID: Z8kbeejdRfePbMrMjO8i/w==
X-CSE-MsgGUID: ODSGtMwGQE6e0HUGW9KMhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="53314693"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa004.jf.intel.com with ESMTP; 10 Jul 2024 01:16:26 -0700
Subject: Re: [PATCH v2 1/1] media: ipu6: Rework CSI-2 sub-device streaming
 control
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: "Wang, Hongju" <hongju.wang@intel.com>
References: <20240603094323.184281-1-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <6cd77442-6a16-8e9a-d45f-537b587998b7@linux.intel.com>
Date: Wed, 10 Jul 2024 16:17:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240603094323.184281-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

On 6/3/24 5:43 PM, Sakari Ailus wrote:
> CSI-2 sub-device streaming control should use {enable,disable}_streams pad
> ops and not s_stream video ops as the sub-device supports streams. Fix
> this by removing driver-implemented stream management and moving sensor
> streaming control to the CSI-2 sub-device sub-driver.
> 
> Fixes: a11a5570a09d ("media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-device")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v1:
> 
> - Removed unused variables.
> 
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 98 ++++++++-----------
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  2 -
>  .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  3 -
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 43 ++------
>  4 files changed, 49 insertions(+), 97 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> index b9ce4324996d..051898ce53f4 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> @@ -345,42 +345,61 @@ static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> -static int set_stream(struct v4l2_subdev *sd, int enable)
> +static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
> +					 struct v4l2_subdev_state *state,
> +					 u32 pad, u64 streams_mask)
>  {
>  	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
>  	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
> -	struct device *dev = &csi2->isys->adev->auxdev.dev;
>  	struct ipu6_isys_csi2_timing timing = { };
> -	unsigned int nlanes;
> +	struct v4l2_subdev *remote_sd;
> +	struct media_pad *remote_pad;
> +	u64 sink_streams;
>  	int ret;
>  
> -	dev_dbg(dev, "csi2 stream %s callback\n", enable ? "on" : "off");
> -
> -	if (!enable) {
> -		csi2->stream_count--;
> -		if (csi2->stream_count)
> -			return 0;
> -
> -		ipu6_isys_csi2_set_stream(sd, &timing, 0, enable);
> -		return 0;
> -	}
> -
> -	if (csi2->stream_count) {
> -		csi2->stream_count++;
> -		return 0;
> -	}
> +	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
>  
> -	nlanes = csi2->nlanes;
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
> +						       CSI2_PAD_SINK,
> +						       &streams_mask);
>  
>  	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
>  	if (ret)
>  		return ret;
>  
> -	ret = ipu6_isys_csi2_set_stream(sd, &timing, nlanes, enable);
> +	ret = ipu6_isys_csi2_set_stream(sd, &timing, csi2->nlanes, true);

In theory, ipu6_isys_csi2_set_stream is only called once per CSI2 port
streaming, so this patch looks breaking the frame+meta capture case
Hongju did some test along with this patch and see some regressions.

Do we need script update for this patch to capture metadata?

>  	if (ret)
>  		return ret;
>  
> -	csi2->stream_count++;
> +	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
> +					 sink_streams);
> +	if (ret) {
> +		ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
> +					  struct v4l2_subdev_state *state,
> +					  u32 pad, u64 streams_mask)
> +{
> +	struct v4l2_subdev *remote_sd;
> +	struct media_pad *remote_pad;
> +	u64 sink_streams;
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
> +						       CSI2_PAD_SINK,
> +						       &streams_mask);
> +
> +	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
> +
> +	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
>  
>  	return 0;
>  }
> @@ -475,10 +494,6 @@ static int ipu6_isys_csi2_get_sel(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> -static const struct v4l2_subdev_video_ops csi2_sd_video_ops = {
> -	.s_stream = set_stream,
> -};
> -
>  static const struct v4l2_subdev_pad_ops csi2_sd_pad_ops = {
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = ipu6_isys_subdev_set_fmt,
> @@ -486,11 +501,12 @@ static const struct v4l2_subdev_pad_ops csi2_sd_pad_ops = {
>  	.set_selection = ipu6_isys_csi2_set_sel,
>  	.enum_mbus_code = ipu6_isys_subdev_enum_mbus_code,
>  	.set_routing = ipu6_isys_subdev_set_routing,
> +	.enable_streams = ipu6_isys_csi2_enable_streams,
> +	.disable_streams = ipu6_isys_csi2_disable_streams,
>  };
>  
>  static const struct v4l2_subdev_ops csi2_sd_ops = {
>  	.core = &csi2_sd_core_ops,
> -	.video = &csi2_sd_video_ops,
>  	.pad = &csi2_sd_pad_ops,
>  };
>  
> @@ -631,33 +647,3 @@ int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
>  
>  	return 0;
>  }
> -
> -void ipu6_isys_set_csi2_streams_status(struct ipu6_isys_video *av, bool status)
> -{
> -	struct ipu6_isys_stream *stream = av->stream;
> -	struct v4l2_subdev *sd = &stream->asd->sd;
> -	struct v4l2_subdev_state *state;
> -	struct media_pad *r_pad;
> -	unsigned int i;
> -	u32 r_stream;
> -
> -	r_pad = media_pad_remote_pad_first(&av->pad);
> -	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, r_pad->index);
> -
> -	state = v4l2_subdev_lock_and_get_active_state(sd);
> -
> -	for (i = 0; i < state->stream_configs.num_configs; i++) {
> -		struct v4l2_subdev_stream_config *cfg =
> -			&state->stream_configs.configs[i];
> -
> -		if (cfg->pad == r_pad->index && r_stream == cfg->stream) {
> -			dev_dbg(&av->isys->adev->auxdev.dev,
> -				"%s: pad:%u, stream:%u, status:%u\n",
> -				sd->entity.name, r_pad->index, r_stream,
> -				status);
> -			cfg->enabled = status;
> -		}
> -	}
> -
> -	v4l2_subdev_unlock_state(state);
> -}
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
> index eba6b29386ea..bc8594c94f99 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
> @@ -45,7 +45,6 @@ struct ipu6_isys_csi2 {
>  	u32 receiver_errors;
>  	unsigned int nlanes;
>  	unsigned int port;
> -	unsigned int stream_count;
>  };
>  
>  struct ipu6_isys_csi2_timing {
> @@ -77,6 +76,5 @@ int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
>  				   struct ipu6_isys_csi2 *csi2,
>  				   struct media_entity *source_entity,
>  				   struct v4l2_mbus_frame_desc_entry *entry);
> -void ipu6_isys_set_csi2_streams_status(struct ipu6_isys_video *av, bool status);
>  
>  #endif /* IPU6_ISYS_CSI2_H */
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> index 40a8ebfcfce2..6bea7754875d 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> @@ -551,7 +551,6 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
>  		stream->nr_queues);
>  
>  	list_add(&aq->node, &stream->queues);
> -	ipu6_isys_set_csi2_streams_status(av, true);
>  	ipu6_isys_configure_stream_watermark(av, true);
>  	ipu6_isys_update_stream_watermark(av, true);
>  
> @@ -598,8 +597,6 @@ static void stop_streaming(struct vb2_queue *q)
>  	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
>  	struct ipu6_isys_stream *stream = av->stream;
>  
> -	ipu6_isys_set_csi2_streams_status(av, false);
> -
>  	mutex_lock(&stream->mutex);
>  
>  	ipu6_isys_update_stream_watermark(av, false);
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index c8a33e1e910c..e41d40243abd 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -990,9 +990,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
>  	struct v4l2_subdev_state *subdev_state;
>  	struct device *dev = &av->isys->adev->auxdev.dev;
>  	struct v4l2_subdev *sd;
> -	struct v4l2_subdev *ssd;
>  	struct media_pad *r_pad;
> -	struct media_pad *s_pad;
>  	u32 sink_pad, sink_stream;
>  	u64 r_stream;
>  	u64 stream_mask = 0;
> @@ -1003,7 +1001,6 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
>  	if (WARN(!stream->source_entity, "No source entity for stream\n"))
>  		return -ENODEV;
>  
> -	ssd = media_entity_to_v4l2_subdev(stream->source_entity);
>  	sd = &stream->asd->sd;
>  	r_pad = media_pad_remote_pad_first(&av->pad);
>  	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, r_pad->index);
> @@ -1017,27 +1014,15 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
>  	if (ret)
>  		return ret;
>  
> -	s_pad = media_pad_remote_pad_first(&stream->asd->pad[sink_pad]);
> -
>  	stream_mask = get_stream_mask_by_pipeline(av);
>  	if (!state) {
>  		stop_streaming_firmware(av);
>  
> -		/* stop external sub-device now. */
> -		dev_dbg(dev, "disable streams 0x%llx of %s\n", stream_mask,
> -			ssd->name);
> -		ret = v4l2_subdev_disable_streams(ssd, s_pad->index,
> -						  stream_mask);
> -		if (ret) {
> -			dev_err(dev, "disable streams of %s failed with %d\n",
> -				ssd->name, ret);
> -			return ret;
> -		}
> -
>  		/* stop sub-device which connects with video */
> -		dev_dbg(dev, "stream off entity %s pad:%d\n", sd->name,
> -			r_pad->index);
> -		ret = v4l2_subdev_call(sd, video, s_stream, state);
> +		dev_dbg(dev, "stream off entity %s pad:%d mask:0x%llx\n",
> +			sd->name, r_pad->index, stream_mask);
> +		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
> +						  stream_mask);
>  		if (ret) {
>  			dev_err(dev, "stream off %s failed with %d\n", sd->name,
>  				ret);
> @@ -1052,34 +1037,20 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
>  		}
>  
>  		/* start sub-device which connects with video */
> -		dev_dbg(dev, "stream on %s pad %d\n", sd->name, r_pad->index);
> -		ret = v4l2_subdev_call(sd, video, s_stream, state);
> +		dev_dbg(dev, "stream on %s pad %d mask 0x%llx\n", sd->name,
> +			r_pad->index, stream_mask);
> +		ret = v4l2_subdev_enable_streams(sd, r_pad->index, stream_mask);
>  		if (ret) {
>  			dev_err(dev, "stream on %s failed with %d\n", sd->name,
>  				ret);
>  			goto out_media_entity_stop_streaming_firmware;
>  		}
> -
> -		/* start external sub-device now. */
> -		dev_dbg(dev, "enable streams 0x%llx of %s\n", stream_mask,
> -			ssd->name);
> -		ret = v4l2_subdev_enable_streams(ssd, s_pad->index,
> -						 stream_mask);
> -		if (ret) {
> -			dev_err(dev,
> -				"enable streams 0x%llx of %s failed with %d\n",
> -				stream_mask, stream->source_entity->name, ret);
> -			goto out_media_entity_stop_streaming;
> -		}
>  	}
>  
>  	av->streaming = state;
>  
>  	return 0;
>  
> -out_media_entity_stop_streaming:
> -	v4l2_subdev_disable_streams(sd, r_pad->index, BIT(r_stream));
> -
>  out_media_entity_stop_streaming_firmware:
>  	stop_streaming_firmware(av);
>  
> 

-- 
Best regards,
Bingbu Cao

