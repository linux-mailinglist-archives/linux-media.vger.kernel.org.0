Return-Path: <linux-media+bounces-31328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C08AA0FD1
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 17:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFE607AAB3E
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 14:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB5521C178;
	Tue, 29 Apr 2025 15:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t1MT535f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80FC21CA0F;
	Tue, 29 Apr 2025 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938828; cv=none; b=JzQdoRDZ5Pz7Ure3IDVsj1vwyoabkY59o4Fs+W33N8xIcK5mHw8RqhFM4eyQRQFoqhC0VOdoR4p8bZRyFy3u+qEir2ZFZ9zdKcjPaq04qyKgORujQM15UStai8CVJtIeIYnlbKqc3NThJvXxl6YSZzLWourZm2+XffD+BOjGpgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938828; c=relaxed/simple;
	bh=DdMAgrPLu10KrH7GNDaAss+qQY3rSzxKo6bYBimKWnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MeUVc6MTjhKQi99RGnu/SDVPEdmy8eFonne0csQk2wTAXIaO8+W+g1RFjZ34i68HDM8AXW1CsCYL/bcYmCumZRXt+RAOd1zcumu1J1GS1oqNMKqmrpBjdsdx805RJkLF08TJnu+cWTd7dZYps/AOyzoj+NvyiWkDHdGbCF1UmAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t1MT535f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6894A1349;
	Tue, 29 Apr 2025 17:00:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745938807;
	bh=DdMAgrPLu10KrH7GNDaAss+qQY3rSzxKo6bYBimKWnk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t1MT535fXqiRpoY6qPdomDibuk3Yb78qB9gzFMFGM63HsxZrduoOuAE0BGtS5IQ0o
	 4JJa7ZYKREVhkL9jbhGeW3i/9B0bkcofDjeIbcocprSzEvTYJmrRoIUkTvw9qg0TnB
	 XW54VhCS8UyihSdqRwVYy2tr7P4mVUeDPo0GtE2A=
Message-ID: <e730f431-e872-464f-be57-39a3c8dff938@ideasonboard.com>
Date: Tue, 29 Apr 2025 18:00:08 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: renesas: vsp1: Implement pixel format
 enumeration
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250409003815.10253-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250409003815.10253-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250409003815.10253-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/04/2025 03:38, Laurent Pinchart wrote:
> The VSP1 driver is missing the ability to enumerate pixel formats on its
> video nodes, which is supposed to be supported according to the V4L2
> API. Implement the enumeration to fix this issue.
> 
> As the device is media controller-centric, also implement the ability to
> filter pixel formats by media bus code, and report the missing
> V4L2_CAP_IO_MC capability.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   .../media/platform/renesas/vsp1/vsp1_pipe.c   | 103 ++++++++++++++----
>   .../media/platform/renesas/vsp1/vsp1_pipe.h   |   3 +
>   .../media/platform/renesas/vsp1/vsp1_video.c  |  24 +++-
>   3 files changed, 105 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index bb0739f684f3..16a78a00c6c9 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -138,14 +138,6 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
>   	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>   	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
>   	  1, { 32, 0, 0 }, false, false, 1, 1, false },
> -	{ V4L2_PIX_FMT_HSV24, MEDIA_BUS_FMT_AHSV8888_1X32,
> -	  VI6_FMT_RGB_888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> -	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> -	  1, { 24, 0, 0 }, false, false, 1, 1, false },
> -	{ V4L2_PIX_FMT_HSV32, MEDIA_BUS_FMT_AHSV8888_1X32,
> -	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> -	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> -	  1, { 32, 0, 0 }, false, false, 1, 1, false },
>   	{ V4L2_PIX_FMT_RGBX1010102, MEDIA_BUS_FMT_ARGB8888_1X32,
>   	  VI6_FMT_RGB10_RGB10A2_A2RGB10,
>   	  VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
> @@ -162,10 +154,6 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
>   	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>   	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
>   	  1, { 16, 0, 0 }, false, false, 2, 1, false },
> -	{ V4L2_PIX_FMT_VYUY, MEDIA_BUS_FMT_AYUV8_1X32,
> -	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> -	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> -	  1, { 16, 0, 0 }, false, true, 2, 1, false },
>   	{ V4L2_PIX_FMT_YUYV, MEDIA_BUS_FMT_AYUV8_1X32,
>   	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>   	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> @@ -222,6 +210,21 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
>   	  1, { 32, 0, 0 }, false, false, 2, 1, false },
>   };
>   
> +static const struct vsp1_format_info vsp1_video_gen2_formats[] = {
> +	{ V4L2_PIX_FMT_VYUY, MEDIA_BUS_FMT_AYUV8_1X32,
> +	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 16, 0, 0 }, false, true, 2, 1, false },
> +	{ V4L2_PIX_FMT_HSV24, MEDIA_BUS_FMT_AHSV8888_1X32,
> +	  VI6_FMT_RGB_888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 24, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_HSV32, MEDIA_BUS_FMT_AHSV8888_1X32,
> +	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 32, 0, 0 }, false, false, 1, 1, false },
> +};
> +
>   /**
>    * vsp1_get_format_info - Retrieve format information for a 4CC
>    * @vsp1: the VSP1 device
> @@ -235,16 +238,6 @@ const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
>   {
>   	unsigned int i;
>   
> -	/* Special case, the VYUY and HSV formats are supported on Gen2 only. */
> -	if (vsp1->info->gen != 2) {
> -		switch (fourcc) {
> -		case V4L2_PIX_FMT_VYUY:
> -		case V4L2_PIX_FMT_HSV24:
> -		case V4L2_PIX_FMT_HSV32:
> -			return NULL;
> -		}
> -	}
> -
>   	for (i = 0; i < ARRAY_SIZE(vsp1_video_formats); ++i) {
>   		const struct vsp1_format_info *info = &vsp1_video_formats[i];
>   
> @@ -252,6 +245,72 @@ const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
>   			return info;
>   	}
>   
> +	if (vsp1->info->gen == 2) {
> +		for (i = 0; i < ARRAY_SIZE(vsp1_video_gen2_formats); ++i) {
> +			const struct vsp1_format_info *info =
> +				&vsp1_video_gen2_formats[i];
> +
> +			if (info->fourcc == fourcc)
> +				return info;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * vsp1_get_format_info_by_index - Enumerate format information
> + * @vsp1: the VSP1 device
> + * @index: the format index
> + * @code: media bus code to limit enumeration
> + *
> + * Return a pointer to the format information structure corresponding to the
> + * given index, or NULL if the index exceeds the supported formats list. If the
> + * @code parameter is not zero, only formats compatible with the media bus code
> + * will be enumerated.
> + */
> +const struct vsp1_format_info *
> +vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
> +			      u32 code)
> +{
> +	unsigned int i;
> +
> +	if (!code) {
> +		if (index < ARRAY_SIZE(vsp1_video_formats))
> +			return &vsp1_video_formats[index];
> +
> +		if (vsp1->info->gen == 2) {
> +			index -= ARRAY_SIZE(vsp1_video_formats);
> +			if (index < ARRAY_SIZE(vsp1_video_gen2_formats))
> +				return &vsp1_video_gen2_formats[index];
> +		}
> +
> +		return NULL;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(vsp1_video_formats); ++i) {
> +		const struct vsp1_format_info *info = &vsp1_video_formats[i];
> +
> +		if (info->mbus == code) {
> +			if (!index)
> +				return info;
> +			index--;
> +		}
> +	}
> +
> +	if (vsp1->info->gen == 2) {
> +		for (i = 0; i < ARRAY_SIZE(vsp1_video_gen2_formats); ++i) {
> +			const struct vsp1_format_info *info =
> +				&vsp1_video_gen2_formats[i];
> +
> +			if (info->mbus == code) {
> +				if (!index)
> +					return info;
> +				index--;
> +			}
> +		}
> +	}
> +
>   	return NULL;
>   }
>   
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> index 1ba7bdbad5a8..1d3d033af209 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> @@ -179,5 +179,8 @@ void vsp1_pipeline_calculate_partition(struct vsp1_pipeline *pipe,
>   
>   const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
>   						    u32 fourcc);
> +const struct vsp1_format_info *
> +vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
> +			      u32 code);
>   
>   #endif /* __VSP1_PIPE_H__ */
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> index 03f4efd6b82b..da578993f472 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> @@ -888,7 +888,7 @@ vsp1_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>   	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
>   
>   	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_STREAMING
> -			  | V4L2_CAP_VIDEO_CAPTURE_MPLANE
> +			  | V4L2_CAP_IO_MC | V4L2_CAP_VIDEO_CAPTURE_MPLANE
>   			  | V4L2_CAP_VIDEO_OUTPUT_MPLANE;
>   
>   
> @@ -898,6 +898,22 @@ vsp1_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>   	return 0;
>   }
>   
> +static int vsp1_video_enum_format(struct file *file, void *fh,
> +				  struct v4l2_fmtdesc *f)
> +{
> +	struct v4l2_fh *vfh = file->private_data;
> +	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
> +	const struct vsp1_format_info *info;
> +
> +	info = vsp1_get_format_info_by_index(video->vsp1, f->index, f->mbus_code);
> +	if (!info)
> +		return -EINVAL;
> +
> +	f->pixelformat = info->fourcc;
> +
> +	return 0;
> +}
> +
>   static int
>   vsp1_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
>   {
> @@ -1013,6 +1029,8 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
>   
>   static const struct v4l2_ioctl_ops vsp1_video_ioctl_ops = {
>   	.vidioc_querycap		= vsp1_video_querycap,
> +	.vidioc_enum_fmt_vid_cap	= vsp1_video_enum_format,
> +	.vidioc_enum_fmt_vid_out	= vsp1_video_enum_format,
>   	.vidioc_g_fmt_vid_cap_mplane	= vsp1_video_get_format,
>   	.vidioc_s_fmt_vid_cap_mplane	= vsp1_video_set_format,
>   	.vidioc_try_fmt_vid_cap_mplane	= vsp1_video_try_format,
> @@ -1207,14 +1225,14 @@ struct vsp1_video *vsp1_video_create(struct vsp1_device *vsp1,
>   		video->pad.flags = MEDIA_PAD_FL_SOURCE;
>   		video->video.vfl_dir = VFL_DIR_TX;
>   		video->video.device_caps = V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> -					   V4L2_CAP_STREAMING;
> +					   V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
>   	} else {
>   		direction = "output";
>   		video->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>   		video->pad.flags = MEDIA_PAD_FL_SINK;
>   		video->video.vfl_dir = VFL_DIR_RX;
>   		video->video.device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> -					   V4L2_CAP_STREAMING;
> +					   V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
>   	}
>   
>   	mutex_init(&video->lock);

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

  Tomi


