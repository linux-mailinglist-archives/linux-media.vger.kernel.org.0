Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC0B1A15ED
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 21:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgDGTYs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 15:24:48 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38891 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbgDGTYr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 15:24:47 -0400
Received: by mail-lf1-f66.google.com with SMTP id l11so3291786lfc.5
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 12:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1eDwHIuq864sfvk+gP24RdI6jUztDsucRBJ8sfkpCII=;
        b=ktzGasxQeSW/PHxPnigEXF3npmaDvApLOzOHzdjFsmue07lh1FmJYORNhcEh3TEzDz
         jnXIz44sRKL3DcYX9HXHLHcEOmJ2UzBrpYvTbDldu7QQV9XSs+YEXrepKjrUt3TaAaNw
         5+kBU6KMaUelJSubRfOlEQ+75yD2IbP6lKXxA2aZmHLYx45dCd6C7lC88kGNzADqS2jC
         0QLX5EneKwWIvX9BzL5F+AaDhTi77jL43abjFp/9sP6a9TSx4m0PUC2/IdGkKGL/BYXG
         +c/uOcJs5iS9LRbjzy/YMiBCHE425cl5gkGWXnq5nT48wxcp8TvRqm4y97fsCaUGzM75
         v9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1eDwHIuq864sfvk+gP24RdI6jUztDsucRBJ8sfkpCII=;
        b=eL5O4586F5AsrwvDtvMC2sROJRSneLEu/CkPf7qhflMVm5gDSxPbMJTPcingFKPHfz
         ohdexDoEQPaZhhgUGD+4jRa0tx+gnVhcjB+3lyPxwZdmPib9weDG+EVChzp04EFM4j8c
         Hssv/e7bBLxOIuAzJPA/KHwLOtxOQ1ExzVIjlQDPjRlXrUUJE/B7frMtrZyT4wJIKymz
         7sORR498ybNKKv/O1shKbsQrCtvWYmD6aaQqDIAH6stSjVuNKSv5P//t7K2T6CHkowLT
         Bi7S45mg2JIiYfNdWZeKlLCJ8Qcn38I2xSKJ6Bp7sKlcfaUi5YNWvmyt9Sufe4QqC3ff
         1R8Q==
X-Gm-Message-State: AGi0PuakdsCQmpVbOu3f4UuVGjM3s/0p0MlHpiE4iRz1HskBGXEIM4Oe
        HDJmId5K7hcpzieuy0/ASFumNikUrpc=
X-Google-Smtp-Source: APiQypKGo8qvUpgS5S2IV9L70zANZNOeHFLm2uYoQAsWK1C+HW3ZSuQxX4mY70Nru0p74FO+8kdiPw==
X-Received: by 2002:ac2:4295:: with SMTP id m21mr2453258lfh.132.1586287482458;
        Tue, 07 Apr 2020 12:24:42 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id w24sm12145002ljh.57.2020.04.07.12.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 12:24:41 -0700 (PDT)
Date:   Tue, 7 Apr 2020 21:24:41 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        hans.verkuil@cisco.com, skhan@linuxfoundation.org,
        mchehab@kernel.org
Subject: Re: [PATCH v2 1/3] media: v4l2-common: add helper functions to call
 s_stream() callbacks
Message-ID: <20200407192441.GE1716317@oden.dyn.berto.se>
References: <20200403213312.1863876-1-helen.koike@collabora.com>
 <20200403213312.1863876-2-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200403213312.1863876-2-helen.koike@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thanks for your work.

On 2020-04-03 18:33:10 -0300, Helen Koike wrote:
> Add v4l2_pipeline_stream_{enable,disable} helper functions to iterate
> through the subdevices in a given stream (i.e following links from sink
> to source) and call .s_stream() callback.
> 
> Add stream_count on the subdevice object for simultaneous streaming from
> different video devices which shares subdevices.
> 
> Prevent calling .s_stream(true) if it was already called previously by
> another stream.
> 
> Prevent calling .s_stream(false) from one stream when there are still
> others active.
> 
> If .s_stream(true) fails, call .s_stream(false) in the reverse order.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
> Changes in v2:
> - re-write helpers to not use media walkers
> 
>  drivers/media/v4l2-core/v4l2-common.c | 117 ++++++++++++++++++++++++++
>  include/media/v4l2-common.h           |  28 ++++++
>  include/media/v4l2-subdev.h           |   2 +
>  3 files changed, 147 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index d0e5ebc736f9f..379d4bf4f8128 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -441,3 +441,120 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> +
> +/*
> + * v4l2_pipeline_subdevs_get - Assemble a list of subdevices in a pipeline
> + * @subdevs: the array to be filled
> + * @size: the array size

Should this be documented as the maximum number of elements that can fit 
in the subdevs array?

> + *
> + * Walk from a video node, following link from sink to source and fill the
> + * array with subdevices in the path.
> + *
> + * Note: this function follows the first enabled link in a sink pad found in a
> + * given entity. Thus it won't work if there are entities with multiple enabled
> + * links to its sink pads in the topology.

I wonder if it would be more useful to make this function return all 
subdevs in the pipeline that have an enabled link going from sink to 
source while walking from the video device?

When reading the commit messages I thought this could be useful for the 
rcar-vin driver. By not finding all subdevices in the pipeline this 
would not be possible as there on some platforms are a CSI-2 bus where 
the CSI-2 transmitter have 4 sink pads and one source pads so the whole 
pipeline would not be started.

> + *
> + * Return the number of subdevices filled in the array.
> + */
> +static unsigned int v4l2_pipeline_subdevs_get(struct video_device *vdev,
> +					      struct v4l2_subdev **subdevs,
> +					      unsigned int size)
> +{
> +	struct media_entity *entity = &vdev->entity;
> +	unsigned int idx = 0;
> +
> +	while (1) {
> +		struct media_pad *src_pad = NULL;
> +		unsigned int i;
> +
> +		/* Find remote source pad */
> +		for (i = 0; i < entity->num_pads; i++) {
> +			struct media_pad *sink_pad = &entity->pads[i];
> +
> +			if (!(sink_pad->flags & MEDIA_PAD_FL_SINK))
> +				continue;
> +
> +			src_pad = media_entity_remote_pad(sink_pad);
> +			if (src_pad &&
> +			    is_media_entity_v4l2_subdev(src_pad->entity))
> +				break;
> +		}
> +		if (i == entity->num_pads)
> +			break;
> +
> +		if (idx >= size) {
> +			WARN_ON(1);
> +			return 0;

Would it make sens to have this function return int and a negative error 
code here? Is this now how other areas of V4L2 deal with when a provided 
array is too small ? I'm thinking about if this function could be 
exported for use by drivers in the future.

> +		}
> +
> +		entity = src_pad->entity;
> +		subdevs[idx++] = media_entity_to_v4l2_subdev(entity);
> +	}
> +
> +	return idx;
> +}
> +
> +__must_check int v4l2_pipeline_stream_enable(struct video_device *vdev)
> +{
> +	struct media_device *mdev = vdev->entity.graph_obj.mdev;
> +	struct v4l2_subdev *subdevs[MEDIA_ENTITY_ENUM_MAX_DEPTH];
> +	struct v4l2_subdev *sd;
> +	unsigned int i, size;
> +	int ret;
> +
> +	mutex_lock(&mdev->graph_mutex);
> +
> +	size = v4l2_pipeline_subdevs_get(vdev, subdevs, ARRAY_SIZE(subdevs));
> +
> +	for (i = 0; i < size; i++) {
> +		sd = subdevs[i];
> +		if (sd->stream_count++)
> +			continue;
> +		dev_dbg(mdev->dev,
> +			"enabling stream for '%s'\n", sd->entity.name);

Small nit, would it make sens to print the sd->stream_count also in this 
debug statement (and the similar ones bellow) ?

> +		ret = v4l2_subdev_call(sd, video, s_stream, true);
> +		if (ret && ret != -ENOIOCTLCMD)
> +			goto err_stream_disable;
> +	}
> +
> +	mutex_unlock(&mdev->graph_mutex);
> +	return 0;
> +
> +err_stream_disable:
> +	do {
> +		sd = subdevs[i];
> +		if (--sd->stream_count)
> +			continue;
> +		dev_dbg(mdev->dev,
> +			"disabling stream for '%s'\n", sd->entity.name);
> +		v4l2_subdev_call(sd, video, s_stream, false);
> +	} while (i--);
> +
> +	mutex_unlock(&mdev->graph_mutex);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_pipeline_stream_enable);
> +
> +void v4l2_pipeline_stream_disable(struct video_device *vdev)
> +{
> +	struct media_device *mdev = vdev->entity.graph_obj.mdev;
> +	struct v4l2_subdev *subdevs[MEDIA_ENTITY_ENUM_MAX_DEPTH];
> +	unsigned int size;
> +
> +	mutex_lock(&mdev->graph_mutex);
> +
> +	size = v4l2_pipeline_subdevs_get(vdev, subdevs, ARRAY_SIZE(subdevs));
> +
> +	while (size--) {
> +		struct v4l2_subdev *sd = subdevs[size];
> +
> +		if (--sd->stream_count)
> +			continue;
> +		dev_dbg(mdev->dev,
> +			"disabling stream for '%s'\n", sd->entity.name);
> +		v4l2_subdev_call(sd, video, s_stream, false);
> +	}
> +
> +	mutex_unlock(&mdev->graph_mutex);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_pipeline_stream_disable);
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 150ee16ebd811..e833610b0f66d 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -519,6 +519,34 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>  int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>  			u32 width, u32 height);
>  
> +/**
> + * v4l2_pipeline_stream_enable - Call .s_stream(true) callbacks in the stream
> + * @vdev: Starting video device
> + *
> + * Call .s_stream(true) callback in all the subdevices participating in the
> + * stream, i.e. following links from sink to source.
> + *
> + * Calls to this function can be nested, in which case the same number of
> + * v4l2_pipeline_stream_disable() calls will be required to stop streaming.
> + * The  pipeline pointer must be identical for all nested calls to
> + * v4l2_pipeline_stream_enable().
> + */
> +__must_check int v4l2_pipeline_stream_enable(struct video_device *vdev);
> +
> +/**
> + * v4l2_pipeline_stream_disable - Call .s_stream(false) callbacks in the stream
> + * @vdev: Starting video device
> + *
> + * Call .s_stream(true) callback in all the subdevices participating in the
> + * stream, i.e. following links from sink to source.
> + *
> + * Calls to this function can be nested, in which case the same number of
> + * v4l2_pipeline_stream_disable() calls will be required to stop streaming.
> + * The  pipeline pointer must be identical for all nested calls to
> + * v4l2_pipeline_stream_enable().
> + */
> +void v4l2_pipeline_stream_disable(struct video_device *vdev);
> +
>  static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
>  {
>  	/*
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index a4848de598521..20f913a9f70c5 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -838,6 +838,7 @@ struct v4l2_subdev_platform_data {
>   * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
>   *		     device using v4l2_device_register_sensor_subdev().
>   * @pdata: common part of subdevice platform data
> + * @stream_count: Stream count for the subdevice.
>   *
>   * Each instance of a subdev driver should create this struct, either
>   * stand-alone or embedded in a larger struct.
> @@ -869,6 +870,7 @@ struct v4l2_subdev {
>  	struct v4l2_async_notifier *notifier;
>  	struct v4l2_async_notifier *subdev_notifier;
>  	struct v4l2_subdev_platform_data *pdata;
> +	unsigned int stream_count;
>  };
>  
>  
> -- 
> 2.26.0
> 

-- 
Regards,
Niklas Söderlund
