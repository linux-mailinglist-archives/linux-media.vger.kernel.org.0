Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 222145A6140
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 12:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbiH3K7I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 06:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiH3K7G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 06:59:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E1C9DFAA
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 03:59:05 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB2A325B;
        Tue, 30 Aug 2022 12:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661857142;
        bh=BYYKlEuL7yiijO+7aI8+q9PpYCR42IyR2Jir7quLock=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZyFKd9VD08C7J8X8z9rBD9mCdsb1tu0LJQgHvKs9tDpquL8P0plZB5lVyIGxrHaEo
         3sEXrhzKsXO5i664WMA1RON4/voJk1MuE532cHvfWTbd4QV8nQNDNAHGH0PfUo1qEy
         /718GMGgcbQfzkUl6i4o/oEHQzDE/uTVvcilqu2w=
Message-ID: <f7d61c5c-c7ff-e86c-32bb-1da22aa3a5d2@ideasonboard.com>
Date:   Tue, 30 Aug 2022 13:58:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v13 09/34] media: v4l2-dev: Add videodev wrappers for
 media pipelines
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
 <20220810121122.3149086-10-tomi.valkeinen@ideasonboard.com>
 <YwzqhxmPp9WXvJ2i@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YwzqhxmPp9WXvJ2i@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/08/2022 19:34, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Wed, Aug 10, 2022 at 03:10:57PM +0300, Tomi Valkeinen wrote:
>> With the upcoming stream related improvements to the pipelines, the
>> pipelines are moved from media entities to media pads. As the drivers
>> currently use the pipelines with the entity based model, moving the
>> pipelines to pads will cause changes to the drivers.
>>
>> However, most of the uses of media pipelines are related to a video
>> device (a DMA engine) with a single pad, and thus there's never a need
>> to support multiple pads in these use cases. We can avoid pushing the
>> complexities of the pad based model to the drivers by adding video
>> device wrappers for the pipeline related functions.
>>
>> This patch adds a number of wrappers to media_pipeline functions, all of
>> which take a video_device as a parameter (instead of a media_entity),
>> and verify that there's just one pad.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-dev.c | 61 ++++++++++++++++++++
>>   include/media/v4l2-dev.h           | 90 ++++++++++++++++++++++++++++++
>>   2 files changed, 151 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index d00237ee4cae..7f933ff89fd4 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -1095,6 +1095,67 @@ void video_unregister_device(struct video_device *vdev)
>>   }
>>   EXPORT_SYMBOL(video_unregister_device);
>>   
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +
>> +__must_check int video_device_pipeline_start(struct video_device *vdev,
>> +					     struct media_pipeline *pipe)
>> +{
>> +	struct media_entity *entity = &vdev->entity;
>> +
>> +	if (entity->num_pads != 1)
>> +		return -ENODEV;
>> +
>> +	return media_pipeline_start(entity, pipe);
>> +}
>> +EXPORT_SYMBOL_GPL(video_device_pipeline_start);
>> +
>> +__must_check int __video_device_pipeline_start(struct video_device *vdev,
>> +					       struct media_pipeline *pipe)
>> +{
>> +	struct media_entity *entity = &vdev->entity;
>> +
>> +	if (entity->num_pads != 1)
>> +		return -ENODEV;
>> +
>> +	return __media_pipeline_start(entity, pipe);
>> +}
>> +EXPORT_SYMBOL_GPL(__video_device_pipeline_start);
>> +
>> +void video_device_pipeline_stop(struct video_device *vdev)
>> +{
>> +	struct media_entity *entity = &vdev->entity;
>> +
>> +	if (WARN_ON(entity->num_pads != 1))
>> +		return;
>> +
>> +	return media_pipeline_stop(entity);
>> +}
>> +EXPORT_SYMBOL_GPL(video_device_pipeline_stop);
>> +
>> +void __video_device_pipeline_stop(struct video_device *vdev)
>> +{
>> +	struct media_entity *entity = &vdev->entity;
>> +
>> +	if (WARN_ON(entity->num_pads != 1))
>> +		return;
>> +
>> +	return __media_pipeline_stop(entity);
>> +}
>> +EXPORT_SYMBOL_GPL(__video_device_pipeline_stop);
>> +
>> +struct media_pipeline *video_device_pipeline(struct video_device *vdev)
>> +{
>> +	struct media_entity *entity = &vdev->entity;
>> +
>> +	if (WARN_ON(entity->num_pads != 1))
>> +		return NULL;
>> +
>> +	return media_entity_pipeline(entity);
>> +}
>> +EXPORT_SYMBOL_GPL(video_device_pipeline);
>> +
>> +#endif /* CONFIG_MEDIA_CONTROLLER */
>> +
>>   /*
>>    *	Initialise video for linux
>>    */
>> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
>> index 5cf1edefb822..4ccc24f5918a 100644
>> --- a/include/media/v4l2-dev.h
>> +++ b/include/media/v4l2-dev.h
>> @@ -539,4 +539,94 @@ static inline int video_is_registered(struct video_device *vdev)
>>   	return test_bit(V4L2_FL_REGISTERED, &vdev->flags);
>>   }
>>   
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +
>> +/**
>> + * video_device_pipeline_start - Mark a pipeline as streaming
>> + * @vdev: Starting video device
>> + * @pipe: Media pipeline to be assigned to all entities in the pipeline.
>> + *
>> + * Mark all entities connected to a given video device through enabled links,
>> + * either directly or indirectly, as streaming. The given pipeline object is
>> + * assigned to every entity in the pipeline and stored in the media_entity pipe
>> + * field.
>> + *
>> + * Calls to this function can be nested, in which case the same number of
>> + * video_device_pipeline_stop() calls will be required to stop streaming. The
>> + * pipeline pointer must be identical for all nested calls to
>> + * video_device_pipeline_start().
>> + *
>> + * The video device must contain a single pad.
>> + *
>> + * This is a convenience wrapper to media_pipeline_start().
> 
> s/wrapper to/wrapper around/ maybe. Same below.

Sounds good to me.

>> + */
>> +__must_check int video_device_pipeline_start(struct video_device *vdev,
>> +					     struct media_pipeline *pipe);
>> +
>> +/**
>> + * __video_device_pipeline_start - Mark a pipeline as streaming
>> + *
> 
> I'd drop the blank line as you don't have one for the previous function.
> Same for stop.

Yep.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!
