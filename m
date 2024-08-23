Return-Path: <linux-media+bounces-16634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A98095C77A
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 10:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8FEDB24F7D
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 08:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2D7143744;
	Fri, 23 Aug 2024 08:08:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D5513D881;
	Fri, 23 Aug 2024 08:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724400484; cv=none; b=uSb5PB9mtVP7fmnJKOkbyRLUMgZvoteCy4gfdrxx9YW4Q9EByBiVRObg7fs7hoMD/TUeF03FZTHlgEZ82jJ7dZFvlv5eRzPPVw5ODzf22Yrgu9LmCJHzmyuHksplSTpvd5Csc21zv11940M3HDoS4h7sFkkHTWV3xy8poDwmgUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724400484; c=relaxed/simple;
	bh=3zMP5S1k6sYRn4ns9Y0FYSgU61KWYAHwqHMqDqCzSAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hL3hyxX94AHZOAyNW0Z5js2zc2kAPCN+WW5N8wHdnU83yzQ1tZllclFth8fYmwgORwGxUA1ITzO4dXRcIZHM0Mj3/mtJ5ZZLzvgjy+5T1V092OlUd7SujbOeY/QWjbBBxmgcTXRrUdXVgMhvyYU/7nb5tHbKYHDHHC/qLmeWDTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0ADC32786;
	Fri, 23 Aug 2024 08:08:01 +0000 (UTC)
Message-ID: <8476356b-9452-40d6-8eba-a2155135cd7c@xs4all.nl>
Date: Fri, 23 Aug 2024 10:08:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 2/9] videobuf2: Add min_reqbufs_allocation field to
 vb2_queue structure
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 m.szyprowski@samsung.com, ezequiel@vanguardiasur.com.ar,
 p.zabel@pengutronix.de, nicolas@ndufresne.ca, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20240314153226.197445-1-benjamin.gaignard@collabora.com>
 <20240314153226.197445-3-benjamin.gaignard@collabora.com>
 <20240821232819.GA18600@pendragon.ideasonboard.com>
 <CAAFQd5AQTZa2epfkJnfn_6kpnaNRMzjZ=FjYjf1DM+ZxE0YkZQ@mail.gmail.com>
 <7bbb62e8-8df8-4167-bb00-a0deedf3eedd@xs4all.nl>
 <20240822122033.GA11152@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240822122033.GA11152@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/08/2024 14:20, Laurent Pinchart wrote:
> Hello,
> 
> On Thu, Aug 22, 2024 at 08:11:17AM +0200, Hans Verkuil wrote:
>> On 22/08/2024 03:29, Tomasz Figa wrote:
>>> On Thu, Aug 22, 2024 at 8:28 AM Laurent Pinchart wrote:
>>>> On Thu, Mar 14, 2024 at 04:32:19PM +0100, Benjamin Gaignard wrote:
>>>>> Add 'min_reqbufs_allocation' field in the vb2_queue structure so drivers
>>>>> can specify the minimum number of buffers to allocate when calling
>>>>> VIDIOC_REQBUFS.
>>>>> When initializing the queue, v4l2 core makes sure that the following
>>>>> constraints are respected:
>>>>> - the minimum number of buffers to allocate must be at least 2 because
>>>>> one buffer is used by the hardware while the other is being processed
>>>>> by userspace.
>>>>
>>>> This breaks userspace for the Renesas vsp1 driver :-( Unit tests fail,
>>>> as some of them rely on operation with a single buffer.
>>>>
>>>> The vsp1 is a memory-to-memory processing engine, so operating with a
>>>> single buffer is fine in some use cases. I would argue that for live
>>>> capture devices there are valid use cases to operate with a single
>>>> buffer too. Changing this by default will break use cases.
>>>>
>>>> How can we relax this check ? Should I simply submit a patch that lowers
>>>> the minimum to one buffer ?
>>>>
>>>
>>> Uhm, I didn't notice this when reading this series. (Actually if I
>>> recall correctly, originally it didn't have this restriction.)
>>>
>>> Indeed, I don't see what's wrong with just having 1 buffer. If
>>> performance is not a concern, it's okay to just serialize the
>>> operation on 1 buffer.
>>>
>>> If you would be so nice to send it, I think a patch that changes
>>> min_reqbufs_allocation to max(max(1, min_reqbufs_allocation),
>>> min_queued_buffers)) would be good.
>>>
>>> That said, Benjamin, Hans, are we missing something by any chance? :)
>>
>> See my proposal below:
>>
>>>>> -if the driver needs 'min_queued_buffers' in the queue before calling
>>>>> start_streaming(), then the minimum requirement is 'min_queued_buffers + 1'
>>>>> to keep at least one buffer available for userspace.
>>>>>
>>>>> Simplify __vb2_init_fileio() by using 'min_reqbufs_allocation' directly
>>>>> to avoid duplicating the minimum number of buffers to allocate computation.
>>>>>
>>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>>>> ---
>>>>>  .../media/common/videobuf2/videobuf2-core.c   | 38 +++++++++++--------
>>>>>  include/media/videobuf2-core.h                | 15 +++++++-
>>>>>  2 files changed, 37 insertions(+), 16 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>>>>> index d8b3c04cb3b5..58c495b253ce 100644
>>>>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>>>>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>>>>> @@ -866,7 +866,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>>>>>       /*
>>>>>        * Make sure the requested values and current defaults are sane.
>>>>>        */
>>>>> -     num_buffers = max_t(unsigned int, *count, q->min_queued_buffers);
>>>>> +     num_buffers = max_t(unsigned int, *count, q->min_reqbufs_allocation);
>>>>>       num_buffers = min_t(unsigned int, num_buffers, q->max_num_buffers);
>>>>>       memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
>>>>>       /*
>>>>> @@ -918,7 +918,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>>>>>        * There is no point in continuing if we can't allocate the minimum
>>>>>        * number of buffers needed by this vb2_queue.
>>>>>        */
>>>>> -     if (allocated_buffers < q->min_queued_buffers)
>>>>> +     if (allocated_buffers < q->min_reqbufs_allocation)
>>>>>               ret = -ENOMEM;
>>>>>
>>>>>       /*
>>>>> @@ -2524,6 +2524,25 @@ int vb2_core_queue_init(struct vb2_queue *q)
>>>>>       if (WARN_ON(q->supports_requests && q->min_queued_buffers))
>>>>>               return -EINVAL;
>>>>>
>>>>> +     /*
>>>>> +      * The minimum requirement is 2: one buffer is used
>>>>> +      * by the hardware while the other is being processed by userspace.
>>>>> +      */
>>>>> +     if (q->min_reqbufs_allocation < 2)
>>
>> This should be:
>>
>> 	if (!q->min_reqbufs_allocation)
>>
>>>>> +             q->min_reqbufs_allocation = 2;
>>
>> and vsp1 should set q->min_reqbufs_allocation to 1.
> 
> That would work to fix the issue with vsp1, but I don't think it's
> enough. See below.
> 
>>>>> +
>>>>> +     /*
>>>>> +      * If the driver needs 'min_queued_buffers' in the queue before
>>>>> +      * calling start_streaming() then the minimum requirement is
>>>>> +      * 'min_queued_buffers + 1' to keep at least one buffer available
>>>>> +      * for userspace.
>>>>> +      */
>>>>> +     if (q->min_reqbufs_allocation < q->min_queued_buffers + 1)
>>>>> +             q->min_reqbufs_allocation = q->min_queued_buffers + 1;
>>
>> The reasoning behind all this is that VIDIOC_REBUFS is expected to allocate
>> a sane (i.e. workable and efficient) number of buffers.
>>
>> So if the DMA engine requires at least X buffers queued, then the minimum
>> reqbufs allocation is at least q->min_queued_buffers + 1, otherwise you
>> would never be able to get a buffer back.
>>
>> That's also why q->min_reqbufs_allocation was set to a minimum of 2: one
>> buffer in flight, one buffer processed by userspace. That made the queue_setup
>> call simpler for quite a few drivers that manually set the buffer count to 2.
>> For most drivers, allocating 2 buffers makes perfect sense.
> 
> For devices that can absolutely not work with less than two buffers,
> setting the minimum to 2 is fine. That is however not the majority use
> case, and that's why setting the default in the vb2 core, overriding all
> the drivers that haven't been patched, doesn't sound like a good idea to
> me.
> 
> Generally speaking, 2 is in many cases too low. In the common use case
> of capture and display, you will need a minimum of 3 buffers. Use cases
> are the responsibility of userspace, we shouldn't try to be too smart
> here.
> 
> I actually want to lower the number of buffers and require camera
> drivers to support operating with a single buffer as a general rule.
> Drivers that hold on the last buffer until a new one is provided are
> very painful to use, they're causing issues with libcamera.

I thought about it some more, and I agree with you. So just post a patch
to drop that 'if (q->min_reqbufs_allocation < 2)' bit.

Regards,

	Hans

> 
>> But if a driver sets q->min_reqbufs_allocation explicitly to 1, then that
>> should be honored, and my proposed change above will do that.
>>
>> Laurent, if you agree with this, just post patches for this.
>>
>>>>> +
>>>>> +     if (WARN_ON(q->min_reqbufs_allocation > q->max_num_buffers))
>>>>> +             return -EINVAL;
>>>>> +
>>>>>       INIT_LIST_HEAD(&q->queued_list);
>>>>>       INIT_LIST_HEAD(&q->done_list);
>>>>>       spin_lock_init(&q->done_lock);
>>>>> @@ -2717,7 +2736,6 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>>>>>       struct vb2_fileio_data *fileio;
>>>>>       struct vb2_buffer *vb;
>>>>>       int i, ret;
>>>>> -     unsigned int count = 0;
>>>>>
>>>>>       /*
>>>>>        * Sanity check
>>>>> @@ -2738,18 +2756,8 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>>>>>       if (q->streaming || vb2_get_num_buffers(q) > 0)
>>>>>               return -EBUSY;
>>>>>
>>>>> -     /*
>>>>> -      * Start with q->min_queued_buffers + 1, driver can increase it in
>>>>> -      * queue_setup()
>>>>> -      *
>>>>> -      * 'min_queued_buffers' buffers need to be queued up before you
>>>>> -      * can start streaming, plus 1 for userspace (or in this case,
>>>>> -      * kernelspace) processing.
>>>>> -      */
>>>>> -     count = max(2, q->min_queued_buffers + 1);
>>>>> -
>>>>>       dprintk(q, 3, "setting up file io: mode %s, count %d, read_once %d, write_immediately %d\n",
>>>>> -             (read) ? "read" : "write", count, q->fileio_read_once,
>>>>> +             (read) ? "read" : "write", q->min_reqbufs_allocation, q->fileio_read_once,
>>>>>               q->fileio_write_immediately);
>>>>>
>>>>>       fileio = kzalloc(sizeof(*fileio), GFP_KERNEL);
>>>>> @@ -2763,7 +2771,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>>>>>        * Request buffers and use MMAP type to force driver
>>>>>        * to allocate buffers by itself.
>>>>>        */
>>>>> -     fileio->count = count;
>>>>> +     fileio->count = q->min_reqbufs_allocation;
>>>>>       fileio->memory = VB2_MEMORY_MMAP;
>>>>>       fileio->type = q->type;
>>>>>       q->fileio = fileio;
>>>>> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
>>>>> index 667bf9ee1101..4a8b9135cec8 100644
>>>>> --- a/include/media/videobuf2-core.h
>>>>> +++ b/include/media/videobuf2-core.h
>>>>> @@ -549,9 +549,21 @@ struct vb2_buf_ops {
>>>>>   *           @start_streaming can be called. Used when a DMA engine
>>>>>   *           cannot be started unless at least this number of buffers
>>>>>   *           have been queued into the driver.
>>>>> - *           VIDIOC_REQBUFS will ensure at least @min_queued_buffers
>>>>> + *           VIDIOC_REQBUFS will ensure at least @min_queued_buffers + 1
>>>>>   *           buffers will be allocated. Note that VIDIOC_CREATE_BUFS will not
>>>>>   *           modify the requested buffer count.
>>>>> + * @min_reqbufs_allocation: the minimum number of buffers to be allocated when
>>>>> + *           calling VIDIOC_REQBUFS. Note that VIDIOC_CREATE_BUFS will *not*
>>>>> + *           modify the requested buffer count and does not use this field.
>>>>> + *           Drivers can set this if there has to be a certain number of
>>>>> + *           buffers available for the hardware to work effectively.
>>>>> + *           This allows calling VIDIOC_REQBUFS with a buffer count of 1 and
>>>>> + *           it will be automatically adjusted to a workable buffer count.
>>>>> + *           If set, then @min_reqbufs_allocation must be larger than
>>>>> + *           @min_queued_buffers + 1.
>>>>> + *           If this field is > 3, then it is highly recommended that the
>>>>> + *           driver implements the V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
>>>>> + *           control.
>>>>>   * @alloc_devs:      &struct device memory type/allocator-specific per-plane device
>>>>>   */
>>>>>  /*
>>>>> @@ -622,6 +634,7 @@ struct vb2_queue {
>>>>>       u32                             timestamp_flags;
>>>>>       gfp_t                           gfp_flags;
>>>>>       u32                             min_queued_buffers;
>>>>> +     u32                             min_reqbufs_allocation;
>>>>>
>>>>>       struct device                   *alloc_devs[VB2_MAX_PLANES];
>>>>>
> 


