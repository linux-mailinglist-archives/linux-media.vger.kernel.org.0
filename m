Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551011E0A51
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 11:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389379AbgEYJXy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 05:23:54 -0400
Received: from mga09.intel.com ([134.134.136.24]:33917 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389105AbgEYJXx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 05:23:53 -0400
IronPort-SDR: wBxnwV5W+OHiayKKCT1YN0IIZjM5slNd82jjFo42adQtyvUj9rp2mPspKFs58YMNIkFQwBNIvG
 pJhZVfHX7J0A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2020 02:23:53 -0700
IronPort-SDR: 8T+EYlekXW81YDnfQxgXmNPP4+sZpiz5bOQmWREGy7U1kHCX1wzKMUyAi2yCUsafJl4+ho9slt
 jNT+gJIWlmvg==
X-IronPort-AV: E=Sophos;i="5.73,432,1583222400"; 
   d="scan'208";a="254861106"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2020 02:23:50 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id F1EB620953; Mon, 25 May 2020 12:23:47 +0300 (EEST)
Date:   Mon, 25 May 2020 12:23:47 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, skhan@linuxfoundation.org,
        niklas.soderlund@ragnatech.se--annotate
Subject: Re: [PATCH v4 2/5] media: v4l2-common: add helper functions to call
 s_stream() callbacks
Message-ID: <20200525092347.GD7618@paasikivi.fi.intel.com>
References: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
 <20200522075522.6190-3-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522075522.6190-3-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

My apologies for not reviewing this earlier.

On Fri, May 22, 2020 at 09:55:19AM +0200, Dafna Hirschfeld wrote:
> From: Helen Koike <helen.koike@collabora.com>
> 
> Add v4l2_pipeline_stream_{enable,disable} helper functions to iterate
> through the subdevices in a given stream (i.e following links from sink
> to source) and call .s_stream() callback.
> 
> If .s_stream(true) fails, call .s_stream(false) in the reverse order.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 99 +++++++++++++++++++++++++++
>  include/media/v4l2-common.h           | 39 +++++++++++
>  2 files changed, 138 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 9e8eb45a5b03..734db2bf5ca9 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -442,3 +442,102 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> +
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +
> +/*
> + * v4l2_pipeline_subdevs_get - Assemble a list of subdevices in a pipeline
> + * @subdevs: the array to be filled.
> + * @max_size: max number of elements that can fit in subdevs array.
> + *
> + * Walk from a video node, following links from sink to source and fill the
> + * array with subdevices in the path.
> + * The walker performs a depth-first traversal, which means that, in a topology
> + * sd1->sd2->sd3->vdev, sd1 will be the first element placed in the array.
> + *
> + * Return the number of subdevices filled in the array.
> + */
> +static int v4l2_pipeline_subdevs_get(struct video_device *vdev,
> +				     struct v4l2_subdev **subdevs,
> +				     unsigned int max_size)
> +{
> +	struct media_entity *entity = &vdev->entity;
> +	struct media_device *mdev = entity->graph_obj.mdev;
> +	struct media_graph graph;
> +	int idx = 0;
> +	int ret;
> +
> +	ret = media_graph_walk_init(&graph, mdev);
> +	if (ret)
> +		return ret;
> +
> +	media_graph_walk_start(&graph, entity);
> +
> +	while ((entity = media_graph_walk_next_stream(&graph))) {
> +		if (!is_media_entity_v4l2_subdev(entity))
> +			continue;
> +		if (WARN_ON(idx >= max_size))
> +			return -EINVAL;
> +		subdevs[idx++] = media_entity_to_v4l2_subdev(entity);
> +	}
> +
> +	media_graph_walk_cleanup(&graph);
> +
> +	return idx;
> +}
> +
> +static void v4l2_subdevs_stream_disable(struct v4l2_subdev **subdevs, int size)
> +{
> +	int i;
> +
> +	for (i = 0; i < size; i++) {
> +		struct v4l2_subdev *sd = subdevs[i];
> +
> +		dev_dbg(sd->dev,
> +			"disabling stream for '%s'\n", sd->entity.name);
> +		v4l2_subdev_call(sd, video, s_stream, false);
> +	}
> +}
> +
> +__must_check int v4l2_pipeline_stream_enable(struct video_device *vdev)
> +{
> +	struct media_device *mdev = vdev->entity.graph_obj.mdev;
> +	struct v4l2_subdev *subdevs[MEDIA_ENTITY_ENUM_MAX_DEPTH];
> +	struct v4l2_subdev *sd;
> +	int i, size, ret;
> +
> +	size = v4l2_pipeline_subdevs_get(vdev, subdevs, ARRAY_SIZE(subdevs));
> +	if (size <= 0)
> +		return size;
> +
> +	/* Call s_stream() in reverse order to enable sensors last */
> +	for (i = size - 1; i >= 0; i--) {
> +		sd = subdevs[i];
> +		dev_dbg(mdev->dev,
> +			"enabling stream for '%s'\n", sd->entity.name);
> +		ret = v4l2_subdev_call(sd, video, s_stream, true);

The s_stream callback is only called on the very next sub-device upstream
in the pipeline, not on any further sub-devices. This is because a driver
for the device knows best in which order things need to be set up.

This could include, for instance, telling a sensor to place its CSI-2
transmitter to LP-11 state.

> +		if (ret && ret != -ENOIOCTLCMD) {
> +			v4l2_subdevs_stream_disable(subdevs + i + 1,
> +						    size - i - 1);
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_pipeline_stream_enable);
> +
> +int v4l2_pipeline_stream_disable(struct video_device *vdev)
> +{
> +	struct v4l2_subdev *subdevs[MEDIA_ENTITY_ENUM_MAX_DEPTH];
> +	int size;
> +
> +	size = v4l2_pipeline_subdevs_get(vdev, subdevs, ARRAY_SIZE(subdevs));
> +	if (size < 0)
> +		return size;
> +
> +	v4l2_subdevs_stream_disable(subdevs, size);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_pipeline_stream_disable);
> +
> +#endif /* CONFIG_MEDIA_CONTROLLER */
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 150ee16ebd81..a278bcf3c5bc 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -539,4 +539,43 @@ static inline void v4l2_buffer_set_timestamp(struct v4l2_buffer *buf,
>  	buf->timestamp.tv_usec = ts.tv_nsec / NSEC_PER_USEC;
>  }
>  
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +
> +/**
> + * v4l2_pipeline_stream_enable - Call .s_stream(true) callbacks in the stream
> + * @vdev: Starting video device.
> + *
> + * Call .s_stream(true) callback in all the subdevices participating in the
> + * stream, i.e. following links from sink to source.
> + *
> + * .s_stream(true) is also called from sink to source, i.e. in a topology
> + * sd1->sd2->sd3->vdev, .s_stream(true) of sd3 is called first.
> + *
> + * Calls to this function can be nested, in which case the same number of
> + * v4l2_pipeline_stream_disable() calls will be required to disable streaming
> + * through subdevices in the pipeline.
> + * The  pipeline pointer must be identical for all nested calls to
> + * v4l2_pipeline_stream_enable().
> + */
> +__must_check int v4l2_pipeline_stream_enable(struct video_device *vdev);
> +
> +/**
> + * v4l2_pipeline_stream_disable - Call .s_stream(false) callbacks in the stream
> + * @vdev: Starting video device.
> + *
> + * Call .s_stream(false) callback in all the subdevices participating in the
> + * stream, i.e. following links from sink to source.
> + *
> + * s_stream(false) is called in a reverse order from
> + * v4l2_pipeline_stream_enable(), i.e. in a topology sd1->sd2->sd3->vdev,
> + * .s_stream(false) of sd1 is called first.
> + *
> + * If multiple calls to v4l2_pipeline_stream_enable() have been made, the same
> + * number of calls to this function are required to disable streaming through
> + * subdevices in the pipeline.
> + */
> +int v4l2_pipeline_stream_disable(struct video_device *vdev);
> +
> +#endif /* CONFIG_MEDIA_CONTROLLER */
> +
>  #endif /* V4L2_COMMON_H_ */

-- 
Kind regards,

Sakari Ailus
