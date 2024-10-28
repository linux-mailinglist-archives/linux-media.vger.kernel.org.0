Return-Path: <linux-media+bounces-20414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 036779B2EA3
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 12:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8845B1F210AF
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 11:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4B41DD525;
	Mon, 28 Oct 2024 11:14:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A091D5178;
	Mon, 28 Oct 2024 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730114045; cv=none; b=rkt8XmHex9CRGzORd0geJEjtQM/EZ5pAyuoMxBVh+X7Qx7glZk+h6ViaGrYPoTsSlBbBwvJjoAgR2YvWl5+k1IthzP6A2Iw3cBBh/r68OZHSB8djnrAf/BtPXURgKY/xjYkDoNV6pG+b084j3Lwlcd0xvmi9/oqoE9KzT5fqXfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730114045; c=relaxed/simple;
	bh=0UeKvMsrf/SXwRn2uzgRN1fRcnZFgFNpYv/zq/PNjsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oe+gp4MonXx31htXZOGsERyUHD9U5wut9IBpKBnc5pzC0WiLhLsNXqp+sJu82L+/ycaqG0brl8L/LcYoT//ilbkxkRVsFf3IAn4oYMSur7++8zizMw6hoRlKsLQg7sx4SRPlgAy4FWUaqk5epGgwO5vXSWYaqEm8teta/L+gTPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04399C4CEC3;
	Mon, 28 Oct 2024 11:14:00 +0000 (UTC)
Message-ID: <59cf95be-fb53-4a94-bc6e-f9dca322749d@xs4all.nl>
Date: Mon, 28 Oct 2024 12:13:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] media: raspberrypi: Add support for RP1-CFE
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Naushir Patuck
 <naush@raspberrypi.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20241003-rp1-cfe-v6-0-d6762edd98a8@ideasonboard.com>
 <20241003-rp1-cfe-v6-3-d6762edd98a8@ideasonboard.com>
 <4d9e340e-2ae7-495b-8623-0d10398e1c3d@xs4all.nl>
 <02f05b61-08e7-45f8-8d59-f79bc20d076f@ideasonboard.com>
 <74286a86-51b9-4742-bb0c-583d70b1b0a7@xs4all.nl>
 <505c502e-b67a-4dca-8420-eb87eae4e170@ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <505c502e-b67a-4dca-8420-eb87eae4e170@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/10/2024 12:05, Tomi Valkeinen wrote:
> Hi Hans,
> 
> On 28/10/2024 12:11, Hans Verkuil wrote:
>> On 28/10/2024 10:21, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 24/10/2024 11:20, Hans Verkuil wrote:
>>>> Hi Tomi,
>>>>
>>>> I know this driver is already merged, but while checking for drivers that use
>>>> q->max_num_buffers I stumbled on this cfe code:
>>>>
>>>> <snip>
>>>>
>>>>> +/*
>>>>> + * vb2 ops
>>>>> + */
>>>>> +
>>>>> +static int cfe_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>>>>> +               unsigned int *nplanes, unsigned int sizes[],
>>>>> +               struct device *alloc_devs[])
>>>>> +{
>>>>> +    struct cfe_node *node = vb2_get_drv_priv(vq);
>>>>> +    struct cfe_device *cfe = node->cfe;
>>>>> +    unsigned int size = is_image_node(node) ?
>>>>> +                    node->vid_fmt.fmt.pix.sizeimage :
>>>>> +                    node->meta_fmt.fmt.meta.buffersize;
>>>>> +
>>>>> +    cfe_dbg(cfe, "%s: [%s] type:%u\n", __func__, node_desc[node->id].name,
>>>>> +        node->buffer_queue.type);
>>>>> +
>>>>> +    if (vq->max_num_buffers + *nbuffers < 3)
>>>>> +        *nbuffers = 3 - vq->max_num_buffers;
>>>>
>>>> This makes no sense: max_num_buffers is 32, unless explicitly set when vb2_queue_init
>>>> is called. So 32 + *nbuffers is never < 3.
>>>>
>>>> If the idea is that at least 3 buffers should be allocated by REQBUFS, then set
>>>> q->min_reqbufs_allocation = 3; before calling vb2_queue_init and vb2 will handle this
>>>> for you.
>>>>
>>>> Drivers shouldn't modify *nbuffers, except in very rare circumstances, especially
>>>> since the code is almost always wrong.
>>>
>>> Looking at this, the original code in the old BSP tree was, which somehow, along the long way, got turned into the above:
>>>
>>> if (vq->num_buffers + *nbuffers < 3)
>>>          *nbuffers = 3 - vq->num_buffers;
>>>
>>> So... I think that is the same as "q->min_reqbufs_allocation = 3"?
>>>
>>> The distinction between min_queued_buffers and min_reqbufs_allocation, or rather the need for the latter, still escapes me. If the HW/SW requires N buffers to be queued, why would we require
>>> allocating more than N buffers?
>>
>> min_queued_buffers is easiest to explain: that represents the requirements of the DMA
>> engine, i.e. how many buffers much be queued before the DMA engine can be started.
>> Typically it is 0, 1 or 2.
>>
>> min_reqbufs_allocation is the minimum number of buffers that will be allocated when
>> calling VIDIOC_REQBUFS in order for userspace to be able to stream without blocking
>> or dropping frames.
>>
>> Typically this is 3 for video capture: one buffer is being DMAed, another is queued up
>> and the third is being processed by userspace. But sometimes drivers have other
>> requirements.
>>
>> The reason is that some applications will just call VIDIOC_REQBUFS with count=1 and
>> expect it to be rounded up to whatever makes sense. See the VIDIOC_REQBUFS doc in
>> https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/vidioc-reqbufs.html
>>
>> "It can be smaller than the number requested, even zero, when the driver runs out of
>>   free memory. A larger number is also possible when the driver requires more buffers
>>   to function correctly."
>>
>> How drivers implement this is a mess, and usually the code in the driver is wrong as
>> well. In particular they often did not take VIDIOC_CREATE_BUFS into account, i.e.
>> instead of 'if (vq->num_buffers + *nbuffers < 3)' they would do 'if (*nbuffers < 3)'.
> 
> Thanks, this was educational!
> 
> So. If I have a driver that has min_queued_buffers = 1, I can use VIDIOC_CREATE_BUFS to allocate a single buffer, and then capture just one buffer, right? Whereas VIDIOC_REQBUFS would give me
> (probably) three (or two, if the driver does not set min_reqbufs_allocation). Three buffers makes sense for full streaming, of course.
> 
>> When we worked on the support for more than 32 buffers we added min_reqbufs_allocation
>> to let the core take care of this. In addition, this only applies to VIDIOC_REQBUFS,
>> if you want full control over the number of allocated buffers, then use VIDIOC_CREATE_BUFS,
>> with this ioctl the number of buffers will never be more than requested, although it
>> may be less if you run out of memory.
>>
>> I really should go through all existing drivers and fix them up if they try to
>> handle this in the queue_setup function, I suspect a lot of them are quite messy.
>>
>> One thing that is missing in the V4L2 uAPI is a way to report the minimum number of
>> buffers that need to be allocated, i.e. min_queued_buffers + 1. Since if you want
> 
> Hmm, so what I wrote above is not correct? One needs min_queued_buffers + 1? Why is that?

The DMA engine always uses min_queued_buffers, so if there are only that many buffers,
then it can never return a buffer to userspace! So you need one more. That's the absolute
minimum. For smooth capture you need two more to allow time for userspace to process the
buffer.

> 
>> to use CREATE_BUFS you need that information so you know that you have to create
>> at least that number of buffers. We have the V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control,
>> but it is effectively codec specific. This probably should be clarified.
>>
>> I wonder if it wouldn't be better to add a min_num_buffers field to
>> struct v4l2_create_buffers and set it to min_queued_buffers + 1.
> 
> I think this makes sense (although I still don't get the +1).
> 
> However, based on the experiences from adding the streams features to various ioctls, let's be very careful =). The new 'min_num_buffers' can be filled with garbage by the userspace. If we define the
> 'min_num_buffers' field to be always filled by the kernel, and any value provided from the userspace to be ignored, I think it should work.

I've posted an RFC for this.

Regards,

	Hans

> 
>  Tomi
> 


