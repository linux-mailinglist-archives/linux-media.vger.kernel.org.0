Return-Path: <linux-media+bounces-37589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CF1B03744
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 08:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5541418988E6
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 06:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F5C226863;
	Mon, 14 Jul 2025 06:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K3hOuZwU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEAA214811;
	Mon, 14 Jul 2025 06:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752475078; cv=none; b=LUWMvooky5mvwLxoBIo5ap9ByODcIjOnfaQtghLa3RjWjyOLwo9YWzGazCKJwOok6GVSuS66gboUCwHZrt20J3q22Y+/zSGEJOI5kQjBXZMSgP+ZovDpVkC6e00u9ftdiHdhI6vaHxf1EcFCQIdz7e1un6Ju5TRUFsmDGv0tOaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752475078; c=relaxed/simple;
	bh=k8eumjXWtaL+P7x6V4qanMlZfpqr02RRBQ2lMTG3PqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFC45EzYYUQMUtOCts/YDEvtrrwApMA5oZnGRzrGyCrFl0PBbr5YDK4O14w/QRNYemm+3rpwhVQalKgGSRieCdrJsP0/wFe6I4NY0ek7zkYRLc2M3G5UYejXJjYRk6nn/TtfEkFTWz+yX7Q+lY4HexcK1aXL8zVfWaToor8MG5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K3hOuZwU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F0271127;
	Mon, 14 Jul 2025 08:37:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752475042;
	bh=k8eumjXWtaL+P7x6V4qanMlZfpqr02RRBQ2lMTG3PqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K3hOuZwUo+1xAeClaoO/xZEnTR5U8+F23uiVOSiqHfTfyoSh/eCLB3O/h9jGopbKH
	 AkTTGgA7V8yqZQuFFXYy6jwXr8pV7IKYBE00JmcjXlZ9N7sMGESOTgTHsoKhxv+KwV
	 5wc56fZCUjyiw+wVYG144Hjabt//2rsIE9uQOs6w=
Message-ID: <dbc0c7a5-b307-49de-a31d-a50ec462d2fd@ideasonboard.com>
Date: Mon, 14 Jul 2025 07:37:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] media: v4l2-dev: Add helpers to run
 media_pipeline_[started|stopped]()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 biju.das.jz@bp.renesas.com
References: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
 <20250704-ivc-v3-2-5c45d936ef2e@ideasonboard.com>
 <v3gonywym2km6u4qpsm2bkpn5n7vmvm4rdt3nfiws6mri3b7y4@gh4q5f4cmavc>
 <436bbb33-0740-4ef8-8297-a06aa8243cfd@ideasonboard.com>
 <54c94bcf-9b68-4fe7-a84d-fed665b362a3@ideasonboard.com>
 <hb73r4nu2n3ganodzpbpg2tn7c45ye2otzzc4une2x3tskuba7@dgfc2wf4vprh>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <hb73r4nu2n3ganodzpbpg2tn7c45ye2otzzc4une2x3tskuba7@dgfc2wf4vprh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jacopo

On 11/07/2025 14:39, Jacopo Mondi wrote:
> Hi Dan
>
> On Fri, Jul 11, 2025 at 01:43:16PM +0100, Dan Scally wrote:
>> On 11/07/2025 12:51, Dan Scally wrote:
>>> Hi Jacopo - thanks for the comments
>>>
>>> On 08/07/2025 14:10, Jacopo Mondi wrote:
>>>> Hi Dan
>>>>
>>>> On Fri, Jul 04, 2025 at 12:20:19PM +0100, Daniel Scally wrote:
>>>>> Add helpers to run the new media_pipeline_started() and
>>>>> media_pipeline_stopped() functions. The helpers iterate over the
>>>>> entities in the pipeline and count the number of video devices and
>>>>> compare that to the pipeline's start_count() before acting. This
>>>>> allows us to only run the media pipeline callbacks in the event that
>>>>> the pipeline has had video_pipeline_start() called for each video
>>>>> device.
>>>>>
>>>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>>>
>>>>> ---
>>>>>
>>>>> We could take this further perhaps and include the equivalent routine
>>>>> in video_device_pipeline[_alloc]_start()...if none of the entities
>>>>> involved have .pipeline_started() or .pipeline_stopped() operations it
>>>>> should be harmless, but I'm a bit reluctant to force the choice to run
>>>>> those operations on users.
>>>> I know I've kind of suggested that, but after all I don't think it's a
>>>> very good idea, having this in two steps is probably better. And I
>>>> like the fact the v4l2-dev layer operates on the video device counting
>>>> and only relies on the mc layer for the callbacks notification.
>>>
>>> Yeah me too. Let's stick to this
>>>
>>>>> Changes in v2:
>>>>>
>>>>>      - Adapted now media_pipeline_for_each_entity() takes an iter
>>>>>        variable
>>>>>      - Fixed the Return: section of the kerneldoc comments
>>>>> ---
>>>>>    drivers/media/v4l2-core/v4l2-dev.c | 57 ++++++++++++++++++++++++++++++++++++++
>>>>>    include/media/v4l2-dev.h           | 36 ++++++++++++++++++++++++
>>>>>    2 files changed, 93 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>>>>> index c369235113d98ae26c30a1aa386e7d60d541a66e..f3309f8349664f7296a95216a40dd9d9baae8d9e 100644
>>>>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>>>>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>>>>> @@ -1200,6 +1200,63 @@ struct media_pipeline *video_device_pipeline(struct video_device *vdev)
>>>>>    }
>>>>>    EXPORT_SYMBOL_GPL(video_device_pipeline);
>>>>>
>>>>> +static int __video_device_pipeline_started(struct media_pipeline *pipe)
>>>> __function_name() is usually reserved for the non-locking version of
>>>> function_name().
>>>>
>>>> This seems to be an helper only used internally by
>>>> video_device_pipeline_started() so I would use a different name
>>>> something like video_device_has_pipeline_started() ?
>>>
>>> What it does is count the number of _unstarted_ video
>>> devices..."video_device_pipeline_unstarted_vdevs()"?
>>>
>>>>
>>>>> +{
>>>>> +    struct media_pipeline_entity_iter iter;
>>>>> +    unsigned int n_video_devices = 0;
>>>>> +    struct media_entity *entity;
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = media_pipeline_entity_iter_init(pipe, &iter);
>>>>> +    if (ret)
>>>>> +        return ret;
>>>>> +
>>>>> +    media_pipeline_for_each_entity(pipe, &iter, entity) {
>>>>> +        if (entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
>>>>> +            n_video_devices++;
>>>>> +    }
>>>>> +
>>>>> +    media_pipeline_entity_iter_cleanup(&iter);
>>>>> +
>>>>> +    return n_video_devices - pipe->start_count;
>>>>> +}
>>>>> +
>>>>> +int video_device_pipeline_started(struct video_device *vdev)
>>>>> +{
>>>>> +    struct media_pipeline *pipe;
>>>>> +    int ret;
>>>>> +
>>>>> +    pipe = video_device_pipeline(vdev);
>>>>> +    if (!pipe)
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    ret = __video_device_pipeline_started(pipe);
>>>>> +    if (ret)
>>>>> +        return ret;
>>>> I would not return ret, as it might take random values betwen
>>>> n_video_devices and 1. See below on the return value documentation
>>> But we need to be able to signal to the driver three states:
>>>
>>>
>>> 1. No errors, but there are still unstarted video devices
>>>
>>> 2. No errors and there are no unstarted video devices
>>>
>>> 3. An error
>>>
>>>
>>> So I expect a driver to do a two stage check:
>>>
>>>
>>> ret = video_device_pipeline_started(vdev);
>>>
>>> if (ret < 0)
>>>
>>>          goto err_out;
>>>
>>> if (ret == 0)
>>>
>>>          // something appropriate here like run the media jobs scheduler
>>>
>> Sorry: I had a reading comprehension failure. You were suggesting to use
>> -ENODEV to signal that there are unstarted video devices remaining. I
>> understand now, but I'm still not sure about it, because then instead of the
>> "if (ret == 0) check here we'd have "if (ret == -ENODEV)", which I don't
>> especially like...or am I missing some way to avoid having that check here?
> Yes, that would require drivers to check for -ENODEV to identify a
> non-failure case when not all devices have started..
>
> You're right it might not be optimal. With you implementation we
> should then have
>
>   0: success
>   < 0: error
>   > 0: not all devices started
>
> ?
Yes
>
> I might be actually ok with this, but could you please document it as
> I've below suggested for clarity ?
Yep, will do
>
> Thanks
>    j
>
>>
>> Thanks
>>
>> Dan
>>
>>>>> +
>>>>> +    return media_pipeline_started(pipe);
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(video_device_pipeline_started);
>>>>> +
>>>>> +int video_device_pipeline_stopped(struct video_device *vdev)
>>>>> +{
>>>>> +    struct media_pipeline *pipe;
>>>>> +    int ret;
>>>>> +
>>>>> +    pipe = video_device_pipeline(vdev);
>>>>> +    if (!pipe)
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    ret = __video_device_pipeline_started(pipe);
>>>>> +    if (ret)
>>>>> +        return ret;
>>>> ditto
>>>>
>>>>> +
>>>>> +    media_pipeline_stopped(pipe);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(video_device_pipeline_stopped);
>>>>> +
>>>>>    #endif /* CONFIG_MEDIA_CONTROLLER */
>>>>>
>>>>>    /*
>>>>> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
>>>>> index 1b6222fab24eda96cbe459b435431c01f7259366..26b4a491024701ef47320aec6a1a680149ba4fc3 100644
>>>>> --- a/include/media/v4l2-dev.h
>>>>> +++ b/include/media/v4l2-dev.h
>>>>> @@ -654,6 +654,42 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
>>>>>     */
>>>>>    struct media_pipeline *video_device_pipeline(struct video_device *vdev);
>>>>>
>>>>> +/**
>>>>> + * video_device_pipeline_started - Run the pipeline_started() entity operation
>>>>> + *                   for a fully-started media pipeline
>>>>> + * @vdev: A video device that's part of the pipeline
>>>>> + *
>>>>> + * This function checks whether all MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
>>>>> + * connected to a given video device through enabled links have been marked as
>>>> I would use the same text as the one from video_device_pipeline_start()
>>>>
>>>> " connected to a given video device through enabled links, either
>>>> directly or indirectly,"
>>>
>>> Ack
>>>
>>>>> + * streaming through the use of video_device_pipeline_start() or one of its
>>>>> + * equivalent functions. If so, media_pipeline_started() is called to inform
>>>>> + * entities in the pipeline of that fact. The intention is to provide drivers
>>>>> + * with a shortcut for checking whether their pipeline is fully ready to start
>>>>> + * processing data.
>>>> Not really a shortcut, I would use "mechanism" instead.
>>>>
>>>> I would also specify that:
>>>>
>>>>    * entities in the pipeline of that fact. The intention is to provide drivers
>>>>    * with a mechanism for checking whether their pipeline is fully ready to start
>>>>    * processing data and call the .pipeline_started() media entity operation
>>>>    * on all the entities in the pipeline.
>>> Ack!
>>>>> + *
>>>>> + * Return: The number of video devices in the pipeline remaining to be started,
>>>>> + * or a negative error number on failure.
>>>> 0 for success as well
>>>>
>>>> I would anyway return 0 for success and a specific error code for the
>>>> three failure cases:
>>>> -ENOMEM if allocating the iterator fails
>>>> -ENODEV if not all video devices have started
>>>> -EINVAL if media_pipeline_started() fails
>>>>
>>>> You can document them as (copying from iommu.h)
>>>>
>>>> * Return:
>>>> * * 0            - success
>>>> * * EINVAL       - call to pipeline_started() failed
>>>> * * ENOMEM       - failed to allocate pipe iterator
>>>> * * ENODEV       - pipeline not yet fully started
>>>>
>>>>> + */
>>>>> +int video_device_pipeline_started(struct video_device *vdev);
>>>>> +
>>>>> +/**
>>>>> + * video_device_pipeline_stopped - Run the pipeline_stopped() entity operation
>>>>> + *                   for a fully-started media pipeline
>>>>> + * @vdev: A video device that's part of the pipeline
>>>>> + *
>>>>> + * This function checks whether all MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
>>>>> + * connected to a given video device through enabled links have been marked as
>>>>> + * streaming through the use of video_device_pipeline_start() or one of its
>>>> What is the intended semantic here ? The first video device to receive
>>>> a streamoff() will trigger media_pipeline_stopped() or should the last
>>>> one do that ?
>>> The first one should do it, so the first device caling stop should
>>> trigger actual stop in all involved hardware.
>>>>> + * equivalent functions. If so, media_pipeline_stopped() is called for each
>>>>> + * entity in the pipeline. The intention is to provide drivers with a shortcut
>>>>> + * for checking whether this video device is the first device in the pipeline
>>>>> + * to be stopped.
>>>>> + *
>>>>> + * Return: The number of video devices in the pipeline remaining to be started, or a
>>>>> + * negative error number on failure.
>>>>> + */
>>>>> +int video_device_pipeline_stopped(struct video_device *vdev);
>>>>> +
>>>>>    #endif /* CONFIG_MEDIA_CONTROLLER */
>>>>>
>>>>>    #endif /* _V4L2_DEV_H */
>>>>>
>>>>> --
>>>>> 2.34.1
>>>>>
>>>>>

