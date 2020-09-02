Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9CA25A8FD
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 11:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgIBJ4z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 05:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgIBJ4z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 05:56:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE00BC061244;
        Wed,  2 Sep 2020 02:56:54 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6947B9CC;
        Wed,  2 Sep 2020 11:56:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599040611;
        bh=5XdTleSlo5fDp/4fIAvShbXcIJMbvnb+7bQA75IkzBs=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ktz3hBVwmMhGVPCIoKLfNxn73NZNLpAywHBbIa4veQto9zyqiCkNYruRJo4bIlU67
         /dW2w0Cpqz21FXyKML211w1QtRJqKh0adJTL/tqyyZsUXZfsGTxf0jqVDeTUFu5uya
         gpJWTg42lLZVoCStw/sxl9oW68Bta8uymKte5nx8=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 4/9] media: vimc: Separate starting stream from
 pipeline initialisation
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Kaaira Gupta <kgupta@es.iitr.ac.in>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
 <20200819180442.11630-5-kgupta@es.iitr.ac.in>
 <eb5d4259-fe77-b4f2-1e62-0f846420b7c2@collabora.com>
 <20200821210123.GA28410@kaaira-HP-Pavilion-Notebook>
 <b3e20f32-64b9-778b-fa2f-f17b0c1bcc72@collabora.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <00896ada-3ef7-a1b5-ab7b-fe8a41fc4881@ideasonboard.com>
Date:   Wed, 2 Sep 2020 10:56:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b3e20f32-64b9-778b-fa2f-f17b0c1bcc72@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kaaira, Dafna,

On 28/08/2020 21:37, Dafna Hirschfeld wrote:
> Hi,
> 
> Am 21.08.20 um 23:01 schrieb Kaaira Gupta:
>> Hi,
>>
>> On Fri, Aug 21, 2020 at 05:11:23PM +0200, Dafna Hirschfeld wrote:
>>>
>>>
>>> Am 19.08.20 um 20:04 schrieb Kaaira Gupta:
>>>> Separate the process of initialising pipeline array from starting
>>>> streaming for all entities in path of a stream. This is needed because
>>>> multiple streams can stream, but only one pipeline object is needed.
>>>>
>>>> Process frames only for those entities in a pipeline which are
>>>> streaming. This is known through their use counts.
>>>>
>>>> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
>>>> ---
>>>>    .../media/test-drivers/vimc/vimc-streamer.c   | 95
>>>> ++++++++++++++++---
>>>>    1 file changed, 83 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c
>>>> b/drivers/media/test-drivers/vimc/vimc-streamer.c
>>>> index c1644d69686d..cc40ecabe95a 100644
>>>> --- a/drivers/media/test-drivers/vimc/vimc-streamer.c
>>>> +++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
>>>> @@ -40,33 +40,30 @@ static void
>>>> vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
>>>>    }
>>>>    /**
>>>> - * vimc_streamer_pipeline_init - Initializes the stream structure
>>>> + * vimc_streamer_stream_start - Starts streaming for all entities
>>>> + * in a stream
>>>>     *
>>>> - * @stream: the pointer to the stream structure to be initialized
>>>>     * @ved:    the pointer to the vimc entity initializing the stream
>>>>     *
>>>> - * Initializes the stream structure. Walks through the entity graph to
>>>> - * construct the pipeline used later on the streamer thread.
>>>> - * Calls vimc_streamer_s_stream() to enable stream in all entities of
>>>> - * the pipeline.
>>>> + * Walks through the entity graph to call vimc_streamer_s_stream()
>>>> + * to enable stream in all entities in path of a stream.
>>>>     *
>>>>     * Return: 0 if success, error code otherwise.
>>>>     */
>>>> -static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>>>> -                       struct vimc_ent_device *ved)
>>>> +static int vimc_streamer_stream_start(struct vimc_stream *stream,
>>>> +                      struct vimc_ent_device *ved)
>>>>    {
>>>>        struct media_entity *entity;
>>>>        struct video_device *vdev;
>>>>        struct v4l2_subdev *sd;
>>>> +    int stream_size = 0;
>>>>        int ret = 0;
>>>> -    stream->pipe_size = 0;
>>>> -    while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
>>>> +    while (stream_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
>>>>            if (!ved) {
>>>>                vimc_streamer_pipeline_terminate(stream);
>>>>                return -EINVAL;
>>>>            }
>>>> -        stream->ved_pipeline[stream->pipe_size++] = ved;
>>>>            if (is_media_entity_v4l2_subdev(ved->ent)) {
>>>>                sd = media_entity_to_v4l2_subdev(ved->ent);
>>>> @@ -104,6 +101,73 @@ static int vimc_streamer_pipeline_init(struct
>>>> vimc_stream *stream,
>>>>                            entity);
>>>>                ved = video_get_drvdata(vdev);
>>>>            }
>>>> +        stream_size++;
>>>> +    }
>>>> +
>>>> +    vimc_streamer_pipeline_terminate(stream);
>>>> +    return -EINVAL;
>>>> +}
>>>> +
>>>> +/**
>>>> + * vimc_streamer_pipeline_init - Initialises pipeline and pipe size
>>>> + *
>>>> + * @stream: the pointer to the stream structure
>>>> + * @ved:    the pointer to the vimc entity initializing the stream
>>>> pipeline

Which entity is this? Is it the start, or the end of the pipeline? I.e.
the sensor? or the capture ?

>>>> + *
>>>> + * Walks through the entity graph to initialise ved_pipeline and
>>>> updates
>>>> + * pipe_size too.
>>>> + *
>>>> + * Return: 0 if success, error code otherwise.
>>>> + */
>>>> +static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>>>> +                       struct vimc_ent_device *ved)
>>>> +{
>>>> +    struct media_entity *entity;
>>>> +    struct media_device *mdev;
>>>> +    struct media_graph graph;
>>>> +    struct video_device *vdev;
>>>> +    struct v4l2_subdev *sd;
>>>> +    int ret;
>>>> +
>>>> +    entity = ved->ent;
>>>> +    mdev = entity->graph_obj.mdev;
>>>> +
>>>> +    ret = media_graph_walk_init(&graph, mdev);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    media_graph_walk_start(&graph, entity);
>>>> +
>>>> +    /*
>>>> +     * Start pipeline array initialisation from RAW Capture only to
>>>> get
>>>> +     * entities in the correct order of their frame processing.
>>>> +     */
>>>> +    if (!strncmp(entity->name, "RGB", 3)) {
>>>
>>> I don't understand this condition, way is it good for?
>>
>> I have explained that later in the reply

Matching on entity names is a bit awkward, as they could be changed I
guess quite easily, and easily missed in this string matching.

I haven't fully understood this code block yet to work out if there's
another way we could do this though, but reading ahead I see there might
be a way to 'walk the graph' on a per-stream basis which might be a good
way of factoring this path.

Although there still needs to be a construction of the paths available
to a stream which splits from the sensor.


>>
>>>
>>> I think the function should be generic and not assume names of entities
>>> or specific topology.
>>
>> It doesn't assume the topology, rather it is in place just to make sure
>> that the entities in ved_pipeline are in correct order.
>>
>>>
>>>
>>>> +        entity = media_graph_walk_next(&graph);
>>>> +        mdev = entity->graph_obj.mdev;
>>>> +        media_graph_walk_cleanup(&graph);
>>>> +
>>>> +        ret = media_graph_walk_init(&graph, mdev);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +        media_graph_walk_start(&graph, entity);
> 
> Hi, can you explain what this code does?
> Why does it start the search in the next entity?
> 
>>>> +    }
>>>> +
>>>> +    while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
>>>> +        if (is_media_entity_v4l2_subdev(entity)) {
>>>> +            sd = media_entity_to_v4l2_subdev(entity);
>>>> +            ved = v4l2_get_subdevdata(sd);
>>>> +        } else {
>>>> +            vdev = container_of(entity, struct video_device, entity);
>>>> +            ved = video_get_drvdata(vdev);
>>>> +        }
>>>> +        stream->ved_pipeline[stream->pipe_size++] = ved;
>>>> +        entity = media_graph_walk_next(&graph);
>>>> +
>>>> +        if (!strcmp(entity->name,
>>>> stream->ved_pipeline[0]->ent->name)) {
>>>
>>> I also don't understand this condition
>>>
>>>> +            media_graph_walk_cleanup(&graph);
>>>> +            return 0;
>>>> +        }
>>>>        }
>>>
>>> It is not clear what this function does, it looks like it adds to
>>> 'ved_pipeline'
>>> all entities that are connected to the video node, in addition to the
>>> entities
>>> that where there from previous calls, so some entities appear several
>>> times.
>>
>> This function returns all the entities in a pipe, weather they are
>> streaming or not. For example, if only the RAW Capture 1 streams, or
>> RGB/YUB capture streams, or both stream..in all three cases ved_pipeline
>> will have the same entities, in exactly same order, and all will occur
>> just once.
>> Since media_graph_walk goes to each node of the graph, it returns back
>> to the first one (as its a graph), hence the last condition, ie,
>>
>>     if (!strcmp(entity->name, stream->ved_pipeline[0]->ent->name)) {
>>
>> makes sure that the first entity is not added again to the array.
>>
>> First condition, ie
>>
>>     if (!strncmp(entity->name, "RGB", 3)) {
>>
>> Just makes sure that the search starts at RGB capture only. This is
>> because, in case of any other video node, the order of entities, as you
>> have mentioned later in the mail, will not be desirable, ie it won't
>> start at sensor and end at captures. So this condition just takes care
>> that all the entities in ved_pipeline array are in correct order
>> (starting at sensor, ending at captures).
> 
> It is better to compare to the whole name of the entity to make it more
> clear.
> Also I think it is better to document that this function is called only
> upon the
> first streaming node.

If this doesn't end up refactored with other helpers, then indeed a few
comments might help the readabilty here. The distinctions of each
re-initialisation of the graph walk are hard to interpret the purpose.



> 
> I still think this function should be independent of the topology.
> Maybe you can use Helen's patch that allow walking a graph only opposite
> to the link direction: https://patchwork.kernel.org/patch/11564899/
> This ensures that the Sensor will be first in the graph walk. Then the
> streaming thread
> iterates the ved_pipeline from 0 upwards and not from 'pipe_size'
> downwards.

Being able to use a direct helper to walk the pipeline cleanly sounds
promising indeed.

I suspect at some point int he next patches though - I'm going to see
something that needs to have full visibility of all paths enabled from
the sensor, as I think I recall that the thread will then process all
(enabled) entities in a single pass.
--
Kieran


> 
> Thanks,
> Dafna
> 
> 
> 
>>
>> Thanks,
>> Kaaira
>>
>>>
>>> I think there is no need to use the graph walk here but to access the
>>> source entity
>>> in each iteration, the way done in vimc_streamer_stream_start
>>> also.
>>> I think the code should iterate here until it reaches an entity that
>>> is already streaming,
>>> this means that the entity is already in the `ved_pipeline`, also you
>>> should make sure
>>> that the sensor is the first entity that process a frame, therefore
>>> the sensor should be
>>> at the end/start of the list of entities. Generally each entity
>>> should appear exactly once
>>> in the 'ved_pipeline' array and the entities should be ordered such
>>> that when calling 'process_frame'
>>> on one entity should be after calling 'process_frame' on its source
>>> entity.
>>> maybe it is easyer to implement if 'ved_pipeline' is a linked list.
>>>
>>> Thanks,
>>> Dafna
>>>
>>>>        vimc_streamer_pipeline_terminate(stream);
>>>> @@ -138,8 +202,11 @@ static int vimc_streamer_thread(void *data)
>>>>            for (i = stream->pipe_size - 1; i >= 0; i--) {
>>>>                ved = stream->ved_pipeline[i];
>>>> -            ret = ved->process_frame(ved);
>>>> +            if (atomic_read(&ved->use_count) == 0)
>>>> +                continue;
>>>> +
>>>> +            ret = ved->process_frame(ved);
>>>>                if (ret)
>>>>                    break;
>>>>            }
>>>> @@ -179,6 +246,10 @@ int vimc_streamer_s_stream(struct vimc_stream
>>>> *stream,
>>>>            if (stream->kthread)
>>>>                return 0;
>>>> +        ret = vimc_streamer_stream_start(stream, ved);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +
>>>>            ret = vimc_streamer_pipeline_init(stream, ved);
>>>>            if (ret)
>>>>                return ret;
>>>>

-- 
Regards
--
Kieran
