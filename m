Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31DCF1BA564
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 15:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgD0Nty (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 09:49:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38312 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgD0Ntx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 09:49:53 -0400
Received: from [IPv6:2804:431:e7cc:dff4:7411:8bdd:69e5:f5d8] (unknown [IPv6:2804:431:e7cc:dff4:7411:8bdd:69e5:f5d8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 61D3C2A0757;
        Mon, 27 Apr 2020 14:49:47 +0100 (BST)
Subject: Re: [PATCH v3 2/4] media: v4l2-common: add helper functions to call
 s_stream() callbacks
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        hans.verkuil@cisco.com, skhan@linuxfoundation.org,
        mchehab@kernel.org
References: <20200415013044.1778572-1-helen.koike@collabora.com>
 <20200415013044.1778572-3-helen.koike@collabora.com>
 <20200424134152.GB4040416@oden.dyn.berto.se>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <0967fd38-e36e-c32c-d4b3-7b7c22a31237@collabora.com>
Date:   Mon, 27 Apr 2020 10:49:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424134152.GB4040416@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/24/20 10:41 AM, Niklas Söderlund wrote:
> Hi Helen,
> 
> Thanks for your work.
> 
> On 2020-04-14 22:30:42 -0300, Helen Koike wrote:
>> Add v4l2_pipeline_stream_{enable,disable} helper functions to iterate
>> through the subdevices in a given stream (i.e following links from sink
>> to source) and call .s_stream() callback.
>>
>> Add stream_count on the subdevice object for simultaneous streaming from
>> different video devices which shares subdevices.
>>
>> Prevent calling .s_stream(true) if it was already called previously by
>> another stream.
>>
>> Prevent calling .s_stream(false) from one stream when there are still
>> others active.
>>
>> If .s_stream(true) fails, call .s_stream(false) in the reverse order.
>>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>> ---
>>
>> Changes in v3:
>> - re-write helpers to use media walkers as in v1, but with
>> v4l2_pipeline_subdevs_get() to reverse the order we call s_stream(true)
>> in subdevices.
>> - rename size to max_size (and update docs) in v4l2_pipeline_subdevs_get() to
>> reflect the meaning of the argument.
>> - add if defined(CONFIG_MEDIA_CONTROLLER) around helpers
>>
>> Changes in v2:
>> - re-write helpers to not use media walkers
>>
>>  drivers/media/v4l2-core/v4l2-common.c | 125 ++++++++++++++++++++++++++
>>  include/media/v4l2-common.h           |  43 +++++++++
>>  include/media/v4l2-subdev.h           |   2 +
>>  3 files changed, 170 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>> index 9e8eb45a5b03c..2f991a1a57d7c 100644
>> --- a/drivers/media/v4l2-core/v4l2-common.c
>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>> @@ -442,3 +442,128 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>>  	return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
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
>> +				     struct media_pipeline *pipe,
>> +				     struct v4l2_subdev **subdevs,
>> +				     unsigned int max_size)
>> +{
>> +	struct media_entity *entity = &vdev->entity;
>> +	struct media_device *mdev = entity->graph_obj.mdev;
>> +	int idx = 0;
>> +	int ret;
>> +
>> +	mutex_lock(&mdev->graph_mutex);
>> +
>> +	if (!pipe->streaming_count) {
>> +		ret = media_graph_walk_init(&pipe->graph, mdev);
>> +		if (ret) {
>> +			mutex_unlock(&mdev->graph_mutex);
>> +			return ret;
>> +		}
>> +	}
> 
> This confuses me a bit. Why is this conditional on streaming_count ?  
> Looking how it's used in mc-entity.c the count is also 
> increased/decreased with this pattern.
> 
> Would it make sens to create a local 'struct media_graph graph' here and 
> always init and clean it up ?

media_pipeline_start() initialize the walker by calling media_graph_walk_init() when
pipe->stream_count increases to 1, and it leaves to media_pipeline_stop() to call
media_graph_walk_cleanup() when pipe->streaming_count reaches 0.

So, if this function is called before any call to media_pipeline_start(),  i.e pipe->streaming_count == 0,
it needs to init and clean the walker up, otherwise it shouldn't do it.
If it is called after the last media_pipeline_stop() is called, i.e pipe->streaming_count == 0 again,
it should also init and clean up.

This is what the conditional checks, if the walker is already initialized or not.

But I think I could use a local struct media_graph to have an independent walker from the media_pipeline_{start,stop}(),
instead or reusing the struct media_pipeline that is being given (and I could remove the pipe parameter of these functions).
I was wondering if there was any issue of having an independent walker, but I don't think so, let me do this and re-send the series.

> 
>> +
>> +	media_graph_walk_start(&pipe->graph, entity);
>> +
>> +	while ((entity = media_graph_walk_next_stream(&pipe->graph))) {
>> +		if (!is_media_entity_v4l2_subdev(entity))
>> +			continue;
>> +		if (WARN_ON(idx >= max_size)) {
>> +			mutex_unlock(&mdev->graph_mutex);
>> +			return -EINVAL;
>> +		}
>> +		subdevs[idx++] = media_entity_to_v4l2_subdev(entity);
>> +	}
>> +
>> +	if (!pipe->streaming_count)
>> +		media_graph_walk_cleanup(&pipe->graph);
>> +
>> +	mutex_unlock(&mdev->graph_mutex);
>> +
>> +	return idx;
>> +}
>> +
>> +__must_check int v4l2_pipeline_stream_enable(struct video_device *vdev,
>> +					     struct media_pipeline *pipe)
>> +{
>> +	struct media_device *mdev = vdev->entity.graph_obj.mdev;
>> +	struct v4l2_subdev *subdevs[MEDIA_ENTITY_ENUM_MAX_DEPTH];
>> +	struct v4l2_subdev *sd;
>> +	int i, size, ret;
>> +
>> +	size = v4l2_pipeline_subdevs_get(vdev, pipe,
>> +					 subdevs, ARRAY_SIZE(subdevs));
>> +	if (size <= 0)
>> +		return size;
>> +
>> +	/* Call s_stream() in reverse order to enable sensors last */
>> +	for (i = size - 1; i >= 0; i--) {
>> +		sd = subdevs[i];
>  +		if (sd->stream_count++)
>> +			continue;
>> +		dev_dbg(mdev->dev,
>> +			"enabling stream for '%s'\n", sd->entity.name);
>> +		ret = v4l2_subdev_call(sd, video, s_stream, true);
>> +		if (ret && ret != -ENOIOCTLCMD) {
>> +			sd->stream_count = 0;
>> +			goto err_stream_disable;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +err_stream_disable:
>> +	for (i++; i < size; i++) {
>> +		sd = subdevs[i];
>> +		if (--sd->stream_count)
>> +			continue;
>> +		dev_dbg(mdev->dev,
>> +			"disabling stream for '%s'\n", sd->entity.name);
>> +		v4l2_subdev_call(sd, video, s_stream, false);
>> +	};
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_pipeline_stream_enable);
>> +
>> +void v4l2_pipeline_stream_disable(struct video_device *vdev,
>> +				  struct media_pipeline *pipe)
>> +{
>> +	struct media_device *mdev = vdev->entity.graph_obj.mdev;
>> +	struct v4l2_subdev *subdevs[MEDIA_ENTITY_ENUM_MAX_DEPTH];
>> +	unsigned int i;
>> +	int size;
>> +
>> +	size = v4l2_pipeline_subdevs_get(vdev, pipe,
>> +					 subdevs, ARRAY_SIZE(subdevs));
>> +	if (WARN_ON(size < 0))
>> +		return;
>> +
>> +	/* Call s_stream() in order to disable sensors first */
>> +	for (i = 0; i < size; i++) {
>> +		struct v4l2_subdev *sd = subdevs[i];
>> +
>> +		if (--sd->stream_count)
>> +			continue;
>> +		dev_dbg(mdev->dev,
>> +			"disabling stream for '%s'\n", sd->entity.name);
>> +		v4l2_subdev_call(sd, video, s_stream, false);
> 
> small nit, maybe this can be extracted to a helper as the code is 
> duplicated here and in the error path v4l2_pipeline_stream_enable ?

ack, I'll see how I can improve this.


Thanks for reviewing!
Helen

> 
>> +	}
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_pipeline_stream_disable);
>> +
>> +#endif /* CONFIG_MEDIA_CONTROLLER */
>> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
>> index 150ee16ebd811..dc46812120cdc 100644
>> --- a/include/media/v4l2-common.h
>> +++ b/include/media/v4l2-common.h
>> @@ -539,4 +539,47 @@ static inline void v4l2_buffer_set_timestamp(struct v4l2_buffer *buf,
>>  	buf->timestamp.tv_usec = ts.tv_nsec / NSEC_PER_USEC;
>>  }
>>  
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +
>> +/**
>> + * v4l2_pipeline_stream_enable - Call .s_stream(true) callbacks in the stream
>> + * @vdev: Starting video device.
>> + * @pipe: Pipeline this entity belongs to.
>> + *
>> + * Call .s_stream(true) callback in all the subdevices participating in the
>> + * stream, i.e. following links from sink to source.
>> + *
>> + * .s_stream(true) is also called from sink to source, i.e. in a topology
>> + * sd1->sd2->sd3->vdev, .s_stream(true) of sd3 is called first.
>> + *
>> + * Calls to this function can be nested, in which case the same number of
>> + * v4l2_pipeline_stream_disable() calls will be required to disable streaming
>> + * through subdevices in the pipeline.
>> + * The  pipeline pointer must be identical for all nested calls to
>> + * v4l2_pipeline_stream_enable().
>> + */
>> +__must_check int v4l2_pipeline_stream_enable(struct video_device *vdev,
>> +					     struct media_pipeline *pipe);
>> +
>> +/**
>> + * v4l2_pipeline_stream_disable - Call .s_stream(false) callbacks in the stream
>> + * @vdev: Starting video device.
>> + * @pipe: Pipeline this entity belongs to.
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
>> +void v4l2_pipeline_stream_disable(struct video_device *vdev,
>> +				  struct media_pipeline *pipe);
>> +
>> +#endif /* CONFIG_MEDIA_CONTROLLER */
>> +
>>  #endif /* V4L2_COMMON_H_ */
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index a4848de598521..20f913a9f70c5 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -838,6 +838,7 @@ struct v4l2_subdev_platform_data {
>>   * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
>>   *		     device using v4l2_device_register_sensor_subdev().
>>   * @pdata: common part of subdevice platform data
>> + * @stream_count: Stream count for the subdevice.
>>   *
>>   * Each instance of a subdev driver should create this struct, either
>>   * stand-alone or embedded in a larger struct.
>> @@ -869,6 +870,7 @@ struct v4l2_subdev {
>>  	struct v4l2_async_notifier *notifier;
>>  	struct v4l2_async_notifier *subdev_notifier;
>>  	struct v4l2_subdev_platform_data *pdata;
>> +	unsigned int stream_count;
>>  };
>>  
>>  
>> -- 
>> 2.26.0
>>
> 
