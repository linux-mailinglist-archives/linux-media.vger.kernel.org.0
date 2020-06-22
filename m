Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8746E2038C6
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 16:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729205AbgFVOHu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 10:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728977AbgFVOHu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 10:07:50 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A4CC061573
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 07:07:50 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 514672610E1
Subject: Re: [PATCH v4 2/5] media: v4l2-common: add helper functions to call
 s_stream() callbacks
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org, skhan@linuxfoundation.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
 <20200522075522.6190-3-dafna.hirschfeld@collabora.com>
 <d06d2f6e-5026-f62d-3d27-a0486083dae1@xs4all.nl>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <64753207-594b-d87a-4fb0-aade156473e1@collabora.com>
Date:   Mon, 22 Jun 2020 16:07:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d06d2f6e-5026-f62d-3d27-a0486083dae1@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 22.06.20 11:00, Hans Verkuil wrote:
> On 22/05/2020 09:55, Dafna Hirschfeld wrote:
>> From: Helen Koike <helen.koike@collabora.com>
>>
>> Add v4l2_pipeline_stream_{enable,disable} helper functions to iterate
>> through the subdevices in a given stream (i.e following links from sink
>> to source) and call .s_stream() callback.
>>
>> If .s_stream(true) fails, call .s_stream(false) in the reverse order.
>>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-common.c | 99 +++++++++++++++++++++++++++
>>   include/media/v4l2-common.h           | 39 +++++++++++
>>   2 files changed, 138 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>> index 9e8eb45a5b03..734db2bf5ca9 100644
>> --- a/drivers/media/v4l2-core/v4l2-common.c
>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>> @@ -442,3 +442,102 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
>> +
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +
>> +/*
>> + * v4l2_pipeline_subdevs_get - Assemble a list of subdevices in a pipeline
>> + * @subdevs: the array to be filled.
>> + * @max_size: max number of elements that can fit in subdevs array.
>> + *
>> + * Walk from a video node, following links from sink to source and fill the
>> + * array with subdevices in the path.
>> + * The walker performs a depth-first traversal, which means that, in a topology
>> + * sd1->sd2->sd3->vdev, sd1 will be the first element placed in the array.
>> + *
>> + * Return the number of subdevices filled in the array.
>> + */
>> +static int v4l2_pipeline_subdevs_get(struct video_device *vdev,
>> +				     struct v4l2_subdev **subdevs,
>> +				     unsigned int max_size)
>> +{
>> +	struct media_entity *entity = &vdev->entity;
>> +	struct media_device *mdev = entity->graph_obj.mdev;
>> +	struct media_graph graph;
>> +	int idx = 0;
>> +	int ret;
>> +
>> +	ret = media_graph_walk_init(&graph, mdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	media_graph_walk_start(&graph, entity);
>> +
>> +	while ((entity = media_graph_walk_next_stream(&graph))) {
>> +		if (!is_media_entity_v4l2_subdev(entity))
>> +			continue;
>> +		if (WARN_ON(idx >= max_size))
>> +			return -EINVAL;
>> +		subdevs[idx++] = media_entity_to_v4l2_subdev(entity);
>> +	}
>> +
>> +	media_graph_walk_cleanup(&graph);
>> +
>> +	return idx;
>> +}
>> +
>> +static void v4l2_subdevs_stream_disable(struct v4l2_subdev **subdevs, int size)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < size; i++) {
>> +		struct v4l2_subdev *sd = subdevs[i];
>> +
>> +		dev_dbg(sd->dev,
>> +			"disabling stream for '%s'\n", sd->entity.name);
>> +		v4l2_subdev_call(sd, video, s_stream, false);
>> +	}
>> +}
>> +
>> +__must_check int v4l2_pipeline_stream_enable(struct video_device *vdev)
>> +{
>> +	struct media_device *mdev = vdev->entity.graph_obj.mdev;
>> +	struct v4l2_subdev *subdevs[MEDIA_ENTITY_ENUM_MAX_DEPTH];
>> +	struct v4l2_subdev *sd;
>> +	int i, size, ret;
>> +
>> +	size = v4l2_pipeline_subdevs_get(vdev, subdevs, ARRAY_SIZE(subdevs));
>> +	if (size <= 0)
>> +		return size;
>> +
>> +	/* Call s_stream() in reverse order to enable sensors last */
>> +	for (i = size - 1; i >= 0; i--) {
>> +		sd = subdevs[i];
>> +		dev_dbg(mdev->dev,
>> +			"enabling stream for '%s'\n", sd->entity.name);
>> +		ret = v4l2_subdev_call(sd, video, s_stream, true);
>> +		if (ret && ret != -ENOIOCTLCMD) {
>> +			v4l2_subdevs_stream_disable(subdevs + i + 1,
>> +						    size - i - 1);
>> +			return ret;
>> +		}
>> +	}
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_pipeline_stream_enable);
>> +
>> +int v4l2_pipeline_stream_disable(struct video_device *vdev)
>> +{
>> +	struct v4l2_subdev *subdevs[MEDIA_ENTITY_ENUM_MAX_DEPTH];
>> +	int size;
>> +
>> +	size = v4l2_pipeline_subdevs_get(vdev, subdevs, ARRAY_SIZE(subdevs));
>> +	if (size < 0)
>> +		return size;
>> +
>> +	v4l2_subdevs_stream_disable(subdevs, size);
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_pipeline_stream_disable);
>> +
>> +#endif /* CONFIG_MEDIA_CONTROLLER */
>> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
>> index 150ee16ebd81..a278bcf3c5bc 100644
>> --- a/include/media/v4l2-common.h
>> +++ b/include/media/v4l2-common.h
>> @@ -539,4 +539,43 @@ static inline void v4l2_buffer_set_timestamp(struct v4l2_buffer *buf,
>>   	buf->timestamp.tv_usec = ts.tv_nsec / NSEC_PER_USEC;
>>   }
>>   
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +
>> +/**
>> + * v4l2_pipeline_stream_enable - Call .s_stream(true) callbacks in the stream
>> + * @vdev: Starting video device.
>> + *
>> + * Call .s_stream(true) callback in all the subdevices participating in the
>> + * stream, i.e. following links from sink to source.
>> + *
>> + * .s_stream(true) is also called from sink to source, i.e. in a topology
>> + * sd1->sd2->sd3->vdev, .s_stream(true) of sd3 is called first.
>> + *
>> + * Calls to this function can be nested, in which case the same number of
> 
> Since there is no refcounting (as opposed to v3) you cannot nest these calls,
> so the comments for both these functions should be updated.
> 
>> + * v4l2_pipeline_stream_disable() calls will be required to disable streaming
>> + * through subdevices in the pipeline.
>> + * The  pipeline pointer must be identical for all nested calls to
>> + * v4l2_pipeline_stream_enable().
>> + */
>> +__must_check int v4l2_pipeline_stream_enable(struct video_device *vdev);
>> +
>> +/**
>> + * v4l2_pipeline_stream_disable - Call .s_stream(false) callbacks in the stream
>> + * @vdev: Starting video device.
>> + *
>> + * Call .s_stream(false) callback in all the subdevices participating in the
>> + * stream, i.e. following links from sink to source.
>> + *
>> + * s_stream(false) is called in a reverse order from
>> + * v4l2_pipeline_stream_enable(), i.e. in a topology sd1->sd2->sd3->vdev,
>> + * .s_stream(false) of sd1 is called first.
>> + *
>> + * If multiple calls to v4l2_pipeline_stream_enable() have been made, the same
>> + * number of calls to this function are required to disable streaming through
>> + * subdevices in the pipeline.
>> + */
>> +int v4l2_pipeline_stream_disable(struct video_device *vdev);
> 
> I'm inclined to make this a void function. Typically a 'disable' function should
> always succeed because there really is not much you can do if it fails.
> 
> If v4l2_pipeline_subdevs_get() fails, then just WARN_ON. This really should not
> happen.
> 
> Another problem (Tomasz described that in one of his replies) is with drivers like
> adv748x that manage the rest of the pipeline on their own.
> 
> The problem is that (AFAIK) you can't see this when walking the graph. What you
> would like to know is if an entity controls the upstream entities by having that
> entity set a flag or something. Then these pipeline functions would stop at that
> entity and let that entity do the work for the upstream entities.
> 
> If it is not too much work to support this, then it would be nice to have this.

Hi, I can do it using the sd->dev field like Sakari suggested.
So the loop iterate only until sd->dev changes.

> If it is a lot of work, then it should be documented that these functions are
> likely not suitable for such pipelines.
> 
> I was also wondering how this function relates to media_pipeline_start(). Which
> function should be called first (I think media_pipeline_start() has to come before
> v4l2_pipeline_stream_enable(), although patch 4/5 appears to do the opposite).

I also think media_pipeline_start should be called first since it
calls the link_validate callbacks. In the patchset I have patch 3/5 calling media_pipeline_start
first.

> And I was also wondering if the stream_count (incremented by media_pipeline_start())
> is something that v4l2_pipeline_stream_enable/disable could use: i.e. s_stream only
> needs to be called if stream_count == 1.

Yes, I think this is also possible.

Thanks,
Dafna

> 
> In fact, perhaps v4l2_pipeline_stream_enable/disable should call __media_pipeline_start/stop?
> 
> Regards,
> 
> 	Hans
> 
>> +
>> +#endif /* CONFIG_MEDIA_CONTROLLER */
>> +
>>   #endif /* V4L2_COMMON_H_ */
>>
> 
