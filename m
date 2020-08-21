Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0159824D80D
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 17:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgHUPLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 11:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgHUPLa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 11:11:30 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1F02C061573;
        Fri, 21 Aug 2020 08:11:29 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 4391329AC90
Subject: Re: [PATCH v3 4/9] media: vimc: Separate starting stream from
 pipeline initialisation
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
 <20200819180442.11630-5-kgupta@es.iitr.ac.in>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <eb5d4259-fe77-b4f2-1e62-0f846420b7c2@collabora.com>
Date:   Fri, 21 Aug 2020 17:11:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819180442.11630-5-kgupta@es.iitr.ac.in>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 19.08.20 um 20:04 schrieb Kaaira Gupta:
> Separate the process of initialising pipeline array from starting
> streaming for all entities in path of a stream. This is needed because
> multiple streams can stream, but only one pipeline object is needed.
> 
> Process frames only for those entities in a pipeline which are
> streaming. This is known through their use counts.
> 
> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> ---
>   .../media/test-drivers/vimc/vimc-streamer.c   | 95 ++++++++++++++++---
>   1 file changed, 83 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
> index c1644d69686d..cc40ecabe95a 100644
> --- a/drivers/media/test-drivers/vimc/vimc-streamer.c
> +++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
> @@ -40,33 +40,30 @@ static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
>   }
>   
>   /**
> - * vimc_streamer_pipeline_init - Initializes the stream structure
> + * vimc_streamer_stream_start - Starts streaming for all entities
> + * in a stream
>    *
> - * @stream: the pointer to the stream structure to be initialized
>    * @ved:    the pointer to the vimc entity initializing the stream
>    *
> - * Initializes the stream structure. Walks through the entity graph to
> - * construct the pipeline used later on the streamer thread.
> - * Calls vimc_streamer_s_stream() to enable stream in all entities of
> - * the pipeline.
> + * Walks through the entity graph to call vimc_streamer_s_stream()
> + * to enable stream in all entities in path of a stream.
>    *
>    * Return: 0 if success, error code otherwise.
>    */
> -static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
> -				       struct vimc_ent_device *ved)
> +static int vimc_streamer_stream_start(struct vimc_stream *stream,
> +				      struct vimc_ent_device *ved)
>   {
>   	struct media_entity *entity;
>   	struct video_device *vdev;
>   	struct v4l2_subdev *sd;
> +	int stream_size = 0;
>   	int ret = 0;
>   
> -	stream->pipe_size = 0;
> -	while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
> +	while (stream_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
>   		if (!ved) {
>   			vimc_streamer_pipeline_terminate(stream);
>   			return -EINVAL;
>   		}
> -		stream->ved_pipeline[stream->pipe_size++] = ved;
>   
>   		if (is_media_entity_v4l2_subdev(ved->ent)) {
>   			sd = media_entity_to_v4l2_subdev(ved->ent);
> @@ -104,6 +101,73 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>   					    entity);
>   			ved = video_get_drvdata(vdev);
>   		}
> +		stream_size++;
> +	}
> +
> +	vimc_streamer_pipeline_terminate(stream);
> +	return -EINVAL;
> +}
> +
> +/**
> + * vimc_streamer_pipeline_init - Initialises pipeline and pipe size
> + *
> + * @stream: the pointer to the stream structure
> + * @ved:    the pointer to the vimc entity initializing the stream pipeline
> + *
> + * Walks through the entity graph to initialise ved_pipeline and updates
> + * pipe_size too.
> + *
> + * Return: 0 if success, error code otherwise.
> + */
> +static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
> +				       struct vimc_ent_device *ved)
> +{
> +	struct media_entity *entity;
> +	struct media_device *mdev;
> +	struct media_graph graph;
> +	struct video_device *vdev;
> +	struct v4l2_subdev *sd;
> +	int ret;
> +
> +	entity = ved->ent;
> +	mdev = entity->graph_obj.mdev;
> +
> +	ret = media_graph_walk_init(&graph, mdev);
> +	if (ret)
> +		return ret;
> +
> +	media_graph_walk_start(&graph, entity);
> +
> +	/*
> +	 * Start pipeline array initialisation from RAW Capture only to get
> +	 * entities in the correct order of their frame processing.
> +	 */
> +	if (!strncmp(entity->name, "RGB", 3)) {

I don't understand this condition, way is it good for?

I think the function should be generic and not assume names of entities
or specific topology.


> +		entity = media_graph_walk_next(&graph);
> +		mdev = entity->graph_obj.mdev;
> +		media_graph_walk_cleanup(&graph);
> +
> +		ret = media_graph_walk_init(&graph, mdev);
> +		if (ret)
> +			return ret;
> +		media_graph_walk_start(&graph, entity);
> +	}
> +
> +	while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
> +		if (is_media_entity_v4l2_subdev(entity)) {
> +			sd = media_entity_to_v4l2_subdev(entity);
> +			ved = v4l2_get_subdevdata(sd);
> +		} else {
> +			vdev = container_of(entity, struct video_device, entity);
> +			ved = video_get_drvdata(vdev);
> +		}
> +		stream->ved_pipeline[stream->pipe_size++] = ved;
> +		entity = media_graph_walk_next(&graph);
> +
> +		if (!strcmp(entity->name, stream->ved_pipeline[0]->ent->name)) {

I also don't understand this condition

> +			media_graph_walk_cleanup(&graph);
> +			return 0;
> +		}
>   	}

It is not clear what this function does, it looks like it adds to 'ved_pipeline'
all entities that are connected to the video node, in addition to the entities
that where there from previous calls, so some entities appear several times.

I think there is no need to use the graph walk here but to access the source entity
in each iteration, the way done in vimc_streamer_stream_start
also.
I think the code should iterate here until it reaches an entity that is already streaming,
this means that the entity is already in the `ved_pipeline`, also you should make sure
that the sensor is the first entity that process a frame, therefore the sensor should be
at the end/start of the list of entities. Generally each entity should appear exactly once
in the 'ved_pipeline' array and the entities should be ordered such that when calling 'process_frame'
on one entity should be after calling 'process_frame' on its source entity.
maybe it is easyer to implement if 'ved_pipeline' is a linked list.

Thanks,
Dafna

>   
>   	vimc_streamer_pipeline_terminate(stream);
> @@ -138,8 +202,11 @@ static int vimc_streamer_thread(void *data)
>   
>   		for (i = stream->pipe_size - 1; i >= 0; i--) {
>   			ved = stream->ved_pipeline[i];
> -			ret = ved->process_frame(ved);
>   
> +			if (atomic_read(&ved->use_count) == 0)
> +				continue;
> +
> +			ret = ved->process_frame(ved);
>   			if (ret)
>   				break;
>   		}
> @@ -179,6 +246,10 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
>   		if (stream->kthread)
>   			return 0;
>   
> +		ret = vimc_streamer_stream_start(stream, ved);
> +		if (ret)
> +			return ret;
> +
>   		ret = vimc_streamer_pipeline_init(stream, ved);
>   		if (ret)
>   			return ret;
> 
